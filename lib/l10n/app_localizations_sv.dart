// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Se mer av varje resa.';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get commonDelete => 'Ta bort';

  @override
  String get commonSave => 'Spara';

  @override
  String get commonBack => 'Tillbaka';

  @override
  String get commonClose => 'Stäng';

  @override
  String get commonRetry => 'Försök igen';

  @override
  String get commonOpenSettings => 'Öppna Inställningar';

  @override
  String get commonLoading => 'Läser in…';

  @override
  String get commonError => 'Något gick fel.';

  @override
  String commonErrorDetail(String message) {
    return 'Något gick fel: $message';
  }

  @override
  String get commonOn => 'På';

  @override
  String get commonOff => 'Av';

  @override
  String get commonRename => 'Byt namn';

  @override
  String get commonShare => 'Dela';

  @override
  String get commonNotAvailable => 'Inte tillgängligt';

  @override
  String get commonTestFootage => 'TESTFILM';

  @override
  String get zoneVeryClose => 'Mycket nära';

  @override
  String get zoneClose => 'Nära';

  @override
  String get zoneMedium => 'Medel';

  @override
  String get zoneFar => 'Långt bort';

  @override
  String get zoneUnknown => 'Okänt';

  @override
  String get classPerson => 'Person';

  @override
  String get classBicycle => 'Cykel';

  @override
  String get classMotorcycle => 'Motorcykel';

  @override
  String get classCar => 'Fordon';

  @override
  String get classBus => 'Buss';

  @override
  String get classTrafficLight => 'Trafikljus';

  @override
  String get classStopSign => 'Stoppskylt';

  @override
  String get viewDetection => 'Detektering';

  @override
  String get viewVirtual => 'Virtuell';

  @override
  String get viewMap => 'Karta';

  @override
  String get viewParking => 'Parkering';

  @override
  String get viewPerception => 'Perception';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Rött';

  @override
  String get lightYellow => 'Gult';

  @override
  String get lightGreen => 'Grönt';

  @override
  String get lightUnknown => 'Okänt';

  @override
  String get clipsTitle => 'Klipp';

  @override
  String get clipsSelect => 'Markera';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count markerade',
      one: '1 markerat',
      zero: 'Markera klipp',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Markera alla';

  @override
  String get clipsDeselectAll => 'Avmarkera alla';

  @override
  String get clipsDeleteSelected => 'Ta bort markerade';

  @override
  String get clipsGridView => 'Rutnätsvy';

  @override
  String get clipsListView => 'Listvy';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ta bort $count klipp?',
      one: 'Ta bort klippet?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Videorna tas bort permanent från din iPhone. Det går inte att ångra.',
      one: 'Videon tas bort permanent från din iPhone. Det går inte att ångra.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp har tagits bort',
      one: 'Klippet har tagits bort',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Inga klipp än';

  @override
  String get clipsEmptyBody =>
      'Under körning sparar Corvista en kort rullande buffert. Tryck på Spara händelse för att behålla de senaste sekundernas film här.';

  @override
  String get clipsLoadError => 'Det gick inte att läsa in dina klipp.';

  @override
  String get clipsStorageTitle => 'Lagring';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Klipp $clips · Buffert $buffer · $free ledigt';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sparade klipp',
      one: '1 sparat klipp',
      zero: 'Inga sparade klipp',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Din iPhone har ont om lagringsutrymme. Nya händelser kanske inte kan sparas.';

  @override
  String get clipsMissingFile => 'Filen saknas';

  @override
  String get clipsEmergencyBadge => 'Kollision';

  @override
  String clipsUntitled(String date) {
    return 'Händelse · $date';
  }

  @override
  String get clipsAudio => 'Ljud inspelat';

  @override
  String get clipsFavorite => 'Favorit';

  @override
  String get clipsUnfavorite => 'Ta bort från favoriter';

  @override
  String get clipsLocation => 'Plats sparad';

  @override
  String clipsOpenClip(String title) {
    return 'Öppna klippet $title';
  }

  @override
  String get playerNotFoundTitle => 'Klippet hittades inte';

  @override
  String get playerNotFoundBody => 'Klippet kan ha tagits bort.';

  @override
  String get playerMissingTitle => 'Videofilen saknas';

  @override
  String get playerMissingBody =>
      'Inspelningen för det här klippet finns inte längre på din iPhone. Du kan ta bort posten från galleriet.';

  @override
  String get playerRemoveEntry => 'Ta bort post';

  @override
  String get playerLoadError => 'Videon kan inte spelas upp.';

  @override
  String get playerPlay => 'Spela upp';

  @override
  String get playerPause => 'Pausa';

  @override
  String get playerReplay => 'Spela igen';

  @override
  String get playerRenameTitle => 'Byt namn på klipp';

  @override
  String get playerRenameHint => 'Klippnamn';

  @override
  String get playerRenamed => 'Klippet har bytt namn';

  @override
  String get playerFavorited => 'Tillagd i favoriter';

  @override
  String get playerUnfavorited => 'Borttagen från favoriter';

  @override
  String get playerShareFailed => 'Det gick inte att dela klippet.';

  @override
  String get playerDetails => 'Detaljer';

  @override
  String get playerDate => 'Inspelat';

  @override
  String get playerDuration => 'Längd';

  @override
  String get playerResolution => 'Upplösning';

  @override
  String get playerSize => 'Filstorlek';

  @override
  String get playerAudio => 'Ljud';

  @override
  String get playerAudioYes => 'Inspelat';

  @override
  String get playerAudioNo => 'Inte inspelat';

  @override
  String get playerReason => 'Sparades av';

  @override
  String get playerReasonManual => 'Knappen Spara händelse';

  @override
  String get playerReasonEmergency => 'Möjlig kollisionsdetektering';

  @override
  String get playerReasonRecovered => 'Återskapat efter avbrott';

  @override
  String get playerSpeed => 'GPS-hastighet vid sparande';

  @override
  String get playerLocation => 'Plats';

  @override
  String get playerOpenInMaps => 'Öppna i Kartor';

  @override
  String get playerBack => 'Tillbaka';

  @override
  String get playerMore => 'Fler åtgärder';

  @override
  String get clipsFilterLabel => 'Visa';

  @override
  String get clipsFilterAll => 'Alla';

  @override
  String get clipsFilterRecordings => 'Inspelningar';

  @override
  String get clipsFilterIncidents => 'Händelser';

  @override
  String get clipsFilterEmergency => 'Nödfall';

  @override
  String get clipsFilterFavorites => 'Favoriter';

  @override
  String get clipsSort => 'Sortera';

  @override
  String get clipsSortNewest => 'Nyast först';

  @override
  String get clipsSortOldest => 'Äldst först';

  @override
  String get clipsSortLongest => 'Längst först';

  @override
  String get clipsSortLargest => 'Störst först';

  @override
  String get clipsToday => 'Idag';

  @override
  String get clipsYesterday => 'Igår';

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
  String get clipsFilterEmpty => 'Inga klipp i den här kategorin ännu.';

  @override
  String get clipsFavoritesEmpty =>
      'Stjärnmärk ett klipp för att behålla det här för snabb åtkomst.';

  @override
  String get clipsKindRecording => 'Inspelning';

  @override
  String get clipsKindIncident => 'Händelse';

  @override
  String get clipsKindEmergency => 'Nödfall';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Resa · $time';
  }

  @override
  String get clipsOpenTrip => 'Öppna resan där klippet spelades in';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used använt · $free ledigt';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Klipp använder $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count inspelningar',
      one: '1 inspelning',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count händelser',
      one: '1 händelse',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nödfall',
      one: '1 nödfall',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Frigör utrymme';

  @override
  String get clipsStorageLowGentle =>
      'Mindre än 2 GB ledigt. Frigör utrymme eller ta bort klipp du inte behöver för att fortsätta spela in smidigt.';

  @override
  String get clipsSaveToPhotos => 'Spara i Bilder';

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
      other: 'Ta bort $count klipp ($size)?',
      one: 'Ta bort klippet ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Sparar $done av $total i Bilder…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp sparade i Bilder',
      one: 'Sparat i Bilder',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved sparade i Bilder · $failed kunde inte sparas';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista får inte lägga till videor i Bilder. Du kan tillåta det i Inställningar.';

  @override
  String get clipsPhotosFailed => 'Kunde inte spara i Bilder.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp tillagda i favoriter',
      one: 'Tillagd i favoriter',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp borttagna från favoriter',
      one: 'Borttagen från favoriter',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (trimmat)';
  }

  @override
  String get playerTrim => 'Trimma';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Typ';

  @override
  String get playerReasonRecording => 'Inspelningsknapp';

  @override
  String get trimTitle => 'Trimma klipp';

  @override
  String get trimHint =>
      'Dra i handtagen för att välja delen som ska behållas. Originalklippet ändras inte.';

  @override
  String get trimStartHandle => 'Trimningsstart';

  @override
  String get trimEndHandle => 'Trimningsslut';

  @override
  String trimSelection(String duration) {
    return '$duration markerat';
  }

  @override
  String get trimSave => 'Spara som nytt klipp';

  @override
  String get trimSaving => 'Sparar trimmat klipp…';

  @override
  String get trimSaved => 'Trimmat klipp sparat';

  @override
  String get trimOpenNew => 'Öppna';

  @override
  String get trimFailed => 'Kunde inte trimma klippet.';

  @override
  String get trimStorageFull =>
      'Inte tillräckligt med ledigt utrymme för att spara det trimmade klippet.';

  @override
  String get trimPreview => 'Spela upp markering';

  @override
  String get settingsTitle => 'Inställningar';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Aviseringar';

  @override
  String get settingsSectionAlertCategories => 'Aviseringskategorier';

  @override
  String get settingsSectionRecording => 'Inspelning';

  @override
  String get settingsSectionDriving => 'Körning';

  @override
  String get settingsSectionPower => 'Energi';

  @override
  String get settingsSectionEmergency => 'Nödsituation';

  @override
  String get settingsSectionAppearance => 'Utseende';

  @override
  String get settingsSectionLanguage => 'Språk';

  @override
  String get settingsSectionInformation => 'Information';

  @override
  String get settingsCameraLens => 'Kameralins';

  @override
  String get settingsLensWide => 'Vidvinkel';

  @override
  String get settingsLensUltraWide => 'Ultravidvinkel';

  @override
  String get settingsLensTelephoto => 'Tele';

  @override
  String get settingsLensUnavailable => 'Inte tillgängligt på den här iPhone';

  @override
  String get settingsStabilization => 'Stabilisering';

  @override
  String get settingsStabAuto => 'Automatisk';

  @override
  String get settingsStabOff => 'Av';

  @override
  String get settingsStabStandard => 'Standard';

  @override
  String get settingsStabCinematic => 'Filmisk';

  @override
  String get settingsOverlayOpacity => 'Överlagringens opacitet';

  @override
  String get settingsShowFps => 'Visa prestandastatistik';

  @override
  String get settingsShowFpsSubtitle =>
      'Bildfrekvens och inferenstid i detekteringsvyn';

  @override
  String get settingsCameraFooter =>
      'Ändringar av lins och stabilisering gäller nästa gång kameran startar.';

  @override
  String get settingsAiModel => 'AI-modell';

  @override
  String get settingsConfidence => 'Detekteringskänslighet';

  @override
  String get settingsTracking => 'Objektspårning';

  @override
  String get settingsTrackingSubtitle =>
      'Håller objekt stabila mellan bildrutor';

  @override
  String get settingsShowLabels => 'Visa etiketter';

  @override
  String get settingsShowConfidence => 'Visa säkerhet';

  @override
  String get settingsSegmentationOpacity => 'Perceptionsmaskens opacitet';

  @override
  String get settingsAiFooter =>
      'Lägre säkerhet visar fler objekt men också fler felaktiga detekteringar. Detekteringar kan vara felaktiga.';

  @override
  String get settingsVoiceAlerts => 'Röstaviseringar';

  @override
  String get settingsVoiceLanguage => 'Röstspråk';

  @override
  String get settingsVoiceLanguageAuto => 'Samma som appens språk';

  @override
  String get settingsVoice => 'Röst';

  @override
  String get settingsVoiceDefault => 'Systemstandard';

  @override
  String get settingsVoiceQualityEnhanced => 'Förbättrad';

  @override
  String get settingsVoiceQualityPremium => 'Hög kvalitet';

  @override
  String get settingsNoVoices =>
      'Ingen röst är installerad för det här språket. Lägg till en i iOS Inställningar › Tillgänglighet › Uppläst innehåll.';

  @override
  String get settingsAlertPedestrian => 'Fotgängare';

  @override
  String get settingsAlertCyclist => 'Cyklister';

  @override
  String get settingsAlertMotorcycle => 'Motorcyklar';

  @override
  String get settingsAlertBus => 'Bussar';

  @override
  String get settingsAlertVehicleClose => 'Fordon mycket nära framför';

  @override
  String get settingsAlertTrafficLight => 'Trafikljus som växlar';

  @override
  String get settingsAlertTrafficMoving => 'Trafiken framför rör sig';

  @override
  String get settingsAlertStopSign => 'Stoppskyltar';

  @override
  String get settingsSensitivity => 'Känslighet';

  @override
  String get settingsSensitivityLow => 'Låg';

  @override
  String get settingsSensitivityMedium => 'Medel';

  @override
  String get settingsSensitivityHigh => 'Hög';

  @override
  String get settingsCooldown => 'Upprepningsintervall';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Röstvolym';

  @override
  String get settingsQuietMode => 'Tyst läge';

  @override
  String get settingsQuietModeSubtitle =>
      'Endast de viktigaste aviseringarna läses upp';

  @override
  String get settingsTestVoice => 'Testa rösten';

  @override
  String get settingsTestVoiceDone => 'Spelar upp en exempelavisering…';

  @override
  String get settingsParkingBeeps => 'Parkeringssignaler';

  @override
  String get settingsBeepVolume => 'Signalvolym';

  @override
  String get settingsAlertsFooter =>
      'Aviseringar är enbart ett hjälpmedel. Håll alltid uppsikt över vägen – tystnad betyder inte att vägen är fri.';

  @override
  String get settingsRecordingProfile => 'Inspelningskvalitet';

  @override
  String get settingsProfileStandard => 'Standard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Händelsebuffert';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds sekunder';
  }

  @override
  String get settingsManualMaxLength => 'Maxlängd för manuell inspelning';

  @override
  String get settingsManualMaxUnlimited => 'Obegränsad';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Spela in ljud';

  @override
  String get settingsRecordAudioSubtitle =>
      'Tar med kupéljud i sparade händelser';

  @override
  String get settingsMicDenied =>
      'Mikrofonåtkomst är avstängd. Tillåt den i Inställningar för att spela in ljud.';

  @override
  String get settingsWatermark => 'Corvista-vattenstämpel';

  @override
  String get settingsTimestamp => 'Datum- och tidsstämpel';

  @override
  String get settingsSaveLocation => 'Spara plats med klipp';

  @override
  String get settingsStorage => 'Lagring och klipp';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klipp',
      one: '1 klipp',
      zero: 'Inga klipp',
    );
    return '$_temp0 · $used använt · $free ledigt';
  }

  @override
  String get settingsRecordingFooter =>
      'Den rullande bufferten finns kvar på din iPhone och skrivs över löpande. Inget spelas in i bakgrunden.';

  @override
  String get settingsDefaultView => 'Standardvy';

  @override
  String get settingsUnits => 'Enheter';

  @override
  String get settingsShowCompass => 'Visa kompass';

  @override
  String get settingsHudStyle => 'HUD-stil';

  @override
  String get settingsHudCustomize => 'Anpassa HUD';

  @override
  String get settingsDrivingSide => 'Körfält';

  @override
  String get settingsDrivingSideAuto => 'Automatisk';

  @override
  String get settingsDrivingSideRight => 'Höger';

  @override
  String get settingsDrivingSideLeft => 'Vänster';

  @override
  String get settingsVirtualStyle => 'Stil för virtuell vy';

  @override
  String get settingsVirtualMinimal => 'Minimal';

  @override
  String get settingsVirtualPerspective => 'Perspektiv';

  @override
  String get settingsVirtualHighContrast => 'Hög kontrast';

  @override
  String get settingsKeepScreenOn => 'Håll skärmen på under körning';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Visa körvägledning på låsskärmen och i Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Inspelningen pausades medan Corvista låg i bakgrunden';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Pausad';

  @override
  String get liveActivityDashcamOff => 'Kamera av';

  @override
  String get liveActivityEnded => 'Navigeringen avslutad';

  @override
  String get liveActivityEta => 'Ankomst';

  @override
  String get settingsAutoRecenter => 'Centrera kartan automatiskt';

  @override
  String get settingsHudStyleClassic => 'Klassisk';

  @override
  String get settingsHudStyleGrid => 'Rutnät';

  @override
  String get settingsHudStyleMinimal => 'Minimal';

  @override
  String get settingsHudStylePerformance => 'Prestanda';

  @override
  String get settingsHudStyleNavigation => 'Navigering';

  @override
  String get settingsHudStyleNight => 'Natt';

  @override
  String get settingsHudStyleHighContrast => 'Hög kontrast';

  @override
  String get settingsPowerMode => 'Energiläge';

  @override
  String get settingsPowerBalanced => 'Balanserat';

  @override
  String get settingsPowerPerformance => 'Prestanda';

  @override
  String get settingsPowerSaver => 'Energisparläge';

  @override
  String get settingsPowerFooter =>
      'Corvista sänker AI-frekvensen och de visuella effekterna automatiskt när din iPhone blir varm eller batteriet är lågt.';

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
    return '$percent · Laddar';
  }

  @override
  String get settingsLowPowerMode =>
      'Lågenergiläge är på – AI körs med lägre frekvens.';

  @override
  String get settingsAiRate => 'Aktuell AI-frekvens';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Kollisionsdetektering';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'På · $seconds s nedräkning';
  }

  @override
  String get settingsEmergencyFooter =>
      'Experimentell. Ersätter inte nödtjänster.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeDark => 'Mörkt';

  @override
  String get settingsThemeLight => 'Ljust';

  @override
  String get settingsReduceMotion => 'Minska rörelser';

  @override
  String get settingsReduceMotionSubtitle =>
      'Minimerar animationer i hela appen';

  @override
  String get settingsAppLanguage => 'Appens språk';

  @override
  String get settingsPrivacyPolicy => 'Integritetspolicy';

  @override
  String get settingsTerms => 'Användarvillkor';

  @override
  String get settingsHelp => 'Hjälp';

  @override
  String get settingsSupport => 'Kontakta support';

  @override
  String get settingsLicenses => 'Licenser för öppen källkod';

  @override
  String get settingsSupportUnavailable =>
      'Det gick inte att öppna Mail. Skriv till support@corvista.app.';

  @override
  String get settingsSafety => 'Säkerhetsinformation';

  @override
  String get settingsDiagnostics => 'Diagnostik';

  @override
  String get settingsVersion => 'Version';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Anpassa HUD';

  @override
  String get hudCustomPreview => 'Förhandsvisning · exempelvärden';

  @override
  String get hudCustomStyle => 'Stil';

  @override
  String get hudCustomElements => 'Element';

  @override
  String get hudCustomSpeed => 'Hastighet';

  @override
  String get hudCustomHeading => 'Riktning och kompass';

  @override
  String get hudCustomClock => 'Klocka';

  @override
  String get hudCustomBattery => 'Batteri och temperatur';

  @override
  String get hudCustomDetections => 'AI-status och detekteringar';

  @override
  String get hudCustomWeather => 'Väder';

  @override
  String get hudCustomAppearance => 'Storlek och opacitet';

  @override
  String get hudCustomSize => 'Storlek';

  @override
  String get hudCustomOpacity => 'Opacitet';

  @override
  String get hudCustomFooter =>
      'Varningar, till exempel för överhettning, visas alltid, även när element är dolda.';

  @override
  String get hudCustomDescClassic => 'Balanserad instrumentpanel';

  @override
  String get hudCustomDescGrid => 'Perspektivrutnät över vägen';

  @override
  String get hudCustomDescMinimal => 'Bara hastighet, inget annat';

  @override
  String get hudCustomDescPerformance => 'Hastighetsbåge med liveavläsningar';

  @override
  String get hudCustomDescNavigation => 'Nästa manöver först';

  @override
  String get hudCustomDescNight => 'Dämpad och rödtonad för nattkörning';

  @override
  String get hudCustomDescHighContrast => 'Maximal läsbarhet i stark sol';

  @override
  String get languageTitle => 'Språk';

  @override
  String get languageSystem => 'Systemstandard';

  @override
  String get languageSystemSubtitle => 'Följ språket på din iPhone';

  @override
  String get languageFooter =>
      'Fler språk kommer. Språket för röstaviseringar kan ställas in separat under Aviseringar.';

  @override
  String get diagTitle => 'Diagnostik';

  @override
  String get diagPerformance => 'Prestanda';

  @override
  String get diagInference => 'Inferenstid';

  @override
  String get diagDetectHz => 'Detekteringsfrekvens';

  @override
  String get diagCameraFps => 'Kamerans bildfrekvens';

  @override
  String get diagMemory => 'Minne';

  @override
  String get diagDropped => 'Tappade bildrutor';

  @override
  String get diagSegmentation => 'Segmenteringstid';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Status';

  @override
  String get diagSource => 'Källa';

  @override
  String get diagSourceCamera => 'Livekamera';

  @override
  String get diagSourceFile => 'Testfilmfil';

  @override
  String get diagResolution => 'Buffertstorlek';

  @override
  String get diagLens => 'Lins';

  @override
  String get diagError => 'Senaste fel';

  @override
  String get diagModel => 'AI-modell';

  @override
  String get diagModelLoad => 'Modellens inläsningstid';

  @override
  String get diagPower => 'Energi';

  @override
  String get diagSegHz => 'Segmenteringsfrekvens';

  @override
  String get diagReduced => 'Minskade effekter';

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
  String get diagCamStarting => 'Startar';

  @override
  String get diagCamRunning => 'Körs';

  @override
  String get diagCamInterrupted => 'Avbruten';

  @override
  String get diagCamStopped => 'Stoppad';

  @override
  String get diagCamUnavailable => 'Otillgänglig';

  @override
  String get diagCamPermissionDenied => 'Behörighet nekad';

  @override
  String get diagCamError => 'Fel';

  @override
  String get diagTestFootage => 'Testfilm';

  @override
  String get diagTestFootageBody =>
      'Kör verklig detektering på enheten på en lokal videofil i stället för kameran. Varje vy märker den TESTFILM.';

  @override
  String get diagPathLabel => 'Sökväg till videofil';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Använd Documents/test_drive.mp4';

  @override
  String get diagRun => 'Kör testfilm';

  @override
  String get diagRunStarted =>
      'Testfilmen har startat. Öppna körvyn för att se den.';

  @override
  String get diagBackToCamera => 'Tillbaka till livekameran';

  @override
  String get diagDebugOnly =>
      'Testfilm är bara tillgänglig i utvecklingsversioner.';

  @override
  String get diagFileMissing => 'Ingen fil finns på den sökvägen.';

  @override
  String get emergencySetupTitle => 'Kollisionsdetektering';

  @override
  String get emergencyExperimental => 'Experimentell';

  @override
  String get emergencyIntro =>
      'Under en resa kan Corvista bevaka en möjlig kraftig kollision med hjälp av iPhones rörelsesensorer. Om en upptäcks startar en nedräkning. Om du inte avbryter den erbjuder Corvista att ringa nödtjänster och skicka meddelande till dina kontakter.';

  @override
  String get emergencyDisclaimer1 =>
      'Ersätter inte nödtjänster eller fordonets egen krockdetektering.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS ber dig alltid bekräfta innan ett samtal rings eller ett meddelande skickas.';

  @override
  String get emergencyDisclaimer3 =>
      'Kollisioner kan missas, och hård inbromsning eller gupp kan misstas för en kollision.';

  @override
  String get emergencyParkedWarning =>
      'Slutför den här konfigurationen när du står parkerad. Inställningarna är låsta när fordonet rör sig.';

  @override
  String get emergencyEnable => 'Aktivera kollisionsdetektering';

  @override
  String get emergencyEnableSubtitle => 'Aktiv endast under en körning';

  @override
  String get emergencyNeedNumber => 'Lägg först till ett nödnummer.';

  @override
  String get emergencyContacts => 'Nödkontakter';

  @override
  String get emergencyAddContact => 'Lägg till kontakt';

  @override
  String get emergencyNoContacts =>
      'Inga kontakter än. Kontakter får meddelande först efter att du har bekräftat det.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Ta bort $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Personen erbjuds inte längre som mottagare efter en kollision.';

  @override
  String get emergencyRemove => 'Ta bort';

  @override
  String get emergencyContactsError => 'Det gick inte att läsa in kontakter.';

  @override
  String get emergencyNumber => 'Nödnummer';

  @override
  String get emergencyNumberHint => 't.ex. 112 eller 911';

  @override
  String get emergencyMessage => 'Meddelandemall';

  @override
  String get emergencyMessageDefault =>
      'Jag kan ha varit med om en trafikolycka. Det här meddelandet har förberetts av Corvista och innehåller min senast kända plats om den är tillgänglig.';

  @override
  String get emergencyMessageHint =>
      'Lämna tomt för att använda standardmeddelandet.';

  @override
  String get emergencyCountdown => 'Nedräkningens längd';

  @override
  String get emergencyVoiceCancel => 'Avbryt med rösten';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Säg ”Jag mår bra” eller ”Avbryt” under nedräkningen. Använder taligenkänning på enheten där det är möjligt.';

  @override
  String get emergencyVoicePermDenied =>
      'Åtkomst till mikrofon och taligenkänning krävs för att avbryta med rösten.';

  @override
  String get emergencyAutoSave => 'Spara händelseklipp automatiskt';

  @override
  String get emergencyTest => 'Testa nedräkning (inget samtal)';

  @override
  String get emergencyTestBody =>
      'Kör en simulerad kollision så att du kan se nedräkningen. Inga samtal eller meddelanden görs någonsin i testläge.';

  @override
  String get emergencyNotSet => 'Inte angivet';

  @override
  String get emergencyAlertHeadline => 'Möjlig kraftig kollision upptäckt.';

  @override
  String get emergencyAlertSubtitle => 'Mår du bra?';

  @override
  String get emergencyAlertCancel => 'Jag mår bra – Avbryt';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds sekunder kvar',
      one: '1 sekund kvar',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Lyssnar – säg ”Jag mår bra” för att avbryta';

  @override
  String emergencyAlertHeard(String text) {
    return 'Hörde: ”$text”';
  }

  @override
  String get emergencyAlertEscalated => 'Inget svar. Välj vad du vill göra:';

  @override
  String get emergencyAlertCall => 'Ring nödtjänster';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Ringer $number. iOS ber dig bekräfta.';
  }

  @override
  String get emergencyAlertMessage => 'Meddela kontakter';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Öppnar ett förberett meddelande. Du väljer om det ska skickas.';

  @override
  String get emergencyAlertTestMode =>
      'Testläge – inget samtal kommer att ringas';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'Jag mår bra – Stäng';

  @override
  String get emergencyMsgSent => 'Meddelandet har skickats.';

  @override
  String get emergencyMsgCancelled => 'Meddelandet skickades inte.';

  @override
  String get emergencyMsgFailed => 'Det gick inte att skicka meddelandet.';

  @override
  String get emergencyMsgUnavailable =>
      'Meddelanden är inte tillgängliga på den här enheten.';

  @override
  String emergencyCallFailed(String number) {
    return 'Det gick inte att starta samtalet. Ring $number själv.';
  }

  @override
  String get modelsTitle => 'AI-modeller';

  @override
  String get modelsIntro =>
      'Alla modeller följer med appen och körs helt på din iPhone. Din kamerabild lämnar aldrig enheten.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Live: $ms ms per bildruta · $hz detekteringar/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Inläst på $ms ms';
  }

  @override
  String get modelsEfficientName => 'Effektiv';

  @override
  String get modelsEfficientDesc =>
      'Snabb, kompakt detektor anpassad för långa resor med låg värme och lågt batteriutnyttjande.';

  @override
  String get modelsEnhancedName => 'Förbättrad';

  @override
  String get modelsEnhancedDesc =>
      'Större detektor som hittar mindre och mer avlägsna objekt, till en högre energikostnad.';

  @override
  String get modelsSegmentationName => 'Segmentering';

  @override
  String get modelsSegmentationDesc =>
      'Kombinerar snabb detektering med masker för vägyta och objekt i Perception-vyn.';

  @override
  String get modelsNoneName => 'AI pausad';

  @override
  String get modelsNoneDesc =>
      'Kameran och inspelningen fortsätter utan objektdetektering. Lägst energiförbrukning.';

  @override
  String get modelsGenericDesc => 'Modell för objektdetektering på enheten.';

  @override
  String get modelsFunctionDetection =>
      'Upptäcker fordon, personer, cyklar, motorcyklar, bussar, trafikljus och stoppskyltar';

  @override
  String get modelsFunctionSegmentation =>
      'Lägger till masker för vägyta och objekt';

  @override
  String get modelsFunctionNone =>
      'Ingen detektering; endast bilkamerainspelning';

  @override
  String get modelsSize => 'Storlek';

  @override
  String get modelsInput => 'Indata';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Fungerar med';

  @override
  String get modelsStatusInstalled => 'Installerad (medföljer)';

  @override
  String get modelsStatusNotInstalled => 'Inte installerad';

  @override
  String get modelsSelected => 'Vald';

  @override
  String get modelsUse => 'Använd den här modellen';

  @override
  String get modelsSwitching => 'Läser in modell…';

  @override
  String modelsSwitched(String name) {
    return '$name är nu aktiv';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Uppmätt på den här enheten: $ms ms i genomsnitt';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Inte uppmätt på den här enheten';

  @override
  String get modelsBenchmarkRun => 'Kör prestandatest';

  @override
  String get modelsBenchmarkRunning => 'Testar prestanda…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Välj den här modellen för att testa den.';

  @override
  String get modelsBenchmarkDone => 'Prestandatestet är klart';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Prestandatestet misslyckades: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Senast uppdaterad $date';
  }

  @override
  String get safetyTitle => 'Säkerhetsinformation';

  @override
  String get safetyIntro =>
      'Corvista är ett hjälpmedel för uppmärksamhet under körning. Det styr inte ditt fordon och kan inte ersätta din egen uppmärksamhet, ditt omdöme eller fordonets säkerhetssystem.';

  @override
  String get safetyBeforeTitle => 'Innan du kör';

  @override
  String get safetyBefore1 =>
      'Montera din iPhone stadigt på en tillåten plats som inte skymmer sikten, krockkuddar eller reglage.';

  @override
  String get safetyBefore2 =>
      'Slutför konfigurationen, välj vy och ange destination när du står parkerad.';

  @override
  String get safetyBefore3 =>
      'Anslut en laddare vid längre resor och undvik direkt solljus på telefonen om möjligt.';

  @override
  String get safetyWhileTitle => 'Under körning';

  @override
  String get safetyWhile1 =>
      'Håll blicken på vägen. Använd bara de stora reglagen på skärmen när det är säkert och lagligt.';

  @override
  String get safetyWhile2 =>
      'Aviseringar är hjälpmedel, inte varningar du kan lita på. Tystnad betyder aldrig att vägen är fri.';

  @override
  String get safetyWhile3 =>
      'Följ trafikregler, signaler och vägskyltar – inte appen – när de säger emot varandra.';

  @override
  String get safetyLimitsTitle => 'Begränsningar';

  @override
  String get safetyLimits1 =>
      'En enda telefonkamera ser bara det som finns framför den. Objekt utanför bildfältet, skymda eller mycket nära upptäcks inte.';

  @override
  String get safetyLimits2 =>
      'Detekteringar kan utebli, komma sent eller vara felaktiga, särskilt på natten, i regn, dimma, bländning eller med smutsig vindruta.';

  @override
  String get safetyLimits3 =>
      'Endast vissa kategorier känns igen: fordon, bussar, motorcyklar, cyklar, personer, trafikljus och stoppskyltar. Körfältshjälplinjer i den virtuella vyn är stiliserade, inte detekterade körfält.';

  @override
  String get safetyLimits4 =>
      'Närhet visas som ungefärliga zoner (Mycket nära, Nära, Medel, Långt bort), aldrig som uppmätta avstånd. Parkeringsvyn ersätter inte parkeringssensorer.';

  @override
  String get safetyHeatTitle => 'Värme och batteri';

  @override
  String get safetyHeat1 =>
      'Kontinuerlig användning av kameran och AI värmer upp din iPhone. Corvista sänker analysfrekvensen när enheten blir het och visar en varning. Om iOS överhettas kan kameran stängas av.';

  @override
  String get safetyEmergencyTitle => 'Nödfunktion';

  @override
  String get safetyEmergency1 =>
      'Detektering av möjlig kollision är experimentell. Den kan missa verkliga krascher och kan utlösas av andra händelser.';

  @override
  String get safetyEmergency2 =>
      'Den kontaktar aldrig någon i det tysta: iOS ber dig alltid bekräfta ett samtal eller meddelande. Den ersätter inte att själv ringa nödtjänster.';

  @override
  String get privacyTitle => 'Integritet';

  @override
  String get privacyIntro =>
      'Corvista är utformat för att hålla dina körningsdata på din iPhone. Det finns inget Corvista-konto, och Corvista driver inga egna servrar.';

  @override
  String get privacyCameraTitle => 'Kamera och AI';

  @override
  String get privacyCamera1 =>
      'Objektdetektering, spårning och segmentering körs helt på din iPhone. Kamerabilder laddas aldrig upp.';

  @override
  String get privacyCamera2 =>
      'Kameran körs bara medan Corvista är öppet på skärmen. Den pausas när appen går till bakgrunden – det finns ingen dold bakgrundsinspelning.';

  @override
  String get privacyRecordingsTitle => 'Inspelningar';

  @override
  String get privacyRecordings1 =>
      'Den rullande bufferten är tillfällig och skrivs över löpande. Film sparas bara när du trycker på Spara händelse eller, om du aktiverar det, efter en möjlig kollision.';

  @override
  String get privacyRecordings2 =>
      'Sparade klipp finns kvar i Corvistas privata lagring på din iPhone. De lämnar enheten bara när du väljer Dela. Om du tar bort appen tas de bort.';

  @override
  String get privacyRecordings3 =>
      'Ljud spelas bara in om du slår på det och ger mikrofonåtkomst.';

  @override
  String get privacyLocationTitle => 'Plats';

  @override
  String get privacyLocation1 =>
      'Platsen används medan appen är öppen för din hastighet, kartan, rutter och väder. Om ”Spara plats” är på lagras positionen vid sparandet med klippet på din enhet.';

  @override
  String get privacyNetworkTitle => 'Nätverkstjänster';

  @override
  String get privacyNetwork1 =>
      'Apple Maps – kartvisning, platssökning och rutter. Din söktext och ungefärliga plats skickas till Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) – aktuellt väder och timväder för din plats.';

  @override
  String get privacyNetwork4 =>
      'Corvista innehåller ingen reklam och ingen analys eller spårning från tredje part.';

  @override
  String get privacyEmergencyTitle => 'Nödkontakter';

  @override
  String get privacyEmergency1 =>
      'Kontakter du väljer lagras i iOS-nyckelringen på den här enheten. Röstavbrott använder taligenkänning på enheten där det är möjligt. Samtal och meddelanden skickas först efter att du har bekräftat dem i iOS.';

  @override
  String get privacyControlsTitle => 'Dina val';

  @override
  String get privacyControls1 =>
      'Du kan ta bort klipp när som helst under Klipp, och ändra eller återkalla åtkomst till kamera, mikrofon, plats och tal i iOS Inställningar.';

  @override
  String get termsTitle => 'Användarvillkor';

  @override
  String get termsIntro =>
      'Genom att använda Corvista godkänner du dessa villkor. Apples standardlicensavtal för slutanvändare (Licensed Application End User License Agreement) gäller också.';

  @override
  String get termsUseTitle => 'Använda Corvista';

  @override
  String get termsUse1 =>
      'Corvista är ett hjälpmedel för uppmärksamhet under körning och för bilkamera. Du har alltid fullt ansvar för att köra säkert och lagligt.';

  @override
  String get termsUse2 =>
      'Använd inte appen på sätt som distraherar dig under körning. Montera enheten stadigt och lagligt.';

  @override
  String get termsAccuracyTitle => 'Ingen garanti för noggrannhet';

  @override
  String get termsAccuracy1 =>
      'Detekteringar, zoner, aviseringar, kartmarkörer, rutter och väder kan vara ofullständiga, försenade eller felaktiga. Corvista styr inte ditt fordon.';

  @override
  String get termsAccuracy2 =>
      'Nödfunktionen är experimentell och kan misslyckas med att upptäcka en kollision eller utlösas felaktigt.';

  @override
  String get termsRecordingTitle => 'Lagar om inspelning';

  @override
  String get termsRecording1 =>
      'Lagar om bilkameror, ljudinspelning och filmning av personer skiljer sig mellan länder och regioner. Du ansvarar för att följa dem, även när du delar klipp.';

  @override
  String get termsLiabilityTitle => 'Ansvar';

  @override
  String get termsLiability1 =>
      'Appen tillhandahålls ”i befintligt skick”. I den utsträckning lagen tillåter ansvarar utvecklaren inte för olyckor, förluster, böter eller skador som uppstår genom användningen eller genom att man förlitar sig på dess resultat.';

  @override
  String get termsChangesTitle => 'Ändringar';

  @override
  String get termsChanges1 =>
      'Dessa villkor kan uppdateras med nya versioner av appen. Fortsatt användning efter en uppdatering innebär att du godkänner de reviderade villkoren.';

  @override
  String get helpTitle => 'Hjälp';

  @override
  String get helpIntro =>
      'Svar på vanliga frågor. För säkerhetsvägledning, se Säkerhetsinformation.';

  @override
  String get helpQSave => 'Hur sparar jag film av en händelse?';

  @override
  String get helpASaveBuffer =>
      'Tryck på den stora knappen Spara händelse i körvyn. Corvista sparar de senaste 20 eller 30 sekunderna av sin rullande buffert (ditt val under Inställningar › Inspelning) i Klipp.';

  @override
  String get helpQWhere => 'Var lagras mina klipp?';

  @override
  String get helpAWhere =>
      'I Corvistas privata lagring på din iPhone. De laddas aldrig upp. Använd Dela i spelaren för att skicka eller exportera ett klipp.';

  @override
  String get helpQZones => 'Hur exakta är närhetszonerna?';

  @override
  String get helpAZones =>
      'Zonerna är grova uppskattningar från en enda kamera utifrån typiska objektstorlekar. Se dem som ungefärliga tips, aldrig som avstånd.';

  @override
  String get helpQSlow => 'Varför blir detekteringen långsammare?';

  @override
  String get helpASlow =>
      'När din iPhone blir varm, batteriet är lågt eller Lågenergiläge är på sänker Corvista analysfrekvensen för att skydda enheten. Du kan ändra energiläget i Inställningar.';

  @override
  String get helpQMap => 'Kartan, sökningen eller vädret fungerar inte.';

  @override
  String get helpAMap =>
      'Dessa funktioner kräver internetanslutning och platsåtkomst. Kontrollera anslutningen och tillåt plats för Corvista i iOS Inställningar.';

  @override
  String get helpQSimulator => 'Kameran visas som otillgänglig.';

  @override
  String get helpASimulator =>
      'Kontrollera att kameraåtkomst är tillåten i iOS Inställningar och att ingen annan app använder kameran. I iOS Simulator finns ingen kamera. Där kan en lokal testvideo användas i stället.';

  @override
  String get emergencyMsgNoContacts => 'Lägg först till en nödkontakt.';

  @override
  String get cameraStarting => 'Startar kameran…';

  @override
  String get cameraInterrupted => 'Kameran pausad';

  @override
  String get cameraInterruptedBody =>
      'iOS pausade kameran, till exempel under ett samtal eller när en annan app använder den. Den återupptas automatiskt.';

  @override
  String get cameraUnavailable => 'Kameran är inte tillgänglig';

  @override
  String get cameraUnavailableBody =>
      'Ingen kamera är tillgänglig på den här enheten. Detekterings-, inspelnings- och parkeringsvyerna kräver bakkameran.';

  @override
  String get cameraRunTestFootage => 'Kör testfilm';

  @override
  String get cameraPermissionDenied => 'Kameraåtkomst är avstängd';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista behöver kameran för detektering, bilkamerainspelning och parkeringsvyer. Slå på kameraåtkomst i Inställningar.';

  @override
  String get cameraError => 'Kamerafel';

  @override
  String get cameraStopped => 'Kameran stoppad';

  @override
  String get cameraStart => 'Starta kameran';

  @override
  String get cameraFocusHint => 'Tryck för att fokusera';

  @override
  String get cameraPreviewLabel => 'Livevy från kameran med upptäckta objekt';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · AI $hz Hz · $ms ms · tappade $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Hastighet $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Ingen GPS-hastighet';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Riktning $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Inspelning av bilkamerabuffert, $seconds av $target sekunder buffrade';
  }

  @override
  String get hudRecIdle => 'REC av';

  @override
  String get hudRecSaving => 'Sparar…';

  @override
  String get hudRecError => 'REC-fel';

  @override
  String get hudAiPaused => 'AI pausad';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objekt',
      one: '1 objekt',
      zero: 'Inga objekt',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objekt',
      one: '1 objekt',
      zero: 'inga objekt',
    );
    return 'AI-modell $model, $_temp0 upptäckta';
  }

  @override
  String get hudThermalSerious => 'Het – AI saktas ned';

  @override
  String get hudThermalCritical => 'För het – AI pausad';

  @override
  String hudBatteryLow(String percent) {
    return 'Batteri $percent';
  }

  @override
  String get hudLowPower => 'Lågenergiläge';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Väder $temperature, $condition. Tryck för detaljer.';
  }

  @override
  String get hudNoGuidance =>
      'Sök efter en destination i kartvyn för att se körvägledning här.';

  @override
  String get navArrived => 'Du har anlänt';

  @override
  String get navRerouting => 'Beräknar ny rutt…';

  @override
  String get navSearchHint => 'Sök destination';

  @override
  String get navSearchFieldHint => 'Adress, plats eller företag';

  @override
  String get navNoResults => 'Inga matchande platser';

  @override
  String get navSearching => 'Söker…';

  @override
  String get navSearchStartTyping =>
      'Skriv en adress eller ett platsnamn. Resultaten kommer från Apple Maps och kräver internetanslutning.';

  @override
  String get navErrorUnavailable =>
      'Sökning och rutter är inte tillgängliga – kontrollera din internetanslutning.';

  @override
  String get navErrorNoLocation =>
      'Väntar på din plats för att planera en rutt.';

  @override
  String get navErrorPermission =>
      'Platsåtkomst är avstängd, så rutter kan inte starta från din position.';

  @override
  String navErrorGeneric(String code) {
    return 'Det gick inte att läsa in rutter ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Rutter till $place';
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
  String get navStart => 'Starta';

  @override
  String get navEnd => 'Avsluta';

  @override
  String get navEndLabel => 'Avsluta navigeringen';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration kvar';
  }

  @override
  String navAdvisory(String text) {
    return 'Information: $text';
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
    return '$hours h $minutes min';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Rutt $index: $name';
  }

  @override
  String get weatherTitle => 'Väder';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Känns som $temperature';
  }

  @override
  String get weatherPrecipitation => 'Nederbörd';

  @override
  String get weatherWind => 'Vind';

  @override
  String get weatherVisibility => 'Sikt';

  @override
  String get weatherHumidity => 'Luftfuktighet';

  @override
  String get weatherHourly => 'Kommande timmar';

  @override
  String weatherAsOf(String time) {
    return 'Uppdaterat $time';
  }

  @override
  String get weatherRefresh => 'Uppdatera vädret';

  @override
  String get weatherUnavailable => 'Vädret är inte tillgängligt just nu.';

  @override
  String get weatherNoLocation => 'Vädret kräver din plats.';

  @override
  String get weatherLegal => 'Datakällor och juridik';

  @override
  String weatherProvidedBy(String service) {
    return 'Väderdata: $service';
  }

  @override
  String get weatherNow => 'Nu';

  @override
  String get virtualEmpty => 'Inga objekt som stöds upptäcktes';

  @override
  String get virtualEmptyCameraOff => 'Den virtuella vyn kräver livekameran.';

  @override
  String get virtualLaneDisclaimer =>
      'Körfältslinjerna är illustrativa, inte detekterade.';

  @override
  String virtualNearest(String zone) {
    return 'Närmast: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtuell vägscen: $summary';
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
  String get virtualStatusPaused => 'pausad';

  @override
  String get virtualStatusCameraOff => 'Kameran av';

  @override
  String get virtualStatusTestFootage => 'Testfilm';

  @override
  String get virtualEmptyHint =>
      'Fordon, personer, cyklar, trafikljus och stoppskyltar visas här när de upptäcks.';

  @override
  String get mapRecenter => 'Centrera';

  @override
  String get mapZoomIn => 'Zooma in';

  @override
  String get mapZoomOut => 'Zooma ut';

  @override
  String get mapUnsupported => 'Den interaktiva kartan finns på iPhone.';

  @override
  String get mapObjectsApprox => 'Objektmarkörer visar ungefärliga positioner.';

  @override
  String get mapWeatherUnavailable => 'Vädret är inte tillgängligt';

  @override
  String get navErrorNoRoute =>
      'Ingen rutt hittades till den här destinationen.';

  @override
  String get navDismiss => 'Stäng';

  @override
  String get navGo => 'Kör';

  @override
  String get navFastest => 'Snabbast';

  @override
  String get navThen => 'Sedan';

  @override
  String get navRecents => 'Senaste';

  @override
  String get navClearRecents => 'Rensa';

  @override
  String get navSearchSubmitHint =>
      'Tryck på Sök för att se alla matchande platser';

  @override
  String get navPlaces => 'Platser';

  @override
  String get navEtaLabel => 'ankomst';

  @override
  String get navTimeLeftLabel => 'kvar';

  @override
  String get navOverview => 'Översikt';

  @override
  String get navMute => 'Stäng av rösten';

  @override
  String get navUnmute => 'Slå på rösten';

  @override
  String get navEndConfirm => 'Avsluta navigeringen?';

  @override
  String navEndConfirmBody(String place) {
    return 'Vägledningen till $place upphör.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Du har anlänt till $place';
  }

  @override
  String get navDone => 'Klar';

  @override
  String get navWeakGps => 'Svag GPS-signal';

  @override
  String get navLocationOff =>
      'Plats är avstängd. Slå på den för att planera rutter och navigera.';

  @override
  String get navVoiceGuidance => 'Röstvägledning';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Om $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, och sedan $second';
  }

  @override
  String get navSpeakRerouting => 'Beräknar ny rutt';

  @override
  String get navSpeakArrived => 'Du har anlänt';

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
    return 'Fortsätt i $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Vägbeskrivning är inte tillgänglig för den här resan i den här regionen. Prova en annan destination.';

  @override
  String navContinueFor(String distance) {
    return 'Fortsätt i $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value engelska mil',
      one: '1 engelsk mil',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Närmast: $object · $zone';
  }

  @override
  String get parkingNothing => 'Inget upptäckt i bild';

  @override
  String get parkingBeeps => 'Närhetssignaler';

  @override
  String get parkingVolume => 'Signalvolym';

  @override
  String get parkingLimitations =>
      'En enda kamera, inte 360°. Objekt utanför kamerans bildfält upptäcks inte. Ersätter inte parkeringssensorer. Uppskattningar kan vara felaktiga och tystnad betyder inte att området är fritt.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Närhetsvy uppifrån. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Original';

  @override
  String get perceptionModeBoxes => 'Rutor';

  @override
  String get perceptionModeMasks => 'Objektmasker';

  @override
  String get perceptionModeRoad => 'Vägyta';

  @override
  String get perceptionModeCombined => 'Kombinerat';

  @override
  String get perceptionOpacity => 'Maskens opacitet';

  @override
  String get perceptionDisclaimer =>
      'Vägytemasken är ett ungefärligt visuellt lager. Den visar inte körbart utrymme eller körfält.';

  @override
  String get perceptionNeedsModel =>
      'Välj segmenteringsmodellen för att se masker.';

  @override
  String get perceptionChooseModel => 'Välj modell';

  @override
  String get perceptionWaiting => 'Väntar på den första segmenteringsbilden…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Rutor';

  @override
  String get perceptionShortObjects => 'Objekt';

  @override
  String get perceptionShortRoad => 'Väg';

  @override
  String get perceptionShortAll => 'Alla';

  @override
  String get perceptionModesLabel => 'Perceptionslager';

  @override
  String get perceptionStatusWarmingUp => 'Värmer upp…';

  @override
  String get perceptionStatusLoadingModel => 'Läser in modell…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps bilder/s';
  }

  @override
  String get perceptionStatusPaused => 'Masker pausade';

  @override
  String get perceptionLegend => 'Maskförklaring';

  @override
  String get perceptionUnavailable => 'Masker ej tillgängliga';

  @override
  String get driveSave => 'Spara';

  @override
  String get driveSaveIncident => 'Spara händelse';

  @override
  String driveSaveHint(int seconds) {
    return 'Sparar de senaste $seconds sekunderna av bilkamerafilmen';
  }

  @override
  String get driveSaving => 'Sparar händelsen…';

  @override
  String hudRecManualLabel(String time) {
    return 'Spelar in, $time';
  }

  @override
  String get driveRecord => 'Spela in';

  @override
  String get driveRecordStartA11y => 'Starta inspelning';

  @override
  String driveRecordStopA11y(String time) {
    return 'Stoppa inspelning, $time inspelat';
  }

  @override
  String get driveRecordHint =>
      'Spelar in kontinuerligt tills du stoppar, inklusive de senaste 5 sekunderna';

  @override
  String get driveRecordFailed => 'Kunde inte starta inspelningen';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Inspelning sparad · $count delar',
      one: 'Inspelning sparad',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Inspelningen stoppades: lagringsutrymmet nästan fullt',
      'max_duration': 'Inspelningen stoppades: maxlängd nådd',
      'camera_stopped': 'Inspelningen stoppades med kameran',
      'background': 'Inspelningen stoppades: appen gick till bakgrunden',
      'thermal': 'Inspelningen stoppades: telefonen är för varm',
      'other': 'Inspelningen stoppades',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Händelsen sparad · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Visa';

  @override
  String get driveSaveFailed => 'Det gick inte att spara händelsen.';

  @override
  String get driveSaveNotRunning =>
      'Inspelningen har inte startat än – vänta tills kameran har startat och försök igen.';

  @override
  String get driveSaveTestFootage =>
      'Testfilm spelas inte in. Sparande av händelser fungerar med livekameran.';

  @override
  String get driveSaveStorageFull =>
      'Din iPhone har slut på lagringsutrymme. Frigör utrymme eller ta bort äldre klipp.';

  @override
  String get driveSaveIoError => 'Klippet kunde inte skrivas till lagringen.';

  @override
  String get driveClips => 'Klipp';

  @override
  String get driveSettings => 'Inställningar';

  @override
  String get driveViewSwitcher => 'Körvyer';

  @override
  String get driveLocationDenied =>
      'Plats är avstängd – hastighet, kartor och rutter är inte tillgängliga.';

  @override
  String get driveCameraDenied =>
      'Kameraåtkomst är avstängd – detektering och inspelning är inte tillgängliga.';

  @override
  String get driveRecorderFallback =>
      'Inspelning utan ljud: mikrofonåtkomst är avstängd.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Inspelningsinställningarna justerades: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Din iPhone är het. AI körs långsammare för att svalna – håll den borta från direkt sol och nära en luftventil.';

  @override
  String get drivePowerThermalCritical =>
      'Din iPhone är för het. AI-detekteringen är pausad tills den har svalnat. Inspelningen fortsätter om möjligt.';

  @override
  String get drivePowerLowPower =>
      'Lågenergiläge är på – AI körs med lägre frekvens.';

  @override
  String get drivePowerBatteryLow =>
      'Batteriet är lågt – anslut din iPhone till ström under körning.';

  @override
  String get onboardingTitle1 => 'Se mer av varje resa.';

  @override
  String get onboardingBody1 =>
      'Förvandla din iPhone till en intelligent bilkamera och en följeslagare för uppmärksam körning.';

  @override
  String get onboardingTitle2 => 'Intelligens i varje bildruta.';

  @override
  String get onboardingBody2 =>
      'Känn igen fordon, personer, cyklar och vägsignaler som stöds, direkt på din iPhone.';

  @override
  String get onboardingTitle3 => 'En väg. Flera perspektiv.';

  @override
  String get onboardingBody3 =>
      'Växla mellan livedetektering, virtuella körvyer, interaktiva kartor och parkeringsvisualisering.';

  @override
  String get onboardingTitle4 => 'Behåll de ögonblick som räknas.';

  @override
  String get onboardingBody4 =>
      'Spara färsk bilkamerafilm, granska händelser och dela inspelningar.';

  @override
  String get onboardingTitle5 => 'Säkerhet och integritet';

  @override
  String get onboardingSafety1 =>
      'Corvista är ett hjälpmedel för uppmärksamhet under körning. Håll blicken på vägen.';

  @override
  String get onboardingSafety2 =>
      'Det styr inte ditt fordon och ersätter inte ditt omdöme.';

  @override
  String get onboardingSafety3 =>
      'Detekteringar och uppskattningar kan vara felaktiga eller utebli.';

  @override
  String get onboardingSafety4 =>
      'Kamerabearbetningen sker på din iPhone – video laddas inte upp.';

  @override
  String get onboardingSafety5 =>
      'Kartor, sökning, rutter och väder kräver internetanslutning.';

  @override
  String get onboardingSafety6 =>
      'Montera din iPhone stadigt så att den inte skymmer sikten.';

  @override
  String get onboardingSafety7 =>
      'Slutför konfigurationen innan du börjar köra.';

  @override
  String get onboardingAcknowledge =>
      'Jag förstår att Corvista är ett hjälpmedel för uppmärksamhet och att jag själv ansvarar för att köra säkert.';

  @override
  String get onboardingReadSafety => 'Läs all säkerhetsinformation';

  @override
  String get onboardingNext => 'Nästa';

  @override
  String get onboardingSkip => 'Hoppa över';

  @override
  String get onboardingAgree => 'Fortsätt';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Sida $current av $total';
  }

  @override
  String get permTitle => 'Behörigheter';

  @override
  String get permIntro =>
      'Corvista ber bara om det som varje funktion behöver. Du kan ändra dem när som helst i Inställningar.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Krävs för detektering, bilkamerainspelning och parkeringsvyn. Video bearbetas på din iPhone.';

  @override
  String get permLocationTitle => 'Plats';

  @override
  String get permLocationBody =>
      'Används för GPS-hastighet, kartan, rutter, väder och platsmärkning av sparade klipp. Endast medan du använder appen.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'Taligenkänning efterfrågas bara om du slår på röstavbrott för nödaviseringar.';

  @override
  String get permRequired => 'Krävs';

  @override
  String get permOptional => 'Valfritt';

  @override
  String get permAllow => 'Tillåt';

  @override
  String get permGranted => 'Tillåten';

  @override
  String get permDenied => 'Nekad';

  @override
  String get permLimited => 'Begränsad';

  @override
  String get permRestricted => 'Begränsad av system';

  @override
  String get permStart => 'Börja köra';

  @override
  String get permCameraNeeded =>
      'Du kan fortsätta utan kameraåtkomst, men detektering och inspelning fungerar inte förrän du tillåter den i Inställningar.';

  @override
  String get permSetupIntro =>
      'Corvista behöver dessa för att fungera fullt ut. Tryck på Tillåt alla så frågar iOS om var och en i tur och ordning. Du kan ändra dem när som helst i Inställningar.';

  @override
  String get permCameraLine =>
      'Krävs för detektering, bilkamerainspelning och parkeringsvyn. Video bearbetas på din iPhone och laddas aldrig upp.';

  @override
  String get permLocationLine =>
      'GPS-hastighet, kartan, rutter, väder och var klipp sparades. Endast medan du använder appen.';

  @override
  String get permMicLine =>
      'Kupéljud i händelseklipp, och för att höra din avbrottsfras under en nödavisering.';

  @override
  String get permSpeechTitle => 'Taligenkänning';

  @override
  String get permSpeechLine =>
      'Känner igen din avbrottsfras under en nödnedräkning, på din iPhone där det stöds.';

  @override
  String get permAllowAll => 'Tillåt alla';

  @override
  String permAsking(String permission) {
    return 'Frågar efter $permission…';
  }

  @override
  String get permSomeDenied =>
      'Vissa behörigheter är avstängda. Slå på dem i Inställningar för att använda de funktionerna.';

  @override
  String get permNotNow => 'Inte nu';

  @override
  String get tourLabel => 'Rundtur i körskärmen';

  @override
  String tourProgress(int current, int total) {
    return 'Steg $current av $total';
  }

  @override
  String get tourNext => 'Nästa';

  @override
  String get tourBack => 'Tillbaka';

  @override
  String get tourSkip => 'Hoppa över rundturen';

  @override
  String get tourFinish => 'Börja köra';

  @override
  String get tourWelcomeTitle => 'Din snabba rundtur';

  @override
  String get tourWelcomeBody =>
      'En minut för att se vad som är viktigt på körskärmen. Bäst när du står parkerad.';

  @override
  String get tourHudTitle => 'Din instrumentremsa';

  @override
  String get tourHudSpeed => 'Hastigheten kommer från GPS.';

  @override
  String get tourHudRec =>
      'REC visar hur många sekunders film som är buffrade.';

  @override
  String get tourHudAi =>
      'AI-brickan visar modellen, hur många objekt den ser och en prick: grön körs, gul begränsad, röd stoppad.';

  @override
  String get tourSaveTitle => 'Spara händelse';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista håller en rullande buffert av de senaste $seconds sekunderna video. Den skrivs över hela tiden, så inget sparas om du inte trycker på Spara. Sparade klipp finns kvar på den här iPhone, under Klipp.';
  }

  @override
  String get tourRecordTitle => 'Spela in hela resan';

  @override
  String get tourRecordBody =>
      'Tryck på Spela in för att filma kontinuerligt tills du stoppar. Långa resor sparas i delar om 5 minuter i Klipp, och Spara händelse fungerar fortfarande medan du spelar in.';

  @override
  String get tourViewsTitle => 'Fem sätt att se vägen';

  @override
  String get tourViewDetection => 'Livekamera med rutor runt objekt som stöds.';

  @override
  String get tourViewVirtual => 'En förenklad 3D-scen byggd av detekteringar.';

  @override
  String get tourViewMap => 'Apple Maps med sökning och körvägledning.';

  @override
  String get tourViewParking => 'Kamera plus en närhetsvy uppifrån.';

  @override
  String get tourViewPerception => 'Masker för väg och objekt.';

  @override
  String get tourMapTitle => 'Sökning och körvägledning';

  @override
  String get tourMapBody =>
      'Öppna Karta, tryck på sökfältet och välj en destination. Välj en rutt och tryck sedan på Starta för körvägledning. Kräver internetanslutning.';

  @override
  String get tourClipsTitle => 'Klipp';

  @override
  String get tourClipsBody =>
      'Granska, byt namn på, dela eller ta bort sparade händelser. Klipp finns kvar på din iPhone om du inte delar dem.';

  @override
  String get tourSettingsTitle => 'Inställningar';

  @override
  String get tourSettingsBody =>
      'Finjustera röstaviseringar och deras känslighet, inspelningskvalitet och bufferlängd, och ställ in nödläget: en experimentell kollisionsavisering med nedräkning för avbrott.';

  @override
  String get tourSafetyTitle => 'Innan du kör';

  @override
  String get tourSafety1 =>
      'Montera din iPhone stadigt där den inte skymmer sikten.';

  @override
  String get tourSafety2 =>
      'Använd inte appen under körning. Ställ in allt när du står parkerad.';

  @override
  String get tourSafety3 =>
      'Detekteringar och zoner är uppskattningar. De kan vara felaktiga eller utebli.';

  @override
  String get tourSafety4 => 'Du ansvarar fortfarande för att köra säkert.';

  @override
  String get helpTakeTour => 'Ta rundturen';

  @override
  String get helpTakeTourSub => 'En guidad titt på körskärmen på en minut.';

  @override
  String get tripsTitle => 'Resor';

  @override
  String get tripsOpen => 'Reselogg';

  @override
  String get tripsEmptyTitle => 'Inga resor än';

  @override
  String get tripsEmptyBody =>
      'Resor spelas in automatiskt medan du kör med Corvista – sträcka, tid, hastighet och rutten du tog.';

  @override
  String get tripsDisabledBody =>
      'Reseloggen är av, så nya resor spelas inte in. Slå på den för att föra en privat logg över dina rutter på den här iPhone.';

  @override
  String get tripsEnable => 'Slå på reselogg';

  @override
  String get tripsToday => 'Idag';

  @override
  String get tripsYesterday => 'Igår';

  @override
  String tripsRecordingNow(String distance) {
    return 'Spelar in en resa · $distance';
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
      other: '$count händelser',
      one: '1 händelse',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aviseringar',
      one: '1 avisering',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resor',
      one: '1 resa',
      zero: 'Inga resor',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Sträcka';

  @override
  String get tripsStatDuration => 'Längd';

  @override
  String get tripsStatMoving => 'Körtid';

  @override
  String get tripsStatAvgSpeed => 'Medelhastighet';

  @override
  String get tripsStatMaxSpeed => 'Maxhastighet';

  @override
  String get tripsDetections => 'Detekteringar';

  @override
  String get tripsNoDetections =>
      'Inga vägobjekt loggades under den här resan.';

  @override
  String get tripsTimeline => 'Tidslinje';

  @override
  String get tripsEventStart => 'Resan startade';

  @override
  String get tripsEventEnd => 'Resan avslutades';

  @override
  String get tripsEventAlert => 'Röstavisering';

  @override
  String get tripsEventIncident => 'Händelseklipp sparat';

  @override
  String get tripsEventEmergency => 'Möjlig krock upptäckt';

  @override
  String get tripsEventNavStart => 'Navigeringen startade';

  @override
  String get tripsEventArrive => 'Anlände till destinationen';

  @override
  String get tripsEventReroute => 'Rutten beräknades om';

  @override
  String get tripsEventRecording => 'Inspelning sparad';

  @override
  String get tripsOpenClip => 'Öppna klipp';

  @override
  String get tripsTrackPreview => 'GPS-spår';

  @override
  String get tripsRenameTitle => 'Byt namn på resa';

  @override
  String get tripsRenameHint => 'Resenamn';

  @override
  String get tripsFavorite => 'Lägg till i favoriter';

  @override
  String get tripsUnfavorite => 'Ta bort från favoriter';

  @override
  String get tripsShareGpx => 'Dela GPX';

  @override
  String get tripsShareFailed => 'Det gick inte att dela resan.';

  @override
  String get tripsDelete => 'Ta bort resa';

  @override
  String get tripsDeleteConfirmTitle => 'Ta bort resan?';

  @override
  String get tripsDeleteConfirmBody =>
      'Rutten och statistiken tas bort från den här iPhone. Händelseklipp från resan behålls.';

  @override
  String get tripsDeleted => 'Resan har tagits bort';

  @override
  String get tripsNotFound => 'Resan är inte längre tillgänglig.';

  @override
  String get tripsPrivacyNote =>
      'Lagras endast på den här iPhone. Inget laddas upp.';

  @override
  String get settingsSectionTrips => 'Reselogg';

  @override
  String get settingsTripLog => 'Spela in resor';

  @override
  String get settingsTripLogSubtitle =>
      'Sparar din rutt och körstatistik endast på den här iPhone.';

  @override
  String get settingsTripRetention => 'Behåll resor i';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 år';

  @override
  String get settingsRetentionForever => 'För alltid';

  @override
  String get settingsTripRetentionFooter =>
      'Äldre resor tas bort automatiskt när Corvista startar.';

  @override
  String get settingsViewTrips => 'Visa resor';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes min';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista-resa $date';
  }

  @override
  String get settingsFreeUpSpace => 'Frigör utrymme';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Tar bort tillfälliga filer och cacheminnen. Sparade klipp och resor behålls.';

  @override
  String settingsFreedBytes(String size) {
    return '$size frigjort';
  }

  @override
  String get settingsNothingToFree =>
      'Cacheminnet rensat – inga tillfälliga filer att ta bort.';

  @override
  String get settingsSectionPrivacyData => 'Sekretess och data';

  @override
  String get settingsPrivacyDataFooter =>
      'Klipp, resor och inställningar lagras bara på den här iPhonen. De lämnar den bara när du väljer att dela dem.';

  @override
  String get settingsDeleteAllData => 'Ta bort all data';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Radera klipp, resor, kontakter och inställningar från den här iPhonen';

  @override
  String get deleteAllTitle => 'Ta bort all data?';

  @override
  String get deleteAllMessage =>
      'Detta tar bort följande permanent från den här iPhonen:\n• Händelseklipp och miniatyrer\n• Reselogg och GPS-spår\n• Nödkontakter och nödhändelser\n• Detekteringsloggar och diagnostikloggen\n• Inställningar och senaste destinationer\n• Tillfällig inspelningsbuffert och cache\n\nDetta kan inte ångras. Corvista startar sedan om från välkomstskärmarna.';

  @override
  String get deleteAllConfirm => 'Ta bort allt';

  @override
  String get deleteAllInProgress => 'Tar bort…';

  @override
  String get deleteAllDone => 'All data borttagen';

  @override
  String get deleteAllPartial =>
      'Vissa objekt kunde inte tas bort. Försök igen från Inställningar.';

  @override
  String get diagLogSection => 'Diagnostiklogg';

  @override
  String get diagLogFooter =>
      'Fel registreras bara på den här iPhonen, utan platser, kontaktnamn eller telefonnummer. Inget skickas om du inte delar loggen själv.';

  @override
  String get diagLogShare => 'Dela diagnostiklogg';

  @override
  String get diagLogEmpty => 'Tom';

  @override
  String get diagLogClear => 'Rensa loggen';

  @override
  String get diagLogClearTitle => 'Rensa diagnostikloggen?';

  @override
  String get diagLogClearBody =>
      'Sparade felposter tas bort från den här iPhonen.';

  @override
  String get diagLogCleared => 'Diagnostikloggen rensad';

  @override
  String get diagLogShareFailed => 'Kunde inte dela diagnostikloggen.';

  @override
  String get privacyControls2 =>
      'Inställningar › Sekretess och data › Ta bort all data raderar alla klipp, resor, kontakter, loggar och inställningar som Corvista har lagrat på den här iPhonen.';

  @override
  String get parkingZoneStop => 'Stopp';

  @override
  String get parkingZoneVeryClose => 'Mycket nära';

  @override
  String get parkingZoneClose => 'Nära';

  @override
  String get parkingZoneNothingClose => 'Inget nära upptäckt';

  @override
  String get parkingNotDetected =>
      'Väggar, pelare, stolpar och trottoarkanter upptäcks inte';

  @override
  String get parkingApprox => 'ca';

  @override
  String get parkingSideLeft => 'Vänster';

  @override
  String get parkingSideCenter => 'Mitt';

  @override
  String get parkingSideRight => 'Höger';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => 'Endast frontkamerans vy – inget 360°-system';

  @override
  String get parkingMuteBeeps => 'Stäng av pip';

  @override
  String get parkingUnmuteBeeps => 'Slå på pip';

  @override
  String get parkingAbout => 'Om parkeringsvyn';

  @override
  String get parkingLimitationsDetail =>
      'Endast området framför kameran bevakas. Detektorn känner igen bilar, bussar och lastbilar, personer, cyklar och motorcyklar. Väggar, pelare, stolpar, trottoarkanter, pollare, bommar och låga hinder upptäcks INTE, och motorhuven kan dölja marken precis framför bilen. Avstånden är grova uppskattningar från en enda kamera (objektets storlek och position) och kan avvika mycket. Tystnad eller ”Inget nära upptäckt” betyder inte att vägen är fri – titta alltid dig omkring och använd speglarna.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Närhet per sida: vänster $left, mitten $center, höger $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Fel skrivs till en privat logg på den här iPhonen (inga platser, kontaktnamn eller telefonnummer). Den skickas aldrig automatiskt; du kan dela eller rensa den under Inställningar › Diagnostik.';
}
