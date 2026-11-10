import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

import '../../../core/animations/motion.dart';
import '../../../domain/models/tracked_object.dart';

/// A track as currently displayed: positions are low-pass filtered toward
/// the latest tracker output so boxes glide instead of jumping, and tracks
/// fade in / out instead of flashing.
/// Representative scene depth (metres, stylized) for a qualitative zone.
/// Used only for 2.5D / top-down placement, never displayed as a number.
/// Bands match SpatialEstimator's zone thresholds (docs/ESTIMATION.md).
double zoneDepth(ProximityZone z) => switch (z) {
  ProximityZone.veryClose => 2.5,
  ProximityZone.close => 7,
  ProximityZone.medium => 17,
  ProximityZone.far => 35,
  ProximityZone.unknown => 45,
};

/// Placement depth for a track: its approximate range clamped inside its
/// zone band (so objects in the same zone keep their relative order without
/// ever being drawn outside the zone they are reported in).
double trackDepth(TrackedObject t) {
  final r = t.approxRangeM;
  if (r == null) return zoneDepth(t.zone);
  final (lo, hi) = switch (t.zone) {
    ProximityZone.veryClose => (1.0, 4.0),
    ProximityZone.close => (4.0, 10.0),
    ProximityZone.medium => (10.0, 25.0),
    ProximityZone.far => (25.0, 50.0),
    ProximityZone.unknown => (40.0, 50.0),
  };
  return r.clamp(lo, hi).toDouble();
}

/// Proximity emphasis for a zone: 1 = very close, 0.5 = close, 0 otherwise.
/// Used to ease object highlight colours between zones (never shown as a
/// number).
double zoneAlert(ProximityZone z) => switch (z) {
  ProximityZone.veryClose => 1.0,
  ProximityZone.close => 0.5,
  _ => 0.0,
};

class SmoothedTrack {
  SmoothedTrack(this.track, this.box, this.bearingDeg, this.opacity)
    : depth = trackDepth(track),
      alert = zoneAlert(track.zone);

  TrackedObject track;
  Rect box;
  double bearingDeg;

  /// Smoothed stylized depth derived from the zone (see [zoneDepth]).
  double depth;

  /// Smoothed proximity emphasis (see [zoneAlert]), eased between zones so
  /// highlight colours cross-fade instead of flashing.
  double alert;

  /// 0..1 presence (fade in on appear, fade out after removal).
  double opacity;
  bool removed = false;

  bool get isLost => track.state == TrackState.lost;
}

/// Frame-rate independent smoother for tracker output. Pure Dart; driven by a
/// ticker in [TrackSmootherScope].
class TrackSmoother {
  TrackSmoother({this.tau = 0.10, this.fadeS = 0.22});

  final double tau;
  final double fadeS;
  final Map<int, SmoothedTrack> _items = {};
  bool snap = false;

  List<SmoothedTrack> get items =>
      _items.values.where((t) => t.opacity > 0.01).toList(growable: false);

  bool get idle => _items.isEmpty;

  void setTargets(List<TrackedObject> tracks) {
    final seen = <int>{};
    for (final t in tracks) {
      if (t.state == TrackState.tentative) continue;
      seen.add(t.id);
      final cur = _items[t.id];
      if (cur == null) {
        _items[t.id] = SmoothedTrack(t, t.box, t.bearingDeg, snap ? 1 : 0);
      } else {
        cur
          ..track = t
          ..removed = false;
      }
    }
    for (final e in _items.entries) {
      if (!seen.contains(e.key)) e.value.removed = true;
    }
  }

  /// Advances by [dt] seconds. Returns true while anything is still moving.
  bool tick(double dt) {
    final a = snap ? 1.0 : smoothingAlpha(dt, tau: tau);
    final fade = snap ? 1.0 : (dt / fadeS);
    var moving = false;
    final dead = <int>[];
    for (final e in _items.entries) {
      final s = e.value;
      final target = s.track.box;
      final nb = Rect.lerp(s.box, target, a)!;
      if ((nb.center - target.center).distance > 0.0005 ||
          (nb.width - target.width).abs() > 0.0005) {
        moving = true;
      }
      s.box = nb;
      s.bearingDeg += (s.track.bearingDeg - s.bearingDeg) * a;
      final dTarget = trackDepth(s.track);
      // Zones change in steps; glide more slowly between them.
      s.depth +=
          (dTarget - s.depth) * (snap ? 1.0 : smoothingAlpha(dt, tau: tau * 3));
      if ((s.depth - dTarget).abs() > 0.05) moving = true;
      final aTarget = zoneAlert(s.track.zone);
      s.alert +=
          (aTarget - s.alert) * (snap ? 1.0 : smoothingAlpha(dt, tau: .25));
      if ((s.alert - aTarget).abs() > 0.01) moving = true;
      final targetOpacity = s.removed ? 0.0 : (s.isLost ? 0.4 : 1.0);
      if ((s.opacity - targetOpacity).abs() > 0.001) {
        moving = true;
        s.opacity = s.opacity < targetOpacity
            ? (s.opacity + fade).clamp(0.0, targetOpacity)
            : (s.opacity - fade).clamp(targetOpacity, 1.0);
      }
      if (s.removed && s.opacity <= 0.01) dead.add(e.key);
    }
    dead.forEach(_items.remove);
    return moving;
  }
}

/// Owns a [TrackSmoother] + ticker, and exposes a [Listenable] that fires on
/// every smoothed frame so painters can repaint without rebuilding widgets.
class TrackSmootherScope extends StatefulWidget {
  const TrackSmootherScope({
    super.key,
    required this.tracks,
    required this.builder,
    this.reduceMotion = false,
    this.tau = 0.10,
  });

  final List<TrackedObject> tracks;
  final bool reduceMotion;
  final double tau;
  final Widget Function(
    BuildContext context,
    TrackSmoother smoother,
    Listenable repaint,
  )
  builder;

  @override
  State<TrackSmootherScope> createState() => _TrackSmootherScopeState();
}

class _TrackSmootherScopeState extends State<TrackSmootherScope>
    with SingleTickerProviderStateMixin {
  late final TrackSmoother _smoother = TrackSmoother(tau: widget.tau);
  final _repaint = _Notifier();
  late final Ticker _ticker = createTicker(_onTick);
  Duration _last = Duration.zero;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _smoother.snap = !Motion.enabled(
      context,
      appReduceMotion: widget.reduceMotion,
    );
    _push();
  }

  @override
  void didUpdateWidget(TrackSmootherScope old) {
    super.didUpdateWidget(old);
    _smoother.snap = !Motion.enabled(
      context,
      appReduceMotion: widget.reduceMotion,
    );
    if (!identical(old.tracks, widget.tracks)) _push();
  }

  void _push() {
    _smoother.setTargets(widget.tracks);
    if (_smoother.snap) {
      _smoother.tick(1);
      _repaint.ping();
    } else if (!_ticker.isActive) {
      _last = Duration.zero;
      _ticker.start();
    }
  }

  void _onTick(Duration elapsed) {
    final dt = _last == Duration.zero
        ? 1 / 60
        : (elapsed - _last).inMicroseconds / 1e6;
    _last = elapsed;
    final moving = _smoother.tick(dt.clamp(0.0, 0.1));
    _repaint.ping();
    if (!moving) _ticker.stop();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _repaint.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, _smoother, _repaint);
}

class _Notifier extends ChangeNotifier {
  void ping() => notifyListeners();
}
