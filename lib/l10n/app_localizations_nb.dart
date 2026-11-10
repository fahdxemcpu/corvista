// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Se mer av hver tur.';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get commonDelete => 'Slett';

  @override
  String get commonSave => 'Lagre';

  @override
  String get commonBack => 'Tilbake';

  @override
  String get commonClose => 'Lukk';

  @override
  String get commonRetry => 'Prøv igjen';

  @override
  String get commonOpenSettings => 'Åpne Innstillinger';

  @override
  String get commonLoading => 'Laster inn…';

  @override
  String get commonError => 'Noe gikk galt.';

  @override
  String commonErrorDetail(String message) {
    return 'Noe gikk galt: $message';
  }

  @override
  String get commonOn => 'På';

  @override
  String get commonOff => 'Av';

  @override
  String get commonRename => 'Gi nytt navn';

  @override
  String get commonShare => 'Del';

  @override
  String get commonNotAvailable => 'Ikke tilgjengelig';

  @override
  String get commonTestFootage => 'TESTOPPTAK';

  @override
  String get zoneVeryClose => 'Svært nær';

  @override
  String get zoneClose => 'Nær';

  @override
  String get zoneMedium => 'Middels';

  @override
  String get zoneFar => 'Langt unna';

  @override
  String get zoneUnknown => 'Ukjent';

  @override
  String get classPerson => 'Person';

  @override
  String get classBicycle => 'Sykkel';

  @override
  String get classMotorcycle => 'Motorsykkel';

  @override
  String get classCar => 'Kjøretøy';

  @override
  String get classBus => 'Buss';

  @override
  String get classTrafficLight => 'Trafikklys';

  @override
  String get classStopSign => 'Stoppskilt';

  @override
  String get viewDetection => 'Registrering';

  @override
  String get viewVirtual => 'Virtuell';

  @override
  String get viewMap => 'Kart';

  @override
  String get viewParking => 'Parkering';

  @override
  String get viewPerception => 'Perception';

  @override
  String get unitKmh => 'km/t';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Rød';

  @override
  String get lightYellow => 'Gul';

  @override
  String get lightGreen => 'Grønn';

  @override
  String get lightUnknown => 'Ukjent';

  @override
  String get clipsTitle => 'Klipp';

  @override
  String get clipsSelect => 'Velg';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valgt',
      one: '1 valgt',
      zero: 'Velg klipp',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Velg alle';

  @override
  String get clipsDeselectAll => 'Fjern alle valg';

  @override
  String get clipsDeleteSelected => 'Slett valgte';

  @override
  String get clipsGridView => 'Rutenettvisning';

  @override
  String get clipsListView => 'Listevisning';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slette $count klipp?',
      one: 'Slette dette klippet?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Videoene fjernes permanent fra iPhonen din. Dette kan ikke angres.',
      one: 'Videoen fjernes permanent fra iPhonen din. Dette kan ikke angres.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp er slettet',
      one: 'Klippet er slettet',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Ingen klipp ennå';

  @override
  String get clipsEmptyBody =>
      'Mens du kjører, lagrer Corvista en kort rullerende buffer. Trykk på Lagre hendelse for å beholde de siste sekundene med opptak her.';

  @override
  String get clipsLoadError => 'Kunne ikke laste inn klippene dine.';

  @override
  String get clipsStorageTitle => 'Lagring';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Klipp $clips · Buffer $buffer · $free ledig';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lagrede klipp',
      one: '1 lagret klipp',
      zero: 'Ingen lagrede klipp',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'iPhonen din har lite lagringsplass igjen. Nye hendelser kan mislykkes å lagre.';

  @override
  String get clipsMissingFile => 'Filen mangler';

  @override
  String get clipsEmergencyBadge => 'Støt';

  @override
  String clipsUntitled(String date) {
    return 'Hendelse · $date';
  }

  @override
  String get clipsAudio => 'Lyd tatt opp';

  @override
  String get clipsFavorite => 'Favoritt';

  @override
  String get clipsUnfavorite => 'Fjern fra favoritter';

  @override
  String get clipsLocation => 'Posisjon lagret';

  @override
  String clipsOpenClip(String title) {
    return 'Åpne klippet $title';
  }

  @override
  String get playerNotFoundTitle => 'Fant ikke klippet';

  @override
  String get playerNotFoundBody => 'Klippet kan ha blitt slettet.';

  @override
  String get playerMissingTitle => 'Videofilen mangler';

  @override
  String get playerMissingBody =>
      'Opptaket for dette klippet finnes ikke lenger på iPhonen din. Du kan fjerne oppføringen fra galleriet.';

  @override
  String get playerRemoveEntry => 'Fjern oppføring';

  @override
  String get playerLoadError => 'Denne videoen kan ikke spilles av.';

  @override
  String get playerPlay => 'Spill av';

  @override
  String get playerPause => 'Pause';

  @override
  String get playerReplay => 'Spill av igjen';

  @override
  String get playerRenameTitle => 'Gi klippet nytt navn';

  @override
  String get playerRenameHint => 'Klippnavn';

  @override
  String get playerRenamed => 'Klippet har fått nytt navn';

  @override
  String get playerFavorited => 'Lagt til i favoritter';

  @override
  String get playerUnfavorited => 'Fjernet fra favoritter';

  @override
  String get playerShareFailed => 'Kunne ikke dele dette klippet.';

  @override
  String get playerDetails => 'Detaljer';

  @override
  String get playerDate => 'Tatt opp';

  @override
  String get playerDuration => 'Varighet';

  @override
  String get playerResolution => 'Oppløsning';

  @override
  String get playerSize => 'Filstørrelse';

  @override
  String get playerAudio => 'Lyd';

  @override
  String get playerAudioYes => 'Tatt opp';

  @override
  String get playerAudioNo => 'Ikke tatt opp';

  @override
  String get playerReason => 'Lagret via';

  @override
  String get playerReasonManual => 'Knappen Lagre hendelse';

  @override
  String get playerReasonEmergency => 'Registrering av mulig støt';

  @override
  String get playerReasonRecovered => 'Gjenopprettet etter avbrudd';

  @override
  String get playerSpeed => 'GPS-fart ved lagring';

  @override
  String get playerLocation => 'Posisjon';

  @override
  String get playerOpenInMaps => 'Åpne i Kart';

  @override
  String get playerBack => 'Tilbake';

  @override
  String get playerMore => 'Flere handlinger';

  @override
  String get clipsFilterLabel => 'Vis';

  @override
  String get clipsFilterAll => 'Alle';

  @override
  String get clipsFilterRecordings => 'Opptak';

  @override
  String get clipsFilterIncidents => 'Hendelser';

  @override
  String get clipsFilterEmergency => 'Nødsituasjoner';

  @override
  String get clipsFilterFavorites => 'Favoritter';

  @override
  String get clipsSort => 'Sorter';

  @override
  String get clipsSortNewest => 'Nyeste først';

  @override
  String get clipsSortOldest => 'Eldste først';

  @override
  String get clipsSortLongest => 'Lengste først';

  @override
  String get clipsSortLargest => 'Største først';

  @override
  String get clipsToday => 'I dag';

  @override
  String get clipsYesterday => 'I går';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp',
      one: '1 klipp',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Ingen klipp i denne kategorien ennå.';

  @override
  String get clipsFavoritesEmpty =>
      'Stjernemerk et klipp for å ha det her for rask tilgang.';

  @override
  String get clipsKindRecording => 'Opptak';

  @override
  String get clipsKindIncident => 'Hendelse';

  @override
  String get clipsKindEmergency => 'Nødsituasjon';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Tur · $time';
  }

  @override
  String get clipsOpenTrip => 'Åpne turen klippet ble tatt opp på';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used brukt · $free ledig';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Klipp bruker $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opptak',
      one: '1 opptak',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hendelser',
      one: '1 hendelse',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nødsituasjoner',
      one: '1 nødsituasjon',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Frigjør plass';

  @override
  String get clipsStorageLowGentle =>
      'Mindre enn 2 GB ledig. Frigjør plass eller fjern klipp du ikke trenger, så opptaket går problemfritt.';

  @override
  String get clipsSaveToPhotos => 'Lagre i Bilder';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp',
      one: '1 klipp',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slette $count klipp ($size)?',
      one: 'Slette dette klippet ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Lagrer $done av $total i Bilder…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp lagret i Bilder',
      one: 'Lagret i Bilder',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved lagret i Bilder · $failed kunne ikke lagres';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista har ikke tillatelse til å legge til videoer i Bilder. Du kan tillate det i Innstillinger.';

  @override
  String get clipsPhotosFailed => 'Kunne ikke lagre i Bilder.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp lagt til i favoritter',
      one: 'Lagt til i favoritter',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp fjernet fra favoritter',
      one: 'Fjernet fra favoritter',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (trimmet)';
  }

  @override
  String get playerTrim => 'Trim';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Type';

  @override
  String get playerReasonRecording => 'Opptaksknapp';

  @override
  String get trimTitle => 'Trim klipp';

  @override
  String get trimHint =>
      'Dra i håndtakene for å velge delen som skal beholdes. Det opprinnelige klippet forblir uendret.';

  @override
  String get trimStartHandle => 'Trimstart';

  @override
  String get trimEndHandle => 'Trimslutt';

  @override
  String trimSelection(String duration) {
    return '$duration valgt';
  }

  @override
  String get trimSave => 'Lagre som nytt klipp';

  @override
  String get trimSaving => 'Lagrer trimmet klipp…';

  @override
  String get trimSaved => 'Trimmet klipp lagret';

  @override
  String get trimOpenNew => 'Åpne';

  @override
  String get trimFailed => 'Kunne ikke trimme klippet.';

  @override
  String get trimStorageFull =>
      'Ikke nok ledig plass til å lagre det trimmede klippet.';

  @override
  String get trimPreview => 'Spill av utvalget';

  @override
  String get settingsTitle => 'Innstillinger';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Varsler';

  @override
  String get settingsSectionAlertCategories => 'Varselkategorier';

  @override
  String get settingsSectionRecording => 'Opptak';

  @override
  String get settingsSectionDriving => 'Kjøring';

  @override
  String get settingsSectionPower => 'Strøm';

  @override
  String get settingsSectionEmergency => 'Nødsituasjon';

  @override
  String get settingsSectionAppearance => 'Utseende';

  @override
  String get settingsSectionLanguage => 'Språk';

  @override
  String get settingsSectionInformation => 'Informasjon';

  @override
  String get settingsCameraLens => 'Kameralinse';

  @override
  String get settingsLensWide => 'Vidvinkel';

  @override
  String get settingsLensUltraWide => 'Ultravidvinkel';

  @override
  String get settingsLensTelephoto => 'Tele';

  @override
  String get settingsLensUnavailable => 'Ikke tilgjengelig på denne iPhonen';

  @override
  String get settingsStabilization => 'Stabilisering';

  @override
  String get settingsStabAuto => 'Automatisk';

  @override
  String get settingsStabOff => 'Av';

  @override
  String get settingsStabStandard => 'Standard';

  @override
  String get settingsStabCinematic => 'Filmatisk';

  @override
  String get settingsOverlayOpacity => 'Overleggets opasitet';

  @override
  String get settingsShowFps => 'Vis ytelsesstatistikk';

  @override
  String get settingsShowFpsSubtitle =>
      'Bildefrekvens og inferenstid i registreringsvisningen';

  @override
  String get settingsCameraFooter =>
      'Endringer i linse og stabilisering trer i kraft neste gang kameraet starter.';

  @override
  String get settingsAiModel => 'AI-modell';

  @override
  String get settingsConfidence => 'Registreringssikkerhet';

  @override
  String get settingsTracking => 'Objektsporing';

  @override
  String get settingsTrackingSubtitle =>
      'Holder objekter stabile mellom bilder';

  @override
  String get settingsShowLabels => 'Vis etiketter';

  @override
  String get settingsShowConfidence => 'Vis sikkerhet';

  @override
  String get settingsSegmentationOpacity => 'Perception-maskens opasitet';

  @override
  String get settingsAiFooter =>
      'Lavere sikkerhet viser flere objekter, men også flere feilregistreringer. Registreringer kan være unøyaktige.';

  @override
  String get settingsVoiceAlerts => 'Talevarsler';

  @override
  String get settingsVoiceLanguage => 'Talespråk';

  @override
  String get settingsVoiceLanguageAuto => 'Samme som appens språk';

  @override
  String get settingsVoice => 'Stemme';

  @override
  String get settingsVoiceDefault => 'Systemstandard';

  @override
  String get settingsVoiceQualityEnhanced => 'Forbedret';

  @override
  String get settingsVoiceQualityPremium => 'Høy kvalitet';

  @override
  String get settingsNoVoices =>
      'Ingen stemme er installert for dette språket. Legg til en i iOS Innstillinger › Tilgjengelighet › Opplest innhold.';

  @override
  String get settingsAlertPedestrian => 'Fotgjengere';

  @override
  String get settingsAlertCyclist => 'Syklister';

  @override
  String get settingsAlertMotorcycle => 'Motorsykler';

  @override
  String get settingsAlertBus => 'Busser';

  @override
  String get settingsAlertVehicleClose => 'Kjøretøy svært nær foran';

  @override
  String get settingsAlertTrafficLight => 'Skifte i trafikklys';

  @override
  String get settingsAlertTrafficMoving => 'Trafikken foran beveger seg';

  @override
  String get settingsAlertStopSign => 'Stoppskilt';

  @override
  String get settingsSensitivity => 'Følsomhet';

  @override
  String get settingsSensitivityLow => 'Lav';

  @override
  String get settingsSensitivityMedium => 'Middels';

  @override
  String get settingsSensitivityHigh => 'Høy';

  @override
  String get settingsCooldown => 'Gjentakelsesintervall';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Stemmevolum';

  @override
  String get settingsQuietMode => 'Stille modus';

  @override
  String get settingsQuietModeSubtitle =>
      'Bare de viktigste varslene leses opp';

  @override
  String get settingsTestVoice => 'Test stemmen';

  @override
  String get settingsTestVoiceDone => 'Spiller av et eksempelvarsel…';

  @override
  String get settingsParkingBeeps => 'Parkeringspiping';

  @override
  String get settingsBeepVolume => 'Pipevolum';

  @override
  String get settingsAlertsFooter =>
      'Varsler er bare en hjelp. Følg alltid med på veien – stillhet betyr ikke at veien er fri.';

  @override
  String get settingsRecordingProfile => 'Opptakskvalitet';

  @override
  String get settingsProfileStandard => 'Standard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Hendelsesbuffer';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds sekunder';
  }

  @override
  String get settingsManualMaxLength => 'Maks. lengde for manuelt opptak';

  @override
  String get settingsManualMaxUnlimited => 'Ubegrenset';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Ta opp lyd';

  @override
  String get settingsRecordAudioSubtitle =>
      'Tar med kupélyd i lagrede hendelser';

  @override
  String get settingsMicDenied =>
      'Mikrofontilgang er av. Tillat den i Innstillinger for å ta opp lyd.';

  @override
  String get settingsWatermark => 'Corvista-vannmerke';

  @override
  String get settingsTimestamp => 'Dato- og tidsstempel';

  @override
  String get settingsSaveLocation => 'Lagre posisjon med klipp';

  @override
  String get settingsStorage => 'Lagring og klipp';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp',
      one: '1 klipp',
      zero: 'Ingen klipp',
    );
    return '$_temp0 · $used brukt · $free ledig';
  }

  @override
  String get settingsRecordingFooter =>
      'Den rullerende bufferen blir på iPhonen din og overskrives fortløpende. Ingenting tas opp i bakgrunnen.';

  @override
  String get settingsDefaultView => 'Standardvisning';

  @override
  String get settingsUnits => 'Enheter';

  @override
  String get settingsShowCompass => 'Vis kompass';

  @override
  String get settingsHudStyle => 'HUD-stil';

  @override
  String get settingsHudCustomize => 'Tilpass HUD';

  @override
  String get settingsDrivingSide => 'Kjøreretning';

  @override
  String get settingsDrivingSideAuto => 'Automatisk';

  @override
  String get settingsDrivingSideRight => 'Høyre';

  @override
  String get settingsDrivingSideLeft => 'Venstre';

  @override
  String get settingsVirtualStyle => 'Stil for virtuell visning';

  @override
  String get settingsVirtualMinimal => 'Minimal';

  @override
  String get settingsVirtualPerspective => 'Perspektiv';

  @override
  String get settingsVirtualHighContrast => 'Høy kontrast';

  @override
  String get settingsKeepScreenOn => 'Hold skjermen på under kjøring';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Vis veibeskrivelse på låseskjermen og i Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Opptaket ble satt på pause mens Corvista var i bakgrunnen';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'På pause';

  @override
  String get liveActivityDashcamOff => 'Kamera av';

  @override
  String get liveActivityEnded => 'Navigasjonen er avsluttet';

  @override
  String get liveActivityEta => 'Ankomst';

  @override
  String get settingsAutoRecenter => 'Sentrer kartet automatisk';

  @override
  String get settingsHudStyleClassic => 'Klassisk';

  @override
  String get settingsHudStyleGrid => 'Rutenett';

  @override
  String get settingsHudStyleMinimal => 'Minimal';

  @override
  String get settingsHudStylePerformance => 'Ytelse';

  @override
  String get settingsHudStyleNavigation => 'Navigasjon';

  @override
  String get settingsHudStyleNight => 'Natt';

  @override
  String get settingsHudStyleHighContrast => 'Høy kontrast';

  @override
  String get settingsPowerMode => 'Strømmodus';

  @override
  String get settingsPowerBalanced => 'Balansert';

  @override
  String get settingsPowerPerformance => 'Ytelse';

  @override
  String get settingsPowerSaver => 'Strømsparing';

  @override
  String get settingsPowerFooter =>
      'Corvista senker AI-frekvensen og de visuelle effektene automatisk når iPhonen blir varm eller batteriet er lavt.';

  @override
  String get settingsThermal => 'Temperaturstatus';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Varm';

  @override
  String get settingsThermalSerious => 'Het';

  @override
  String get settingsThermalCritical => 'Kritisk';

  @override
  String get settingsBattery => 'Batteri';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Lader';
  }

  @override
  String get settingsLowPowerMode =>
      'Lavstrømmodus er på – AI kjører med redusert frekvens.';

  @override
  String get settingsAiRate => 'Gjeldende AI-frekvens';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Støtregistrering';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'På · $seconds s nedtelling';
  }

  @override
  String get settingsEmergencyFooter =>
      'Eksperimentell. Erstatter ikke nødetater.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeDark => 'Mørkt';

  @override
  String get settingsThemeLight => 'Lyst';

  @override
  String get settingsReduceMotion => 'Reduser bevegelse';

  @override
  String get settingsReduceMotionSubtitle =>
      'Minimerer animasjoner i hele appen';

  @override
  String get settingsAppLanguage => 'Appspråk';

  @override
  String get settingsPrivacyPolicy => 'Personvernerklæring';

  @override
  String get settingsTerms => 'Bruksvilkår';

  @override
  String get settingsHelp => 'Hjelp';

  @override
  String get settingsSupport => 'Kontakt kundestøtte';

  @override
  String get settingsLicenses => 'Åpen kildekode-lisenser';

  @override
  String get settingsSupportUnavailable =>
      'Kunne ikke åpne Mail. Skriv til support@corvista.app.';

  @override
  String get settingsSafety => 'Sikkerhetsinformasjon';

  @override
  String get settingsDiagnostics => 'Diagnostikk';

  @override
  String get settingsVersion => 'Versjon';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Tilpass HUD';

  @override
  String get hudCustomPreview => 'Forhåndsvisning · eksempelverdier';

  @override
  String get hudCustomStyle => 'Stil';

  @override
  String get hudCustomElements => 'Elementer';

  @override
  String get hudCustomSpeed => 'Fart';

  @override
  String get hudCustomHeading => 'Retning og kompass';

  @override
  String get hudCustomClock => 'Klokke';

  @override
  String get hudCustomBattery => 'Batteri og temperatur';

  @override
  String get hudCustomDetections => 'AI-status og registreringer';

  @override
  String get hudCustomWeather => 'Vær';

  @override
  String get hudCustomAppearance => 'Størrelse og opasitet';

  @override
  String get hudCustomSize => 'Størrelse';

  @override
  String get hudCustomOpacity => 'Opasitet';

  @override
  String get hudCustomFooter =>
      'Advarsler, for eksempel om overoppheting, vises alltid, selv når elementer er skjult.';

  @override
  String get hudCustomDescClassic => 'Balansert instrumentpanel';

  @override
  String get hudCustomDescGrid => 'Perspektivrutenett over veien';

  @override
  String get hudCustomDescMinimal => 'Bare fart, ingenting annet';

  @override
  String get hudCustomDescPerformance => 'Fartsbue med sanntidsavlesninger';

  @override
  String get hudCustomDescNavigation => 'Neste manøver først';

  @override
  String get hudCustomDescNight => 'Dempet og rødtonet for nattkjøring';

  @override
  String get hudCustomDescHighContrast => 'Maksimal lesbarhet i sterk sol';

  @override
  String get languageTitle => 'Språk';

  @override
  String get languageSystem => 'Systemstandard';

  @override
  String get languageSystemSubtitle => 'Følg språket på iPhonen din';

  @override
  String get languageFooter =>
      'Flere språk kommer. Språket for talevarsler kan angis separat under Varsler.';

  @override
  String get diagTitle => 'Diagnostikk';

  @override
  String get diagPerformance => 'Ytelse';

  @override
  String get diagInference => 'Inferenstid';

  @override
  String get diagDetectHz => 'Registreringsfrekvens';

  @override
  String get diagCameraFps => 'Kameraets bildefrekvens';

  @override
  String get diagMemory => 'Minne';

  @override
  String get diagDropped => 'Tapte bilder';

  @override
  String get diagSegmentation => 'Segmenteringstid';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Status';

  @override
  String get diagSource => 'Kilde';

  @override
  String get diagSourceCamera => 'Live kamera';

  @override
  String get diagSourceFile => 'Testopptaksfil';

  @override
  String get diagResolution => 'Bufferstørrelse';

  @override
  String get diagLens => 'Linse';

  @override
  String get diagError => 'Siste feil';

  @override
  String get diagModel => 'AI-modell';

  @override
  String get diagModelLoad => 'Modellens innlastingstid';

  @override
  String get diagPower => 'Strøm';

  @override
  String get diagSegHz => 'Segmenteringsfrekvens';

  @override
  String get diagReduced => 'Reduserte effekter';

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
  String get diagCamStarting => 'Starter';

  @override
  String get diagCamRunning => 'Kjører';

  @override
  String get diagCamInterrupted => 'Avbrutt';

  @override
  String get diagCamStopped => 'Stoppet';

  @override
  String get diagCamUnavailable => 'Utilgjengelig';

  @override
  String get diagCamPermissionDenied => 'Tillatelse nektet';

  @override
  String get diagCamError => 'Feil';

  @override
  String get diagTestFootage => 'Testopptak';

  @override
  String get diagTestFootageBody =>
      'Kjør ekte registrering på enheten på en lokal videofil i stedet for kameraet. Alle visninger merker det TESTOPPTAK.';

  @override
  String get diagPathLabel => 'Sti til videofil';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Bruk Documents/test_drive.mp4';

  @override
  String get diagRun => 'Kjør testopptak';

  @override
  String get diagRunStarted =>
      'Testopptaket er startet. Åpne kjørevisningen for å se det.';

  @override
  String get diagBackToCamera => 'Tilbake til live kamera';

  @override
  String get diagDebugOnly =>
      'Testopptak er bare tilgjengelig i utviklingsversjoner.';

  @override
  String get diagFileMissing => 'Det finnes ingen fil på den stien.';

  @override
  String get emergencySetupTitle => 'Støtregistrering';

  @override
  String get emergencyExperimental => 'Eksperimentell';

  @override
  String get emergencyIntro =>
      'Under en kjøretur kan Corvista følge med på et mulig kraftig støt ved hjelp av iPhonens bevegelsessensorer. Hvis et støt registreres, starter en nedtelling. Hvis du ikke avbryter den, tilbyr Corvista å ringe nødetatene og sende melding til kontaktene dine.';

  @override
  String get emergencyDisclaimer1 =>
      'Erstatter ikke nødetater eller kjøretøyets egen kollisjonsregistrering.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS ber deg alltid bekrefte før en samtale startes eller en melding sendes.';

  @override
  String get emergencyDisclaimer3 =>
      'Støt kan bli oversett, og hard bremsing eller humper kan forveksles med et støt.';

  @override
  String get emergencyParkedWarning =>
      'Fullfør dette oppsettet mens du står parkert. Innstillingene er låst mens kjøretøyet beveger seg.';

  @override
  String get emergencyEnable => 'Aktiver støtregistrering';

  @override
  String get emergencyEnableSubtitle => 'Aktiv bare under en kjøretur';

  @override
  String get emergencyNeedNumber => 'Legg først til et nødnummer.';

  @override
  String get emergencyContacts => 'Nødkontakter';

  @override
  String get emergencyAddContact => 'Legg til kontakt';

  @override
  String get emergencyNoContacts =>
      'Ingen kontakter ennå. Kontakter får bare melding etter at du har bekreftet den.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Fjerne $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Vedkommende tilbys ikke lenger som mottaker etter et støt.';

  @override
  String get emergencyRemove => 'Fjern';

  @override
  String get emergencyContactsError => 'Kunne ikke laste inn kontakter.';

  @override
  String get emergencyNumber => 'Nødnummer';

  @override
  String get emergencyNumberHint => 'f.eks. 112 eller 911';

  @override
  String get emergencyMessage => 'Meldingsmal';

  @override
  String get emergencyMessageDefault =>
      'Jeg kan ha vært utsatt for en bilulykke. Denne meldingen er forberedt av Corvista og inneholder min sist kjente posisjon hvis den er tilgjengelig.';

  @override
  String get emergencyMessageHint =>
      'La feltet stå tomt for å bruke standardmeldingen.';

  @override
  String get emergencyCountdown => 'Nedtellingens lengde';

  @override
  String get emergencyVoiceCancel => 'Avbryt med stemmen';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Si «Jeg er OK» eller «Avbryt» under nedtellingen. Bruker talegjenkjenning på enheten der det er tilgjengelig.';

  @override
  String get emergencyVoicePermDenied =>
      'Tilgang til mikrofon og talegjenkjenning kreves for å avbryte med stemmen.';

  @override
  String get emergencyAutoSave => 'Lagre hendelsesklipp automatisk';

  @override
  String get emergencyTest => 'Test nedtelling (ingen samtale)';

  @override
  String get emergencyTestBody =>
      'Kjører et simulert støt slik at du kan se nedtellingen. Ingen samtaler eller meldinger blir noen gang sendt i testmodus.';

  @override
  String get emergencyNotSet => 'Ikke angitt';

  @override
  String get emergencyAlertHeadline => 'Mulig kraftig støt registrert.';

  @override
  String get emergencyAlertSubtitle => 'Er du OK?';

  @override
  String get emergencyAlertCancel => 'Jeg er OK – Avbryt';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds sekunder igjen',
      one: '1 sekund igjen',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => 'Lytter – si «Jeg er OK» for å avbryte';

  @override
  String emergencyAlertHeard(String text) {
    return 'Hørte: «$text»';
  }

  @override
  String get emergencyAlertEscalated => 'Ingen respons. Velg hva du vil gjøre:';

  @override
  String get emergencyAlertCall => 'Ring nødetatene';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Ringer $number. iOS ber deg bekrefte.';
  }

  @override
  String get emergencyAlertMessage => 'Send melding til kontakter';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Åpner en forberedt melding. Du velger selv om den sendes.';

  @override
  String get emergencyAlertTestMode =>
      'Testmodus – ingen samtale vil bli startet';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'Jeg er OK – Lukk';

  @override
  String get emergencyMsgSent => 'Meldingen er sendt.';

  @override
  String get emergencyMsgCancelled => 'Meldingen ble ikke sendt.';

  @override
  String get emergencyMsgFailed => 'Kunne ikke sende meldingen.';

  @override
  String get emergencyMsgUnavailable =>
      'Meldinger er ikke tilgjengelige på denne enheten.';

  @override
  String emergencyCallFailed(String number) {
    return 'Kunne ikke starte samtalen. Ring $number selv.';
  }

  @override
  String get modelsTitle => 'AI-modeller';

  @override
  String get modelsIntro =>
      'Alle modeller følger med appen og kjører helt på iPhonen din. Kamerabildet ditt forlater aldri enheten.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Live: $ms ms per bilde · $hz registreringer/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Lastet inn på $ms ms';
  }

  @override
  String get modelsEfficientName => 'Effektiv';

  @override
  String get modelsEfficientDesc =>
      'Rask, kompakt detektor tilpasset lange kjøreturer med lav varmeutvikling og lavt batteriforbruk.';

  @override
  String get modelsEnhancedName => 'Forbedret';

  @override
  String get modelsEnhancedDesc =>
      'Større detektor som finner mindre og fjernere objekter, til en høyere strømkostnad.';

  @override
  String get modelsSegmentationName => 'Segmentering';

  @override
  String get modelsSegmentationDesc =>
      'Kombinerer rask registrering med masker for veidekke og objekter i Perception-visningen.';

  @override
  String get modelsNoneName => 'AI på pause';

  @override
  String get modelsNoneDesc =>
      'Kamera og opptak fortsetter uten objektregistrering. Lavest strømforbruk.';

  @override
  String get modelsGenericDesc => 'Modell for objektregistrering på enheten.';

  @override
  String get modelsFunctionDetection =>
      'Registrerer kjøretøy, personer, sykler, motorsykler, busser, trafikklys og stoppskilt';

  @override
  String get modelsFunctionSegmentation =>
      'Legger til masker for veidekke og objekter';

  @override
  String get modelsFunctionNone => 'Ingen registrering; bare dashcam-opptak';

  @override
  String get modelsSize => 'Størrelse';

  @override
  String get modelsInput => 'Inndata';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Fungerer med';

  @override
  String get modelsStatusInstalled => 'Installert (følger med)';

  @override
  String get modelsStatusNotInstalled => 'Ikke installert';

  @override
  String get modelsSelected => 'Valgt';

  @override
  String get modelsUse => 'Bruk denne modellen';

  @override
  String get modelsSwitching => 'Laster inn modell…';

  @override
  String modelsSwitched(String name) {
    return '$name er nå aktiv';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Målt på denne enheten: $ms ms i gjennomsnitt';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Ikke målt på denne enheten';

  @override
  String get modelsBenchmarkRun => 'Kjør ytelsestest';

  @override
  String get modelsBenchmarkRunning => 'Kjører ytelsestest…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Velg denne modellen for å teste den.';

  @override
  String get modelsBenchmarkDone => 'Ytelsestesten er fullført';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Ytelsestesten mislyktes: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Sist oppdatert $date';
  }

  @override
  String get safetyTitle => 'Sikkerhetsinformasjon';

  @override
  String get safetyIntro =>
      'Corvista er en hjelp til oppmerksomhet under kjøring. Appen styrer ikke kjøretøyet ditt og kan ikke erstatte din egen oppmerksomhet, ditt eget skjønn eller kjøretøyets sikkerhetssystemer.';

  @override
  String get safetyBeforeTitle => 'Før du kjører';

  @override
  String get safetyBefore1 =>
      'Fest iPhonen sikkert på en lovlig plassering som ikke blokkerer sikten, kollisjonsputer eller kontroller.';

  @override
  String get safetyBefore2 =>
      'Fullfør oppsettet, velg en visning og angi destinasjonen mens du står parkert.';

  @override
  String get safetyBefore3 =>
      'Koble til en lader på lengre turer, og unngå om mulig direkte sollys på telefonen.';

  @override
  String get safetyWhileTitle => 'Under kjøring';

  @override
  String get safetyWhile1 =>
      'Hold blikket på veien. Bruk de store kontrollene på skjermen bare når det er trygt og lovlig.';

  @override
  String get safetyWhile2 =>
      'Varsler er hjelpemidler, ikke advarsler du kan stole på. Stillhet betyr aldri at veien er fri.';

  @override
  String get safetyWhile3 =>
      'Følg trafikkreglene, signalene og skiltene – ikke appen – hvis de er uenige.';

  @override
  String get safetyLimitsTitle => 'Begrensninger';

  @override
  String get safetyLimits1 =>
      'Et enkelt telefonkamera ser bare det som er foran det. Objekter utenfor synsfeltet, skjulte eller svært nære registreres ikke.';

  @override
  String get safetyLimits2 =>
      'Registreringer kan utebli, komme sent eller være feil, spesielt om natten, i regn, tåke, blending eller med skitten frontrute.';

  @override
  String get safetyLimits3 =>
      'Bare støttede kategorier gjenkjennes: kjøretøy, busser, motorsykler, sykler, personer, trafikklys og stoppskilt. Kjørefeltlinjer i den virtuelle visningen er stiliserte, ikke registrerte kjørefelt.';

  @override
  String get safetyLimits4 =>
      'Nærhet vises som omtrentlige soner (Svært nær, Nær, Middels, Langt unna), aldri som målte avstander. Parkeringsvisningen erstatter ikke parkeringssensorer.';

  @override
  String get safetyHeatTitle => 'Varme og batteri';

  @override
  String get safetyHeat1 =>
      'Kontinuerlig bruk av kamera og AI varmer opp iPhonen. Corvista senker analysefrekvensen når enheten blir varm og viser en advarsel. Hvis iOS overopphetes, kan kameraet stoppe.';

  @override
  String get safetyEmergencyTitle => 'Nødfunksjon';

  @override
  String get safetyEmergency1 =>
      'Registrering av mulig støt er eksperimentell. Den kan overse reelle ulykker og kan utløses av andre hendelser.';

  @override
  String get safetyEmergency2 =>
      'Den kontakter aldri noen i det stille: iOS ber deg alltid bekrefte en samtale eller melding. Den erstatter ikke at du selv ringer nødetatene.';

  @override
  String get privacyTitle => 'Personvern';

  @override
  String get privacyIntro =>
      'Corvista er utformet for å holde kjøredataene dine på iPhonen din. Det finnes ingen Corvista-konto, og Corvista driver ikke egne servere.';

  @override
  String get privacyCameraTitle => 'Kamera og AI';

  @override
  String get privacyCamera1 =>
      'Objektregistrering, sporing og segmentering kjører helt på iPhonen din. Kamerabilder lastes aldri opp.';

  @override
  String get privacyCamera2 =>
      'Kameraet kjører bare mens Corvista er åpen på skjermen. Det settes på pause når appen går til bakgrunnen – det finnes ingen skjult bakgrunnsopptak.';

  @override
  String get privacyRecordingsTitle => 'Opptak';

  @override
  String get privacyRecordings1 =>
      'Den rullerende bufferen er midlertidig og overskrives fortløpende. Opptak lagres bare når du trykker på Lagre hendelse eller, hvis du aktiverer det, etter et mulig støt.';

  @override
  String get privacyRecordings2 =>
      'Lagrede klipp blir i Corvistas private lagring på iPhonen din. De forlater enheten bare når du velger Del. Hvis du sletter appen, slettes de også.';

  @override
  String get privacyRecordings3 =>
      'Lyd tas bare opp hvis du slår det på og gir mikrofontilgang.';

  @override
  String get privacyLocationTitle => 'Posisjon';

  @override
  String get privacyLocation1 =>
      'Posisjonen brukes mens appen er åpen, til fart, kart, ruter og vær. Hvis «Lagre posisjon» er på, lagres posisjonen på lagringstidspunktet sammen med klippet på enheten din.';

  @override
  String get privacyNetworkTitle => 'Nettverkstjenester';

  @override
  String get privacyNetwork1 =>
      'Apple Maps – kartvisning, stedssøk og ruter. Søketeksten din og omtrentlig posisjon sendes til Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) – gjeldende vær og timesvær for posisjonen din.';

  @override
  String get privacyNetwork4 =>
      'Corvista inneholder ingen reklame og ingen analyse eller sporing fra tredjeparter.';

  @override
  String get privacyEmergencyTitle => 'Nødkontakter';

  @override
  String get privacyEmergency1 =>
      'Kontakter du velger lagres i iOS-nøkkelringen på denne enheten. Avbrytelse med stemmen bruker talegjenkjenning på enheten der det er tilgjengelig. Samtaler og meldinger sendes først etter at du har bekreftet dem i iOS.';

  @override
  String get privacyControlsTitle => 'Dine valg';

  @override
  String get privacyControls1 =>
      'Du kan slette klipp når som helst under Klipp, og endre eller trekke tilbake tilgang til kamera, mikrofon, posisjon og tale i iOS Innstillinger.';

  @override
  String get termsTitle => 'Bruksvilkår';

  @override
  String get termsIntro =>
      'Ved å bruke Corvista godtar du disse vilkårene. Apples standard sluttbrukerlisensavtale (Licensed Application End User License Agreement) gjelder også.';

  @override
  String get termsUseTitle => 'Bruk av Corvista';

  @override
  String get termsUse1 =>
      'Corvista er en hjelp til oppmerksomhet under kjøring og et dashcam-hjelpemiddel. Du har til enhver tid det fulle ansvaret for å kjøre trygt og lovlig.';

  @override
  String get termsUse2 =>
      'Ikke bruk appen på måter som distraherer deg under kjøring. Fest enheten sikkert og lovlig.';

  @override
  String get termsAccuracyTitle => 'Ingen garanti for nøyaktighet';

  @override
  String get termsAccuracy1 =>
      'Registreringer, soner, varsler, kartmarkører, ruter og vær kan være ufullstendige, forsinkede eller feil. Corvista styrer ikke kjøretøyet ditt.';

  @override
  String get termsAccuracy2 =>
      'Nødfunksjonen er eksperimentell og kan unnlate å registrere et støt eller utløses ved en feil.';

  @override
  String get termsRecordingTitle => 'Lover om opptak';

  @override
  String get termsRecording1 =>
      'Lover om dashcam, lydopptak og filming av personer varierer fra land til land og region til region. Du er ansvarlig for å følge dem, også når du deler klipp.';

  @override
  String get termsLiabilityTitle => 'Ansvar';

  @override
  String get termsLiability1 =>
      'Appen leveres «som den er». I den grad loven tillater det, er utvikleren ikke ansvarlig for ulykker, tap, bøter eller skader som oppstår ved bruk av appen eller ved å stole på resultatene dens.';

  @override
  String get termsChangesTitle => 'Endringer';

  @override
  String get termsChanges1 =>
      'Disse vilkårene kan bli oppdatert med nye versjoner av appen. Fortsatt bruk etter en oppdatering betyr at du godtar de reviderte vilkårene.';

  @override
  String get helpTitle => 'Hjelp';

  @override
  String get helpIntro =>
      'Svar på vanlige spørsmål. For sikkerhetsveiledning, se Sikkerhetsinformasjon.';

  @override
  String get helpQSave => 'Hvordan beholder jeg opptak av en hendelse?';

  @override
  String get helpASaveBuffer =>
      'Trykk på den store Lagre hendelse-knappen i kjørevisningen. Corvista lagrer de siste 20 eller 30 sekundene av den rullerende bufferen (ditt valg under Innstillinger › Opptak) i Klipp.';

  @override
  String get helpQWhere => 'Hvor lagres klippene mine?';

  @override
  String get helpAWhere =>
      'I Corvistas private lagring på iPhonen din. De lastes aldri opp. Bruk Del i avspilleren for å sende eller eksportere et klipp.';

  @override
  String get helpQZones => 'Hvor nøyaktige er nærhetssonene?';

  @override
  String get helpAZones =>
      'Sonene er grove anslag fra ett enkelt kamera basert på typiske objektstørrelser. Se på dem som omtrentlige pekepinner, aldri som avstander.';

  @override
  String get helpQSlow => 'Hvorfor blir registreringen tregere?';

  @override
  String get helpASlow =>
      'Når iPhonen blir varm, batteriet er lavt eller Lavstrømmodus er på, senker Corvista analysefrekvensen for å beskytte enheten. Du kan endre strømmodus i Innstillinger.';

  @override
  String get helpQMap => 'Kartet, søket eller været fungerer ikke.';

  @override
  String get helpAMap =>
      'Disse funksjonene krever internettilkobling og posisjonstilgang. Sjekk tilkoblingen og tillat posisjon for Corvista i iOS Innstillinger.';

  @override
  String get helpQSimulator => 'Kameraet vises som utilgjengelig.';

  @override
  String get helpASimulator =>
      'Sørg for at kameratilgang er tillatt i iOS Innstillinger og at ingen annen app bruker kameraet. I iOS Simulator finnes det ikke noe kamera. Der kan en lokal testvideo brukes i stedet.';

  @override
  String get emergencyMsgNoContacts => 'Legg først til en nødkontakt.';

  @override
  String get cameraStarting => 'Starter kameraet…';

  @override
  String get cameraInterrupted => 'Kameraet er satt på pause';

  @override
  String get cameraInterruptedBody =>
      'iOS satte kameraet på pause, for eksempel under en samtale eller mens en annen app bruker det. Det gjenopptas automatisk.';

  @override
  String get cameraUnavailable => 'Kameraet er utilgjengelig';

  @override
  String get cameraUnavailableBody =>
      'Ingen kamera er tilgjengelig på denne enheten. Registrerings-, opptaks- og parkeringsvisningene krever bakkameraet.';

  @override
  String get cameraRunTestFootage => 'Kjør testopptak';

  @override
  String get cameraPermissionDenied => 'Kameratilgang er av';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista trenger kameraet til registrering, dashcam-opptak og parkeringsvisninger. Slå på kameratilgang i Innstillinger.';

  @override
  String get cameraError => 'Kamerafeil';

  @override
  String get cameraStopped => 'Kameraet er stoppet';

  @override
  String get cameraStart => 'Start kameraet';

  @override
  String get cameraFocusHint => 'Trykk for å fokusere';

  @override
  String get cameraPreviewLabel =>
      'Live kameravisning med registrerte objekter';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · AI $hz Hz · $ms ms · tapt $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Fart $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Ingen GPS-fart';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Retning $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Opptak av dashcam-buffer, $seconds av $target sekunder bufret';
  }

  @override
  String get hudRecIdle => 'REC av';

  @override
  String get hudRecSaving => 'Lagrer…';

  @override
  String get hudRecError => 'REC-feil';

  @override
  String get hudAiPaused => 'AI på pause';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objekter',
      one: '1 objekt',
      zero: 'Ingen objekter',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objekter',
      one: '1 objekt',
      zero: 'ingen objekter',
    );
    return 'AI-modell $model, $_temp0 registrert';
  }

  @override
  String get hudThermalSerious => 'Het – AI bremses';

  @override
  String get hudThermalCritical => 'For het – AI på pause';

  @override
  String hudBatteryLow(String percent) {
    return 'Batteri $percent';
  }

  @override
  String get hudLowPower => 'Lavstrømmodus';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Vær $temperature, $condition. Trykk for detaljer.';
  }

  @override
  String get hudNoGuidance =>
      'Søk etter en destinasjon i kartvisningen for å se veibeskrivelse her.';

  @override
  String get navArrived => 'Du er framme';

  @override
  String get navRerouting => 'Beregner ny rute…';

  @override
  String get navSearchHint => 'Søk etter destinasjon';

  @override
  String get navSearchFieldHint => 'Adresse, sted eller bedrift';

  @override
  String get navNoResults => 'Ingen samsvarende steder';

  @override
  String get navSearching => 'Søker…';

  @override
  String get navSearchStartTyping =>
      'Skriv inn en adresse eller et stedsnavn. Resultatene kommer fra Apple Maps og krever internettilkobling.';

  @override
  String get navErrorUnavailable =>
      'Søk og ruter er utilgjengelige – sjekk internettilkoblingen.';

  @override
  String get navErrorNoLocation =>
      'Venter på posisjonen din for å planlegge en rute.';

  @override
  String get navErrorPermission =>
      'Posisjonstilgang er av, så ruter kan ikke starte fra din posisjon.';

  @override
  String navErrorGeneric(String code) {
    return 'Kunne ikke laste inn ruter ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Ruter til $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Ankomst $time';
  }

  @override
  String get navStart => 'Start';

  @override
  String get navEnd => 'Avslutt';

  @override
  String get navEndLabel => 'Avslutt navigasjon';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration igjen';
  }

  @override
  String navAdvisory(String text) {
    return 'Merknad: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min',
      one: '1 min',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours t $minutes min';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Rute $index: $name';
  }

  @override
  String get weatherTitle => 'Vær';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Føles som $temperature';
  }

  @override
  String get weatherPrecipitation => 'Nedbør';

  @override
  String get weatherWind => 'Vind';

  @override
  String get weatherVisibility => 'Sikt';

  @override
  String get weatherHumidity => 'Luftfuktighet';

  @override
  String get weatherHourly => 'Kommende timer';

  @override
  String weatherAsOf(String time) {
    return 'Oppdatert $time';
  }

  @override
  String get weatherRefresh => 'Oppdater været';

  @override
  String get weatherUnavailable => 'Været er utilgjengelig akkurat nå.';

  @override
  String get weatherNoLocation => 'Været krever posisjonen din.';

  @override
  String get weatherLegal => 'Datakilder og juridisk';

  @override
  String weatherProvidedBy(String service) {
    return 'Værdata: $service';
  }

  @override
  String get weatherNow => 'Nå';

  @override
  String get virtualEmpty => 'Ingen støttede objekter registrert';

  @override
  String get virtualEmptyCameraOff =>
      'Den virtuelle visningen krever live kamera.';

  @override
  String get virtualLaneDisclaimer =>
      'Kjørefeltlinjene er illustrative, ikke registrerte.';

  @override
  String virtualNearest(String zone) {
    return 'Nærmest: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtuell veiscene: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'AI $status';
  }

  @override
  String get virtualStatusLive => 'live';

  @override
  String get virtualStatusPaused => 'på pause';

  @override
  String get virtualStatusCameraOff => 'Kamera av';

  @override
  String get virtualStatusTestFootage => 'Testopptak';

  @override
  String get virtualEmptyHint =>
      'Kjøretøy, personer, sykler, lys og stoppskilt vises her når de registreres.';

  @override
  String get mapRecenter => 'Sentrer';

  @override
  String get mapZoomIn => 'Zoom inn';

  @override
  String get mapZoomOut => 'Zoom ut';

  @override
  String get mapUnsupported =>
      'Det interaktive kartet er tilgjengelig på iPhone.';

  @override
  String get mapObjectsApprox => 'Objektmarkører viser omtrentlige posisjoner.';

  @override
  String get mapWeatherUnavailable => 'Været er utilgjengelig';

  @override
  String get navErrorNoRoute => 'Fant ingen rute til denne destinasjonen.';

  @override
  String get navDismiss => 'Lukk';

  @override
  String get navGo => 'Kjør';

  @override
  String get navFastest => 'Raskest';

  @override
  String get navThen => 'Deretter';

  @override
  String get navRecents => 'Nylige';

  @override
  String get navClearRecents => 'Fjern';

  @override
  String get navSearchSubmitHint =>
      'Trykk på Søk for å se alle samsvarende steder';

  @override
  String get navPlaces => 'Steder';

  @override
  String get navEtaLabel => 'ankomst';

  @override
  String get navTimeLeftLabel => 'igjen';

  @override
  String get navOverview => 'Oversikt';

  @override
  String get navMute => 'Slå av stemmen';

  @override
  String get navUnmute => 'Slå på stemmen';

  @override
  String get navEndConfirm => 'Avslutte navigasjonen?';

  @override
  String navEndConfirmBody(String place) {
    return 'Veiledningen til $place stopper.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Du er framme ved $place';
  }

  @override
  String get navDone => 'Ferdig';

  @override
  String get navWeakGps => 'Svakt GPS-signal';

  @override
  String get navLocationOff =>
      'Posisjon er av. Slå den på for å planlegge ruter og navigere.';

  @override
  String get navVoiceGuidance => 'Taleveiledning';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Om $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, og deretter $second';
  }

  @override
  String get navSpeakRerouting => 'Beregner ny rute';

  @override
  String get navSpeakArrived => 'Du er framme';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meter',
      one: '1 meter',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilometer',
      one: '1 kilometer',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fot',
      one: '1 fot',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yard',
      one: '1 yard',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Fortsett i $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Veibeskrivelse er ikke tilgjengelig for denne turen i denne regionen. Prøv en annen destinasjon.';

  @override
  String navContinueFor(String distance) {
    return 'Fortsett i $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value engelske mil',
      one: '1 engelsk mil',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Nærmest: $object · $zone';
  }

  @override
  String get parkingNothing => 'Ingenting registrert i bildet';

  @override
  String get parkingBeeps => 'Nærhetspiping';

  @override
  String get parkingVolume => 'Pipevolum';

  @override
  String get parkingLimitations =>
      'Ett enkelt kamera, ikke 360°. Objekter utenfor kameraets synsfelt registreres ikke. Erstatter ikke parkeringssensorer. Anslag kan være feil, og stillhet betyr ikke at området er fritt.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Nærhetsvisning ovenfra. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Original';

  @override
  String get perceptionModeBoxes => 'Bokser';

  @override
  String get perceptionModeMasks => 'Objektmasker';

  @override
  String get perceptionModeRoad => 'Veidekke';

  @override
  String get perceptionModeCombined => 'Kombinert';

  @override
  String get perceptionOpacity => 'Maskens opasitet';

  @override
  String get perceptionDisclaimer =>
      'Veidekkemasken er et omtrentlig visuelt lag. Den viser ikke kjørbart område eller kjørefelt.';

  @override
  String get perceptionNeedsModel =>
      'Velg segmenteringsmodellen for å se masker.';

  @override
  String get perceptionChooseModel => 'Velg modell';

  @override
  String get perceptionWaiting => 'Venter på det første segmenteringsbildet…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Bokser';

  @override
  String get perceptionShortObjects => 'Objekter';

  @override
  String get perceptionShortRoad => 'Vei';

  @override
  String get perceptionShortAll => 'Alle';

  @override
  String get perceptionModesLabel => 'Perception-lag';

  @override
  String get perceptionStatusWarmingUp => 'Varmer opp…';

  @override
  String get perceptionStatusLoadingModel => 'Laster modell…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Masker satt på pause';

  @override
  String get perceptionLegend => 'Maskeforklaring';

  @override
  String get perceptionUnavailable => 'Masker utilgjengelige';

  @override
  String get driveSave => 'Lagre';

  @override
  String get driveSaveIncident => 'Lagre hendelse';

  @override
  String driveSaveHint(int seconds) {
    return 'Lagrer de siste $seconds sekundene med dashcam-opptak';
  }

  @override
  String get driveSaving => 'Lagrer hendelsen…';

  @override
  String hudRecManualLabel(String time) {
    return 'Tar opp, $time';
  }

  @override
  String get driveRecord => 'Ta opp';

  @override
  String get driveRecordStartA11y => 'Start opptak';

  @override
  String driveRecordStopA11y(String time) {
    return 'Stopp opptak, $time tatt opp';
  }

  @override
  String get driveRecordHint =>
      'Tar opp kontinuerlig til du stopper, inkludert de siste 5 sekundene';

  @override
  String get driveRecordFailed => 'Kunne ikke starte opptaket';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Opptak lagret · $count deler',
      one: 'Opptak lagret',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Opptaket stoppet: lagringsplassen er nesten full',
      'max_duration': 'Opptaket stoppet: maksimal lengde nådd',
      'camera_stopped': 'Opptaket stoppet sammen med kameraet',
      'background': 'Opptaket stoppet: appen gikk til bakgrunnen',
      'thermal': 'Opptaket stoppet: telefonen er for varm',
      'other': 'Opptaket stoppet',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Hendelse lagret · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Vis';

  @override
  String get driveSaveFailed => 'Kunne ikke lagre hendelsen.';

  @override
  String get driveSaveNotRunning =>
      'Opptaket har ikke startet ennå – vent til kameraet har startet, og prøv igjen.';

  @override
  String get driveSaveTestFootage =>
      'Testopptak blir ikke tatt opp. Lagring av hendelser fungerer med live kamera.';

  @override
  String get driveSaveStorageFull =>
      'iPhonen din er tom for lagringsplass. Frigjør plass eller slett eldre klipp.';

  @override
  String get driveSaveIoError => 'Klippet kunne ikke skrives til lagringen.';

  @override
  String get driveClips => 'Klipp';

  @override
  String get driveSettings => 'Innstillinger';

  @override
  String get driveViewSwitcher => 'Kjørevisninger';

  @override
  String get driveLocationDenied =>
      'Posisjon er av – fart, kart og ruter er utilgjengelige.';

  @override
  String get driveCameraDenied =>
      'Kameratilgang er av – registrering og opptak er utilgjengelige.';

  @override
  String get driveRecorderFallback => 'Opptak uten lyd: mikrofontilgang er av.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Opptaksinnstillingene ble justert: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhonen din er het. AI kjører saktere for å kjøle seg ned – hold den unna direkte sol og nær en luftventil.';

  @override
  String get drivePowerThermalCritical =>
      'iPhonen din er for het. AI-registreringen er satt på pause til den har kjølt seg ned. Opptaket fortsetter hvis mulig.';

  @override
  String get drivePowerLowPower =>
      'Lavstrømmodus er på – AI kjører med redusert frekvens.';

  @override
  String get drivePowerBatteryLow =>
      'Batteriet er lavt – koble iPhonen til strøm under kjøring.';

  @override
  String get onboardingTitle1 => 'Se mer av hver tur.';

  @override
  String get onboardingBody1 =>
      'Gjør iPhonen din om til et intelligent dashcam og en ledsager som hjelper deg å være oppmerksom under kjøring.';

  @override
  String get onboardingTitle2 => 'Intelligens i hvert bilde.';

  @override
  String get onboardingBody2 =>
      'Gjenkjenn støttede kjøretøy, personer, sykler og veisignaler direkte på iPhonen din.';

  @override
  String get onboardingTitle3 => 'Én vei. Flere perspektiver.';

  @override
  String get onboardingBody3 =>
      'Bytt mellom live registrering, virtuelle kjørevisninger, interaktive kart og parkeringsvisualisering.';

  @override
  String get onboardingTitle4 => 'Behold øyeblikkene som teller.';

  @override
  String get onboardingBody4 =>
      'Lagre nylig dashcam-opptak, gå gjennom hendelser og del opptak.';

  @override
  String get onboardingTitle5 => 'Sikkerhet og personvern';

  @override
  String get onboardingSafety1 =>
      'Corvista er en hjelp til oppmerksomhet under kjøring. Hold blikket på veien.';

  @override
  String get onboardingSafety2 =>
      'Den styrer ikke kjøretøyet ditt og erstatter ikke ditt skjønn.';

  @override
  String get onboardingSafety3 =>
      'Registreringer og anslag kan være unøyaktige eller utebli.';

  @override
  String get onboardingSafety4 =>
      'Kamerabehandlingen skjer på iPhonen din – video lastes ikke opp.';

  @override
  String get onboardingSafety5 =>
      'Kart, søk, ruter og vær krever internettilkobling.';

  @override
  String get onboardingSafety6 =>
      'Fest iPhonen sikkert slik at den ikke blokkerer sikten.';

  @override
  String get onboardingSafety7 => 'Fullfør oppsettet før du begynner å kjøre.';

  @override
  String get onboardingAcknowledge =>
      'Jeg forstår at Corvista er en hjelp til oppmerksomhet, og at jeg selv har ansvaret for å kjøre trygt.';

  @override
  String get onboardingReadSafety => 'Les all sikkerhetsinformasjon';

  @override
  String get onboardingNext => 'Neste';

  @override
  String get onboardingSkip => 'Hopp over';

  @override
  String get onboardingAgree => 'Fortsett';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Side $current av $total';
  }

  @override
  String get permTitle => 'Tillatelser';

  @override
  String get permIntro =>
      'Corvista ber bare om det hver funksjon trenger. Du kan endre dem når som helst i Innstillinger.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Kreves for registrering, dashcam-opptak og parkeringsvisningen. Video behandles på iPhonen din.';

  @override
  String get permLocationTitle => 'Posisjon';

  @override
  String get permLocationBody =>
      'Brukes til GPS-fart, kartet, ruter, vær og til å merke lagrede klipp. Bare mens du bruker appen.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'Talegjenkjenning forespørres bare hvis du slår på avbrytelse med stemmen for nødvarsler.';

  @override
  String get permRequired => 'Kreves';

  @override
  String get permOptional => 'Valgfritt';

  @override
  String get permAllow => 'Tillat';

  @override
  String get permGranted => 'Tillatt';

  @override
  String get permDenied => 'Nektet';

  @override
  String get permLimited => 'Begrenset';

  @override
  String get permRestricted => 'Begrenset av systemet';

  @override
  String get permStart => 'Begynn å kjøre';

  @override
  String get permCameraNeeded =>
      'Du kan fortsette uten kameratilgang, men registrering og opptak fungerer ikke før du tillater det i Innstillinger.';

  @override
  String get permSetupIntro =>
      'Corvista trenger disse for å fungere fullt ut. Trykk på Tillat alle, så spør iOS om hver av dem etter tur. Du kan endre dem når som helst i Innstillinger.';

  @override
  String get permCameraLine =>
      'Kreves for registrering, dashcam-opptak og parkeringsvisningen. Video behandles på iPhonen din og lastes aldri opp.';

  @override
  String get permLocationLine =>
      'GPS-fart, kartet, ruter, vær og hvor klipp ble lagret. Bare mens du bruker appen.';

  @override
  String get permMicLine =>
      'Kupélyd i hendelsesklipp, og for å høre avbrytelsesfrasen din under et nødvarsel.';

  @override
  String get permSpeechTitle => 'Talegjenkjenning';

  @override
  String get permSpeechLine =>
      'Gjenkjenner avbrytelsesfrasen din under en nødnedtelling, på iPhonen din der det støttes.';

  @override
  String get permAllowAll => 'Tillat alle';

  @override
  String permAsking(String permission) {
    return 'Ber om $permission…';
  }

  @override
  String get permSomeDenied =>
      'Noen tillatelser er av. Slå dem på i Innstillinger for å bruke disse funksjonene.';

  @override
  String get permNotNow => 'Ikke nå';

  @override
  String get tourLabel => 'Omvisning i kjøreskjermen';

  @override
  String tourProgress(int current, int total) {
    return 'Trinn $current av $total';
  }

  @override
  String get tourNext => 'Neste';

  @override
  String get tourBack => 'Tilbake';

  @override
  String get tourSkip => 'Hopp over omvisningen';

  @override
  String get tourFinish => 'Begynn å kjøre';

  @override
  String get tourWelcomeTitle => 'Din raske omvisning';

  @override
  String get tourWelcomeBody =>
      'Et minutts titt på det viktigste på kjøreskjermen. Best mens du står parkert.';

  @override
  String get tourHudTitle => 'Instrumentstripen din';

  @override
  String get tourHudSpeed => 'Farten kommer fra GPS.';

  @override
  String get tourHudRec =>
      'REC viser hvor mange sekunder med opptak som er bufret.';

  @override
  String get tourHudAi =>
      'AI-brikken viser modellen, hvor mange objekter den ser, og en prikk: grønn kjører, gul begrenset, rød stoppet.';

  @override
  String get tourSaveTitle => 'Lagre hendelse';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista holder en rullerende buffer med de siste $seconds sekundene med video. Den overskrives hele tiden, så ingenting beholdes med mindre du trykker på Lagre. Lagrede klipp blir på denne iPhonen, under Klipp.';
  }

  @override
  String get tourRecordTitle => 'Ta opp hele turen';

  @override
  String get tourRecordBody =>
      'Trykk på Ta opp for å filme kontinuerlig til du stopper. Lange turer lagres i deler på 5 minutter i Klipp, og Lagre hendelse fungerer fortsatt mens du tar opp.';

  @override
  String get tourViewsTitle => 'Fem måter å se veien på';

  @override
  String get tourViewDetection =>
      'Live kamera med bokser rundt støttede objekter.';

  @override
  String get tourViewVirtual =>
      'En forenklet 3D-scene bygget fra registreringer.';

  @override
  String get tourViewMap => 'Apple Maps med søk og veibeskrivelse.';

  @override
  String get tourViewParking => 'Kamera pluss en nærhetsvisning ovenfra.';

  @override
  String get tourViewPerception => 'Masker for vei og objekter.';

  @override
  String get tourMapTitle => 'Søk og veibeskrivelse';

  @override
  String get tourMapBody =>
      'Åpne Kart, trykk på søkefeltet og velg en destinasjon. Velg en rute, og trykk deretter på Start for veibeskrivelse. Krever internettilkobling.';

  @override
  String get tourClipsTitle => 'Klipp';

  @override
  String get tourClipsBody =>
      'Gå gjennom, gi nytt navn, del eller slett lagrede hendelser. Klipp blir på iPhonen din med mindre du deler dem.';

  @override
  String get tourSettingsTitle => 'Innstillinger';

  @override
  String get tourSettingsBody =>
      'Finjuster talevarsler og følsomheten deres, opptakskvalitet og bufferlengde, og sett opp Nødmodus: et eksperimentelt støtvarsel med nedtelling som kan avbrytes.';

  @override
  String get tourSafetyTitle => 'Før du kjører';

  @override
  String get tourSafety1 =>
      'Fest iPhonen sikkert der den ikke blokkerer sikten.';

  @override
  String get tourSafety2 =>
      'Ikke bruk appen under kjøring. Sett opp alt mens du står parkert.';

  @override
  String get tourSafety3 =>
      'Registreringer og soner er anslag. De kan være feil eller utebli.';

  @override
  String get tourSafety4 => 'Du har fortsatt ansvaret for å kjøre trygt.';

  @override
  String get helpTakeTour => 'Ta omvisningen';

  @override
  String get helpTakeTourSub =>
      'En guidet titt på kjøreskjermen på ett minutt.';

  @override
  String get tripsTitle => 'Turer';

  @override
  String get tripsOpen => 'Turlogg';

  @override
  String get tripsEmptyTitle => 'Ingen turer ennå';

  @override
  String get tripsEmptyBody =>
      'Turer tas opp automatisk mens du kjører med Corvista – distanse, tid, fart og ruten du kjørte.';

  @override
  String get tripsDisabledBody =>
      'Turloggen er av, så nye turer tas ikke opp. Slå den på for å føre en privat logg over rutene dine på denne iPhonen.';

  @override
  String get tripsEnable => 'Slå på turlogg';

  @override
  String get tripsToday => 'I dag';

  @override
  String get tripsYesterday => 'I går';

  @override
  String tripsRecordingNow(String distance) {
    return 'Tar opp en tur · $distance';
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
      other: '$count hendelser',
      one: '1 hendelse',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count varsler',
      one: '1 varsel',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count turer',
      one: '1 tur',
      zero: 'Ingen turer',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Distanse';

  @override
  String get tripsStatDuration => 'Varighet';

  @override
  String get tripsStatMoving => 'Kjøretid';

  @override
  String get tripsStatAvgSpeed => 'Gjennomsnittsfart';

  @override
  String get tripsStatMaxSpeed => 'Maksfart';

  @override
  String get tripsDetections => 'Registreringer';

  @override
  String get tripsNoDetections =>
      'Ingen veiobjekter ble logget på denne turen.';

  @override
  String get tripsTimeline => 'Tidslinje';

  @override
  String get tripsEventStart => 'Turen startet';

  @override
  String get tripsEventEnd => 'Turen sluttet';

  @override
  String get tripsEventAlert => 'Talevarsel';

  @override
  String get tripsEventIncident => 'Hendelsesklipp lagret';

  @override
  String get tripsEventEmergency => 'Mulig ulykke registrert';

  @override
  String get tripsEventNavStart => 'Navigasjon startet';

  @override
  String get tripsEventArrive => 'Framme ved destinasjonen';

  @override
  String get tripsEventReroute => 'Ruten ble beregnet på nytt';

  @override
  String get tripsEventRecording => 'Opptak lagret';

  @override
  String get tripsOpenClip => 'Åpne klipp';

  @override
  String get tripsTrackPreview => 'GPS-spor';

  @override
  String get tripsRenameTitle => 'Gi turen nytt navn';

  @override
  String get tripsRenameHint => 'Turnavn';

  @override
  String get tripsFavorite => 'Legg til i favoritter';

  @override
  String get tripsUnfavorite => 'Fjern fra favoritter';

  @override
  String get tripsShareGpx => 'Del GPX';

  @override
  String get tripsShareFailed => 'Kunne ikke dele denne turen.';

  @override
  String get tripsDelete => 'Slett tur';

  @override
  String get tripsDeleteConfirmTitle => 'Slette denne turen?';

  @override
  String get tripsDeleteConfirmBody =>
      'Ruten og statistikken fjernes fra denne iPhonen. Hendelsesklipp fra turen beholdes.';

  @override
  String get tripsDeleted => 'Turen er slettet';

  @override
  String get tripsNotFound => 'Denne turen er ikke lenger tilgjengelig.';

  @override
  String get tripsPrivacyNote =>
      'Lagres bare på denne iPhonen. Ingenting lastes opp.';

  @override
  String get settingsSectionTrips => 'Turlogg';

  @override
  String get settingsTripLog => 'Ta opp turer';

  @override
  String get settingsTripLogSubtitle =>
      'Lagrer ruten og kjørestatistikken din bare på denne iPhonen.';

  @override
  String get settingsTripRetention => 'Behold turer i';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dager',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 år';

  @override
  String get settingsRetentionForever => 'For alltid';

  @override
  String get settingsTripRetentionFooter =>
      'Eldre turer slettes automatisk når Corvista starter.';

  @override
  String get settingsViewTrips => 'Se turer';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours t $minutes min';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes min';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista-tur $date';
  }

  @override
  String get settingsFreeUpSpace => 'Frigjør plass';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Fjerner midlertidige filer og hurtigbuffer. Lagrede klipp og turer beholdes.';

  @override
  String settingsFreedBytes(String size) {
    return '$size frigjort';
  }

  @override
  String get settingsNothingToFree =>
      'Hurtigbuffer tømt – ingen midlertidige filer å fjerne.';

  @override
  String get settingsSectionPrivacyData => 'Personvern og data';

  @override
  String get settingsPrivacyDataFooter =>
      'Klipp, turer og innstillinger lagres bare på denne iPhonen. De forlater den bare når du selv velger å dele dem.';

  @override
  String get settingsDeleteAllData => 'Slett alle data';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Slett klipp, turer, kontakter og innstillinger fra denne iPhonen';

  @override
  String get deleteAllTitle => 'Slette alle data?';

  @override
  String get deleteAllMessage =>
      'Dette fjerner permanent fra denne iPhonen:\n• Hendelsesklipp og miniatyrbilder\n• Turlogg og GPS-spor\n• Nødkontakter og nødhendelser\n• Deteksjonslogger og diagnostikklogg\n• Innstillinger og nylige destinasjoner\n• Midlertidig opptaksbuffer og hurtigbuffer\n\nDette kan ikke angres. Corvista starter deretter på nytt fra velkomstskjermene.';

  @override
  String get deleteAllConfirm => 'Slett alt';

  @override
  String get deleteAllInProgress => 'Sletter…';

  @override
  String get deleteAllDone => 'Alle data slettet';

  @override
  String get deleteAllPartial =>
      'Noen elementer kunne ikke slettes. Prøv igjen fra Innstillinger.';

  @override
  String get diagLogSection => 'Diagnostikklogg';

  @override
  String get diagLogFooter =>
      'Feil registreres bare på denne iPhonen, uten posisjoner, kontaktnavn eller telefonnumre. Ingenting sendes med mindre du selv deler loggen.';

  @override
  String get diagLogShare => 'Del diagnostikklogg';

  @override
  String get diagLogEmpty => 'Tom';

  @override
  String get diagLogClear => 'Tøm logg';

  @override
  String get diagLogClearTitle => 'Tømme diagnostikkloggen?';

  @override
  String get diagLogClearBody =>
      'Lagrede feilposter slettes fra denne iPhonen.';

  @override
  String get diagLogCleared => 'Diagnostikkloggen er tømt';

  @override
  String get diagLogShareFailed => 'Kunne ikke dele diagnostikkloggen.';

  @override
  String get privacyControls2 =>
      'Innstillinger › Personvern og data › Slett alle data sletter alle klipp, turer, kontakter, logger og innstillinger Corvista har lagret på denne iPhonen.';

  @override
  String get parkingZoneStop => 'Stopp';

  @override
  String get parkingZoneVeryClose => 'Veldig nær';

  @override
  String get parkingZoneClose => 'Nær';

  @override
  String get parkingZoneNothingClose => 'Ingenting nært oppdaget';

  @override
  String get parkingNotDetected =>
      'Vegger, pilarer, stolper og kantsteiner oppdages ikke';

  @override
  String get parkingApprox => 'ca.';

  @override
  String get parkingSideLeft => 'Venstre';

  @override
  String get parkingSideCenter => 'Midten';

  @override
  String get parkingSideRight => 'Høyre';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Kun visning fra frontkameraet — ikke et 360°-system';

  @override
  String get parkingMuteBeeps => 'Slå av pip';

  @override
  String get parkingUnmuteBeeps => 'Slå på pip';

  @override
  String get parkingAbout => 'Om parkeringsvisning';

  @override
  String get parkingLimitationsDetail =>
      'Bare området foran kameraet overvåkes. Detektoren gjenkjenner biler, busser og lastebiler, personer, sykler og motorsykler. Vegger, pilarer, stolper, kantsteiner, pullerter, bommer og lave hindringer oppdages IKKE, og panseret kan skjule bakken rett foran. Avstander er grove anslag fra ett kamera (objektets størrelse og posisjon) og kan være svært feil. Stillhet eller «Ingenting nært oppdaget» betyr ikke at veien er fri – se alltid deg rundt og bruk speilene.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Nærhet per side: venstre $left, midten $center, høyre $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Feil skrives til en privat logg på denne iPhonen (ingen posisjoner, kontaktnavn eller telefonnumre). Den sendes aldri automatisk; du kan dele eller tømme den under Innstillinger › Diagnostikk.';
}
