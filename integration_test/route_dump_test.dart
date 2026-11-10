import 'dart:convert';

import 'package:corvista/platform/native_bridge/native_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Dumps real MapKit routes (polyline + steps) for offline replay tests.
/// Output: `ROUTEDUMP <name> <i>/<n> <chunk>` lines; the host reassembles
/// them into `test/fixtures/routes/<name>.json`.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const pairs = <String, List<double>>{
    // City centre → Ain Diab (roundabouts, boulevards).
    'casablanca_roundabouts': [33.5731, -7.5898, 33.5925, -7.6720],
    // Avenue de la Grande Armée → Champs-Élysées through the Étoile.
    'paris_etoile': [48.8781, 2.2829, 48.8690, 2.3085],
    // Paris Left Bank → Bastille (one-ways, forks, small roundabouts).
    'paris_city': [48.8462, 2.3371, 48.8532, 2.3691],
    // Manhattan grid.
    'manhattan_grid': [40.7614, -73.9776, 40.7420, -73.9890],
    // Downtown LA → Santa Monica on I-10 (ramps, merges, exits).
    'la_highway_exits': [34.0522, -118.2437, 34.0195, -118.4912],
    // Casablanca → Mohammedia on the A1/A3 motorway.
    'casablanca_motorway': [33.5650, -7.5700, 33.6866, -7.3830],
    // Left-hand traffic: London (Hyde Park Corner / Marble Arch roundabouts).
    'london_lht': [51.5014, -0.1419, 51.5136, -0.1586],
    // Left-hand traffic, non-Latin script: Tokyo (Shinjuku → Shibuya).
    'tokyo_lht': [35.6896, 139.7006, 35.6580, 139.7016],
  };

  testWidgets('dump routes', (t) async {
    final engine = NativeEngine();
    for (final e in pairs.entries) {
      final p = e.value;
      try {
        final routes = await engine.navRoute(
          fromLat: p[0],
          fromLon: p[1],
          toLat: p[2],
          toLon: p[3],
        );
        final r = routes.first;
        final poly = r['polyline'];
        final flat = poly is Float64List
            ? poly.toList()
            : [for (final v in poly as List) (v as num).toDouble()];
        final json = jsonEncode({
          'name': e.key,
          'distanceM': r['distanceM'],
          'expectedTravelTimeS': r['expectedTravelTimeS'],
          'polyline': [
            for (final v in flat) double.parse(v.toStringAsFixed(6)),
          ],
          'steps': r['steps'],
        });
        const size = 700;
        final n = (json.length / size).ceil();
        for (var i = 0; i < n; i++) {
          final end = (i + 1) * size > json.length
              ? json.length
              : (i + 1) * size;
          debugPrint(
            'ROUTEDUMP ${e.key} ${i + 1}/$n ${json.substring(i * size, end)}',
          );
        }
      } catch (err) {
        debugPrint('ROUTEDUMP ${e.key} ERROR $err');
      }
    }
  });
}
