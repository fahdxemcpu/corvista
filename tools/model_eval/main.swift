// Corvista model evaluation (macOS). Runs Core ML detectors (and the DETR segmenter)
// through Vision on real road photos using the SAME post-processing sources the iOS
// plugin ships (compiled in by run_eval.sh). Writes a Markdown report and, optionally,
// a JSON dump of all detections (used by tools/model_eval/render_boxes.py).
//
// Usage: tools/model_eval/run_eval.sh [options]   (see docs/MODELS.md)
//   --detectors "spec,spec,..."  spec = <name or path>[=<Title>]. A bare name resolves to
//                                <models>/<name>.mlmodelc. Default: the catalog's detectors
//                                (run_eval.sh also adds the legacy YOLOv3 models).
//   --no-seg                     skip the DETR segmenter
//   --no-letterbox               skip the letterbox comparison
//   --cpu-all                    also time every detector with computeUnits = cpuOnly
//                                (default: only the first detector)
//   --json <path>                write all detections as JSON
//   --runs N                     timed runs per image (default 10)
//   --dump-maps <dir>            write each image's raw 224×224 DETR class map
//                                (<stem>.classmap, row-major UInt8, BRIDGE.md values) and
//                                <stem>.json (size + first detector's detections) — used for
//                                the Flutter segmentation fixtures in test/fixtures/segmentation/

import CoreGraphics
import CoreImage
import CoreML
import CoreVideo
import Foundation
import Vision

let args = CommandLine.arguments
func arg(_ name: String, _ def: String) -> String {
  if let i = args.firstIndex(of: name), i + 1 < args.count { return args[i + 1] }
  return def
}
func flag(_ name: String) -> Bool { args.contains(name) }
let modelsDir = URL(fileURLWithPath: arg("--models", "packages/corvista_native/ios/corvista_native/Sources/corvista_native/Resources/Models"))
let imagesDir = URL(fileURLWithPath: arg("--images", "tools/model_eval/images"))
let outPath = arg("--out", "tools/model_eval/results.md")
let jsonPath = arg("--json", "")
let timedRuns = Int(arg("--runs", "10")) ?? 10
let runSeg = !flag("--no-seg")
let runLetterbox = !flag("--no-letterbox")
let cpuAll = flag("--cpu-all")
let dumpMapsDir = arg("--dump-maps", "")
let confidence = 0.35, iou = 0.45

/// Report titles for the bundled (neutrally named) detector files; provenance is in docs/MODELS.md.
let evalTitle: [String: String] = [
  "cv_detect_x": "YOLOX-S 640", "cv_detect_xl": "YOLOX-M 640 pal8",
  "cv_detect_s": "YOLOv3-Tiny (legacy)", "cv_detect_l": "YOLOv3 (legacy)",
]

/// Default detector list: every distinct detector file in the catalog, in catalog order.
let defaultDetectors: String = {
  var seen: [String] = []
  for d in ModelCatalog.all { if let f = d.detectorFile, !seen.contains(f) { seen.append(f) } }
  return seen.map { "\($0)=\(evalTitle[$0] ?? $0)" }.joined(separator: ",")
}()

struct DetSpec { let url: URL; let title: String; let key: String }
let detSpecs: [DetSpec] = arg("--detectors", defaultDetectors).split(separator: ",").map { raw in
  let parts = raw.split(separator: "=", maxSplits: 1).map(String.init)
  let ref = parts[0].trimmingCharacters(in: .whitespaces)
  let url = ref.contains("/") ? URL(fileURLWithPath: ref) : modelsDir.appendingPathComponent("\(ref).mlmodelc")
  let key = url.deletingPathExtension().lastPathComponent
  return DetSpec(url: url, title: parts.count > 1 ? parts[1] : key, key: key)
}

func model(_ name: String) -> URL { modelsDir.appendingPathComponent("\(name).mlmodelc") }
func now() -> Double { CFAbsoluteTimeGetCurrent() * 1000 }
func median(_ a: [Double]) -> Double { let s = a.sorted(); return s.isEmpty ? 0 : s[s.count / 2] }
func p95(_ a: [Double]) -> Double { let s = a.sorted(); return s.isEmpty ? 0 : s[min(s.count - 1, Int(Double(s.count) * 0.95))] }
func f(_ v: Double, _ d: Int = 2) -> String { String(format: "%.\(d)f", v) }
let classKeys = CorvistaClass.allCases.map(\.key)

/// Letterbox an image into a square buffer (grey padding) for the comparison run.
func letterbox(_ src: CVPixelBuffer) throws -> (CVPixelBuffer, CGRect) {
  let w = CVPixelBufferGetWidth(src), h = CVPixelBufferGetHeight(src)
  let side = max(w, h)
  let ci = CIImage(cvPixelBuffer: src)
  let ox = Double(side - w) / 2, oy = Double(side - h) / 2
  let bg = CIImage(color: CIColor(red: 0.5, green: 0.5, blue: 0.5)).cropped(to: CGRect(x: 0, y: 0, width: side, height: side))
  let img = ci.transformed(by: CGAffineTransform(translationX: ox, y: oy)).composited(over: bg)
  let ctx = CIContext()
  guard let cg = ctx.createCGImage(img, from: CGRect(x: 0, y: 0, width: side, height: side)) else { throw InferenceError.badImage("letterbox") }
  // Content rect in normalized top-left coordinates of the square.
  return (try PixelBufferUtil.makeBGRA(from: cg), CGRect(x: ox / Double(side), y: oy / Double(side), width: Double(w) / Double(side), height: Double(h) / Double(side)))
}

func unletterbox(_ d: [Detection], _ r: CGRect) -> [Detection] {
  d.compactMap { o in
    var o = o
    o.x = (o.x - r.minX) / r.width; o.y = (o.y - r.minY) / r.height
    o.w /= r.width; o.h /= r.height
    let x0 = clamp01(o.x), y0 = clamp01(o.y), x1 = clamp01(o.x + o.w), y1 = clamp01(o.y + o.h)
    guard x1 > x0, y1 > y0 else { return nil }
    o.x = x0; o.y = y0; o.w = x1 - x0; o.h = y1 - y0
    return o
  }
}

func inputSize(_ m: MLModel?) -> String {
  guard let c = m?.modelDescription.inputDescriptionsByName["image"]?.imageConstraint else { return "?" }
  return "\(c.pixelsWide)×\(c.pixelsHigh)"
}

// Sequence mode: per-frame detections of an extracted video (frames sorted by name, sampled
// at --fps) with the FIRST detector only, written as a compact JSON fixture whose frames
// parse with `DetectionFrame.fromMap` (see test/fixtures/parking_sequences/README.md).
//   --sequence <frames dir> --seq-out <file.json> [--fps 5] [--seq-name <name>] [--seq-conf 0.35]
let sequenceDir = arg("--sequence", "")
if !sequenceDir.isEmpty {
  let seqOut = arg("--seq-out", "sequence.json")
  let fps = Double(arg("--fps", "5")) ?? 5
  let seqConf = Double(arg("--seq-conf", String(confidence))) ?? confidence
  let frames = ((try? FileManager.default.contentsOfDirectory(atPath: sequenceDir)) ?? [])
    .filter { ["jpg", "jpeg", "png"].contains(($0 as NSString).pathExtension.lowercased()) }.sorted()
  guard !frames.isEmpty, let spec = detSpecs.first else { print("no frames in \(sequenceDir)"); exit(1) }
  func r4(_ v: Double) -> Double { (v * 10_000).rounded() / 10_000 }
  do {
    let runner = try DetectorRunner(url: spec.url, name: spec.key, computeUnits: .all)
    var out: [[String: Any]] = []
    var size = (0, 0)
    for (i, name) in frames.enumerated() {
      let pb = try PixelBufferUtil.loadBGRA(path: (sequenceDir as NSString).appendingPathComponent(name), maxDimension: 4096)
      size = (CVPixelBufferGetWidth(pb), CVPixelBufferGetHeight(pb))
      let t0 = now()
      let ds = try runner.detect(pixelBuffer: pb, confidence: seqConf, iou: iou, classifyLights: false)
      let ms = now() - t0
      out.append([
        "t": r4(Double(i) / fps), "frame": name, "inferenceMs": (ms * 10).rounded() / 10,
        "objects": ds.map { ["cls": $0.cls, "conf": r4($0.conf), "x": r4($0.x), "y": r4($0.y), "w": r4($0.w), "h": r4($0.h)] as [String: Any] },
      ])
    }
    let doc: [String: Any] = [
      "name": arg("--seq-name", (sequenceDir as NSString).lastPathComponent), "model": spec.title,
      "fps": fps, "width": size.0, "height": size.1, "confidence": seqConf, "iou": iou,
      "classes": classKeys, "frames": out,
    ]
    let data = try JSONSerialization.data(withJSONObject: doc, options: [.sortedKeys])
    try data.write(to: URL(fileURLWithPath: seqOut))
    print("wrote \(seqOut) (\(frames.count) frames, \(spec.title))")
    exit(0)
  } catch {
    print("sequence failed: \(error)")
    exit(2)
  }
}

var md = "# Corvista model evaluation results (Mac)\n\n"
var host = utsname(); uname(&host)
let machine = withUnsafePointer(to: &host.machine) { $0.withMemoryRebound(to: CChar.self, capacity: 256) { String(cString: $0) } }
let hw: String = {
  var size = 0; sysctlbyname("machdep.cpu.brand_string", nil, &size, nil, 0)
  var buf = [CChar](repeating: 0, count: max(size, 1)); sysctlbyname("machdep.cpu.brand_string", &buf, &size, nil, 0)
  return String(cString: buf)
}()
md += "- Generated: \(ISO8601DateFormatter().string(from: Date()))\n"
md += "- Host: **\(hw) (\(machine)), macOS \(ProcessInfo.processInfo.operatingSystemVersionString)** — these are Mac numbers, NOT iPhone numbers.\n"
md += "- Detector thresholds: confidence ≥ \(confidence), NMS IoU \(iou) (passed via `VNCoreMLModel.featureProvider`, also filtered in code).\n"
md += "- Timing: median / p95 of \(timedRuns) runs after 1 warm-up, wall clock around `VNImageRequestHandler.perform` (includes Vision scaling).\n"
md += "- Post-processing: `DetectionPipeline.swift`, `SegmenterRunner.swift`, `TrafficLightClassifier.swift` from the plugin sources.\n\n"

let images = ((try? FileManager.default.contentsOfDirectory(at: imagesDir, includingPropertiesForKeys: nil)) ?? [])
  .filter { ["jpg", "jpeg", "png"].contains($0.pathExtension.lowercased()) }
  .sorted { $0.lastPathComponent < $1.lastPathComponent }
guard !images.isEmpty else { print("no images in \(imagesDir.path)"); exit(1) }

do {
  var loadRows: [(String, Double, String, Int64)] = []
  var runners: [DetectorRunner] = []
  var cpuRunners: [DetectorRunner?] = []
  for (i, s) in detSpecs.enumerated() {
    let t0 = now()
    let r = try DetectorRunner(url: s.url, name: s.key, computeUnits: .all)
    loadRows.append((s.title, now() - t0, inputSize(r.mlModel), ModelCatalog.directorySize(s.url)))
    runners.append(r)
    cpuRunners.append(i == 0 || cpuAll ? try DetectorRunner(url: s.url, name: s.key + "-cpu", computeUnits: .cpuOnly) : nil)
  }
  var seg: SegmenterRunner?
  var tSeg = 0.0
  if runSeg {
    let t2 = now()
    seg = try SegmenterRunner(url: model(ModelCatalog.detr), computeUnits: .all)
    tSeg = now() - t2
  }

  md += "## Models (computeUnits = all, first load includes ANE/GPU compilation)\n\n"
  md += "| model | file | input | compiled size MB | load ms |\n|---|---|---|---|---|\n"
  for (s, row) in zip(detSpecs, loadRows) {
    md += "| \(row.0) | \(s.key) | \(row.2) | \(f(Double(row.3) / 1_048_576, 1)) | \(f(row.1, 0)) |\n"
  }
  if let seg {
    md += "| DETR ResNet-50 seg | \(ModelCatalog.detr) | 448×448 | \(f(Double(ModelCatalog.directorySize(model(ModelCatalog.detr))) / 1_048_576, 1)) | \(f(tSeg, 0)) |\n\n"
    md += "DETR label table check against model metadata: **\(seg.labelMismatch ?? "OK — indices 1,2,3,4,6,8,10,13,149,191 match")**\n\n"
  } else { md += "\n" }

  var timing: [String: [Double]] = [:]
  struct Row { let name: String; let counts: [[String: Int]]; let road: Double?; let lb: [Int] }
  var summary: [Row] = []
  var detail = "## Per-image results\n\n"
  var jsonImages: [[String: Any]] = []

  for url in images {
    let name = url.lastPathComponent
    let pb = try PixelBufferUtil.loadBGRA(path: url.path, maxDimension: 4096)
    let W = CVPixelBufferGetWidth(pb), H = CVPixelBufferGetHeight(pb)
    detail += "### \(name) (\(W)×\(H))\n\n"

    func timed(_ key: String, _ body: () throws -> Void) rethrows -> Double {
      try body() // warm-up
      var ts: [Double] = []
      for _ in 0..<timedRuns { let s = now(); try body(); ts.append(now() - s) }
      timing[key, default: []] += ts
      return median(ts)
    }

    func table(_ title: String, _ ds: [Detection], _ ms: Double) -> String {
      var s = "**\(title)** — \(f(ms, 1)) ms, \(ds.count) objects\n\n"
      if ds.isEmpty { return s + "_none_\n\n" }
      s += "| class (COCO) | conf | x | y | w | h | light |\n|---|---|---|---|---|---|---|\n"
      for d in ds.sorted(by: { $0.conf > $1.conf }) {
        let light = d.light.map { "\($0) (\(f(d.lightConf ?? 0)))" } ?? ""
        s += "| \(classKeys[d.cls]) (\(d.label)) | \(f(d.conf)) | \(f(d.x, 3)) | \(f(d.y, 3)) | \(f(d.w, 3)) | \(f(d.h, 3)) | \(light) |\n"
      }
      return s + "\n"
    }
    func counts(_ ds: [Detection]) -> [String: Int] { ds.reduce(into: [:]) { $0[classKeys[$1.cls], default: 0] += 1 } }

    var allCounts: [[String: Int]] = []
    var lbCounts: [Int] = []
    var jsonDets: [String: Any] = [:]
    let lbPair = runLetterbox ? try letterbox(pb) : nil
    for (i, (s, r)) in zip(detSpecs, runners).enumerated() {
      var ds: [Detection] = []
      let ms = try timed(s.key) { ds = try r.detect(pixelBuffer: pb, confidence: confidence, iou: iou) }
      detail += table("\(s.title)", ds, ms)
      if let c = cpuRunners[i] {
        let msCPU = try timed(s.key + "-cpu") { _ = try c.detect(pixelBuffer: pb, confidence: confidence, iou: iou, classifyLights: false) }
        detail += "(\(s.title) cpuOnly: \(f(msCPU, 1)) ms)\n\n"
      }
      allCounts.append(counts(ds))
      if let (lb, rect) = lbPair {
        lbCounts.append(unletterbox(try r.detect(pixelBuffer: lb, confidence: confidence, iou: iou, classifyLights: false), rect).count)
      }
      jsonDets[s.title] = ds.map { d -> [String: Any] in
        var m = d.toMap(); m["key"] = classKeys[d.cls]; m["label"] = d.label; return m
      }
    }
    jsonImages.append(["image": name, "width": W, "height": H, "detections": jsonDets])

    var roadPct: Double?
    if let seg {
      var map: [UInt8] = []
      let msSeg = try timed("seg") { map = try seg.segment(pixelBuffer: pb) }
      var hist = [Int](repeating: 0, count: 9)
      for v in map where Int(v) < hist.count { hist[Int(v)] += 1 }
      let total = Double(map.count)
      let names = ["none"] + classKeys + ["road"]
      detail += "**DETR segmentation** — \(f(msSeg, 1)) ms, 224×224 class map\n\n| class | pixels % |\n|---|---|\n"
      for (i, n) in hist.enumerated() where n > 0 { detail += "| \(names[i]) | \(f(100 * Double(n) / total, 1)) |\n" }
      detail += "\n"
      roadPct = 100 * Double(hist[8]) / total
      if !dumpMapsDir.isEmpty {
        let dir = URL(fileURLWithPath: dumpMapsDir)
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        let stem = url.deletingPathExtension().lastPathComponent
        try Data(map).write(to: dir.appendingPathComponent("\(stem).classmap"))
        let side = SegmenterRunner.mapSize
        let meta: [String: Any] = [
          "image": name, "width": W, "height": H, "mapW": side, "mapH": side,
          "detector": detSpecs.first?.title ?? "",
          "detections": jsonDets[detSpecs.first?.title ?? ""] ?? [],
        ]
        let data = try JSONSerialization.data(withJSONObject: meta, options: [.prettyPrinted, .sortedKeys])
        try data.write(to: dir.appendingPathComponent("\(stem).json"))
      }
    }
    if runLetterbox {
      detail += "Letterbox comparison (objects, letterbox vs scaleFill): " + zip(detSpecs, zip(lbCounts, allCounts)).map {
        "\($0.0.title) \($0.1.0) vs \($0.1.1.values.reduce(0, +))"
      }.joined(separator: "; ") + ".\n\n"
    }
    summary.append(Row(name: name, counts: allCounts, road: roadPct, lb: lbCounts))
    print("done \(name)")
  }

  func fmt(_ c: [String: Int]) -> String { c.isEmpty ? "—" : c.sorted { $0.key < $1.key }.map { "\($0.key)×\($0.value)" }.joined(separator: ", ") }
  md += "## Summary\n\n| image | " + detSpecs.map(\.title).joined(separator: " | ")
  md += (runSeg ? " | road % (DETR)" : "") + (runLetterbox ? " | letterbox count (scaleFill)" : "") + " |\n"
  md += "|---|" + detSpecs.map { _ in "---|" }.joined() + (runSeg ? "---|" : "") + (runLetterbox ? "---|" : "") + "\n"
  for s in summary {
    md += "| \(s.name) | " + s.counts.map(fmt).joined(separator: " | ")
    if let r = s.road { md += " | \(f(r, 1))" } else if runSeg { md += " | " }
    if runLetterbox {
      md += " | " + zip(s.lb, s.counts).map { "\($0.0) (\($0.1.values.reduce(0, +)))" }.joined(separator: " / ")
    }
    md += " |\n"
  }
  // Per-class totals across all images.
  md += "\n## Detections per class, all images (confidence ≥ \(confidence); counts, not verified hits)\n\n| class | "
  md += detSpecs.map(\.title).joined(separator: " | ") + " |\n|---|" + detSpecs.map { _ in "---|" }.joined() + "\n"
  for k in classKeys {
    md += "| \(k) | " + detSpecs.indices.map { i in String(summary.reduce(0) { $0 + ($1.counts[i][k] ?? 0) }) }.joined(separator: " | ") + " |\n"
  }
  md += "\n## Timing across all images (Mac, ms)\n\n| model | compute units | median | p95 |\n|---|---|---|---|\n"
  for (i, s) in detSpecs.enumerated() {
    md += "| \(s.title) | all | \(f(median(timing[s.key] ?? []), 1)) | \(f(p95(timing[s.key] ?? []), 1)) |\n"
    if cpuRunners[i] != nil {
      md += "| \(s.title) | cpuOnly | \(f(median(timing[s.key + "-cpu"] ?? []), 1)) | \(f(p95(timing[s.key + "-cpu"] ?? []), 1)) |\n"
    }
  }
  if runSeg { md += "| DETR ResNet-50 seg | all | \(f(median(timing["seg"] ?? []), 1)) | \(f(p95(timing["seg"] ?? []), 1)) |\n" }
  md += "\n" + detail
  try md.write(toFile: outPath, atomically: true, encoding: .utf8)
  print("wrote \(outPath)")
  if !jsonPath.isEmpty {
    let data = try JSONSerialization.data(withJSONObject: ["models": detSpecs.map(\.title), "images": jsonImages], options: [.prettyPrinted, .sortedKeys])
    try data.write(to: URL(fileURLWithPath: jsonPath))
    print("wrote \(jsonPath)")
  }
} catch {
  print("eval failed: \(error)")
  exit(2)
}
