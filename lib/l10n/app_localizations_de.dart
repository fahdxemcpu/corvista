// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Mehr sehen auf jeder Fahrt.';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get commonSave => 'Sichern';

  @override
  String get commonBack => 'Zurück';

  @override
  String get commonClose => 'Schließen';

  @override
  String get commonRetry => 'Erneut versuchen';

  @override
  String get commonOpenSettings => 'Einstellungen öffnen';

  @override
  String get commonLoading => 'Wird geladen …';

  @override
  String get commonError => 'Etwas ist schiefgelaufen.';

  @override
  String commonErrorDetail(String message) {
    return 'Etwas ist schiefgelaufen: $message';
  }

  @override
  String get commonOn => 'An';

  @override
  String get commonOff => 'Aus';

  @override
  String get commonRename => 'Umbenennen';

  @override
  String get commonShare => 'Teilen';

  @override
  String get commonNotAvailable => 'Nicht verfügbar';

  @override
  String get commonTestFootage => 'TESTVIDEO';

  @override
  String get zoneVeryClose => 'Sehr nah';

  @override
  String get zoneClose => 'Nah';

  @override
  String get zoneMedium => 'Mittel';

  @override
  String get zoneFar => 'Weit';

  @override
  String get zoneUnknown => 'Unbekannt';

  @override
  String get classPerson => 'Person';

  @override
  String get classBicycle => 'Fahrrad';

  @override
  String get classMotorcycle => 'Motorrad';

  @override
  String get classCar => 'Fahrzeug';

  @override
  String get classBus => 'Bus';

  @override
  String get classTrafficLight => 'Ampel';

  @override
  String get classStopSign => 'Stoppschild';

  @override
  String get viewDetection => 'Erkennung';

  @override
  String get viewVirtual => 'Virtuell';

  @override
  String get viewMap => 'Karte';

  @override
  String get viewParking => 'Parken';

  @override
  String get viewPerception => 'Wahrnehmung';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Rot';

  @override
  String get lightYellow => 'Gelb';

  @override
  String get lightGreen => 'Grün';

  @override
  String get lightUnknown => 'Unbekannt';

  @override
  String get clipsTitle => 'Clips';

  @override
  String get clipsSelect => 'Auswählen';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ausgewählt',
      one: '1 ausgewählt',
      zero: 'Clips auswählen',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Alle auswählen';

  @override
  String get clipsDeselectAll => 'Auswahl aufheben';

  @override
  String get clipsDeleteSelected => 'Auswahl löschen';

  @override
  String get clipsGridView => 'Rasteransicht';

  @override
  String get clipsListView => 'Listenansicht';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Clips löschen?',
      one: 'Diesen Clip löschen?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Diese Videos werden endgültig von Ihrem iPhone entfernt. Dies kann nicht rückgängig gemacht werden.',
      one: 'Das Video wird endgültig von Ihrem iPhone entfernt. Dies kann nicht rückgängig gemacht werden.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Clips gelöscht',
      one: 'Clip gelöscht',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Noch keine Clips';

  @override
  String get clipsEmptyBody =>
      'Während der Fahrt hält Corvista einen kurzen rollierenden Puffer vor. Tippen Sie auf „Vorfall speichern“, um die letzten Sekunden des Videos hier zu behalten.';

  @override
  String get clipsLoadError => 'Ihre Clips konnten nicht geladen werden.';

  @override
  String get clipsStorageTitle => 'Speicher';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Clips $clips · Puffer $buffer · $free frei';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gespeicherte Clips',
      one: '1 gespeicherter Clip',
      zero: 'Keine gespeicherten Clips',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Der Speicher Ihres iPhones ist knapp. Neue Vorfälle lassen sich eventuell nicht speichern.';

  @override
  String get clipsMissingFile => 'Datei fehlt';

  @override
  String get clipsEmergencyBadge => 'Aufprall';

  @override
  String clipsUntitled(String date) {
    return 'Vorfall · $date';
  }

  @override
  String get clipsAudio => 'Ton aufgenommen';

  @override
  String get clipsFavorite => 'Favorit';

  @override
  String get clipsUnfavorite => 'Aus Favoriten entfernen';

  @override
  String get clipsLocation => 'Standort gesichert';

  @override
  String clipsOpenClip(String title) {
    return 'Clip $title öffnen';
  }

  @override
  String get playerNotFoundTitle => 'Clip nicht gefunden';

  @override
  String get playerNotFoundBody => 'Dieser Clip wurde möglicherweise gelöscht.';

  @override
  String get playerMissingTitle => 'Videodatei fehlt';

  @override
  String get playerMissingBody =>
      'Die Aufnahme dieses Clips befindet sich nicht mehr auf Ihrem iPhone. Sie können den Eintrag aus Ihrer Galerie entfernen.';

  @override
  String get playerRemoveEntry => 'Eintrag entfernen';

  @override
  String get playerLoadError => 'Dieses Video kann nicht abgespielt werden.';

  @override
  String get playerPlay => 'Wiedergabe';

  @override
  String get playerPause => 'Pause';

  @override
  String get playerReplay => 'Erneut abspielen';

  @override
  String get playerRenameTitle => 'Clip umbenennen';

  @override
  String get playerRenameHint => 'Clipname';

  @override
  String get playerRenamed => 'Clip umbenannt';

  @override
  String get playerFavorited => 'Zu Favoriten hinzugefügt';

  @override
  String get playerUnfavorited => 'Aus Favoriten entfernt';

  @override
  String get playerShareFailed => 'Dieser Clip konnte nicht geteilt werden.';

  @override
  String get playerDetails => 'Details';

  @override
  String get playerDate => 'Aufgenommen';

  @override
  String get playerDuration => 'Dauer';

  @override
  String get playerResolution => 'Auflösung';

  @override
  String get playerSize => 'Dateigröße';

  @override
  String get playerAudio => 'Ton';

  @override
  String get playerAudioYes => 'Aufgenommen';

  @override
  String get playerAudioNo => 'Nicht aufgenommen';

  @override
  String get playerReason => 'Gesichert durch';

  @override
  String get playerReasonManual => 'Taste „Vorfall speichern“';

  @override
  String get playerReasonEmergency => 'Erkennung eines möglichen Aufpralls';

  @override
  String get playerReasonRecovered => 'Nach Unterbrechung wiederhergestellt';

  @override
  String get playerSpeed => 'GPS-Geschwindigkeit beim Sichern';

  @override
  String get playerLocation => 'Standort';

  @override
  String get playerOpenInMaps => 'In Karten öffnen';

  @override
  String get playerBack => 'Zurück';

  @override
  String get playerMore => 'Weitere Aktionen';

  @override
  String get clipsFilterLabel => 'Anzeigen';

  @override
  String get clipsFilterAll => 'Alle';

  @override
  String get clipsFilterRecordings => 'Aufnahmen';

  @override
  String get clipsFilterIncidents => 'Vorfälle';

  @override
  String get clipsFilterEmergency => 'Notfälle';

  @override
  String get clipsFilterFavorites => 'Favoriten';

  @override
  String get clipsSort => 'Sortieren';

  @override
  String get clipsSortNewest => 'Neueste zuerst';

  @override
  String get clipsSortOldest => 'Älteste zuerst';

  @override
  String get clipsSortLongest => 'Längste zuerst';

  @override
  String get clipsSortLargest => 'Größte zuerst';

  @override
  String get clipsToday => 'Heute';

  @override
  String get clipsYesterday => 'Gestern';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Clips',
      one: '1 Clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty =>
      'In dieser Kategorie gibt es noch keine Clips.';

  @override
  String get clipsFavoritesEmpty =>
      'Markieren Sie einen Clip mit einem Stern, um ihn hier schnell zu finden.';

  @override
  String get clipsKindRecording => 'Aufnahme';

  @override
  String get clipsKindIncident => 'Vorfall';

  @override
  String get clipsKindEmergency => 'Notfall';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Fahrt · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Fahrt öffnen, in der dieser Clip aufgenommen wurde';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used belegt · $free frei';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Clips belegen $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Aufnahmen',
      one: '1 Aufnahme',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Vorfälle',
      one: '1 Vorfall',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Notfälle',
      one: '1 Notfall',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Speicher freigeben';

  @override
  String get clipsStorageLowGentle =>
      'Weniger als 2 GB frei. Damit die Aufnahme weiter reibungslos läuft, geben Sie Speicher frei oder entfernen Sie Clips, die Sie nicht mehr brauchen.';

  @override
  String get clipsSaveToPhotos => 'In Fotos sichern';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Clips',
      one: '1 Clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Clips ($size) löschen?',
      one: 'Diesen Clip ($size) löschen?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return '$done von $total werden in Fotos gesichert …';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Clips in Fotos gesichert',
      one: 'In Fotos gesichert',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved in Fotos gesichert · $failed konnten nicht gesichert werden';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista darf keine Videos zu Fotos hinzufügen. Sie können dies in den Einstellungen erlauben.';

  @override
  String get clipsPhotosFailed => 'Sichern in Fotos nicht möglich.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Clips zu Favoriten hinzugefügt',
      one: 'Zu Favoriten hinzugefügt',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Clips aus Favoriten entfernt',
      one: 'Aus Favoriten entfernt',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (gekürzt)';
  }

  @override
  String get playerTrim => 'Kürzen';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Typ';

  @override
  String get playerReasonRecording => 'Aufnahmetaste';

  @override
  String get trimTitle => 'Clip kürzen';

  @override
  String get trimHint =>
      'Ziehen Sie die Griffe, um den Teil auszuwählen, der erhalten bleiben soll. Der ursprüngliche Clip bleibt unverändert.';

  @override
  String get trimStartHandle => 'Schnittanfang';

  @override
  String get trimEndHandle => 'Schnittende';

  @override
  String trimSelection(String duration) {
    return 'Auswahl: $duration';
  }

  @override
  String get trimSave => 'Als neuen Clip sichern';

  @override
  String get trimSaving => 'Gekürzter Clip wird gesichert …';

  @override
  String get trimSaved => 'Gekürzter Clip gesichert';

  @override
  String get trimOpenNew => 'Öffnen';

  @override
  String get trimFailed => 'Dieser Clip konnte nicht gekürzt werden.';

  @override
  String get trimStorageFull =>
      'Nicht genug freier Speicher, um den gekürzten Clip zu sichern.';

  @override
  String get trimPreview => 'Auswahl abspielen';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'KI';

  @override
  String get settingsSectionAlerts => 'Hinweise';

  @override
  String get settingsSectionAlertCategories => 'Hinweiskategorien';

  @override
  String get settingsSectionRecording => 'Aufnahme';

  @override
  String get settingsSectionDriving => 'Fahren';

  @override
  String get settingsSectionPower => 'Energie';

  @override
  String get settingsSectionEmergency => 'Notfall';

  @override
  String get settingsSectionAppearance => 'Darstellung';

  @override
  String get settingsSectionLanguage => 'Sprache';

  @override
  String get settingsSectionInformation => 'Informationen';

  @override
  String get settingsCameraLens => 'Kameraobjektiv';

  @override
  String get settingsLensWide => 'Weitwinkel';

  @override
  String get settingsLensUltraWide => 'Ultraweitwinkel';

  @override
  String get settingsLensTelephoto => 'Teleobjektiv';

  @override
  String get settingsLensUnavailable => 'Auf diesem iPhone nicht verfügbar';

  @override
  String get settingsStabilization => 'Stabilisierung';

  @override
  String get settingsStabAuto => 'Automatisch';

  @override
  String get settingsStabOff => 'Aus';

  @override
  String get settingsStabStandard => 'Standard';

  @override
  String get settingsStabCinematic => 'Filmisch';

  @override
  String get settingsOverlayOpacity => 'Deckkraft der Einblendung';

  @override
  String get settingsShowFps => 'Leistungswerte anzeigen';

  @override
  String get settingsShowFpsSubtitle =>
      'Bildrate und Inferenzzeit in der Erkennungsansicht';

  @override
  String get settingsCameraFooter =>
      'Änderungen an Objektiv und Stabilisierung gelten beim nächsten Start der Kamera.';

  @override
  String get settingsAiModel => 'KI-Modell';

  @override
  String get settingsConfidence => 'Erkennungsschwelle';

  @override
  String get settingsTracking => 'Objektverfolgung';

  @override
  String get settingsTrackingSubtitle =>
      'Hält Objekte zwischen Einzelbildern stabil';

  @override
  String get settingsShowLabels => 'Beschriftungen anzeigen';

  @override
  String get settingsShowConfidence => 'Konfidenz anzeigen';

  @override
  String get settingsSegmentationOpacity => 'Deckkraft der Wahrnehmungsmaske';

  @override
  String get settingsAiFooter =>
      'Eine niedrigere Schwelle zeigt mehr Objekte, aber auch mehr Fehlerkennungen. Erkennungen können ungenau sein.';

  @override
  String get settingsVoiceAlerts => 'Sprachhinweise';

  @override
  String get settingsVoiceLanguage => 'Sprache der Ansagen';

  @override
  String get settingsVoiceLanguageAuto => 'Wie App-Sprache';

  @override
  String get settingsVoice => 'Stimme';

  @override
  String get settingsVoiceDefault => 'Systemstandard';

  @override
  String get settingsVoiceQualityEnhanced => 'Erweitert';

  @override
  String get settingsVoiceQualityPremium => 'Hohe Qualität';

  @override
  String get settingsNoVoices =>
      'Für diese Sprache ist keine Stimme installiert. Fügen Sie eine in den iOS-Einstellungen unter Bedienungshilfen › Gesprochene Inhalte hinzu.';

  @override
  String get settingsAlertPedestrian => 'Fußgänger';

  @override
  String get settingsAlertCyclist => 'Radfahrer';

  @override
  String get settingsAlertMotorcycle => 'Motorräder';

  @override
  String get settingsAlertBus => 'Busse';

  @override
  String get settingsAlertVehicleClose => 'Fahrzeug sehr nah voraus';

  @override
  String get settingsAlertTrafficLight => 'Ampelwechsel';

  @override
  String get settingsAlertTrafficMoving =>
      'Verkehr voraus setzt sich in Bewegung';

  @override
  String get settingsAlertStopSign => 'Stoppschilder';

  @override
  String get settingsSensitivity => 'Empfindlichkeit';

  @override
  String get settingsSensitivityLow => 'Niedrig';

  @override
  String get settingsSensitivityMedium => 'Mittel';

  @override
  String get settingsSensitivityHigh => 'Hoch';

  @override
  String get settingsCooldown => 'Wiederholungsintervall';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Lautstärke der Ansagen';

  @override
  String get settingsQuietMode => 'Ruhemodus';

  @override
  String get settingsQuietModeSubtitle =>
      'Nur die wichtigsten Hinweise werden gesprochen';

  @override
  String get settingsTestVoice => 'Stimme testen';

  @override
  String get settingsTestVoiceDone => 'Beispielhinweis wird abgespielt …';

  @override
  String get settingsParkingBeeps => 'Parkpiepser';

  @override
  String get settingsBeepVolume => 'Lautstärke der Piepser';

  @override
  String get settingsAlertsFooter =>
      'Hinweise sind nur eine Hilfe. Beobachten Sie stets die Straße – Stille bedeutet nicht, dass der Weg frei ist.';

  @override
  String get settingsRecordingProfile => 'Aufnahmequalität';

  @override
  String get settingsProfileStandard => 'Standard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Vorfallpuffer';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds Sekunden';
  }

  @override
  String get settingsManualMaxLength => 'Maximale Länge der manuellen Aufnahme';

  @override
  String get settingsManualMaxUnlimited => 'Unbegrenzt';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes Min.';
  }

  @override
  String get settingsRecordAudio => 'Ton aufnehmen';

  @override
  String get settingsRecordAudioSubtitle =>
      'Fügt gespeicherten Vorfällen den Innenraumton hinzu';

  @override
  String get settingsMicDenied =>
      'Der Mikrofonzugriff ist deaktiviert. Erlauben Sie ihn in den Einstellungen, um Ton aufzunehmen.';

  @override
  String get settingsWatermark => 'Corvista-Wasserzeichen';

  @override
  String get settingsTimestamp => 'Datum und Uhrzeit einblenden';

  @override
  String get settingsSaveLocation => 'Standort mit Clips sichern';

  @override
  String get settingsStorage => 'Speicher und Clips';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Clips',
      one: '1 Clip',
      zero: 'Keine Clips',
    );
    return '$_temp0 · $used belegt · $free frei';
  }

  @override
  String get settingsRecordingFooter =>
      'Der rollierende Puffer bleibt auf Ihrem iPhone und wird laufend überschrieben. Im Hintergrund wird nichts aufgenommen.';

  @override
  String get settingsDefaultView => 'Standardansicht';

  @override
  String get settingsUnits => 'Einheiten';

  @override
  String get settingsShowCompass => 'Kompass anzeigen';

  @override
  String get settingsHudStyle => 'HUD-Stil';

  @override
  String get settingsHudCustomize => 'HUD anpassen';

  @override
  String get settingsDrivingSide => 'Fahrseite';

  @override
  String get settingsDrivingSideAuto => 'Automatisch';

  @override
  String get settingsDrivingSideRight => 'Rechts';

  @override
  String get settingsDrivingSideLeft => 'Links';

  @override
  String get settingsVirtualStyle => 'Stil der virtuellen Ansicht';

  @override
  String get settingsVirtualMinimal => 'Minimal';

  @override
  String get settingsVirtualPerspective => 'Perspektive';

  @override
  String get settingsVirtualHighContrast => 'Hoher Kontrast';

  @override
  String get settingsKeepScreenOn => 'Bildschirm während der Fahrt anlassen';

  @override
  String get settingsLiveActivity => 'Live-Aktivität';

  @override
  String get settingsLiveActivityDesc =>
      'Abbiegehinweise auf dem Sperrbildschirm und in der Dynamic Island anzeigen';

  @override
  String get driveRecordingPausedBackground =>
      'Aufnahme pausiert, während Corvista im Hintergrund war';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Pausiert';

  @override
  String get liveActivityDashcamOff => 'Kamera aus';

  @override
  String get liveActivityEnded => 'Navigation beendet';

  @override
  String get liveActivityEta => 'Ankunft';

  @override
  String get settingsAutoRecenter => 'Karte automatisch zentrieren';

  @override
  String get settingsHudStyleClassic => 'Klassisch';

  @override
  String get settingsHudStyleGrid => 'Raster';

  @override
  String get settingsHudStyleMinimal => 'Minimal';

  @override
  String get settingsHudStylePerformance => 'Performance';

  @override
  String get settingsHudStyleNavigation => 'Navigation';

  @override
  String get settingsHudStyleNight => 'Nacht';

  @override
  String get settingsHudStyleHighContrast => 'Hoher Kontrast';

  @override
  String get settingsPowerMode => 'Energiemodus';

  @override
  String get settingsPowerBalanced => 'Ausgewogen';

  @override
  String get settingsPowerPerformance => 'Leistung';

  @override
  String get settingsPowerSaver => 'Energiesparen';

  @override
  String get settingsPowerFooter =>
      'Corvista senkt die KI-Rate und visuelle Effekte automatisch, wenn Ihr iPhone warm wird oder der Akku niedrig ist.';

  @override
  String get settingsThermal => 'Temperaturstatus';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Warm';

  @override
  String get settingsThermalSerious => 'Heiß';

  @override
  String get settingsThermalCritical => 'Kritisch';

  @override
  String get settingsBattery => 'Akku';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Wird geladen';
  }

  @override
  String get settingsLowPowerMode =>
      'Stromsparmodus ist aktiv – die KI läuft mit reduzierter Rate.';

  @override
  String get settingsAiRate => 'Aktuelle KI-Rate';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Aufprallerkennung';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'An · $seconds s Countdown';
  }

  @override
  String get settingsEmergencyFooter =>
      'Experimentell. Kein Ersatz für den Notruf.';

  @override
  String get settingsTheme => 'Erscheinungsbild';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeDark => 'Dunkel';

  @override
  String get settingsThemeLight => 'Hell';

  @override
  String get settingsReduceMotion => 'Bewegung reduzieren';

  @override
  String get settingsReduceMotionSubtitle =>
      'Reduziert Animationen in der gesamten App';

  @override
  String get settingsAppLanguage => 'App-Sprache';

  @override
  String get settingsPrivacyPolicy => 'Datenschutzerklärung';

  @override
  String get settingsTerms => 'Nutzungsbedingungen';

  @override
  String get settingsHelp => 'Hilfe';

  @override
  String get settingsSupport => 'Support kontaktieren';

  @override
  String get settingsLicenses => 'Open-Source-Lizenzen';

  @override
  String get settingsSupportUnavailable =>
      'Mail konnte nicht geöffnet werden. Schreiben Sie an support@corvista.app.';

  @override
  String get settingsSafety => 'Sicherheitshinweise';

  @override
  String get settingsDiagnostics => 'Diagnose';

  @override
  String get settingsVersion => 'Version';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'HUD anpassen';

  @override
  String get hudCustomPreview => 'Vorschau · Beispielwerte';

  @override
  String get hudCustomStyle => 'Stil';

  @override
  String get hudCustomElements => 'Elemente';

  @override
  String get hudCustomSpeed => 'Geschwindigkeit';

  @override
  String get hudCustomHeading => 'Kurs und Kompass';

  @override
  String get hudCustomClock => 'Uhr';

  @override
  String get hudCustomBattery => 'Akku und Temperatur';

  @override
  String get hudCustomDetections => 'KI-Status und Erkennungen';

  @override
  String get hudCustomWeather => 'Wetter';

  @override
  String get hudCustomAppearance => 'Größe und Deckkraft';

  @override
  String get hudCustomSize => 'Größe';

  @override
  String get hudCustomOpacity => 'Deckkraft';

  @override
  String get hudCustomFooter =>
      'Warnungen, etwa bei Überhitzung, werden immer angezeigt, auch wenn Elemente ausgeblendet sind.';

  @override
  String get hudCustomDescClassic => 'Ausgewogenes Kombiinstrument';

  @override
  String get hudCustomDescGrid => 'Perspektivisches Raster über der Straße';

  @override
  String get hudCustomDescMinimal => 'Nur Geschwindigkeit, sonst nichts';

  @override
  String get hudCustomDescPerformance =>
      'Geschwindigkeitsbogen mit Live-Werten';

  @override
  String get hudCustomDescNavigation => 'Nächstes Manöver zuerst';

  @override
  String get hudCustomDescNight => 'Gedimmt und rotverschoben für Nachtfahrten';

  @override
  String get hudCustomDescHighContrast =>
      'Maximale Lesbarkeit bei hellem Sonnenlicht';

  @override
  String get languageTitle => 'Sprache';

  @override
  String get languageSystem => 'Systemstandard';

  @override
  String get languageSystemSubtitle => 'Der Sprache Ihres iPhones folgen';

  @override
  String get languageFooter =>
      'Weitere Sprachen folgen. Die Sprache der Sprachhinweise lässt sich separat unter „Hinweise“ festlegen.';

  @override
  String get diagTitle => 'Diagnose';

  @override
  String get diagPerformance => 'Leistung';

  @override
  String get diagInference => 'Inferenzzeit';

  @override
  String get diagDetectHz => 'Erkennungsrate';

  @override
  String get diagCameraFps => 'Kamerabildrate';

  @override
  String get diagMemory => 'Arbeitsspeicher';

  @override
  String get diagDropped => 'Verworfene Bilder';

  @override
  String get diagSegmentation => 'Segmentierungszeit';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Status';

  @override
  String get diagSource => 'Quelle';

  @override
  String get diagSourceCamera => 'Live-Kamera';

  @override
  String get diagSourceFile => 'Testvideodatei';

  @override
  String get diagResolution => 'Puffergröße';

  @override
  String get diagLens => 'Objektiv';

  @override
  String get diagError => 'Letzter Fehler';

  @override
  String get diagModel => 'KI-Modell';

  @override
  String get diagModelLoad => 'Modellladezeit';

  @override
  String get diagPower => 'Energie';

  @override
  String get diagSegHz => 'Segmentierungsrate';

  @override
  String get diagReduced => 'Reduzierte Effekte';

  @override
  String diagMs(String value) {
    return '$value ms';
  }

  @override
  String diagFps(String value) {
    return '$value fps';
  }

  @override
  String diagMb(String value) {
    return '$value MB';
  }

  @override
  String get diagCamIdle => 'Inaktiv';

  @override
  String get diagCamStarting => 'Startet';

  @override
  String get diagCamRunning => 'Läuft';

  @override
  String get diagCamInterrupted => 'Unterbrochen';

  @override
  String get diagCamStopped => 'Gestoppt';

  @override
  String get diagCamUnavailable => 'Nicht verfügbar';

  @override
  String get diagCamPermissionDenied => 'Zugriff verweigert';

  @override
  String get diagCamError => 'Fehler';

  @override
  String get diagTestFootage => 'Testvideo';

  @override
  String get diagTestFootageBody =>
      'Führt die echte Erkennung auf dem Gerät mit einer lokalen Videodatei statt der Kamera aus. Jede Ansicht kennzeichnet dies als TESTVIDEO.';

  @override
  String get diagPathLabel => 'Pfad der Videodatei';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Documents/test_drive.mp4 verwenden';

  @override
  String get diagRun => 'Testvideo starten';

  @override
  String get diagRunStarted =>
      'Testvideo gestartet. Öffnen Sie die Fahransicht, um es zu sehen.';

  @override
  String get diagBackToCamera => 'Zur Live-Kamera zurückkehren';

  @override
  String get diagDebugOnly =>
      'Das Testvideo ist nur in Entwicklungs-Builds verfügbar.';

  @override
  String get diagFileMissing => 'Unter diesem Pfad existiert keine Datei.';

  @override
  String get emergencySetupTitle => 'Aufprallerkennung';

  @override
  String get emergencyExperimental => 'Experimentell';

  @override
  String get emergencyIntro =>
      'Während einer Fahrt kann Corvista mithilfe der Bewegungssensoren Ihres iPhones auf einen möglichen schweren Aufprall achten. Wird einer erkannt, startet ein Countdown. Brechen Sie ihn nicht ab, bietet Corvista an, den Notruf zu wählen und Ihre Kontakte zu benachrichtigen.';

  @override
  String get emergencyDisclaimer1 =>
      'Kein Ersatz für den Notruf oder die Unfallerkennung Ihres Fahrzeugs.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS bittet Sie stets um Bestätigung, bevor ein Anruf getätigt oder eine Nachricht gesendet wird.';

  @override
  String get emergencyDisclaimer3 =>
      'Ein Aufprall kann unerkannt bleiben, und starkes Bremsen oder Bodenwellen können fälschlich als Aufprall gewertet werden.';

  @override
  String get emergencyParkedWarning =>
      'Schließen Sie diese Einrichtung im Stand ab. Während das Fahrzeug fährt, sind die Einstellungen gesperrt.';

  @override
  String get emergencyEnable => 'Aufprallerkennung aktivieren';

  @override
  String get emergencyEnableSubtitle => 'Nur während einer Fahrt aktiv';

  @override
  String get emergencyNeedNumber => 'Fügen Sie zuerst eine Notrufnummer hinzu.';

  @override
  String get emergencyContacts => 'Notfallkontakte';

  @override
  String get emergencyAddContact => 'Kontakt hinzufügen';

  @override
  String get emergencyNoContacts =>
      'Noch keine Kontakte. Kontakte erhalten erst nach Ihrer Bestätigung eine Nachricht.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '$name entfernen?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Diese Person wird nach einem Aufprall nicht mehr als Empfänger vorgeschlagen.';

  @override
  String get emergencyRemove => 'Entfernen';

  @override
  String get emergencyContactsError => 'Kontakte konnten nicht geladen werden.';

  @override
  String get emergencyNumber => 'Notrufnummer';

  @override
  String get emergencyNumberHint => 'z. B. 112 oder 911';

  @override
  String get emergencyMessage => 'Nachrichtenvorlage';

  @override
  String get emergencyMessageDefault =>
      'Ich hatte möglicherweise einen Fahrzeugunfall. Diese Nachricht wurde von Corvista vorbereitet und enthält, sofern verfügbar, meinen zuletzt bekannten Standort.';

  @override
  String get emergencyMessageHint =>
      'Leer lassen, um die Standardnachricht zu verwenden.';

  @override
  String get emergencyCountdown => 'Countdown-Dauer';

  @override
  String get emergencyVoiceCancel => 'Per Sprache abbrechen';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Sagen Sie während des Countdowns „Mir geht’s gut“ oder „Abbrechen“. Nutzt, wo verfügbar, die Spracherkennung auf dem Gerät.';

  @override
  String get emergencyVoicePermDenied =>
      'Für den Abbruch per Sprache sind Mikrofon- und Spracherkennungszugriff erforderlich.';

  @override
  String get emergencyAutoSave => 'Vorfall-Clip automatisch sichern';

  @override
  String get emergencyTest => 'Countdown testen (ohne Anruf)';

  @override
  String get emergencyTestBody =>
      'Simuliert einen Aufprall, damit Sie den Countdown sehen können. Im Testmodus wird nie ein Anruf getätigt oder eine Nachricht gesendet.';

  @override
  String get emergencyNotSet => 'Nicht festgelegt';

  @override
  String get emergencyAlertHeadline => 'Möglicher schwerer Aufprall erkannt.';

  @override
  String get emergencyAlertSubtitle => 'Ist alles in Ordnung?';

  @override
  String get emergencyAlertCancel => 'Mir geht’s gut – Abbrechen';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Noch $seconds Sekunden',
      one: 'Noch 1 Sekunde',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Hört zu – sagen Sie „Mir geht’s gut“ zum Abbrechen';

  @override
  String emergencyAlertHeard(String text) {
    return 'Verstanden: „$text“';
  }

  @override
  String get emergencyAlertEscalated =>
      'Keine Reaktion. Wählen Sie eine Option:';

  @override
  String get emergencyAlertCall => 'Notruf wählen';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Ruft $number an. iOS fragt vorher nach Ihrer Bestätigung.';
  }

  @override
  String get emergencyAlertMessage => 'Kontakte benachrichtigen';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Öffnet eine vorbereitete Nachricht. Sie entscheiden, ob sie gesendet wird.';

  @override
  String get emergencyAlertTestMode =>
      'Testmodus – es wird kein Anruf getätigt';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'Mir geht’s gut – Schließen';

  @override
  String get emergencyMsgSent => 'Nachricht gesendet.';

  @override
  String get emergencyMsgCancelled => 'Nachricht nicht gesendet.';

  @override
  String get emergencyMsgFailed =>
      'Die Nachricht konnte nicht gesendet werden.';

  @override
  String get emergencyMsgUnavailable =>
      'Nachrichten sind auf diesem Gerät nicht verfügbar.';

  @override
  String emergencyCallFailed(String number) {
    return 'Der Anruf konnte nicht gestartet werden. Wählen Sie $number selbst.';
  }

  @override
  String get modelsTitle => 'KI-Modelle';

  @override
  String get modelsIntro =>
      'Alle Modelle sind in der App enthalten und laufen vollständig auf Ihrem iPhone. Ihr Kamerabild verlässt das Gerät nie.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Live: $ms ms pro Bild · $hz Erkennungen/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'In $ms ms geladen';
  }

  @override
  String get modelsEfficientName => 'Effizient';

  @override
  String get modelsEfficientDesc =>
      'Schneller, kompakter Detektor für lange Fahrten mit geringer Erwärmung und wenig Akkuverbrauch.';

  @override
  String get modelsEnhancedName => 'Erweitert';

  @override
  String get modelsEnhancedDesc =>
      'Größerer Detektor, der kleinere und weiter entfernte Objekte findet – bei höherem Energiebedarf.';

  @override
  String get modelsSegmentationName => 'Segmentierung';

  @override
  String get modelsSegmentationDesc =>
      'Verbindet schnelle Erkennung mit Straßenflächen- und Objektmasken für die Wahrnehmungsansicht.';

  @override
  String get modelsNoneName => 'KI pausiert';

  @override
  String get modelsNoneDesc =>
      'Kamera und Aufnahme laufen ohne Objekterkennung weiter. Geringster Energieverbrauch.';

  @override
  String get modelsGenericDesc => 'Modell zur Objekterkennung auf dem Gerät.';

  @override
  String get modelsFunctionDetection =>
      'Erkennt Fahrzeuge, Personen, Fahrräder, Motorräder, Busse, Ampeln und Stoppschilder';

  @override
  String get modelsFunctionSegmentation =>
      'Ergänzt Straßenflächen- und Objektmasken';

  @override
  String get modelsFunctionNone => 'Keine Erkennung; nur Dashcam-Aufnahme';

  @override
  String get modelsSize => 'Größe';

  @override
  String get modelsInput => 'Eingabe';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Funktioniert mit';

  @override
  String get modelsStatusInstalled => 'Installiert (enthalten)';

  @override
  String get modelsStatusNotInstalled => 'Nicht installiert';

  @override
  String get modelsSelected => 'Ausgewählt';

  @override
  String get modelsUse => 'Dieses Modell verwenden';

  @override
  String get modelsSwitching => 'Modell wird geladen …';

  @override
  String modelsSwitched(String name) {
    return '$name ist jetzt aktiv';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Auf diesem Gerät gemessen: durchschnittlich $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Auf diesem Gerät nicht gemessen';

  @override
  String get modelsBenchmarkRun => 'Benchmark starten';

  @override
  String get modelsBenchmarkRunning => 'Benchmark läuft …';

  @override
  String get modelsBenchmarkSelectHint =>
      'Wählen Sie dieses Modell aus, um es zu testen.';

  @override
  String get modelsBenchmarkDone => 'Benchmark abgeschlossen';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Benchmark fehlgeschlagen: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Zuletzt aktualisiert: $date';
  }

  @override
  String get safetyTitle => 'Sicherheitshinweise';

  @override
  String get safetyIntro =>
      'Corvista ist eine Hilfe für mehr Aufmerksamkeit beim Fahren. Die App steuert Ihr Fahrzeug nicht und kann weder Ihre eigene Aufmerksamkeit und Urteilskraft noch die Sicherheitssysteme des Fahrzeugs ersetzen.';

  @override
  String get safetyBeforeTitle => 'Vor der Fahrt';

  @override
  String get safetyBefore1 =>
      'Befestigen Sie Ihr iPhone sicher an einer zulässigen Position, die weder Sicht noch Airbags oder Bedienelemente verdeckt.';

  @override
  String get safetyBefore2 =>
      'Schließen Sie die Einrichtung ab, wählen Sie eine Ansicht und legen Sie Ihr Ziel im Stand fest.';

  @override
  String get safetyBefore3 =>
      'Schließen Sie bei längeren Fahrten ein Ladegerät an und halten Sie das iPhone möglichst aus direktem Sonnenlicht.';

  @override
  String get safetyWhileTitle => 'Während der Fahrt';

  @override
  String get safetyWhile1 =>
      'Halten Sie den Blick auf der Straße. Nutzen Sie die großen Bedienelemente nur, wenn es sicher und erlaubt ist.';

  @override
  String get safetyWhile2 =>
      'Hinweise sind Hilfen, keine Warnungen, auf die Sie sich verlassen können. Stille bedeutet nie, dass die Straße frei ist.';

  @override
  String get safetyWhile3 =>
      'Befolgen Sie Verkehrsregeln, Signale und Verkehrszeichen – nicht die App –, wenn diese voneinander abweichen.';

  @override
  String get safetyLimitsTitle => 'Einschränkungen';

  @override
  String get safetyLimits1 =>
      'Eine einzelne Smartphone-Kamera sieht nur, was vor ihr liegt. Objekte außerhalb des Sichtfelds, verdeckte oder sehr nahe Objekte werden nicht erkannt.';

  @override
  String get safetyLimits2 =>
      'Erkennungen können ausbleiben, verspätet oder falsch sein, besonders bei Nacht, Regen, Nebel, Blendung oder verschmutzter Windschutzscheibe.';

  @override
  String get safetyLimits3 =>
      'Nur unterstützte Kategorien werden erkannt: Fahrzeuge, Busse, Motorräder, Fahrräder, Personen, Ampeln und Stoppschilder. Spurhinweise in der virtuellen Ansicht sind stilisiert, keine erkannten Fahrspuren.';

  @override
  String get safetyLimits4 =>
      'Die Nähe wird als ungefähre Zonen angezeigt (Sehr nah, Nah, Mittel, Weit), nie als gemessene Entfernung. Die Parkansicht ersetzt keine Parksensoren.';

  @override
  String get safetyHeatTitle => 'Hitze und Akku';

  @override
  String get safetyHeat1 =>
      'Dauerhafte Nutzung von Kamera und KI erwärmt Ihr iPhone. Corvista senkt die Analyserate, wenn das Gerät heiß wird, und zeigt eine Warnung an; überhitzt iOS, kann die Kamera stoppen.';

  @override
  String get safetyEmergencyTitle => 'Notfallfunktion';

  @override
  String get safetyEmergency1 =>
      'Die Erkennung eines möglichen Aufpralls ist experimentell. Sie kann echte Unfälle übersehen und durch andere Ereignisse ausgelöst werden.';

  @override
  String get safetyEmergency2 =>
      'Sie kontaktiert nie unbemerkt jemanden: iOS bittet Sie stets, einen Anruf oder eine Nachricht zu bestätigen. Sie ersetzt nicht, selbst den Notruf zu wählen.';

  @override
  String get privacyTitle => 'Datenschutz';

  @override
  String get privacyIntro =>
      'Corvista ist darauf ausgelegt, Ihre Fahrdaten auf Ihrem iPhone zu belassen. Es gibt kein Corvista-Konto, und Corvista betreibt keine eigenen Server.';

  @override
  String get privacyCameraTitle => 'Kamera und KI';

  @override
  String get privacyCamera1 =>
      'Objekterkennung, Verfolgung und Segmentierung laufen vollständig auf Ihrem iPhone. Kamerabilder werden nie hochgeladen.';

  @override
  String get privacyCamera2 =>
      'Die Kamera läuft nur, solange Corvista geöffnet auf dem Bildschirm ist. Sie pausiert, wenn die App in den Hintergrund wechselt – es gibt keine verdeckte Hintergrundaufnahme.';

  @override
  String get privacyRecordingsTitle => 'Aufnahmen';

  @override
  String get privacyRecordings1 =>
      'Der rollierende Puffer ist temporär und wird laufend überschrieben. Videomaterial wird nur behalten, wenn Sie auf „Vorfall speichern“ tippen oder, falls aktiviert, nach einem möglichen Aufprall.';

  @override
  String get privacyRecordings2 =>
      'Gesicherte Clips bleiben im privaten Speicher von Corvista auf Ihrem iPhone. Sie verlassen das Gerät nur, wenn Sie „Teilen“ wählen. Beim Löschen der App werden sie gelöscht.';

  @override
  String get privacyRecordings3 =>
      'Ton wird nur aufgenommen, wenn Sie ihn aktivieren und den Mikrofonzugriff erlauben.';

  @override
  String get privacyLocationTitle => 'Standort';

  @override
  String get privacyLocation1 =>
      'Der Standort wird bei geöffneter App für Geschwindigkeit, Karte, Routen und Wetter verwendet. Ist „Standort sichern“ aktiviert, wird die Position beim Sichern mit dem Clip auf Ihrem Gerät gespeichert.';

  @override
  String get privacyNetworkTitle => 'Netzwerkdienste';

  @override
  String get privacyNetwork1 =>
      'Apple Maps – Kartenanzeige, Ortssuche und Routen. Ihr Suchtext und Ihr ungefährer Standort werden an Apple gesendet.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) – aktuelles und stündliches Wetter für Ihren Standort.';

  @override
  String get privacyNetwork4 =>
      'Corvista enthält keine Werbung und keine Analyse- oder Tracking-Dienste von Drittanbietern.';

  @override
  String get privacyEmergencyTitle => 'Notfallkontakte';

  @override
  String get privacyEmergency1 =>
      'Von Ihnen gewählte Kontakte werden im iOS-Schlüsselbund auf diesem Gerät gespeichert. Der Abbruch per Sprache nutzt, wo verfügbar, die Spracherkennung auf dem Gerät. Anrufe und Nachrichten werden erst nach Ihrer Bestätigung in iOS gesendet.';

  @override
  String get privacyControlsTitle => 'Ihre Kontrolle';

  @override
  String get privacyControls1 =>
      'Sie können Clips jederzeit unter „Clips“ löschen und den Zugriff auf Kamera, Mikrofon, Standort und Spracherkennung in den iOS-Einstellungen ändern oder widerrufen.';

  @override
  String get termsTitle => 'Nutzungsbedingungen';

  @override
  String get termsIntro =>
      'Mit der Nutzung von Corvista stimmen Sie diesen Bedingungen zu. Zusätzlich gilt Apples Standard-Endbenutzer-Lizenzvertrag für lizenzierte Apps.';

  @override
  String get termsUseTitle => 'Corvista nutzen';

  @override
  String get termsUse1 =>
      'Corvista ist eine Hilfe für mehr Aufmerksamkeit beim Fahren und eine Dashcam-Funktion. Sie bleiben jederzeit voll dafür verantwortlich, sicher und regelkonform zu fahren.';

  @override
  String get termsUse2 =>
      'Bedienen Sie die App nicht so, dass Sie beim Fahren abgelenkt werden. Befestigen Sie das Gerät sicher und rechtmäßig.';

  @override
  String get termsAccuracyTitle => 'Keine Genauigkeitsgarantie';

  @override
  String get termsAccuracy1 =>
      'Erkennungen, Zonen, Hinweise, Kartenmarkierungen, Routen und Wetter können unvollständig, verzögert oder falsch sein. Corvista steuert Ihr Fahrzeug nicht.';

  @override
  String get termsAccuracy2 =>
      'Die Notfallfunktion ist experimentell und erkennt einen Aufprall möglicherweise nicht oder löst fälschlich aus.';

  @override
  String get termsRecordingTitle => 'Aufnahmegesetze';

  @override
  String get termsRecording1 =>
      'Gesetze zu Dashcams, Tonaufnahmen und dem Filmen von Personen unterscheiden sich je nach Land und Region. Sie sind für deren Einhaltung verantwortlich, auch beim Teilen von Clips.';

  @override
  String get termsLiabilityTitle => 'Haftung';

  @override
  String get termsLiability1 =>
      'Die App wird „wie besehen“ bereitgestellt. Soweit gesetzlich zulässig, haftet der Entwickler nicht für Unfälle, Verluste, Bußgelder oder Schäden, die aus der Nutzung oder dem Vertrauen auf die Ausgaben der App entstehen.';

  @override
  String get termsChangesTitle => 'Änderungen';

  @override
  String get termsChanges1 =>
      'Diese Bedingungen können mit neuen App-Versionen aktualisiert werden. Die weitere Nutzung nach einer Aktualisierung gilt als Zustimmung zu den geänderten Bedingungen.';

  @override
  String get helpTitle => 'Hilfe';

  @override
  String get helpIntro =>
      'Antworten auf häufige Fragen. Hinweise zur Sicherheit finden Sie unter „Sicherheitshinweise“.';

  @override
  String get helpQSave => 'Wie sichere ich das Video eines Vorfalls?';

  @override
  String get helpASaveBuffer =>
      'Tippen Sie in der Fahransicht auf die große Taste „Vorfall speichern“. Corvista sichert die letzten 20 oder 30 Sekunden seines rollierenden Puffers (Ihre Wahl unter Einstellungen › Aufnahme) in Clips.';

  @override
  String get helpQWhere => 'Wo werden meine Clips gespeichert?';

  @override
  String get helpAWhere =>
      'Im privaten Speicher von Corvista auf Ihrem iPhone. Sie werden nie hochgeladen. Über „Teilen“ im Player senden oder exportieren Sie einen Clip.';

  @override
  String get helpQZones => 'Wie genau sind die Näherungszonen?';

  @override
  String get helpAZones =>
      'Zonen sind grobe Schätzungen einer einzelnen Kamera anhand typischer Objektgrößen. Betrachten Sie sie als ungefähre Hinweise, nie als Entfernungen.';

  @override
  String get helpQSlow => 'Warum wird die Erkennung langsamer?';

  @override
  String get helpASlow =>
      'Wenn Ihr iPhone warm wird, der Akku niedrig ist oder der Stromsparmodus aktiv ist, senkt Corvista die Analyserate, um das Gerät zu schützen. Den Energiemodus können Sie in den Einstellungen ändern.';

  @override
  String get helpQMap => 'Karte, Suche oder Wetter funktionieren nicht.';

  @override
  String get helpAMap =>
      'Diese Funktionen benötigen eine Internetverbindung und Standortzugriff. Prüfen Sie Ihre Verbindung und erlauben Sie Corvista den Standort in den iOS-Einstellungen.';

  @override
  String get helpQSimulator => 'Die Kamera wird als nicht verfügbar angezeigt.';

  @override
  String get helpASimulator =>
      'Stellen Sie sicher, dass der Kamerazugriff in den iOS-Einstellungen erlaubt ist und keine andere App die Kamera nutzt. Im iOS-Simulator gibt es keine Kamera; stattdessen kann ein lokales Testvideo verwendet werden.';

  @override
  String get emergencyMsgNoContacts =>
      'Fügen Sie zuerst einen Notfallkontakt hinzu.';

  @override
  String get cameraStarting => 'Kamera wird gestartet …';

  @override
  String get cameraInterrupted => 'Kamera pausiert';

  @override
  String get cameraInterruptedBody =>
      'iOS hat die Kamera pausiert, zum Beispiel während eines Anrufs oder wenn eine andere App sie nutzt. Sie wird automatisch fortgesetzt.';

  @override
  String get cameraUnavailable => 'Kamera nicht verfügbar';

  @override
  String get cameraUnavailableBody =>
      'Auf diesem Gerät ist keine Kamera verfügbar. Erkennungs-, Aufnahme- und Parkansicht benötigen die rückseitige Kamera.';

  @override
  String get cameraRunTestFootage => 'Testvideo starten';

  @override
  String get cameraPermissionDenied => 'Kamerazugriff ist deaktiviert';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista benötigt die Kamera für Erkennung, Dashcam-Aufnahme und Parkansicht. Aktivieren Sie den Kamerazugriff in den Einstellungen.';

  @override
  String get cameraError => 'Kamerafehler';

  @override
  String get cameraStopped => 'Kamera gestoppt';

  @override
  String get cameraStart => 'Kamera starten';

  @override
  String get cameraFocusHint => 'Zum Fokussieren tippen';

  @override
  String get cameraPreviewLabel => 'Live-Kameraansicht mit erkannten Objekten';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · KI $hz Hz · $ms ms · verworfen $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Geschwindigkeit $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Keine GPS-Geschwindigkeit';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Kurs $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Dashcam-Puffer nimmt auf, $seconds von $target Sekunden gepuffert';
  }

  @override
  String get hudRecIdle => 'REC aus';

  @override
  String get hudRecSaving => 'Wird gesichert …';

  @override
  String get hudRecError => 'REC-Fehler';

  @override
  String get hudAiPaused => 'KI pausiert';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Objekte',
      one: '1 Objekt',
      zero: 'Keine Objekte',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Objekte',
      one: '1 Objekt',
      zero: 'keine Objekte',
    );
    return 'KI-Modell $model, $_temp0 erkannt';
  }

  @override
  String get hudThermalSerious => 'Heiß – KI gedrosselt';

  @override
  String get hudThermalCritical => 'Zu heiß – KI pausiert';

  @override
  String hudBatteryLow(String percent) {
    return 'Akku $percent';
  }

  @override
  String get hudLowPower => 'Stromsparmodus';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Wetter $temperature, $condition. Für Details tippen.';
  }

  @override
  String get hudNoGuidance =>
      'Suchen Sie in der Kartenansicht ein Ziel, um hier die Abbiegehinweise zu sehen.';

  @override
  String get navArrived => 'Sie haben Ihr Ziel erreicht';

  @override
  String get navRerouting => 'Route wird neu berechnet …';

  @override
  String get navSearchHint => 'Ziel suchen';

  @override
  String get navSearchFieldHint => 'Adresse, Ort oder Unternehmen';

  @override
  String get navNoResults => 'Keine passenden Orte';

  @override
  String get navSearching => 'Suche läuft …';

  @override
  String get navSearchStartTyping =>
      'Geben Sie eine Adresse oder einen Ortsnamen ein. Die Ergebnisse stammen von Apple Maps und erfordern eine Internetverbindung.';

  @override
  String get navErrorUnavailable =>
      'Suche und Routen sind nicht verfügbar – prüfen Sie Ihre Internetverbindung.';

  @override
  String get navErrorNoLocation =>
      'Warte auf Ihren Standort, um eine Route zu planen.';

  @override
  String get navErrorPermission =>
      'Der Standortzugriff ist deaktiviert, daher können Routen nicht von Ihrer Position aus starten.';

  @override
  String navErrorGeneric(String code) {
    return 'Routen konnten nicht geladen werden ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Routen nach $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Ankunft $time';
  }

  @override
  String get navStart => 'Start';

  @override
  String get navEnd => 'Ende';

  @override
  String get navEndLabel => 'Navigation beenden';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · noch $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Hinweis: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes Min.',
      one: '1 Min.',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours Std. $minutes Min.';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Route $index: $name';
  }

  @override
  String get weatherTitle => 'Wetter';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Gefühlt $temperature';
  }

  @override
  String get weatherPrecipitation => 'Niederschlag';

  @override
  String get weatherWind => 'Wind';

  @override
  String get weatherVisibility => 'Sichtweite';

  @override
  String get weatherHumidity => 'Luftfeuchtigkeit';

  @override
  String get weatherHourly => 'Nächste Stunden';

  @override
  String weatherAsOf(String time) {
    return 'Aktualisiert $time';
  }

  @override
  String get weatherRefresh => 'Wetter aktualisieren';

  @override
  String get weatherUnavailable => 'Das Wetter ist derzeit nicht verfügbar.';

  @override
  String get weatherNoLocation => 'Für das Wetter wird Ihr Standort benötigt.';

  @override
  String get weatherLegal => 'Datenquellen und rechtliche Hinweise';

  @override
  String weatherProvidedBy(String service) {
    return 'Wetterdaten: $service';
  }

  @override
  String get weatherNow => 'Jetzt';

  @override
  String get virtualEmpty => 'Keine unterstützten Objekte erkannt';

  @override
  String get virtualEmptyCameraOff =>
      'Die virtuelle Ansicht benötigt die Live-Kamera.';

  @override
  String get virtualLaneDisclaimer =>
      'Fahrspurlinien sind illustrativ, nicht erkannt.';

  @override
  String virtualNearest(String zone) {
    return 'Am nächsten: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtuelle Straßenszene: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'KI $status';
  }

  @override
  String get virtualStatusLive => 'live';

  @override
  String get virtualStatusPaused => 'pausiert';

  @override
  String get virtualStatusCameraOff => 'Kamera aus';

  @override
  String get virtualStatusTestFootage => 'Testvideo';

  @override
  String get virtualEmptyHint =>
      'Fahrzeuge, Personen, Fahrräder, Ampeln und Stoppschilder erscheinen hier, sobald sie erkannt werden.';

  @override
  String get mapRecenter => 'Zentrieren';

  @override
  String get mapZoomIn => 'Vergrößern';

  @override
  String get mapZoomOut => 'Verkleinern';

  @override
  String get mapUnsupported =>
      'Die interaktive Karte ist auf dem iPhone verfügbar.';

  @override
  String get mapObjectsApprox =>
      'Objektmarkierungen zeigen ungefähre Positionen.';

  @override
  String get mapWeatherUnavailable => 'Wetter nicht verfügbar';

  @override
  String get navErrorNoRoute => 'Für dieses Ziel wurde keine Route gefunden.';

  @override
  String get navDismiss => 'Schließen';

  @override
  String get navGo => 'Los';

  @override
  String get navFastest => 'Schnellste';

  @override
  String get navThen => 'Dann';

  @override
  String get navRecents => 'Zuletzt';

  @override
  String get navClearRecents => 'Löschen';

  @override
  String get navSearchSubmitHint =>
      'Tippen Sie auf Suchen, um alle passenden Orte zu sehen';

  @override
  String get navPlaces => 'Orte';

  @override
  String get navEtaLabel => 'Ankunft';

  @override
  String get navTimeLeftLabel => 'verbleibend';

  @override
  String get navOverview => 'Übersicht';

  @override
  String get navMute => 'Stimme stummschalten';

  @override
  String get navUnmute => 'Stimme einschalten';

  @override
  String get navEndConfirm => 'Navigation beenden?';

  @override
  String navEndConfirmBody(String place) {
    return 'Die Zielführung nach $place wird beendet.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Sie haben $place erreicht';
  }

  @override
  String get navDone => 'Fertig';

  @override
  String get navWeakGps => 'Schwaches GPS-Signal';

  @override
  String get navLocationOff =>
      'Der Standort ist deaktiviert. Aktivieren Sie ihn, um Routen zu planen und zu navigieren.';

  @override
  String get navVoiceGuidance => 'Sprachführung';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'In $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, danach $second';
  }

  @override
  String get navSpeakRerouting => 'Route wird neu berechnet';

  @override
  String get navSpeakArrived => 'Sie haben Ihr Ziel erreicht';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Metern',
      one: '1 Meter',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value Kilometern',
      one: '1 Kilometer',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fuß',
      one: '1 Fuß',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Yards',
      one: '1 Yard',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Weiter für $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Für diese Fahrt sind in dieser Region keine Routenführungen verfügbar. Versuche ein anderes Ziel.';

  @override
  String navContinueFor(String distance) {
    return 'Weiter für $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value Meilen',
      one: '1 Meile',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Am nächsten: $object · $zone';
  }

  @override
  String get parkingNothing => 'Nichts im Bild erkannt';

  @override
  String get parkingBeeps => 'Näherungstöne';

  @override
  String get parkingVolume => 'Lautstärke der Piepser';

  @override
  String get parkingLimitations =>
      'Einzelne Kamera, kein 360°-Blick. Objekte außerhalb des Kamerabilds werden nicht erkannt. Kein Ersatz für Parksensoren; Schätzungen können falsch sein, und Stille bedeutet nicht, dass der Bereich frei ist.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Näherungsansicht von oben. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Original';

  @override
  String get perceptionModeBoxes => 'Rahmen';

  @override
  String get perceptionModeMasks => 'Objektmasken';

  @override
  String get perceptionModeRoad => 'Straßenfläche';

  @override
  String get perceptionModeCombined => 'Kombiniert';

  @override
  String get perceptionOpacity => 'Maskendeckkraft';

  @override
  String get perceptionDisclaimer =>
      'Die Straßenflächenmaske ist eine ungefähre visuelle Ebene. Sie zeigt weder befahrbaren Raum noch Fahrspuren.';

  @override
  String get perceptionNeedsModel =>
      'Wählen Sie das Segmentierungsmodell, um Masken zu sehen.';

  @override
  String get perceptionChooseModel => 'Modell wählen';

  @override
  String get perceptionWaiting => 'Warte auf das erste Segmentierungsbild …';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Rahmen';

  @override
  String get perceptionShortObjects => 'Objekte';

  @override
  String get perceptionShortRoad => 'Straße';

  @override
  String get perceptionShortAll => 'Alle';

  @override
  String get perceptionModesLabel => 'Wahrnehmungsebenen';

  @override
  String get perceptionStatusWarmingUp => 'Wird vorbereitet …';

  @override
  String get perceptionStatusLoadingModel => 'Modell wird geladen …';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Masken pausiert';

  @override
  String get perceptionLegend => 'Maskenlegende';

  @override
  String get perceptionUnavailable => 'Masken nicht verfügbar';

  @override
  String get driveSave => 'Sichern';

  @override
  String get driveSaveIncident => 'Vorfall speichern';

  @override
  String driveSaveHint(int seconds) {
    return 'Sichert die letzten $seconds Sekunden des Dashcam-Videos';
  }

  @override
  String get driveSaving => 'Vorfall wird gesichert …';

  @override
  String hudRecManualLabel(String time) {
    return 'Aufnahme läuft, $time';
  }

  @override
  String get driveRecord => 'Aufnahme';

  @override
  String get driveRecordStartA11y => 'Aufnahme starten';

  @override
  String driveRecordStopA11y(String time) {
    return 'Aufnahme beenden, $time aufgenommen';
  }

  @override
  String get driveRecordHint =>
      'Nimmt durchgehend auf, bis Sie sie beenden, einschließlich der letzten 5 Sekunden';

  @override
  String get driveRecordFailed => 'Aufnahme konnte nicht gestartet werden';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aufnahme gesichert · $count Teile',
      one: 'Aufnahme gesichert',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Aufnahme beendet: Speicher fast voll',
      'max_duration': 'Aufnahme beendet: maximale Länge erreicht',
      'camera_stopped': 'Aufnahme mit der Kamera beendet',
      'background': 'Aufnahme beendet: Die App wurde in den Hintergrund gelegt',
      'thermal': 'Aufnahme beendet: Das Telefon ist zu heiß',
      'other': 'Aufnahme beendet',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Vorfall gesichert · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Ansehen';

  @override
  String get driveSaveFailed => 'Der Vorfall konnte nicht gespeichert werden.';

  @override
  String get driveSaveNotRunning =>
      'Die Aufnahme hat noch nicht begonnen – warten Sie, bis die Kamera gestartet ist, und versuchen Sie es erneut.';

  @override
  String get driveSaveTestFootage =>
      'Das Testvideo wird nicht aufgezeichnet. Das Speichern von Vorfällen funktioniert mit der Live-Kamera.';

  @override
  String get driveSaveStorageFull =>
      'Der Speicher Ihres iPhones ist voll. Geben Sie Speicherplatz frei oder löschen Sie ältere Clips.';

  @override
  String get driveSaveIoError =>
      'Der Clip konnte nicht in den Speicher geschrieben werden.';

  @override
  String get driveClips => 'Clips';

  @override
  String get driveSettings => 'Einstellungen';

  @override
  String get driveViewSwitcher => 'Fahransichten';

  @override
  String get driveLocationDenied =>
      'Standort ist deaktiviert – Geschwindigkeit, Karten und Routen sind nicht verfügbar.';

  @override
  String get driveCameraDenied =>
      'Kamerazugriff ist deaktiviert – Erkennung und Aufnahme sind nicht verfügbar.';

  @override
  String get driveRecorderFallback =>
      'Aufnahme ohne Ton: Der Mikrofonzugriff ist deaktiviert.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Aufnahmeeinstellungen wurden angepasst: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Ihr iPhone ist heiß. Die KI läuft langsamer, um abzukühlen – halten Sie es aus der direkten Sonne und in die Nähe einer Lüftung.';

  @override
  String get drivePowerThermalCritical =>
      'Ihr iPhone ist zu heiß. Die KI-Erkennung ist pausiert, bis es abgekühlt ist; die Aufnahme läuft nach Möglichkeit weiter.';

  @override
  String get drivePowerLowPower =>
      'Stromsparmodus ist aktiv – die KI läuft mit reduzierter Rate.';

  @override
  String get drivePowerBatteryLow =>
      'Der Akku ist niedrig – schließen Sie Ihr iPhone während der Fahrt an eine Stromquelle an.';

  @override
  String get onboardingTitle1 => 'Mehr sehen auf jeder Fahrt.';

  @override
  String get onboardingBody1 =>
      'Machen Sie Ihr iPhone zur intelligenten Dashcam und zum Begleiter für mehr Aufmerksamkeit beim Fahren.';

  @override
  String get onboardingTitle2 => 'Intelligenz in jedem Bild.';

  @override
  String get onboardingBody2 =>
      'Erkennen Sie unterstützte Fahrzeuge, Personen, Fahrräder und Verkehrssignale direkt auf Ihrem iPhone.';

  @override
  String get onboardingTitle3 => 'Eine Straße. Viele Perspektiven.';

  @override
  String get onboardingBody3 =>
      'Wechseln Sie zwischen Live-Erkennung, virtuellen Fahransichten, interaktiven Karten und Parkvisualisierung.';

  @override
  String get onboardingTitle4 => 'Behalten Sie die Momente, die zählen.';

  @override
  String get onboardingBody4 =>
      'Sichern Sie aktuelles Dashcam-Video, prüfen Sie Vorfälle und teilen Sie Aufnahmen.';

  @override
  String get onboardingTitle5 => 'Sicherheit und Datenschutz';

  @override
  String get onboardingSafety1 =>
      'Corvista ist eine Hilfe für mehr Aufmerksamkeit beim Fahren. Behalten Sie die Straße im Blick.';

  @override
  String get onboardingSafety2 =>
      'Die App steuert Ihr Fahrzeug nicht und ersetzt nicht Ihr eigenes Urteil.';

  @override
  String get onboardingSafety3 =>
      'Erkennungen und Schätzungen können ungenau sein oder ausbleiben.';

  @override
  String get onboardingSafety4 =>
      'Die Kameraverarbeitung erfolgt auf Ihrem iPhone – Videos werden nicht hochgeladen.';

  @override
  String get onboardingSafety5 =>
      'Karten, Suche, Routen und Wetter benötigen eine Internetverbindung.';

  @override
  String get onboardingSafety6 =>
      'Befestigen Sie Ihr iPhone sicher, sodass es Ihre Sicht nicht verdeckt.';

  @override
  String get onboardingSafety7 =>
      'Schließen Sie die Einrichtung ab, bevor Sie losfahren.';

  @override
  String get onboardingAcknowledge =>
      'Ich verstehe, dass Corvista eine Hilfe für mehr Aufmerksamkeit ist und ich weiterhin für sicheres Fahren verantwortlich bin.';

  @override
  String get onboardingReadSafety => 'Vollständige Sicherheitshinweise lesen';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingAgree => 'Fortfahren';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Seite $current von $total';
  }

  @override
  String get permTitle => 'Berechtigungen';

  @override
  String get permIntro =>
      'Corvista fragt nur nach dem, was die jeweilige Funktion benötigt. Sie können dies jederzeit in den Einstellungen ändern.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Erforderlich für Erkennung, Dashcam-Aufnahme und Parkansicht. Das Video wird auf Ihrem iPhone verarbeitet.';

  @override
  String get permLocationTitle => 'Standort';

  @override
  String get permLocationBody =>
      'Wird für GPS-Geschwindigkeit, Karte, Routen, Wetter und die Standortangabe gesicherter Clips verwendet. Nur während Sie die App nutzen.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'Spracherkennung wird nur angefragt, wenn Sie den Abbruch per Sprache für Notfallhinweise aktivieren.';

  @override
  String get permRequired => 'Erforderlich';

  @override
  String get permOptional => 'Optional';

  @override
  String get permAllow => 'Erlauben';

  @override
  String get permGranted => 'Erlaubt';

  @override
  String get permDenied => 'Verweigert';

  @override
  String get permLimited => 'Eingeschränkt';

  @override
  String get permRestricted => 'Beschränkt';

  @override
  String get permStart => 'Fahrt starten';

  @override
  String get permCameraNeeded =>
      'Sie können ohne Kamerazugriff fortfahren, aber Erkennung und Aufnahme funktionieren erst, wenn Sie ihn in den Einstellungen erlauben.';

  @override
  String get permSetupIntro =>
      'Corvista braucht diese Freigaben, um vollständig zu funktionieren. Tippe auf Alle erlauben, dann fragt iOS nacheinander danach. Du kannst sie jederzeit in den Einstellungen ändern.';

  @override
  String get permCameraLine =>
      'Erforderlich für Erkennung, Dashcam-Aufnahme und die Parkansicht. Das Video wird auf deinem iPhone verarbeitet und nie hochgeladen.';

  @override
  String get permLocationLine =>
      'GPS-Geschwindigkeit, Karte, Routen, Wetter und der Speicherort der Clips. Nur während du die App nutzt.';

  @override
  String get permMicLine =>
      'Kabinenton in Vorfall-Clips und das Erkennen deiner Abbruchphrase bei einem Notfallalarm.';

  @override
  String get permSpeechTitle => 'Spracherkennung';

  @override
  String get permSpeechLine =>
      'Erkennt deine Abbruchphrase während des Notfall-Countdowns, wenn unterstützt direkt auf deinem iPhone.';

  @override
  String get permAllowAll => 'Alle erlauben';

  @override
  String permAsking(String permission) {
    return '$permission wird angefragt …';
  }

  @override
  String get permSomeDenied =>
      'Einige Freigaben sind deaktiviert. Aktiviere sie in den Einstellungen, um diese Funktionen zu nutzen.';

  @override
  String get permNotNow => 'Nicht jetzt';

  @override
  String get tourLabel => 'Rundgang durch den Fahrbildschirm';

  @override
  String tourProgress(int current, int total) {
    return 'Schritt $current von $total';
  }

  @override
  String get tourNext => 'Weiter';

  @override
  String get tourBack => 'Zurück';

  @override
  String get tourSkip => 'Rundgang überspringen';

  @override
  String get tourFinish => 'Losfahren';

  @override
  String get tourWelcomeTitle => 'Dein Kurzrundgang';

  @override
  String get tourWelcomeBody =>
      'Eine Minute für das Wichtigste auf dem Fahrbildschirm. Am besten im Stand.';

  @override
  String get tourHudTitle => 'Deine Instrumentenleiste';

  @override
  String get tourHudSpeed => 'Die Geschwindigkeit kommt vom GPS.';

  @override
  String get tourHudRec =>
      'REC zeigt, wie viele Sekunden Videomaterial im Puffer liegen.';

  @override
  String get tourHudAi =>
      'Der KI-Chip zeigt das Modell, wie viele Objekte es sieht, und einen Punkt: grün läuft, gelb eingeschränkt, rot gestoppt.';

  @override
  String get tourSaveTitle => 'Vorfall speichern';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista hält einen fortlaufenden Puffer der letzten $seconds Sekunden Video vor. Er wird ständig überschrieben, daher bleibt nichts erhalten, solange du nicht auf Speichern tippst. Gespeicherte Clips bleiben auf diesem iPhone, unter Clips.';
  }

  @override
  String get tourRecordTitle => 'Die ganze Fahrt aufnehmen';

  @override
  String get tourRecordBody =>
      'Tippen Sie auf Aufnahme, um durchgehend zu filmen, bis Sie stoppen. Lange Fahrten werden in 5-Minuten-Teilen in Clips gesichert, und Vorfall speichern funktioniert während der Aufnahme weiter.';

  @override
  String get tourViewsTitle => 'Fünf Arten, die Straße zu sehen';

  @override
  String get tourViewDetection =>
      'Live-Kamera mit Rahmen um unterstützte Objekte.';

  @override
  String get tourViewVirtual =>
      'Eine vereinfachte 3D-Szene aus den Erkennungen.';

  @override
  String get tourViewMap => 'Apple Maps mit Suche und Abbiegehinweisen.';

  @override
  String get tourViewParking => 'Kamera plus Nahbereichsansicht von oben.';

  @override
  String get tourViewPerception => 'Straßen- und Objektmasken.';

  @override
  String get tourMapTitle => 'Suche und Abbiegehinweise';

  @override
  String get tourMapBody =>
      'Öffne Karte, tippe auf die Suchleiste und wähle ein Ziel. Wähle eine Route und tippe auf Start für die Abbiegehinweise. Internetverbindung erforderlich.';

  @override
  String get tourClipsTitle => 'Clips';

  @override
  String get tourClipsBody =>
      'Gespeicherte Vorfälle ansehen, umbenennen, teilen oder löschen. Clips bleiben auf deinem iPhone, solange du sie nicht teilst.';

  @override
  String get tourSettingsTitle => 'Einstellungen';

  @override
  String get tourSettingsBody =>
      'Passe Sprachwarnungen und deren Empfindlichkeit, Aufnahmequalität und Pufferlänge an und richte den Notfallmodus ein: ein experimenteller Aufprallalarm mit Abbruch-Countdown.';

  @override
  String get tourSafetyTitle => 'Bevor du losfährst';

  @override
  String get tourSafety1 =>
      'Befestige dein iPhone sicher und so, dass es dir nicht die Sicht versperrt.';

  @override
  String get tourSafety2 =>
      'Bediene die App nicht während der Fahrt. Richte alles im Stand ein.';

  @override
  String get tourSafety3 =>
      'Erkennungen und Zonen sind Schätzungen. Sie können falsch sein oder fehlen.';

  @override
  String get tourSafety4 => 'Du bleibst für sicheres Fahren verantwortlich.';

  @override
  String get helpTakeTour => 'Rundgang starten';

  @override
  String get helpTakeTourSub =>
      'Eine Minute geführter Blick auf den Fahrbildschirm.';

  @override
  String get tripsTitle => 'Fahrten';

  @override
  String get tripsOpen => 'Fahrtenbuch';

  @override
  String get tripsEmptyTitle => 'Noch keine Fahrten';

  @override
  String get tripsEmptyBody =>
      'Fahrten werden automatisch aufgezeichnet, solange du mit Corvista fährst: Strecke, Zeit, Geschwindigkeit und deine Route.';

  @override
  String get tripsDisabledBody =>
      'Das Fahrtenbuch ist aus, daher werden neue Fahrten nicht aufgezeichnet. Aktiviere es, um ein privates Protokoll deiner Routen auf diesem iPhone zu führen.';

  @override
  String get tripsEnable => 'Fahrtenbuch aktivieren';

  @override
  String get tripsToday => 'Heute';

  @override
  String get tripsYesterday => 'Gestern';

  @override
  String tripsRecordingNow(String distance) {
    return 'Fahrt wird aufgezeichnet · $distance';
  }

  @override
  String tripsTimeRange(String start, String end) {
    return '$start – $end';
  }

  @override
  String tripsPlaceRange(String start, String end) {
    return '$start → $end';
  }

  @override
  String tripsIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Vorfälle',
      one: '1 Vorfall',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Warnungen',
      one: '1 Warnung',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fahrten',
      one: '1 Fahrt',
      zero: 'Keine Fahrten',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Strecke';

  @override
  String get tripsStatDuration => 'Dauer';

  @override
  String get tripsStatMoving => 'Fahrzeit';

  @override
  String get tripsStatAvgSpeed => 'Ø Tempo';

  @override
  String get tripsStatMaxSpeed => 'Höchsttempo';

  @override
  String get tripsDetections => 'Erkennungen';

  @override
  String get tripsNoDetections =>
      'Auf dieser Fahrt wurden keine Straßenobjekte protokolliert.';

  @override
  String get tripsTimeline => 'Verlauf';

  @override
  String get tripsEventStart => 'Fahrt gestartet';

  @override
  String get tripsEventEnd => 'Fahrt beendet';

  @override
  String get tripsEventAlert => 'Sprachwarnung';

  @override
  String get tripsEventIncident => 'Vorfall-Clip gespeichert';

  @override
  String get tripsEventEmergency => 'Möglicher Unfall erkannt';

  @override
  String get tripsEventNavStart => 'Navigation gestartet';

  @override
  String get tripsEventArrive => 'Ziel erreicht';

  @override
  String get tripsEventReroute => 'Route neu berechnet';

  @override
  String get tripsEventRecording => 'Aufnahme gesichert';

  @override
  String get tripsOpenClip => 'Clip öffnen';

  @override
  String get tripsTrackPreview => 'GPS-Spur';

  @override
  String get tripsRenameTitle => 'Fahrt umbenennen';

  @override
  String get tripsRenameHint => 'Fahrtname';

  @override
  String get tripsFavorite => 'Zu Favoriten hinzufügen';

  @override
  String get tripsUnfavorite => 'Aus Favoriten entfernen';

  @override
  String get tripsShareGpx => 'GPX teilen';

  @override
  String get tripsShareFailed => 'Diese Fahrt konnte nicht geteilt werden.';

  @override
  String get tripsDelete => 'Fahrt löschen';

  @override
  String get tripsDeleteConfirmTitle => 'Diese Fahrt löschen?';

  @override
  String get tripsDeleteConfirmBody =>
      'Route und Statistiken werden von diesem iPhone entfernt. Vorfall-Clips dieser Fahrt bleiben erhalten.';

  @override
  String get tripsDeleted => 'Fahrt gelöscht';

  @override
  String get tripsNotFound => 'Diese Fahrt ist nicht mehr verfügbar.';

  @override
  String get tripsPrivacyNote =>
      'Nur auf diesem iPhone gespeichert. Es wird nichts hochgeladen.';

  @override
  String get settingsSectionTrips => 'Fahrtenbuch';

  @override
  String get settingsTripLog => 'Fahrten aufzeichnen';

  @override
  String get settingsTripLogSubtitle =>
      'Speichert deine Route und Fahrstatistiken nur auf diesem iPhone.';

  @override
  String get settingsTripRetention => 'Fahrten aufbewahren';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tage',
      one: '1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 Jahr';

  @override
  String get settingsRetentionForever => 'Für immer';

  @override
  String get settingsTripRetentionFooter =>
      'Ältere Fahrten werden beim Start von Corvista automatisch gelöscht.';

  @override
  String get settingsViewTrips => 'Fahrten ansehen';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours Std. $minutes Min.';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes Min.';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista-Fahrt $date';
  }

  @override
  String get settingsFreeUpSpace => 'Speicher freigeben';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Entfernt temporäre Dateien und Caches. Gespeicherte Clips und Fahrten bleiben erhalten.';

  @override
  String settingsFreedBytes(String size) {
    return '$size freigegeben';
  }

  @override
  String get settingsNothingToFree =>
      'Caches geleert – keine temporären Dateien zu entfernen.';

  @override
  String get settingsSectionPrivacyData => 'Datenschutz & Daten';

  @override
  String get settingsPrivacyDataFooter =>
      'Clips, Fahrten und Einstellungen werden nur auf diesem iPhone gespeichert. Sie verlassen es nur, wenn Sie sie selbst teilen.';

  @override
  String get settingsDeleteAllData => 'Alle Daten löschen';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Clips, Fahrten, Kontakte und Einstellungen von diesem iPhone löschen';

  @override
  String get deleteAllTitle => 'Alle Daten löschen?';

  @override
  String get deleteAllMessage =>
      'Dadurch werden von diesem iPhone endgültig entfernt:\n• Vorfall-Clips und Vorschaubilder\n• Fahrtenprotokoll und GPS-Strecken\n• Notfallkontakte und Notfallereignisse\n• Erkennungsprotokolle und das Diagnoseprotokoll\n• Einstellungen und letzte Ziele\n• Temporärer Aufnahmepuffer und Cache\n\nDies kann nicht rückgängig gemacht werden. Corvista beginnt danach wieder bei den Willkommensbildschirmen.';

  @override
  String get deleteAllConfirm => 'Alles löschen';

  @override
  String get deleteAllInProgress => 'Wird gelöscht …';

  @override
  String get deleteAllDone => 'Alle Daten gelöscht';

  @override
  String get deleteAllPartial =>
      'Einige Objekte konnten nicht gelöscht werden. Versuchen Sie es erneut in den Einstellungen.';

  @override
  String get diagLogSection => 'Diagnoseprotokoll';

  @override
  String get diagLogFooter =>
      'Fehler werden nur auf diesem iPhone aufgezeichnet, ohne Standorte, Kontaktnamen oder Telefonnummern. Es wird nichts gesendet, sofern Sie das Protokoll nicht selbst teilen.';

  @override
  String get diagLogShare => 'Diagnoseprotokoll teilen';

  @override
  String get diagLogEmpty => 'Leer';

  @override
  String get diagLogClear => 'Protokoll löschen';

  @override
  String get diagLogClearTitle => 'Diagnoseprotokoll löschen?';

  @override
  String get diagLogClearBody =>
      'Gespeicherte Fehlereinträge werden von diesem iPhone gelöscht.';

  @override
  String get diagLogCleared => 'Diagnoseprotokoll gelöscht';

  @override
  String get diagLogShareFailed =>
      'Das Diagnoseprotokoll konnte nicht geteilt werden.';

  @override
  String get privacyControls2 =>
      'Einstellungen › Datenschutz & Daten › Alle Daten löschen entfernt alle Clips, Fahrten, Kontakte, Protokolle und Einstellungen, die Corvista auf diesem iPhone gespeichert hat.';

  @override
  String get parkingZoneStop => 'Stopp';

  @override
  String get parkingZoneVeryClose => 'Sehr nah';

  @override
  String get parkingZoneClose => 'Nah';

  @override
  String get parkingZoneNothingClose => 'Nichts in der Nähe erkannt';

  @override
  String get parkingNotDetected =>
      'Wände, Pfeiler, Pfosten und Bordsteine werden nicht erkannt';

  @override
  String get parkingApprox => 'ca.';

  @override
  String get parkingSideLeft => 'Links';

  @override
  String get parkingSideCenter => 'Mitte';

  @override
  String get parkingSideRight => 'Rechts';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Nur Ansicht der Frontkamera — kein 360°-System';

  @override
  String get parkingMuteBeeps => 'Signaltöne aus';

  @override
  String get parkingUnmuteBeeps => 'Signaltöne ein';

  @override
  String get parkingAbout => 'Über die Parkansicht';

  @override
  String get parkingLimitationsDetail =>
      'Es wird nur der Bereich vor der Kamera überwacht. Der Detektor erkennt Autos, Busse und Lkw, Personen, Fahrräder und Motorräder. Wände, Pfeiler, Pfosten, Bordsteine, Poller, Schranken und niedrige Hindernisse werden NICHT erkannt, und die Motorhaube kann den Boden direkt davor verdecken. Entfernungen sind grobe Schätzungen anhand einer einzigen Kamera (Größe und Position des Objekts) und können stark abweichen. Stille oder „Nichts in der Nähe erkannt“ bedeutet nicht, dass der Weg frei ist – schauen Sie immer um sich und nutzen Sie Ihre Spiegel.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Nähe nach Seite: links $left, Mitte $center, rechts $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Fehler werden in einem privaten Protokoll auf diesem iPhone festgehalten (ohne Standorte, Kontaktnamen oder Telefonnummern). Es wird nie automatisch gesendet; Sie können es unter Einstellungen › Diagnose teilen oder löschen.';
}
