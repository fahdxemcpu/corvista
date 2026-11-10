// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Pamatykite daugiau kiekvienoje kelionėje.';

  @override
  String get commonCancel => 'Atšaukti';

  @override
  String get commonDelete => 'Ištrinti';

  @override
  String get commonSave => 'Išsaugoti';

  @override
  String get commonBack => 'Atgal';

  @override
  String get commonClose => 'Uždaryti';

  @override
  String get commonRetry => 'Bandyti dar kartą';

  @override
  String get commonOpenSettings => 'Atidaryti nustatymus';

  @override
  String get commonLoading => 'Įkeliama…';

  @override
  String get commonError => 'Įvyko klaida.';

  @override
  String commonErrorDetail(String message) {
    return 'Įvyko klaida: $message';
  }

  @override
  String get commonOn => 'Įjungta';

  @override
  String get commonOff => 'Išjungta';

  @override
  String get commonRename => 'Pervadinti';

  @override
  String get commonShare => 'Bendrinti';

  @override
  String get commonNotAvailable => 'Nepasiekiama';

  @override
  String get commonTestFootage => 'BANDOMASIS VAIZDAS';

  @override
  String get zoneVeryClose => 'Labai arti';

  @override
  String get zoneClose => 'Arti';

  @override
  String get zoneMedium => 'Vidutiniškai';

  @override
  String get zoneFar => 'Toli';

  @override
  String get zoneUnknown => 'Nežinoma';

  @override
  String get classPerson => 'Žmogus';

  @override
  String get classBicycle => 'Dviratis';

  @override
  String get classMotorcycle => 'Motociklas';

  @override
  String get classCar => 'Transporto priemonė';

  @override
  String get classBus => 'Autobusas';

  @override
  String get classTrafficLight => 'Šviesoforas';

  @override
  String get classStopSign => 'Ženklas „Stop“';

  @override
  String get viewDetection => 'Aptikimas';

  @override
  String get viewVirtual => 'Virtualus';

  @override
  String get viewMap => 'Žemėlapis';

  @override
  String get viewParking => 'Parkavimas';

  @override
  String get viewPerception => 'Suvokimas';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Raudona';

  @override
  String get lightYellow => 'Geltona';

  @override
  String get lightGreen => 'Žalia';

  @override
  String get lightUnknown => 'Nežinoma';

  @override
  String get clipsTitle => 'Įrašai';

  @override
  String get clipsSelect => 'Pasirinkti';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pasirinkta $count įrašų',
      many: 'Pasirinkta $count įrašo',
      few: 'Pasirinkti $count įrašai',
      one: 'Pasirinktas $count įrašas',
      zero: 'Pasirinkite įrašus',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Pasirinkti viską';

  @override
  String get clipsDeselectAll => 'Panaikinti pasirinkimą';

  @override
  String get clipsDeleteSelected => 'Ištrinti pasirinktus';

  @override
  String get clipsGridView => 'Tinklelio rodinys';

  @override
  String get clipsListView => 'Sąrašo rodinys';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ištrinti $count įrašų?',
      many: 'Ištrinti $count įrašo?',
      few: 'Ištrinti $count įrašus?',
      one: 'Ištrinti šį įrašą?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vaizdo įrašai bus negrįžtamai pašalinti iš jūsų iPhone. Šio veiksmo atšaukti negalima.',
      many: 'Vaizdo įrašai bus negrįžtamai pašalinti iš jūsų iPhone. Šio veiksmo atšaukti negalima.',
      few: 'Vaizdo įrašai bus negrįžtamai pašalinti iš jūsų iPhone. Šio veiksmo atšaukti negalima.',
      one: 'Vaizdo įrašas bus negrįžtamai pašalintas iš jūsų iPhone. Šio veiksmo atšaukti negalima.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ištrinta $count įrašų',
      many: 'Ištrinta $count įrašo',
      few: 'Ištrinti $count įrašai',
      one: 'Ištrintas $count įrašas',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Įrašų dar nėra';

  @override
  String get clipsEmptyBody =>
      'Vairuojant Corvista saugo trumpą ciklinį buferį. Palieskite „Išsaugoti įvykį“, kad čia būtų išsaugotos paskutinės įrašo sekundės.';

  @override
  String get clipsLoadError => 'Nepavyko įkelti jūsų įrašų.';

  @override
  String get clipsStorageTitle => 'Saugykla';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Įrašai $clips · Buferis $buffer · Laisva $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count išsaugotų įrašų',
      many: '$count išsaugoto įrašo',
      few: '$count išsaugoti įrašai',
      one: '$count išsaugotas įrašas',
      zero: 'Nėra išsaugotų įrašų',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Jūsų iPhone trūksta vietos. Nauji įvykiai gali būti neišsaugoti.';

  @override
  String get clipsMissingFile => 'Failo nėra';

  @override
  String get clipsEmergencyBadge => 'Smūgis';

  @override
  String clipsUntitled(String date) {
    return 'Įvykis · $date';
  }

  @override
  String get clipsAudio => 'Garsas įrašytas';

  @override
  String get clipsFavorite => 'Mėgstamas';

  @override
  String get clipsUnfavorite => 'Pašalinti iš mėgstamų';

  @override
  String get clipsLocation => 'Vietovė išsaugota';

  @override
  String clipsOpenClip(String title) {
    return 'Atidaryti įrašą „$title“';
  }

  @override
  String get playerNotFoundTitle => 'Įrašas nerastas';

  @override
  String get playerNotFoundBody => 'Šis įrašas galėjo būti ištrintas.';

  @override
  String get playerMissingTitle => 'Vaizdo failo nėra';

  @override
  String get playerMissingBody =>
      'Šio įrašo vaizdo jūsų iPhone nebėra. Galite pašalinti įrašą iš galerijos.';

  @override
  String get playerRemoveEntry => 'Pašalinti įrašą';

  @override
  String get playerLoadError => 'Šio vaizdo įrašo nepavyksta paleisti.';

  @override
  String get playerPlay => 'Leisti';

  @override
  String get playerPause => 'Pristabdyti';

  @override
  String get playerReplay => 'Leisti iš naujo';

  @override
  String get playerRenameTitle => 'Pervadinti įrašą';

  @override
  String get playerRenameHint => 'Įrašo pavadinimas';

  @override
  String get playerRenamed => 'Įrašas pervadintas';

  @override
  String get playerFavorited => 'Pridėta prie mėgstamų';

  @override
  String get playerUnfavorited => 'Pašalinta iš mėgstamų';

  @override
  String get playerShareFailed => 'Nepavyko bendrinti šio įrašo.';

  @override
  String get playerDetails => 'Išsami informacija';

  @override
  String get playerDate => 'Įrašyta';

  @override
  String get playerDuration => 'Trukmė';

  @override
  String get playerResolution => 'Skiriamoji geba';

  @override
  String get playerSize => 'Failo dydis';

  @override
  String get playerAudio => 'Garsas';

  @override
  String get playerAudioYes => 'Įrašytas';

  @override
  String get playerAudioNo => 'Neįrašytas';

  @override
  String get playerReason => 'Išsaugota per';

  @override
  String get playerReasonManual => 'Mygtukas „Išsaugoti įvykį“';

  @override
  String get playerReasonEmergency => 'Galimas smūgio aptikimas';

  @override
  String get playerReasonRecovered => 'Atkurta po pertraukos';

  @override
  String get playerSpeed => 'GPS greitis išsaugant';

  @override
  String get playerLocation => 'Vietovė';

  @override
  String get playerOpenInMaps => 'Atidaryti Žemėlapiuose';

  @override
  String get playerBack => 'Atgal';

  @override
  String get playerMore => 'Daugiau veiksmų';

  @override
  String get clipsFilterLabel => 'Rodyti';

  @override
  String get clipsFilterAll => 'Visi';

  @override
  String get clipsFilterRecordings => 'Įrašymai';

  @override
  String get clipsFilterIncidents => 'Įvykiai';

  @override
  String get clipsFilterEmergency => 'Avarijos';

  @override
  String get clipsFilterFavorites => 'Mėgstami';

  @override
  String get clipsSort => 'Rūšiuoti';

  @override
  String get clipsSortNewest => 'Naujausi pirma';

  @override
  String get clipsSortOldest => 'Seniausi pirma';

  @override
  String get clipsSortLongest => 'Ilgiausi pirma';

  @override
  String get clipsSortLargest => 'Didžiausi pirma';

  @override
  String get clipsToday => 'Šiandien';

  @override
  String get clipsYesterday => 'Vakar';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įrašų',
      many: '$count įrašo',
      few: '$count įrašai',
      one: '$count įrašas',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Šioje kategorijoje įrašų dar nėra.';

  @override
  String get clipsFavoritesEmpty =>
      'Pažymėkite įrašą žvaigždute, kad jis būtų čia ir lengvai pasiekiamas.';

  @override
  String get clipsKindRecording => 'Įrašymas';

  @override
  String get clipsKindIncident => 'Įvykis';

  @override
  String get clipsKindEmergency => 'Avarija';

  @override
  String get clipsKindTest => 'Bandomasis';

  @override
  String clipsTripChip(String time) {
    return 'Kelionė · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Atidaryti kelionę, per kurią įrašytas šis įrašas';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return 'Naudojama $used · laisva $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Įrašai užima $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įrašymų',
      many: '$count įrašymo',
      few: '$count įrašymai',
      one: '$count įrašymas',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įvykių',
      many: '$count įvykio',
      few: '$count įvykiai',
      one: '$count įvykis',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count avarijų',
      many: '$count avarijos',
      few: '$count avarijos',
      one: '$count avarija',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Atlaisvinti vietos';

  @override
  String get clipsStorageLowGentle =>
      'Liko mažiau nei 2 GB laisvos vietos. Kad įrašymas vyktų sklandžiai, atlaisvinkite vietos arba pašalinkite nebereikalingus įrašus.';

  @override
  String get clipsSaveToPhotos => 'Išsaugoti nuotraukose';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įrašų',
      many: '$count įrašo',
      few: '$count įrašai',
      one: '$count įrašas',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ištrinti $count įrašų ($size)?',
      many: 'Ištrinti $count įrašo ($size)?',
      few: 'Ištrinti $count įrašus ($size)?',
      one: 'Ištrinti šį įrašą ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Išsaugoma nuotraukose: $done iš $total…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įrašų išsaugota nuotraukose',
      many: '$count įrašo išsaugota nuotraukose',
      few: '$count įrašai išsaugoti nuotraukose',
      one: 'Išsaugota nuotraukose',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return 'Išsaugota nuotraukose: $saved · nepavyko išsaugoti: $failed';
  }

  @override
  String get clipsPhotosDenied =>
      '„Corvista“ neleidžiama pridėti vaizdo įrašų prie nuotraukų. Leisti galite nustatymuose.';

  @override
  String get clipsPhotosFailed => 'Nepavyko išsaugoti nuotraukose.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įrašų pridėta prie mėgstamų',
      many: '$count įrašo pridėta prie mėgstamų',
      few: '$count įrašai pridėti prie mėgstamų',
      one: 'Pridėta prie mėgstamų',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įrašų pašalinta iš mėgstamų',
      many: '$count įrašo pašalinta iš mėgstamų',
      few: '$count įrašai pašalinti iš mėgstamų',
      one: 'Pašalinta iš mėgstamų',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (apkirptas)';
  }

  @override
  String get playerTrim => 'Apkarpyti';

  @override
  String get playerInfo => 'Informacija';

  @override
  String get playerKind => 'Tipas';

  @override
  String get playerReasonRecording => 'Mygtukas „Įrašyti“';

  @override
  String get trimTitle => 'Apkarpyti įrašą';

  @override
  String get trimHint =>
      'Vilkite rankenėles, kad pasirinktumėte paliekamą dalį. Originalus įrašas nesikeičia.';

  @override
  String get trimStartHandle => 'Apkarpymo pradžia';

  @override
  String get trimEndHandle => 'Apkarpymo pabaiga';

  @override
  String trimSelection(String duration) {
    return 'Pasirinkta: $duration';
  }

  @override
  String get trimSave => 'Išsaugoti kaip naują įrašą';

  @override
  String get trimSaving => 'Išsaugomas apkirptas įrašas…';

  @override
  String get trimSaved => 'Apkirptas įrašas išsaugotas';

  @override
  String get trimOpenNew => 'Atidaryti';

  @override
  String get trimFailed => 'Nepavyko apkarpyti šio įrašo.';

  @override
  String get trimStorageFull =>
      'Neužtenka laisvos vietos apkirptam įrašui išsaugoti.';

  @override
  String get trimPreview => 'Paleisti pasirinktą dalį';

  @override
  String get settingsTitle => 'Nustatymai';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'DI';

  @override
  String get settingsSectionAlerts => 'Įspėjimai';

  @override
  String get settingsSectionAlertCategories => 'Įspėjimų kategorijos';

  @override
  String get settingsSectionRecording => 'Įrašymas';

  @override
  String get settingsSectionDriving => 'Vairavimas';

  @override
  String get settingsSectionPower => 'Energija';

  @override
  String get settingsSectionEmergency => 'Avarija';

  @override
  String get settingsSectionAppearance => 'Išvaizda';

  @override
  String get settingsSectionLanguage => 'Kalba';

  @override
  String get settingsSectionInformation => 'Informacija';

  @override
  String get settingsCameraLens => 'Kameros objektyvas';

  @override
  String get settingsLensWide => 'Standartinis';

  @override
  String get settingsLensUltraWide => 'Itin platus';

  @override
  String get settingsLensTelephoto => 'Teleobjektyvas';

  @override
  String get settingsLensUnavailable => 'Šiame iPhone nepasiekiama';

  @override
  String get settingsStabilization => 'Stabilizavimas';

  @override
  String get settingsStabAuto => 'Automatinis';

  @override
  String get settingsStabOff => 'Išjungta';

  @override
  String get settingsStabStandard => 'Standartinis';

  @override
  String get settingsStabCinematic => 'Kinematografinis';

  @override
  String get settingsOverlayOpacity => 'Sluoksnio nepermatomumas';

  @override
  String get settingsShowFps => 'Rodyti našumo statistiką';

  @override
  String get settingsShowFpsSubtitle =>
      'Kadrų dažnis ir išvedimo trukmė aptikimo rodinyje';

  @override
  String get settingsCameraFooter =>
      'Objektyvo ir stabilizavimo pakeitimai įsigalios kitą kartą paleidus kamerą.';

  @override
  String get settingsAiModel => 'DI modelis';

  @override
  String get settingsConfidence => 'Aptikimo patikimumas';

  @override
  String get settingsTracking => 'Objektų sekimas';

  @override
  String get settingsTrackingSubtitle =>
      'Išlaiko objektus stabilius tarp kadrų';

  @override
  String get settingsShowLabels => 'Rodyti etiketes';

  @override
  String get settingsShowConfidence => 'Rodyti patikimumą';

  @override
  String get settingsSegmentationOpacity => 'Suvokimo kaukės nepermatomumas';

  @override
  String get settingsAiFooter =>
      'Mažesnis patikimumas rodo daugiau objektų, bet ir daugiau klaidingų aptikimų. Aptikimai gali būti netikslūs.';

  @override
  String get settingsVoiceAlerts => 'Balso įspėjimai';

  @override
  String get settingsVoiceLanguage => 'Balso kalba';

  @override
  String get settingsVoiceLanguageAuto => 'Kaip programėlės kalba';

  @override
  String get settingsVoice => 'Balsas';

  @override
  String get settingsVoiceDefault => 'Sistemos numatytasis';

  @override
  String get settingsVoiceQualityEnhanced => 'Pagerintas';

  @override
  String get settingsVoiceQualityPremium => 'Aukšta kokybė';

  @override
  String get settingsNoVoices =>
      'Šiai kalbai neįdiegtas joks balsas. Pridėkite jį iOS nustatymuose › Prieinamumas › Ištarimo turinys.';

  @override
  String get settingsAlertPedestrian => 'Pėstieji';

  @override
  String get settingsAlertCyclist => 'Dviratininkai';

  @override
  String get settingsAlertMotorcycle => 'Motociklai';

  @override
  String get settingsAlertBus => 'Autobusai';

  @override
  String get settingsAlertVehicleClose =>
      'Transporto priemonė priekyje labai arti';

  @override
  String get settingsAlertTrafficLight => 'Šviesoforo pasikeitimai';

  @override
  String get settingsAlertTrafficMoving => 'Priekyje judantis eismas';

  @override
  String get settingsAlertStopSign => 'Ženklai „Stop“';

  @override
  String get settingsSensitivity => 'Jautrumas';

  @override
  String get settingsSensitivityLow => 'Žemas';

  @override
  String get settingsSensitivityMedium => 'Vidutinis';

  @override
  String get settingsSensitivityHigh => 'Aukštas';

  @override
  String get settingsCooldown => 'Kartojimo intervalas';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Balso garsumas';

  @override
  String get settingsQuietMode => 'Tylusis režimas';

  @override
  String get settingsQuietModeSubtitle => 'Tariami tik svarbiausi įspėjimai';

  @override
  String get settingsTestVoice => 'Išbandyti balsą';

  @override
  String get settingsTestVoiceDone => 'Leidžiamas pavyzdinis įspėjimas…';

  @override
  String get settingsParkingBeeps => 'Parkavimo signalai';

  @override
  String get settingsBeepVolume => 'Signalų garsumas';

  @override
  String get settingsAlertsFooter =>
      'Įspėjimai yra tik pagalbinė priemonė. Visada stebėkite kelią – tyla nereiškia, kad kelias laisvas.';

  @override
  String get settingsRecordingProfile => 'Įrašymo kokybė';

  @override
  String get settingsProfileStandard => 'Standartinė · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Įvykių buferis';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds sek.';
  }

  @override
  String get settingsManualMaxLength => 'Didžiausias rankinio įrašymo ilgis';

  @override
  String get settingsManualMaxUnlimited => 'Neribota';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min.';
  }

  @override
  String get settingsRecordAudio => 'Įrašyti garsą';

  @override
  String get settingsRecordAudioSubtitle =>
      'Išsaugotuose įvykiuose bus ir salono garsas';

  @override
  String get settingsMicDenied =>
      'Prieiga prie mikrofono išjungta. Norėdami įrašyti garsą, leiskite ją nustatymuose.';

  @override
  String get settingsWatermark => 'Corvista vandenženklis';

  @override
  String get settingsTimestamp => 'Datos ir laiko žymė';

  @override
  String get settingsSaveLocation => 'Išsaugoti vietovę kartu su įrašais';

  @override
  String get settingsStorage => 'Saugykla ir įrašai';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įrašų',
      many: '$count įrašo',
      few: '$count įrašai',
      one: '$count įrašas',
      zero: 'Nėra įrašų',
    );
    return '$_temp0 · naudojama $used · laisva $free';
  }

  @override
  String get settingsRecordingFooter =>
      'Ciklinis buferis saugomas jūsų iPhone ir nuolat perrašomas. Fone niekas neįrašoma.';

  @override
  String get settingsDefaultView => 'Numatytasis rodinys';

  @override
  String get settingsUnits => 'Vienetai';

  @override
  String get settingsShowCompass => 'Rodyti kompasą';

  @override
  String get settingsHudStyle => 'HUD stilius';

  @override
  String get settingsHudCustomize => 'Tinkinti HUD';

  @override
  String get settingsDrivingSide => 'Eismo pusė';

  @override
  String get settingsDrivingSideAuto => 'Automatinė';

  @override
  String get settingsDrivingSideRight => 'Dešinė';

  @override
  String get settingsDrivingSideLeft => 'Kairė';

  @override
  String get settingsVirtualStyle => 'Virtualaus rodinio stilius';

  @override
  String get settingsVirtualMinimal => 'Minimalistinis';

  @override
  String get settingsVirtualPerspective => 'Perspektyva';

  @override
  String get settingsVirtualHighContrast => 'Didelis kontrastas';

  @override
  String get settingsKeepScreenOn => 'Vairuojant laikyti ekraną įjungtą';

  @override
  String get settingsLiveActivity => 'Tiesioginė veikla';

  @override
  String get settingsLiveActivityDesc =>
      'Rodyti nurodymus pasukti užrakinimo ekrane ir Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Įrašymas pristabdytas, kol Corvista buvo fone';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Pristabdyta';

  @override
  String get liveActivityDashcamOff => 'Kam. išj.';

  @override
  String get liveActivityEnded => 'Navigacija baigta';

  @override
  String get liveActivityEta => 'Atvykimas';

  @override
  String get settingsAutoRecenter => 'Automatiškai centruoti žemėlapį';

  @override
  String get settingsHudStyleClassic => 'Klasikinis';

  @override
  String get settingsHudStyleGrid => 'Tinklelis';

  @override
  String get settingsHudStyleMinimal => 'Minimalistinis';

  @override
  String get settingsHudStylePerformance => 'Našumas';

  @override
  String get settingsHudStyleNavigation => 'Navigacija';

  @override
  String get settingsHudStyleNight => 'Naktis';

  @override
  String get settingsHudStyleHighContrast => 'Didelis kontrastas';

  @override
  String get settingsPowerMode => 'Energijos režimas';

  @override
  String get settingsPowerBalanced => 'Subalansuotas';

  @override
  String get settingsPowerPerformance => 'Našumas';

  @override
  String get settingsPowerSaver => 'Energijos taupymas';

  @override
  String get settingsPowerFooter =>
      'Kai jūsų iPhone įkaista arba senka baterija, Corvista automatiškai sumažina DI dažnį ir vaizdo efektus.';

  @override
  String get settingsThermal => 'Šiluminė būsena';

  @override
  String get settingsThermalNominal => 'Normali';

  @override
  String get settingsThermalFair => 'Šilta';

  @override
  String get settingsThermalSerious => 'Karšta';

  @override
  String get settingsThermalCritical => 'Kritinė';

  @override
  String get settingsBattery => 'Baterija';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Kraunama';
  }

  @override
  String get settingsLowPowerMode =>
      'Įjungtas mažos galios režimas – DI veikia sumažintu dažniu.';

  @override
  String get settingsAiRate => 'Dabartinis DI dažnis';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Smūgio aptikimas';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Įjungta · atgalinė atskaita $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Eksperimentinė funkcija. Nepakeičia pagalbos tarnybų.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistemos';

  @override
  String get settingsThemeDark => 'Tamsi';

  @override
  String get settingsThemeLight => 'Šviesi';

  @override
  String get settingsReduceMotion => 'Sumažinti judesį';

  @override
  String get settingsReduceMotionSubtitle =>
      'Sumažina animacijas visoje programėlėje';

  @override
  String get settingsAppLanguage => 'Programėlės kalba';

  @override
  String get settingsPrivacyPolicy => 'Privatumo politika';

  @override
  String get settingsTerms => 'Naudojimo sąlygos';

  @override
  String get settingsHelp => 'Pagalba';

  @override
  String get settingsSupport => 'Susisiekti su palaikymu';

  @override
  String get settingsLicenses => 'Atvirojo kodo licencijos';

  @override
  String get settingsSupportUnavailable =>
      'Nepavyko atidaryti Pašto. Rašykite adresu support@corvista.app.';

  @override
  String get settingsSafety => 'Saugos informacija';

  @override
  String get settingsDiagnostics => 'Diagnostika';

  @override
  String get settingsVersion => 'Versija';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Tinkinti HUD';

  @override
  String get hudCustomPreview => 'Peržiūra · pavyzdinės reikšmės';

  @override
  String get hudCustomStyle => 'Stilius';

  @override
  String get hudCustomElements => 'Elementai';

  @override
  String get hudCustomSpeed => 'Greitis';

  @override
  String get hudCustomHeading => 'Kryptis ir kompasas';

  @override
  String get hudCustomClock => 'Laikrodis';

  @override
  String get hudCustomBattery => 'Baterija ir temperatūra';

  @override
  String get hudCustomDetections => 'DI būsena ir aptikimai';

  @override
  String get hudCustomWeather => 'Orai';

  @override
  String get hudCustomAppearance => 'Dydis ir nepermatomumas';

  @override
  String get hudCustomSize => 'Dydis';

  @override
  String get hudCustomOpacity => 'Nepermatomumas';

  @override
  String get hudCustomFooter =>
      'Įspėjimai, pavyzdžiui, apie perkaitimą, rodomi visada, net kai elementai paslėpti.';

  @override
  String get hudCustomDescClassic => 'Subalansuotas prietaisų skydelis';

  @override
  String get hudCustomDescGrid => 'Perspektyvinis tinklelis virš kelio';

  @override
  String get hudCustomDescMinimal => 'Tik greitis, nieko daugiau';

  @override
  String get hudCustomDescPerformance =>
      'Greičio lankas su tiesioginiais rodmenimis';

  @override
  String get hudCustomDescNavigation => 'Pirmiausia kitas manevras';

  @override
  String get hudCustomDescNight =>
      'Pritemdytas ir paraudonuotas nakties vairavimui';

  @override
  String get hudCustomDescHighContrast =>
      'Maksimalus įskaitomumas ryškioje saulėje';

  @override
  String get languageTitle => 'Kalba';

  @override
  String get languageSystem => 'Sistemos numatytoji';

  @override
  String get languageSystemSubtitle => 'Naudoti iPhone kalbą';

  @override
  String get languageFooter =>
      'Netrukus bus daugiau kalbų. Balso įspėjimų kalbą galima nustatyti atskirai skiltyje „Įspėjimai“.';

  @override
  String get diagTitle => 'Diagnostika';

  @override
  String get diagPerformance => 'Našumas';

  @override
  String get diagInference => 'Išvedimo trukmė';

  @override
  String get diagDetectHz => 'Aptikimo dažnis';

  @override
  String get diagCameraFps => 'Kameros kadrų dažnis';

  @override
  String get diagMemory => 'Atmintis';

  @override
  String get diagDropped => 'Praleisti kadrai';

  @override
  String get diagSegmentation => 'Segmentavimo trukmė';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Būsena';

  @override
  String get diagSource => 'Šaltinis';

  @override
  String get diagSourceCamera => 'Tiesioginė kamera';

  @override
  String get diagSourceFile => 'Bandomojo vaizdo failas';

  @override
  String get diagResolution => 'Buferio dydis';

  @override
  String get diagLens => 'Objektyvas';

  @override
  String get diagError => 'Paskutinė klaida';

  @override
  String get diagModel => 'DI modelis';

  @override
  String get diagModelLoad => 'Modelio įkėlimo trukmė';

  @override
  String get diagPower => 'Energija';

  @override
  String get diagSegHz => 'Segmentavimo dažnis';

  @override
  String get diagReduced => 'Sumažinti efektai';

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
  String get diagCamIdle => 'Neveikia';

  @override
  String get diagCamStarting => 'Paleidžiama';

  @override
  String get diagCamRunning => 'Veikia';

  @override
  String get diagCamInterrupted => 'Pertraukta';

  @override
  String get diagCamStopped => 'Sustabdyta';

  @override
  String get diagCamUnavailable => 'Nepasiekiama';

  @override
  String get diagCamPermissionDenied => 'Leidimas atmestas';

  @override
  String get diagCamError => 'Klaida';

  @override
  String get diagTestFootage => 'Bandomasis vaizdas';

  @override
  String get diagTestFootageBody =>
      'Atlikite tikrą aptikimą įrenginyje naudodami vietinį vaizdo failą vietoje kameros. Kiekviename rodinyje bus užrašas BANDOMASIS VAIZDAS.';

  @override
  String get diagPathLabel => 'Vaizdo failo kelias';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Naudoti Documents/test_drive.mp4';

  @override
  String get diagRun => 'Paleisti bandomąjį vaizdą';

  @override
  String get diagRunStarted =>
      'Bandomasis vaizdas paleistas. Atidarykite vairavimo rodinį, kad jį pamatytumėte.';

  @override
  String get diagBackToCamera => 'Grįžti į tiesioginę kamerą';

  @override
  String get diagDebugOnly =>
      'Bandomasis vaizdas pasiekiamas tik kūrimo versijose.';

  @override
  String get diagFileMissing => 'Nurodytu keliu failo nėra.';

  @override
  String get emergencySetupTitle => 'Smūgio aptikimas';

  @override
  String get emergencyExperimental => 'Eksperimentinė';

  @override
  String get emergencyIntro =>
      'Vairuojant Corvista gali stebėti galimą stiprų smūgį naudodama jūsų iPhone judesio jutiklius. Jei toks smūgis aptinkamas, prasideda atgalinė atskaita. Jei jos neatšauksite, Corvista pasiūlys paskambinti pagalbos tarnyboms ir išsiųsti žinutę jūsų kontaktams.';

  @override
  String get emergencyDisclaimer1 =>
      'Nepakeičia pagalbos tarnybų ar paties automobilio avarijos aptikimo sistemos.';

  @override
  String get emergencyDisclaimer2 =>
      'Prieš skambinant ar siunčiant žinutę iOS visada paprašo jūsų patvirtinimo.';

  @override
  String get emergencyDisclaimer3 =>
      'Smūgiai gali likti neaptikti, o staigus stabdymas ar duobės gali būti palaikyti smūgiu.';

  @override
  String get emergencyParkedWarning =>
      'Šią sąranką atlikite sustoję. Kol transporto priemonė juda, nustatymai užrakinti.';

  @override
  String get emergencyEnable => 'Įjungti smūgio aptikimą';

  @override
  String get emergencyEnableSubtitle => 'Aktyvu tik vairavimo metu';

  @override
  String get emergencyNeedNumber =>
      'Pirmiausia pridėkite pagalbos telefono numerį.';

  @override
  String get emergencyContacts => 'Pagalbos kontaktai';

  @override
  String get emergencyAddContact => 'Pridėti kontaktą';

  @override
  String get emergencyNoContacts =>
      'Kontaktų dar nėra. Žinutė kontaktams siunčiama tik jums patvirtinus.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Pašalinti $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Įvykus smūgiui, šis asmuo nebebus siūlomas kaip gavėjas.';

  @override
  String get emergencyRemove => 'Pašalinti';

  @override
  String get emergencyContactsError => 'Nepavyko įkelti kontaktų.';

  @override
  String get emergencyNumber => 'Pagalbos telefono numeris';

  @override
  String get emergencyNumberHint => 'pvz., 112 arba 911';

  @override
  String get emergencyMessage => 'Žinutės šablonas';

  @override
  String get emergencyMessageDefault =>
      'Galbūt patekau į eismo įvykį. Šią žinutę parengė Corvista, joje nurodyta paskutinė žinoma mano vieta, jei ji pasiekiama.';

  @override
  String get emergencyMessageHint =>
      'Palikite tuščią, kad būtų naudojama numatytoji žinutė.';

  @override
  String get emergencyCountdown => 'Atgalinės atskaitos trukmė';

  @override
  String get emergencyVoiceCancel => 'Atšaukti balsu';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Atgalinės atskaitos metu sakykite „man viskas gerai“ arba „atšaukti“. Kai įmanoma, naudojamas įrenginyje veikiantis kalbos atpažinimas.';

  @override
  String get emergencyVoicePermDenied =>
      'Norint atšaukti balsu, reikalinga prieiga prie mikrofono ir kalbos atpažinimo.';

  @override
  String get emergencyAutoSave => 'Automatiškai išsaugoti įvykio įrašą';

  @override
  String get emergencyTest => 'Išbandyti atgalinę atskaitą (be skambučio)';

  @override
  String get emergencyTestBody =>
      'Paleidžiamas imituojamas smūgis, kad pamatytumėte atgalinę atskaitą. Bandomuoju režimu niekada neskambinama ir nesiunčiamos žinutės.';

  @override
  String get emergencyNotSet => 'Nenustatyta';

  @override
  String get emergencyAlertHeadline => 'Aptiktas galimas stiprus smūgis.';

  @override
  String get emergencyAlertSubtitle => 'Ar jūs gerai?';

  @override
  String get emergencyAlertCancel => 'Man viskas gerai – atšaukti';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Liko $seconds sekundžių',
      many: 'Liko $seconds sekundės',
      few: 'Liko $seconds sekundės',
      one: 'Liko $seconds sekundė',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Klausoma – norėdami atšaukti, sakykite „man viskas gerai“';

  @override
  String emergencyAlertHeard(String text) {
    return 'Išgirsta: „$text“';
  }

  @override
  String get emergencyAlertEscalated =>
      'Atsakymo nėra. Pasirinkite, ką daryti:';

  @override
  String get emergencyAlertCall => 'Skambinti pagalbos tarnyboms';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Bus skambinama $number. iOS paprašys jūsų patvirtinti.';
  }

  @override
  String get emergencyAlertMessage => 'Siųsti žinutę kontaktams';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Atidaroma parengta žinutė. Jūs pasirenkate, ar ją siųsti.';

  @override
  String get emergencyAlertTestMode =>
      'Bandomasis režimas – skambutis nebus atliekamas';

  @override
  String get emergencyAlertTestBadge => 'BANDYMAS';

  @override
  String get emergencyAlertClose => 'Man viskas gerai – uždaryti';

  @override
  String get emergencyMsgSent => 'Žinutė išsiųsta.';

  @override
  String get emergencyMsgCancelled => 'Žinutė neišsiųsta.';

  @override
  String get emergencyMsgFailed => 'Nepavyko išsiųsti žinutės.';

  @override
  String get emergencyMsgUnavailable =>
      'Šiame įrenginyje žinučių siuntimas nepasiekiamas.';

  @override
  String emergencyCallFailed(String number) {
    return 'Nepavyko pradėti skambučio. Patys paskambinkite $number.';
  }

  @override
  String get modelsTitle => 'DI modeliai';

  @override
  String get modelsIntro =>
      'Visi modeliai yra įtraukti į programėlę ir veikia tik jūsų iPhone. Kameros vaizdas niekada nepalieka įrenginio.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Tiesiogiai: $ms ms vienam kadrui · $hz aptikimų per sek.';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Įkelta per $ms ms';
  }

  @override
  String get modelsEfficientName => 'Efektyvus';

  @override
  String get modelsEfficientDesc =>
      'Greitas, kompaktiškas aptikimo modelis, pritaikytas ilgoms kelionėms – mažai kaista ir taupo bateriją.';

  @override
  String get modelsEnhancedName => 'Patobulintas';

  @override
  String get modelsEnhancedDesc =>
      'Didesnis aptikimo modelis, randantis mažesnius ir tolimesnius objektus, bet naudojantis daugiau energijos.';

  @override
  String get modelsSegmentationName => 'Segmentavimas';

  @override
  String get modelsSegmentationDesc =>
      'Jungia greitą aptikimą su kelio paviršiaus ir objektų kaukėmis suvokimo rodiniui.';

  @override
  String get modelsNoneName => 'DI pristabdytas';

  @override
  String get modelsNoneDesc =>
      'Kamera ir įrašymas veikia toliau be objektų aptikimo. Mažiausias energijos suvartojimas.';

  @override
  String get modelsGenericDesc =>
      'Įrenginyje veikiantis objektų aptikimo modelis.';

  @override
  String get modelsFunctionDetection =>
      'Aptinka transporto priemones, žmones, dviračius, motociklus, autobusus, šviesoforus ir ženklus „Stop“';

  @override
  String get modelsFunctionSegmentation =>
      'Prideda kelio paviršiaus ir objektų kaukes';

  @override
  String get modelsFunctionNone =>
      'Be aptikimo; tik vaizdo registratoriaus įrašymas';

  @override
  String get modelsSize => 'Dydis';

  @override
  String get modelsInput => 'Įvestis';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Veikia su';

  @override
  String get modelsStatusInstalled => 'Įdiegta (įtraukta)';

  @override
  String get modelsStatusNotInstalled => 'Neįdiegta';

  @override
  String get modelsSelected => 'Pasirinkta';

  @override
  String get modelsUse => 'Naudoti šį modelį';

  @override
  String get modelsSwitching => 'Įkeliamas modelis…';

  @override
  String modelsSwitched(String name) {
    return '$name dabar aktyvus';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Išmatuota šiame įrenginyje: vidutiniškai $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Šiame įrenginyje neišmatuota';

  @override
  String get modelsBenchmarkRun => 'Paleisti našumo testą';

  @override
  String get modelsBenchmarkRunning => 'Atliekamas našumo testas…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Pasirinkite šį modelį, kad atliktumėte jo našumo testą.';

  @override
  String get modelsBenchmarkDone => 'Našumo testas baigtas';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Našumo testas nepavyko: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Paskutinį kartą atnaujinta: $date';
  }

  @override
  String get safetyTitle => 'Saugos informacija';

  @override
  String get safetyIntro =>
      '„Corvista“ yra pagalbinė priemonė vairuotojo dėmesiui. Ji nevaldo jūsų transporto priemonės ir negali pakeisti jūsų dėmesio, sprendimų ar automobilio saugos sistemų.';

  @override
  String get safetyBeforeTitle => 'Prieš važiuojant';

  @override
  String get safetyBefore1 =>
      'Saugiai pritvirtinkite iPhone teisėtoje vietoje, kuri neuždengtų matymo lauko, oro pagalvių ar valdiklių.';

  @override
  String get safetyBefore2 =>
      'Sąranką, rodinio pasirinkimą ir tikslo nustatymą atlikite sustoję.';

  @override
  String get safetyBefore3 =>
      'Ilgoms kelionėms prijunkite kroviklį ir, jei įmanoma, saugokite telefoną nuo tiesioginių saulės spindulių.';

  @override
  String get safetyWhileTitle => 'Vairuojant';

  @override
  String get safetyWhile1 =>
      'Žiūrėkite į kelią. Dideliais ekrano valdikliais naudokitės tik tada, kai tai saugu ir teisėta.';

  @override
  String get safetyWhile2 =>
      'Įspėjimai yra tik pagalba, o ne perspėjimai, kuriais galima pasikliauti. Tyla niekada nereiškia, kad kelias laisvas.';

  @override
  String get safetyWhile3 =>
      'Jei kas nors nesutampa, vadovaukitės eismo taisyklėmis, signalais ir ženklais, o ne programėle.';

  @override
  String get safetyLimitsTitle => 'Apribojimai';

  @override
  String get safetyLimits1 =>
      'Vienos telefono kamera mato tik tai, kas yra priešais. Objektai už jos matymo lauko, užstoti arba labai arti neaptinkami.';

  @override
  String get safetyLimits2 =>
      'Aptikimai gali būti praleisti, pavėluoti ar klaidingi, ypač naktį, per lietų, rūką, akinantį atspindį ar nešvarų priekinį stiklą.';

  @override
  String get safetyLimits3 =>
      'Atpažįstamos tik palaikomos kategorijos: transporto priemonės, autobusai, motociklai, dviračiai, žmonės, šviesoforai ir ženklai „Stop“. Juostų užuominos virtualiame rodinyje yra stilizuotos, o ne aptiktos juostos.';

  @override
  String get safetyLimits4 =>
      'Artumas rodomas apytikslėmis zonomis (Labai arti, Arti, Vidutiniškai, Toli), o ne išmatuotais atstumais. Parkavimo rodinys nepakeičia parkavimo jutiklių.';

  @override
  String get safetyHeatTitle => 'Šiluma ir baterija';

  @override
  String get safetyHeat1 =>
      'Nuolat naudojant kamerą ir DI, iPhone įkaista. Kai įrenginys įkaista, Corvista sumažina analizės dažnį ir parodo įspėjimą; jei iOS perkaista, kamera gali sustoti.';

  @override
  String get safetyEmergencyTitle => 'Avarinė funkcija';

  @override
  String get safetyEmergency1 =>
      'Galimo smūgio aptikimas yra eksperimentinis. Jis gali nepastebėti tikrų avarijų ir gali būti suaktyvintas kitų įvykių.';

  @override
  String get safetyEmergency2 =>
      'Ji niekada nesusisiekia su niekuo slapta: iOS visada paprašo patvirtinti skambutį ar žinutę. Ji nepakeičia jūsų paties skambučio pagalbos tarnyboms.';

  @override
  String get privacyTitle => 'Privatumas';

  @override
  String get privacyIntro =>
      '„Corvista“ sukurta taip, kad jūsų vairavimo duomenys liktų jūsų iPhone. „Corvista“ paskyros nėra, o „Corvista“ neturi savo serverių.';

  @override
  String get privacyCameraTitle => 'Kamera ir DI';

  @override
  String get privacyCamera1 =>
      'Objektų aptikimas, sekimas ir segmentavimas vyksta tik jūsų iPhone. Kameros kadrai niekada neįkeliami.';

  @override
  String get privacyCamera2 =>
      'Kamera veikia tik tada, kai Corvista atidaryta ekrane. Programėlei persikėlus į foną, ji pristabdoma – paslėpto įrašymo fone nėra.';

  @override
  String get privacyRecordingsTitle => 'Įrašai';

  @override
  String get privacyRecordings1 =>
      'Ciklinis buferis yra laikinas ir nuolat perrašomas. Vaizdas išsaugomas tik palietus „Išsaugoti įvykį“ arba, jei įjungsite, po galimo smūgio.';

  @override
  String get privacyRecordings2 =>
      'Išsaugoti įrašai lieka privačioje „Corvista“ saugykloje jūsų iPhone. Jie palieka įrenginį tik tada, kai pasirenkate „Bendrinti“. Ištrynus programėlę, jie taip pat ištrinami.';

  @override
  String get privacyRecordings3 =>
      'Garsas įrašomas tik tada, jei jį įjungsite ir suteiksite prieigą prie mikrofono.';

  @override
  String get privacyLocationTitle => 'Vietovė';

  @override
  String get privacyLocation1 =>
      'Vietovė naudojama, kol programėlė atidaryta, greičiui, žemėlapiui, maršrutams ir orams. Jei įjungta „Išsaugoti vietovę“, išsaugojimo metu buvusi padėtis saugoma su įrašu jūsų įrenginyje.';

  @override
  String get privacyNetworkTitle => 'Tinklo paslaugos';

  @override
  String get privacyNetwork1 =>
      'Apple Maps – žemėlapio rodymas, vietų paieška ir maršrutai. Jūsų paieškos tekstas ir apytikslė vietovė siunčiami „Apple“.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) – dabartiniai ir valandiniai orai jūsų vietovėje.';

  @override
  String get privacyNetwork4 =>
      '„Corvista“ neturi reklamos, trečiųjų šalių analizės ar sekimo priemonių.';

  @override
  String get privacyEmergencyTitle => 'Pagalbos kontaktai';

  @override
  String get privacyEmergency1 =>
      'Pasirinkti kontaktai saugomi šio įrenginio iOS raktų pakabuke. Kai įmanoma, atšaukimui balsu naudojamas įrenginyje veikiantis kalbos atpažinimas. Skambučiai ir žinutės siunčiami tik jums patvirtinus iOS.';

  @override
  String get privacyControlsTitle => 'Jūsų valdymas';

  @override
  String get privacyControls1 =>
      'Įrašus bet kada galite ištrinti skiltyje „Įrašai“, o prieigą prie kameros, mikrofono, vietovės ir kalbos galite keisti ar atšaukti iOS nustatymuose.';

  @override
  String get termsTitle => 'Naudojimo sąlygos';

  @override
  String get termsIntro =>
      'Naudodamiesi „Corvista“ sutinkate su šiomis sąlygomis. Taip pat taikoma standartinė „Apple“ licencijuotos programos galutinio vartotojo licencijos sutartis.';

  @override
  String get termsUseTitle => '„Corvista“ naudojimas';

  @override
  String get termsUse1 =>
      '„Corvista“ yra pagalbinė priemonė vairuotojo dėmesiui ir vaizdo registratoriaus funkcijai. Visada pats visiškai atsakote už saugų ir teisėtą vairavimą.';

  @override
  String get termsUse2 =>
      'Vairuodami nesinaudokite programėle taip, kad blaškytumėtės. Įrenginį pritvirtinkite saugiai ir teisėtai.';

  @override
  String get termsAccuracyTitle => 'Tikslumas negarantuojamas';

  @override
  String get termsAccuracy1 =>
      'Aptikimai, zonos, įspėjimai, žemėlapio žymos, maršrutai ir orai gali būti neišsamūs, pavėluoti ar klaidingi. „Corvista“ nevaldo jūsų transporto priemonės.';

  @override
  String get termsAccuracy2 =>
      'Avarinė funkcija yra eksperimentinė – ji gali neaptikti smūgio arba suveikti klaidingai.';

  @override
  String get termsRecordingTitle => 'Įrašymo įstatymai';

  @override
  String get termsRecording1 =>
      'Įstatymai dėl vaizdo registratorių, garso įrašymo ir žmonių filmavimo skiriasi pagal šalį ir regioną. Atsakote už jų laikymąsi, įskaitant dalijantis įrašais.';

  @override
  String get termsLiabilityTitle => 'Atsakomybė';

  @override
  String get termsLiability1 =>
      'Programėlė teikiama „tokia, kokia yra“. Kiek leidžia įstatymai, kūrėjas neatsako už avarijas, nuostolius, baudas ar žalą, atsiradusią naudojantis programėle ar pasikliaujant jos pateikiama informacija.';

  @override
  String get termsChangesTitle => 'Pakeitimai';

  @override
  String get termsChanges1 =>
      'Šios sąlygos gali būti atnaujintos kartu su naujomis programėlės versijomis. Toliau naudodamiesi po atnaujinimo, sutinkate su pakeistomis sąlygomis.';

  @override
  String get helpTitle => 'Pagalba';

  @override
  String get helpIntro =>
      'Atsakymai į dažniausius klausimus. Saugos nurodymų ieškokite skiltyje „Saugos informacija“.';

  @override
  String get helpQSave => 'Kaip išsaugoti įvykio vaizdą?';

  @override
  String get helpASaveBuffer =>
      'Palieskite didelį mygtuką „Išsaugoti įvykį“ vairavimo rodinyje. „Corvista“ į skiltį „Įrašai“ išsaugo paskutines 20 arba 30 sekundžių iš nuolat atnaujinamos atmintinės (pasirenkama Nustatymai › Įrašymas).';

  @override
  String get helpQWhere => 'Kur saugomi mano įrašai?';

  @override
  String get helpAWhere =>
      'Privačioje „Corvista“ saugykloje jūsų iPhone. Jie niekada neįkeliami. Naudokite grotuvo mygtuką „Bendrinti“, kad išsiųstumėte ar eksportuotumėte įrašą.';

  @override
  String get helpQZones => 'Kokios tikslios artumo zonos?';

  @override
  String get helpAZones =>
      'Zonos yra apytiksliai vienos kameros įvertinimai pagal tipinius objektų dydžius. Laikykite jas apytikslėmis užuominomis, o ne atstumais.';

  @override
  String get helpQSlow => 'Kodėl aptikimas sulėtėja?';

  @override
  String get helpASlow =>
      'Kai jūsų iPhone įkaista, senka baterija arba įjungtas mažos galios režimas, Corvista sumažina analizės dažnį, kad apsaugotų įrenginį. Energijos režimą galite pakeisti nustatymuose.';

  @override
  String get helpQMap => 'Neveikia žemėlapis, paieška ar orai.';

  @override
  String get helpAMap =>
      'Šioms funkcijoms reikia interneto ryšio ir prieigos prie vietovės. Patikrinkite ryšį ir iOS nustatymuose leiskite „Corvista“ naudoti vietovę.';

  @override
  String get helpQSimulator => 'Kamera rodoma kaip nepasiekiama.';

  @override
  String get helpASimulator =>
      'Įsitikinkite, kad iOS nustatymuose leista naudoti kamerą ir kad jos nenaudoja kita programėlė. iOS simuliatoriuje kameros nėra – galima naudoti vietinį bandomąjį vaizdo įrašą.';

  @override
  String get emergencyMsgNoContacts =>
      'Pirmiausia pridėkite pagalbos kontaktą.';

  @override
  String get cameraStarting => 'Paleidžiama kamera…';

  @override
  String get cameraInterrupted => 'Kamera pristabdyta';

  @override
  String get cameraInterruptedBody =>
      'iOS pristabdė kamerą, pavyzdžiui, skambučio metu arba kai ją naudoja kita programėlė. Ji bus atnaujinta automatiškai.';

  @override
  String get cameraUnavailable => 'Kamera nepasiekiama';

  @override
  String get cameraUnavailableBody =>
      'Šiame įrenginyje nėra prieinamos kameros. Aptikimui, įrašymui ir parkavimo rodiniams reikalinga galinė kamera.';

  @override
  String get cameraRunTestFootage => 'Paleisti bandomąjį vaizdą';

  @override
  String get cameraPermissionDenied => 'Prieiga prie kameros išjungta';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista kamera reikalinga aptikimui, vaizdo registratoriaus įrašymui ir parkavimo rodiniams. Įjunkite prieigą prie kameros nustatymuose.';

  @override
  String get cameraError => 'Kameros klaida';

  @override
  String get cameraStopped => 'Kamera sustabdyta';

  @override
  String get cameraStart => 'Paleisti kamerą';

  @override
  String get cameraFocusHint => 'Palieskite, kad sufokusuotumėte';

  @override
  String get cameraPreviewLabel =>
      'Tiesioginis kameros vaizdas su aptiktais objektais';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · DI $hz Hz · $ms ms · praleista $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Greitis $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Nėra GPS greičio';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Kryptis $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Vaizdo registratoriaus buferio įrašymas, sukaupta $seconds iš $target sekundžių';
  }

  @override
  String get hudRecIdle => 'REC išjungta';

  @override
  String get hudRecSaving => 'Išsaugoma…';

  @override
  String get hudRecError => 'REC klaida';

  @override
  String get hudAiPaused => 'DI pristabdytas';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objektų',
      many: '$count objekto',
      few: '$count objektai',
      one: '$count objektas',
      zero: 'Nėra objektų',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'aptikta $count objektų',
      many: 'aptikta $count objekto',
      few: 'aptikti $count objektai',
      one: 'aptiktas $count objektas',
      zero: 'objektų neaptikta',
    );
    return 'DI modelis $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Karšta – DI sulėtintas';

  @override
  String get hudThermalCritical => 'Per karšta – DI pristabdytas';

  @override
  String hudBatteryLow(String percent) {
    return 'Baterija $percent';
  }

  @override
  String get hudLowPower => 'Mažos galios režimas';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Orai $temperature, $condition. Palieskite, kad pamatytumėte išsamiau.';
  }

  @override
  String get hudNoGuidance =>
      'Žemėlapio rodinyje ieškokite tikslo, kad čia matytumėte nurodymus pasukti.';

  @override
  String get navArrived => 'Atvykote';

  @override
  String get navRerouting => 'Perskaičiuojamas maršrutas…';

  @override
  String get navSearchHint => 'Ieškoti tikslo';

  @override
  String get navSearchFieldHint => 'Adresas, vieta ar įmonė';

  @override
  String get navNoResults => 'Atitinkančių vietų nėra';

  @override
  String get navSearching => 'Ieškoma…';

  @override
  String get navSearchStartTyping =>
      'Įveskite adresą ar vietos pavadinimą. Rezultatai gaunami iš Apple Maps, todėl reikia interneto ryšio.';

  @override
  String get navErrorUnavailable =>
      'Paieška ir maršrutai nepasiekiami – patikrinkite interneto ryšį.';

  @override
  String get navErrorNoLocation =>
      'Laukiama vietovės, kad būtų galima planuoti maršrutą.';

  @override
  String get navErrorPermission =>
      'Prieiga prie vietovės išjungta, todėl maršrutai negali prasidėti nuo jūsų buvimo vietos.';

  @override
  String navErrorGeneric(String code) {
    return 'Nepavyko įkelti maršrutų ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Maršrutai į $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Atvykimas $time';
  }

  @override
  String get navStart => 'Pradėti';

  @override
  String get navEnd => 'Baigti';

  @override
  String get navEndLabel => 'Baigti navigaciją';

  @override
  String navRemaining(String distance, String duration) {
    return 'Liko $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Pranešimas: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min.',
      many: '$minutes min.',
      few: '$minutes min.',
      one: '$minutes min.',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours val. $minutes min.';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Maršrutas $index: $name';
  }

  @override
  String get weatherTitle => 'Orai';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Jaučiama kaip $temperature';
  }

  @override
  String get weatherPrecipitation => 'Krituliai';

  @override
  String get weatherWind => 'Vėjas';

  @override
  String get weatherVisibility => 'Matomumas';

  @override
  String get weatherHumidity => 'Drėgmė';

  @override
  String get weatherHourly => 'Artimiausios valandos';

  @override
  String weatherAsOf(String time) {
    return 'Atnaujinta $time';
  }

  @override
  String get weatherRefresh => 'Atnaujinti orus';

  @override
  String get weatherUnavailable => 'Orų informacija šiuo metu nepasiekiama.';

  @override
  String get weatherNoLocation => 'Orams reikalinga jūsų vietovė.';

  @override
  String get weatherLegal => 'Duomenų šaltiniai ir teisinė informacija';

  @override
  String weatherProvidedBy(String service) {
    return 'Orų duomenys: $service';
  }

  @override
  String get weatherNow => 'Dabar';

  @override
  String get virtualEmpty => 'Palaikomų objektų neaptikta';

  @override
  String get virtualEmptyCameraOff =>
      'Virtualiam rodiniui reikalinga tiesioginė kamera.';

  @override
  String get virtualLaneDisclaimer =>
      'Juostų linijos yra iliustracinės, jos neaptinkamos.';

  @override
  String virtualNearest(String zone) {
    return 'Artimiausias: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtuali kelio scena: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'DI $status';
  }

  @override
  String get virtualStatusLive => 'veikia';

  @override
  String get virtualStatusPaused => 'pristabdytas';

  @override
  String get virtualStatusCameraOff => 'Kamera išjungta';

  @override
  String get virtualStatusTestFootage => 'Bandomasis vaizdas';

  @override
  String get virtualEmptyHint =>
      'Aptikti automobiliai, žmonės, dviračiai, šviesoforai ir ženklai „Stop“ bus rodomi čia.';

  @override
  String get mapRecenter => 'Centruoti';

  @override
  String get mapZoomIn => 'Priartinti';

  @override
  String get mapZoomOut => 'Nutolinti';

  @override
  String get mapUnsupported => 'Interaktyvus žemėlapis pasiekiamas tik iPhone.';

  @override
  String get mapObjectsApprox => 'Objektų žymos rodo apytiksles padėtis.';

  @override
  String get mapWeatherUnavailable => 'Orų informacijos nėra';

  @override
  String get navErrorNoRoute => 'Nerasta maršruto į šį tikslą.';

  @override
  String get navDismiss => 'Atmesti';

  @override
  String get navGo => 'Vykti';

  @override
  String get navFastest => 'Greičiausias';

  @override
  String get navThen => 'Tada';

  @override
  String get navRecents => 'Naujausi';

  @override
  String get navClearRecents => 'Išvalyti';

  @override
  String get navSearchSubmitHint =>
      'Paspauskite „Ieškoti“, kad pamatytumėte visas atitinkančias vietas';

  @override
  String get navPlaces => 'Vietos';

  @override
  String get navEtaLabel => 'atvykimas';

  @override
  String get navTimeLeftLabel => 'liko';

  @override
  String get navOverview => 'Apžvalga';

  @override
  String get navMute => 'Išjungti balsą';

  @override
  String get navUnmute => 'Įjungti balsą';

  @override
  String get navEndConfirm => 'Baigti navigaciją?';

  @override
  String navEndConfirmBody(String place) {
    return 'Nurodymai į $place bus nutraukti.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Atvykote į $place';
  }

  @override
  String get navDone => 'Atlikta';

  @override
  String get navWeakGps => 'Silpnas GPS signalas';

  @override
  String get navLocationOff =>
      'Vietovės nustatymas išjungtas. Įjunkite jį, kad galėtumėte planuoti maršrutus ir naviguoti.';

  @override
  String get navVoiceGuidance => 'Balso nurodymai';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Po $distance $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, o tada $second';
  }

  @override
  String get navSpeakRerouting => 'Perskaičiuojamas maršrutas';

  @override
  String get navSpeakArrived => 'Atvykote';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metrų',
      many: '$count metro',
      few: '$count metrai',
      one: '$count metras',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value km',
      many: '$value km',
      few: '$value km',
      one: '1 kilometras',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pėdų',
      many: '$count pėdos',
      few: '$count pėdos',
      one: '$count pėda',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jardų',
      many: '$count jardo',
      few: '$count jardai',
      one: '$count jardas',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Tęskite $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Šioje srityje šiai kelionei nurodymai nepasiekiami. Pabandykite kitą tikslą.';

  @override
  String navContinueFor(String distance) {
    return 'Tęskite $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value myl.',
      many: '$value myl.',
      few: '$value myl.',
      one: '1 mylia',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Artimiausias: $object · $zone';
  }

  @override
  String get parkingNothing => 'Vaizde nieko neaptikta';

  @override
  String get parkingBeeps => 'Artumo signalai';

  @override
  String get parkingVolume => 'Signalų garsumas';

  @override
  String get parkingLimitations =>
      'Viena kamera, ne 360°. Objektai už kameros matymo lauko neaptinkami. Nepakeičia parkavimo jutiklių; įvertinimai gali būti klaidingi, o tyla nereiškia, kad aplinka laisva.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Artumo rodinys iš viršaus. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Originalas';

  @override
  String get perceptionModeBoxes => 'Rėmeliai';

  @override
  String get perceptionModeMasks => 'Objektų kaukės';

  @override
  String get perceptionModeRoad => 'Kelio paviršius';

  @override
  String get perceptionModeCombined => 'Sujungta';

  @override
  String get perceptionOpacity => 'Kaukės nepermatomumas';

  @override
  String get perceptionDisclaimer =>
      'Kelio paviršiaus kaukė yra apytikslis vaizdo sluoksnis. Ji nerodo važiuojamosios dalies ar juostų.';

  @override
  String get perceptionNeedsModel =>
      'Pasirinkite segmentavimo modelį, kad pamatytumėte kaukes.';

  @override
  String get perceptionChooseModel => 'Pasirinkti modelį';

  @override
  String get perceptionWaiting => 'Laukiama pirmo segmentavimo kadro…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Rėmeliai';

  @override
  String get perceptionShortObjects => 'Objektai';

  @override
  String get perceptionShortRoad => 'Kelias';

  @override
  String get perceptionShortAll => 'Visi';

  @override
  String get perceptionModesLabel => 'Suvokimo sluoksniai';

  @override
  String get perceptionStatusWarmingUp => 'Ruošiama…';

  @override
  String get perceptionStatusLoadingModel => 'Įkeliamas modelis…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Kaukės pristabdytos';

  @override
  String get perceptionLegend => 'Kaukių legenda';

  @override
  String get perceptionUnavailable => 'Kaukės nepasiekiamos';

  @override
  String get driveSave => 'Išsaugoti';

  @override
  String get driveSaveIncident => 'Išsaugoti įvykį';

  @override
  String driveSaveHint(int seconds) {
    return 'Išsaugo paskutines $seconds sekundžių vaizdo registratoriaus įrašo';
  }

  @override
  String get driveSaving => 'Išsaugomas įvykis…';

  @override
  String hudRecManualLabel(String time) {
    return 'Įrašoma, $time';
  }

  @override
  String get driveRecord => 'Įrašyti';

  @override
  String get driveRecordStartA11y => 'Pradėti įrašymą';

  @override
  String driveRecordStopA11y(String time) {
    return 'Sustabdyti įrašymą, įrašyta $time';
  }

  @override
  String get driveRecordHint =>
      'Įrašo nepertraukiamai, kol sustabdysite, įskaitant ankstesnes 5 sekundes';

  @override
  String get driveRecordFailed => 'Nepavyko pradėti įrašymo';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Įrašymas išsaugotas · $count dalių',
      many: 'Įrašymas išsaugotas · $count dalies',
      few: 'Įrašymas išsaugotas · $count dalys',
      one: 'Įrašymas išsaugotas',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Įrašymas sustabdytas: beveik pilna atmintis',
      'max_duration': 'Įrašymas sustabdytas: pasiektas didžiausias ilgis',
      'camera_stopped': 'Įrašymas sustabdytas kartu su kamera',
      'background': 'Įrašymas sustabdytas: programa pateko į foną',
      'thermal': 'Įrašymas sustabdytas: telefonas per karštas',
      'other': 'Įrašymas sustabdytas',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Įvykis išsaugotas · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Peržiūrėti';

  @override
  String get driveSaveFailed => 'Nepavyko išsaugoti įvykio.';

  @override
  String get driveSaveNotRunning =>
      'Įrašymas dar nepradėtas – palaukite, kol bus paleista kamera, ir bandykite dar kartą.';

  @override
  String get driveSaveTestFootage =>
      'Bandomasis vaizdas neįrašomas. Įvykių išsaugojimas veikia su tiesiogine kamera.';

  @override
  String get driveSaveStorageFull =>
      'Jūsų iPhone pritrūko vietos. Atlaisvinkite vietos arba ištrinkite senesnius įrašus.';

  @override
  String get driveSaveIoError => 'Nepavyko įrašyti įrašo į saugyklą.';

  @override
  String get driveClips => 'Įrašai';

  @override
  String get driveSettings => 'Nustatymai';

  @override
  String get driveViewSwitcher => 'Vairavimo rodiniai';

  @override
  String get driveLocationDenied =>
      'Vietovės nustatymas išjungtas – greitis, žemėlapiai ir maršrutai nepasiekiami.';

  @override
  String get driveCameraDenied =>
      'Prieiga prie kameros išjungta – aptikimas ir įrašymas nepasiekiami.';

  @override
  String get driveRecorderFallback =>
      'Įrašoma be garso: prieiga prie mikrofono išjungta.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Įrašymo nustatymai pakoreguoti: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Jūsų iPhone karštas. DI veikia lėčiau, kad atvėstų – saugokite jį nuo tiesioginių saulės spindulių ir laikykite prie ventiliacijos angos.';

  @override
  String get drivePowerThermalCritical =>
      'Jūsų iPhone per karštas. DI aptikimas pristabdytas, kol atvės; įrašymas tęsiamas, jei įmanoma.';

  @override
  String get drivePowerLowPower =>
      'Įjungtas mažos galios režimas – DI veikia sumažintu dažniu.';

  @override
  String get drivePowerBatteryLow =>
      'Baterija senka – vairuodami prijunkite iPhone prie maitinimo.';

  @override
  String get onboardingTitle1 => 'Pamatykite daugiau kiekvienoje kelionėje.';

  @override
  String get onboardingBody1 =>
      'Paverskite savo iPhone išmaniuoju vaizdo registratoriumi ir vairavimo palydovu.';

  @override
  String get onboardingTitle2 => 'Išmanumas kiekviename kadre.';

  @override
  String get onboardingBody2 =>
      'Atpažinkite palaikomas transporto priemones, žmones, dviračius ir kelio signalus tiesiogiai savo iPhone.';

  @override
  String get onboardingTitle3 => 'Vienas kelias. Keli požiūriai.';

  @override
  String get onboardingBody3 =>
      'Perjunkite tarp tiesioginio aptikimo, virtualių vairavimo rodinių, interaktyvių žemėlapių ir parkavimo vizualizacijos.';

  @override
  String get onboardingTitle4 => 'Išsaugokite svarbius akimirkas.';

  @override
  String get onboardingBody4 =>
      'Išsaugokite naujausius vaizdo registratoriaus įrašus, peržiūrėkite įvykius ir dalykitės įrašais.';

  @override
  String get onboardingTitle5 => 'Sauga ir privatumas';

  @override
  String get onboardingSafety1 =>
      '„Corvista“ yra pagalbinė vairavimo priemonė. Žiūrėkite į kelią.';

  @override
  String get onboardingSafety2 =>
      'Ji nevaldo jūsų transporto priemonės ir nepakeičia jūsų sprendimų.';

  @override
  String get onboardingSafety3 =>
      'Aptikimai ir įvertinimai gali būti netikslūs arba praleisti.';

  @override
  String get onboardingSafety4 =>
      'Kameros vaizdas apdorojamas jūsų iPhone – vaizdo įrašas neįkeliamas.';

  @override
  String get onboardingSafety5 =>
      'Žemėlapiams, paieškai, maršrutams ir orams reikalingas interneto ryšys.';

  @override
  String get onboardingSafety6 =>
      'Saugiai pritvirtinkite iPhone, kad jis neuždengtų matymo lauko.';

  @override
  String get onboardingSafety7 => 'Sąranką atlikite prieš pradėdami vairuoti.';

  @override
  String get onboardingAcknowledge =>
      'Suprantu, kad „Corvista“ yra tik pagalbinė priemonė ir kad už saugų vairavimą atsakau pats.';

  @override
  String get onboardingReadSafety => 'Skaityti visą saugos informaciją';

  @override
  String get onboardingNext => 'Toliau';

  @override
  String get onboardingSkip => 'Praleisti';

  @override
  String get onboardingAgree => 'Tęsti';

  @override
  String onboardingPageLabel(int current, int total) {
    return '$current puslapis iš $total';
  }

  @override
  String get permTitle => 'Leidimai';

  @override
  String get permIntro =>
      '„Corvista“ prašo tik to, ko reikia kiekvienai funkcijai. Tai bet kada galite pakeisti nustatymuose.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Reikalinga aptikimui, vaizdo registratoriaus įrašymui ir parkavimo rodiniui. Vaizdas apdorojamas jūsų iPhone.';

  @override
  String get permLocationTitle => 'Vietovė';

  @override
  String get permLocationBody =>
      'Naudojama GPS greičiui, žemėlapiui, maršrutams, orams ir išsaugotų įrašų žymėjimui. Tik kai naudojatės programėle.';

  @override
  String get permMicTitle => 'Mikrofonas';

  @override
  String get permSpeechNote =>
      'Kalbos atpažinimo prašoma tik tada, jei avarinėms žinutėms įjungiate atšaukimą balsu.';

  @override
  String get permRequired => 'Būtina';

  @override
  String get permOptional => 'Neprivaloma';

  @override
  String get permAllow => 'Leisti';

  @override
  String get permGranted => 'Leista';

  @override
  String get permDenied => 'Atmesta';

  @override
  String get permLimited => 'Ribota';

  @override
  String get permRestricted => 'Apribota';

  @override
  String get permStart => 'Pradėti vairuoti';

  @override
  String get permCameraNeeded =>
      'Galite tęsti be prieigos prie kameros, bet aptikimas ir įrašymas neveiks, kol jos nesuteiksite nustatymuose.';

  @override
  String get permSetupIntro =>
      'Kad „Corvista“ veiktų visapusiškai, jų reikia. Palieskite „Leisti viską“, ir iOS paprašys kiekvieno iš eilės. Tai bet kada galite pakeisti nustatymuose.';

  @override
  String get permCameraLine =>
      'Reikalinga aptikimui, vaizdo registratoriaus įrašymui ir parkavimo rodiniui. Vaizdas apdorojamas jūsų iPhone ir niekada neįkeliamas.';

  @override
  String get permLocationLine =>
      'GPS greitis, žemėlapis, maršrutai, orai ir vieta, kur išsaugoti įrašai. Tik kai naudojatės programėle.';

  @override
  String get permMicLine =>
      'Salono garsas įvykių įrašuose ir jūsų atšaukimo frazės išgirdimas avarinio įspėjimo metu.';

  @override
  String get permSpeechTitle => 'Kalbos atpažinimas';

  @override
  String get permSpeechLine =>
      'Atpažįsta jūsų atšaukimo frazę avarinės atgalinės atskaitos metu, kai palaikoma – jūsų iPhone.';

  @override
  String get permAllowAll => 'Leisti viską';

  @override
  String permAsking(String permission) {
    return 'Prašoma: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Kai kurie leidimai išjungti. Įjunkite juos nustatymuose, kad galėtumėte naudotis šiomis funkcijomis.';

  @override
  String get permNotNow => 'Ne dabar';

  @override
  String get tourLabel => 'Vairavimo ekrano apžvalga';

  @override
  String tourProgress(int current, int total) {
    return '$current žingsnis iš $total';
  }

  @override
  String get tourNext => 'Toliau';

  @override
  String get tourBack => 'Atgal';

  @override
  String get tourSkip => 'Praleisti apžvalgą';

  @override
  String get tourFinish => 'Pradėti vairuoti';

  @override
  String get tourWelcomeTitle => 'Trumpa apžvalga';

  @override
  String get tourWelcomeBody =>
      'Vienos minutės apžvalga, kas svarbu vairavimo ekrane. Geriausia atlikti sustojus.';

  @override
  String get tourHudTitle => 'Jūsų prietaisų juosta';

  @override
  String get tourHudSpeed => 'Greitis nustatomas pagal GPS.';

  @override
  String get tourHudRec => 'REC rodo, kiek sekundžių įrašo sukaupta buferyje.';

  @override
  String get tourHudAi =>
      'DI ženkliukas rodo modelį, kiek objektų jis mato, ir tašką: žalias – veikia, gintarinis – ribotai, raudonas – sustabdyta.';

  @override
  String get tourSaveTitle => 'Išsaugoti įvykį';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista saugo ciklinį paskutinių $seconds sekundžių vaizdo buferį. Jis nuolat perrašomas, todėl nieko neišsaugoma, nebent palieskite „Išsaugoti“. Išsaugoti įrašai lieka šiame iPhone, skiltyje „Įrašai“.';
  }

  @override
  String get tourRecordTitle => 'Įrašykite visą kelionę';

  @override
  String get tourRecordBody =>
      'Palieskite „Įrašyti“, kad filmuotumėte nepertraukiamai, kol sustabdysite. Ilgos kelionės skiltyje „Įrašai“ išsaugomos 5 minučių dalimis, o „Išsaugoti įvykį“ veikia ir įrašymo metu.';

  @override
  String get tourViewsTitle => 'Penki būdai matyti kelią';

  @override
  String get tourViewDetection =>
      'Tiesioginis kameros vaizdas su rėmeliais aplink palaikomus objektus.';

  @override
  String get tourViewVirtual => 'Supaprastinta 3D scena, sukurta iš aptikimų.';

  @override
  String get tourViewMap => 'Apple Maps su paieška ir nurodymais pasukti.';

  @override
  String get tourViewParking => 'Kamera ir artumo rodinys iš viršaus.';

  @override
  String get tourViewPerception => 'Kelio ir objektų kaukės.';

  @override
  String get tourMapTitle => 'Paieška ir nurodymai pasukti';

  @override
  String get tourMapBody =>
      'Atidarykite žemėlapį, palieskite paieškos juostą ir pasirinkite tikslą. Pasirinkite maršrutą ir palieskite „Pradėti“, kad gautumėte nurodymus pasukti. Reikalingas interneto ryšys.';

  @override
  String get tourClipsTitle => 'Įrašai';

  @override
  String get tourClipsBody =>
      'Peržiūrėkite, pervadinkite, bendrinkite ar ištrinkite išsaugotus įvykius. Įrašai lieka jūsų iPhone, nebent jais pasidalinsite.';

  @override
  String get tourSettingsTitle => 'Nustatymai';

  @override
  String get tourSettingsBody =>
      'Derinkite balso įspėjimus ir jų jautrumą, įrašymo kokybę ir buferio ilgį bei nustatykite avarinį režimą – eksperimentinį smūgio įspėjimą su atšaukimo atgaline atskaita.';

  @override
  String get tourSafetyTitle => 'Prieš važiuojant';

  @override
  String get tourSafety1 =>
      'Saugiai pritvirtinkite iPhone ten, kur jis neuždengtų matymo lauko.';

  @override
  String get tourSafety2 =>
      'Vairuodami nesinaudokite programėle. Viską nustatykite sustoję.';

  @override
  String get tourSafety3 =>
      'Aptikimai ir zonos yra įvertinimai. Jie gali būti klaidingi arba praleisti.';

  @override
  String get tourSafety4 => 'Už saugų vairavimą vis tiek atsakote jūs.';

  @override
  String get helpTakeTour => 'Peržiūrėti apžvalgą';

  @override
  String get helpTakeTourSub =>
      'Vienos minutės apžvalga apie vairavimo ekraną.';

  @override
  String get tripsTitle => 'Kelionės';

  @override
  String get tripsOpen => 'Kelionių žurnalas';

  @override
  String get tripsEmptyTitle => 'Kelionių dar nėra';

  @override
  String get tripsEmptyBody =>
      'Kelionės įrašomos automatiškai, kai vairuojate su „Corvista“: atstumas, laikas, greitis ir jūsų maršrutas.';

  @override
  String get tripsDisabledBody =>
      'Kelionių žurnalas išjungtas, todėl naujos kelionės neįrašomos. Įjunkite jį, kad šiame iPhone būtų saugomas privatus jūsų maršrutų žurnalas.';

  @override
  String get tripsEnable => 'Įjungti kelionių žurnalą';

  @override
  String get tripsToday => 'Šiandien';

  @override
  String get tripsYesterday => 'Vakar';

  @override
  String tripsRecordingNow(String distance) {
    return 'Įrašoma kelionė · $distance';
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
      other: '$count įvykių',
      many: '$count įvykio',
      few: '$count įvykiai',
      one: '$count įvykis',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įspėjimų',
      many: '$count įspėjimo',
      few: '$count įspėjimai',
      one: '$count įspėjimas',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelionių',
      many: '$count kelionės',
      few: '$count kelionės',
      one: '$count kelionė',
      zero: 'Nėra kelionių',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Atstumas';

  @override
  String get tripsStatDuration => 'Trukmė';

  @override
  String get tripsStatMoving => 'Judėjimo laikas';

  @override
  String get tripsStatAvgSpeed => 'Vid. greitis';

  @override
  String get tripsStatMaxSpeed => 'Maks. greitis';

  @override
  String get tripsDetections => 'Aptikimai';

  @override
  String get tripsNoDetections => 'Šioje kelionėje kelio objektų neužfiksuota.';

  @override
  String get tripsTimeline => 'Laiko juosta';

  @override
  String get tripsEventStart => 'Kelionė prasidėjo';

  @override
  String get tripsEventEnd => 'Kelionė baigėsi';

  @override
  String get tripsEventAlert => 'Balso įspėjimas';

  @override
  String get tripsEventIncident => 'Įvykio įrašas išsaugotas';

  @override
  String get tripsEventEmergency => 'Aptikta galima avarija';

  @override
  String get tripsEventNavStart => 'Navigacija pradėta';

  @override
  String get tripsEventArrive => 'Atvykta į tikslą';

  @override
  String get tripsEventReroute => 'Maršrutas perskaičiuotas';

  @override
  String get tripsEventRecording => 'Įrašymas išsaugotas';

  @override
  String get tripsOpenClip => 'Atidaryti įrašą';

  @override
  String get tripsTrackPreview => 'GPS trasa';

  @override
  String get tripsRenameTitle => 'Pervadinti kelionę';

  @override
  String get tripsRenameHint => 'Kelionės pavadinimas';

  @override
  String get tripsFavorite => 'Pridėti prie mėgstamų';

  @override
  String get tripsUnfavorite => 'Pašalinti iš mėgstamų';

  @override
  String get tripsShareGpx => 'Bendrinti GPX';

  @override
  String get tripsShareFailed => 'Nepavyko bendrinti šios kelionės.';

  @override
  String get tripsDelete => 'Ištrinti kelionę';

  @override
  String get tripsDeleteConfirmTitle => 'Ištrinti šią kelionę?';

  @override
  String get tripsDeleteConfirmBody =>
      'Maršrutas ir statistika bus pašalinti iš šio iPhone. Šios kelionės įvykių įrašai bus išsaugoti.';

  @override
  String get tripsDeleted => 'Kelionė ištrinta';

  @override
  String get tripsNotFound => 'Šios kelionės nebėra.';

  @override
  String get tripsPrivacyNote => 'Saugoma tik šiame iPhone. Nieko neįkeliama.';

  @override
  String get settingsSectionTrips => 'Kelionių žurnalas';

  @override
  String get settingsTripLog => 'Įrašyti keliones';

  @override
  String get settingsTripLogSubtitle =>
      'Jūsų maršrutas ir vairavimo statistika saugomi tik šiame iPhone.';

  @override
  String get settingsTripRetention => 'Saugoti keliones';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dienų',
      many: '$days dienos',
      few: '$days dienos',
      one: '$days diena',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 metai';

  @override
  String get settingsRetentionForever => 'Visam laikui';

  @override
  String get settingsTripRetentionFooter =>
      'Senesnės kelionės automatiškai ištrinamos, kai paleidžiama Corvista.';

  @override
  String get settingsViewTrips => 'Peržiūrėti keliones';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours val. $minutes min.';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes min.';
  }

  @override
  String tripsGpxName(String date) {
    return '„Corvista“ kelionė $date';
  }

  @override
  String get settingsFreeUpSpace => 'Atlaisvinti vietos';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Pašalina laikinuosius failus ir talpyklas. Išsaugoti įrašai ir kelionės lieka.';

  @override
  String settingsFreedBytes(String size) {
    return 'Atlaisvinta $size';
  }

  @override
  String get settingsNothingToFree =>
      'Talpyklos išvalytos – laikinųjų failų pašalinti nereikia.';

  @override
  String get settingsSectionPrivacyData => 'Privatumas ir duomenys';

  @override
  String get settingsPrivacyDataFooter =>
      'Įrašai, kelionės ir nustatymai saugomi tik šiame iPhone. Jie iš jo išeina tik tada, kai pasirenkate jais pasidalyti.';

  @override
  String get settingsDeleteAllData => 'Ištrinti visus duomenis';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Pašalinti įrašus, keliones, kontaktus ir nustatymus iš šio iPhone';

  @override
  String get deleteAllTitle => 'Ištrinti visus duomenis?';

  @override
  String get deleteAllMessage =>
      'Iš šio iPhone bus negrįžtamai pašalinta:\n• Įvykių įrašai ir miniatiūros\n• Kelionių žurnalas ir GPS trasos\n• Pagalbos kontaktai ir avarijų įvykiai\n• Aptikimo žurnalai ir diagnostikos žurnalas\n• Nustatymai ir naujausi tikslai\n• Laikinoji įrašymo atmintinė ir talpykla\n\nŠio veiksmo atšaukti negalima. Tada „Corvista“ pradės iš naujo nuo sveikinimo ekranų.';

  @override
  String get deleteAllConfirm => 'Ištrinti viską';

  @override
  String get deleteAllInProgress => 'Trinama…';

  @override
  String get deleteAllDone => 'Visi duomenys ištrinti';

  @override
  String get deleteAllPartial =>
      'Kai kurių elementų ištrinti nepavyko. Bandykite dar kartą nustatymuose.';

  @override
  String get diagLogSection => 'Diagnostikos žurnalas';

  @override
  String get diagLogFooter =>
      'Klaidos įrašomos tik šiame iPhone, be vietovių, kontaktų vardų ar telefono numerių. Niekas nesiunčiama, nebent patys pasidalytumėte žurnalu.';

  @override
  String get diagLogShare => 'Bendrinti diagnostikos žurnalą';

  @override
  String get diagLogEmpty => 'Tuščias';

  @override
  String get diagLogClear => 'Išvalyti žurnalą';

  @override
  String get diagLogClearTitle => 'Išvalyti diagnostikos žurnalą?';

  @override
  String get diagLogClearBody =>
      'Išsaugoti klaidų įrašai bus ištrinti iš šio iPhone.';

  @override
  String get diagLogCleared => 'Diagnostikos žurnalas išvalytas';

  @override
  String get diagLogShareFailed => 'Nepavyko pasidalyti diagnostikos žurnalu.';

  @override
  String get privacyControls2 =>
      'Nustatymai › Privatumas ir duomenys › Ištrinti visus duomenis pašalina visus įrašus, keliones, kontaktus, žurnalus ir nustatymus, kuriuos „Corvista“ saugo šiame iPhone.';

  @override
  String get parkingZoneStop => 'Stop';

  @override
  String get parkingZoneVeryClose => 'Labai arti';

  @override
  String get parkingZoneClose => 'Arti';

  @override
  String get parkingZoneNothingClose => 'Arti nieko nematyti';

  @override
  String get parkingNotDetected =>
      'Sienos, kolonos, stulpai ir bordiūrai neaptinkami';

  @override
  String get parkingApprox => 'apytiksl.';

  @override
  String get parkingSideLeft => 'Kairė';

  @override
  String get parkingSideCenter => 'Vidurys';

  @override
  String get parkingSideRight => 'Dešinė';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Tik priekinės kameros vaizdas — ne 360° sistema';

  @override
  String get parkingMuteBeeps => 'Nutildyti pyptelėjimus';

  @override
  String get parkingUnmuteBeeps => 'Įjungti pyptelėjimus';

  @override
  String get parkingAbout => 'Apie parkavimo rodinį';

  @override
  String get parkingLimitationsDetail =>
      'Stebima tik kameros priekyje esanti zona. Detektorius atpažįsta automobilius, autobusus ir sunkvežimius, žmones, dviračius bei motociklus. Sienos, kolonos, stulpai, bordiūrai, stulpeliai, atitvarai ir žemos kliūtys NEAPTINKAMI, o kapotas gali užstoti žemę tiesiai priekyje. Atstumai yra apytikslis vienos kameros įvertis (pagal objekto dydį ir padėtį) ir gali stipriai klysti. Tyla ar „Arti nieko nematyti“ nereiškia, kad kelias laisvas — visada apsdairykite ir naudokitės veidrodėliais.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Artumas pagal pusę: kairėje $left, viduryje $center, dešinėje $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Klaidos įrašomos į privatų žurnalą šiame iPhone (be vietovių, kontaktų vardų ar telefono numerių). Jis niekada nesiunčiamas automatiškai; juo galite pasidalyti arba jį išvalyti skiltyje Nustatymai › Diagnostika.';
}
