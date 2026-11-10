// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Zie meer van elke rit.';

  @override
  String get commonCancel => 'Annuleer';

  @override
  String get commonDelete => 'Verwijder';

  @override
  String get commonSave => 'Bewaar';

  @override
  String get commonBack => 'Terug';

  @override
  String get commonClose => 'Sluit';

  @override
  String get commonRetry => 'Opnieuw proberen';

  @override
  String get commonOpenSettings => 'Open Instellingen';

  @override
  String get commonLoading => 'Laden…';

  @override
  String get commonError => 'Er is iets misgegaan.';

  @override
  String commonErrorDetail(String message) {
    return 'Er is iets misgegaan: $message';
  }

  @override
  String get commonOn => 'Aan';

  @override
  String get commonOff => 'Uit';

  @override
  String get commonRename => 'Hernoem';

  @override
  String get commonShare => 'Deel';

  @override
  String get commonNotAvailable => 'Niet beschikbaar';

  @override
  String get commonTestFootage => 'TESTBEELDEN';

  @override
  String get zoneVeryClose => 'Zeer dichtbij';

  @override
  String get zoneClose => 'Dichtbij';

  @override
  String get zoneMedium => 'Gemiddeld';

  @override
  String get zoneFar => 'Ver';

  @override
  String get zoneUnknown => 'Onbekend';

  @override
  String get classPerson => 'Persoon';

  @override
  String get classBicycle => 'Fiets';

  @override
  String get classMotorcycle => 'Motor';

  @override
  String get classCar => 'Voertuig';

  @override
  String get classBus => 'Bus';

  @override
  String get classTrafficLight => 'Verkeerslicht';

  @override
  String get classStopSign => 'Stopbord';

  @override
  String get viewDetection => 'Detectie';

  @override
  String get viewVirtual => 'Virtueel';

  @override
  String get viewMap => 'Kaart';

  @override
  String get viewParking => 'Parkeren';

  @override
  String get viewPerception => 'Perceptie';

  @override
  String get unitKmh => 'km/u';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Rood';

  @override
  String get lightYellow => 'Geel';

  @override
  String get lightGreen => 'Groen';

  @override
  String get lightUnknown => 'Onbekend';

  @override
  String get clipsTitle => 'Clips';

  @override
  String get clipsSelect => 'Selecteer';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count geselecteerd',
      one: '1 geselecteerd',
      zero: 'Selecteer clips',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Selecteer alles';

  @override
  String get clipsDeselectAll => 'Deselecteer alles';

  @override
  String get clipsDeleteSelected => 'Verwijder selectie';

  @override
  String get clipsGridView => 'Rasterweergave';

  @override
  String get clipsListView => 'Lijstweergave';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips verwijderen?',
      one: 'Deze clip verwijderen?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deze video’s worden definitief van je iPhone verwijderd. Dit kan niet ongedaan worden gemaakt.',
      one: 'De video wordt definitief van je iPhone verwijderd. Dit kan niet ongedaan worden gemaakt.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips verwijderd',
      one: 'Clip verwijderd',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Nog geen clips';

  @override
  String get clipsEmptyBody =>
      'Tijdens het rijden houdt Corvista een korte lopende buffer bij. Tik op Incident opslaan om de laatste seconden beeld hier te bewaren.';

  @override
  String get clipsLoadError => 'Je clips konden niet worden geladen.';

  @override
  String get clipsStorageTitle => 'Opslag';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Clips $clips · Buffer $buffer · $free vrij';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opgeslagen clips',
      one: '1 opgeslagen clip',
      zero: 'Geen opgeslagen clips',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Je iPhone heeft weinig opslagruimte. Nieuwe incidenten worden mogelijk niet opgeslagen.';

  @override
  String get clipsMissingFile => 'Bestand ontbreekt';

  @override
  String get clipsEmergencyBadge => 'Impact';

  @override
  String clipsUntitled(String date) {
    return 'Incident · $date';
  }

  @override
  String get clipsAudio => 'Audio opgenomen';

  @override
  String get clipsFavorite => 'Favoriet';

  @override
  String get clipsUnfavorite => 'Verwijder uit favorieten';

  @override
  String get clipsLocation => 'Locatie opgeslagen';

  @override
  String clipsOpenClip(String title) {
    return 'Open clip $title';
  }

  @override
  String get playerNotFoundTitle => 'Clip niet gevonden';

  @override
  String get playerNotFoundBody => 'Deze clip is mogelijk verwijderd.';

  @override
  String get playerMissingTitle => 'Videobestand ontbreekt';

  @override
  String get playerMissingBody =>
      'De opname van deze clip staat niet meer op je iPhone. Je kunt het item uit je galerij verwijderen.';

  @override
  String get playerRemoveEntry => 'Verwijder item';

  @override
  String get playerLoadError => 'Deze video kan niet worden afgespeeld.';

  @override
  String get playerPlay => 'Afspelen';

  @override
  String get playerPause => 'Pauzeer';

  @override
  String get playerReplay => 'Opnieuw afspelen';

  @override
  String get playerRenameTitle => 'Clip hernoemen';

  @override
  String get playerRenameHint => 'Clipnaam';

  @override
  String get playerRenamed => 'Clip hernoemd';

  @override
  String get playerFavorited => 'Toegevoegd aan favorieten';

  @override
  String get playerUnfavorited => 'Verwijderd uit favorieten';

  @override
  String get playerShareFailed => 'Deze clip kon niet worden gedeeld.';

  @override
  String get playerDetails => 'Details';

  @override
  String get playerDate => 'Opgenomen';

  @override
  String get playerDuration => 'Duur';

  @override
  String get playerResolution => 'Resolutie';

  @override
  String get playerSize => 'Bestandsgrootte';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerAudioYes => 'Opgenomen';

  @override
  String get playerAudioNo => 'Niet opgenomen';

  @override
  String get playerReason => 'Opgeslagen via';

  @override
  String get playerReasonManual => 'Knop Incident opslaan';

  @override
  String get playerReasonEmergency => 'Detectie van mogelijke impact';

  @override
  String get playerReasonRecovered => 'Hersteld na onderbreking';

  @override
  String get playerSpeed => 'GPS-snelheid bij opslaan';

  @override
  String get playerLocation => 'Locatie';

  @override
  String get playerOpenInMaps => 'Open in Kaarten';

  @override
  String get playerBack => 'Terug';

  @override
  String get playerMore => 'Meer acties';

  @override
  String get clipsFilterLabel => 'Toon';

  @override
  String get clipsFilterAll => 'Alle';

  @override
  String get clipsFilterRecordings => 'Opnamen';

  @override
  String get clipsFilterIncidents => 'Incidenten';

  @override
  String get clipsFilterEmergency => 'Noodgevallen';

  @override
  String get clipsFilterFavorites => 'Favorieten';

  @override
  String get clipsSort => 'Sorteer';

  @override
  String get clipsSortNewest => 'Nieuwste eerst';

  @override
  String get clipsSortOldest => 'Oudste eerst';

  @override
  String get clipsSortLongest => 'Langste eerst';

  @override
  String get clipsSortLargest => 'Grootste eerst';

  @override
  String get clipsToday => 'Vandaag';

  @override
  String get clipsYesterday => 'Gisteren';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips',
      one: '1 clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Nog geen clips in deze categorie.';

  @override
  String get clipsFavoritesEmpty =>
      'Geef een clip een ster om hem hier snel terug te vinden.';

  @override
  String get clipsKindRecording => 'Opname';

  @override
  String get clipsKindIncident => 'Incident';

  @override
  String get clipsKindEmergency => 'Noodgeval';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Rit · $time';
  }

  @override
  String get clipsOpenTrip => 'Open de rit waarin deze clip is opgenomen';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used gebruikt · $free vrij';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Clips nemen $size in beslag';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opnamen',
      one: '1 opname',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count incidenten',
      one: '1 incident',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count noodgevallen',
      one: '1 noodgeval',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Ruimte vrijmaken';

  @override
  String get clipsStorageLowGentle =>
      'Minder dan 2 GB vrij. Maak ruimte vrij of verwijder clips die je niet meer nodig hebt, zodat opnemen soepel blijft verlopen.';

  @override
  String get clipsSaveToPhotos => 'Bewaar in Foto\'s';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips',
      one: '1 clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips ($size) verwijderen?',
      one: 'Deze clip ($size) verwijderen?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return '$done van $total bewaren in Foto\'s…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips bewaard in Foto\'s',
      one: 'Bewaard in Foto\'s',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved bewaard in Foto\'s · $failed niet gelukt';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista mag geen video\'s toevoegen aan Foto\'s. Je kunt dit toestaan in Instellingen.';

  @override
  String get clipsPhotosFailed => 'Bewaren in Foto\'s is niet gelukt.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips toegevoegd aan favorieten',
      one: 'Toegevoegd aan favorieten',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips verwijderd uit favorieten',
      one: 'Verwijderd uit favorieten',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (ingekort)';
  }

  @override
  String get playerTrim => 'Inkorten';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Type';

  @override
  String get playerReasonRecording => 'Opnameknop';

  @override
  String get trimTitle => 'Clip inkorten';

  @override
  String get trimHint =>
      'Sleep de handvatten om het deel te kiezen dat je wilt bewaren. De originele clip blijft ongewijzigd.';

  @override
  String get trimStartHandle => 'Begin van inkorting';

  @override
  String get trimEndHandle => 'Einde van inkorting';

  @override
  String trimSelection(String duration) {
    return 'Selectie: $duration';
  }

  @override
  String get trimSave => 'Opslaan als nieuwe clip';

  @override
  String get trimSaving => 'Ingekorte clip opslaan…';

  @override
  String get trimSaved => 'Ingekorte clip opgeslagen';

  @override
  String get trimOpenNew => 'Open';

  @override
  String get trimFailed => 'Deze clip kon niet worden ingekort.';

  @override
  String get trimStorageFull =>
      'Niet genoeg vrije ruimte om de ingekorte clip op te slaan.';

  @override
  String get trimPreview => 'Selectie afspelen';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get settingsSectionCamera => 'Camera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Meldingen';

  @override
  String get settingsSectionAlertCategories => 'Meldingscategorieën';

  @override
  String get settingsSectionRecording => 'Opname';

  @override
  String get settingsSectionDriving => 'Rijden';

  @override
  String get settingsSectionPower => 'Energie';

  @override
  String get settingsSectionEmergency => 'Nood';

  @override
  String get settingsSectionAppearance => 'Weergave';

  @override
  String get settingsSectionLanguage => 'Taal';

  @override
  String get settingsSectionInformation => 'Informatie';

  @override
  String get settingsCameraLens => 'Cameralens';

  @override
  String get settingsLensWide => 'Groothoek';

  @override
  String get settingsLensUltraWide => 'Ultragroothoek';

  @override
  String get settingsLensTelephoto => 'Telelens';

  @override
  String get settingsLensUnavailable => 'Niet beschikbaar op deze iPhone';

  @override
  String get settingsStabilization => 'Stabilisatie';

  @override
  String get settingsStabAuto => 'Automatisch';

  @override
  String get settingsStabOff => 'Uit';

  @override
  String get settingsStabStandard => 'Standaard';

  @override
  String get settingsStabCinematic => 'Cinematisch';

  @override
  String get settingsOverlayOpacity => 'Dekking van overlay';

  @override
  String get settingsShowFps => 'Toon prestatiegegevens';

  @override
  String get settingsShowFpsSubtitle =>
      'Framesnelheid en inferentietijd in de detectieweergave';

  @override
  String get settingsCameraFooter =>
      'Wijzigingen aan lens en stabilisatie gelden de volgende keer dat de camera start.';

  @override
  String get settingsAiModel => 'AI-model';

  @override
  String get settingsConfidence => 'Detectiezekerheid';

  @override
  String get settingsTracking => 'Objecttracking';

  @override
  String get settingsTrackingSubtitle => 'Houdt objecten stabiel tussen frames';

  @override
  String get settingsShowLabels => 'Toon labels';

  @override
  String get settingsShowConfidence => 'Toon zekerheid';

  @override
  String get settingsSegmentationOpacity => 'Dekking van perceptiemasker';

  @override
  String get settingsAiFooter =>
      'Een lagere zekerheid toont meer objecten, maar ook meer onjuiste detecties. Detecties kunnen onnauwkeurig zijn.';

  @override
  String get settingsVoiceAlerts => 'Spraakmeldingen';

  @override
  String get settingsVoiceLanguage => 'Spraaktaal';

  @override
  String get settingsVoiceLanguageAuto => 'Volg app-taal';

  @override
  String get settingsVoice => 'Stem';

  @override
  String get settingsVoiceDefault => 'Systeemstandaard';

  @override
  String get settingsVoiceQualityEnhanced => 'Verbeterd';

  @override
  String get settingsVoiceQualityPremium => 'Hoge kwaliteit';

  @override
  String get settingsNoVoices =>
      'Voor deze taal is geen stem geïnstalleerd. Voeg er een toe via iOS Instellingen › Toegankelijkheid › Voorgelezen inhoud.';

  @override
  String get settingsAlertPedestrian => 'Voetgangers';

  @override
  String get settingsAlertCyclist => 'Fietsers';

  @override
  String get settingsAlertMotorcycle => 'Motoren';

  @override
  String get settingsAlertBus => 'Bussen';

  @override
  String get settingsAlertVehicleClose => 'Voertuig zeer dichtbij voor je';

  @override
  String get settingsAlertTrafficLight => 'Verkeerslicht verandert';

  @override
  String get settingsAlertTrafficMoving =>
      'Verkeer voor je zet zich in beweging';

  @override
  String get settingsAlertStopSign => 'Stopborden';

  @override
  String get settingsSensitivity => 'Gevoeligheid';

  @override
  String get settingsSensitivityLow => 'Laag';

  @override
  String get settingsSensitivityMedium => 'Gemiddeld';

  @override
  String get settingsSensitivityHigh => 'Hoog';

  @override
  String get settingsCooldown => 'Herhaalinterval';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Spraakvolume';

  @override
  String get settingsQuietMode => 'Stille modus';

  @override
  String get settingsQuietModeSubtitle =>
      'Alleen de belangrijkste meldingen worden uitgesproken';

  @override
  String get settingsTestVoice => 'Test stem';

  @override
  String get settingsTestVoiceDone => 'Voorbeeldmelding wordt afgespeeld…';

  @override
  String get settingsParkingBeeps => 'Parkeerpiepjes';

  @override
  String get settingsBeepVolume => 'Piepvolume';

  @override
  String get settingsAlertsFooter =>
      'Meldingen zijn slechts een hulpmiddel. Let altijd op de weg: stilte betekent niet dat de weg vrij is.';

  @override
  String get settingsRecordingProfile => 'Opnamekwaliteit';

  @override
  String get settingsProfileStandard => 'Standaard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Incidentbuffer';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds seconden';
  }

  @override
  String get settingsManualMaxLength => 'Maximale duur handmatige opname';

  @override
  String get settingsManualMaxUnlimited => 'Onbeperkt';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Neem audio op';

  @override
  String get settingsRecordAudioSubtitle =>
      'Neemt het geluid in de cabine mee in opgeslagen incidenten';

  @override
  String get settingsMicDenied =>
      'Toegang tot de microfoon is uit. Sta deze toe in Instellingen om audio op te nemen.';

  @override
  String get settingsWatermark => 'Corvista-watermerk';

  @override
  String get settingsTimestamp => 'Datum en tijd';

  @override
  String get settingsSaveLocation => 'Bewaar locatie bij clips';

  @override
  String get settingsStorage => 'Opslag en clips';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips',
      one: '1 clip',
      zero: 'Geen clips',
    );
    return '$_temp0 · $used gebruikt · $free vrij';
  }

  @override
  String get settingsRecordingFooter =>
      'De lopende buffer blijft op je iPhone en wordt continu overschreven. Er wordt niets op de achtergrond opgenomen.';

  @override
  String get settingsDefaultView => 'Standaardweergave';

  @override
  String get settingsUnits => 'Eenheden';

  @override
  String get settingsShowCompass => 'Toon kompas';

  @override
  String get settingsHudStyle => 'HUD-stijl';

  @override
  String get settingsHudCustomize => 'HUD aanpassen';

  @override
  String get settingsDrivingSide => 'Rijrichting';

  @override
  String get settingsDrivingSideAuto => 'Automatisch';

  @override
  String get settingsDrivingSideRight => 'Rechts';

  @override
  String get settingsDrivingSideLeft => 'Links';

  @override
  String get settingsVirtualStyle => 'Stijl van virtuele weergave';

  @override
  String get settingsVirtualMinimal => 'Minimaal';

  @override
  String get settingsVirtualPerspective => 'Perspectief';

  @override
  String get settingsVirtualHighContrast => 'Hoog contrast';

  @override
  String get settingsKeepScreenOn => 'Houd scherm aan tijdens het rijden';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Toon routebeschrijving op het toegangsscherm en in het Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Opname gepauzeerd terwijl Corvista op de achtergrond was';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Gepauzeerd';

  @override
  String get liveActivityDashcamOff => 'Camera uit';

  @override
  String get liveActivityEnded => 'Navigatie beëindigd';

  @override
  String get liveActivityEta => 'Aankomst';

  @override
  String get settingsAutoRecenter => 'Kaart automatisch centreren';

  @override
  String get settingsHudStyleClassic => 'Klassiek';

  @override
  String get settingsHudStyleGrid => 'Raster';

  @override
  String get settingsHudStyleMinimal => 'Minimaal';

  @override
  String get settingsHudStylePerformance => 'Prestaties';

  @override
  String get settingsHudStyleNavigation => 'Navigatie';

  @override
  String get settingsHudStyleNight => 'Nacht';

  @override
  String get settingsHudStyleHighContrast => 'Hoog contrast';

  @override
  String get settingsPowerMode => 'Energiemodus';

  @override
  String get settingsPowerBalanced => 'Gebalanceerd';

  @override
  String get settingsPowerPerformance => 'Prestaties';

  @override
  String get settingsPowerSaver => 'Energiebesparing';

  @override
  String get settingsPowerFooter =>
      'Corvista verlaagt de AI-frequentie en visuele effecten automatisch als je iPhone warm wordt of de batterij bijna leeg is.';

  @override
  String get settingsThermal => 'Temperatuurstatus';

  @override
  String get settingsThermalNominal => 'Normaal';

  @override
  String get settingsThermalFair => 'Warm';

  @override
  String get settingsThermalSerious => 'Heet';

  @override
  String get settingsThermalCritical => 'Kritiek';

  @override
  String get settingsBattery => 'Batterij';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Wordt opgeladen';
  }

  @override
  String get settingsLowPowerMode =>
      'Stroombesparingsmodus staat aan: AI draait op een lagere frequentie.';

  @override
  String get settingsAiRate => 'Huidige AI-frequentie';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Impactdetectie';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Aan · $seconds s aftelling';
  }

  @override
  String get settingsEmergencyFooter =>
      'Experimenteel. Geen vervanging voor hulpdiensten.';

  @override
  String get settingsTheme => 'Thema';

  @override
  String get settingsThemeSystem => 'Systeem';

  @override
  String get settingsThemeDark => 'Donker';

  @override
  String get settingsThemeLight => 'Licht';

  @override
  String get settingsReduceMotion => 'Beperk beweging';

  @override
  String get settingsReduceMotionSubtitle =>
      'Vermindert animaties in de hele app';

  @override
  String get settingsAppLanguage => 'App-taal';

  @override
  String get settingsPrivacyPolicy => 'Privacybeleid';

  @override
  String get settingsTerms => 'Gebruiksvoorwaarden';

  @override
  String get settingsHelp => 'Help';

  @override
  String get settingsSupport => 'Neem contact op met support';

  @override
  String get settingsLicenses => 'Open-sourcelicenties';

  @override
  String get settingsSupportUnavailable =>
      'Mail kon niet worden geopend. Schrijf naar support@corvista.app.';

  @override
  String get settingsSafety => 'Veiligheidsinformatie';

  @override
  String get settingsDiagnostics => 'Diagnose';

  @override
  String get settingsVersion => 'Versie';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'HUD aanpassen';

  @override
  String get hudCustomPreview => 'Voorbeeld · voorbeeldwaarden';

  @override
  String get hudCustomStyle => 'Stijl';

  @override
  String get hudCustomElements => 'Elementen';

  @override
  String get hudCustomSpeed => 'Snelheid';

  @override
  String get hudCustomHeading => 'Koers en kompas';

  @override
  String get hudCustomClock => 'Klok';

  @override
  String get hudCustomBattery => 'Batterij en temperatuur';

  @override
  String get hudCustomDetections => 'AI-status en detecties';

  @override
  String get hudCustomWeather => 'Weer';

  @override
  String get hudCustomAppearance => 'Grootte en dekking';

  @override
  String get hudCustomSize => 'Grootte';

  @override
  String get hudCustomOpacity => 'Dekking';

  @override
  String get hudCustomFooter =>
      'Waarschuwingen, zoals oververhitting, worden altijd getoond, ook als elementen verborgen zijn.';

  @override
  String get hudCustomDescClassic => 'Evenwichtig instrumentenpaneel';

  @override
  String get hudCustomDescGrid => 'Perspectiefraster over de weg';

  @override
  String get hudCustomDescMinimal => 'Alleen snelheid, verder niets';

  @override
  String get hudCustomDescPerformance => 'Snelheidsboog met live waarden';

  @override
  String get hudCustomDescNavigation => 'Eerst de volgende manoeuvre';

  @override
  String get hudCustomDescNight =>
      'Gedimd en roodverschoven voor nachtelijk rijden';

  @override
  String get hudCustomDescHighContrast => 'Maximale leesbaarheid in felle zon';

  @override
  String get languageTitle => 'Taal';

  @override
  String get languageSystem => 'Systeemstandaard';

  @override
  String get languageSystemSubtitle => 'Volg de taal van je iPhone';

  @override
  String get languageFooter =>
      'Er komen meer talen bij. De taal van spraakmeldingen stel je apart in onder Meldingen.';

  @override
  String get diagTitle => 'Diagnose';

  @override
  String get diagPerformance => 'Prestaties';

  @override
  String get diagInference => 'Inferentietijd';

  @override
  String get diagDetectHz => 'Detectiefrequentie';

  @override
  String get diagCameraFps => 'Framesnelheid camera';

  @override
  String get diagMemory => 'Geheugen';

  @override
  String get diagDropped => 'Gedropte frames';

  @override
  String get diagSegmentation => 'Segmentatietijd';

  @override
  String get diagCamera => 'Camera';

  @override
  String get diagStatus => 'Status';

  @override
  String get diagSource => 'Bron';

  @override
  String get diagSourceCamera => 'Livecamera';

  @override
  String get diagSourceFile => 'Testbeeldbestand';

  @override
  String get diagResolution => 'Buffergrootte';

  @override
  String get diagLens => 'Lens';

  @override
  String get diagError => 'Laatste fout';

  @override
  String get diagModel => 'AI-model';

  @override
  String get diagModelLoad => 'Laadtijd model';

  @override
  String get diagPower => 'Energie';

  @override
  String get diagSegHz => 'Segmentatiefrequentie';

  @override
  String get diagReduced => 'Verminderde effecten';

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
  String get diagCamIdle => 'Inactief';

  @override
  String get diagCamStarting => 'Start';

  @override
  String get diagCamRunning => 'Actief';

  @override
  String get diagCamInterrupted => 'Onderbroken';

  @override
  String get diagCamStopped => 'Gestopt';

  @override
  String get diagCamUnavailable => 'Niet beschikbaar';

  @override
  String get diagCamPermissionDenied => 'Toegang geweigerd';

  @override
  String get diagCamError => 'Fout';

  @override
  String get diagTestFootage => 'Testbeelden';

  @override
  String get diagTestFootageBody =>
      'Voer echte detectie op het apparaat uit op een lokaal videobestand in plaats van de camera. Elke weergave markeert dit als TESTBEELDEN.';

  @override
  String get diagPathLabel => 'Pad van videobestand';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Gebruik Documents/test_drive.mp4';

  @override
  String get diagRun => 'Start testbeelden';

  @override
  String get diagRunStarted =>
      'Testbeelden gestart. Open de rijweergave om ze te zien.';

  @override
  String get diagBackToCamera => 'Terug naar livecamera';

  @override
  String get diagDebugOnly =>
      'Testbeelden zijn alleen beschikbaar in ontwikkelbuilds.';

  @override
  String get diagFileMissing => 'Op dat pad bestaat geen bestand.';

  @override
  String get emergencySetupTitle => 'Impactdetectie';

  @override
  String get emergencyExperimental => 'Experimenteel';

  @override
  String get emergencyIntro =>
      'Tijdens een rit kan Corvista met de bewegingssensoren van je iPhone letten op een mogelijke zware impact. Als er een wordt gedetecteerd, start een aftelling. Annuleer je die niet, dan biedt Corvista aan om de hulpdiensten te bellen en je contacten een bericht te sturen.';

  @override
  String get emergencyDisclaimer1 =>
      'Geen vervanging voor hulpdiensten of de eigen aanrijdingsdetectie van je voertuig.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS vraagt altijd om bevestiging voordat een oproep wordt gedaan of een bericht wordt verstuurd.';

  @override
  String get emergencyDisclaimer3 =>
      'Impacten kunnen worden gemist, en hard remmen of hobbels kunnen voor een impact worden aangezien.';

  @override
  String get emergencyParkedWarning =>
      'Rond deze configuratie af terwijl je geparkeerd staat. Instellingen zijn vergrendeld zolang het voertuig rijdt.';

  @override
  String get emergencyEnable => 'Schakel impactdetectie in';

  @override
  String get emergencyEnableSubtitle => 'Alleen actief tijdens een rit';

  @override
  String get emergencyNeedNumber => 'Voeg eerst een alarmnummer toe.';

  @override
  String get emergencyContacts => 'Noodcontacten';

  @override
  String get emergencyAddContact => 'Contact toevoegen';

  @override
  String get emergencyNoContacts =>
      'Nog geen contacten. Contacten krijgen pas een bericht nadat je dat bevestigt.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '$name verwijderen?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Deze persoon wordt na een impact niet meer als ontvanger voorgesteld.';

  @override
  String get emergencyRemove => 'Verwijder';

  @override
  String get emergencyContactsError => 'Contacten konden niet worden geladen.';

  @override
  String get emergencyNumber => 'Alarmnummer';

  @override
  String get emergencyNumberHint => 'bijv. 112 of 911';

  @override
  String get emergencyMessage => 'Berichtsjabloon';

  @override
  String get emergencyMessageDefault =>
      'Ik ben mogelijk betrokken geweest bij een verkeersongeval. Dit bericht is voorbereid door Corvista en bevat mijn laatst bekende locatie, indien beschikbaar.';

  @override
  String get emergencyMessageHint =>
      'Laat leeg om het standaardbericht te gebruiken.';

  @override
  String get emergencyCountdown => 'Duur van aftelling';

  @override
  String get emergencyVoiceCancel => 'Annuleer met je stem';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Zeg “Het gaat goed” of “Annuleer” tijdens de aftelling. Gebruikt spraakherkenning op het apparaat waar beschikbaar.';

  @override
  String get emergencyVoicePermDenied =>
      'Voor annuleren met je stem is toegang tot de microfoon en spraakherkenning nodig.';

  @override
  String get emergencyAutoSave => 'Sla incidentclip automatisch op';

  @override
  String get emergencyTest => 'Test aftelling (zonder oproep)';

  @override
  String get emergencyTestBody =>
      'Voert een gesimuleerde impact uit zodat je de aftelling kunt zien. In testmodus wordt nooit een oproep gedaan of een bericht verstuurd.';

  @override
  String get emergencyNotSet => 'Niet ingesteld';

  @override
  String get emergencyAlertHeadline => 'Mogelijke zware impact gedetecteerd.';

  @override
  String get emergencyAlertSubtitle => 'Gaat het goed met je?';

  @override
  String get emergencyAlertCancel => 'Het gaat goed — Annuleer';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Nog $seconds seconden',
      one: 'Nog 1 seconde',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Luistert — zeg “Het gaat goed” om te annuleren';

  @override
  String emergencyAlertHeard(String text) {
    return 'Gehoord: “$text”';
  }

  @override
  String get emergencyAlertEscalated => 'Geen reactie. Kies wat je wilt doen:';

  @override
  String get emergencyAlertCall => 'Bel hulpdiensten';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Belt $number. iOS vraagt om bevestiging.';
  }

  @override
  String get emergencyAlertMessage => 'Bericht naar contacten';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Opent een voorbereid bericht. Jij kiest of het wordt verstuurd.';

  @override
  String get emergencyAlertTestMode => 'Testmodus — er wordt niet gebeld';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'Het gaat goed — Sluit';

  @override
  String get emergencyMsgSent => 'Bericht verstuurd.';

  @override
  String get emergencyMsgCancelled => 'Bericht niet verstuurd.';

  @override
  String get emergencyMsgFailed => 'Het bericht kon niet worden verstuurd.';

  @override
  String get emergencyMsgUnavailable =>
      'Berichten zijn niet beschikbaar op dit apparaat.';

  @override
  String emergencyCallFailed(String number) {
    return 'Het gesprek kon niet worden gestart. Bel zelf $number.';
  }

  @override
  String get modelsTitle => 'AI-modellen';

  @override
  String get modelsIntro =>
      'Alle modellen zitten in de app en draaien volledig op je iPhone. Je camerabeeld verlaat het apparaat nooit.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Live: $ms ms per frame · $hz detecties/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Geladen in $ms ms';
  }

  @override
  String get modelsEfficientName => 'Efficiënt';

  @override
  String get modelsEfficientDesc =>
      'Snelle, compacte detector voor lange ritten met weinig warmte en batterijverbruik.';

  @override
  String get modelsEnhancedName => 'Verbeterd';

  @override
  String get modelsEnhancedDesc =>
      'Grotere detector die kleinere en verder weg gelegen objecten vindt, tegen een hoger energieverbruik.';

  @override
  String get modelsSegmentationName => 'Segmentatie';

  @override
  String get modelsSegmentationDesc =>
      'Combineert snelle detectie met wegdek- en objectmaskers voor de Perceptieweergave.';

  @override
  String get modelsNoneName => 'AI gepauzeerd';

  @override
  String get modelsNoneDesc =>
      'Camera en opname blijven draaien zonder objectdetectie. Laagste energieverbruik.';

  @override
  String get modelsGenericDesc => 'Objectdetectiemodel op het apparaat.';

  @override
  String get modelsFunctionDetection =>
      'Detecteert voertuigen, personen, fietsen, motoren, bussen, verkeerslichten en stopborden';

  @override
  String get modelsFunctionSegmentation => 'Voegt wegdek- en objectmaskers toe';

  @override
  String get modelsFunctionNone => 'Geen detectie; alleen dashcamopname';

  @override
  String get modelsSize => 'Grootte';

  @override
  String get modelsInput => 'Invoer';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Werkt met';

  @override
  String get modelsStatusInstalled => 'Geïnstalleerd (meegeleverd)';

  @override
  String get modelsStatusNotInstalled => 'Niet geïnstalleerd';

  @override
  String get modelsSelected => 'Geselecteerd';

  @override
  String get modelsUse => 'Gebruik dit model';

  @override
  String get modelsSwitching => 'Model laden…';

  @override
  String modelsSwitched(String name) {
    return '$name is nu actief';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Gemeten op dit apparaat: gemiddeld $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Niet gemeten op dit apparaat';

  @override
  String get modelsBenchmarkRun => 'Start benchmark';

  @override
  String get modelsBenchmarkRunning => 'Benchmark wordt uitgevoerd…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Selecteer dit model om het te benchmarken.';

  @override
  String get modelsBenchmarkDone => 'Benchmark voltooid';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Benchmark mislukt: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Laatst bijgewerkt op $date';
  }

  @override
  String get safetyTitle => 'Veiligheidsinformatie';

  @override
  String get safetyIntro =>
      'Corvista is een hulpmiddel voor alertheid tijdens het rijden. De app bestuurt je voertuig niet en kan je eigen aandacht, beoordelingsvermogen of de veiligheidssystemen van het voertuig niet vervangen.';

  @override
  String get safetyBeforeTitle => 'Voordat je rijdt';

  @override
  String get safetyBefore1 =>
      'Bevestig je iPhone stevig op een toegestane plek die je zicht, airbags of bedieningselementen niet blokkeert.';

  @override
  String get safetyBefore2 =>
      'Rond de configuratie af, kies een weergave en stel je bestemming in terwijl je geparkeerd staat.';

  @override
  String get safetyBefore3 =>
      'Sluit bij langere ritten een oplader aan en houd de telefoon waar mogelijk uit direct zonlicht.';

  @override
  String get safetyWhileTitle => 'Tijdens het rijden';

  @override
  String get safetyWhile1 =>
      'Houd je ogen op de weg. Gebruik de grote bedieningselementen op het scherm alleen als dat veilig en toegestaan is.';

  @override
  String get safetyWhile2 =>
      'Meldingen zijn hulpmiddelen, geen waarschuwingen waarop je kunt vertrouwen. Stilte betekent nooit dat de weg vrij is.';

  @override
  String get safetyWhile3 =>
      'Volg verkeerswetten, seinen en verkeersborden, niet de app, als die verschillen.';

  @override
  String get safetyLimitsTitle => 'Beperkingen';

  @override
  String get safetyLimits1 =>
      'Een enkele telefooncamera ziet alleen wat ervoor ligt. Objecten buiten beeld, verborgen of zeer dichtbij worden niet gedetecteerd.';

  @override
  String get safetyLimits2 =>
      'Detecties kunnen ontbreken, te laat komen of onjuist zijn, vooral bij nacht, regen, mist, schittering of een vuile voorruit.';

  @override
  String get safetyLimits3 =>
      'Alleen ondersteunde categorieën worden herkend: voertuigen, bussen, motoren, fietsen, personen, verkeerslichten en stopborden. Rijstrookaanwijzingen in de virtuele weergave zijn gestileerd, geen gedetecteerde rijstroken.';

  @override
  String get safetyLimits4 =>
      'Nabijheid wordt getoond als geschatte zones (Zeer dichtbij, Dichtbij, Gemiddeld, Ver), nooit als gemeten afstanden. De parkeerweergave is geen vervanging voor parkeersensoren.';

  @override
  String get safetyHeatTitle => 'Hitte en batterij';

  @override
  String get safetyHeat1 =>
      'Continu gebruik van camera en AI maakt je iPhone warm. Corvista verlaagt de analysefrequentie als het apparaat heet wordt en toont een waarschuwing; als iOS oververhit raakt, kan de camera stoppen.';

  @override
  String get safetyEmergencyTitle => 'Noodfunctie';

  @override
  String get safetyEmergency1 =>
      'Detectie van mogelijke impact is experimenteel. Echte ongevallen kunnen worden gemist en andere gebeurtenissen kunnen de functie activeren.';

  @override
  String get safetyEmergency2 =>
      'De functie neemt nooit ongemerkt contact op met iemand: iOS vraagt altijd om bevestiging voor een oproep of bericht. Het is geen vervanging voor zelf de hulpdiensten bellen.';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacyIntro =>
      'Corvista is ontworpen om je rijgegevens op je iPhone te houden. Er is geen Corvista-account en Corvista beheert geen eigen servers.';

  @override
  String get privacyCameraTitle => 'Camera en AI';

  @override
  String get privacyCamera1 =>
      'Objectdetectie, tracking en segmentatie draaien volledig op je iPhone. Cameraframes worden nooit geüpload.';

  @override
  String get privacyCamera2 =>
      'De camera werkt alleen zolang Corvista geopend op het scherm staat. Ze pauzeert als de app naar de achtergrond gaat: er is geen verborgen opname op de achtergrond.';

  @override
  String get privacyRecordingsTitle => 'Opnamen';

  @override
  String get privacyRecordings1 =>
      'De lopende buffer is tijdelijk en wordt continu overschreven. Beeld wordt alleen bewaard als je op Incident opslaan tikt of, als je dat inschakelt, na een mogelijke impact.';

  @override
  String get privacyRecordings2 =>
      'Opgeslagen clips blijven in de privéopslag van Corvista op je iPhone. Ze verlaten het apparaat alleen als je Deel kiest. Als je de app verwijdert, worden ze ook verwijderd.';

  @override
  String get privacyRecordings3 =>
      'Audio wordt alleen opgenomen als je dit inschakelt en toegang tot de microfoon geeft.';

  @override
  String get privacyLocationTitle => 'Locatie';

  @override
  String get privacyLocation1 =>
      'De locatie wordt gebruikt terwijl de app open is voor je snelheid, de kaart, routes en weer. Als “Bewaar locatie” aan staat, wordt de positie op het moment van opslaan met de clip op je apparaat bewaard.';

  @override
  String get privacyNetworkTitle => 'Netwerkdiensten';

  @override
  String get privacyNetwork1 =>
      'Apple Maps: kaartweergave, plaatsen zoeken en routes. Je zoektekst en geschatte locatie worden naar Apple verzonden.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit): actueel en uurlijks weer voor je locatie.';

  @override
  String get privacyNetwork4 =>
      'Corvista bevat geen advertenties en geen analyse- of trackingdiensten van derden.';

  @override
  String get privacyEmergencyTitle => 'Noodcontacten';

  @override
  String get privacyEmergency1 =>
      'Contacten die je kiest, worden in de iOS-sleutelhanger op dit apparaat bewaard. Annuleren met je stem gebruikt spraakherkenning op het apparaat waar beschikbaar. Oproepen en berichten worden pas verzonden nadat je ze in iOS bevestigt.';

  @override
  String get privacyControlsTitle => 'Jouw controle';

  @override
  String get privacyControls1 =>
      'Je kunt clips op elk moment verwijderen in Clips en toegang tot camera, microfoon, locatie en spraak wijzigen of intrekken in iOS Instellingen.';

  @override
  String get termsTitle => 'Gebruiksvoorwaarden';

  @override
  String get termsIntro =>
      'Door Corvista te gebruiken ga je akkoord met deze voorwaarden. Daarnaast geldt Apple’s standaard licentieovereenkomst voor eindgebruikers van gelicentieerde apps.';

  @override
  String get termsUseTitle => 'Corvista gebruiken';

  @override
  String get termsUse1 =>
      'Corvista is een hulpmiddel voor alertheid tijdens het rijden en een dashcamfunctie. Je blijft te allen tijde volledig verantwoordelijk voor veilig en wettig rijden.';

  @override
  String get termsUse2 =>
      'Gebruik de app niet op een manier die je tijdens het rijden afleidt. Bevestig het apparaat stevig en op een toegestane manier.';

  @override
  String get termsAccuracyTitle => 'Geen garantie op nauwkeurigheid';

  @override
  String get termsAccuracy1 =>
      'Detecties, zones, meldingen, kaartmarkeringen, routes en weer kunnen onvolledig, vertraagd of onjuist zijn. Corvista bestuurt je voertuig niet.';

  @override
  String get termsAccuracy2 =>
      'De noodfunctie is experimenteel en kan een impact missen of ten onrechte worden geactiveerd.';

  @override
  String get termsRecordingTitle => 'Opnamewetten';

  @override
  String get termsRecording1 =>
      'Wetten over dashcams, geluidsopnamen en het filmen van personen verschillen per land en regio. Jij bent verantwoordelijk voor naleving, ook wanneer je clips deelt.';

  @override
  String get termsLiabilityTitle => 'Aansprakelijkheid';

  @override
  String get termsLiability1 =>
      'De app wordt geleverd “zoals deze is”. Voor zover wettelijk toegestaan is de ontwikkelaar niet aansprakelijk voor ongevallen, verliezen, boetes of schade die voortvloeit uit het gebruik ervan of uit vertrouwen op de uitkomsten ervan.';

  @override
  String get termsChangesTitle => 'Wijzigingen';

  @override
  String get termsChanges1 =>
      'Deze voorwaarden kunnen met nieuwe versies van de app worden bijgewerkt. Doorgaand gebruik na een update betekent dat je de herziene voorwaarden accepteert.';

  @override
  String get helpTitle => 'Help';

  @override
  String get helpIntro =>
      'Antwoorden op veelgestelde vragen. Voor veiligheidsadvies, zie Veiligheidsinformatie.';

  @override
  String get helpQSave => 'Hoe bewaar ik beeld van een incident?';

  @override
  String get helpASaveBuffer =>
      'Tik in de rijweergave op de grote knop Incident opslaan. Corvista bewaart de laatste 20 of 30 seconden van de lopende buffer (jouw keuze in Instellingen › Opname) in Clips.';

  @override
  String get helpQWhere => 'Waar worden mijn clips bewaard?';

  @override
  String get helpAWhere =>
      'In de privéopslag van Corvista op je iPhone. Ze worden nooit geüpload. Gebruik Deel in de speler om een clip te versturen of te exporteren.';

  @override
  String get helpQZones => 'Hoe nauwkeurig zijn de nabijheidszones?';

  @override
  String get helpAZones =>
      'Zones zijn grove schattingen van één camera op basis van gebruikelijke objectafmetingen. Zie ze als geschatte aanwijzingen, nooit als afstanden.';

  @override
  String get helpQSlow => 'Waarom wordt detectie langzamer?';

  @override
  String get helpASlow =>
      'Als je iPhone warm wordt, de batterij bijna leeg is of de stroombesparingsmodus aan staat, verlaagt Corvista de analysefrequentie om het apparaat te beschermen. Je kunt de energiemodus wijzigen in Instellingen.';

  @override
  String get helpQMap => 'De kaart, zoekfunctie of het weer werkt niet.';

  @override
  String get helpAMap =>
      'Deze functies hebben een internetverbinding en locatietoegang nodig. Controleer je verbinding en sta locatie toe voor Corvista in iOS Instellingen.';

  @override
  String get helpQSimulator =>
      'De camera wordt als niet beschikbaar weergegeven.';

  @override
  String get helpASimulator =>
      'Zorg dat cameratoegang is toegestaan in iOS Instellingen en dat geen andere app de camera gebruikt. In de iOS Simulator is geen camera; een lokale testvideo kan als alternatief worden gebruikt.';

  @override
  String get emergencyMsgNoContacts => 'Voeg eerst een noodcontact toe.';

  @override
  String get cameraStarting => 'Camera starten…';

  @override
  String get cameraInterrupted => 'Camera gepauzeerd';

  @override
  String get cameraInterruptedBody =>
      'iOS heeft de camera gepauzeerd, bijvoorbeeld tijdens een gesprek of doordat een andere app hem gebruikt. Hij hervat automatisch.';

  @override
  String get cameraUnavailable => 'Camera niet beschikbaar';

  @override
  String get cameraUnavailableBody =>
      'Op dit apparaat is geen camera beschikbaar. De detectie-, opname- en parkeerweergave hebben de camera aan de achterkant nodig.';

  @override
  String get cameraRunTestFootage => 'Start testbeelden';

  @override
  String get cameraPermissionDenied => 'Cameratoegang is uit';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista heeft de camera nodig voor detectie, dashcamopname en de parkeerweergave. Schakel Cameratoegang in bij Instellingen.';

  @override
  String get cameraError => 'Camerafout';

  @override
  String get cameraStopped => 'Camera gestopt';

  @override
  String get cameraStart => 'Start camera';

  @override
  String get cameraFocusHint => 'Tik om scherp te stellen';

  @override
  String get cameraPreviewLabel =>
      'Live camerabeeld met gedetecteerde objecten';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Camera $fps fps · AI $hz Hz · $ms ms · gedropt $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Snelheid $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Geen GPS-snelheid';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Koers $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Dashcambuffer neemt op, $seconds van $target seconden gebufferd';
  }

  @override
  String get hudRecIdle => 'REC uit';

  @override
  String get hudRecSaving => 'Opslaan…';

  @override
  String get hudRecError => 'REC-fout';

  @override
  String get hudAiPaused => 'AI gepauzeerd';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objecten',
      one: '1 object',
      zero: 'Geen objecten',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objecten',
      one: '1 object',
      zero: 'geen objecten',
    );
    return 'AI-model $model, $_temp0 gedetecteerd';
  }

  @override
  String get hudThermalSerious => 'Heet — AI vertraagd';

  @override
  String get hudThermalCritical => 'Te heet — AI gepauzeerd';

  @override
  String hudBatteryLow(String percent) {
    return 'Batterij $percent';
  }

  @override
  String get hudLowPower => 'Stroombesparing';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Weer $temperature, $condition. Tik voor details.';
  }

  @override
  String get hudNoGuidance =>
      'Zoek een bestemming in de Kaartweergave om hier stapsgewijze navigatie te zien.';

  @override
  String get navArrived => 'Je bent aangekomen';

  @override
  String get navRerouting => 'Route opnieuw berekenen…';

  @override
  String get navSearchHint => 'Zoek bestemming';

  @override
  String get navSearchFieldHint => 'Adres, plaats of bedrijf';

  @override
  String get navNoResults => 'Geen overeenkomende plaatsen';

  @override
  String get navSearching => 'Zoeken…';

  @override
  String get navSearchStartTyping =>
      'Typ een adres of plaatsnaam. Resultaten komen van Apple Maps en vereisen een internetverbinding.';

  @override
  String get navErrorUnavailable =>
      'Zoeken en routes zijn niet beschikbaar — controleer je internetverbinding.';

  @override
  String get navErrorNoLocation =>
      'Wachten op je locatie om een route te plannen.';

  @override
  String get navErrorPermission =>
      'Locatietoegang is uit, dus routes kunnen niet vanaf je positie starten.';

  @override
  String navErrorGeneric(String code) {
    return 'Routes konden niet worden geladen ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Routes naar $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Aankomst $time';
  }

  @override
  String get navStart => 'Start';

  @override
  String get navEnd => 'Stop';

  @override
  String get navEndLabel => 'Stop navigatie';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · nog $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Let op: $text';
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
    return '$hours u $minutes min';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Route $index: $name';
  }

  @override
  String get weatherTitle => 'Weer';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Voelt als $temperature';
  }

  @override
  String get weatherPrecipitation => 'Neerslag';

  @override
  String get weatherWind => 'Wind';

  @override
  String get weatherVisibility => 'Zicht';

  @override
  String get weatherHumidity => 'Luchtvochtigheid';

  @override
  String get weatherHourly => 'Komende uren';

  @override
  String weatherAsOf(String time) {
    return 'Bijgewerkt $time';
  }

  @override
  String get weatherRefresh => 'Ververs weer';

  @override
  String get weatherUnavailable => 'Het weer is momenteel niet beschikbaar.';

  @override
  String get weatherNoLocation => 'Voor het weer is je locatie nodig.';

  @override
  String get weatherLegal => 'Gegevensbronnen en juridische informatie';

  @override
  String weatherProvidedBy(String service) {
    return 'Weergegevens: $service';
  }

  @override
  String get weatherNow => 'Nu';

  @override
  String get virtualEmpty => 'Geen ondersteunde objecten gedetecteerd';

  @override
  String get virtualEmptyCameraOff =>
      'De virtuele weergave heeft de livecamera nodig.';

  @override
  String get virtualLaneDisclaimer =>
      'Rijstrooklijnen zijn illustratief, niet gedetecteerd.';

  @override
  String virtualNearest(String zone) {
    return 'Dichtstbij: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtueel wegbeeld: $summary';
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
  String get virtualStatusPaused => 'gepauzeerd';

  @override
  String get virtualStatusCameraOff => 'Camera uit';

  @override
  String get virtualStatusTestFootage => 'Testbeelden';

  @override
  String get virtualEmptyHint =>
      'Voertuigen, mensen, fietsen, verkeerslichten en stopborden verschijnen hier zodra ze worden gedetecteerd.';

  @override
  String get mapRecenter => 'Centreer';

  @override
  String get mapZoomIn => 'Zoom in';

  @override
  String get mapZoomOut => 'Zoom uit';

  @override
  String get mapUnsupported =>
      'De interactieve kaart is beschikbaar op iPhone.';

  @override
  String get mapObjectsApprox => 'Objectmarkeringen zijn geschatte posities.';

  @override
  String get mapWeatherUnavailable => 'Weer niet beschikbaar';

  @override
  String get navErrorNoRoute => 'Geen route gevonden naar deze bestemming.';

  @override
  String get navDismiss => 'Sluit';

  @override
  String get navGo => 'Ga';

  @override
  String get navFastest => 'Snelste';

  @override
  String get navThen => 'Daarna';

  @override
  String get navRecents => 'Recent';

  @override
  String get navClearRecents => 'Wissen';

  @override
  String get navSearchSubmitHint =>
      'Tik op Zoek om alle overeenkomende plaatsen te zien';

  @override
  String get navPlaces => 'Plaatsen';

  @override
  String get navEtaLabel => 'aankomst';

  @override
  String get navTimeLeftLabel => 'resterend';

  @override
  String get navOverview => 'Overzicht';

  @override
  String get navMute => 'Stem dempen';

  @override
  String get navUnmute => 'Stem inschakelen';

  @override
  String get navEndConfirm => 'Navigatie stoppen?';

  @override
  String navEndConfirmBody(String place) {
    return 'De begeleiding naar $place stopt.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Je bent aangekomen bij $place';
  }

  @override
  String get navDone => 'Klaar';

  @override
  String get navWeakGps => 'Zwak gps-signaal';

  @override
  String get navLocationOff =>
      'Locatie staat uit. Zet deze aan om routes te plannen en te navigeren.';

  @override
  String get navVoiceGuidance => 'Gesproken begeleiding';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Over $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, daarna $second';
  }

  @override
  String get navSpeakRerouting => 'Route opnieuw berekenen';

  @override
  String get navSpeakArrived => 'Je bent aangekomen';

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
      other: '$count voet',
      one: '1 voet',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yards',
      one: '1 yard',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Ga door voor $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Voor deze rit zijn in deze regio geen routebeschrijvingen beschikbaar. Probeer een andere bestemming.';

  @override
  String navContinueFor(String distance) {
    return 'Ga door voor $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value mijl',
      one: '1 mijl',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Dichtstbij: $object · $zone';
  }

  @override
  String get parkingNothing => 'Niets gedetecteerd in beeld';

  @override
  String get parkingBeeps => 'Nabijheidspiepjes';

  @override
  String get parkingVolume => 'Piepvolume';

  @override
  String get parkingLimitations =>
      'Eén camera, geen 360°. Objecten buiten het camerabeeld worden niet gedetecteerd. Geen vervanging voor parkeersensoren; schattingen kunnen onjuist zijn en stilte betekent niet dat de ruimte vrij is.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Nabijheidsweergave van bovenaf. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Origineel';

  @override
  String get perceptionModeBoxes => 'Kaders';

  @override
  String get perceptionModeMasks => 'Objectmaskers';

  @override
  String get perceptionModeRoad => 'Wegdek';

  @override
  String get perceptionModeCombined => 'Gecombineerd';

  @override
  String get perceptionOpacity => 'Maskerdekking';

  @override
  String get perceptionDisclaimer =>
      'Het wegdekmasker is een geschatte visuele laag. Het toont geen berijdbare ruimte of rijstroken.';

  @override
  String get perceptionNeedsModel =>
      'Selecteer het Segmentatiemodel om maskers te zien.';

  @override
  String get perceptionChooseModel => 'Kies model';

  @override
  String get perceptionWaiting => 'Wachten op het eerste segmentatieframe…';

  @override
  String get perceptionShortCamera => 'Camera';

  @override
  String get perceptionShortBoxes => 'Kaders';

  @override
  String get perceptionShortObjects => 'Objecten';

  @override
  String get perceptionShortRoad => 'Weg';

  @override
  String get perceptionShortAll => 'Alles';

  @override
  String get perceptionModesLabel => 'Perceptielagen';

  @override
  String get perceptionStatusWarmingUp => 'Voorbereiden…';

  @override
  String get perceptionStatusLoadingModel => 'Model laden…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Maskers gepauzeerd';

  @override
  String get perceptionLegend => 'Maskerlegenda';

  @override
  String get perceptionUnavailable => 'Maskers niet beschikbaar';

  @override
  String get driveSave => 'Bewaar';

  @override
  String get driveSaveIncident => 'Incident opslaan';

  @override
  String driveSaveHint(int seconds) {
    return 'Slaat de laatste $seconds seconden dashcambeeld op';
  }

  @override
  String get driveSaving => 'Incident opslaan…';

  @override
  String hudRecManualLabel(String time) {
    return 'Opname bezig, $time';
  }

  @override
  String get driveRecord => 'Opname';

  @override
  String get driveRecordStartA11y => 'Opname starten';

  @override
  String driveRecordStopA11y(String time) {
    return 'Opname stoppen, $time opgenomen';
  }

  @override
  String get driveRecordHint =>
      'Neemt continu op tot je stopt, inclusief de laatste 5 seconden';

  @override
  String get driveRecordFailed => 'Opname kon niet worden gestart';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Opname opgeslagen · $count delen',
      one: 'Opname opgeslagen',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Opname gestopt: opslag bijna vol',
      'max_duration': 'Opname gestopt: maximale duur bereikt',
      'camera_stopped': 'Opname gestopt samen met de camera',
      'background': 'Opname gestopt: de app is naar de achtergrond gegaan',
      'thermal': 'Opname gestopt: de telefoon is te heet',
      'other': 'Opname gestopt',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Incident opgeslagen · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Bekijk';

  @override
  String get driveSaveFailed => 'Het incident kon niet worden opgeslagen.';

  @override
  String get driveSaveNotRunning =>
      'De opname is nog niet gestart. Wacht tot de camera is gestart en probeer het opnieuw.';

  @override
  String get driveSaveTestFootage =>
      'Testbeelden worden niet opgenomen. Incidenten opslaan werkt met de livecamera.';

  @override
  String get driveSaveStorageFull =>
      'Je iPhone heeft geen opslagruimte meer. Maak ruimte vrij of verwijder oudere clips.';

  @override
  String get driveSaveIoError =>
      'De clip kon niet naar de opslag worden geschreven.';

  @override
  String get driveClips => 'Clips';

  @override
  String get driveSettings => 'Instellingen';

  @override
  String get driveViewSwitcher => 'Rijweergaven';

  @override
  String get driveLocationDenied =>
      'Locatie is uit — snelheid, kaarten en routes zijn niet beschikbaar.';

  @override
  String get driveCameraDenied =>
      'Cameratoegang is uit — detectie en opname zijn niet beschikbaar.';

  @override
  String get driveRecorderFallback =>
      'Opname zonder audio: toegang tot de microfoon is uit.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Opname-instellingen zijn aangepast: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Je iPhone is heet. AI draait langzamer om af te koelen. Houd hem uit de directe zon en in de buurt van een ventilatieopening.';

  @override
  String get drivePowerThermalCritical =>
      'Je iPhone is te heet. AI-detectie is gepauzeerd tot hij is afgekoeld; opname gaat indien mogelijk door.';

  @override
  String get drivePowerLowPower =>
      'Stroombesparingsmodus staat aan: AI draait op een lagere frequentie.';

  @override
  String get drivePowerBatteryLow =>
      'De batterij is bijna leeg. Sluit je iPhone tijdens het rijden aan op stroom.';

  @override
  String get onboardingTitle1 => 'Zie meer van elke rit.';

  @override
  String get onboardingBody1 =>
      'Verander je iPhone in een slimme dashcam en metgezel voor alertheid tijdens het rijden.';

  @override
  String get onboardingTitle2 => 'Intelligentie in elk frame.';

  @override
  String get onboardingBody2 =>
      'Herken ondersteunde voertuigen, personen, fietsen en verkeerssignalen rechtstreeks op je iPhone.';

  @override
  String get onboardingTitle3 => 'Eén weg. Meerdere perspectieven.';

  @override
  String get onboardingBody3 =>
      'Schakel tussen live detectie, virtuele rijweergaven, interactieve kaarten en parkeervisualisatie.';

  @override
  String get onboardingTitle4 => 'Bewaar de momenten die ertoe doen.';

  @override
  String get onboardingBody4 =>
      'Bewaar recent dashcambeeld, bekijk incidenten en deel opnamen.';

  @override
  String get onboardingTitle5 => 'Veiligheid en privacy';

  @override
  String get onboardingSafety1 =>
      'Corvista is een hulpmiddel voor alertheid tijdens het rijden. Houd je ogen op de weg.';

  @override
  String get onboardingSafety2 =>
      'De app bestuurt je voertuig niet en vervangt je eigen beoordeling niet.';

  @override
  String get onboardingSafety3 =>
      'Detecties en schattingen kunnen onnauwkeurig zijn of ontbreken.';

  @override
  String get onboardingSafety4 =>
      'Camerabeelden worden op je iPhone verwerkt: video wordt niet geüpload.';

  @override
  String get onboardingSafety5 =>
      'Kaarten, zoeken, routes en weer hebben een internetverbinding nodig.';

  @override
  String get onboardingSafety6 =>
      'Bevestig je iPhone stevig zodat hij je zicht niet blokkeert.';

  @override
  String get onboardingSafety7 =>
      'Rond de configuratie af voordat je gaat rijden.';

  @override
  String get onboardingAcknowledge =>
      'Ik begrijp dat Corvista een hulpmiddel voor alertheid is en dat ik zelf verantwoordelijk blijf voor veilig rijden.';

  @override
  String get onboardingReadSafety => 'Lees de volledige veiligheidsinformatie';

  @override
  String get onboardingNext => 'Volgende';

  @override
  String get onboardingSkip => 'Sla over';

  @override
  String get onboardingAgree => 'Ga door';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Pagina $current van $total';
  }

  @override
  String get permTitle => 'Toegang';

  @override
  String get permIntro =>
      'Corvista vraagt alleen om wat elke functie nodig heeft. Je kunt dit op elk moment wijzigen in Instellingen.';

  @override
  String get permCameraTitle => 'Camera';

  @override
  String get permCameraBody =>
      'Vereist voor detectie, dashcamopname en de parkeerweergave. Video wordt op je iPhone verwerkt.';

  @override
  String get permLocationTitle => 'Locatie';

  @override
  String get permLocationBody =>
      'Gebruikt voor GPS-snelheid, de kaart, routes, weer en het taggen van opgeslagen clips. Alleen terwijl je de app gebruikt.';

  @override
  String get permMicTitle => 'Microfoon';

  @override
  String get permSpeechNote =>
      'Spraakherkenning wordt alleen gevraagd als je annuleren met je stem voor noodmeldingen inschakelt.';

  @override
  String get permRequired => 'Vereist';

  @override
  String get permOptional => 'Optioneel';

  @override
  String get permAllow => 'Sta toe';

  @override
  String get permGranted => 'Toegestaan';

  @override
  String get permDenied => 'Geweigerd';

  @override
  String get permLimited => 'Beperkt';

  @override
  String get permRestricted => 'Beperkt door beheer';

  @override
  String get permStart => 'Begin met rijden';

  @override
  String get permCameraNeeded =>
      'Je kunt doorgaan zonder cameratoegang, maar detectie en opname werken pas als je dit toestaat in Instellingen.';

  @override
  String get permSetupIntro =>
      'Corvista heeft deze toestemmingen nodig om volledig te werken. Tik op Alles toestaan en iOS vraagt er één voor één om. Je kunt ze altijd wijzigen in Instellingen.';

  @override
  String get permCameraLine =>
      'Nodig voor detectie, dashcamopname en de parkeerweergave. Video wordt op je iPhone verwerkt en nooit geüpload.';

  @override
  String get permLocationLine =>
      'GPS-snelheid, kaart, routes, weer en waar clips zijn opgeslagen. Alleen terwijl je de app gebruikt.';

  @override
  String get permMicLine =>
      'Cabinegeluid in incidentclips en het horen van je annuleerzin tijdens een noodmelding.';

  @override
  String get permSpeechTitle => 'Spraakherkenning';

  @override
  String get permSpeechLine =>
      'Herkent je annuleerzin tijdens het noodaftellen, op je iPhone waar dat wordt ondersteund.';

  @override
  String get permAllowAll => 'Alles toestaan';

  @override
  String permAsking(String permission) {
    return '$permission wordt gevraagd…';
  }

  @override
  String get permSomeDenied =>
      'Sommige toestemmingen staan uit. Zet ze aan in Instellingen om die functies te gebruiken.';

  @override
  String get permNotNow => 'Niet nu';

  @override
  String get tourLabel => 'Rondleiding door het rijscherm';

  @override
  String tourProgress(int current, int total) {
    return 'Stap $current van $total';
  }

  @override
  String get tourNext => 'Volgende';

  @override
  String get tourBack => 'Terug';

  @override
  String get tourSkip => 'Rondleiding overslaan';

  @override
  String get tourFinish => 'Begin met rijden';

  @override
  String get tourWelcomeTitle => 'Je korte rondleiding';

  @override
  String get tourWelcomeBody =>
      'Een minuut om te zien wat telt op het rijscherm. Het best als je stilstaat.';

  @override
  String get tourHudTitle => 'Je instrumentenstrook';

  @override
  String get tourHudSpeed => 'De snelheid komt van GPS.';

  @override
  String get tourHudRec =>
      'REC toont hoeveel seconden beeldmateriaal in de buffer staan.';

  @override
  String get tourHudAi =>
      'De AI-chip toont het model, hoeveel objecten het ziet en een stip: groen actief, oranje beperkt, rood gestopt.';

  @override
  String get tourSaveTitle => 'Incident opslaan';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista houdt een doorlopende buffer van de laatste $seconds seconden video bij. Die wordt voortdurend overschreven, dus er blijft niets bewaard tenzij je op Opslaan tikt. Opgeslagen clips blijven op deze iPhone, in Clips.';
  }

  @override
  String get tourRecordTitle => 'Neem de hele rit op';

  @override
  String get tourRecordBody =>
      'Tik op Opname om continu te filmen tot je stopt. Lange ritten worden in delen van 5 minuten opgeslagen in Clips, en Incident opslaan blijft werken terwijl je opneemt.';

  @override
  String get tourViewsTitle => 'Vijf manieren om de weg te zien';

  @override
  String get tourViewDetection =>
      'Livecamera met kaders rond ondersteunde objecten.';

  @override
  String get tourViewVirtual =>
      'Een vereenvoudigde 3D-scène gebouwd uit detecties.';

  @override
  String get tourViewMap => 'Apple Maps met zoeken en stapsgewijze navigatie.';

  @override
  String get tourViewParking =>
      'Camera plus een nabijheidsweergave van bovenaf.';

  @override
  String get tourViewPerception => 'Weg- en objectmaskers.';

  @override
  String get tourMapTitle => 'Zoeken en stapsgewijze navigatie';

  @override
  String get tourMapBody =>
      'Open Kaart, tik op de zoekbalk en kies een bestemming. Kies een route en tik op Start voor stapsgewijze navigatie. Internetverbinding nodig.';

  @override
  String get tourClipsTitle => 'Clips';

  @override
  String get tourClipsBody =>
      'Bekijk, hernoem, deel of verwijder opgeslagen incidenten. Clips blijven op je iPhone tenzij je ze deelt.';

  @override
  String get tourSettingsTitle => 'Instellingen';

  @override
  String get tourSettingsBody =>
      'Stel spraakmeldingen en hun gevoeligheid, opnamekwaliteit en bufferlengte af en configureer de noodmodus: een experimentele botsingsmelding met annuleeraftelling.';

  @override
  String get tourSafetyTitle => 'Voordat je gaat rijden';

  @override
  String get tourSafety1 =>
      'Bevestig je iPhone stevig, zonder je zicht te blokkeren.';

  @override
  String get tourSafety2 =>
      'Gebruik de app niet tijdens het rijden. Stel alles in terwijl je stilstaat.';

  @override
  String get tourSafety3 =>
      'Detecties en zones zijn schattingen. Ze kunnen onjuist zijn of gemist worden.';

  @override
  String get tourSafety4 =>
      'Je blijft zelf verantwoordelijk voor veilig rijden.';

  @override
  String get helpTakeTour => 'Start de rondleiding';

  @override
  String get helpTakeTourSub =>
      'Een minuut begeleide uitleg over het rijscherm.';

  @override
  String get tripsTitle => 'Ritten';

  @override
  String get tripsOpen => 'Ritlogboek';

  @override
  String get tripsEmptyTitle => 'Nog geen ritten';

  @override
  String get tripsEmptyBody =>
      'Ritten worden automatisch opgenomen terwijl je met Corvista rijdt: afstand, tijd, snelheid en je route.';

  @override
  String get tripsDisabledBody =>
      'Het ritlogboek staat uit, dus nieuwe ritten worden niet opgenomen. Zet het aan om een privélogboek van je routes op deze iPhone te bewaren.';

  @override
  String get tripsEnable => 'Ritlogboek aanzetten';

  @override
  String get tripsToday => 'Vandaag';

  @override
  String get tripsYesterday => 'Gisteren';

  @override
  String tripsRecordingNow(String distance) {
    return 'Rit wordt opgenomen · $distance';
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
      other: '$count incidenten',
      one: '1 incident',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meldingen',
      one: '1 melding',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ritten',
      one: '1 rit',
      zero: 'Geen ritten',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Afstand';

  @override
  String get tripsStatDuration => 'Duur';

  @override
  String get tripsStatMoving => 'Rijtijd';

  @override
  String get tripsStatAvgSpeed => 'Gem. snelheid';

  @override
  String get tripsStatMaxSpeed => 'Max. snelheid';

  @override
  String get tripsDetections => 'Detecties';

  @override
  String get tripsNoDetections =>
      'Tijdens deze rit zijn geen verkeersobjecten vastgelegd.';

  @override
  String get tripsTimeline => 'Tijdlijn';

  @override
  String get tripsEventStart => 'Rit gestart';

  @override
  String get tripsEventEnd => 'Rit beëindigd';

  @override
  String get tripsEventAlert => 'Spraakmelding';

  @override
  String get tripsEventIncident => 'Incidentclip opgeslagen';

  @override
  String get tripsEventEmergency => 'Mogelijke botsing gedetecteerd';

  @override
  String get tripsEventNavStart => 'Navigatie gestart';

  @override
  String get tripsEventArrive => 'Aangekomen op bestemming';

  @override
  String get tripsEventReroute => 'Route opnieuw berekend';

  @override
  String get tripsEventRecording => 'Opname opgeslagen';

  @override
  String get tripsOpenClip => 'Clip openen';

  @override
  String get tripsTrackPreview => 'GPS-spoor';

  @override
  String get tripsRenameTitle => 'Rit hernoemen';

  @override
  String get tripsRenameHint => 'Naam van de rit';

  @override
  String get tripsFavorite => 'Toevoegen aan favorieten';

  @override
  String get tripsUnfavorite => 'Verwijderen uit favorieten';

  @override
  String get tripsShareGpx => 'GPX delen';

  @override
  String get tripsShareFailed => 'Deze rit kon niet worden gedeeld.';

  @override
  String get tripsDelete => 'Rit verwijderen';

  @override
  String get tripsDeleteConfirmTitle => 'Deze rit verwijderen?';

  @override
  String get tripsDeleteConfirmBody =>
      'De route en statistieken worden van deze iPhone verwijderd. Incidentclips van deze rit blijven bewaard.';

  @override
  String get tripsDeleted => 'Rit verwijderd';

  @override
  String get tripsNotFound => 'Deze rit is niet meer beschikbaar.';

  @override
  String get tripsPrivacyNote =>
      'Alleen op deze iPhone opgeslagen. Er wordt niets geüpload.';

  @override
  String get settingsSectionTrips => 'Ritlogboek';

  @override
  String get settingsTripLog => 'Ritten opnemen';

  @override
  String get settingsTripLogSubtitle =>
      'Bewaart je route en rijstatistieken alleen op deze iPhone.';

  @override
  String get settingsTripRetention => 'Ritten bewaren';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 jaar';

  @override
  String get settingsRetentionForever => 'Altijd';

  @override
  String get settingsTripRetentionFooter =>
      'Oudere ritten worden automatisch verwijderd wanneer Corvista start.';

  @override
  String get settingsViewTrips => 'Ritten bekijken';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours u $minutes min';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes min';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista-rit $date';
  }

  @override
  String get settingsFreeUpSpace => 'Ruimte vrijmaken';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Verwijdert tijdelijke bestanden en caches. Opgeslagen clips en ritten blijven bewaard.';

  @override
  String settingsFreedBytes(String size) {
    return '$size vrijgemaakt';
  }

  @override
  String get settingsNothingToFree =>
      'Caches gewist: geen tijdelijke bestanden om te verwijderen.';

  @override
  String get settingsSectionPrivacyData => 'Privacy en gegevens';

  @override
  String get settingsPrivacyDataFooter =>
      'Clips, ritten en instellingen worden alleen op deze iPhone bewaard. Ze verlaten hem alleen als je ervoor kiest ze te delen.';

  @override
  String get settingsDeleteAllData => 'Alle gegevens verwijderen';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Wis clips, ritten, contacten en instellingen van deze iPhone';

  @override
  String get deleteAllTitle => 'Alle gegevens verwijderen?';

  @override
  String get deleteAllMessage =>
      'Dit verwijdert definitief van deze iPhone:\n• Incidentclips en miniaturen\n• Ritlogboek en GPS-sporen\n• Noodcontacten en noodgebeurtenissen\n• Detectielogboeken en het diagnoselogboek\n• Instellingen en recente bestemmingen\n• Tijdelijke opnamebuffer en cache\n\nDit kan niet ongedaan worden gemaakt. Corvista begint daarna opnieuw bij de welkomstschermen.';

  @override
  String get deleteAllConfirm => 'Alles verwijderen';

  @override
  String get deleteAllInProgress => 'Verwijderen…';

  @override
  String get deleteAllDone => 'Alle gegevens verwijderd';

  @override
  String get deleteAllPartial =>
      'Sommige onderdelen konden niet worden verwijderd. Probeer het opnieuw via Instellingen.';

  @override
  String get diagLogSection => 'Diagnoselogboek';

  @override
  String get diagLogFooter =>
      'Fouten worden alleen op deze iPhone vastgelegd, zonder locaties, contactnamen of telefoonnummers. Er wordt niets verzonden tenzij je het logboek zelf deelt.';

  @override
  String get diagLogShare => 'Deel diagnoselogboek';

  @override
  String get diagLogEmpty => 'Leeg';

  @override
  String get diagLogClear => 'Logboek wissen';

  @override
  String get diagLogClearTitle => 'Diagnoselogboek wissen?';

  @override
  String get diagLogClearBody =>
      'Opgeslagen foutmeldingen worden van deze iPhone verwijderd.';

  @override
  String get diagLogCleared => 'Diagnoselogboek gewist';

  @override
  String get diagLogShareFailed =>
      'Het diagnoselogboek kon niet worden gedeeld.';

  @override
  String get privacyControls2 =>
      'Instellingen › Privacy en gegevens › Alle gegevens verwijderen wist elke clip, rit, contactpersoon, elk logboek en elke instelling die Corvista op deze iPhone heeft opgeslagen.';

  @override
  String get parkingZoneStop => 'Stop';

  @override
  String get parkingZoneVeryClose => 'Zeer dichtbij';

  @override
  String get parkingZoneClose => 'Dichtbij';

  @override
  String get parkingZoneNothingClose => 'Niets dichtbij gezien';

  @override
  String get parkingNotDetected =>
      'Muren, pilaren, palen en stoepranden worden niet gedetecteerd';

  @override
  String get parkingApprox => 'ca.';

  @override
  String get parkingSideLeft => 'Links';

  @override
  String get parkingSideCenter => 'Midden';

  @override
  String get parkingSideRight => 'Rechts';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Alleen beeld van de voorcamera — geen 360°-systeem';

  @override
  String get parkingMuteBeeps => 'Pieptonen dempen';

  @override
  String get parkingUnmuteBeeps => 'Pieptonen aanzetten';

  @override
  String get parkingAbout => 'Over de parkeerweergave';

  @override
  String get parkingLimitationsDetail =>
      'Alleen het gebied voor de camera wordt bewaakt. De detector herkent auto\'s, bussen en vrachtwagens, personen, fietsen en motoren. Muren, pilaren, palen, stoepranden, paaltjes, slagbomen en lage obstakels worden NIET gedetecteerd, en de motorkap kan de grond vlak voor de auto verbergen. Afstanden zijn ruwe schattingen op basis van één camera (grootte en positie van het object) en kunnen sterk afwijken. Stilte of ‘Niets dichtbij gezien’ betekent niet dat de weg vrij is: kijk altijd rond en gebruik je spiegels.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Nabijheid per zijde: links $left, midden $center, rechts $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Fouten worden vastgelegd in een privélogboek op deze iPhone (zonder locaties, contactnamen of telefoonnummers). Het wordt nooit automatisch verzonden; je kunt het delen of wissen via Instellingen › Diagnose.';
}
