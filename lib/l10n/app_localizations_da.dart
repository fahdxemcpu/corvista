// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Se mere af hver tur.';

  @override
  String get commonCancel => 'Annuller';

  @override
  String get commonDelete => 'Slet';

  @override
  String get commonSave => 'Gem';

  @override
  String get commonBack => 'Tilbage';

  @override
  String get commonClose => 'Luk';

  @override
  String get commonRetry => 'Prøv igen';

  @override
  String get commonOpenSettings => 'Åbn Indstillinger';

  @override
  String get commonLoading => 'Indlæser…';

  @override
  String get commonError => 'Noget gik galt.';

  @override
  String commonErrorDetail(String message) {
    return 'Noget gik galt: $message';
  }

  @override
  String get commonOn => 'Til';

  @override
  String get commonOff => 'Fra';

  @override
  String get commonRename => 'Omdøb';

  @override
  String get commonShare => 'Del';

  @override
  String get commonNotAvailable => 'Ikke tilgængelig';

  @override
  String get commonTestFootage => 'TESTOPTAGELSE';

  @override
  String get zoneVeryClose => 'Meget tæt på';

  @override
  String get zoneClose => 'Tæt på';

  @override
  String get zoneMedium => 'Middel';

  @override
  String get zoneFar => 'Langt væk';

  @override
  String get zoneUnknown => 'Ukendt';

  @override
  String get classPerson => 'Person';

  @override
  String get classBicycle => 'Cykel';

  @override
  String get classMotorcycle => 'Motorcykel';

  @override
  String get classCar => 'Køretøj';

  @override
  String get classBus => 'Bus';

  @override
  String get classTrafficLight => 'Trafiklys';

  @override
  String get classStopSign => 'Stopskilt';

  @override
  String get viewDetection => 'Registrering';

  @override
  String get viewVirtual => 'Virtuel';

  @override
  String get viewMap => 'Kort';

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
  String get lightGreen => 'Grøn';

  @override
  String get lightUnknown => 'Ukendt';

  @override
  String get clipsTitle => 'Klip';

  @override
  String get clipsSelect => 'Vælg';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valgt',
      one: '1 valgt',
      zero: 'Vælg klip',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Vælg alle';

  @override
  String get clipsDeselectAll => 'Fravælg alle';

  @override
  String get clipsDeleteSelected => 'Slet valgte';

  @override
  String get clipsGridView => 'Gittervisning';

  @override
  String get clipsListView => 'Listevisning';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slet $count klip?',
      one: 'Slet dette klip?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Videoerne fjernes permanent fra din iPhone. Det kan ikke fortrydes.',
      one: 'Videoen fjernes permanent fra din iPhone. Det kan ikke fortrydes.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip slettet',
      one: 'Klip slettet',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Ingen klip endnu';

  @override
  String get clipsEmptyBody =>
      'Mens du kører, gemmer Corvista en kort rullende buffer. Tryk på Gem hændelse for at beholde de seneste sekunders optagelse her.';

  @override
  String get clipsLoadError => 'Dine klip kunne ikke indlæses.';

  @override
  String get clipsStorageTitle => 'Lager';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Klip $clips · Buffer $buffer · $free ledig';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gemte klip',
      one: '1 gemt klip',
      zero: 'Ingen gemte klip',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Din iPhone har ikke meget lagerplads tilbage. Nye hændelser kan muligvis ikke gemmes.';

  @override
  String get clipsMissingFile => 'Filen mangler';

  @override
  String get clipsEmergencyBadge => 'Stød';

  @override
  String clipsUntitled(String date) {
    return 'Hændelse · $date';
  }

  @override
  String get clipsAudio => 'Lyd optaget';

  @override
  String get clipsFavorite => 'Favorit';

  @override
  String get clipsUnfavorite => 'Fjern fra favoritter';

  @override
  String get clipsLocation => 'Position gemt';

  @override
  String clipsOpenClip(String title) {
    return 'Åbn klippet $title';
  }

  @override
  String get playerNotFoundTitle => 'Klippet blev ikke fundet';

  @override
  String get playerNotFoundBody => 'Klippet er muligvis blevet slettet.';

  @override
  String get playerMissingTitle => 'Videofilen mangler';

  @override
  String get playerMissingBody =>
      'Optagelsen til dette klip findes ikke længere på din iPhone. Du kan fjerne posten fra dit galleri.';

  @override
  String get playerRemoveEntry => 'Fjern post';

  @override
  String get playerLoadError => 'Videoen kan ikke afspilles.';

  @override
  String get playerPlay => 'Afspil';

  @override
  String get playerPause => 'Pause';

  @override
  String get playerReplay => 'Afspil igen';

  @override
  String get playerRenameTitle => 'Omdøb klip';

  @override
  String get playerRenameHint => 'Klipnavn';

  @override
  String get playerRenamed => 'Klippet er omdøbt';

  @override
  String get playerFavorited => 'Føjet til favoritter';

  @override
  String get playerUnfavorited => 'Fjernet fra favoritter';

  @override
  String get playerShareFailed => 'Klippet kunne ikke deles.';

  @override
  String get playerDetails => 'Detaljer';

  @override
  String get playerDate => 'Optaget';

  @override
  String get playerDuration => 'Varighed';

  @override
  String get playerResolution => 'Opløsning';

  @override
  String get playerSize => 'Filstørrelse';

  @override
  String get playerAudio => 'Lyd';

  @override
  String get playerAudioYes => 'Optaget';

  @override
  String get playerAudioNo => 'Ikke optaget';

  @override
  String get playerReason => 'Gemt via';

  @override
  String get playerReasonManual => 'Knappen Gem hændelse';

  @override
  String get playerReasonEmergency => 'Registrering af muligt stød';

  @override
  String get playerReasonRecovered => 'Gendannet efter afbrydelse';

  @override
  String get playerSpeed => 'GPS-hastighed ved lagring';

  @override
  String get playerLocation => 'Position';

  @override
  String get playerOpenInMaps => 'Åbn i Kort';

  @override
  String get playerBack => 'Tilbage';

  @override
  String get playerMore => 'Flere handlinger';

  @override
  String get clipsFilterLabel => 'Vis';

  @override
  String get clipsFilterAll => 'Alle';

  @override
  String get clipsFilterRecordings => 'Optagelser';

  @override
  String get clipsFilterIncidents => 'Hændelser';

  @override
  String get clipsFilterEmergency => 'Nødsituationer';

  @override
  String get clipsFilterFavorites => 'Favoritter';

  @override
  String get clipsSort => 'Sortér';

  @override
  String get clipsSortNewest => 'Nyeste først';

  @override
  String get clipsSortOldest => 'Ældste først';

  @override
  String get clipsSortLongest => 'Længste først';

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
      other: '$count klip',
      one: '1 klip',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Ingen klip i denne kategori endnu.';

  @override
  String get clipsFavoritesEmpty =>
      'Stjernemarkér et klip for at beholde det her til hurtig adgang.';

  @override
  String get clipsKindRecording => 'Optagelse';

  @override
  String get clipsKindIncident => 'Hændelse';

  @override
  String get clipsKindEmergency => 'Nødsituation';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Tur · $time';
  }

  @override
  String get clipsOpenTrip => 'Åbn turen, som klippet blev optaget på';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used brugt · $free ledig';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Klip fylder $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count optagelser',
      one: '1 optagelse',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hændelser',
      one: '1 hændelse',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nødsituationer',
      one: '1 nødsituation',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Frigør plads';

  @override
  String get clipsStorageLowGentle =>
      'Mindre end 2 GB ledig. Frigør plads, eller fjern klip, du ikke længere har brug for, så optagelsen kan fortsætte problemfrit.';

  @override
  String get clipsSaveToPhotos => 'Gem i Fotos';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip',
      one: '1 klip',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slet $count klip ($size)?',
      one: 'Slet dette klip ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Gemmer $done af $total i Fotos…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip gemt i Fotos',
      one: 'Gemt i Fotos',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved gemt i Fotos · $failed kunne ikke gemmes';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista har ikke tilladelse til at tilføje videoer til Fotos. Du kan tillade det i Indstillinger.';

  @override
  String get clipsPhotosFailed => 'Kunne ikke gemme i Fotos.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip føjet til favoritter',
      one: 'Føjet til favoritter',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip fjernet fra favoritter',
      one: 'Fjernet fra favoritter',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (beskåret)';
  }

  @override
  String get playerTrim => 'Beskær';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Type';

  @override
  String get playerReasonRecording => 'Optageknap';

  @override
  String get trimTitle => 'Beskær klip';

  @override
  String get trimHint =>
      'Træk i håndtagene for at vælge den del, der skal beholdes. Det oprindelige klip forbliver uændret.';

  @override
  String get trimStartHandle => 'Beskæringens start';

  @override
  String get trimEndHandle => 'Beskæringens slut';

  @override
  String trimSelection(String duration) {
    return '$duration valgt';
  }

  @override
  String get trimSave => 'Gem som nyt klip';

  @override
  String get trimSaving => 'Gemmer beskåret klip…';

  @override
  String get trimSaved => 'Beskåret klip gemt';

  @override
  String get trimOpenNew => 'Åbn';

  @override
  String get trimFailed => 'Kunne ikke beskære klippet.';

  @override
  String get trimStorageFull =>
      'Der er ikke nok ledig plads til at gemme det beskårne klip.';

  @override
  String get trimPreview => 'Afspil markering';

  @override
  String get settingsTitle => 'Indstillinger';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Advarsler';

  @override
  String get settingsSectionAlertCategories => 'Advarselskategorier';

  @override
  String get settingsSectionRecording => 'Optagelse';

  @override
  String get settingsSectionDriving => 'Kørsel';

  @override
  String get settingsSectionPower => 'Strøm';

  @override
  String get settingsSectionEmergency => 'Nødsituation';

  @override
  String get settingsSectionAppearance => 'Udseende';

  @override
  String get settingsSectionLanguage => 'Sprog';

  @override
  String get settingsSectionInformation => 'Information';

  @override
  String get settingsCameraLens => 'Kameralinse';

  @override
  String get settingsLensWide => 'Vidvinkel';

  @override
  String get settingsLensUltraWide => 'Ultravidvinkel';

  @override
  String get settingsLensTelephoto => 'Tele';

  @override
  String get settingsLensUnavailable => 'Ikke tilgængelig på denne iPhone';

  @override
  String get settingsStabilization => 'Stabilisering';

  @override
  String get settingsStabAuto => 'Automatisk';

  @override
  String get settingsStabOff => 'Fra';

  @override
  String get settingsStabStandard => 'Standard';

  @override
  String get settingsStabCinematic => 'Filmisk';

  @override
  String get settingsOverlayOpacity => 'Overlejringens opacitet';

  @override
  String get settingsShowFps => 'Vis ydelsesstatistik';

  @override
  String get settingsShowFpsSubtitle =>
      'Billedfrekvens og inferenstid i registreringsvisningen';

  @override
  String get settingsCameraFooter =>
      'Ændringer af linse og stabilisering træder i kraft, næste gang kameraet starter.';

  @override
  String get settingsAiModel => 'AI-model';

  @override
  String get settingsConfidence => 'Registreringssikkerhed';

  @override
  String get settingsTracking => 'Objektsporing';

  @override
  String get settingsTrackingSubtitle =>
      'Holder objekter stabile mellem billeder';

  @override
  String get settingsShowLabels => 'Vis etiketter';

  @override
  String get settingsShowConfidence => 'Vis sikkerhed';

  @override
  String get settingsSegmentationOpacity => 'Perceptionsmaskens opacitet';

  @override
  String get settingsAiFooter =>
      'Lavere sikkerhed viser flere objekter, men også flere fejlregistreringer. Registreringer kan være unøjagtige.';

  @override
  String get settingsVoiceAlerts => 'Stemmeadvarsler';

  @override
  String get settingsVoiceLanguage => 'Stemmesprog';

  @override
  String get settingsVoiceLanguageAuto => 'Samme som appens sprog';

  @override
  String get settingsVoice => 'Stemme';

  @override
  String get settingsVoiceDefault => 'Systemstandard';

  @override
  String get settingsVoiceQualityEnhanced => 'Forbedret';

  @override
  String get settingsVoiceQualityPremium => 'Høj kvalitet';

  @override
  String get settingsNoVoices =>
      'Der er ikke installeret nogen stemme til dette sprog. Tilføj en i iOS Indstillinger › Tilgængelighed › Oplæst indhold.';

  @override
  String get settingsAlertPedestrian => 'Fodgængere';

  @override
  String get settingsAlertCyclist => 'Cyklister';

  @override
  String get settingsAlertMotorcycle => 'Motorcykler';

  @override
  String get settingsAlertBus => 'Busser';

  @override
  String get settingsAlertVehicleClose => 'Køretøj meget tæt foran';

  @override
  String get settingsAlertTrafficLight => 'Skift i trafiklys';

  @override
  String get settingsAlertTrafficMoving => 'Trafikken foran kører';

  @override
  String get settingsAlertStopSign => 'Stopskilte';

  @override
  String get settingsSensitivity => 'Følsomhed';

  @override
  String get settingsSensitivityLow => 'Lav';

  @override
  String get settingsSensitivityMedium => 'Middel';

  @override
  String get settingsSensitivityHigh => 'Høj';

  @override
  String get settingsCooldown => 'Gentagelsesinterval';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Stemmelydstyrke';

  @override
  String get settingsQuietMode => 'Stille tilstand';

  @override
  String get settingsQuietModeSubtitle => 'Kun de vigtigste advarsler oplæses';

  @override
  String get settingsTestVoice => 'Test stemmen';

  @override
  String get settingsTestVoiceDone => 'Afspiller en eksempeladvarsel…';

  @override
  String get settingsParkingBeeps => 'Parkeringsbip';

  @override
  String get settingsBeepVolume => 'Bip-lydstyrke';

  @override
  String get settingsAlertsFooter =>
      'Advarsler er kun en hjælp. Hold altid øje med vejen – stilhed betyder ikke, at vejen er fri.';

  @override
  String get settingsRecordingProfile => 'Optagekvalitet';

  @override
  String get settingsProfileStandard => 'Standard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Hændelsesbuffer';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds sekunder';
  }

  @override
  String get settingsManualMaxLength => 'Maks. længde for manuel optagelse';

  @override
  String get settingsManualMaxUnlimited => 'Ubegrænset';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min.';
  }

  @override
  String get settingsRecordAudio => 'Optag lyd';

  @override
  String get settingsRecordAudioSubtitle =>
      'Inkluderer kabinelyd i gemte hændelser';

  @override
  String get settingsMicDenied =>
      'Adgang til mikrofonen er slået fra. Tillad den i Indstillinger for at optage lyd.';

  @override
  String get settingsWatermark => 'Corvista-vandmærke';

  @override
  String get settingsTimestamp => 'Dato- og tidsstempel';

  @override
  String get settingsSaveLocation => 'Gem position med klip';

  @override
  String get settingsStorage => 'Lager og klip';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip',
      one: '1 klip',
      zero: 'Ingen klip',
    );
    return '$_temp0 · $used brugt · $free ledig';
  }

  @override
  String get settingsRecordingFooter =>
      'Den rullende buffer forbliver på din iPhone og overskrives løbende. Der optages intet i baggrunden.';

  @override
  String get settingsDefaultView => 'Standardvisning';

  @override
  String get settingsUnits => 'Enheder';

  @override
  String get settingsShowCompass => 'Vis kompas';

  @override
  String get settingsHudStyle => 'HUD-stil';

  @override
  String get settingsHudCustomize => 'Tilpas HUD';

  @override
  String get settingsDrivingSide => 'Kørselsside';

  @override
  String get settingsDrivingSideAuto => 'Automatisk';

  @override
  String get settingsDrivingSideRight => 'Højre';

  @override
  String get settingsDrivingSideLeft => 'Venstre';

  @override
  String get settingsVirtualStyle => 'Stil for virtuel visning';

  @override
  String get settingsVirtualMinimal => 'Minimal';

  @override
  String get settingsVirtualPerspective => 'Perspektiv';

  @override
  String get settingsVirtualHighContrast => 'Høj kontrast';

  @override
  String get settingsKeepScreenOn => 'Hold skærmen tændt under kørsel';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Vis rutevejledning på låseskærmen og i Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Optagelsen blev sat på pause, mens Corvista var i baggrunden';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'På pause';

  @override
  String get liveActivityDashcamOff => 'Kamera fra';

  @override
  String get liveActivityEnded => 'Navigation afsluttet';

  @override
  String get liveActivityEta => 'Ankomst';

  @override
  String get settingsAutoRecenter => 'Centrer kortet automatisk';

  @override
  String get settingsHudStyleClassic => 'Klassisk';

  @override
  String get settingsHudStyleGrid => 'Gitter';

  @override
  String get settingsHudStyleMinimal => 'Minimal';

  @override
  String get settingsHudStylePerformance => 'Ydelse';

  @override
  String get settingsHudStyleNavigation => 'Navigation';

  @override
  String get settingsHudStyleNight => 'Nat';

  @override
  String get settingsHudStyleHighContrast => 'Høj kontrast';

  @override
  String get settingsPowerMode => 'Strømtilstand';

  @override
  String get settingsPowerBalanced => 'Afbalanceret';

  @override
  String get settingsPowerPerformance => 'Ydelse';

  @override
  String get settingsPowerSaver => 'Strømbesparelse';

  @override
  String get settingsPowerFooter =>
      'Corvista sænker automatisk AI-frekvensen og de visuelle effekter, når din iPhone bliver varm, eller batteriet er lavt.';

  @override
  String get settingsThermal => 'Temperaturstatus';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Varm';

  @override
  String get settingsThermalSerious => 'Meget varm';

  @override
  String get settingsThermalCritical => 'Kritisk';

  @override
  String get settingsBattery => 'Batteri';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Oplader';
  }

  @override
  String get settingsLowPowerMode =>
      'Strømsparetilstand er slået til – AI kører med nedsat frekvens.';

  @override
  String get settingsAiRate => 'Aktuel AI-frekvens';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Stødregistrering';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Til · $seconds s nedtælling';
  }

  @override
  String get settingsEmergencyFooter =>
      'Eksperimentel. Erstatter ikke nødtjenester.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeDark => 'Mørkt';

  @override
  String get settingsThemeLight => 'Lyst';

  @override
  String get settingsReduceMotion => 'Reducer bevægelse';

  @override
  String get settingsReduceMotionSubtitle =>
      'Minimerer animationer i hele appen';

  @override
  String get settingsAppLanguage => 'Appens sprog';

  @override
  String get settingsPrivacyPolicy => 'Privatlivspolitik';

  @override
  String get settingsTerms => 'Brugsvilkår';

  @override
  String get settingsHelp => 'Hjælp';

  @override
  String get settingsSupport => 'Kontakt support';

  @override
  String get settingsLicenses => 'Open source-licenser';

  @override
  String get settingsSupportUnavailable =>
      'Mail kunne ikke åbnes. Skriv til support@corvista.app.';

  @override
  String get settingsSafety => 'Sikkerhedsoplysninger';

  @override
  String get settingsDiagnostics => 'Diagnostik';

  @override
  String get settingsVersion => 'Version';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Tilpas HUD';

  @override
  String get hudCustomPreview => 'Eksempel · prøveværdier';

  @override
  String get hudCustomStyle => 'Stil';

  @override
  String get hudCustomElements => 'Elementer';

  @override
  String get hudCustomSpeed => 'Hastighed';

  @override
  String get hudCustomHeading => 'Retning og kompas';

  @override
  String get hudCustomClock => 'Ur';

  @override
  String get hudCustomBattery => 'Batteri og temperatur';

  @override
  String get hudCustomDetections => 'AI-status og registreringer';

  @override
  String get hudCustomWeather => 'Vejr';

  @override
  String get hudCustomAppearance => 'Størrelse og opacitet';

  @override
  String get hudCustomSize => 'Størrelse';

  @override
  String get hudCustomOpacity => 'Opacitet';

  @override
  String get hudCustomFooter =>
      'Advarsler, f.eks. om overophedning, vises altid, også når elementer er skjult.';

  @override
  String get hudCustomDescClassic => 'Afbalanceret instrumentpanel';

  @override
  String get hudCustomDescGrid => 'Perspektivgitter over vejen';

  @override
  String get hudCustomDescMinimal => 'Kun hastighed, intet andet';

  @override
  String get hudCustomDescPerformance => 'Hastighedsbue med live-aflæsninger';

  @override
  String get hudCustomDescNavigation => 'Næste manøvre først';

  @override
  String get hudCustomDescNight => 'Dæmpet og rødtonet til natkørsel';

  @override
  String get hudCustomDescHighContrast => 'Maksimal læsbarhed i skarpt solskin';

  @override
  String get languageTitle => 'Sprog';

  @override
  String get languageSystem => 'Systemstandard';

  @override
  String get languageSystemSubtitle => 'Følg sproget på din iPhone';

  @override
  String get languageFooter =>
      'Flere sprog er på vej. Sproget for stemmeadvarsler kan indstilles separat under Advarsler.';

  @override
  String get diagTitle => 'Diagnostik';

  @override
  String get diagPerformance => 'Ydelse';

  @override
  String get diagInference => 'Inferenstid';

  @override
  String get diagDetectHz => 'Registreringsfrekvens';

  @override
  String get diagCameraFps => 'Kameraets billedfrekvens';

  @override
  String get diagMemory => 'Hukommelse';

  @override
  String get diagDropped => 'Tabte billeder';

  @override
  String get diagSegmentation => 'Segmenteringstid';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Status';

  @override
  String get diagSource => 'Kilde';

  @override
  String get diagSourceCamera => 'Livekamera';

  @override
  String get diagSourceFile => 'Testoptagelsesfil';

  @override
  String get diagResolution => 'Bufferstørrelse';

  @override
  String get diagLens => 'Linse';

  @override
  String get diagError => 'Seneste fejl';

  @override
  String get diagModel => 'AI-model';

  @override
  String get diagModelLoad => 'Modellens indlæsningstid';

  @override
  String get diagPower => 'Strøm';

  @override
  String get diagSegHz => 'Segmenteringsfrekvens';

  @override
  String get diagReduced => 'Reducerede effekter';

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
  String get diagCamRunning => 'Kører';

  @override
  String get diagCamInterrupted => 'Afbrudt';

  @override
  String get diagCamStopped => 'Stoppet';

  @override
  String get diagCamUnavailable => 'Utilgængelig';

  @override
  String get diagCamPermissionDenied => 'Tilladelse afvist';

  @override
  String get diagCamError => 'Fejl';

  @override
  String get diagTestFootage => 'Testoptagelse';

  @override
  String get diagTestFootageBody =>
      'Kør ægte registrering på enheden på en lokal videofil i stedet for kameraet. Alle visninger mærker den TESTOPTAGELSE.';

  @override
  String get diagPathLabel => 'Sti til videofil';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Brug Documents/test_drive.mp4';

  @override
  String get diagRun => 'Kør testoptagelse';

  @override
  String get diagRunStarted =>
      'Testoptagelsen er startet. Åbn kørselsvisningen for at se den.';

  @override
  String get diagBackToCamera => 'Tilbage til livekameraet';

  @override
  String get diagDebugOnly =>
      'Testoptagelse er kun tilgængelig i udviklingsversioner.';

  @override
  String get diagFileMissing => 'Der findes ingen fil på den sti.';

  @override
  String get emergencySetupTitle => 'Stødregistrering';

  @override
  String get emergencyExperimental => 'Eksperimentel';

  @override
  String get emergencyIntro =>
      'Under en tur kan Corvista holde øje med et muligt kraftigt stød ved hjælp af din iPhones bevægelsessensorer. Hvis et stød registreres, starter en nedtælling. Hvis du ikke annullerer den, tilbyder Corvista at ringe til nødtjenesterne og sende en besked til dine kontakter.';

  @override
  String get emergencyDisclaimer1 =>
      'Erstatter ikke nødtjenester eller dit køretøjs egen kollisionsregistrering.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS beder dig altid bekræfte, før et opkald foretages, eller en besked sendes.';

  @override
  String get emergencyDisclaimer3 =>
      'Stød kan blive overset, og hård opbremsning eller bump kan forveksles med et stød.';

  @override
  String get emergencyParkedWarning =>
      'Fuldfør denne opsætning, mens du holder parkeret. Indstillingerne er låst, mens køretøjet bevæger sig.';

  @override
  String get emergencyEnable => 'Aktiver stødregistrering';

  @override
  String get emergencyEnableSubtitle => 'Kun aktiv under en køretur';

  @override
  String get emergencyNeedNumber => 'Tilføj først et nødnummer.';

  @override
  String get emergencyContacts => 'Nødkontakter';

  @override
  String get emergencyAddContact => 'Tilføj kontakt';

  @override
  String get emergencyNoContacts =>
      'Ingen kontakter endnu. Kontakter får først en besked, når du har bekræftet den.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Fjern $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Vedkommende tilbydes ikke længere som modtager efter et stød.';

  @override
  String get emergencyRemove => 'Fjern';

  @override
  String get emergencyContactsError => 'Kontakter kunne ikke indlæses.';

  @override
  String get emergencyNumber => 'Nødnummer';

  @override
  String get emergencyNumberHint => 'f.eks. 112 eller 911';

  @override
  String get emergencyMessage => 'Beskedskabelon';

  @override
  String get emergencyMessageDefault =>
      'Jeg har muligvis været ude for en bilulykke. Denne besked er forberedt af Corvista og indeholder min senest kendte position, hvis den er tilgængelig.';

  @override
  String get emergencyMessageHint =>
      'Lad feltet stå tomt for at bruge standardbeskeden.';

  @override
  String get emergencyCountdown => 'Nedtællingens længde';

  @override
  String get emergencyVoiceCancel => 'Annuller med stemmen';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Sig ”Jeg er OK” eller ”Annuller” under nedtællingen. Bruger talegenkendelse på enheden, hvor det er muligt.';

  @override
  String get emergencyVoicePermDenied =>
      'Adgang til mikrofon og talegenkendelse er nødvendig for at annullere med stemmen.';

  @override
  String get emergencyAutoSave => 'Gem hændelsesklip automatisk';

  @override
  String get emergencyTest => 'Test nedtælling (intet opkald)';

  @override
  String get emergencyTestBody =>
      'Kører et simuleret stød, så du kan se nedtællingen. Der foretages aldrig opkald eller sendes beskeder i testtilstand.';

  @override
  String get emergencyNotSet => 'Ikke angivet';

  @override
  String get emergencyAlertHeadline => 'Muligt kraftigt stød registreret.';

  @override
  String get emergencyAlertSubtitle => 'Er du OK?';

  @override
  String get emergencyAlertCancel => 'Jeg er OK – Annuller';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds sekunder tilbage',
      one: '1 sekund tilbage',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Lytter – sig ”Jeg er OK” for at annullere';

  @override
  String emergencyAlertHeard(String text) {
    return 'Hørte: ”$text”';
  }

  @override
  String get emergencyAlertEscalated => 'Intet svar. Vælg, hvad du vil gøre:';

  @override
  String get emergencyAlertCall => 'Ring til nødtjenesterne';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Ringer til $number. iOS beder dig bekræfte.';
  }

  @override
  String get emergencyAlertMessage => 'Send besked til kontakter';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Åbner en forberedt besked. Du vælger selv, om den sendes.';

  @override
  String get emergencyAlertTestMode =>
      'Testtilstand – der foretages intet opkald';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'Jeg er OK – Luk';

  @override
  String get emergencyMsgSent => 'Beskeden er sendt.';

  @override
  String get emergencyMsgCancelled => 'Beskeden blev ikke sendt.';

  @override
  String get emergencyMsgFailed => 'Beskeden kunne ikke sendes.';

  @override
  String get emergencyMsgUnavailable =>
      'Beskeder er ikke tilgængelige på denne enhed.';

  @override
  String emergencyCallFailed(String number) {
    return 'Opkaldet kunne ikke startes. Ring selv til $number.';
  }

  @override
  String get modelsTitle => 'AI-modeller';

  @override
  String get modelsIntro =>
      'Alle modeller følger med appen og kører helt på din iPhone. Dit kamerabillede forlader aldrig enheden.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Live: $ms ms pr. billede · $hz registreringer/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Indlæst på $ms ms';
  }

  @override
  String get modelsEfficientName => 'Effektiv';

  @override
  String get modelsEfficientDesc =>
      'Hurtig, kompakt detektor tilpasset lange ture med lav varmeudvikling og lavt batteriforbrug.';

  @override
  String get modelsEnhancedName => 'Forbedret';

  @override
  String get modelsEnhancedDesc =>
      'Større detektor, der finder mindre og fjernere objekter, til en højere strømpris.';

  @override
  String get modelsSegmentationName => 'Segmentering';

  @override
  String get modelsSegmentationDesc =>
      'Kombinerer hurtig registrering med masker for vejoverflade og objekter til Perception-visningen.';

  @override
  String get modelsNoneName => 'AI på pause';

  @override
  String get modelsNoneDesc =>
      'Kamera og optagelse fortsætter uden objektregistrering. Laveste strømforbrug.';

  @override
  String get modelsGenericDesc => 'Model til objektregistrering på enheden.';

  @override
  String get modelsFunctionDetection =>
      'Registrerer køretøjer, personer, cykler, motorcykler, busser, trafiklys og stopskilte';

  @override
  String get modelsFunctionSegmentation =>
      'Tilføjer masker for vejoverflade og objekter';

  @override
  String get modelsFunctionNone => 'Ingen registrering; kun dashcam-optagelse';

  @override
  String get modelsSize => 'Størrelse';

  @override
  String get modelsInput => 'Input';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Fungerer med';

  @override
  String get modelsStatusInstalled => 'Installeret (medfølger)';

  @override
  String get modelsStatusNotInstalled => 'Ikke installeret';

  @override
  String get modelsSelected => 'Valgt';

  @override
  String get modelsUse => 'Brug denne model';

  @override
  String get modelsSwitching => 'Indlæser model…';

  @override
  String modelsSwitched(String name) {
    return '$name er nu aktiv';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Målt på denne enhed: $ms ms i gennemsnit';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Ikke målt på denne enhed';

  @override
  String get modelsBenchmarkRun => 'Kør benchmark';

  @override
  String get modelsBenchmarkRunning => 'Kører benchmark…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Vælg denne model for at køre benchmark på den.';

  @override
  String get modelsBenchmarkDone => 'Benchmark fuldført';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Benchmark mislykkedes: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Senest opdateret $date';
  }

  @override
  String get safetyTitle => 'Sikkerhedsoplysninger';

  @override
  String get safetyIntro =>
      'Corvista er en hjælp til opmærksomhed under kørsel. Appen styrer ikke dit køretøj og kan ikke erstatte din egen opmærksomhed, dit eget skøn eller køretøjets sikkerhedssystemer.';

  @override
  String get safetyBeforeTitle => 'Før du kører';

  @override
  String get safetyBefore1 =>
      'Monter din iPhone sikkert på en lovlig placering, der ikke blokerer for udsyn, airbags eller betjeningselementer.';

  @override
  String get safetyBefore2 =>
      'Gennemfør opsætningen, vælg en visning, og angiv din destination, mens du holder parkeret.';

  @override
  String get safetyBefore3 =>
      'Tilslut en oplader på længere ture, og undgå om muligt direkte sollys på telefonen.';

  @override
  String get safetyWhileTitle => 'Under kørsel';

  @override
  String get safetyWhile1 =>
      'Hold øjnene på vejen. Brug kun de store knapper på skærmen, når det er sikkert og lovligt.';

  @override
  String get safetyWhile2 =>
      'Advarsler er hjælpemidler, ikke varsler, du kan stole på. Stilhed betyder aldrig, at vejen er fri.';

  @override
  String get safetyWhile3 =>
      'Følg færdselsloven, signaler og vejskilte – ikke appen – hvis de er uenige.';

  @override
  String get safetyLimitsTitle => 'Begrænsninger';

  @override
  String get safetyLimits1 =>
      'Et enkelt telefonkamera ser kun det, der er foran det. Objekter uden for synsfeltet, skjulte eller meget tætte registreres ikke.';

  @override
  String get safetyLimits2 =>
      'Registreringer kan udeblive, komme sent eller være forkerte, især om natten, i regn, tåge, blænding eller med snavset forrude.';

  @override
  String get safetyLimits3 =>
      'Kun understøttede kategorier genkendes: køretøjer, busser, motorcykler, cykler, personer, trafiklys og stopskilte. Vognbanehjælpelinjer i den virtuelle visning er stiliserede, ikke registrerede vognbaner.';

  @override
  String get safetyLimits4 =>
      'Nærhed vises som omtrentlige zoner (Meget tæt på, Tæt på, Middel, Langt væk), aldrig som målte afstande. Parkeringsvisningen erstatter ikke parkeringssensorer.';

  @override
  String get safetyHeatTitle => 'Varme og batteri';

  @override
  String get safetyHeat1 =>
      'Vedvarende brug af kamera og AI opvarmer din iPhone. Corvista sænker analysefrekvensen, når enheden bliver varm, og viser en advarsel. Hvis iOS overophedes, kan kameraet stoppe.';

  @override
  String get safetyEmergencyTitle => 'Nødfunktion';

  @override
  String get safetyEmergency1 =>
      'Registrering af muligt stød er eksperimentel. Den kan overse rigtige ulykker og kan udløses af andre hændelser.';

  @override
  String get safetyEmergency2 =>
      'Den kontakter aldrig nogen i det skjulte: iOS beder dig altid bekræfte et opkald eller en besked. Den erstatter ikke, at du selv ringer til nødtjenesterne.';

  @override
  String get privacyTitle => 'Privatliv';

  @override
  String get privacyIntro =>
      'Corvista er designet til at holde dine kørselsdata på din iPhone. Der er ingen Corvista-konto, og Corvista driver ikke egne servere.';

  @override
  String get privacyCameraTitle => 'Kamera og AI';

  @override
  String get privacyCamera1 =>
      'Objektregistrering, sporing og segmentering kører helt på din iPhone. Kamerabilleder uploades aldrig.';

  @override
  String get privacyCamera2 =>
      'Kameraet kører kun, mens Corvista er åben på skærmen. Det sættes på pause, når appen går i baggrunden – der er ingen skjult baggrundsoptagelse.';

  @override
  String get privacyRecordingsTitle => 'Optagelser';

  @override
  String get privacyRecordings1 =>
      'Den rullende buffer er midlertidig og overskrives løbende. Optagelser gemmes kun, når du trykker på Gem hændelse eller, hvis du aktiverer det, efter et muligt stød.';

  @override
  String get privacyRecordings2 =>
      'Gemte klip forbliver i Corvistas private lager på din iPhone. De forlader kun enheden, når du vælger Del. Hvis du sletter appen, slettes de også.';

  @override
  String get privacyRecordings3 =>
      'Lyd optages kun, hvis du slår det til og giver adgang til mikrofonen.';

  @override
  String get privacyLocationTitle => 'Position';

  @override
  String get privacyLocation1 =>
      'Positionen bruges, mens appen er åben, til din hastighed, kortet, ruter og vejr. Hvis ”Gem position” er slået til, gemmes positionen på lagringstidspunktet sammen med klippet på din enhed.';

  @override
  String get privacyNetworkTitle => 'Netværkstjenester';

  @override
  String get privacyNetwork1 =>
      'Apple Maps – kortvisning, stedsøgning og ruter. Din søgetekst og omtrentlige position sendes til Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) – aktuelt vejr og timevejr for din position.';

  @override
  String get privacyNetwork4 =>
      'Corvista indeholder ingen reklamer og ingen analyse eller sporing fra tredjepart.';

  @override
  String get privacyEmergencyTitle => 'Nødkontakter';

  @override
  String get privacyEmergency1 =>
      'Kontakter, du vælger, gemmes i iOS-nøglering på denne enhed. Annullering med stemmen bruger talegenkendelse på enheden, hvor det er muligt. Opkald og beskeder sendes først, når du har bekræftet dem i iOS.';

  @override
  String get privacyControlsTitle => 'Dine valg';

  @override
  String get privacyControls1 =>
      'Du kan slette klip når som helst under Klip og ændre eller tilbagekalde adgang til kamera, mikrofon, position og tale i iOS Indstillinger.';

  @override
  String get termsTitle => 'Brugsvilkår';

  @override
  String get termsIntro =>
      'Ved at bruge Corvista accepterer du disse vilkår. Apples standardlicensaftale for slutbrugere (Licensed Application End User License Agreement) gælder også.';

  @override
  String get termsUseTitle => 'Brug af Corvista';

  @override
  String get termsUse1 =>
      'Corvista er en hjælp til opmærksomhed under kørsel og en dashcam-hjælp. Du har til enhver tid det fulde ansvar for at køre sikkert og lovligt.';

  @override
  String get termsUse2 =>
      'Brug ikke appen på måder, der distraherer dig under kørsel. Monter enheden sikkert og lovligt.';

  @override
  String get termsAccuracyTitle => 'Ingen garanti for nøjagtighed';

  @override
  String get termsAccuracy1 =>
      'Registreringer, zoner, advarsler, kortmarkører, ruter og vejr kan være ufuldstændige, forsinkede eller forkerte. Corvista styrer ikke dit køretøj.';

  @override
  String get termsAccuracy2 =>
      'Nødfunktionen er eksperimentel og kan undlade at registrere et stød eller udløses ved en fejl.';

  @override
  String get termsRecordingTitle => 'Love om optagelse';

  @override
  String get termsRecording1 =>
      'Love om dashcams, lydoptagelse og filmning af personer varierer fra land til land og region til region. Du er ansvarlig for at overholde dem, også når du deler klip.';

  @override
  String get termsLiabilityTitle => 'Ansvar';

  @override
  String get termsLiability1 =>
      'Appen leveres ”som den er”. I det omfang loven tillader det, er udvikleren ikke ansvarlig for ulykker, tab, bøder eller skader, der opstår ved brug af appen eller ved at stole på dens output.';

  @override
  String get termsChangesTitle => 'Ændringer';

  @override
  String get termsChanges1 =>
      'Disse vilkår kan blive opdateret med nye versioner af appen. Fortsat brug efter en opdatering betyder, at du accepterer de reviderede vilkår.';

  @override
  String get helpTitle => 'Hjælp';

  @override
  String get helpIntro =>
      'Svar på almindelige spørgsmål. For sikkerhedsvejledning, se Sikkerhedsoplysninger.';

  @override
  String get helpQSave => 'Hvordan gemmer jeg optagelser af en hændelse?';

  @override
  String get helpASaveBuffer =>
      'Tryk på den store knap Gem hændelse i køreskærmen. Corvista gemmer de seneste 20 eller 30 sekunder af sin rullende buffer (dit valg under Indstillinger › Optagelse) i Klip.';

  @override
  String get helpQWhere => 'Hvor gemmes mine klip?';

  @override
  String get helpAWhere =>
      'I Corvistas private lager på din iPhone. De uploades aldrig. Brug Del i afspilleren til at sende eller eksportere et klip.';

  @override
  String get helpQZones => 'Hvor nøjagtige er nærhedszonerne?';

  @override
  String get helpAZones =>
      'Zonerne er grove skøn fra et enkelt kamera baseret på typiske objektstørrelser. Betragt dem som omtrentlige fingerpeg, aldrig som afstande.';

  @override
  String get helpQSlow => 'Hvorfor bliver registreringen langsommere?';

  @override
  String get helpASlow =>
      'Når din iPhone bliver varm, batteriet er lavt, eller Strømsparetilstand er slået til, sænker Corvista analysefrekvensen for at beskytte enheden. Du kan ændre strømtilstanden i Indstillinger.';

  @override
  String get helpQMap => 'Kortet, søgningen eller vejret virker ikke.';

  @override
  String get helpAMap =>
      'Disse funktioner kræver internetforbindelse og adgang til position. Tjek din forbindelse, og tillad position for Corvista i iOS Indstillinger.';

  @override
  String get helpQSimulator => 'Kameraet vises som utilgængeligt.';

  @override
  String get helpASimulator =>
      'Sørg for, at kameraadgang er tilladt i iOS Indstillinger, og at ingen anden app bruger kameraet. I iOS Simulator findes der intet kamera. Her kan en lokal testvideo bruges i stedet.';

  @override
  String get emergencyMsgNoContacts => 'Tilføj først en nødkontakt.';

  @override
  String get cameraStarting => 'Starter kameraet…';

  @override
  String get cameraInterrupted => 'Kameraet er sat på pause';

  @override
  String get cameraInterruptedBody =>
      'iOS satte kameraet på pause, f.eks. under et opkald, eller mens en anden app bruger det. Det genoptages automatisk.';

  @override
  String get cameraUnavailable => 'Kameraet er ikke tilgængeligt';

  @override
  String get cameraUnavailableBody =>
      'Der er intet tilgængeligt kamera på denne enhed. Registrerings-, optagelses- og parkeringsvisningerne kræver bagkameraet.';

  @override
  String get cameraRunTestFootage => 'Kør testoptagelse';

  @override
  String get cameraPermissionDenied => 'Kameraadgang er slået fra';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista har brug for kameraet til registrering, dashcam-optagelse og parkeringsvisninger. Slå kameraadgang til i Indstillinger.';

  @override
  String get cameraError => 'Kamerafejl';

  @override
  String get cameraStopped => 'Kameraet er stoppet';

  @override
  String get cameraStart => 'Start kameraet';

  @override
  String get cameraFocusHint => 'Tryk for at fokusere';

  @override
  String get cameraPreviewLabel =>
      'Livevisning fra kameraet med registrerede objekter';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · AI $hz Hz · $ms ms · tabt $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Hastighed $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Ingen GPS-hastighed';

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
    return 'Optagelse af dashcam-buffer, $seconds af $target sekunder bufferet';
  }

  @override
  String get hudRecIdle => 'REC fra';

  @override
  String get hudRecSaving => 'Gemmer…';

  @override
  String get hudRecError => 'REC-fejl';

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
    return 'AI-model $model, $_temp0 registreret';
  }

  @override
  String get hudThermalSerious => 'Varm – AI sænkes';

  @override
  String get hudThermalCritical => 'For varm – AI på pause';

  @override
  String hudBatteryLow(String percent) {
    return 'Batteri $percent';
  }

  @override
  String get hudLowPower => 'Strømsparetilstand';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Vejr $temperature, $condition. Tryk for detaljer.';
  }

  @override
  String get hudNoGuidance =>
      'Søg efter en destination i kortvisningen for at se rutevejledning her.';

  @override
  String get navArrived => 'Du er ankommet';

  @override
  String get navRerouting => 'Beregner ny rute…';

  @override
  String get navSearchHint => 'Søg efter destination';

  @override
  String get navSearchFieldHint => 'Adresse, sted eller virksomhed';

  @override
  String get navNoResults => 'Ingen matchende steder';

  @override
  String get navSearching => 'Søger…';

  @override
  String get navSearchStartTyping =>
      'Skriv en adresse eller et stednavn. Resultaterne kommer fra Apple Maps og kræver internetforbindelse.';

  @override
  String get navErrorUnavailable =>
      'Søgning og ruter er ikke tilgængelige – tjek din internetforbindelse.';

  @override
  String get navErrorNoLocation =>
      'Venter på din position for at planlægge en rute.';

  @override
  String get navErrorPermission =>
      'Adgang til position er slået fra, så ruter kan ikke starte fra din position.';

  @override
  String navErrorGeneric(String code) {
    return 'Ruter kunne ikke indlæses ($code).';
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
  String get navEnd => 'Afslut';

  @override
  String get navEndLabel => 'Afslut navigation';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration tilbage';
  }

  @override
  String navAdvisory(String text) {
    return 'Bemærk: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min.',
      one: '1 min.',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours t $minutes min.';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Rute $index: $name';
  }

  @override
  String get weatherTitle => 'Vejr';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Føles som $temperature';
  }

  @override
  String get weatherPrecipitation => 'Nedbør';

  @override
  String get weatherWind => 'Vind';

  @override
  String get weatherVisibility => 'Sigtbarhed';

  @override
  String get weatherHumidity => 'Luftfugtighed';

  @override
  String get weatherHourly => 'Kommende timer';

  @override
  String weatherAsOf(String time) {
    return 'Opdateret $time';
  }

  @override
  String get weatherRefresh => 'Opdater vejret';

  @override
  String get weatherUnavailable => 'Vejret er ikke tilgængeligt lige nu.';

  @override
  String get weatherNoLocation => 'Vejret kræver din position.';

  @override
  String get weatherLegal => 'Datakilder og jura';

  @override
  String weatherProvidedBy(String service) {
    return 'Vejrdata: $service';
  }

  @override
  String get weatherNow => 'Nu';

  @override
  String get virtualEmpty => 'Ingen understøttede objekter registreret';

  @override
  String get virtualEmptyCameraOff =>
      'Den virtuelle visning kræver livekameraet.';

  @override
  String get virtualLaneDisclaimer =>
      'Vognbanelinjerne er illustrative, ikke registrerede.';

  @override
  String virtualNearest(String zone) {
    return 'Nærmest: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtuel vejscene: $summary';
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
  String get virtualStatusCameraOff => 'Kamera fra';

  @override
  String get virtualStatusTestFootage => 'Testoptagelse';

  @override
  String get virtualEmptyHint =>
      'Køretøjer, personer, cykler, lys og stopskilte vises her, når de registreres.';

  @override
  String get mapRecenter => 'Centrer';

  @override
  String get mapZoomIn => 'Zoom ind';

  @override
  String get mapZoomOut => 'Zoom ud';

  @override
  String get mapUnsupported =>
      'Det interaktive kort er tilgængeligt på iPhone.';

  @override
  String get mapObjectsApprox => 'Objektmarkører viser omtrentlige positioner.';

  @override
  String get mapWeatherUnavailable => 'Vejret er ikke tilgængeligt';

  @override
  String get navErrorNoRoute =>
      'Der blev ikke fundet nogen rute til denne destination.';

  @override
  String get navDismiss => 'Afvis';

  @override
  String get navGo => 'Kør';

  @override
  String get navFastest => 'Hurtigste';

  @override
  String get navThen => 'Derefter';

  @override
  String get navRecents => 'Seneste';

  @override
  String get navClearRecents => 'Ryd';

  @override
  String get navSearchSubmitHint =>
      'Tryk på Søg for at se alle matchende steder';

  @override
  String get navPlaces => 'Steder';

  @override
  String get navEtaLabel => 'ankomst';

  @override
  String get navTimeLeftLabel => 'tilbage';

  @override
  String get navOverview => 'Oversigt';

  @override
  String get navMute => 'Slå stemmen fra';

  @override
  String get navUnmute => 'Slå stemmen til';

  @override
  String get navEndConfirm => 'Afslut navigation?';

  @override
  String navEndConfirmBody(String place) {
    return 'Vejledningen til $place stopper.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Du er ankommet til $place';
  }

  @override
  String get navDone => 'Færdig';

  @override
  String get navWeakGps => 'Svagt GPS-signal';

  @override
  String get navLocationOff =>
      'Position er slået fra. Slå den til for at planlægge ruter og navigere.';

  @override
  String get navVoiceGuidance => 'Stemmevejledning';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Om $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, og derefter $second';
  }

  @override
  String get navSpeakRerouting => 'Beregner ny rute';

  @override
  String get navSpeakArrived => 'Du er ankommet';

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
      other: '$count fod',
      one: '1 fod',
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
    return 'Fortsæt i $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Rutevejledning er ikke tilgængelig for denne tur i denne region. Prøv en anden destination.';

  @override
  String navContinueFor(String distance) {
    return 'Fortsæt i $distance';
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
  String get parkingNothing => 'Intet registreret i billedet';

  @override
  String get parkingBeeps => 'Nærhedsbip';

  @override
  String get parkingVolume => 'Bip-lydstyrke';

  @override
  String get parkingLimitations =>
      'Et enkelt kamera, ikke 360°. Objekter uden for kameraets synsfelt registreres ikke. Erstatter ikke parkeringssensorer. Skøn kan være forkerte, og stilhed betyder ikke, at området er frit.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Nærhedsvisning ovenfra. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Original';

  @override
  String get perceptionModeBoxes => 'Bokse';

  @override
  String get perceptionModeMasks => 'Objektmasker';

  @override
  String get perceptionModeRoad => 'Vejoverflade';

  @override
  String get perceptionModeCombined => 'Kombineret';

  @override
  String get perceptionOpacity => 'Maskens opacitet';

  @override
  String get perceptionDisclaimer =>
      'Vejoverflademasken er et omtrentligt visuelt lag. Den viser ikke kørbart areal eller vognbaner.';

  @override
  String get perceptionNeedsModel =>
      'Vælg segmenteringsmodellen for at se masker.';

  @override
  String get perceptionChooseModel => 'Vælg model';

  @override
  String get perceptionWaiting => 'Venter på det første segmenteringsbillede…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Bokse';

  @override
  String get perceptionShortObjects => 'Objekter';

  @override
  String get perceptionShortRoad => 'Vej';

  @override
  String get perceptionShortAll => 'Alle';

  @override
  String get perceptionModesLabel => 'Perceptionslag';

  @override
  String get perceptionStatusWarmingUp => 'Varmer op…';

  @override
  String get perceptionStatusLoadingModel => 'Indlæser model…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Masker sat på pause';

  @override
  String get perceptionLegend => 'Maskeforklaring';

  @override
  String get perceptionUnavailable => 'Masker ikke tilgængelige';

  @override
  String get driveSave => 'Gem';

  @override
  String get driveSaveIncident => 'Gem hændelse';

  @override
  String driveSaveHint(int seconds) {
    return 'Gemmer de seneste $seconds sekunders dashcam-optagelse';
  }

  @override
  String get driveSaving => 'Gemmer hændelsen…';

  @override
  String hudRecManualLabel(String time) {
    return 'Optager, $time';
  }

  @override
  String get driveRecord => 'Optag';

  @override
  String get driveRecordStartA11y => 'Start optagelse';

  @override
  String driveRecordStopA11y(String time) {
    return 'Stop optagelse, $time optaget';
  }

  @override
  String get driveRecordHint =>
      'Optager løbende, indtil du stopper, inklusive de seneste 5 sekunder';

  @override
  String get driveRecordFailed => 'Optagelsen kunne ikke startes';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Optagelse gemt · $count dele',
      one: 'Optagelse gemt',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Optagelsen stoppede: lagerpladsen er næsten fuld',
      'max_duration': 'Optagelsen stoppede: maksimal længde nået',
      'camera_stopped': 'Optagelsen stoppede sammen med kameraet',
      'background': 'Optagelsen stoppede: appen gik i baggrunden',
      'thermal': 'Optagelsen stoppede: telefonen er for varm',
      'other': 'Optagelsen stoppede',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Hændelse gemt · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Vis';

  @override
  String get driveSaveFailed => 'Hændelsen kunne ikke gemmes.';

  @override
  String get driveSaveNotRunning =>
      'Optagelsen er ikke startet endnu – vent, til kameraet er startet, og prøv igen.';

  @override
  String get driveSaveTestFootage =>
      'Testoptagelse optages ikke. Lagring af hændelser fungerer med livekameraet.';

  @override
  String get driveSaveStorageFull =>
      'Din iPhone har ikke mere lagerplads. Frigør plads, eller slet ældre klip.';

  @override
  String get driveSaveIoError => 'Klippet kunne ikke skrives til lageret.';

  @override
  String get driveClips => 'Klip';

  @override
  String get driveSettings => 'Indstillinger';

  @override
  String get driveViewSwitcher => 'Kørselsvisninger';

  @override
  String get driveLocationDenied =>
      'Position er slået fra – hastighed, kort og ruter er ikke tilgængelige.';

  @override
  String get driveCameraDenied =>
      'Kameraadgang er slået fra – registrering og optagelse er ikke tilgængelige.';

  @override
  String get driveRecorderFallback =>
      'Optagelse uden lyd: adgang til mikrofonen er slået fra.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Optagelsesindstillingerne blev justeret: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Din iPhone er varm. AI kører langsommere for at køle ned – hold den væk fra direkte sol og tæt på en luftdyse.';

  @override
  String get drivePowerThermalCritical =>
      'Din iPhone er for varm. AI-registreringen er sat på pause, indtil den er kølet ned. Optagelsen fortsætter, hvis det er muligt.';

  @override
  String get drivePowerLowPower =>
      'Strømsparetilstand er slået til – AI kører med nedsat frekvens.';

  @override
  String get drivePowerBatteryLow =>
      'Batteriet er lavt – tilslut din iPhone til strøm under kørsel.';

  @override
  String get onboardingTitle1 => 'Se mere af hver tur.';

  @override
  String get onboardingBody1 =>
      'Gør din iPhone til et intelligent dashcam og en ledsager, der hjælper dig med at være opmærksom under kørsel.';

  @override
  String get onboardingTitle2 => 'Intelligens i hvert billede.';

  @override
  String get onboardingBody2 =>
      'Genkend understøttede køretøjer, personer, cykler og vejsignaler direkte på din iPhone.';

  @override
  String get onboardingTitle3 => 'Én vej. Flere perspektiver.';

  @override
  String get onboardingBody3 =>
      'Skift mellem live-registrering, virtuelle kørselsvisninger, interaktive kort og parkeringsvisualisering.';

  @override
  String get onboardingTitle4 => 'Behold de øjeblikke, der tæller.';

  @override
  String get onboardingBody4 =>
      'Gem nylige dashcam-optagelser, gennemgå hændelser, og del optagelser.';

  @override
  String get onboardingTitle5 => 'Sikkerhed og privatliv';

  @override
  String get onboardingSafety1 =>
      'Corvista er en hjælp til opmærksomhed under kørsel. Hold øjnene på vejen.';

  @override
  String get onboardingSafety2 =>
      'Den styrer ikke dit køretøj og erstatter ikke dit skøn.';

  @override
  String get onboardingSafety3 =>
      'Registreringer og skøn kan være unøjagtige eller udeblive.';

  @override
  String get onboardingSafety4 =>
      'Kamerabehandlingen sker på din iPhone – video uploades ikke.';

  @override
  String get onboardingSafety5 =>
      'Kort, søgning, ruter og vejr kræver internetforbindelse.';

  @override
  String get onboardingSafety6 =>
      'Monter din iPhone sikkert, så den ikke blokerer for udsynet.';

  @override
  String get onboardingSafety7 =>
      'Gennemfør opsætningen, før du begynder at køre.';

  @override
  String get onboardingAcknowledge =>
      'Jeg forstår, at Corvista er en hjælp til opmærksomhed, og at jeg selv har ansvaret for at køre sikkert.';

  @override
  String get onboardingReadSafety => 'Læs alle sikkerhedsoplysninger';

  @override
  String get onboardingNext => 'Næste';

  @override
  String get onboardingSkip => 'Spring over';

  @override
  String get onboardingAgree => 'Fortsæt';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Side $current af $total';
  }

  @override
  String get permTitle => 'Tilladelser';

  @override
  String get permIntro =>
      'Corvista beder kun om det, hver funktion har brug for. Du kan ændre dem når som helst i Indstillinger.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Påkrævet til registrering, dashcam-optagelse og parkeringsvisningen. Video behandles på din iPhone.';

  @override
  String get permLocationTitle => 'Position';

  @override
  String get permLocationBody =>
      'Bruges til GPS-hastighed, kortet, ruter, vejr og til at mærke gemte klip. Kun mens du bruger appen.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'Talegenkendelse anmodes kun, hvis du slår annullering med stemmen til for nødadvarsler.';

  @override
  String get permRequired => 'Påkrævet';

  @override
  String get permOptional => 'Valgfri';

  @override
  String get permAllow => 'Tillad';

  @override
  String get permGranted => 'Tilladt';

  @override
  String get permDenied => 'Afvist';

  @override
  String get permLimited => 'Begrænset';

  @override
  String get permRestricted => 'Begrænset af systemet';

  @override
  String get permStart => 'Begynd at køre';

  @override
  String get permCameraNeeded =>
      'Du kan fortsætte uden kameraadgang, men registrering og optagelse virker ikke, før du tillader det i Indstillinger.';

  @override
  String get permSetupIntro =>
      'Corvista har brug for disse for at fungere fuldt ud. Tryk på Tillad alle, så spørger iOS om hver enkelt efter tur. Du kan ændre dem når som helst i Indstillinger.';

  @override
  String get permCameraLine =>
      'Påkrævet til registrering, dashcam-optagelse og parkeringsvisningen. Video behandles på din iPhone og uploades aldrig.';

  @override
  String get permLocationLine =>
      'GPS-hastighed, kortet, ruter, vejr og hvor klip blev gemt. Kun mens du bruger appen.';

  @override
  String get permMicLine =>
      'Kabinelyd i hændelsesklip og til at høre din annulleringsfrase under en nødadvarsel.';

  @override
  String get permSpeechTitle => 'Talegenkendelse';

  @override
  String get permSpeechLine =>
      'Genkender din annulleringsfrase under en nødnedtælling, på din iPhone hvor det understøttes.';

  @override
  String get permAllowAll => 'Tillad alle';

  @override
  String permAsking(String permission) {
    return 'Beder om $permission…';
  }

  @override
  String get permSomeDenied =>
      'Nogle tilladelser er slået fra. Slå dem til i Indstillinger for at bruge disse funktioner.';

  @override
  String get permNotNow => 'Ikke nu';

  @override
  String get tourLabel => 'Rundvisning i kørselsskærmen';

  @override
  String tourProgress(int current, int total) {
    return 'Trin $current af $total';
  }

  @override
  String get tourNext => 'Næste';

  @override
  String get tourBack => 'Tilbage';

  @override
  String get tourSkip => 'Spring rundvisning over';

  @override
  String get tourFinish => 'Begynd at køre';

  @override
  String get tourWelcomeTitle => 'Din hurtige rundvisning';

  @override
  String get tourWelcomeBody =>
      'Et minuts kig på det vigtigste på kørselsskærmen. Bedst, mens du holder parkeret.';

  @override
  String get tourHudTitle => 'Din instrumentstribe';

  @override
  String get tourHudSpeed => 'Hastigheden kommer fra GPS.';

  @override
  String get tourHudRec =>
      'REC viser, hvor mange sekunders optagelse der er bufferet.';

  @override
  String get tourHudAi =>
      'AI-chippen viser modellen, hvor mange objekter den ser, og en prik: grøn kører, gul begrænset, rød stoppet.';

  @override
  String get tourSaveTitle => 'Gem hændelse';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista holder en rullende buffer med de seneste $seconds sekunders video. Den overskrives hele tiden, så intet gemmes, medmindre du trykker på Gem. Gemte klip forbliver på denne iPhone under Klip.';
  }

  @override
  String get tourRecordTitle => 'Optag hele turen';

  @override
  String get tourRecordBody =>
      'Tryk på Optag for at filme løbende, indtil du stopper. Lange ture gemmes i dele på 5 minutter i Klip, og Gem hændelse virker stadig, mens du optager.';

  @override
  String get tourViewsTitle => 'Fem måder at se vejen på';

  @override
  String get tourViewDetection =>
      'Livekamera med bokse omkring understøttede objekter.';

  @override
  String get tourViewVirtual =>
      'En forenklet 3D-scene bygget ud fra registreringer.';

  @override
  String get tourViewMap => 'Apple Maps med søgning og rutevejledning.';

  @override
  String get tourViewParking => 'Kamera plus en nærhedsvisning ovenfra.';

  @override
  String get tourViewPerception => 'Masker for vej og objekter.';

  @override
  String get tourMapTitle => 'Søgning og rutevejledning';

  @override
  String get tourMapBody =>
      'Åbn Kort, tryk på søgefeltet, og vælg en destination. Vælg en rute, og tryk derefter på Start for rutevejledning. Kræver internetforbindelse.';

  @override
  String get tourClipsTitle => 'Klip';

  @override
  String get tourClipsBody =>
      'Gennemgå, omdøb, del eller slet gemte hændelser. Klip forbliver på din iPhone, medmindre du deler dem.';

  @override
  String get tourSettingsTitle => 'Indstillinger';

  @override
  String get tourSettingsBody =>
      'Finjuster stemmeadvarsler og deres følsomhed, optagekvalitet og bufferlængde, og opsæt Nødtilstand: en eksperimentel stødadvarsel med nedtælling, der kan annulleres.';

  @override
  String get tourSafetyTitle => 'Før du kører';

  @override
  String get tourSafety1 =>
      'Monter din iPhone sikkert, hvor den ikke blokerer for udsynet.';

  @override
  String get tourSafety2 =>
      'Brug ikke appen under kørsel. Indstil alt, mens du holder parkeret.';

  @override
  String get tourSafety3 =>
      'Registreringer og zoner er skøn. De kan være forkerte eller udeblive.';

  @override
  String get tourSafety4 => 'Du har stadig ansvaret for at køre sikkert.';

  @override
  String get helpTakeTour => 'Tag rundvisningen';

  @override
  String get helpTakeTourSub =>
      'En guidet rundtur på et minut i kørselsskærmen.';

  @override
  String get tripsTitle => 'Ture';

  @override
  String get tripsOpen => 'Turlog';

  @override
  String get tripsEmptyTitle => 'Ingen ture endnu';

  @override
  String get tripsEmptyBody =>
      'Ture optages automatisk, mens du kører med Corvista – distance, tid, hastighed og den rute, du kørte.';

  @override
  String get tripsDisabledBody =>
      'Turloggen er slået fra, så nye ture optages ikke. Slå den til for at føre en privat log over dine ruter på denne iPhone.';

  @override
  String get tripsEnable => 'Slå turlog til';

  @override
  String get tripsToday => 'I dag';

  @override
  String get tripsYesterday => 'I går';

  @override
  String tripsRecordingNow(String distance) {
    return 'Optager en tur · $distance';
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
      other: '$count hændelser',
      one: '1 hændelse',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count advarsler',
      one: '1 advarsel',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ture',
      one: '1 tur',
      zero: 'Ingen ture',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Distance';

  @override
  String get tripsStatDuration => 'Varighed';

  @override
  String get tripsStatMoving => 'Køretid';

  @override
  String get tripsStatAvgSpeed => 'Gns. hastighed';

  @override
  String get tripsStatMaxSpeed => 'Maks. hastighed';

  @override
  String get tripsDetections => 'Registreringer';

  @override
  String get tripsNoDetections =>
      'Der blev ikke logget nogen vejobjekter på denne tur.';

  @override
  String get tripsTimeline => 'Tidslinje';

  @override
  String get tripsEventStart => 'Turen startede';

  @override
  String get tripsEventEnd => 'Turen sluttede';

  @override
  String get tripsEventAlert => 'Stemmeadvarsel';

  @override
  String get tripsEventIncident => 'Hændelsesklip gemt';

  @override
  String get tripsEventEmergency => 'Mulig ulykke registreret';

  @override
  String get tripsEventNavStart => 'Navigation startet';

  @override
  String get tripsEventArrive => 'Ankommet til destinationen';

  @override
  String get tripsEventReroute => 'Ruten blev genberegnet';

  @override
  String get tripsEventRecording => 'Optagelse gemt';

  @override
  String get tripsOpenClip => 'Åbn klip';

  @override
  String get tripsTrackPreview => 'GPS-spor';

  @override
  String get tripsRenameTitle => 'Omdøb tur';

  @override
  String get tripsRenameHint => 'Turnavn';

  @override
  String get tripsFavorite => 'Føj til favoritter';

  @override
  String get tripsUnfavorite => 'Fjern fra favoritter';

  @override
  String get tripsShareGpx => 'Del GPX';

  @override
  String get tripsShareFailed => 'Turen kunne ikke deles.';

  @override
  String get tripsDelete => 'Slet tur';

  @override
  String get tripsDeleteConfirmTitle => 'Slet denne tur?';

  @override
  String get tripsDeleteConfirmBody =>
      'Ruten og statistikken fjernes fra denne iPhone. Hændelsesklip fra turen beholdes.';

  @override
  String get tripsDeleted => 'Turen er slettet';

  @override
  String get tripsNotFound => 'Denne tur er ikke længere tilgængelig.';

  @override
  String get tripsPrivacyNote => 'Gemmes kun på denne iPhone. Intet uploades.';

  @override
  String get settingsSectionTrips => 'Turlog';

  @override
  String get settingsTripLog => 'Optag ture';

  @override
  String get settingsTripLogSubtitle =>
      'Gemmer din rute og kørselsstatistik kun på denne iPhone.';

  @override
  String get settingsTripRetention => 'Gem ture i';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dage',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 år';

  @override
  String get settingsRetentionForever => 'For altid';

  @override
  String get settingsTripRetentionFooter =>
      'Ældre ture slettes automatisk, når Corvista starter.';

  @override
  String get settingsViewTrips => 'Se ture';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours t $minutes min.';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes min.';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista-tur $date';
  }

  @override
  String get settingsFreeUpSpace => 'Frigør plads';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Fjerner midlertidige filer og caches. Gemte klip og ture beholdes.';

  @override
  String settingsFreedBytes(String size) {
    return '$size frigjort';
  }

  @override
  String get settingsNothingToFree =>
      'Caches ryddet – ingen midlertidige filer at fjerne.';

  @override
  String get settingsSectionPrivacyData => 'Privatliv og data';

  @override
  String get settingsPrivacyDataFooter =>
      'Klip, ture og indstillinger gemmes kun på denne iPhone. De forlader den kun, når du selv vælger at dele dem.';

  @override
  String get settingsDeleteAllData => 'Slet alle data';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Slet klip, ture, kontakter og indstillinger fra denne iPhone';

  @override
  String get deleteAllTitle => 'Slet alle data?';

  @override
  String get deleteAllMessage =>
      'Dette fjerner permanent fra denne iPhone:\n• Hændelsesklip og miniaturer\n• Turlog og GPS-spor\n• Nødkontakter og nødhændelser\n• Registreringslogge og diagnostiklog\n• Indstillinger og seneste destinationer\n• Midlertidig optagebuffer og cache\n\nDette kan ikke fortrydes. Corvista starter derefter forfra med velkomstskærmene.';

  @override
  String get deleteAllConfirm => 'Slet alt';

  @override
  String get deleteAllInProgress => 'Sletter…';

  @override
  String get deleteAllDone => 'Alle data slettet';

  @override
  String get deleteAllPartial =>
      'Nogle elementer kunne ikke slettes. Prøv igen fra Indstillinger.';

  @override
  String get diagLogSection => 'Diagnostiklog';

  @override
  String get diagLogFooter =>
      'Fejl registreres kun på denne iPhone uden positioner, kontaktnavne eller telefonnumre. Der sendes intet, medmindre du selv deler loggen.';

  @override
  String get diagLogShare => 'Del diagnostiklog';

  @override
  String get diagLogEmpty => 'Tom';

  @override
  String get diagLogClear => 'Ryd log';

  @override
  String get diagLogClearTitle => 'Ryd diagnostiklog?';

  @override
  String get diagLogClearBody => 'Gemte fejlposter slettes fra denne iPhone.';

  @override
  String get diagLogCleared => 'Diagnostiklog ryddet';

  @override
  String get diagLogShareFailed => 'Kunne ikke dele diagnostiklogen.';

  @override
  String get privacyControls2 =>
      'Indstillinger › Privatliv og data › Slet alle data sletter alle klip, ture, kontakter, logge og indstillinger, som Corvista har gemt på denne iPhone.';

  @override
  String get parkingZoneStop => 'Stop';

  @override
  String get parkingZoneVeryClose => 'Meget tæt på';

  @override
  String get parkingZoneClose => 'Tæt på';

  @override
  String get parkingZoneNothingClose => 'Intet tæt på registreret';

  @override
  String get parkingNotDetected =>
      'Vægge, søjler, pæle og kantsten registreres ikke';

  @override
  String get parkingApprox => 'ca.';

  @override
  String get parkingSideLeft => 'Venstre';

  @override
  String get parkingSideCenter => 'Midte';

  @override
  String get parkingSideRight => 'Højre';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Kun visning fra frontkameraet — ikke et 360°-system';

  @override
  String get parkingMuteBeeps => 'Slå bip fra';

  @override
  String get parkingUnmuteBeeps => 'Slå bip til';

  @override
  String get parkingAbout => 'Om parkeringsvisning';

  @override
  String get parkingLimitationsDetail =>
      'Kun området foran kameraet overvåges. Detektoren genkender biler, busser og lastbiler, personer, cykler og motorcykler. Vægge, søjler, pæle, kantsten, pullerter, spærringer og lave forhindringer registreres IKKE, og motorhjelmen kan skjule jorden lige foran bilen. Afstande er grove skøn fra ét kamera (objektets størrelse og position) og kan være meget forkerte. Stilhed eller “Intet tæt på registreret” betyder ikke, at vejen er fri – se altid dig omkring og brug dine spejle.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Nærhed pr. side: venstre $left, midte $center, højre $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Fejl skrives til en privat log på denne iPhone (ingen positioner, kontaktnavne eller telefonnumre). Den sendes aldrig automatisk; du kan dele eller rydde den under Indstillinger › Diagnostik.';
}
