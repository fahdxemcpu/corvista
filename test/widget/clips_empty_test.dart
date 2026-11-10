import 'package:corvista/app/providers.dart';
import 'package:corvista/features/clips/clips_screen.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('clips gallery shows the empty state', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          clipsProvider.overrideWith((ref) => Stream.value(const [])),
          storageInfoProvider.overrideWith(
            (ref) async => const StorageInfo(
              freeBytes: 50000000000,
              totalBytes: 128000000000,
              clipsBytes: 0,
              bufferBytes: 0,
              clipCount: 0,
            ),
          ),
        ],
        child: const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: ClipsScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No clips yet'), findsOneWidget);
    expect(find.textContaining('Save Incident'), findsOneWidget);
    // No selection / layout actions without clips.
    expect(find.text('Select'), findsNothing);
  });
}
