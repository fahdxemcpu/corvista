import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/domain/services/regional_defaults.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('speed unit follows region', () {
    expect(RegionalDefaults.speedUnit('US'), SpeedUnit.mph);
    expect(RegionalDefaults.speedUnit('gb'), SpeedUnit.mph);
    expect(RegionalDefaults.speedUnit('FR'), SpeedUnit.kmh);
    expect(RegionalDefaults.speedUnit(null), SpeedUnit.kmh);
  });

  test('emergency number follows region with 112 fallback', () {
    expect(RegionalDefaults.emergencyNumber('US'), '911');
    expect(RegionalDefaults.emergencyNumber('GB'), '999');
    expect(RegionalDefaults.emergencyNumber('AU'), '000');
    expect(RegionalDefaults.emergencyNumber('JP'), '119');
    expect(RegionalDefaults.emergencyNumber('MA'), '15');
    expect(RegionalDefaults.emergencyNumber('DE'), '112');
    expect(RegionalDefaults.emergencyNumber(null), '112');
  });

  test('apply only changes region-dependent fields', () {
    final s = RegionalDefaults.apply(const AppSettings(), 'US');
    expect(s.speedUnit, SpeedUnit.mph);
    expect(s.emergencyNumber, '911');
    expect(s.modelId, const AppSettings().modelId);
  });
}
