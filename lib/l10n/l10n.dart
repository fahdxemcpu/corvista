import 'package:flutter/widgets.dart';

import '../domain/models/object_class.dart';
import '../domain/models/tracked_object.dart';
import '../domain/models/app_settings.dart';
import 'app_localizations.dart';

export 'app_localizations.dart';

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Localized labels for shared domain enums.
extension DomainL10n on AppLocalizations {
  String objectClass(ObjectClass c) => switch (c) {
    ObjectClass.person => classPerson,
    ObjectClass.bicycle => classBicycle,
    ObjectClass.motorcycle => classMotorcycle,
    ObjectClass.car => classCar,
    ObjectClass.bus => classBus,
    ObjectClass.trafficLight => classTrafficLight,
    ObjectClass.stopSign => classStopSign,
  };

  String zone(ProximityZone z) => switch (z) {
    ProximityZone.veryClose => zoneVeryClose,
    ProximityZone.close => zoneClose,
    ProximityZone.medium => zoneMedium,
    ProximityZone.far => zoneFar,
    ProximityZone.unknown => zoneUnknown,
  };

  String light(LightState s) => switch (s) {
    LightState.red => lightRed,
    LightState.yellow => lightYellow,
    LightState.green => lightGreen,
    LightState.unknown => lightUnknown,
  };

  String driveView(DriveView v) => switch (v) {
    DriveView.detection => viewDetection,
    DriveView.virtual => viewVirtual,
    DriveView.maps => viewMap,
    DriveView.parking => viewParking,
    DriveView.segmentation => viewPerception,
  };

  String speedUnit(SpeedUnit u) => u == SpeedUnit.kmh ? unitKmh : unitMph;
}
