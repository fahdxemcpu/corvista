import 'dart:typed_data';

import 'package:corvista/features/emergency/impact_detector.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/motion_fixtures.dart';

void main() {
  group('ImpactDetector', () {
    test('normal driving does not trigger', () {
      expect(
        MotionFixtures.normalDriving().runThrough(ImpactDetector()),
        isEmpty,
      );
    });

    test('pothole (short jolt) does not trigger', () {
      expect(MotionFixtures.pothole().runThrough(ImpactDetector()), isEmpty);
    });

    test('phone drop is rejected via free-fall signature', () {
      final d = ImpactDetector();
      expect(MotionFixtures.phoneDrop().runThrough(d), isEmpty);
      expect(d.droppedAsFreeFall, greaterThan(0));
    });

    test('hard braking without impact does not trigger', () {
      expect(
        MotionFixtures.hardBraking().runThrough(ImpactDetector()),
        isEmpty,
      );
    });

    test('severe impact with speed drop triggers once', () {
      final ev = MotionFixtures.severeImpact().runThrough(ImpactDetector());
      expect(ev, hasLength(1));
      final e = ev.single;
      expect(e.peakG, greaterThan(10));
      expect(e.speedBeforeKmh, closeTo(55, 0.5));
      expect(e.speedAfterKmh, 0);
      expect(e.score, inInclusiveRange(0.5, 1.0));
    });

    test('rollover rotation triggers without GPS speed', () {
      final ev = MotionFixtures.rollover().runThrough(ImpactDetector());
      expect(ev, hasLength(1));
      expect(ev.single.rotationPeak, greaterThanOrEqualTo(6));
      expect(ev.single.speedBeforeKmh, isNull);
    });

    test('impact without speed drop or rotation is not corroborated', () {
      final b = MotionTraceBuilder()
        ..driving(3000)
        ..pulse(80, 9)
        ..driving(12000);
      final s = MotionScenario(
        name: 'bump_at_speed',
        batches: b.batches(),
        speeds: [for (var t = 0.0; t <= 15000; t += 1000) (t, 60 / 3.6)],
      );
      expect(s.runThrough(ImpactDetector()), isEmpty);
    });

    test('cooldown prevents duplicate triggers', () {
      final d = ImpactDetector();
      final first = MotionFixtures.severeImpact().runThrough(d);
      final second = MotionScenario.severeImpact(startMs: 13000).runThrough(d);
      expect(first, hasLength(1));
      expect(second, isEmpty);
    });

    test('evidence JSON round-trips', () {
      const e = ImpactEvidence(
        peakG: 9,
        durationMs: 50,
        speedBeforeKmh: 60,
        speedAfterKmh: 0,
        rotationPeak: 2,
        score: 0.8,
      );
      final r = ImpactEvidence.fromJson(e.toJson());
      expect(r.peakG, 9);
      expect(r.speedAfterKmh, 0);
      expect(r.score, 0.8);
    });

    test('builder batches are ~200 ms of 7-value records', () {
      final b = MotionTraceBuilder()..driving(1000);
      final batches = b.batches();
      expect(batches, hasLength(5));
      expect(batches.first.length, 20 * 7);
      expect(batches.first, isA<Float64List>());
    });
  });
}
