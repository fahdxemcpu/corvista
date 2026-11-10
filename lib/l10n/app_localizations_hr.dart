// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Vidite više na svakoj vožnji.';

  @override
  String get commonCancel => 'Odustani';

  @override
  String get commonDelete => 'Izbriši';

  @override
  String get commonSave => 'Spremi';

  @override
  String get commonBack => 'Natrag';

  @override
  String get commonClose => 'Zatvori';

  @override
  String get commonRetry => 'Pokušaj ponovno';

  @override
  String get commonOpenSettings => 'Otvori postavke';

  @override
  String get commonLoading => 'Učitavanje…';

  @override
  String get commonError => 'Nešto je pošlo po zlu.';

  @override
  String commonErrorDetail(String message) {
    return 'Nešto je pošlo po zlu: $message';
  }

  @override
  String get commonOn => 'Uključeno';

  @override
  String get commonOff => 'Isključeno';

  @override
  String get commonRename => 'Preimenuj';

  @override
  String get commonShare => 'Podijeli';

  @override
  String get commonNotAvailable => 'Nije dostupno';

  @override
  String get commonTestFootage => 'TESTNA SNIMKA';

  @override
  String get zoneVeryClose => 'Vrlo blizu';

  @override
  String get zoneClose => 'Blizu';

  @override
  String get zoneMedium => 'Srednje';

  @override
  String get zoneFar => 'Daleko';

  @override
  String get zoneUnknown => 'Nepoznato';

  @override
  String get classPerson => 'Osoba';

  @override
  String get classBicycle => 'Bicikl';

  @override
  String get classMotorcycle => 'Motocikl';

  @override
  String get classCar => 'Vozilo';

  @override
  String get classBus => 'Autobus';

  @override
  String get classTrafficLight => 'Semafor';

  @override
  String get classStopSign => 'Znak stop';

  @override
  String get viewDetection => 'Detekcija';

  @override
  String get viewVirtual => 'Virtualni';

  @override
  String get viewMap => 'Karta';

  @override
  String get viewParking => 'Parkiranje';

  @override
  String get viewPerception => 'Percepcija';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Crveno';

  @override
  String get lightYellow => 'Žuto';

  @override
  String get lightGreen => 'Zeleno';

  @override
  String get lightUnknown => 'Nepoznato';

  @override
  String get clipsTitle => 'Isječci';

  @override
  String get clipsSelect => 'Odaberi';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odabranih',
      few: '$count odabrana',
      one: '$count odabran',
      zero: 'Odaberite isječke',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Odaberi sve';

  @override
  String get clipsDeselectAll => 'Poništi odabir';

  @override
  String get clipsDeleteSelected => 'Izbriši odabrano';

  @override
  String get clipsGridView => 'Prikaz mreže';

  @override
  String get clipsListView => 'Prikaz popisa';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izbrisati $count isječaka?',
      few: 'Izbrisati $count isječka?',
      one: 'Izbrisati ovaj isječak?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Videozapisi se trajno uklanjaju s vašeg iPhonea. Ovo se ne može poništiti.',
      few: 'Videozapisi se trajno uklanjaju s vašeg iPhonea. Ovo se ne može poništiti.',
      one: 'Videozapis se trajno uklanja s vašeg iPhonea. Ovo se ne može poništiti.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izbrisano je $count isječaka',
      few: 'Izbrisana su $count isječka',
      one: 'Isječak je izbrisan',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Još nema isječaka';

  @override
  String get clipsEmptyBody =>
      'Dok vozite, Corvista čuva kratki kružni međuspremnik. Dodirnite Spremi incident da ovdje zadržite zadnjih nekoliko sekundi snimke.';

  @override
  String get clipsLoadError => 'Isječci se nisu mogli učitati.';

  @override
  String get clipsStorageTitle => 'Pohrana';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Isječci $clips · Međuspremnik $buffer · $free slobodno';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count spremljenih isječaka',
      few: '$count spremljena isječka',
      one: '$count spremljeni isječak',
      zero: 'Nema spremljenih isječaka',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Na vašem iPhoneu ponestaje prostora. Spremanje novih incidenata moglo bi ne uspjeti.';

  @override
  String get clipsMissingFile => 'Datoteka nedostaje';

  @override
  String get clipsEmergencyBadge => 'Udar';

  @override
  String clipsUntitled(String date) {
    return 'Incident · $date';
  }

  @override
  String get clipsAudio => 'Zvuk snimljen';

  @override
  String get clipsFavorite => 'Favorit';

  @override
  String get clipsUnfavorite => 'Ukloni iz favorita';

  @override
  String get clipsLocation => 'Lokacija spremljena';

  @override
  String clipsOpenClip(String title) {
    return 'Otvori isječak $title';
  }

  @override
  String get playerNotFoundTitle => 'Isječak nije pronađen';

  @override
  String get playerNotFoundBody => 'Ovaj je isječak možda izbrisan.';

  @override
  String get playerMissingTitle => 'Videodatoteka nedostaje';

  @override
  String get playerMissingBody =>
      'Snimka ovog isječka više nije na vašem iPhoneu. Možete ukloniti unos iz galerije.';

  @override
  String get playerRemoveEntry => 'Ukloni unos';

  @override
  String get playerLoadError => 'Ovaj se videozapis ne može reproducirati.';

  @override
  String get playerPlay => 'Reproduciraj';

  @override
  String get playerPause => 'Pauziraj';

  @override
  String get playerReplay => 'Ponovi';

  @override
  String get playerRenameTitle => 'Preimenuj isječak';

  @override
  String get playerRenameHint => 'Naziv isječka';

  @override
  String get playerRenamed => 'Isječak je preimenovan';

  @override
  String get playerFavorited => 'Dodano u favorite';

  @override
  String get playerUnfavorited => 'Uklonjeno iz favorita';

  @override
  String get playerShareFailed => 'Ovaj se isječak nije mogao podijeliti.';

  @override
  String get playerDetails => 'Pojedinosti';

  @override
  String get playerDate => 'Snimljeno';

  @override
  String get playerDuration => 'Trajanje';

  @override
  String get playerResolution => 'Razlučivost';

  @override
  String get playerSize => 'Veličina datoteke';

  @override
  String get playerAudio => 'Zvuk';

  @override
  String get playerAudioYes => 'Snimljen';

  @override
  String get playerAudioNo => 'Nije snimljen';

  @override
  String get playerReason => 'Spremljeno putem';

  @override
  String get playerReasonManual => 'Gumb Spremi incident';

  @override
  String get playerReasonEmergency => 'Moguća detekcija udara';

  @override
  String get playerReasonRecovered => 'Obnovljeno nakon prekida';

  @override
  String get playerSpeed => 'GPS brzina pri spremanju';

  @override
  String get playerLocation => 'Lokacija';

  @override
  String get playerOpenInMaps => 'Otvori u Kartama';

  @override
  String get playerBack => 'Natrag';

  @override
  String get playerMore => 'Više radnji';

  @override
  String get clipsFilterLabel => 'Prikaži';

  @override
  String get clipsFilterAll => 'Sve';

  @override
  String get clipsFilterRecordings => 'Snimke';

  @override
  String get clipsFilterIncidents => 'Incidenti';

  @override
  String get clipsFilterEmergency => 'Hitni slučajevi';

  @override
  String get clipsFilterFavorites => 'Favoriti';

  @override
  String get clipsSort => 'Sortiraj';

  @override
  String get clipsSortNewest => 'Najnovije prvo';

  @override
  String get clipsSortOldest => 'Najstarije prvo';

  @override
  String get clipsSortLongest => 'Najduže prvo';

  @override
  String get clipsSortLargest => 'Najveće prvo';

  @override
  String get clipsToday => 'Danas';

  @override
  String get clipsYesterday => 'Jučer';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count isječaka',
      few: '$count isječka',
      one: '$count isječak',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'U ovoj kategoriji još nema isječaka.';

  @override
  String get clipsFavoritesEmpty =>
      'Označite isječak zvjezdicom da ga imate ovdje pri ruci.';

  @override
  String get clipsKindRecording => 'Snimka';

  @override
  String get clipsKindIncident => 'Incident';

  @override
  String get clipsKindEmergency => 'Hitni slučaj';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Putovanje · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Otvori putovanje u kojem je ovaj isječak snimljen';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return 'Zauzeto $used · slobodno $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Isječci zauzimaju $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count snimki',
      few: '$count snimke',
      one: '$count snimka',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count incidenata',
      few: '$count incidenta',
      one: '$count incident',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hitnih slučajeva',
      few: '$count hitna slučaja',
      one: '$count hitni slučaj',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Oslobodi prostor';

  @override
  String get clipsStorageLowGentle =>
      'Slobodno je manje od 2 GB. Kako bi snimanje teklo bez problema, oslobodite prostor ili uklonite isječke koji vam više ne trebaju.';

  @override
  String get clipsSaveToPhotos => 'Spremi u Fotografije';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count isječaka',
      few: '$count isječka',
      one: '$count isječak',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izbrisati $count isječaka ($size)?',
      few: 'Izbrisati $count isječka ($size)?',
      one: 'Izbrisati ovaj isječak ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Spremanje $done od $total u Fotografije…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count isječaka spremljeno u Fotografije',
      few: '$count isječka spremljena u Fotografije',
      one: 'Spremljeno u Fotografije',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return 'Spremljeno u Fotografije: $saved · nije moguće spremiti: $failed';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista nema dopuštenje za dodavanje videozapisa u Fotografije. Dopuštenje možete dati u Postavkama.';

  @override
  String get clipsPhotosFailed => 'Spremanje u Fotografije nije uspjelo.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count isječaka dodano u favorite',
      few: '$count isječka dodana u favorite',
      one: 'Dodano u favorite',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count isječaka uklonjeno iz favorita',
      few: '$count isječka uklonjena iz favorita',
      one: 'Uklonjeno iz favorita',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (skraćeno)';
  }

  @override
  String get playerTrim => 'Skrati';

  @override
  String get playerInfo => 'Informacije';

  @override
  String get playerKind => 'Vrsta';

  @override
  String get playerReasonRecording => 'Tipka za snimanje';

  @override
  String get trimTitle => 'Skrati isječak';

  @override
  String get trimHint =>
      'Povucite ručke kako biste odabrali dio koji želite zadržati. Izvorni isječak ostaje nepromijenjen.';

  @override
  String get trimStartHandle => 'Početak isječka';

  @override
  String get trimEndHandle => 'Kraj isječka';

  @override
  String trimSelection(String duration) {
    return 'Odabrano: $duration';
  }

  @override
  String get trimSave => 'Spremi kao novi isječak';

  @override
  String get trimSaving => 'Spremanje skraćenog isječka…';

  @override
  String get trimSaved => 'Skraćeni isječak je spremljen';

  @override
  String get trimOpenNew => 'Otvori';

  @override
  String get trimFailed => 'Isječak nije moguće skratiti.';

  @override
  String get trimStorageFull =>
      'Nema dovoljno slobodnog prostora za spremanje skraćenog isječka.';

  @override
  String get trimPreview => 'Reproduciraj odabir';

  @override
  String get settingsTitle => 'Postavke';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Upozorenja';

  @override
  String get settingsSectionAlertCategories => 'Kategorije upozorenja';

  @override
  String get settingsSectionRecording => 'Snimanje';

  @override
  String get settingsSectionDriving => 'Vožnja';

  @override
  String get settingsSectionPower => 'Napajanje';

  @override
  String get settingsSectionEmergency => 'Hitni slučajevi';

  @override
  String get settingsSectionAppearance => 'Izgled';

  @override
  String get settingsSectionLanguage => 'Jezik';

  @override
  String get settingsSectionInformation => 'Informacije';

  @override
  String get settingsCameraLens => 'Objektiv kamere';

  @override
  String get settingsLensWide => 'Širokokutni';

  @override
  String get settingsLensUltraWide => 'Ultraširokokutni';

  @override
  String get settingsLensTelephoto => 'Teleobjektiv';

  @override
  String get settingsLensUnavailable => 'Nije dostupno na ovom iPhoneu';

  @override
  String get settingsStabilization => 'Stabilizacija';

  @override
  String get settingsStabAuto => 'Automatska';

  @override
  String get settingsStabOff => 'Isključena';

  @override
  String get settingsStabStandard => 'Standardna';

  @override
  String get settingsStabCinematic => 'Filmska';

  @override
  String get settingsOverlayOpacity => 'Neprozirnost preklopa';

  @override
  String get settingsShowFps => 'Prikaži statistiku performansi';

  @override
  String get settingsShowFpsSubtitle =>
      'Brzina sličica i vrijeme obrade u prikazu detekcije';

  @override
  String get settingsCameraFooter =>
      'Promjene objektiva i stabilizacije primjenjuju se pri sljedećem pokretanju kamere.';

  @override
  String get settingsAiModel => 'AI model';

  @override
  String get settingsConfidence => 'Pouzdanost detekcije';

  @override
  String get settingsTracking => 'Praćenje objekata';

  @override
  String get settingsTrackingSubtitle =>
      'Održava objekte stabilnima između sličica';

  @override
  String get settingsShowLabels => 'Prikaži oznake';

  @override
  String get settingsShowConfidence => 'Prikaži pouzdanost';

  @override
  String get settingsSegmentationOpacity => 'Neprozirnost maske percepcije';

  @override
  String get settingsAiFooter =>
      'Niža pouzdanost prikazuje više objekata, ali i više pogrešnih detekcija. Detekcije mogu biti netočne.';

  @override
  String get settingsVoiceAlerts => 'Glasovna upozorenja';

  @override
  String get settingsVoiceLanguage => 'Jezik glasa';

  @override
  String get settingsVoiceLanguageAuto => 'Kao jezik aplikacije';

  @override
  String get settingsVoice => 'Glas';

  @override
  String get settingsVoiceDefault => 'Zadano sustavom';

  @override
  String get settingsVoiceQualityEnhanced => 'Poboljšani';

  @override
  String get settingsVoiceQualityPremium => 'Visoke kvalitete';

  @override
  String get settingsNoVoices =>
      'Za ovaj jezik nije instaliran nijedan glas. Dodajte ga u postavkama iOS-a › Pristupačnost › Izgovoreni sadržaj.';

  @override
  String get settingsAlertPedestrian => 'Pješaci';

  @override
  String get settingsAlertCyclist => 'Biciklisti';

  @override
  String get settingsAlertMotorcycle => 'Motocikli';

  @override
  String get settingsAlertBus => 'Autobusi';

  @override
  String get settingsAlertVehicleClose => 'Vozilo vrlo blizu ispred';

  @override
  String get settingsAlertTrafficLight => 'Promjene semafora';

  @override
  String get settingsAlertTrafficMoving => 'Promet ispred se kreće';

  @override
  String get settingsAlertStopSign => 'Znakovi stop';

  @override
  String get settingsSensitivity => 'Osjetljivost';

  @override
  String get settingsSensitivityLow => 'Niska';

  @override
  String get settingsSensitivityMedium => 'Srednja';

  @override
  String get settingsSensitivityHigh => 'Visoka';

  @override
  String get settingsCooldown => 'Interval ponavljanja';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Glasnoća glasa';

  @override
  String get settingsQuietMode => 'Tihi način';

  @override
  String get settingsQuietModeSubtitle =>
      'Izgovaraju se samo najvažnija upozorenja';

  @override
  String get settingsTestVoice => 'Testiraj glas';

  @override
  String get settingsTestVoiceDone => 'Reproducira se primjer upozorenja…';

  @override
  String get settingsParkingBeeps => 'Zvučni signali pri parkiranju';

  @override
  String get settingsBeepVolume => 'Glasnoća signala';

  @override
  String get settingsAlertsFooter =>
      'Upozorenja su samo pomoć. Uvijek pratite cestu — tišina ne znači da je put slobodan.';

  @override
  String get settingsRecordingProfile => 'Kvaliteta snimanja';

  @override
  String get settingsProfileStandard => 'Standardna · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Međuspremnik incidenta';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds sekundi';
  }

  @override
  String get settingsManualMaxLength => 'Maksimalna duljina ručnog snimanja';

  @override
  String get settingsManualMaxUnlimited => 'Neograničeno';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Snimaj zvuk';

  @override
  String get settingsRecordAudioSubtitle =>
      'Uključuje zvuk iz kabine u spremljenim incidentima';

  @override
  String get settingsMicDenied =>
      'Pristup mikrofonu je isključen. Dopustite ga u Postavkama za snimanje zvuka.';

  @override
  String get settingsWatermark => 'Corvista vodeni žig';

  @override
  String get settingsTimestamp => 'Oznaka datuma i vremena';

  @override
  String get settingsSaveLocation => 'Spremi lokaciju uz isječke';

  @override
  String get settingsStorage => 'Pohrana i isječci';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count isječaka',
      few: '$count isječka',
      one: '$count isječak',
      zero: 'Nema isječaka',
    );
    return '$_temp0 · $used zauzeto · $free slobodno';
  }

  @override
  String get settingsRecordingFooter =>
      'Kružni međuspremnik ostaje na vašem iPhoneu i neprestano se prepisuje. Ništa se ne snima u pozadini.';

  @override
  String get settingsDefaultView => 'Zadani prikaz';

  @override
  String get settingsUnits => 'Mjerne jedinice';

  @override
  String get settingsShowCompass => 'Prikaži kompas';

  @override
  String get settingsHudStyle => 'Stil HUD-a';

  @override
  String get settingsHudCustomize => 'Prilagodi HUD';

  @override
  String get settingsDrivingSide => 'Strana vožnje';

  @override
  String get settingsDrivingSideAuto => 'Automatski';

  @override
  String get settingsDrivingSideRight => 'Desno';

  @override
  String get settingsDrivingSideLeft => 'Lijevo';

  @override
  String get settingsVirtualStyle => 'Stil virtualnog prikaza';

  @override
  String get settingsVirtualMinimal => 'Minimalni';

  @override
  String get settingsVirtualPerspective => 'Perspektiva';

  @override
  String get settingsVirtualHighContrast => 'Visoki kontrast';

  @override
  String get settingsKeepScreenOn => 'Drži zaslon uključenim tijekom vožnje';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Prikaži navigacijske upute na zaključanom zaslonu i u Dynamic Islandu';

  @override
  String get driveRecordingPausedBackground =>
      'Snimanje je pauzirano dok je Corvista bila u pozadini';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Pauzirano';

  @override
  String get liveActivityDashcamOff => 'Kamera isklj.';

  @override
  String get liveActivityEnded => 'Navigacija je završila';

  @override
  String get liveActivityEta => 'Dolazak';

  @override
  String get settingsAutoRecenter => 'Automatsko centriranje karte';

  @override
  String get settingsHudStyleClassic => 'Klasični';

  @override
  String get settingsHudStyleGrid => 'Mreža';

  @override
  String get settingsHudStyleMinimal => 'Minimalni';

  @override
  String get settingsHudStylePerformance => 'Performanse';

  @override
  String get settingsHudStyleNavigation => 'Navigacija';

  @override
  String get settingsHudStyleNight => 'Noćni';

  @override
  String get settingsHudStyleHighContrast => 'Visoki kontrast';

  @override
  String get settingsPowerMode => 'Način napajanja';

  @override
  String get settingsPowerBalanced => 'Uravnotežen';

  @override
  String get settingsPowerPerformance => 'Performanse';

  @override
  String get settingsPowerSaver => 'Štednja';

  @override
  String get settingsPowerFooter =>
      'Corvista automatski smanjuje učestalost AI-ja i vizualne efekte kad se vaš iPhone zagrije ili je baterija slaba.';

  @override
  String get settingsThermal => 'Toplinsko stanje';

  @override
  String get settingsThermalNominal => 'Normalno';

  @override
  String get settingsThermalFair => 'Toplo';

  @override
  String get settingsThermalSerious => 'Vruće';

  @override
  String get settingsThermalCritical => 'Kritično';

  @override
  String get settingsBattery => 'Baterija';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Punjenje';
  }

  @override
  String get settingsLowPowerMode =>
      'Način niske potrošnje je uključen — AI radi smanjenom učestalošću.';

  @override
  String get settingsAiRate => 'Trenutna učestalost AI-ja';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Detekcija udara';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Uključeno · odbrojavanje $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Eksperimentalno. Nije zamjena za hitne službe.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sustav';

  @override
  String get settingsThemeDark => 'Tamna';

  @override
  String get settingsThemeLight => 'Svijetla';

  @override
  String get settingsReduceMotion => 'Smanji kretanje';

  @override
  String get settingsReduceMotionSubtitle =>
      'Smanjuje animacije u cijeloj aplikaciji';

  @override
  String get settingsAppLanguage => 'Jezik aplikacije';

  @override
  String get settingsPrivacyPolicy => 'Pravila privatnosti';

  @override
  String get settingsTerms => 'Uvjeti korištenja';

  @override
  String get settingsHelp => 'Pomoć';

  @override
  String get settingsSupport => 'Kontaktiraj podršku';

  @override
  String get settingsLicenses => 'Licencije otvorenog koda';

  @override
  String get settingsSupportUnavailable =>
      'Mail se nije mogao otvoriti. Pišite na support@corvista.app.';

  @override
  String get settingsSafety => 'Sigurnosne informacije';

  @override
  String get settingsDiagnostics => 'Dijagnostika';

  @override
  String get settingsVersion => 'Verzija';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Prilagodi HUD';

  @override
  String get hudCustomPreview => 'Pregled · primjeri vrijednosti';

  @override
  String get hudCustomStyle => 'Stil';

  @override
  String get hudCustomElements => 'Elementi';

  @override
  String get hudCustomSpeed => 'Brzina';

  @override
  String get hudCustomHeading => 'Smjer i kompas';

  @override
  String get hudCustomClock => 'Sat';

  @override
  String get hudCustomBattery => 'Baterija i temperatura';

  @override
  String get hudCustomDetections => 'Status AI-ja i detekcije';

  @override
  String get hudCustomWeather => 'Vrijeme';

  @override
  String get hudCustomAppearance => 'Veličina i neprozirnost';

  @override
  String get hudCustomSize => 'Veličina';

  @override
  String get hudCustomOpacity => 'Neprozirnost';

  @override
  String get hudCustomFooter =>
      'Upozorenja poput pregrijavanja uvijek se prikazuju, čak i kad su elementi skriveni.';

  @override
  String get hudCustomDescClassic => 'Uravnotežena ploča s instrumentima';

  @override
  String get hudCustomDescGrid => 'Perspektivna mreža iznad ceste';

  @override
  String get hudCustomDescMinimal => 'Samo brzina, ništa drugo';

  @override
  String get hudCustomDescPerformance => 'Luk brzine s očitanjima uživo';

  @override
  String get hudCustomDescNavigation => 'Najprije sljedeći manevar';

  @override
  String get hudCustomDescNight => 'Prigušen i crvenkast za noćnu vožnju';

  @override
  String get hudCustomDescHighContrast =>
      'Maksimalna čitljivost na jakom suncu';

  @override
  String get languageTitle => 'Jezik';

  @override
  String get languageSystem => 'Zadano sustavom';

  @override
  String get languageSystemSubtitle => 'Prati jezik vašeg iPhonea';

  @override
  String get languageFooter =>
      'Stižu i drugi jezici. Jezik glasovnih upozorenja može se postaviti zasebno u Upozorenjima.';

  @override
  String get diagTitle => 'Dijagnostika';

  @override
  String get diagPerformance => 'Performanse';

  @override
  String get diagInference => 'Vrijeme obrade';

  @override
  String get diagDetectHz => 'Učestalost detekcije';

  @override
  String get diagCameraFps => 'Brzina sličica kamere';

  @override
  String get diagMemory => 'Memorija';

  @override
  String get diagDropped => 'Izgubljene sličice';

  @override
  String get diagSegmentation => 'Vrijeme segmentacije';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Status';

  @override
  String get diagSource => 'Izvor';

  @override
  String get diagSourceCamera => 'Kamera uživo';

  @override
  String get diagSourceFile => 'Testna videodatoteka';

  @override
  String get diagResolution => 'Veličina međuspremnika';

  @override
  String get diagLens => 'Objektiv';

  @override
  String get diagError => 'Zadnja pogreška';

  @override
  String get diagModel => 'AI model';

  @override
  String get diagModelLoad => 'Vrijeme učitavanja modela';

  @override
  String get diagPower => 'Napajanje';

  @override
  String get diagSegHz => 'Učestalost segmentacije';

  @override
  String get diagReduced => 'Smanjeni efekti';

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
  String get diagCamIdle => 'Neaktivna';

  @override
  String get diagCamStarting => 'Pokretanje';

  @override
  String get diagCamRunning => 'Radi';

  @override
  String get diagCamInterrupted => 'Prekinuta';

  @override
  String get diagCamStopped => 'Zaustavljena';

  @override
  String get diagCamUnavailable => 'Nedostupna';

  @override
  String get diagCamPermissionDenied => 'Dopuštenje odbijeno';

  @override
  String get diagCamError => 'Pogreška';

  @override
  String get diagTestFootage => 'Testna snimka';

  @override
  String get diagTestFootageBody =>
      'Pokrenite stvarnu detekciju na uređaju na lokalnoj videodatoteci umjesto kamere. Svaki prikaz to označava kao TESTNA SNIMKA.';

  @override
  String get diagPathLabel => 'Putanja videodatoteke';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Koristi Documents/test_drive.mp4';

  @override
  String get diagRun => 'Pokreni testnu snimku';

  @override
  String get diagRunStarted =>
      'Testna snimka je pokrenuta. Otvorite prikaz vožnje da je vidite.';

  @override
  String get diagBackToCamera => 'Povratak na kameru uživo';

  @override
  String get diagDebugOnly =>
      'Testna snimka dostupna je samo u razvojnim verzijama.';

  @override
  String get diagFileMissing => 'Na toj putanji ne postoji datoteka.';

  @override
  String get emergencySetupTitle => 'Detekcija udara';

  @override
  String get emergencyExperimental => 'Eksperimentalno';

  @override
  String get emergencyIntro =>
      'Tijekom vožnje Corvista može pratiti mogući teški udar pomoću senzora kretanja vašeg iPhonea. Ako se udar otkrije, počinje odbrojavanje. Ako ga ne otkažete, Corvista nudi poziv hitnim službama i slanje poruke vašim kontaktima.';

  @override
  String get emergencyDisclaimer1 =>
      'Nije zamjena za hitne službe niti za sustav otkrivanja sudara samog vozila.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS uvijek traži potvrdu prije upućivanja poziva ili slanja poruke.';

  @override
  String get emergencyDisclaimer3 =>
      'Udari mogu proći neprimijećeno, a naglo kočenje ili neravnine mogu se zamijeniti za udar.';

  @override
  String get emergencyParkedWarning =>
      'Dovršite ovo postavljanje dok je vozilo parkirano. Postavke su zaključane dok se vozilo kreće.';

  @override
  String get emergencyEnable => 'Uključi detekciju udara';

  @override
  String get emergencyEnableSubtitle => 'Aktivno samo tijekom vožnje';

  @override
  String get emergencyNeedNumber => 'Najprije dodajte broj za hitne slučajeve.';

  @override
  String get emergencyContacts => 'Kontakti za hitne slučajeve';

  @override
  String get emergencyAddContact => 'Dodaj kontakt';

  @override
  String get emergencyNoContacts =>
      'Još nema kontakata. Kontakti primaju poruku tek nakon što je potvrdite.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Ukloniti kontakt $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Neće se nuditi kao primatelj nakon udara.';

  @override
  String get emergencyRemove => 'Ukloni';

  @override
  String get emergencyContactsError => 'Kontakti se nisu mogli učitati.';

  @override
  String get emergencyNumber => 'Broj za hitne slučajeve';

  @override
  String get emergencyNumberHint => 'npr. 112 ili 911';

  @override
  String get emergencyMessage => 'Predložak poruke';

  @override
  String get emergencyMessageDefault =>
      'Možda sam sudjelovao/la u prometnoj nesreći. Ovu poruku pripremila je Corvista i uključuje moju posljednju poznatu lokaciju, ako je dostupna.';

  @override
  String get emergencyMessageHint => 'Ostavite prazno za zadanu poruku.';

  @override
  String get emergencyCountdown => 'Trajanje odbrojavanja';

  @override
  String get emergencyVoiceCancel => 'Otkazivanje glasom';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Recite „U redu sam“ ili „Odustani“ tijekom odbrojavanja. Koristi prepoznavanje govora na uređaju gdje je dostupno.';

  @override
  String get emergencyVoicePermDenied =>
      'Za otkazivanje glasom potreban je pristup mikrofonu i prepoznavanju govora.';

  @override
  String get emergencyAutoSave => 'Automatski spremi isječak incidenta';

  @override
  String get emergencyTest => 'Testiraj odbrojavanje (bez poziva)';

  @override
  String get emergencyTestBody =>
      'Pokreće simulirani udar kako biste vidjeli odbrojavanje. U testnom načinu nikada se ne upućuje poziv niti šalje poruka.';

  @override
  String get emergencyNotSet => 'Nije postavljeno';

  @override
  String get emergencyAlertHeadline => 'Otkriven je mogući teški udar.';

  @override
  String get emergencyAlertSubtitle => 'Jeste li dobro?';

  @override
  String get emergencyAlertCancel => 'U redu sam — Odustani';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Preostalo je $seconds sekundi',
      few: 'Preostale su $seconds sekunde',
      one: 'Preostala je $seconds sekunda',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Slušam — recite „U redu sam“ za otkazivanje';

  @override
  String emergencyAlertHeard(String text) {
    return 'Čuo sam: „$text“';
  }

  @override
  String get emergencyAlertEscalated => 'Nema odgovora. Odaberite što učiniti:';

  @override
  String get emergencyAlertCall => 'Pozovi hitne službe';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Poziva $number. iOS traži potvrdu.';
  }

  @override
  String get emergencyAlertMessage => 'Pošalji poruku kontaktima';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Otvara pripremljenu poruku. Vi odlučujete hoćete li je poslati.';

  @override
  String get emergencyAlertTestMode => 'Testni način — poziv neće biti upućen';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'U redu sam — Zatvori';

  @override
  String get emergencyMsgSent => 'Poruka je poslana.';

  @override
  String get emergencyMsgCancelled => 'Poruka nije poslana.';

  @override
  String get emergencyMsgFailed => 'Poruka se nije mogla poslati.';

  @override
  String get emergencyMsgUnavailable =>
      'Slanje poruka nije dostupno na ovom uređaju.';

  @override
  String emergencyCallFailed(String number) {
    return 'Poziv se nije mogao pokrenuti. Nazovite $number sami.';
  }

  @override
  String get modelsTitle => 'AI modeli';

  @override
  String get modelsIntro =>
      'Svi su modeli ugrađeni u aplikaciju i rade isključivo na vašem iPhoneu. Slika s vaše kamere nikada ne napušta uređaj.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Uživo: $ms ms po sličici · $hz detekcija/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Učitano za $ms ms';
  }

  @override
  String get modelsEfficientName => 'Učinkovit';

  @override
  String get modelsEfficientDesc =>
      'Brz, kompaktan detektor prilagođen dugim vožnjama uz nisko zagrijavanje i potrošnju baterije.';

  @override
  String get modelsEnhancedName => 'Poboljšani';

  @override
  String get modelsEnhancedDesc =>
      'Veći detektor koji pronalazi manje i udaljenije objekte, uz veću potrošnju energije.';

  @override
  String get modelsSegmentationName => 'Segmentacija';

  @override
  String get modelsSegmentationDesc =>
      'Spaja brzu detekciju s maskama kolnika i objekata za prikaz Percepcije.';

  @override
  String get modelsNoneName => 'AI pauziran';

  @override
  String get modelsNoneDesc =>
      'Kamera i snimanje rade dalje bez detekcije objekata. Najniža potrošnja energije.';

  @override
  String get modelsGenericDesc => 'Model za detekciju objekata na uređaju.';

  @override
  String get modelsFunctionDetection =>
      'Otkriva vozila, ljude, bicikle, motocikle, autobuse, semafore i znakove stop';

  @override
  String get modelsFunctionSegmentation => 'Dodaje maske kolnika i objekata';

  @override
  String get modelsFunctionNone => 'Bez detekcije; samo snimanje autokamerom';

  @override
  String get modelsSize => 'Veličina';

  @override
  String get modelsInput => 'Ulaz';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Radi s';

  @override
  String get modelsStatusInstalled => 'Instalirano (ugrađeno)';

  @override
  String get modelsStatusNotInstalled => 'Nije instalirano';

  @override
  String get modelsSelected => 'Odabrano';

  @override
  String get modelsUse => 'Koristi ovaj model';

  @override
  String get modelsSwitching => 'Učitavanje modela…';

  @override
  String modelsSwitched(String name) {
    return 'Model $name sada je aktivan';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Izmjereno na ovom uređaju: prosječno $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Nije izmjereno na ovom uređaju';

  @override
  String get modelsBenchmarkRun => 'Pokreni test performansi';

  @override
  String get modelsBenchmarkRunning => 'Testiranje performansi…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Odaberite ovaj model da biste ga testirali.';

  @override
  String get modelsBenchmarkDone => 'Test performansi je dovršen';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Test performansi nije uspio: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Zadnje ažuriranje: $date';
  }

  @override
  String get safetyTitle => 'Sigurnosne informacije';

  @override
  String get safetyIntro =>
      'Corvista je pomoć za svjesnost u vožnji. Ne upravlja vašim vozilom i ne može zamijeniti vašu pažnju, prosudbu ni sigurnosne sustave vozila.';

  @override
  String get safetyBeforeTitle => 'Prije vožnje';

  @override
  String get safetyBefore1 =>
      'Čvrsto postavite iPhone na dopušteno mjesto koje ne zaklanja pogled, zračne jastuke ni upravljačke elemente.';

  @override
  String get safetyBefore2 =>
      'Dovršite postavljanje, odaberite prikaz i unesite odredište dok je vozilo parkirano.';

  @override
  String get safetyBefore3 =>
      'Za dulje vožnje priključite punjač i, ako je moguće, držite telefon podalje od izravnog sunca.';

  @override
  String get safetyWhileTitle => 'Tijekom vožnje';

  @override
  String get safetyWhile1 =>
      'Držite pogled na cesti. Velike kontrole na zaslonu koristite samo kad je to sigurno i dopušteno.';

  @override
  String get safetyWhile2 =>
      'Upozorenja su pomoć, a ne upozorenja na koja se možete osloniti. Tišina nikada ne znači da je cesta slobodna.';

  @override
  String get safetyWhile3 =>
      'Slijedite prometne propise, signale i prometne znakove — a ne aplikaciju — kad se ne slažu.';

  @override
  String get safetyLimitsTitle => 'Ograničenja';

  @override
  String get safetyLimits1 =>
      'Kamera jednog telefona vidi samo ono što je ispred nje. Objekti izvan vidnog polja, skriveni ili vrlo blizu ne otkrivaju se.';

  @override
  String get safetyLimits2 =>
      'Detekcije mogu izostati, kasniti ili biti pogrešne, osobito noću, po kiši, magli, odsjaju ili uz prljavo vjetrobransko staklo.';

  @override
  String get safetyLimits3 =>
      'Prepoznaju se samo podržane kategorije: vozila, autobusi, motocikli, bicikli, ljudi, semafori i znakovi stop. Naznake traka u virtualnom prikazu stilizirane su, a ne otkrivene trake.';

  @override
  String get safetyLimits4 =>
      'Blizina se prikazuje kao približne zone (Vrlo blizu, Blizu, Srednje, Daleko), nikada kao izmjerene udaljenosti. Prikaz parkiranja nije zamjena za parkirne senzore.';

  @override
  String get safetyHeatTitle => 'Toplina i baterija';

  @override
  String get safetyHeat1 =>
      'Neprekidno korištenje kamere i AI-ja zagrijava vaš iPhone. Corvista smanjuje učestalost analize kad se uređaj zagrije i prikazuje upozorenje; ako se iOS pregrije, kamera se može zaustaviti.';

  @override
  String get safetyEmergencyTitle => 'Značajka za hitne slučajeve';

  @override
  String get safetyEmergency1 =>
      'Detekcija mogućeg udara je eksperimentalna. Može propustiti stvarne sudare, a mogu je pokrenuti i drugi događaji.';

  @override
  String get safetyEmergency2 =>
      'Nikada nikoga ne kontaktira bez vašeg znanja: iOS uvijek traži potvrdu poziva ili poruke. Nije zamjena za to da sami nazovete hitne službe.';

  @override
  String get privacyTitle => 'Privatnost';

  @override
  String get privacyIntro =>
      'Corvista je osmišljena tako da vaši podaci o vožnji ostanu na vašem iPhoneu. Ne postoji Corvista račun, a Corvista ne pokreće vlastite poslužitelje.';

  @override
  String get privacyCameraTitle => 'Kamera i AI';

  @override
  String get privacyCamera1 =>
      'Detekcija, praćenje i segmentacija objekata odvijaju se isključivo na vašem iPhoneu. Sličice s kamere nikada se ne šalju.';

  @override
  String get privacyCamera2 =>
      'Kamera radi samo dok je Corvista otvorena na zaslonu. Zaustavlja se kad aplikacija ode u pozadinu — nema skrivenog snimanja u pozadini.';

  @override
  String get privacyRecordingsTitle => 'Snimke';

  @override
  String get privacyRecordings1 =>
      'Kružni međuspremnik je privremen i neprestano se prepisuje. Snimka se zadržava samo kad dodirnete Spremi incident ili, ako to uključite, nakon mogućeg udara.';

  @override
  String get privacyRecordings2 =>
      'Spremljeni isječci ostaju u privatnoj pohrani aplikacije Corvista na vašem iPhoneu. Uređaj napuštaju samo kad odaberete Podijeli. Brisanjem aplikacije brišu se i oni.';

  @override
  String get privacyRecordings3 =>
      'Zvuk se snima samo ako ga uključite i odobrite pristup mikrofonu.';

  @override
  String get privacyLocationTitle => 'Lokacija';

  @override
  String get privacyLocation1 =>
      'Lokacija se koristi dok je aplikacija otvorena za brzinu, kartu, rute i vrijeme. Ako je uključeno „Spremi lokaciju“, položaj u trenutku spremanja pohranjuje se uz isječak na vašem uređaju.';

  @override
  String get privacyNetworkTitle => 'Mrežne usluge';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — prikaz karte, pretraživanje mjesta i rute. Vaš tekst pretraživanja i približna lokacija šalju se Appleu.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — trenutačno i satno vrijeme za vašu lokaciju.';

  @override
  String get privacyNetwork4 =>
      'Corvista ne sadrži oglase ni analitiku ili praćenje trećih strana.';

  @override
  String get privacyEmergencyTitle => 'Kontakti za hitne slučajeve';

  @override
  String get privacyEmergency1 =>
      'Kontakti koje odaberete pohranjuju se u iOS Keychain na ovom uređaju. Otkazivanje glasom koristi prepoznavanje govora na uređaju gdje je dostupno. Pozivi i poruke šalju se tek nakon što ih potvrdite u iOS-u.';

  @override
  String get privacyControlsTitle => 'Vaše kontrole';

  @override
  String get privacyControls1 =>
      'Isječke možete izbrisati u bilo kojem trenutku u odjeljku Isječci te promijeniti ili opozvati pristup kameri, mikrofonu, lokaciji i govoru u postavkama iOS-a.';

  @override
  String get termsTitle => 'Uvjeti korištenja';

  @override
  String get termsIntro =>
      'Korištenjem aplikacije Corvista prihvaćate ove uvjete. Primjenjuje se i Appleov standardni Ugovor s krajnjim korisnikom licencirane aplikacije.';

  @override
  String get termsUseTitle => 'Korištenje aplikacije Corvista';

  @override
  String get termsUse1 =>
      'Corvista je pomoć za svjesnost u vožnji i autokamera. Vi u svakom trenutku ostajete u potpunosti odgovorni za sigurnu i zakonitu vožnju.';

  @override
  String get termsUse2 =>
      'Ne koristite aplikaciju na načine koji vam odvlače pažnju tijekom vožnje. Uređaj postavite čvrsto i zakonito.';

  @override
  String get termsAccuracyTitle => 'Bez jamstva točnosti';

  @override
  String get termsAccuracy1 =>
      'Detekcije, zone, upozorenja, oznake na karti, rute i vrijeme mogu biti nepotpuni, zakašnjeli ili pogrešni. Corvista ne upravlja vašim vozilom.';

  @override
  String get termsAccuracy2 =>
      'Značajka za hitne slučajeve je eksperimentalna i može ne otkriti udar ili se pokrenuti pogrešno.';

  @override
  String get termsRecordingTitle => 'Zakoni o snimanju';

  @override
  String get termsRecording1 =>
      'Zakoni o autokamerama, snimanju zvuka i snimanju osoba razlikuju se po državama i regijama. Vi ste odgovorni za njihovo poštivanje, uključujući kad dijelite isječke.';

  @override
  String get termsLiabilityTitle => 'Odgovornost';

  @override
  String get termsLiability1 =>
      'Aplikacija se pruža „kakva jest“. U mjeri dopuštenoj zakonom, programer ne odgovara za nesreće, gubitke, kazne ili štetu nastalu njezinim korištenjem ili oslanjanjem na njezine rezultate.';

  @override
  String get termsChangesTitle => 'Izmjene';

  @override
  String get termsChanges1 =>
      'Ovi se uvjeti mogu ažurirati s novim verzijama aplikacije. Nastavak korištenja nakon ažuriranja znači da prihvaćate izmijenjene uvjete.';

  @override
  String get helpTitle => 'Pomoć';

  @override
  String get helpIntro =>
      'Odgovori na uobičajena pitanja. Za sigurnosne smjernice pogledajte Sigurnosne informacije.';

  @override
  String get helpQSave => 'Kako zadržati snimku incidenta?';

  @override
  String get helpASaveBuffer =>
      'Dodirnite veliku tipku Spremi incident u prikazu vožnje. Corvista u Isječke sprema posljednjih 20 ili 30 sekundi svojeg kružnog međuspremnika (odabirete u Postavke › Snimanje).';

  @override
  String get helpQWhere => 'Gdje se pohranjuju moji isječci?';

  @override
  String get helpAWhere =>
      'U privatnoj pohrani aplikacije Corvista na vašem iPhoneu. Nikada se ne šalju na internet. Pomoću Podijeli u playeru pošaljite ili izvezite isječak.';

  @override
  String get helpQZones => 'Koliko su točne zone blizine?';

  @override
  String get helpAZones =>
      'Zone su grube procjene s jedne kamere na temelju tipičnih veličina objekata. Shvatite ih kao približne naznake, nikada kao udaljenosti.';

  @override
  String get helpQSlow => 'Zašto se detekcija usporava?';

  @override
  String get helpASlow =>
      'Kad se iPhone zagrije, baterija je slaba ili je uključen način niske potrošnje, Corvista smanjuje učestalost analize radi zaštite uređaja. Način napajanja možete promijeniti u Postavkama.';

  @override
  String get helpQMap => 'Karta, pretraživanje ili vrijeme ne rade.';

  @override
  String get helpAMap =>
      'Ove značajke zahtijevaju internetsku vezu i pristup lokaciji. Provjerite vezu i dopustite lokaciju za Corvistu u postavkama iOS-a.';

  @override
  String get helpQSimulator => 'Kamera se prikazuje kao nedostupna.';

  @override
  String get helpASimulator =>
      'Provjerite je li pristup kameri dopušten u postavkama iOS-a i koristi li kameru neka druga aplikacija. U iOS Simulatoru nema kamere; umjesto nje može se koristiti lokalni testni videozapis.';

  @override
  String get emergencyMsgNoContacts =>
      'Najprije dodajte kontakt za hitne slučajeve.';

  @override
  String get cameraStarting => 'Pokretanje kamere…';

  @override
  String get cameraInterrupted => 'Kamera je pauzirana';

  @override
  String get cameraInterruptedBody =>
      'iOS je pauzirao kameru, na primjer tijekom poziva ili dok je koristi druga aplikacija. Nastavit će automatski.';

  @override
  String get cameraUnavailable => 'Kamera nije dostupna';

  @override
  String get cameraUnavailableBody =>
      'Na ovom uređaju nije dostupna nijedna kamera. Prikazi detekcije, snimanja i parkiranja zahtijevaju stražnju kameru.';

  @override
  String get cameraRunTestFootage => 'Pokreni testnu snimku';

  @override
  String get cameraPermissionDenied => 'Pristup kameri je isključen';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvisti je kamera potrebna za detekciju, snimanje autokamerom i prikaze parkiranja. Uključite pristup kameri u Postavkama.';

  @override
  String get cameraError => 'Pogreška kamere';

  @override
  String get cameraStopped => 'Kamera je zaustavljena';

  @override
  String get cameraStart => 'Pokreni kameru';

  @override
  String get cameraFocusHint => 'Dodirnite za fokus';

  @override
  String get cameraPreviewLabel => 'Prikaz kamere uživo s otkrivenim objektima';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · AI $hz Hz · $ms ms · izgubljeno $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Brzina $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Nema GPS brzine';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Smjer $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Snimanje međuspremnika autokamere, $seconds od $target sekundi u međuspremniku';
  }

  @override
  String get hudRecIdle => 'REC isklj.';

  @override
  String get hudRecSaving => 'Spremanje…';

  @override
  String get hudRecError => 'Pogreška REC-a';

  @override
  String get hudAiPaused => 'AI pauziran';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objekata',
      few: '$count objekta',
      one: '$count objekt',
      zero: 'Nema objekata',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'otkriveno $count objekata',
      few: 'otkrivena $count objekta',
      one: 'otkriven $count objekt',
      zero: 'nema otkrivenih objekata',
    );
    return 'AI model $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Vruće — AI usporen';

  @override
  String get hudThermalCritical => 'Pretoplo — AI pauziran';

  @override
  String hudBatteryLow(String percent) {
    return 'Baterija $percent';
  }

  @override
  String get hudLowPower => 'Način niske potrošnje';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Vrijeme $temperature, $condition. Dodirnite za pojedinosti.';
  }

  @override
  String get hudNoGuidance =>
      'Potražite odredište u prikazu Karte da biste ovdje vidjeli navigacijske upute.';

  @override
  String get navArrived => 'Stigli ste';

  @override
  String get navRerouting => 'Ponovno izračunavanje rute…';

  @override
  String get navSearchHint => 'Traži odredište';

  @override
  String get navSearchFieldHint => 'Adresa, mjesto ili tvrtka';

  @override
  String get navNoResults => 'Nema odgovarajućih mjesta';

  @override
  String get navSearching => 'Pretraživanje…';

  @override
  String get navSearchStartTyping =>
      'Upišite adresu ili naziv mjesta. Rezultati dolaze iz Apple Maps i zahtijevaju internetsku vezu.';

  @override
  String get navErrorUnavailable =>
      'Pretraživanje i rute nisu dostupni — provjerite internetsku vezu.';

  @override
  String get navErrorNoLocation => 'Čeka se vaša lokacija za planiranje rute.';

  @override
  String get navErrorPermission =>
      'Pristup lokaciji je isključen pa rute ne mogu započeti s vašeg položaja.';

  @override
  String navErrorGeneric(String code) {
    return 'Rute se nisu mogle učitati ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Rute do odredišta $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Dolazak $time';
  }

  @override
  String get navStart => 'Kreni';

  @override
  String get navEnd => 'Završi';

  @override
  String get navEndLabel => 'Završi navigaciju';

  @override
  String navRemaining(String distance, String duration) {
    return 'Preostalo $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Obavijest: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min',
      one: '$minutes min',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Ruta $index: $name';
  }

  @override
  String get weatherTitle => 'Vrijeme';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Osjeća se kao $temperature';
  }

  @override
  String get weatherPrecipitation => 'Oborine';

  @override
  String get weatherWind => 'Vjetar';

  @override
  String get weatherVisibility => 'Vidljivost';

  @override
  String get weatherHumidity => 'Vlažnost';

  @override
  String get weatherHourly => 'Sljedećih sati';

  @override
  String weatherAsOf(String time) {
    return 'Ažurirano $time';
  }

  @override
  String get weatherRefresh => 'Osvježi vrijeme';

  @override
  String get weatherUnavailable => 'Vrijeme trenutačno nije dostupno.';

  @override
  String get weatherNoLocation =>
      'Za vremensku prognozu potrebna je vaša lokacija.';

  @override
  String get weatherLegal => 'Izvori podataka i pravne informacije';

  @override
  String weatherProvidedBy(String service) {
    return 'Podaci o vremenu: $service';
  }

  @override
  String get weatherNow => 'Sada';

  @override
  String get virtualEmpty => 'Nisu otkriveni podržani objekti';

  @override
  String get virtualEmptyCameraOff =>
      'Virtualni prikaz zahtijeva kameru uživo.';

  @override
  String get virtualLaneDisclaimer =>
      'Linije traka su ilustrativne, nisu otkrivene.';

  @override
  String virtualNearest(String zone) {
    return 'Najbliže: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtualna prometna scena: $summary';
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
  String get virtualStatusLive => 'uživo';

  @override
  String get virtualStatusPaused => 'pauziran';

  @override
  String get virtualStatusCameraOff => 'Kamera isklj.';

  @override
  String get virtualStatusTestFootage => 'Testna snimka';

  @override
  String get virtualEmptyHint =>
      'Vozila, ljudi, bicikli, semafori i znakovi stop pojavljuju se ovdje kad se otkriju.';

  @override
  String get mapRecenter => 'Centriraj';

  @override
  String get mapZoomIn => 'Povećaj';

  @override
  String get mapZoomOut => 'Smanji';

  @override
  String get mapUnsupported => 'Interaktivna karta dostupna je na iPhoneu.';

  @override
  String get mapObjectsApprox => 'Oznake objekata približni su položaji.';

  @override
  String get mapWeatherUnavailable => 'Vrijeme nije dostupno';

  @override
  String get navErrorNoRoute => 'Nije pronađena ruta do ovog odredišta.';

  @override
  String get navDismiss => 'Odbaci';

  @override
  String get navGo => 'Kreni';

  @override
  String get navFastest => 'Najbrža';

  @override
  String get navThen => 'Zatim';

  @override
  String get navRecents => 'Nedavno';

  @override
  String get navClearRecents => 'Očisti';

  @override
  String get navSearchSubmitHint =>
      'Pritisnite Traži za prikaz svih odgovarajućih mjesta';

  @override
  String get navPlaces => 'Mjesta';

  @override
  String get navEtaLabel => 'dolazak';

  @override
  String get navTimeLeftLabel => 'preostalo';

  @override
  String get navOverview => 'Pregled';

  @override
  String get navMute => 'Isključi glas';

  @override
  String get navUnmute => 'Uključi glas';

  @override
  String get navEndConfirm => 'Završiti navigaciju?';

  @override
  String navEndConfirmBody(String place) {
    return 'Vođenje do odredišta $place bit će zaustavljeno.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Stigli ste na odredište $place';
  }

  @override
  String get navDone => 'Gotovo';

  @override
  String get navWeakGps => 'Slab GPS signal';

  @override
  String get navLocationOff =>
      'Lokacija je isključena. Uključite je za planiranje ruta i navigaciju.';

  @override
  String get navVoiceGuidance => 'Glasovno vođenje';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Za $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, zatim $second';
  }

  @override
  String get navSpeakRerouting => 'Ponovno izračunavanje rute';

  @override
  String get navSpeakArrived => 'Stigli ste na odredište';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metara',
      few: '$count metra',
      one: '$count metar',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilometara',
      few: '$value kilometra',
      one: '$value kilometar',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stopa',
      few: '$count stope',
      one: '$count stopu',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jardi',
      few: '$count jarda',
      one: '$count jard',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Nastavite $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Upute za ovo putovanje nisu dostupne u ovoj regiji. Pokušajte s drugim odredištem.';

  @override
  String navContinueFor(String distance) {
    return 'Nastavite $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value milja',
      few: '$value milje',
      one: '$value milju',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Najbliže: $object · $zone';
  }

  @override
  String get parkingNothing => 'Ništa nije otkriveno u prikazu';

  @override
  String get parkingBeeps => 'Signali blizine';

  @override
  String get parkingVolume => 'Glasnoća signala';

  @override
  String get parkingLimitations =>
      'Jedna kamera, ne 360°. Objekti izvan prikaza kamere ne otkrivaju se. Nije zamjena za parkirne senzore; procjene mogu biti pogrešne, a tišina ne znači da je prostor slobodan.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Prikaz blizine odozgo. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Izvorno';

  @override
  String get perceptionModeBoxes => 'Okviri';

  @override
  String get perceptionModeMasks => 'Maske objekata';

  @override
  String get perceptionModeRoad => 'Površina ceste';

  @override
  String get perceptionModeCombined => 'Kombinirano';

  @override
  String get perceptionOpacity => 'Neprozirnost maske';

  @override
  String get perceptionDisclaimer =>
      'Maska površine ceste približan je vizualni sloj. Ne prikazuje prohodni prostor niti trake.';

  @override
  String get perceptionNeedsModel =>
      'Odaberite model Segmentacija za prikaz maski.';

  @override
  String get perceptionChooseModel => 'Odaberi model';

  @override
  String get perceptionWaiting => 'Čeka se prva sličica segmentacije…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Okviri';

  @override
  String get perceptionShortObjects => 'Objekti';

  @override
  String get perceptionShortRoad => 'Cesta';

  @override
  String get perceptionShortAll => 'Sve';

  @override
  String get perceptionModesLabel => 'Slojevi percepcije';

  @override
  String get perceptionStatusWarmingUp => 'Priprema…';

  @override
  String get perceptionStatusLoadingModel => 'Učitavanje modela…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Maske pauzirane';

  @override
  String get perceptionLegend => 'Legenda maski';

  @override
  String get perceptionUnavailable => 'Maske nisu dostupne';

  @override
  String get driveSave => 'Spremi';

  @override
  String get driveSaveIncident => 'Spremi incident';

  @override
  String driveSaveHint(int seconds) {
    return 'Sprema zadnjih $seconds sekundi snimke autokamere';
  }

  @override
  String get driveSaving => 'Spremanje incidenta…';

  @override
  String hudRecManualLabel(String time) {
    return 'Snimanje, $time';
  }

  @override
  String get driveRecord => 'Snimaj';

  @override
  String get driveRecordStartA11y => 'Započni snimanje';

  @override
  String driveRecordStopA11y(String time) {
    return 'Zaustavi snimanje, snimljeno $time';
  }

  @override
  String get driveRecordHint =>
      'Snima neprekidno dok ne zaustavite, uključujući posljednjih 5 sekundi';

  @override
  String get driveRecordFailed => 'Snimanje nije moguće započeti';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Snimka je spremljena · $count dijelova',
      few: 'Snimka je spremljena · $count dijela',
      one: 'Snimka je spremljena',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Snimanje je zaustavljeno: pohrana je gotovo puna',
      'max_duration':
          'Snimanje je zaustavljeno: dosegnuta je maksimalna duljina',
      'camera_stopped': 'Snimanje je zaustavljeno zajedno s kamerom',
      'background': 'Snimanje je zaustavljeno: aplikacija je otišla u pozadinu',
      'thermal': 'Snimanje je zaustavljeno: telefon je prevruć',
      'other': 'Snimanje je zaustavljeno',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Incident je spremljen · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Prikaži';

  @override
  String get driveSaveFailed => 'Incident se nije mogao spremiti.';

  @override
  String get driveSaveNotRunning =>
      'Snimanje još nije počelo — pričekajte da se kamera pokrene pa pokušajte ponovno.';

  @override
  String get driveSaveTestFootage =>
      'Testna snimka se ne snima. Spremanje incidenata radi s kamerom uživo.';

  @override
  String get driveSaveStorageFull =>
      'Vašem iPhoneu je ponestalo prostora. Oslobodite prostor ili izbrišite starije isječke.';

  @override
  String get driveSaveIoError => 'Isječak se nije mogao zapisati u pohranu.';

  @override
  String get driveClips => 'Isječci';

  @override
  String get driveSettings => 'Postavke';

  @override
  String get driveViewSwitcher => 'Prikazi vožnje';

  @override
  String get driveLocationDenied =>
      'Lokacija je isključena — brzina, karte i rute nisu dostupni.';

  @override
  String get driveCameraDenied =>
      'Pristup kameri je isključen — detekcija i snimanje nisu dostupni.';

  @override
  String get driveRecorderFallback =>
      'Snimanje bez zvuka: pristup mikrofonu je isključen.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Postavke snimanja su prilagođene: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Vaš je iPhone vruć. AI radi sporije radi hlađenja — držite ga podalje od izravnog sunca i blizu ventilacijskog otvora.';

  @override
  String get drivePowerThermalCritical =>
      'Vaš je iPhone previše vruć. AI detekcija je pauzirana dok se ne ohladi; snimanje se nastavlja ako je moguće.';

  @override
  String get drivePowerLowPower =>
      'Način niske potrošnje je uključen — AI radi smanjenom učestalošću.';

  @override
  String get drivePowerBatteryLow =>
      'Baterija je slaba — priključite iPhone na napajanje tijekom vožnje.';

  @override
  String get onboardingTitle1 => 'Vidite više na svakoj vožnji.';

  @override
  String get onboardingBody1 =>
      'Pretvorite svoj iPhone u inteligentnu autokameru i suputnika za svjesnost u vožnji.';

  @override
  String get onboardingTitle2 => 'Inteligencija u svakoj sličici.';

  @override
  String get onboardingBody2 =>
      'Prepoznajte podržana vozila, ljude, bicikle i prometne signale izravno na svom iPhoneu.';

  @override
  String get onboardingTitle3 => 'Jedna cesta. Više perspektiva.';

  @override
  String get onboardingBody3 =>
      'Prebacujte se između detekcije uživo, virtualnih prikaza vožnje, interaktivnih karata i vizualizacije parkiranja.';

  @override
  String get onboardingTitle4 => 'Zadržite važne trenutke.';

  @override
  String get onboardingBody4 =>
      'Spremite nedavnu snimku autokamere, pregledajte incidente i podijelite snimke.';

  @override
  String get onboardingTitle5 => 'Sigurnost i privatnost';

  @override
  String get onboardingSafety1 =>
      'Corvista je pomoć za svjesnost u vožnji. Držite pogled na cesti.';

  @override
  String get onboardingSafety2 =>
      'Ne upravlja vašim vozilom niti zamjenjuje vašu prosudbu.';

  @override
  String get onboardingSafety3 =>
      'Detekcije i procjene mogu biti netočne ili propuštene.';

  @override
  String get onboardingSafety4 =>
      'Obrada kamere odvija se na vašem iPhoneu — video se ne šalje.';

  @override
  String get onboardingSafety5 =>
      'Karte, pretraživanje, rute i vrijeme zahtijevaju internetsku vezu.';

  @override
  String get onboardingSafety6 =>
      'Čvrsto postavite iPhone tako da ne zaklanja pogled.';

  @override
  String get onboardingSafety7 => 'Dovršite postavljanje prije početka vožnje.';

  @override
  String get onboardingAcknowledge =>
      'Razumijem da je Corvista pomoć za svjesnost te da ostajem odgovoran/na za sigurnu vožnju.';

  @override
  String get onboardingReadSafety => 'Pročitaj sve sigurnosne informacije';

  @override
  String get onboardingNext => 'Dalje';

  @override
  String get onboardingSkip => 'Preskoči';

  @override
  String get onboardingAgree => 'Nastavi';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Stranica $current od $total';
  }

  @override
  String get permTitle => 'Dopuštenja';

  @override
  String get permIntro =>
      'Corvista traži samo ono što je potrebno svakoj značajki. Možete ih promijeniti u bilo kojem trenutku u Postavkama.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Potrebna za detekciju, snimanje autokamerom i prikaz parkiranja. Video se obrađuje na vašem iPhoneu.';

  @override
  String get permLocationTitle => 'Lokacija';

  @override
  String get permLocationBody =>
      'Koristi se za GPS brzinu, kartu, rute, vrijeme i označavanje spremljenih isječaka. Samo dok koristite aplikaciju.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'Prepoznavanje govora traži se samo ako uključite otkazivanje glasom za hitna upozorenja.';

  @override
  String get permRequired => 'Obavezno';

  @override
  String get permOptional => 'Neobavezno';

  @override
  String get permAllow => 'Dopusti';

  @override
  String get permGranted => 'Dopušteno';

  @override
  String get permDenied => 'Odbijeno';

  @override
  String get permLimited => 'Ograničeno';

  @override
  String get permRestricted => 'Ograničeno sustavom';

  @override
  String get permStart => 'Kreni voziti';

  @override
  String get permCameraNeeded =>
      'Možete nastaviti bez pristupa kameri, ali detekcija i snimanje neće raditi dok ga ne dopustite u Postavkama.';

  @override
  String get permSetupIntro =>
      'Corvista ih treba za potpun rad. Dodirnite Dopusti sve i iOS će tražiti svako redom. Možete ih promijeniti u bilo kojem trenutku u Postavkama.';

  @override
  String get permCameraLine =>
      'Potrebna za detekciju, snimanje autokamerom i prikaz parkiranja. Video se obrađuje na vašem iPhoneu i nikada se ne šalje.';

  @override
  String get permLocationLine =>
      'GPS brzina, karta, rute, vrijeme i mjesto gdje su isječci spremljeni. Samo dok koristite aplikaciju.';

  @override
  String get permMicLine =>
      'Zvuk iz kabine u isječcima incidenata i prepoznavanje vaše fraze za otkazivanje tijekom hitnog upozorenja.';

  @override
  String get permSpeechTitle => 'Prepoznavanje govora';

  @override
  String get permSpeechLine =>
      'Prepoznaje vašu frazu za otkazivanje tijekom hitnog odbrojavanja, na vašem iPhoneu gdje je podržano.';

  @override
  String get permAllowAll => 'Dopusti sve';

  @override
  String permAsking(String permission) {
    return 'Traži se dopuštenje: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Neka su dopuštenja isključena. Uključite ih u Postavkama za korištenje tih značajki.';

  @override
  String get permNotNow => 'Ne sada';

  @override
  String get tourLabel => 'Obilazak zaslona vožnje';

  @override
  String tourProgress(int current, int total) {
    return 'Korak $current od $total';
  }

  @override
  String get tourNext => 'Dalje';

  @override
  String get tourBack => 'Natrag';

  @override
  String get tourSkip => 'Preskoči obilazak';

  @override
  String get tourFinish => 'Kreni voziti';

  @override
  String get tourWelcomeTitle => 'Vaš kratki obilazak';

  @override
  String get tourWelcomeBody =>
      'Jednominutni pregled onoga što je važno na zaslonu vožnje. Najbolje dok je vozilo parkirano.';

  @override
  String get tourHudTitle => 'Vaša instrumentna traka';

  @override
  String get tourHudSpeed => 'Brzina dolazi iz GPS-a.';

  @override
  String get tourHudRec =>
      'REC pokazuje koliko sekundi snimke je u međuspremniku.';

  @override
  String get tourHudAi =>
      'Oznaka AI prikazuje model, koliko objekata vidi i točku: zelena radi, žuta ograničeno, crvena zaustavljeno.';

  @override
  String get tourSaveTitle => 'Spremi incident';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista čuva kružni međuspremnik posljednjih $seconds sekundi videa. Neprestano se prepisuje, pa se ništa ne zadržava osim ako dodirnete Spremi. Spremljeni isječci ostaju na ovom iPhoneu, u Isječcima.';
  }

  @override
  String get tourRecordTitle => 'Snimite cijelu vožnju';

  @override
  String get tourRecordBody =>
      'Dodirnite Snimaj za neprekidno snimanje dok ne zaustavite. Duge vožnje spremaju se u Isječke u dijelovima od 5 minuta, a Spremi incident radi i tijekom snimanja.';

  @override
  String get tourViewsTitle => 'Pet načina da vidite cestu';

  @override
  String get tourViewDetection =>
      'Kamera uživo s okvirima oko podržanih objekata.';

  @override
  String get tourViewVirtual =>
      'Pojednostavljena 3D scena izrađena iz detekcija.';

  @override
  String get tourViewMap =>
      'Apple Maps s pretraživanjem i navigacijom od skretanja do skretanja.';

  @override
  String get tourViewParking => 'Kamera uz prikaz blizine odozgo.';

  @override
  String get tourViewPerception => 'Maske ceste i objekata.';

  @override
  String get tourMapTitle =>
      'Pretraživanje i navigacija od skretanja do skretanja';

  @override
  String get tourMapBody =>
      'Otvorite Kartu, dodirnite traku za pretraživanje i odaberite odredište. Odaberite rutu pa dodirnite Kreni za navigaciju od skretanja do skretanja. Zahtijeva internetsku vezu.';

  @override
  String get tourClipsTitle => 'Isječci';

  @override
  String get tourClipsBody =>
      'Pregledajte, preimenujte, podijelite ili izbrišite spremljene incidente. Isječci ostaju na vašem iPhoneu osim ako ih podijelite.';

  @override
  String get tourSettingsTitle => 'Postavke';

  @override
  String get tourSettingsBody =>
      'Prilagodite glasovna upozorenja i njihovu osjetljivost, kvalitetu snimanja i duljinu međuspremnika te postavite hitni način: eksperimentalno upozorenje o udaru s odbrojavanjem za otkazivanje.';

  @override
  String get tourSafetyTitle => 'Prije vožnje';

  @override
  String get tourSafety1 => 'Čvrsto postavite iPhone gdje ne zaklanja pogled.';

  @override
  String get tourSafety2 =>
      'Ne koristite aplikaciju tijekom vožnje. Sve postavite dok ste parkirani.';

  @override
  String get tourSafety3 =>
      'Detekcije i zone su procjene. Mogu biti pogrešne ili propuštene.';

  @override
  String get tourSafety4 => 'Vi ostajete odgovorni za sigurnu vožnju.';

  @override
  String get helpTakeTour => 'Započni obilazak';

  @override
  String get helpTakeTourSub => 'Jednominutni vođeni pregled zaslona vožnje.';

  @override
  String get tripsTitle => 'Putovanja';

  @override
  String get tripsOpen => 'Dnevnik putovanja';

  @override
  String get tripsEmptyTitle => 'Još nema putovanja';

  @override
  String get tripsEmptyBody =>
      'Putovanja se bilježe automatski dok vozite s aplikacijom Corvista — udaljenost, vrijeme, brzina i ruta kojom ste prošli.';

  @override
  String get tripsDisabledBody =>
      'Dnevnik putovanja je isključen pa se nova putovanja ne bilježe. Uključite ga za privatni zapis ruta na ovom iPhoneu.';

  @override
  String get tripsEnable => 'Uključi dnevnik putovanja';

  @override
  String get tripsToday => 'Danas';

  @override
  String get tripsYesterday => 'Jučer';

  @override
  String tripsRecordingNow(String distance) {
    return 'Bilježi se putovanje · $distance';
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
      other: '$count incidenata',
      few: '$count incidenta',
      one: '$count incident',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count upozorenja',
      few: '$count upozorenja',
      one: '$count upozorenje',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count putovanja',
      few: '$count putovanja',
      one: '$count putovanje',
      zero: 'Nema putovanja',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Udaljenost';

  @override
  String get tripsStatDuration => 'Trajanje';

  @override
  String get tripsStatMoving => 'Vrijeme kretanja';

  @override
  String get tripsStatAvgSpeed => 'Prosj. brzina';

  @override
  String get tripsStatMaxSpeed => 'Maks. brzina';

  @override
  String get tripsDetections => 'Detekcije';

  @override
  String get tripsNoDetections =>
      'Na ovom putovanju nisu zabilježeni objekti na cesti.';

  @override
  String get tripsTimeline => 'Vremenska crta';

  @override
  String get tripsEventStart => 'Putovanje je počelo';

  @override
  String get tripsEventEnd => 'Putovanje je završilo';

  @override
  String get tripsEventAlert => 'Glasovno upozorenje';

  @override
  String get tripsEventIncident => 'Isječak incidenta je spremljen';

  @override
  String get tripsEventEmergency => 'Otkriven je mogući sudar';

  @override
  String get tripsEventNavStart => 'Navigacija je započela';

  @override
  String get tripsEventArrive => 'Stigli ste na odredište';

  @override
  String get tripsEventReroute => 'Ruta je ponovno izračunana';

  @override
  String get tripsEventRecording => 'Snimka je spremljena';

  @override
  String get tripsOpenClip => 'Otvori isječak';

  @override
  String get tripsTrackPreview => 'GPS trag';

  @override
  String get tripsRenameTitle => 'Preimenuj putovanje';

  @override
  String get tripsRenameHint => 'Naziv putovanja';

  @override
  String get tripsFavorite => 'Dodaj u favorite';

  @override
  String get tripsUnfavorite => 'Ukloni iz favorita';

  @override
  String get tripsShareGpx => 'Podijeli GPX';

  @override
  String get tripsShareFailed => 'Ovo se putovanje nije moglo podijeliti.';

  @override
  String get tripsDelete => 'Izbriši putovanje';

  @override
  String get tripsDeleteConfirmTitle => 'Izbrisati ovo putovanje?';

  @override
  String get tripsDeleteConfirmBody =>
      'Ruta i statistika bit će uklonjeni s ovog iPhonea. Isječci incidenata s ovog putovanja zadržavaju se.';

  @override
  String get tripsDeleted => 'Putovanje je izbrisano';

  @override
  String get tripsNotFound => 'Ovo putovanje više nije dostupno.';

  @override
  String get tripsPrivacyNote =>
      'Pohranjeno samo na ovom iPhoneu. Ništa se ne šalje.';

  @override
  String get settingsSectionTrips => 'Dnevnik putovanja';

  @override
  String get settingsTripLog => 'Bilježi putovanja';

  @override
  String get settingsTripLogSubtitle =>
      'Čuva vašu rutu i statistiku vožnje samo na ovom iPhoneu.';

  @override
  String get settingsTripRetention => 'Čuvaj putovanja';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dana',
      few: '$days dana',
      one: '$days dan',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 godinu';

  @override
  String get settingsRetentionForever => 'Zauvijek';

  @override
  String get settingsTripRetentionFooter =>
      'Starija se putovanja automatski brišu pri pokretanju aplikacije Corvista.';

  @override
  String get settingsViewTrips => 'Prikaži putovanja';

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
    return 'Corvista putovanje $date';
  }

  @override
  String get settingsFreeUpSpace => 'Oslobodi prostor';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Uklanja privremene datoteke i predmemorije. Spremljeni isječci i putovanja ostaju.';

  @override
  String settingsFreedBytes(String size) {
    return 'Oslobođeno $size';
  }

  @override
  String get settingsNothingToFree =>
      'Predmemorije su očišćene — nema privremenih datoteka za uklanjanje.';

  @override
  String get settingsSectionPrivacyData => 'Privatnost i podaci';

  @override
  String get settingsPrivacyDataFooter =>
      'Isječci, putovanja i postavke pohranjeni su samo na ovom iPhoneu. Napuštaju ga samo kada ih sami odlučite podijeliti.';

  @override
  String get settingsDeleteAllData => 'Izbriši sve podatke';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Izbriši isječke, putovanja, kontakte i postavke s ovog iPhonea';

  @override
  String get deleteAllTitle => 'Izbrisati sve podatke?';

  @override
  String get deleteAllMessage =>
      'Ovo trajno uklanja s ovog iPhonea:\n• Isječke incidenata i sličice\n• Dnevnik putovanja i GPS tragove\n• Kontakte za hitne slučajeve i događaje hitnih slučajeva\n• Zapise detekcije i dijagnostički dnevnik\n• Postavke i nedavna odredišta\n• Privremeni međuspremnik snimanja i predmemoriju\n\nOvo se ne može poništiti. Corvista će zatim ponovno krenuti od uvodnih zaslona.';

  @override
  String get deleteAllConfirm => 'Izbriši sve';

  @override
  String get deleteAllInProgress => 'Brisanje…';

  @override
  String get deleteAllDone => 'Svi podaci su izbrisani';

  @override
  String get deleteAllPartial =>
      'Neke stavke nije bilo moguće izbrisati. Pokušajte ponovno iz Postavki.';

  @override
  String get diagLogSection => 'Dijagnostički dnevnik';

  @override
  String get diagLogFooter =>
      'Pogreške se bilježe samo na ovom iPhoneu, bez lokacija, imena kontakata ili telefonskih brojeva. Ništa se ne šalje osim ako sami ne podijelite dnevnik.';

  @override
  String get diagLogShare => 'Podijeli dijagnostički dnevnik';

  @override
  String get diagLogEmpty => 'Prazno';

  @override
  String get diagLogClear => 'Očisti dnevnik';

  @override
  String get diagLogClearTitle => 'Očistiti dijagnostički dnevnik?';

  @override
  String get diagLogClearBody =>
      'Spremljeni unosi pogrešaka bit će izbrisani s ovog iPhonea.';

  @override
  String get diagLogCleared => 'Dijagnostički dnevnik je očišćen';

  @override
  String get diagLogShareFailed =>
      'Dijagnostički dnevnik nije moguće podijeliti.';

  @override
  String get privacyControls2 =>
      'Postavke › Privatnost i podaci › Izbriši sve podatke briše svaki isječak, putovanje, kontakt, dnevnik i postavku koje je Corvista pohranio na ovom iPhoneu.';

  @override
  String get parkingZoneStop => 'Stani';

  @override
  String get parkingZoneVeryClose => 'Vrlo blizu';

  @override
  String get parkingZoneClose => 'Blizu';

  @override
  String get parkingZoneNothingClose => 'Nema uočenih objekata u blizini';

  @override
  String get parkingNotDetected =>
      'Zidovi, stupovi, kolci i rubnjaci se ne otkrivaju';

  @override
  String get parkingApprox => 'oko';

  @override
  String get parkingSideLeft => 'Lijevo';

  @override
  String get parkingSideCenter => 'Sredina';

  @override
  String get parkingSideRight => 'Desno';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Samo prikaz prednje kamere — nije sustav od 360°';

  @override
  String get parkingMuteBeeps => 'Isključi zvučne signale';

  @override
  String get parkingUnmuteBeeps => 'Uključi zvučne signale';

  @override
  String get parkingAbout => 'O prikazu parkiranja';

  @override
  String get parkingLimitationsDetail =>
      'Prati se samo područje ispred kamere. Detektor prepoznaje automobile, autobuse i kamione, ljude, bicikle i motocikle. Zidovi, stupovi, kolci, rubnjaci, stupići, rampe i niske prepreke NISU otkriveni, a poklopac motora može skrivati tlo neposredno ispred vozila. Udaljenosti su grube procjene s jedne kamere (prema veličini i položaju objekta) i mogu jako odstupati. Tišina ili „Nema uočenih objekata u blizini“ ne znači da je put slobodan — uvijek se osvrnite i koristite retrovizore.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Blizina po stranama: lijevo $left, sredina $center, desno $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Pogreške se zapisuju u privatni dnevnik na ovom iPhoneu (bez lokacija, imena kontakata ili telefonskih brojeva). Nikada se ne šalje automatski; možete ga podijeliti ili očistiti u Postavke › Dijagnostika.';
}
