/// Builds the SMS body offered to the user after an escalated emergency.
/// The message is only ever placed into the system composer — never sent
/// automatically.
String composeEmergencyMessage({
  required String userMessage,
  required DateTime at,
  double? lat,
  double? lon,
}) {
  String two(int v) => v.toString().padLeft(2, '0');
  final local = at.toLocal();
  final offset = local.timeZoneOffset;
  final sign = offset.isNegative ? '-' : '+';
  final oh = two(offset.inHours.abs());
  final om = two(offset.inMinutes.abs() % 60);
  final time =
      '${local.year}-${two(local.month)}-${two(local.day)} '
      '${two(local.hour)}:${two(local.minute)} (UTC$sign$oh:$om)';
  final lines = <String>[
    userMessage.trim().isEmpty
        ? 'I may have been in a road incident and need help.'
        : userMessage.trim(),
    'Time: $time',
  ];
  if (lat != null && lon != null) {
    final la = lat.toStringAsFixed(5), lo = lon.toStringAsFixed(5);
    lines
      ..add('Location: $la, $lo')
      ..add('https://maps.apple.com/?ll=$la,$lo');
  } else {
    lines.add('Location: unavailable');
  }
  lines.add('(Sent from Corvista)');
  return lines.join('\n');
}
