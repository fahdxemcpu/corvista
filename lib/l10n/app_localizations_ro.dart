// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Vedeți mai mult la fiecare drum.';

  @override
  String get commonCancel => 'Anulează';

  @override
  String get commonDelete => 'Șterge';

  @override
  String get commonSave => 'Salvează';

  @override
  String get commonBack => 'Înapoi';

  @override
  String get commonClose => 'Închide';

  @override
  String get commonRetry => 'Încearcă din nou';

  @override
  String get commonOpenSettings => 'Deschide Setările';

  @override
  String get commonLoading => 'Se încarcă…';

  @override
  String get commonError => 'Ceva nu a funcționat.';

  @override
  String commonErrorDetail(String message) {
    return 'Ceva nu a funcționat: $message';
  }

  @override
  String get commonOn => 'Activat';

  @override
  String get commonOff => 'Dezactivat';

  @override
  String get commonRename => 'Redenumește';

  @override
  String get commonShare => 'Distribuie';

  @override
  String get commonNotAvailable => 'Indisponibil';

  @override
  String get commonTestFootage => 'ÎNREGISTRARE DE TEST';

  @override
  String get zoneVeryClose => 'Foarte aproape';

  @override
  String get zoneClose => 'Aproape';

  @override
  String get zoneMedium => 'Mediu';

  @override
  String get zoneFar => 'Departe';

  @override
  String get zoneUnknown => 'Necunoscut';

  @override
  String get classPerson => 'Persoană';

  @override
  String get classBicycle => 'Bicicletă';

  @override
  String get classMotorcycle => 'Motocicletă';

  @override
  String get classCar => 'Vehicul';

  @override
  String get classBus => 'Autobuz';

  @override
  String get classTrafficLight => 'Semafor';

  @override
  String get classStopSign => 'Indicator Stop';

  @override
  String get viewDetection => 'Detecție';

  @override
  String get viewVirtual => 'Virtual';

  @override
  String get viewMap => 'Hartă';

  @override
  String get viewParking => 'Parcare';

  @override
  String get viewPerception => 'Percepție';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Roșu';

  @override
  String get lightYellow => 'Galben';

  @override
  String get lightGreen => 'Verde';

  @override
  String get lightUnknown => 'Necunoscut';

  @override
  String get clipsTitle => 'Clipuri';

  @override
  String get clipsSelect => 'Selectează';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de selectate',
      few: '$count selectate',
      one: '1 selectat',
      zero: 'Selectați clipuri',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Selectează tot';

  @override
  String get clipsDeselectAll => 'Deselectează tot';

  @override
  String get clipsDeleteSelected => 'Șterge selecția';

  @override
  String get clipsGridView => 'Vizualizare grilă';

  @override
  String get clipsListView => 'Vizualizare listă';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ștergeți $count de clipuri?',
      few: 'Ștergeți $count clipuri?',
      one: 'Ștergeți acest clip?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Videoclipurile sunt eliminate definitiv de pe iPhone. Această acțiune nu poate fi anulată.',
      one: 'Videoclipul este eliminat definitiv de pe iPhone. Această acțiune nu poate fi anulată.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de clipuri șterse',
      few: '$count clipuri șterse',
      one: 'Clip șters',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Încă nu există clipuri';

  @override
  String get clipsEmptyBody =>
      'În timp ce conduceți, Corvista păstrează un buffer continuu scurt. Atingeți Salvează incidentul pentru a păstra aici ultimele secunde de imagini.';

  @override
  String get clipsLoadError => 'Clipurile nu au putut fi încărcate.';

  @override
  String get clipsStorageTitle => 'Spațiu de stocare';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Clipuri $clips · Buffer $buffer · $free liber';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de clipuri salvate',
      few: '$count clipuri salvate',
      one: '1 clip salvat',
      zero: 'Niciun clip salvat',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Spațiul de stocare al iPhone-ului este aproape plin. Este posibil ca incidentele noi să nu se salveze.';

  @override
  String get clipsMissingFile => 'Fișier lipsă';

  @override
  String get clipsEmergencyBadge => 'Impact';

  @override
  String clipsUntitled(String date) {
    return 'Incident · $date';
  }

  @override
  String get clipsAudio => 'Audio înregistrat';

  @override
  String get clipsFavorite => 'Favorit';

  @override
  String get clipsUnfavorite => 'Elimină din favorite';

  @override
  String get clipsLocation => 'Locație salvată';

  @override
  String clipsOpenClip(String title) {
    return 'Deschide clipul $title';
  }

  @override
  String get playerNotFoundTitle => 'Clipul nu a fost găsit';

  @override
  String get playerNotFoundBody =>
      'Este posibil ca acest clip să fi fost șters.';

  @override
  String get playerMissingTitle => 'Fișier video lipsă';

  @override
  String get playerMissingBody =>
      'Înregistrarea acestui clip nu mai există pe iPhone. Puteți elimina intrarea din galerie.';

  @override
  String get playerRemoveEntry => 'Elimină intrarea';

  @override
  String get playerLoadError => 'Acest videoclip nu poate fi redat.';

  @override
  String get playerPlay => 'Redă';

  @override
  String get playerPause => 'Pauză';

  @override
  String get playerReplay => 'Redă din nou';

  @override
  String get playerRenameTitle => 'Redenumiți clipul';

  @override
  String get playerRenameHint => 'Numele clipului';

  @override
  String get playerRenamed => 'Clip redenumit';

  @override
  String get playerFavorited => 'Adăugat la favorite';

  @override
  String get playerUnfavorited => 'Eliminat din favorite';

  @override
  String get playerShareFailed => 'Clipul nu a putut fi distribuit.';

  @override
  String get playerDetails => 'Detalii';

  @override
  String get playerDate => 'Înregistrat';

  @override
  String get playerDuration => 'Durată';

  @override
  String get playerResolution => 'Rezoluție';

  @override
  String get playerSize => 'Dimensiune fișier';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerAudioYes => 'Înregistrat';

  @override
  String get playerAudioNo => 'Neînregistrat';

  @override
  String get playerReason => 'Salvat prin';

  @override
  String get playerReasonManual => 'Butonul Salvează incidentul';

  @override
  String get playerReasonEmergency => 'Detectare posibil impact';

  @override
  String get playerReasonRecovered => 'Recuperat după o întrerupere';

  @override
  String get playerSpeed => 'Viteză GPS la salvare';

  @override
  String get playerLocation => 'Locație';

  @override
  String get playerOpenInMaps => 'Deschide în Hărți';

  @override
  String get playerBack => 'Înapoi';

  @override
  String get playerMore => 'Mai multe acțiuni';

  @override
  String get clipsFilterLabel => 'Afișare';

  @override
  String get clipsFilterAll => 'Toate';

  @override
  String get clipsFilterRecordings => 'Înregistrări';

  @override
  String get clipsFilterIncidents => 'Incidente';

  @override
  String get clipsFilterEmergency => 'Urgențe';

  @override
  String get clipsFilterFavorites => 'Favorite';

  @override
  String get clipsSort => 'Sortare';

  @override
  String get clipsSortNewest => 'Cele mai noi primele';

  @override
  String get clipsSortOldest => 'Cele mai vechi primele';

  @override
  String get clipsSortLongest => 'Cele mai lungi primele';

  @override
  String get clipsSortLargest => 'Cele mai mari primele';

  @override
  String get clipsToday => 'Azi';

  @override
  String get clipsYesterday => 'Ieri';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de clipuri',
      few: '$count clipuri',
      one: '1 clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Niciun clip în această categorie încă.';

  @override
  String get clipsFavoritesEmpty =>
      'Marcați un clip cu stea pentru a-l păstra aici, la îndemână.';

  @override
  String get clipsKindRecording => 'Înregistrare';

  @override
  String get clipsKindIncident => 'Incident';

  @override
  String get clipsKindEmergency => 'Urgență';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Călătorie · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Deschide călătoria în care a fost înregistrat clipul';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used folosit · $free liber';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Clipurile ocupă $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de înregistrări',
      few: '$count înregistrări',
      one: '1 înregistrare',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de incidente',
      few: '$count incidente',
      one: '1 incident',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de urgențe',
      few: '$count urgențe',
      one: '1 urgență',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Eliberează spațiu';

  @override
  String get clipsStorageLowGentle =>
      'Mai puțin de 2 GB liberi. Pentru o înregistrare fluidă, eliberați spațiu sau ștergeți clipurile de care nu mai aveți nevoie.';

  @override
  String get clipsSaveToPhotos => 'Salvează în Poze';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de clipuri',
      few: '$count clipuri',
      one: '1 clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ștergeți $count de clipuri ($size)?',
      few: 'Ștergeți $count clipuri ($size)?',
      one: 'Ștergeți acest clip ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Se salvează $done din $total în Poze…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de clipuri salvate în Poze',
      few: '$count clipuri salvate în Poze',
      one: 'Salvat în Poze',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved salvate în Poze · $failed nu au putut fi salvate';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista nu are permisiunea de a adăuga videoclipuri în Poze. O puteți permite în Setări.';

  @override
  String get clipsPhotosFailed => 'Nu s-a putut salva în Poze.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de clipuri adăugate la favorite',
      few: '$count clipuri adăugate la favorite',
      one: 'Adăugat la favorite',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de clipuri eliminate din favorite',
      few: '$count clipuri eliminate din favorite',
      one: 'Eliminat din favorite',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (tăiat)';
  }

  @override
  String get playerTrim => 'Tăiere';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Tip';

  @override
  String get playerReasonRecording => 'Butonul Înregistrare';

  @override
  String get trimTitle => 'Taie clipul';

  @override
  String get trimHint =>
      'Trageți de mânere pentru a alege partea de păstrat. Clipul original rămâne neschimbat.';

  @override
  String get trimStartHandle => 'Început tăiere';

  @override
  String get trimEndHandle => 'Sfârșit tăiere';

  @override
  String trimSelection(String duration) {
    return '$duration selectat';
  }

  @override
  String get trimSave => 'Salvează ca clip nou';

  @override
  String get trimSaving => 'Se salvează clipul tăiat…';

  @override
  String get trimSaved => 'Clipul tăiat a fost salvat';

  @override
  String get trimOpenNew => 'Deschide';

  @override
  String get trimFailed => 'Nu s-a putut tăia clipul.';

  @override
  String get trimStorageFull =>
      'Nu există suficient spațiu liber pentru a salva clipul tăiat.';

  @override
  String get trimPreview => 'Redă selecția';

  @override
  String get settingsTitle => 'Setări';

  @override
  String get settingsSectionCamera => 'Cameră';

  @override
  String get settingsSectionAi => 'IA';

  @override
  String get settingsSectionAlerts => 'Alerte';

  @override
  String get settingsSectionAlertCategories => 'Categorii de alerte';

  @override
  String get settingsSectionRecording => 'Înregistrare';

  @override
  String get settingsSectionDriving => 'Condus';

  @override
  String get settingsSectionPower => 'Energie';

  @override
  String get settingsSectionEmergency => 'Urgență';

  @override
  String get settingsSectionAppearance => 'Aspect';

  @override
  String get settingsSectionLanguage => 'Limbă';

  @override
  String get settingsSectionInformation => 'Informații';

  @override
  String get settingsCameraLens => 'Obiectivul camerei';

  @override
  String get settingsLensWide => 'Grand-angular';

  @override
  String get settingsLensUltraWide => 'Ultra grand-angular';

  @override
  String get settingsLensTelephoto => 'Teleobiectiv';

  @override
  String get settingsLensUnavailable => 'Indisponibil pe acest iPhone';

  @override
  String get settingsStabilization => 'Stabilizare';

  @override
  String get settingsStabAuto => 'Automată';

  @override
  String get settingsStabOff => 'Dezactivată';

  @override
  String get settingsStabStandard => 'Standard';

  @override
  String get settingsStabCinematic => 'Cinematică';

  @override
  String get settingsOverlayOpacity => 'Opacitatea suprapunerii';

  @override
  String get settingsShowFps => 'Afișează statisticile de performanță';

  @override
  String get settingsShowFpsSubtitle =>
      'Rata de cadre și timpul de inferență în vizualizarea Detecție';

  @override
  String get settingsCameraFooter =>
      'Modificările de obiectiv și stabilizare se aplică la următoarea pornire a camerei.';

  @override
  String get settingsAiModel => 'Model IA';

  @override
  String get settingsConfidence => 'Încrederea detecției';

  @override
  String get settingsTracking => 'Urmărirea obiectelor';

  @override
  String get settingsTrackingSubtitle =>
      'Menține obiectele stabile între cadre';

  @override
  String get settingsShowLabels => 'Afișează etichetele';

  @override
  String get settingsShowConfidence => 'Afișează încrederea';

  @override
  String get settingsSegmentationOpacity => 'Opacitatea măștii de percepție';

  @override
  String get settingsAiFooter =>
      'O încredere mai mică afișează mai multe obiecte, dar și mai multe detecții false. Detecțiile pot fi inexacte.';

  @override
  String get settingsVoiceAlerts => 'Alerte vocale';

  @override
  String get settingsVoiceLanguage => 'Limba vocii';

  @override
  String get settingsVoiceLanguageAuto => 'Aceeași cu limba aplicației';

  @override
  String get settingsVoice => 'Voce';

  @override
  String get settingsVoiceDefault => 'Implicită de sistem';

  @override
  String get settingsVoiceQualityEnhanced => 'Îmbunătățită';

  @override
  String get settingsVoiceQualityPremium => 'Calitate înaltă';

  @override
  String get settingsNoVoices =>
      'Nu este instalată nicio voce pentru această limbă. Adăugați una în iOS Setări › Accesibilitate › Conținut vorbit.';

  @override
  String get settingsAlertPedestrian => 'Pietoni';

  @override
  String get settingsAlertCyclist => 'Bicicliști';

  @override
  String get settingsAlertMotorcycle => 'Motociclete';

  @override
  String get settingsAlertBus => 'Autobuze';

  @override
  String get settingsAlertVehicleClose => 'Vehicul foarte aproape în față';

  @override
  String get settingsAlertTrafficLight => 'Schimbarea semaforului';

  @override
  String get settingsAlertTrafficMoving => 'Traficul din față se mișcă';

  @override
  String get settingsAlertStopSign => 'Indicatoare Stop';

  @override
  String get settingsSensitivity => 'Sensibilitate';

  @override
  String get settingsSensitivityLow => 'Scăzută';

  @override
  String get settingsSensitivityMedium => 'Medie';

  @override
  String get settingsSensitivityHigh => 'Ridicată';

  @override
  String get settingsCooldown => 'Interval de repetare';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Volumul vocii';

  @override
  String get settingsQuietMode => 'Mod silențios';

  @override
  String get settingsQuietModeSubtitle =>
      'Sunt rostite doar cele mai importante alerte';

  @override
  String get settingsTestVoice => 'Testează vocea';

  @override
  String get settingsTestVoiceDone => 'Se redă o alertă exemplu…';

  @override
  String get settingsParkingBeeps => 'Semnale sonore de parcare';

  @override
  String get settingsBeepVolume => 'Volumul semnalului sonor';

  @override
  String get settingsAlertsFooter =>
      'Alertele sunt doar un ajutor. Urmăriți întotdeauna drumul – lipsa alertelor nu înseamnă că drumul este liber.';

  @override
  String get settingsRecordingProfile => 'Calitatea înregistrării';

  @override
  String get settingsProfileStandard => 'Standard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Buffer pentru incidente';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds secunde';
  }

  @override
  String get settingsManualMaxLength => 'Durata maximă a înregistrării manuale';

  @override
  String get settingsManualMaxUnlimited => 'Nelimitată';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Înregistrează audio';

  @override
  String get settingsRecordAudioSubtitle =>
      'Include sunetul din habitaclu în incidentele salvate';

  @override
  String get settingsMicDenied =>
      'Accesul la microfon este dezactivat. Permiteți-l în Setări pentru a înregistra audio.';

  @override
  String get settingsWatermark => 'Filigran Corvista';

  @override
  String get settingsTimestamp => 'Marcaj de dată și oră';

  @override
  String get settingsSaveLocation => 'Salvează locația împreună cu clipurile';

  @override
  String get settingsStorage => 'Stocare și clipuri';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de clipuri',
      few: '$count clipuri',
      one: '1 clip',
      zero: 'Niciun clip',
    );
    return '$_temp0 · $used utilizat · $free liber';
  }

  @override
  String get settingsRecordingFooter =>
      'Bufferul continuu rămâne pe iPhone și este suprascris permanent. Nimic nu se înregistrează în fundal.';

  @override
  String get settingsDefaultView => 'Vizualizare implicită';

  @override
  String get settingsUnits => 'Unități';

  @override
  String get settingsShowCompass => 'Afișează busola';

  @override
  String get settingsHudStyle => 'Stil HUD';

  @override
  String get settingsHudCustomize => 'Personalizează HUD';

  @override
  String get settingsDrivingSide => 'Sensul de circulație';

  @override
  String get settingsDrivingSideAuto => 'Automat';

  @override
  String get settingsDrivingSideRight => 'Dreapta';

  @override
  String get settingsDrivingSideLeft => 'Stânga';

  @override
  String get settingsVirtualStyle => 'Stilul vizualizării virtuale';

  @override
  String get settingsVirtualMinimal => 'Minimal';

  @override
  String get settingsVirtualPerspective => 'Perspectivă';

  @override
  String get settingsVirtualHighContrast => 'Contrast ridicat';

  @override
  String get settingsKeepScreenOn =>
      'Menține ecranul aprins în timpul condusului';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Afișează indicațiile de navigare pas cu pas pe ecranul de blocare și în Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Înregistrarea a fost oprită temporar cât timp Corvista a fost în fundal';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Pauză';

  @override
  String get liveActivityDashcamOff => 'Cameră oprită';

  @override
  String get liveActivityEnded => 'Navigare încheiată';

  @override
  String get liveActivityEta => 'Sosire';

  @override
  String get settingsAutoRecenter => 'Recentrare automată a hărții';

  @override
  String get settingsHudStyleClassic => 'Clasic';

  @override
  String get settingsHudStyleGrid => 'Grilă';

  @override
  String get settingsHudStyleMinimal => 'Minimal';

  @override
  String get settingsHudStylePerformance => 'Performanță';

  @override
  String get settingsHudStyleNavigation => 'Navigare';

  @override
  String get settingsHudStyleNight => 'Noapte';

  @override
  String get settingsHudStyleHighContrast => 'Contrast ridicat';

  @override
  String get settingsPowerMode => 'Mod de energie';

  @override
  String get settingsPowerBalanced => 'Echilibrat';

  @override
  String get settingsPowerPerformance => 'Performanță';

  @override
  String get settingsPowerSaver => 'Economisire energie';

  @override
  String get settingsPowerFooter =>
      'Corvista reduce automat ritmul IA și efectele vizuale când iPhone-ul se încălzește sau bateria este scăzută.';

  @override
  String get settingsThermal => 'Stare termică';

  @override
  String get settingsThermalNominal => 'Normală';

  @override
  String get settingsThermalFair => 'Caldă';

  @override
  String get settingsThermalSerious => 'Fierbinte';

  @override
  String get settingsThermalCritical => 'Critică';

  @override
  String get settingsBattery => 'Baterie';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Se încarcă';
  }

  @override
  String get settingsLowPowerMode =>
      'Modul Consum redus este activat – IA rulează într-un ritm redus.';

  @override
  String get settingsAiRate => 'Ritmul curent al IA';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Detectarea impactului';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Activată · numărătoare inversă de $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Experimental. Nu înlocuiește serviciile de urgență.';

  @override
  String get settingsTheme => 'Temă';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeDark => 'Întunecată';

  @override
  String get settingsThemeLight => 'Luminoasă';

  @override
  String get settingsReduceMotion => 'Redu mișcarea';

  @override
  String get settingsReduceMotionSubtitle =>
      'Reduce animațiile din întreaga aplicație';

  @override
  String get settingsAppLanguage => 'Limba aplicației';

  @override
  String get settingsPrivacyPolicy => 'Politica de confidențialitate';

  @override
  String get settingsTerms => 'Termeni de utilizare';

  @override
  String get settingsHelp => 'Ajutor';

  @override
  String get settingsSupport => 'Contactați asistența';

  @override
  String get settingsLicenses => 'Licențe open-source';

  @override
  String get settingsSupportUnavailable =>
      'Mail nu a putut fi deschis. Scrieți la support@corvista.app.';

  @override
  String get settingsSafety => 'Informații de siguranță';

  @override
  String get settingsDiagnostics => 'Diagnosticare';

  @override
  String get settingsVersion => 'Versiune';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Personalizează HUD';

  @override
  String get hudCustomPreview => 'Previzualizare · valori exemplu';

  @override
  String get hudCustomStyle => 'Stil';

  @override
  String get hudCustomElements => 'Elemente';

  @override
  String get hudCustomSpeed => 'Viteză';

  @override
  String get hudCustomHeading => 'Direcție și busolă';

  @override
  String get hudCustomClock => 'Ceas';

  @override
  String get hudCustomBattery => 'Baterie și temperatură';

  @override
  String get hudCustomDetections => 'Stare IA și detecții';

  @override
  String get hudCustomWeather => 'Vreme';

  @override
  String get hudCustomAppearance => 'Dimensiune și opacitate';

  @override
  String get hudCustomSize => 'Dimensiune';

  @override
  String get hudCustomOpacity => 'Opacitate';

  @override
  String get hudCustomFooter =>
      'Avertismentele, precum supraîncălzirea, sunt afișate întotdeauna, chiar dacă elementele sunt ascunse.';

  @override
  String get hudCustomDescClassic => 'Panou de bord echilibrat';

  @override
  String get hudCustomDescGrid => 'Grilă în perspectivă peste drum';

  @override
  String get hudCustomDescMinimal => 'Doar viteza, nimic altceva';

  @override
  String get hudCustomDescPerformance => 'Arc de viteză cu valori în timp real';

  @override
  String get hudCustomDescNavigation => 'Mai întâi următoarea manevră';

  @override
  String get hudCustomDescNight =>
      'Estompat și cu tente roșii pentru condus pe timp de noapte';

  @override
  String get hudCustomDescHighContrast =>
      'Lizibilitate maximă în soare puternic';

  @override
  String get languageTitle => 'Limbă';

  @override
  String get languageSystem => 'Implicită de sistem';

  @override
  String get languageSystemSubtitle => 'Urmează limba iPhone-ului';

  @override
  String get languageFooter =>
      'Vor fi adăugate și alte limbi. Limba alertelor vocale poate fi setată separat la Alerte.';

  @override
  String get diagTitle => 'Diagnosticare';

  @override
  String get diagPerformance => 'Performanță';

  @override
  String get diagInference => 'Timp de inferență';

  @override
  String get diagDetectHz => 'Rata de detecție';

  @override
  String get diagCameraFps => 'Rata de cadre a camerei';

  @override
  String get diagMemory => 'Memorie';

  @override
  String get diagDropped => 'Cadre pierdute';

  @override
  String get diagSegmentation => 'Timp de segmentare';

  @override
  String get diagCamera => 'Cameră';

  @override
  String get diagStatus => 'Stare';

  @override
  String get diagSource => 'Sursă';

  @override
  String get diagSourceCamera => 'Cameră live';

  @override
  String get diagSourceFile => 'Fișier video de test';

  @override
  String get diagResolution => 'Dimensiune buffer';

  @override
  String get diagLens => 'Obiectiv';

  @override
  String get diagError => 'Ultima eroare';

  @override
  String get diagModel => 'Model IA';

  @override
  String get diagModelLoad => 'Timp de încărcare a modelului';

  @override
  String get diagPower => 'Energie';

  @override
  String get diagSegHz => 'Rata de segmentare';

  @override
  String get diagReduced => 'Efecte reduse';

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
  String get diagCamIdle => 'Inactivă';

  @override
  String get diagCamStarting => 'Pornește';

  @override
  String get diagCamRunning => 'Activă';

  @override
  String get diagCamInterrupted => 'Întreruptă';

  @override
  String get diagCamStopped => 'Oprită';

  @override
  String get diagCamUnavailable => 'Indisponibilă';

  @override
  String get diagCamPermissionDenied => 'Permisiune refuzată';

  @override
  String get diagCamError => 'Eroare';

  @override
  String get diagTestFootage => 'Înregistrare de test';

  @override
  String get diagTestFootageBody =>
      'Rulează detecția reală pe dispozitiv pe un fișier video local, în locul camerei. Fiecare vizualizare o marchează cu ÎNREGISTRARE DE TEST.';

  @override
  String get diagPathLabel => 'Calea fișierului video';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Folosește Documents/test_drive.mp4';

  @override
  String get diagRun => 'Rulează înregistrarea de test';

  @override
  String get diagRunStarted =>
      'Înregistrarea de test a pornit. Deschideți vizualizarea de condus pentru a o vedea.';

  @override
  String get diagBackToCamera => 'Revino la camera live';

  @override
  String get diagDebugOnly =>
      'Înregistrarea de test este disponibilă doar în versiunile de dezvoltare.';

  @override
  String get diagFileMissing => 'Nu există niciun fișier la această cale.';

  @override
  String get emergencySetupTitle => 'Detectarea impactului';

  @override
  String get emergencyExperimental => 'Experimental';

  @override
  String get emergencyIntro =>
      'În timpul condusului, Corvista poate monitoriza un posibil impact sever folosind senzorii de mișcare ai iPhone-ului. Dacă este detectat unul, începe o numărătoare inversă. Dacă nu o anulați, Corvista vă propune să apelați serviciile de urgență și să trimiteți un mesaj contactelor dumneavoastră.';

  @override
  String get emergencyDisclaimer1 =>
      'Nu înlocuiește serviciile de urgență și nici detectarea accidentelor a vehiculului dumneavoastră.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS vă cere întotdeauna confirmarea înainte de efectuarea unui apel sau trimiterea unui mesaj.';

  @override
  String get emergencyDisclaimer3 =>
      'Impacturile pot fi ratate, iar frânările bruște sau denivelările pot fi confundate cu un impact.';

  @override
  String get emergencyParkedWarning =>
      'Finalizați această configurare în timp ce sunteți parcat. Setările sunt blocate cât timp vehiculul este în mișcare.';

  @override
  String get emergencyEnable => 'Activează detectarea impactului';

  @override
  String get emergencyEnableSubtitle =>
      'Activă doar în timpul unei sesiuni de condus';

  @override
  String get emergencyNeedNumber => 'Adăugați mai întâi un număr de urgență.';

  @override
  String get emergencyContacts => 'Contacte de urgență';

  @override
  String get emergencyAddContact => 'Adaugă contact';

  @override
  String get emergencyNoContacts =>
      'Încă nu există contacte. Contactele primesc un mesaj doar după ce îl confirmați.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Eliminați $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Persoana nu va mai fi propusă ca destinatar după un impact.';

  @override
  String get emergencyRemove => 'Elimină';

  @override
  String get emergencyContactsError => 'Contactele nu au putut fi încărcate.';

  @override
  String get emergencyNumber => 'Număr de urgență';

  @override
  String get emergencyNumberHint => 'de ex. 112 sau 911';

  @override
  String get emergencyMessage => 'Șablon de mesaj';

  @override
  String get emergencyMessageDefault =>
      'Este posibil să fi avut un accident de vehicul. Acest mesaj a fost pregătit de Corvista și include ultima mea locație cunoscută, dacă este disponibilă.';

  @override
  String get emergencyMessageHint =>
      'Lăsați gol pentru a folosi mesajul implicit.';

  @override
  String get emergencyCountdown => 'Durata numărătorii inverse';

  @override
  String get emergencyVoiceCancel => 'Anulare prin voce';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Spuneți „Sunt bine” sau „Anulează” în timpul numărătorii inverse. Folosește recunoașterea vocală pe dispozitiv, acolo unde este disponibilă.';

  @override
  String get emergencyVoicePermDenied =>
      'Anularea prin voce necesită acces la microfon și la recunoașterea vocală.';

  @override
  String get emergencyAutoSave => 'Salvează automat clipul incidentului';

  @override
  String get emergencyTest => 'Testează numărătoarea inversă (fără apel)';

  @override
  String get emergencyTestBody =>
      'Rulează un impact simulat pentru a vedea numărătoarea inversă. În modul de test nu se efectuează niciun apel și nu se trimite niciun mesaj.';

  @override
  String get emergencyNotSet => 'Nesetat';

  @override
  String get emergencyAlertHeadline =>
      'A fost detectat un posibil impact sever.';

  @override
  String get emergencyAlertSubtitle => 'Sunteți bine?';

  @override
  String get emergencyAlertCancel => 'Sunt bine – Anulează';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds de secunde rămase',
      few: '$seconds secunde rămase',
      one: '1 secundă rămasă',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Se ascultă – spuneți „Sunt bine” pentru a anula';

  @override
  String emergencyAlertHeard(String text) {
    return 'Auzit: „$text”';
  }

  @override
  String get emergencyAlertEscalated =>
      'Niciun răspuns. Alegeți ce doriți să faceți:';

  @override
  String get emergencyAlertCall => 'Apelează serviciile de urgență';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Apelează $number. iOS vă cere confirmarea.';
  }

  @override
  String get emergencyAlertMessage => 'Trimite mesaj contactelor';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Deschide un mesaj pregătit. Dumneavoastră alegeți dacă îl trimiteți.';

  @override
  String get emergencyAlertTestMode =>
      'Mod de test – nu se va efectua niciun apel';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'Sunt bine – Închide';

  @override
  String get emergencyMsgSent => 'Mesaj trimis.';

  @override
  String get emergencyMsgCancelled => 'Mesajul nu a fost trimis.';

  @override
  String get emergencyMsgFailed => 'Mesajul nu a putut fi trimis.';

  @override
  String get emergencyMsgUnavailable =>
      'Mesageria nu este disponibilă pe acest dispozitiv.';

  @override
  String emergencyCallFailed(String number) {
    return 'Apelul nu a putut fi inițiat. Formați dumneavoastră $number.';
  }

  @override
  String get modelsTitle => 'Modele IA';

  @override
  String get modelsIntro =>
      'Toate modelele sunt incluse în aplicație și rulează integral pe iPhone. Imaginea camerei nu părăsește niciodată dispozitivul.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Live: $ms ms per cadru · $hz detecții/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Încărcat în $ms ms';
  }

  @override
  String get modelsEfficientName => 'Eficient';

  @override
  String get modelsEfficientDesc =>
      'Detector rapid și compact, optimizat pentru drumuri lungi, cu încălzire și consum de baterie reduse.';

  @override
  String get modelsEnhancedName => 'Îmbunătățit';

  @override
  String get modelsEnhancedDesc =>
      'Detector mai mare, care găsește obiecte mai mici și mai îndepărtate, cu un consum de energie mai ridicat.';

  @override
  String get modelsSegmentationName => 'Segmentare';

  @override
  String get modelsSegmentationDesc =>
      'Combină detecția rapidă cu măști pentru suprafața drumului și obiecte, pentru vizualizarea Percepție.';

  @override
  String get modelsNoneName => 'IA în pauză';

  @override
  String get modelsNoneDesc =>
      'Camera și înregistrarea continuă fără detectarea obiectelor. Cel mai redus consum de energie.';

  @override
  String get modelsGenericDesc =>
      'Model de detectare a obiectelor pe dispozitiv.';

  @override
  String get modelsFunctionDetection =>
      'Detectează vehicule, persoane, biciclete, motociclete, autobuze, semafoare și indicatoare Stop';

  @override
  String get modelsFunctionSegmentation =>
      'Adaugă măști pentru suprafața drumului și obiecte';

  @override
  String get modelsFunctionNone => 'Fără detecție; doar înregistrare dashcam';

  @override
  String get modelsSize => 'Dimensiune';

  @override
  String get modelsInput => 'Intrare';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Funcționează cu';

  @override
  String get modelsStatusInstalled => 'Instalat (inclus)';

  @override
  String get modelsStatusNotInstalled => 'Neinstalat';

  @override
  String get modelsSelected => 'Selectat';

  @override
  String get modelsUse => 'Folosește acest model';

  @override
  String get modelsSwitching => 'Se încarcă modelul…';

  @override
  String modelsSwitched(String name) {
    return '$name este acum activ';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Măsurat pe acest dispozitiv: $ms ms în medie';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Nemăsurat pe acest dispozitiv';

  @override
  String get modelsBenchmarkRun => 'Rulează testul de performanță';

  @override
  String get modelsBenchmarkRunning => 'Se măsoară…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Selectați acest model pentru a-l testa.';

  @override
  String get modelsBenchmarkDone => 'Test de performanță finalizat';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Testul de performanță a eșuat: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Ultima actualizare: $date';
  }

  @override
  String get safetyTitle => 'Informații de siguranță';

  @override
  String get safetyIntro =>
      'Corvista este un ajutor pentru atenția la condus. Nu controlează vehiculul dumneavoastră și nu poate înlocui atenția, discernământul dumneavoastră sau sistemele de siguranță ale vehiculului.';

  @override
  String get safetyBeforeTitle => 'Înainte de a conduce';

  @override
  String get safetyBefore1 =>
      'Fixați iPhone-ul ferm, într-o poziție legală care nu blochează vizibilitatea, airbagurile sau comenzile.';

  @override
  String get safetyBefore2 =>
      'Finalizați configurarea, alegeți o vizualizare și setați destinația în timp ce sunteți parcat.';

  @override
  String get safetyBefore3 =>
      'Conectați un încărcător pentru drumuri mai lungi și, pe cât posibil, țineți telefonul ferit de lumina directă a soarelui.';

  @override
  String get safetyWhileTitle => 'În timpul condusului';

  @override
  String get safetyWhile1 =>
      'Țineți ochii pe drum. Folosiți comenzile mari de pe ecran doar atunci când este sigur și legal.';

  @override
  String get safetyWhile2 =>
      'Alertele sunt doar ajutoare, nu avertismente pe care vă puteți baza. Lipsa alertelor nu înseamnă niciodată că drumul este liber.';

  @override
  String get safetyWhile3 =>
      'Respectați legile, semnalele și indicatoarele rutiere – nu aplicația – atunci când acestea diferă.';

  @override
  String get safetyLimitsTitle => 'Limitări';

  @override
  String get safetyLimits1 =>
      'O singură cameră de telefon vede doar ce se află în fața ei. Obiectele din afara câmpului vizual, ascunse sau foarte apropiate nu sunt detectate.';

  @override
  String get safetyLimits2 =>
      'Detecțiile pot lipsi, pot fi întârziate sau greșite, mai ales noaptea, pe ploaie, ceață, în condiții de lumină orbitoare sau cu parbrizul murdar.';

  @override
  String get safetyLimits3 =>
      'Sunt recunoscute doar categoriile acceptate: vehicule, autobuze, motociclete, biciclete, persoane, semafoare și indicatoare Stop. Liniile de bandă din vizualizarea virtuală sunt stilizate, nu benzi detectate.';

  @override
  String get safetyLimits4 =>
      'Proximitatea este afișată ca zone aproximative (Foarte aproape, Aproape, Mediu, Departe), niciodată ca distanțe măsurate. Vizualizarea de parcare nu înlocuiește senzorii de parcare.';

  @override
  String get safetyHeatTitle => 'Căldură și baterie';

  @override
  String get safetyHeat1 =>
      'Utilizarea continuă a camerei și a IA încălzește iPhone-ul. Corvista reduce ritmul de analiză când dispozitivul se încinge și afișează un avertisment; dacă iOS se supraîncălzește, camera se poate opri.';

  @override
  String get safetyEmergencyTitle => 'Funcția de urgență';

  @override
  String get safetyEmergency1 =>
      'Detectarea unui posibil impact este experimentală. Poate rata accidente reale și poate fi declanșată de alte evenimente.';

  @override
  String get safetyEmergency2 =>
      'Nu contactează niciodată pe nimeni în tăcere: iOS cere întotdeauna confirmarea pentru un apel sau un mesaj. Nu înlocuiește apelarea serviciilor de urgență de către dumneavoastră.';

  @override
  String get privacyTitle => 'Confidențialitate';

  @override
  String get privacyIntro =>
      'Corvista este creată pentru a păstra datele dumneavoastră de condus pe iPhone. Nu există cont Corvista, iar Corvista nu operează servere proprii.';

  @override
  String get privacyCameraTitle => 'Cameră și IA';

  @override
  String get privacyCamera1 =>
      'Detectarea, urmărirea și segmentarea obiectelor rulează integral pe iPhone. Cadrele camerei nu sunt încărcate niciodată.';

  @override
  String get privacyCamera2 =>
      'Camera funcționează doar cât timp Corvista este deschisă pe ecran. Se oprește când aplicația trece în fundal – nu există înregistrare ascunsă în fundal.';

  @override
  String get privacyRecordingsTitle => 'Înregistrări';

  @override
  String get privacyRecordings1 =>
      'Bufferul continuu este temporar și este suprascris permanent. Imaginile sunt păstrate doar când atingeți Salvează incidentul sau, dacă activați opțiunea, după un posibil impact.';

  @override
  String get privacyRecordings2 =>
      'Clipurile salvate rămân în spațiul privat de stocare al Corvista de pe iPhone. Părăsesc dispozitivul doar când alegeți Distribuie. Ștergerea aplicației le șterge.';

  @override
  String get privacyRecordings3 =>
      'Sunetul este înregistrat doar dacă îl activați și acordați accesul la microfon.';

  @override
  String get privacyLocationTitle => 'Locație';

  @override
  String get privacyLocation1 =>
      'Locația este folosită cât timp aplicația este deschisă, pentru viteză, hartă, trasee și vreme. Dacă „Salvează locația” este activată, poziția din momentul salvării este stocată împreună cu clipul pe dispozitivul dumneavoastră.';

  @override
  String get privacyNetworkTitle => 'Servicii de rețea';

  @override
  String get privacyNetwork1 =>
      'Apple Maps – afișarea hărții, căutarea locurilor și traseele. Textul căutat și locația aproximativă sunt trimise către Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) – vremea curentă și orară pentru locația dumneavoastră.';

  @override
  String get privacyNetwork4 =>
      'Corvista nu include publicitate și nici analiză sau urmărire din partea terților.';

  @override
  String get privacyEmergencyTitle => 'Contacte de urgență';

  @override
  String get privacyEmergency1 =>
      'Contactele alese de dumneavoastră sunt stocate în Keychain-ul iOS de pe acest dispozitiv. Anularea prin voce folosește recunoașterea vocală pe dispozitiv, acolo unde este disponibilă. Apelurile și mesajele sunt trimise doar după ce le confirmați în iOS.';

  @override
  String get privacyControlsTitle => 'Controlul dumneavoastră';

  @override
  String get privacyControls1 =>
      'Puteți șterge clipuri oricând din Clipuri și puteți modifica sau revoca accesul la cameră, microfon, locație și recunoaștere vocală în Setările iOS.';

  @override
  String get termsTitle => 'Termeni de utilizare';

  @override
  String get termsIntro =>
      'Prin utilizarea Corvista, acceptați acești termeni. Se aplică și Acordul de licență pentru utilizatorul final al aplicației licențiate (Licensed Application End User License Agreement) standard Apple.';

  @override
  String get termsUseTitle => 'Utilizarea Corvista';

  @override
  String get termsUse1 =>
      'Corvista este un ajutor pentru atenția la condus și pentru dashcam. Rămâneți în orice moment pe deplin responsabil pentru conducerea în siguranță și în conformitate cu legea.';

  @override
  String get termsUse2 =>
      'Nu folosiți aplicația în moduri care vă distrag atenția în timpul condusului. Fixați dispozitivul în siguranță și legal.';

  @override
  String get termsAccuracyTitle => 'Fără garanții de acuratețe';

  @override
  String get termsAccuracy1 =>
      'Detecțiile, zonele, alertele, marcajele de pe hartă, traseele și vremea pot fi incomplete, întârziate sau greșite. Corvista nu controlează vehiculul dumneavoastră.';

  @override
  String get termsAccuracy2 =>
      'Funcția de urgență este experimentală și poate să nu detecteze un impact sau poate fi declanșată fals.';

  @override
  String get termsRecordingTitle => 'Legi privind înregistrarea';

  @override
  String get termsRecording1 =>
      'Legile privind camerele auto, înregistrarea audio și filmarea persoanelor diferă în funcție de țară și regiune. Sunteți responsabil pentru respectarea lor, inclusiv atunci când distribuiți clipuri.';

  @override
  String get termsLiabilityTitle => 'Răspundere';

  @override
  String get termsLiability1 =>
      'Aplicația este furnizată „ca atare”. În măsura permisă de lege, dezvoltatorul nu este răspunzător pentru accidente, pierderi, amenzi sau daune rezultate din utilizarea sa sau din încrederea în rezultatele sale.';

  @override
  String get termsChangesTitle => 'Modificări';

  @override
  String get termsChanges1 =>
      'Acești termeni pot fi actualizați odată cu versiunile noi ale aplicației. Continuarea utilizării după o actualizare înseamnă că acceptați termenii revizuiți.';

  @override
  String get helpTitle => 'Ajutor';

  @override
  String get helpIntro =>
      'Răspunsuri la întrebări frecvente. Pentru recomandări de siguranță, consultați Informații de siguranță.';

  @override
  String get helpQSave => 'Cum păstrez imaginile unui incident?';

  @override
  String get helpASaveBuffer =>
      'Atingeți butonul mare Salvează incidentul din vizualizarea de condus. Corvista salvează ultimele 20 sau 30 de secunde din bufferul continuu (alegerea dvs. în Setări › Înregistrare) în Clipuri.';

  @override
  String get helpQWhere => 'Unde sunt stocate clipurile mele?';

  @override
  String get helpAWhere =>
      'În spațiul privat de stocare al Corvista de pe iPhone. Nu sunt încărcate niciodată. Folosiți Distribuie în player pentru a trimite sau exporta un clip.';

  @override
  String get helpQZones => 'Cât de precise sunt zonele de proximitate?';

  @override
  String get helpAZones =>
      'Zonele sunt estimări aproximative făcute de o singură cameră, pe baza dimensiunilor tipice ale obiectelor. Considerați-le indicii aproximative, niciodată distanțe.';

  @override
  String get helpQSlow => 'De ce încetinește detecția?';

  @override
  String get helpASlow =>
      'Când iPhone-ul se încălzește, bateria este scăzută sau modul Consum redus este activat, Corvista reduce ritmul de analiză pentru a proteja dispozitivul. Puteți schimba modul de energie în Setări.';

  @override
  String get helpQMap => 'Harta, căutarea sau vremea nu funcționează.';

  @override
  String get helpAMap =>
      'Aceste funcții necesită conexiune la internet și acces la locație. Verificați conexiunea și permiteți accesul Corvista la locație în Setările iOS.';

  @override
  String get helpQSimulator => 'Camera apare ca indisponibilă.';

  @override
  String get helpASimulator =>
      'Asigurați-vă că accesul la cameră este permis în Setările iOS și că nicio altă aplicație nu folosește camera. Pe iOS Simulator nu există cameră; în schimb se poate folosi un videoclip de test local.';

  @override
  String get emergencyMsgNoContacts =>
      'Adăugați mai întâi un contact de urgență.';

  @override
  String get cameraStarting => 'Se pornește camera…';

  @override
  String get cameraInterrupted => 'Cameră în pauză';

  @override
  String get cameraInterruptedBody =>
      'iOS a întrerupt camera, de exemplu în timpul unui apel sau când o folosește altă aplicație. Își reia automat funcționarea.';

  @override
  String get cameraUnavailable => 'Cameră indisponibilă';

  @override
  String get cameraUnavailableBody =>
      'Pe acest dispozitiv nu este disponibilă nicio cameră. Vizualizările de detecție, înregistrare și parcare necesită camera din spate.';

  @override
  String get cameraRunTestFootage => 'Rulează înregistrarea de test';

  @override
  String get cameraPermissionDenied => 'Accesul la cameră este dezactivat';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista are nevoie de cameră pentru detecție, înregistrare dashcam și vizualizările de parcare. Activați accesul la cameră în Setări.';

  @override
  String get cameraError => 'Eroare cameră';

  @override
  String get cameraStopped => 'Cameră oprită';

  @override
  String get cameraStart => 'Pornește camera';

  @override
  String get cameraFocusHint => 'Atingeți pentru focalizare';

  @override
  String get cameraPreviewLabel =>
      'Vizualizare live a camerei cu obiectele detectate';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Cameră $fps fps · IA $hz Hz · $ms ms · pierdute $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Viteză $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Fără viteză GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Direcție $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Înregistrare buffer dashcam, $seconds din $target secunde în buffer';
  }

  @override
  String get hudRecIdle => 'REC oprit';

  @override
  String get hudRecSaving => 'Se salvează…';

  @override
  String get hudRecError => 'Eroare REC';

  @override
  String get hudAiPaused => 'IA în pauză';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de obiecte',
      few: '$count obiecte',
      one: '1 obiect',
      zero: 'Niciun obiect',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de obiecte detectate',
      few: '$count obiecte detectate',
      one: '1 obiect detectat',
      zero: 'niciun obiect detectat',
    );
    return 'Model IA $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Fierbinte – IA încetinită';

  @override
  String get hudThermalCritical => 'Prea fierbinte – IA în pauză';

  @override
  String hudBatteryLow(String percent) {
    return 'Baterie $percent';
  }

  @override
  String get hudLowPower => 'Mod Consum redus';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Vreme $temperature, $condition. Atingeți pentru detalii.';
  }

  @override
  String get hudNoGuidance =>
      'Căutați o destinație în vizualizarea Hartă pentru a vedea aici indicațiile pas cu pas.';

  @override
  String get navArrived => 'Ați ajuns la destinație';

  @override
  String get navRerouting => 'Se recalculează traseul…';

  @override
  String get navSearchHint => 'Căutați destinația';

  @override
  String get navSearchFieldHint => 'Adresă, loc sau firmă';

  @override
  String get navNoResults => 'Niciun loc corespunzător';

  @override
  String get navSearching => 'Se caută…';

  @override
  String get navSearchStartTyping =>
      'Introduceți o adresă sau un nume de loc. Rezultatele provin din Apple Maps și necesită conexiune la internet.';

  @override
  String get navErrorUnavailable =>
      'Căutarea și traseele sunt indisponibile – verificați conexiunea la internet.';

  @override
  String get navErrorNoLocation =>
      'Se așteaptă locația dumneavoastră pentru a planifica un traseu.';

  @override
  String get navErrorPermission =>
      'Accesul la locație este dezactivat, deci traseele nu pot începe din poziția dumneavoastră.';

  @override
  String navErrorGeneric(String code) {
    return 'Traseele nu au putut fi încărcate ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Trasee către $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Sosire $time';
  }

  @override
  String get navStart => 'Start';

  @override
  String get navEnd => 'Încheie';

  @override
  String get navEndLabel => 'Încheie navigarea';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration rămase';
  }

  @override
  String navAdvisory(String text) {
    return 'Avertisment: $text';
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
    return 'Traseul $index: $name';
  }

  @override
  String get weatherTitle => 'Vreme';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Se simt ca $temperature';
  }

  @override
  String get weatherPrecipitation => 'Precipitații';

  @override
  String get weatherWind => 'Vânt';

  @override
  String get weatherVisibility => 'Vizibilitate';

  @override
  String get weatherHumidity => 'Umiditate';

  @override
  String get weatherHourly => 'Următoarele ore';

  @override
  String weatherAsOf(String time) {
    return 'Actualizat $time';
  }

  @override
  String get weatherRefresh => 'Actualizează vremea';

  @override
  String get weatherUnavailable => 'Vremea nu este disponibilă momentan.';

  @override
  String get weatherNoLocation => 'Vremea necesită locația dumneavoastră.';

  @override
  String get weatherLegal => 'Surse de date și informații legale';

  @override
  String weatherProvidedBy(String service) {
    return 'Date meteo: $service';
  }

  @override
  String get weatherNow => 'Acum';

  @override
  String get virtualEmpty => 'Nu au fost detectate obiecte acceptate';

  @override
  String get virtualEmptyCameraOff =>
      'Vizualizarea virtuală necesită camera live.';

  @override
  String get virtualLaneDisclaimer =>
      'Liniile de bandă sunt ilustrative, nu detectate.';

  @override
  String virtualNearest(String zone) {
    return 'Cel mai apropiat: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Scenă rutieră virtuală: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'IA $status';
  }

  @override
  String get virtualStatusLive => 'activă';

  @override
  String get virtualStatusPaused => 'în pauză';

  @override
  String get virtualStatusCameraOff => 'Cameră oprită';

  @override
  String get virtualStatusTestFootage => 'Înregistrare de test';

  @override
  String get virtualEmptyHint =>
      'Vehiculele, persoanele, bicicletele, semafoarele și indicatoarele Stop apar aici când sunt detectate.';

  @override
  String get mapRecenter => 'Recentrează';

  @override
  String get mapZoomIn => 'Mărește';

  @override
  String get mapZoomOut => 'Micșorează';

  @override
  String get mapUnsupported => 'Harta interactivă este disponibilă pe iPhone.';

  @override
  String get mapObjectsApprox =>
      'Marcajele obiectelor sunt poziții aproximative.';

  @override
  String get mapWeatherUnavailable => 'Vreme indisponibilă';

  @override
  String get navErrorNoRoute =>
      'Nu a fost găsit niciun traseu către această destinație.';

  @override
  String get navDismiss => 'Închide';

  @override
  String get navGo => 'Pornește';

  @override
  String get navFastest => 'Cel mai rapid';

  @override
  String get navThen => 'Apoi';

  @override
  String get navRecents => 'Recente';

  @override
  String get navClearRecents => 'Șterge';

  @override
  String get navSearchSubmitHint =>
      'Apăsați Căutare pentru a vedea toate locurile corespunzătoare';

  @override
  String get navPlaces => 'Locuri';

  @override
  String get navEtaLabel => 'sosire';

  @override
  String get navTimeLeftLabel => 'rămas';

  @override
  String get navOverview => 'Prezentare generală';

  @override
  String get navMute => 'Dezactivează vocea';

  @override
  String get navUnmute => 'Activează vocea';

  @override
  String get navEndConfirm => 'Încheiați navigarea?';

  @override
  String navEndConfirmBody(String place) {
    return 'Ghidarea către $place se va opri.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Ați ajuns la $place';
  }

  @override
  String get navDone => 'Gata';

  @override
  String get navWeakGps => 'Semnal GPS slab';

  @override
  String get navLocationOff =>
      'Locația este dezactivată. Activați-o pentru a planifica trasee și a naviga.';

  @override
  String get navVoiceGuidance => 'Ghidare vocală';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Peste $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, apoi $second';
  }

  @override
  String get navSpeakRerouting => 'Se recalculează traseul';

  @override
  String get navSpeakArrived => 'Ați ajuns la destinație';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de metri',
      few: '$count metri',
      one: '1 metru',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilometri',
      one: '1 kilometru',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de picioare',
      few: '$count picioare',
      one: '1 picior',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de yarzi',
      few: '$count yarzi',
      one: '1 yard',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Continuați pe o distanță de $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Indicațiile nu sunt disponibile pentru acest traseu în această regiune. Încercați o altă destinație.';

  @override
  String navContinueFor(String distance) {
    return 'Continuați pe o distanță de $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value mile',
      one: '1 milă',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Cel mai apropiat: $object · $zone';
  }

  @override
  String get parkingNothing => 'Nimic detectat în câmpul vizual';

  @override
  String get parkingBeeps => 'Semnale sonore de proximitate';

  @override
  String get parkingVolume => 'Volumul semnalului sonor';

  @override
  String get parkingLimitations =>
      'O singură cameră, nu 360°. Obiectele din afara câmpului vizual al camerei nu sunt detectate. Nu înlocuiește senzorii de parcare; estimările pot fi greșite, iar lipsa semnalelor nu înseamnă că zona este liberă.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Vizualizare de proximitate de sus. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Original';

  @override
  String get perceptionModeBoxes => 'Casete';

  @override
  String get perceptionModeMasks => 'Măști de obiecte';

  @override
  String get perceptionModeRoad => 'Suprafața drumului';

  @override
  String get perceptionModeCombined => 'Combinat';

  @override
  String get perceptionOpacity => 'Opacitatea măștii';

  @override
  String get perceptionDisclaimer =>
      'Masca suprafeței drumului este un strat vizual aproximativ. Nu indică spațiul pe care se poate circula și nici benzile.';

  @override
  String get perceptionNeedsModel =>
      'Selectați modelul Segmentare pentru a vedea măștile.';

  @override
  String get perceptionChooseModel => 'Alege modelul';

  @override
  String get perceptionWaiting => 'Se așteaptă primul cadru de segmentare…';

  @override
  String get perceptionShortCamera => 'Cameră';

  @override
  String get perceptionShortBoxes => 'Casete';

  @override
  String get perceptionShortObjects => 'Obiecte';

  @override
  String get perceptionShortRoad => 'Drum';

  @override
  String get perceptionShortAll => 'Toate';

  @override
  String get perceptionModesLabel => 'Straturi de percepție';

  @override
  String get perceptionStatusWarmingUp => 'Se încălzește…';

  @override
  String get perceptionStatusLoadingModel => 'Se încarcă modelul…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Măști în pauză';

  @override
  String get perceptionLegend => 'Legenda măștilor';

  @override
  String get perceptionUnavailable => 'Măști indisponibile';

  @override
  String get driveSave => 'Salvează';

  @override
  String get driveSaveIncident => 'Salvează incidentul';

  @override
  String driveSaveHint(int seconds) {
    return 'Salvează ultimele $seconds secunde de imagini dashcam';
  }

  @override
  String get driveSaving => 'Se salvează incidentul…';

  @override
  String hudRecManualLabel(String time) {
    return 'Se înregistrează, $time';
  }

  @override
  String get driveRecord => 'Înregistrează';

  @override
  String get driveRecordStartA11y => 'Începe înregistrarea';

  @override
  String driveRecordStopA11y(String time) {
    return 'Oprește înregistrarea, $time înregistrat';
  }

  @override
  String get driveRecordHint =>
      'Înregistrează continuu până o opriți, inclusiv ultimele 5 secunde';

  @override
  String get driveRecordFailed => 'Nu s-a putut porni înregistrarea';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Înregistrare salvată · $count de părți',
      few: 'Înregistrare salvată · $count părți',
      one: 'Înregistrare salvată',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage':
          'Înregistrarea s-a oprit: spațiul de stocare este aproape plin',
      'max_duration': 'Înregistrarea s-a oprit: s-a atins durata maximă',
      'camera_stopped': 'Înregistrarea s-a oprit odată cu camera',
      'background': 'Înregistrarea s-a oprit: aplicația a trecut în fundal',
      'thermal': 'Înregistrarea s-a oprit: telefonul este prea fierbinte',
      'other': 'Înregistrarea s-a oprit',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Incident salvat · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Vezi';

  @override
  String get driveSaveFailed => 'Incidentul nu a putut fi salvat.';

  @override
  String get driveSaveNotRunning =>
      'Înregistrarea nu a început încă – așteptați pornirea camerei, apoi încercați din nou.';

  @override
  String get driveSaveTestFootage =>
      'Înregistrarea de test nu este salvată. Salvarea incidentelor funcționează cu camera live.';

  @override
  String get driveSaveStorageFull =>
      'iPhone-ul nu mai are spațiu de stocare. Eliberați spațiu sau ștergeți clipuri mai vechi.';

  @override
  String get driveSaveIoError =>
      'Clipul nu a putut fi scris în spațiul de stocare.';

  @override
  String get driveClips => 'Clipuri';

  @override
  String get driveSettings => 'Setări';

  @override
  String get driveViewSwitcher => 'Vizualizări de condus';

  @override
  String get driveLocationDenied =>
      'Locația este dezactivată – viteza, hărțile și traseele sunt indisponibile.';

  @override
  String get driveCameraDenied =>
      'Accesul la cameră este dezactivat – detecția și înregistrarea sunt indisponibile.';

  @override
  String get driveRecorderFallback =>
      'Înregistrare fără sunet: accesul la microfon este dezactivat.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Setările de înregistrare au fost ajustate: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhone-ul este fierbinte. IA rulează mai lent pentru a se răci – țineți-l ferit de soarele direct și aproape de o gură de aerisire.';

  @override
  String get drivePowerThermalCritical =>
      'iPhone-ul este prea fierbinte. Detecția IA este oprită până se răcește; înregistrarea continuă dacă este posibil.';

  @override
  String get drivePowerLowPower =>
      'Modul Consum redus este activat – IA rulează într-un ritm redus.';

  @override
  String get drivePowerBatteryLow =>
      'Bateria este scăzută – conectați iPhone-ul la o sursă de alimentare în timp ce conduceți.';

  @override
  String get onboardingTitle1 => 'Vedeți mai mult la fiecare drum.';

  @override
  String get onboardingBody1 =>
      'Transformați-vă iPhone-ul într-un dashcam inteligent și un însoțitor pentru atenția la condus.';

  @override
  String get onboardingTitle2 => 'Inteligență în fiecare cadru.';

  @override
  String get onboardingBody2 =>
      'Recunoașteți vehiculele, persoanele, bicicletele și semnalele rutiere acceptate direct pe iPhone.';

  @override
  String get onboardingTitle3 => 'Un singur drum. Mai multe perspective.';

  @override
  String get onboardingBody3 =>
      'Comutați între detecția live, vizualizările virtuale de condus, hărțile interactive și vizualizarea de parcare.';

  @override
  String get onboardingTitle4 => 'Păstrați momentele care contează.';

  @override
  String get onboardingBody4 =>
      'Salvați imagini dashcam recente, revizuiți incidente și distribuiți înregistrări.';

  @override
  String get onboardingTitle5 => 'Siguranță și confidențialitate';

  @override
  String get onboardingSafety1 =>
      'Corvista este un ajutor pentru atenția la condus. Țineți ochii pe drum.';

  @override
  String get onboardingSafety2 =>
      'Nu controlează vehiculul dumneavoastră și nu vă înlocuiește discernământul.';

  @override
  String get onboardingSafety3 =>
      'Detecțiile și estimările pot fi inexacte sau pot lipsi.';

  @override
  String get onboardingSafety4 =>
      'Procesarea imaginii camerei se face pe iPhone – videoclipul nu este încărcat.';

  @override
  String get onboardingSafety5 =>
      'Hărțile, căutarea, traseele și vremea necesită conexiune la internet.';

  @override
  String get onboardingSafety6 =>
      'Fixați iPhone-ul ferm, astfel încât să nu vă blocheze vizibilitatea.';

  @override
  String get onboardingSafety7 =>
      'Finalizați configurarea înainte de a începe să conduceți.';

  @override
  String get onboardingAcknowledge =>
      'Înțeleg că Corvista este un ajutor pentru atenție și că rămân responsabil pentru conducerea în siguranță.';

  @override
  String get onboardingReadSafety =>
      'Citiți informațiile complete de siguranță';

  @override
  String get onboardingNext => 'Înainte';

  @override
  String get onboardingSkip => 'Omite';

  @override
  String get onboardingAgree => 'Continuă';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Pagina $current din $total';
  }

  @override
  String get permTitle => 'Permisiuni';

  @override
  String get permIntro =>
      'Corvista cere doar ce are nevoie fiecare funcție. Le puteți modifica oricând în Setări.';

  @override
  String get permCameraTitle => 'Cameră';

  @override
  String get permCameraBody =>
      'Necesară pentru detecție, înregistrare dashcam și vizualizarea de parcare. Videoclipul este procesat pe iPhone.';

  @override
  String get permLocationTitle => 'Locație';

  @override
  String get permLocationBody =>
      'Folosită pentru viteza GPS, hartă, trasee, vreme și etichetarea clipurilor salvate. Doar cât timp folosiți aplicația.';

  @override
  String get permMicTitle => 'Microfon';

  @override
  String get permSpeechNote =>
      'Recunoașterea vocală este solicitată doar dacă activați anularea prin voce pentru alertele de urgență.';

  @override
  String get permRequired => 'Necesar';

  @override
  String get permOptional => 'Opțional';

  @override
  String get permAllow => 'Permite';

  @override
  String get permGranted => 'Permis';

  @override
  String get permDenied => 'Refuzat';

  @override
  String get permLimited => 'Limitat';

  @override
  String get permRestricted => 'Restricționat';

  @override
  String get permStart => 'Începe să conduci';

  @override
  String get permCameraNeeded =>
      'Puteți continua fără acces la cameră, dar detecția și înregistrarea nu vor funcționa până când îl permiteți în Setări.';

  @override
  String get permSetupIntro =>
      'Corvista are nevoie de acestea pentru a funcționa complet. Atingeți Permite tot, iar iOS vă va cere pe rând fiecare permisiune. Le puteți modifica oricând în Setări.';

  @override
  String get permCameraLine =>
      'Necesară pentru detecție, înregistrare dashcam și vizualizarea de parcare. Videoclipul este procesat pe iPhone, nu este încărcat niciodată.';

  @override
  String get permLocationLine =>
      'Viteză GPS, hartă, trasee, vreme și locul unde au fost salvate clipurile. Doar cât timp folosiți aplicația.';

  @override
  String get permMicLine =>
      'Sunetul din habitaclu în clipurile de incident și recunoașterea frazei de anulare în timpul unei alerte de urgență.';

  @override
  String get permSpeechTitle => 'Recunoaștere vocală';

  @override
  String get permSpeechLine =>
      'Recunoaște fraza de anulare în timpul unei numărători inverse de urgență, pe iPhone, acolo unde este acceptat.';

  @override
  String get permAllowAll => 'Permite tot';

  @override
  String permAsking(String permission) {
    return 'Se solicită $permission…';
  }

  @override
  String get permSomeDenied =>
      'Unele permisiuni sunt dezactivate. Activați-le în Setări pentru a folosi aceste funcții.';

  @override
  String get permNotNow => 'Nu acum';

  @override
  String get tourLabel => 'Prezentarea ecranului de condus';

  @override
  String tourProgress(int current, int total) {
    return 'Pasul $current din $total';
  }

  @override
  String get tourNext => 'Înainte';

  @override
  String get tourBack => 'Înapoi';

  @override
  String get tourSkip => 'Omite prezentarea';

  @override
  String get tourFinish => 'Începe să conduci';

  @override
  String get tourWelcomeTitle => 'Prezentare rapidă';

  @override
  String get tourWelcomeBody =>
      'O privire de un minut asupra a ceea ce contează pe ecranul de condus. Cel mai bine se face în timp ce sunteți parcat.';

  @override
  String get tourHudTitle => 'Banda de instrumente';

  @override
  String get tourHudSpeed => 'Viteza provine de la GPS.';

  @override
  String get tourHudRec => 'REC arată câte secunde de imagini sunt în buffer.';

  @override
  String get tourHudAi =>
      'Indicatorul IA arată modelul, câte obiecte vede și un punct: verde activ, galben limitat, roșu oprit.';

  @override
  String get tourSaveTitle => 'Salvează incidentul';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista păstrează un buffer continuu cu ultimele $seconds secunde de video. Acesta este suprascris permanent, deci nimic nu este păstrat decât dacă atingeți Salvează. Clipurile salvate rămân pe acest iPhone, în Clipuri.';
  }

  @override
  String get tourRecordTitle => 'Înregistrați tot drumul';

  @override
  String get tourRecordBody =>
      'Atingeți Înregistrează pentru a filma continuu până opriți. Drumurile lungi se salvează în părți de 5 minute în Clipuri, iar Salvează incidentul funcționează în continuare cât înregistrați.';

  @override
  String get tourViewsTitle => 'Cinci moduri de a vedea drumul';

  @override
  String get tourViewDetection =>
      'Cameră live cu casete în jurul obiectelor acceptate.';

  @override
  String get tourViewVirtual =>
      'O scenă 3D simplificată, construită din detecții.';

  @override
  String get tourViewMap => 'Apple Maps cu căutare și ghidare pas cu pas.';

  @override
  String get tourViewParking =>
      'Cameră plus o vizualizare de proximitate de sus.';

  @override
  String get tourViewPerception => 'Măști pentru drum și obiecte.';

  @override
  String get tourMapTitle => 'Căutare și ghidare pas cu pas';

  @override
  String get tourMapBody =>
      'Deschideți Harta, atingeți bara de căutare și alegeți o destinație. Alegeți un traseu, apoi atingeți Start pentru ghidarea pas cu pas. Necesită conexiune la internet.';

  @override
  String get tourClipsTitle => 'Clipuri';

  @override
  String get tourClipsBody =>
      'Revizuiți, redenumiți, distribuiți sau ștergeți incidentele salvate. Clipurile rămân pe iPhone, cu excepția cazului în care le distribuiți.';

  @override
  String get tourSettingsTitle => 'Setări';

  @override
  String get tourSettingsBody =>
      'Reglați alertele vocale și sensibilitatea lor, calitatea înregistrării și lungimea bufferului și configurați modul Urgență: o alertă experimentală de impact cu numărătoare inversă de anulare.';

  @override
  String get tourSafetyTitle => 'Înainte de a conduce';

  @override
  String get tourSafety1 =>
      'Fixați iPhone-ul ferm, astfel încât să nu vă blocheze vizibilitatea.';

  @override
  String get tourSafety2 =>
      'Nu folosiți aplicația în timp ce conduceți. Configurați totul în timp ce sunteți parcat.';

  @override
  String get tourSafety3 =>
      'Detecțiile și zonele sunt estimări. Pot fi greșite sau pot lipsi.';

  @override
  String get tourSafety4 =>
      'Rămâneți responsabil pentru conducerea în siguranță.';

  @override
  String get helpTakeTour => 'Urmăriți prezentarea';

  @override
  String get helpTakeTourSub =>
      'O privire ghidată de un minut asupra ecranului de condus.';

  @override
  String get tripsTitle => 'Călătorii';

  @override
  String get tripsOpen => 'Jurnal de călătorii';

  @override
  String get tripsEmptyTitle => 'Încă nu există călătorii';

  @override
  String get tripsEmptyBody =>
      'Călătoriile sunt înregistrate automat cât timp conduceți cu Corvista – distanță, timp, viteză și traseul parcurs.';

  @override
  String get tripsDisabledBody =>
      'Jurnalul de călătorii este dezactivat, deci condusul nou nu este înregistrat. Activați-l pentru a păstra un jurnal privat al traseelor pe acest iPhone.';

  @override
  String get tripsEnable => 'Activează jurnalul de călătorii';

  @override
  String get tripsToday => 'Astăzi';

  @override
  String get tripsYesterday => 'Ieri';

  @override
  String tripsRecordingNow(String distance) {
    return 'Se înregistrează o călătorie · $distance';
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
      other: '$count de incidente',
      few: '$count incidente',
      one: '1 incident',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de alerte',
      few: '$count alerte',
      one: '1 alertă',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de călătorii',
      few: '$count călătorii',
      one: '1 călătorie',
      zero: 'Nicio călătorie',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Distanță';

  @override
  String get tripsStatDuration => 'Durată';

  @override
  String get tripsStatMoving => 'Timp în mișcare';

  @override
  String get tripsStatAvgSpeed => 'Viteză medie';

  @override
  String get tripsStatMaxSpeed => 'Viteză maximă';

  @override
  String get tripsDetections => 'Detecții';

  @override
  String get tripsNoDetections =>
      'Nu au fost înregistrate obiecte rutiere în această călătorie.';

  @override
  String get tripsTimeline => 'Cronologie';

  @override
  String get tripsEventStart => 'Călătorie începută';

  @override
  String get tripsEventEnd => 'Călătorie încheiată';

  @override
  String get tripsEventAlert => 'Alertă vocală';

  @override
  String get tripsEventIncident => 'Clip de incident salvat';

  @override
  String get tripsEventEmergency => 'Posibil accident detectat';

  @override
  String get tripsEventNavStart => 'Navigare începută';

  @override
  String get tripsEventArrive => 'Ajuns la destinație';

  @override
  String get tripsEventReroute => 'Traseu recalculat';

  @override
  String get tripsEventRecording => 'Înregistrare salvată';

  @override
  String get tripsOpenClip => 'Deschide clipul';

  @override
  String get tripsTrackPreview => 'Traseu GPS';

  @override
  String get tripsRenameTitle => 'Redenumiți călătoria';

  @override
  String get tripsRenameHint => 'Numele călătoriei';

  @override
  String get tripsFavorite => 'Adaugă la favorite';

  @override
  String get tripsUnfavorite => 'Elimină din favorite';

  @override
  String get tripsShareGpx => 'Distribuie GPX';

  @override
  String get tripsShareFailed => 'Călătoria nu a putut fi distribuită.';

  @override
  String get tripsDelete => 'Șterge călătoria';

  @override
  String get tripsDeleteConfirmTitle => 'Ștergeți această călătorie?';

  @override
  String get tripsDeleteConfirmBody =>
      'Traseul și statisticile vor fi eliminate de pe acest iPhone. Clipurile de incident din această călătorie sunt păstrate.';

  @override
  String get tripsDeleted => 'Călătorie ștearsă';

  @override
  String get tripsNotFound => 'Această călătorie nu mai este disponibilă.';

  @override
  String get tripsPrivacyNote =>
      'Stocată doar pe acest iPhone. Nimic nu este încărcat.';

  @override
  String get settingsSectionTrips => 'Jurnal de călătorii';

  @override
  String get settingsTripLog => 'Înregistrează călătoriile';

  @override
  String get settingsTripLogSubtitle =>
      'Păstrează traseul și statisticile de condus doar pe acest iPhone.';

  @override
  String get settingsTripRetention => 'Păstrează călătoriile timp de';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days de zile',
      few: '$days zile',
      one: '1 zi',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 an';

  @override
  String get settingsRetentionForever => 'Pentru totdeauna';

  @override
  String get settingsTripRetentionFooter =>
      'Călătoriile mai vechi sunt șterse automat la pornirea Corvista.';

  @override
  String get settingsViewTrips => 'Vezi călătoriile';

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
    return 'Călătorie Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Eliberează spațiu';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Elimină fișierele temporare și memoria cache. Clipurile și călătoriile salvate sunt păstrate.';

  @override
  String settingsFreedBytes(String size) {
    return 'Eliberat: $size';
  }

  @override
  String get settingsNothingToFree =>
      'Memoria cache a fost golită – nu există fișiere temporare de eliminat.';

  @override
  String get settingsSectionPrivacyData => 'Confidențialitate și date';

  @override
  String get settingsPrivacyDataFooter =>
      'Clipurile, călătoriile și setările sunt stocate doar pe acest iPhone. Îl părăsesc doar când alegeți să le distribuiți.';

  @override
  String get settingsDeleteAllData => 'Șterge toate datele';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Șterge clipurile, călătoriile, contactele și setările de pe acest iPhone';

  @override
  String get deleteAllTitle => 'Ștergeți toate datele?';

  @override
  String get deleteAllMessage =>
      'Aceasta elimină definitiv de pe acest iPhone:\n• Clipurile de incident și miniaturile\n• Jurnalul călătoriilor și traseele GPS\n• Contactele de urgență și evenimentele de urgență\n• Jurnalele de detecție și jurnalul de diagnosticare\n• Setările și destinațiile recente\n• Bufferul temporar de înregistrare și memoria cache\n\nAcțiunea nu poate fi anulată. Corvista va porni apoi din nou de la ecranele de bun venit.';

  @override
  String get deleteAllConfirm => 'Șterge tot';

  @override
  String get deleteAllInProgress => 'Se șterge…';

  @override
  String get deleteAllDone => 'Toate datele au fost șterse';

  @override
  String get deleteAllPartial =>
      'Unele elemente nu au putut fi șterse. Încercați din nou din Setări.';

  @override
  String get diagLogSection => 'Jurnal de diagnosticare';

  @override
  String get diagLogFooter =>
      'Erorile sunt înregistrate doar pe acest iPhone, fără locații, nume de contacte sau numere de telefon. Nimic nu este trimis decât dacă distribuiți dvs. jurnalul.';

  @override
  String get diagLogShare => 'Distribuie jurnalul de diagnosticare';

  @override
  String get diagLogEmpty => 'Gol';

  @override
  String get diagLogClear => 'Șterge jurnalul';

  @override
  String get diagLogClearTitle => 'Ștergeți jurnalul de diagnosticare?';

  @override
  String get diagLogClearBody =>
      'Intrările de eroare salvate vor fi șterse de pe acest iPhone.';

  @override
  String get diagLogCleared => 'Jurnalul de diagnosticare a fost șters';

  @override
  String get diagLogShareFailed =>
      'Nu s-a putut distribui jurnalul de diagnosticare.';

  @override
  String get privacyControls2 =>
      'Setări › Confidențialitate și date › Șterge toate datele șterge fiecare clip, călătorie, contact, jurnal și setare stocate de Corvista pe acest iPhone.';

  @override
  String get parkingZoneStop => 'Stop';

  @override
  String get parkingZoneVeryClose => 'Foarte aproape';

  @override
  String get parkingZoneClose => 'Aproape';

  @override
  String get parkingZoneNothingClose => 'Nimic apropiat detectat';

  @override
  String get parkingNotDetected =>
      'Pereții, stâlpii, bornele și bordurile nu sunt detectate';

  @override
  String get parkingApprox => 'aprox.';

  @override
  String get parkingSideLeft => 'Stânga';

  @override
  String get parkingSideCenter => 'Centru';

  @override
  String get parkingSideRight => 'Dreapta';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Doar vizualizarea camerei frontale — nu este un sistem 360°';

  @override
  String get parkingMuteBeeps => 'Dezactivează sunetele';

  @override
  String get parkingUnmuteBeeps => 'Activează sunetele';

  @override
  String get parkingAbout => 'Despre vizualizarea de parcare';

  @override
  String get parkingLimitationsDetail =>
      'Este monitorizată doar zona din fața camerei. Detectorul recunoaște mașini, autobuze și camioane, persoane, biciclete și motociclete. Pereții, stâlpii, bornele, bordurile, barierele și obstacolele joase NU sunt detectate, iar capota poate ascunde solul chiar din față. Distanțele sunt estimări aproximative dintr-o singură cameră (dimensiunea și poziția obiectului) și pot fi foarte greșite. Liniștea sau „Nimic apropiat detectat” nu înseamnă că drumul este liber — priviți întotdeauna în jur și folosiți oglinzile.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Apropiere pe părți: stânga $left, centru $center, dreapta $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Erorile sunt scrise într-un jurnal privat pe acest iPhone (fără locații, nume de contacte sau numere de telefon). Nu este trimis niciodată automat; îl puteți distribui sau șterge în Setări › Diagnosticare.';
}
