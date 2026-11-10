import 'dart:math' as math;

/// What the driver has to do at a route step, derived from route geometry
/// (see [ManeuverClassifier]).
enum ManeuverType {
  depart,
  straight,
  slightLeft,
  slightRight,
  left,
  right,
  sharpLeft,
  sharpRight,
  uTurnLeft,
  uTurnRight,
  keepLeft,
  keepRight,
  mergeLeft,
  mergeRight,
  roundabout,
  arrive,
}

class Maneuver {
  const Maneuver(
    this.type, {
    this.angle = 0,
    this.exit,
    this.exitAngle,
    this.leftHandTraffic = false,
  });

  final ManeuverType type;

  /// Turn angle at the maneuver point in degrees, (-180, 180], positive =
  /// clockwise (right).
  final double angle;

  /// Roundabout exit number when the instruction text states it.
  final int? exit;

  /// Roundabout: overall direction change from entry to exit (degrees,
  /// positive = right), used to draw the exit arm.
  final double? exitAngle;

  /// Drawn for left-hand traffic (roundabouts circulate clockwise).
  final bool leftHandTraffic;

  bool get isLeft => switch (type) {
    ManeuverType.slightLeft ||
    ManeuverType.left ||
    ManeuverType.sharpLeft ||
    ManeuverType.uTurnLeft ||
    ManeuverType.keepLeft ||
    ManeuverType.mergeLeft => true,
    _ => false,
  };

  @override
  bool operator ==(Object other) =>
      other is Maneuver &&
      other.type == type &&
      other.exit == exit &&
      other.angle == angle &&
      other.exitAngle == exitAngle &&
      other.leftHandTraffic == leftHandTraffic;

  @override
  int get hashCode =>
      Object.hash(type, exit, angle, exitAngle, leftHandTraffic);

  @override
  String toString() =>
      'Maneuver(${type.name}, ${angle.toStringAsFixed(1)}°'
      '${exit == null ? '' : ', exit $exit'})';
}

/// Classifies maneuvers from the turn angle between the incoming and outgoing
/// polyline bearings at each step start. MapKit's (localized) instruction
/// text is only a tie-breaker: roundabout / merge / keep / exit number, and
/// slight-vs-normal-vs-sharp when the angle sits on a threshold.
abstract final class ManeuverClassifier {
  /// |angle| at or below this is "straight".
  static const straightMax = 12.0;
  static const slightMax = 40.0;
  static const turnMax = 120.0;
  static const sharpMax = 165.0;

  /// Angles this close to a threshold let the text decide.
  static const tieBand = 6.0;

  /// Normalizes `out - in` to (-180, 180]; positive = right turn.
  static double turnAngle(double inBearing, double outBearing) {
    var d = (outBearing - inBearing) % 360;
    if (d > 180) d -= 360;
    if (d <= -180) d += 360;
    return d;
  }

  /// Bearing (0 = north, clockwise) of a vector in a local east/north plane.
  static double bearingXY(double dx, double dy) {
    final b = math.atan2(dx, dy) * 180 / math.pi;
    return b < 0 ? b + 360 : b;
  }

  /// Pure geometry classification.
  static ManeuverType fromAngle(double a) {
    final m = a.abs();
    final right = a > 0;
    if (m <= straightMax) return ManeuverType.straight;
    if (m <= slightMax) {
      return right ? ManeuverType.slightRight : ManeuverType.slightLeft;
    }
    if (m <= turnMax) return right ? ManeuverType.right : ManeuverType.left;
    if (m <= sharpMax) {
      return right ? ManeuverType.sharpRight : ManeuverType.sharpLeft;
    }
    return right ? ManeuverType.uTurnRight : ManeuverType.uTurnLeft;
  }

  /// Full classification of one step.
  ///
  /// [angle] is null when there is no geometry (e.g. first step at the route
  /// start). [exitAngle] is the entry→exit direction change used for
  /// roundabouts.
  static Maneuver classify({
    required double? angle,
    required String instruction,
    bool isFirst = false,
    bool isLast = false,
    double? exitAngle,
    bool leftHandTraffic = false,
    double? farAngle,
  }) {
    final t = instruction.toLowerCase();
    if (isLast) return Maneuver(ManeuverType.arrive, angle: angle ?? 0);
    if (angle == null) {
      return Maneuver(isFirst ? ManeuverType.depart : ManeuverType.straight);
    }
    // Only the action part ("At the roundabout, take the 2nd exit") — not
    // the street name ("…onto Rond-point des Champs-Élysées").
    final act = actionPart(t);
    final side = _textSide(act);

    if (_has(act, _roundabout)) {
      return Maneuver(
        ManeuverType.roundabout,
        angle: angle,
        exit: exitNumber(act),
        exitAngle: exitAngle,
        leftHandTraffic: leftHandTraffic,
      );
    }
    final m = angle.abs();
    // Gentle divergences (ramps, forks, merges) show their side only over a
    // longer distance: use the far angle when the near one is ~straight.
    final sideAngle = m < 8 && farAngle != null && farAngle.abs() > m
        ? farAngle
        : angle;
    // Lane-level instructions (keep / merge / exit): the stated side wins —
    // at a fork both branches can bend the same way.
    bool sideRight() =>
        side ?? (sideAngle.abs() > 3 ? sideAngle > 0 : !leftHandTraffic);
    if (_has(act, _keep) && m <= 60) {
      return Maneuver(
        sideRight() ? ManeuverType.keepRight : ManeuverType.keepLeft,
        angle: angle,
      );
    }
    if (_has(act, _merge) && m <= turnMax) {
      return Maneuver(
        sideRight() ? ManeuverType.mergeRight : ManeuverType.mergeLeft,
        angle: angle,
      );
    }
    // Motorway exits / ramps: a slight move to the exit side.
    if (_has(act, _exit) && m <= 45) {
      return Maneuver(
        sideRight() ? ManeuverType.slightRight : ManeuverType.slightLeft,
        angle: angle,
      );
    }
    // "Continue onto …" follows the road: straight unless it really turns.
    if (_has(act, _continue) && side == null && m < 60) {
      return Maneuver(ManeuverType.straight, angle: angle);
    }
    if (_has(t, _uTurn) && m > turnMax) {
      final right = m >= 175 ? (side ?? leftHandTraffic) : angle > 0;
      return Maneuver(
        right ? ManeuverType.uTurnRight : ManeuverType.uTurnLeft,
        angle: angle,
      );
    }

    var type = fromAngle(angle);
    final right = angle > 0;
    // "Bear / slight" up to ~55°: the road forks rather than turns.
    if (_has(t, _slight) && m > straightMax && m <= 55) {
      return Maneuver(
        right ? ManeuverType.slightRight : ManeuverType.slightLeft,
        angle: angle,
      );
    }
    // Threshold tie-breaks from the text.
    if ((m - slightMax).abs() <= tieBand) {
      if (_has(t, _slight)) {
        type = right ? ManeuverType.slightRight : ManeuverType.slightLeft;
      } else if (_has(t, _turn)) {
        type = right ? ManeuverType.right : ManeuverType.left;
      }
    } else if ((m - turnMax).abs() <= tieBand) {
      if (_has(t, _sharp)) {
        type = right ? ManeuverType.sharpRight : ManeuverType.sharpLeft;
      } else if (_has(t, _turn)) {
        type = right ? ManeuverType.right : ManeuverType.left;
      }
    } else if ((m - straightMax).abs() <= tieBand && side != null) {
      if (_has(t, _slight) || _has(t, _exit)) {
        type = side ? ManeuverType.slightRight : ManeuverType.slightLeft;
      }
    } else if (m >= sharpMax - tieBand && m <= sharpMax + tieBand) {
      if (_has(t, _uTurn)) {
        type = right ? ManeuverType.uTurnRight : ManeuverType.uTurnLeft;
      } else if (_has(t, _sharp)) {
        type = right ? ManeuverType.sharpRight : ManeuverType.sharpLeft;
      }
    }
    return Maneuver(type, angle: angle);
  }

  static bool isRoundabout(String instruction) =>
      _has(actionPart(instruction.toLowerCase()), _roundabout);

  static const _nameMarkers = [
    ' onto ',
    ' on to ',
    ' toward',
    ' sur ',
    ' vers ',
    ' en direction',
    ' auf ',
    ' richtung ',
    ' hacia ',
    ' por la ',
    ' por el ',
    ' su ',
    ' verso ',
    ' على ',
    ' نحو ',
    ' باتجاه ',
  ];

  /// The instruction without the road / destination name that follows it.
  static String actionPart(String lower) {
    var cut = lower.length;
    for (final m in _nameMarkers) {
      final i = lower.indexOf(m);
      if (i > 0 && i < cut) cut = i;
    }
    return lower.substring(0, cut);
  }

  static const _continue = [
    'continue',
    'head ',
    'go straight',
    'continuez',
    'continúa',
    'continúe',
    'continua',
    'weiter',
    'استمر',
    '直進',
  ];

  /// Roundabout exit number ("take the 2nd exit", "3e sortie", "segunda
  /// salida", "الثالث"), or null.
  static int? exitNumber(String text) {
    final t = text.toLowerCase();
    final digit = RegExp(
      r'(\d{1,2})\s*(?:st|nd|rd|th|e|er|ère|ème|re|º|ª|°|\.|ª)?\s*'
      r'(?:exit|sortie|salida|ausfahrt|uscita|saída|afslag|çıkış|مخرج)',
    ).firstMatch(t);
    if (digit != null) return int.tryParse(digit.group(1)!);
    final after = RegExp(
      r'(?:exit|sortie|salida|ausfahrt|uscita|saída|مخرج)\s*(?:n[o°º]\.?\s*)?(\d{1,2})',
    ).firstMatch(t);
    if (after != null) return int.tryParse(after.group(1)!);
    for (final (i, words) in _ordinals.indexed) {
      for (final w in words) {
        if (RegExp(
          '(^|[^\\p{L}])${RegExp.escape(w)}(\$|[^\\p{L}])',
          unicode: true,
        ).hasMatch(t)) {
          return i + 1;
        }
      }
    }
    return null;
  }

  static bool _has(String t, List<String> words) => words.any(t.contains);

  /// true = right, false = left, null = not stated.
  static bool? _textSide(String t) {
    final l = _has(t, _left), r = _has(t, _right);
    if (l == r) return null;
    return r;
  }

  static const _roundabout = [
    'roundabout',
    'traffic circle',
    'rotary',
    'rond-point',
    'rond point',
    'giratoire',
    'glorieta',
    'rotonda',
    'kreisverkehr',
    'rotatória',
    'rotatoria',
    'rotunda',
    'دوار',
    'الدوار',
    'المستدير',
    'ロータリー',
    '環状交差点',
    'ラウンドアバウト',
    '环岛',
    '環島',
    'circle',
  ];
  static const _merge = [
    'merge',
    'insérez-vous',
    'insérer',
    'incorpórate',
    'incorporarse',
    'incorpórese',
    'einfädeln',
    'fädeln',
    'immettiti',
    'اندمج',
  ];
  static const _keep = [
    'keep ',
    'keep left',
    'keep right',
    'stay left',
    'stay right',
    'restez',
    'serrez',
    'mantente',
    'mantenga',
    'manténgase',
    'halten sie sich',
    'links halten',
    'rechts halten',
    'mantieni',
    'ابق',
    'التزم',
  ];
  static const _uTurn = [
    'u-turn',
    'u turn',
    'make a u',
    'demi-tour',
    'cambio de sentido',
    'media vuelta',
    'wenden',
    'inversione',
    'retorno',
    'استدر للخلف',
    'دوران للخلف',
  ];
  static const _slight = [
    'slight',
    'bear ',
    'légèrement',
    'ligeramente',
    'leicht',
    'leggermente',
    'قليلا',
    'قليلاً',
  ];
  static const _sharp = [
    'sharp',
    'franchement',
    'serré',
    'cerrad',
    'scharf',
    'stretta',
    'حاد',
  ];
  static const _turn = [
    'turn',
    'tournez',
    'gira',
    'abbiegen',
    'svolta',
    'انعطف',
  ];
  static const _exit = [
    'exit',
    'ramp',
    'sortie',
    'bretelle',
    'salida',
    'ausfahrt',
    'uscita',
    'مخرج',
  ];
  static const _left = [
    'left',
    'gauche',
    'izquierda',
    'links',
    'sinistra',
    'esquerda',
    'يسار',
    'اليسار',
  ];
  static const _right = [
    'right',
    'droite',
    'derecha',
    'rechts',
    'destra',
    'direita',
    'يمين',
    'اليمين',
  ];
  static const _ordinals = [
    [
      'first',
      'première',
      'premier',
      'primera',
      'primer',
      'erste',
      'prima',
      'الأول',
      'الأولى',
    ],
    [
      'second',
      'deuxième',
      'seconde',
      'segunda',
      'zweite',
      'seconda',
      'الثاني',
      'الثانية',
    ],
    ['third', 'troisième', 'tercera', 'dritte', 'terza', 'الثالث', 'الثالثة'],
    ['fourth', 'quatrième', 'cuarta', 'vierte', 'quarta', 'الرابع', 'الرابعة'],
    ['fifth', 'cinquième', 'quinta', 'fünfte', 'الخامس', 'الخامسة'],
    ['sixth', 'sixième', 'sexta', 'sechste', 'sesta', 'السادس', 'السادسة'],
  ];
}
