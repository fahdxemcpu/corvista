import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

import '../../../core/animations/motion.dart';
import '../../../domain/models/object_class.dart';
import '../../../domain/models/tracked_object.dart';
import '../../detection/placement_filter.dart';

/// Proximity emphasis for a zone: 1 = very close, 0.5 = close, else 0.
double sceneAlert(ProximityZone z) => switch (z) {
  ProximityZone.veryClose => 1.0,
  ProximityZone.close => .5,
  _ => 0.0,
};

/// One object as currently drawn.
class SceneItem {
  SceneItem(PlacedObject p, this.opacity)
    : id = p.id,
      cls = p.cls,
      light = p.light,
      x = p.displayX,
      depth = p.distanceM,
      alert = sceneAlert(p.zone),
      target = p;

  final int id;
  final ObjectClass cls;
  LightState light;
  PlacedObject target;

  /// Displayed lateral position / forward distance (m).
  double x, depth;

  /// Smoothed proximity emphasis 0..1.
  double alert;

  /// 0..1 presence.
  double opacity;
  bool removed = false;
}

/// Frame-rate independent display interpolation between placement updates
/// (which arrive at the detector rate). New objects appear at their placed
/// position and only fade in; unseen / removed objects stay where they were
/// and fade out — nothing slides in from a default position.
class SceneSmoother {
  SceneSmoother({this.tau = .12, this.fadeS = .25});

  final double tau;
  final double fadeS;
  final Map<int, SceneItem> _items = {};
  bool snap = false;

  List<SceneItem> get items =>
      _items.values.where((i) => i.opacity > .01).toList(growable: false);

  void setTargets(List<PlacedObject> objects) {
    final seen = <int>{};
    for (final p in objects) {
      seen.add(p.id);
      final cur = _items[p.id];
      if (cur == null) {
        _items[p.id] = SceneItem(p, snap && !p.lost ? 1 : 0);
      } else {
        cur
          ..target = p
          ..light = p.light
          ..removed = false;
      }
    }
    for (final e in _items.entries) {
      if (!seen.contains(e.key)) e.value.removed = true;
    }
  }

  /// Advances [dt] seconds; returns true while anything still changes.
  /// Lost objects fade out where they are; removed ones are then dropped.
  bool tick(double dt) {
    final a = snap ? 1.0 : smoothingAlpha(dt, tau: tau);
    final aa = snap ? 1.0 : smoothingAlpha(dt, tau: .3);
    final fade = snap ? 1.0 : dt / fadeS;
    var moving = false;
    final dead = <int>[];
    for (final e in _items.entries) {
      final s = e.value;
      final p = s.target;
      final hold = s.removed || p.lost;
      if (!hold) {
        final nx = s.x + (p.displayX - s.x) * a;
        final nd = s.depth + (p.distanceM - s.depth) * a;
        if ((nx - p.displayX).abs() > .01 || (nd - p.distanceM).abs() > .01) {
          moving = true;
        }
        s
          ..x = nx
          ..depth = nd;
      }
      final at = sceneAlert(p.zone);
      s.alert += (at - s.alert) * aa;
      if ((s.alert - at).abs() > .01) moving = true;
      final to = s.removed || p.lost ? 0.0 : 1.0;
      if ((s.opacity - to).abs() > .001) {
        moving = true;
        s.opacity = s.opacity < to
            ? (s.opacity + fade).clamp(0.0, to)
            : (s.opacity - fade).clamp(to, 1.0);
      }
      if (s.removed && s.opacity <= .01) dead.add(e.key);
    }
    dead.forEach(_items.remove);
    return moving;
  }
}

/// Owns a [SceneSmoother] + ticker; [builder] gets a repaint listenable.
class SceneSmootherScope extends StatefulWidget {
  const SceneSmootherScope({
    super.key,
    required this.objects,
    required this.builder,
    this.reduceMotion = false,
  });

  final List<PlacedObject> objects;
  final bool reduceMotion;
  final Widget Function(
    BuildContext context,
    SceneSmoother smoother,
    Listenable repaint,
  )
  builder;

  @override
  State<SceneSmootherScope> createState() => _SceneSmootherScopeState();
}

class _SceneSmootherScopeState extends State<SceneSmootherScope>
    with SingleTickerProviderStateMixin {
  final _smoother = SceneSmoother();
  final _repaint = _Notifier();
  late final Ticker _ticker = createTicker(_onTick);
  Duration _last = Duration.zero;

  void _syncSnap() => _smoother.snap = !Motion.enabled(
    context,
    appReduceMotion: widget.reduceMotion,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncSnap();
    _push();
  }

  @override
  void didUpdateWidget(SceneSmootherScope old) {
    super.didUpdateWidget(old);
    _syncSnap();
    if (!identical(old.objects, widget.objects)) _push();
  }

  void _push() {
    _smoother.setTargets(widget.objects);
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
    final moving = _smoother.tick(dt.clamp(0.0, .1));
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
