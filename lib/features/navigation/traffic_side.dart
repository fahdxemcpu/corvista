/// Which side of the road traffic drives on, from coordinates.
///
/// Coarse bounding boxes of left-hand-traffic regions (UK, IE, JP, IN, PK,
/// BD, LK, NP, AU, NZ, ZA & southern Africa, East Africa, HK, MO, SG, MY,
/// BN, TH, ID, TL, Caribbean LHT islands, Guyana/Suriname), with right-hand
/// exceptions carved out where boxes overlap neighbours. Roundabout geometry
/// overrides this whenever a route shows the circulation clearly.
abstract final class TrafficSide {
  static const _lht = <List<double>>[
    // [minLat, maxLat, minLon, maxLon]
    [49.8, 61.0, -8.7, 1.9], // United Kingdom
    [51.3, 55.5, -10.7, -5.9], // Ireland
    [24.0, 46.0, 122.9, 146.0], // Japan
    [5.8, 37.1, 60.8, 92.0], // India, Pakistan, Nepal, Bangladesh, Sri Lanka
    [26.7, 28.4, 88.7, 92.2], // Bhutan
    [-44.0, -9.0, 112.0, 154.0], // Australia
    [-47.5, -34.0, 166.0, 178.9], // New Zealand
    [-35.0, -15.5, 11.5, 41.0], // Southern Africa (ZA, NA, BW, ZW, MZ…)
    [-12.0, 5.0, 29.0, 42.0], // Kenya, Uganda, Tanzania
    [22.1, 22.6, 113.8, 114.5], // Hong Kong, Macau
    [-11.0, 7.5, 95.0, 141.1], // Indonesia, Malaysia, Singapore, Brunei, TL
    [5.6, 20.5, 97.3, 102.4], // Thailand (west of Laos / Cambodia)
    [17.6, 18.6, -78.5, -76.1], // Jamaica
    [20.9, 27.3, -79.3, -72.7], // Bahamas
    [10.0, 13.4, -61.9, -59.4], // Barbados, Trinidad & Tobago, …
    [1.1, 8.6, -61.5, -53.9], // Guyana, Suriname
    [34.5, 35.8, 32.2, 34.6], // Cyprus
    [35.7, 36.1, 14.1, 14.6], // Malta
  ];

  static const _rhtExceptions = <List<double>>[
    [9.5, 28.6, 92.2, 101.2], // Myanmar
    [28.5, 37.1, 78.5, 92.0], // Tibet / Xinjiang edge of the India box
    [29.0, 37.1, 60.8, 61.9], // Iran / Afghanistan edge
    [-11.0, -1.0, 29.0, 30.9], // Rwanda, Burundi, DRC edge
    [4.0, 7.5, 119.5, 127.0], // southern Philippines (Mindanao)
    [3.4, 5.0, 29.0, 42.0], // Ethiopia / South Sudan edge
    [-17.4, -15.5, 11.5, 24.0], // southern Angola
  ];

  static bool _inside(List<double> b, double lat, double lon) =>
      lat >= b[0] && lat <= b[1] && lon >= b[2] && lon <= b[3];

  /// True when traffic keeps left at ([lat], [lon]).
  static bool isLeftHand(double lat, double lon) {
    for (final b in _rhtExceptions) {
      if (_inside(b, lat, lon)) return false;
    }
    for (final b in _lht) {
      if (_inside(b, lat, lon)) return true;
    }
    return false;
  }
}
