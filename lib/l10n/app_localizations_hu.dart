// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Lásson többet minden úton.';

  @override
  String get commonCancel => 'Mégse';

  @override
  String get commonDelete => 'Törlés';

  @override
  String get commonSave => 'Mentés';

  @override
  String get commonBack => 'Vissza';

  @override
  String get commonClose => 'Bezárás';

  @override
  String get commonRetry => 'Újra';

  @override
  String get commonOpenSettings => 'Beállítások megnyitása';

  @override
  String get commonLoading => 'Betöltés…';

  @override
  String get commonError => 'Hiba történt.';

  @override
  String commonErrorDetail(String message) {
    return 'Hiba történt: $message';
  }

  @override
  String get commonOn => 'Be';

  @override
  String get commonOff => 'Ki';

  @override
  String get commonRename => 'Átnevezés';

  @override
  String get commonShare => 'Megosztás';

  @override
  String get commonNotAvailable => 'Nem érhető el';

  @override
  String get commonTestFootage => 'TESZTFELVÉTEL';

  @override
  String get zoneVeryClose => 'Nagyon közel';

  @override
  String get zoneClose => 'Közel';

  @override
  String get zoneMedium => 'Közepes';

  @override
  String get zoneFar => 'Messze';

  @override
  String get zoneUnknown => 'Ismeretlen';

  @override
  String get classPerson => 'Személy';

  @override
  String get classBicycle => 'Kerékpár';

  @override
  String get classMotorcycle => 'Motorkerékpár';

  @override
  String get classCar => 'Jármű';

  @override
  String get classBus => 'Busz';

  @override
  String get classTrafficLight => 'Jelzőlámpa';

  @override
  String get classStopSign => 'Stoptábla';

  @override
  String get viewDetection => 'Érzékelés';

  @override
  String get viewVirtual => 'Virtuális';

  @override
  String get viewMap => 'Térkép';

  @override
  String get viewParking => 'Parkolás';

  @override
  String get viewPerception => 'Észlelés';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Piros';

  @override
  String get lightYellow => 'Sárga';

  @override
  String get lightGreen => 'Zöld';

  @override
  String get lightUnknown => 'Ismeretlen';

  @override
  String get clipsTitle => 'Felvételek';

  @override
  String get clipsSelect => 'Kijelölés';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kijelölve',
      one: '1 kijelölve',
      zero: 'Felvételek kijelölése',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Összes kijelölése';

  @override
  String get clipsDeselectAll => 'Kijelölés törlése';

  @override
  String get clipsDeleteSelected => 'Kijelöltek törlése';

  @override
  String get clipsGridView => 'Rács nézet';

  @override
  String get clipsListView => 'Lista nézet';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Töröl $count felvételt?',
      one: 'Törli ezt a felvételt?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'A videók véglegesen törlődnek az iPhone-ról. Ez nem vonható vissza.',
      one: 'A videó véglegesen törlődik az iPhone-ról. Ez nem vonható vissza.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count felvétel törölve',
      one: 'Felvétel törölve',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Még nincsenek felvételek';

  @override
  String get clipsEmptyBody =>
      'Vezetés közben a Corvista rövid, folyamatos puffert tart fenn. Koppintson az Esemény mentése gombra, hogy az utolsó másodpercek felvétele itt maradjon.';

  @override
  String get clipsLoadError => 'A felvételek nem tölthetők be.';

  @override
  String get clipsStorageTitle => 'Tárhely';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Felvételek $clips · Puffer $buffer · $free szabad';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mentett felvétel',
      one: '1 mentett felvétel',
      zero: 'Nincs mentett felvétel',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Az iPhone tárhelye kevés. Az új események mentése sikertelen lehet.';

  @override
  String get clipsMissingFile => 'A fájl hiányzik';

  @override
  String get clipsEmergencyBadge => 'Ütközés';

  @override
  String clipsUntitled(String date) {
    return 'Esemény · $date';
  }

  @override
  String get clipsAudio => 'Hang rögzítve';

  @override
  String get clipsFavorite => 'Kedvenc';

  @override
  String get clipsUnfavorite => 'Eltávolítás a kedvencek közül';

  @override
  String get clipsLocation => 'Helyadat mentve';

  @override
  String clipsOpenClip(String title) {
    return '$title felvétel megnyitása';
  }

  @override
  String get playerNotFoundTitle => 'A felvétel nem található';

  @override
  String get playerNotFoundBody => 'Lehet, hogy ez a felvétel törölve lett.';

  @override
  String get playerMissingTitle => 'A videófájl hiányzik';

  @override
  String get playerMissingBody =>
      'A felvétel videója már nincs az iPhone-on. A bejegyzést eltávolíthatja a galériából.';

  @override
  String get playerRemoveEntry => 'Bejegyzés eltávolítása';

  @override
  String get playerLoadError => 'Ez a videó nem játszható le.';

  @override
  String get playerPlay => 'Lejátszás';

  @override
  String get playerPause => 'Szünet';

  @override
  String get playerReplay => 'Újrajátszás';

  @override
  String get playerRenameTitle => 'Felvétel átnevezése';

  @override
  String get playerRenameHint => 'Felvétel neve';

  @override
  String get playerRenamed => 'Felvétel átnevezve';

  @override
  String get playerFavorited => 'Hozzáadva a kedvencekhez';

  @override
  String get playerUnfavorited => 'Eltávolítva a kedvencek közül';

  @override
  String get playerShareFailed => 'A felvétel nem osztható meg.';

  @override
  String get playerDetails => 'Részletek';

  @override
  String get playerDate => 'Rögzítve';

  @override
  String get playerDuration => 'Időtartam';

  @override
  String get playerResolution => 'Felbontás';

  @override
  String get playerSize => 'Fájlméret';

  @override
  String get playerAudio => 'Hang';

  @override
  String get playerAudioYes => 'Rögzítve';

  @override
  String get playerAudioNo => 'Nincs rögzítve';

  @override
  String get playerReason => 'Mentés oka';

  @override
  String get playerReasonManual => 'Esemény mentése gomb';

  @override
  String get playerReasonEmergency => 'Lehetséges ütközés érzékelése';

  @override
  String get playerReasonRecovered => 'Megszakítás után helyreállítva';

  @override
  String get playerSpeed => 'GPS-sebesség mentéskor';

  @override
  String get playerLocation => 'Helyadat';

  @override
  String get playerOpenInMaps => 'Megnyitás a Térképen';

  @override
  String get playerBack => 'Vissza';

  @override
  String get playerMore => 'További műveletek';

  @override
  String get clipsFilterLabel => 'Megjelenítés';

  @override
  String get clipsFilterAll => 'Mind';

  @override
  String get clipsFilterRecordings => 'Rögzítések';

  @override
  String get clipsFilterIncidents => 'Események';

  @override
  String get clipsFilterEmergency => 'Vészhelyzetek';

  @override
  String get clipsFilterFavorites => 'Kedvencek';

  @override
  String get clipsSort => 'Rendezés';

  @override
  String get clipsSortNewest => 'Legújabb elöl';

  @override
  String get clipsSortOldest => 'Legrégebbi elöl';

  @override
  String get clipsSortLongest => 'Leghosszabb elöl';

  @override
  String get clipsSortLargest => 'Legnagyobb elöl';

  @override
  String get clipsToday => 'Ma';

  @override
  String get clipsYesterday => 'Tegnap';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count felvétel',
      one: '1 felvétel',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Ebben a kategóriában még nincs felvétel.';

  @override
  String get clipsFavoritesEmpty =>
      'Csillagozzon meg egy felvételt, hogy gyors elérésre itt maradjon.';

  @override
  String get clipsKindRecording => 'Rögzítés';

  @override
  String get clipsKindIncident => 'Esemény';

  @override
  String get clipsKindEmergency => 'Vészhelyzet';

  @override
  String get clipsKindTest => 'Teszt';

  @override
  String clipsTripChip(String time) {
    return 'Út · $time';
  }

  @override
  String get clipsOpenTrip => 'Nyissa meg az utat, amelyen a felvétel készült';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used használt · $free szabad';
  }

  @override
  String clipsStorageClips(String size) {
    return 'A felvételek $size helyet foglalnak';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rögzítés',
      one: '1 rögzítés',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count esemény',
      one: '1 esemény',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vészhelyzet',
      one: '1 vészhelyzet',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Hely felszabadítása';

  @override
  String get clipsStorageLowGentle =>
      'Kevesebb mint 2 GB szabad hely. A zökkenőmentes rögzítéshez szabadítson fel helyet, vagy törölje a már nem szükséges felvételeket.';

  @override
  String get clipsSaveToPhotos => 'Mentés a Fotókba';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count felvétel',
      one: '1 felvétel',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Töröl $count felvételt ($size)?',
      one: 'Törli ezt a felvételt ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Mentés a Fotókba: $done/$total…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count felvétel mentve a Fotókba',
      one: 'Mentve a Fotókba',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved mentve a Fotókba · $failed nem menthető';
  }

  @override
  String get clipsPhotosDenied =>
      'A Corvista nem adhat hozzá videókat a Fotókhoz. Ezt a Beállításokban engedélyezheti.';

  @override
  String get clipsPhotosFailed => 'Nem sikerült a Fotókba menteni.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count felvétel hozzáadva a kedvencekhez',
      one: 'Hozzáadva a kedvencekhez',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count felvétel eltávolítva a kedvencek közül',
      one: 'Eltávolítva a kedvencek közül',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (vágott)';
  }

  @override
  String get playerTrim => 'Vágás';

  @override
  String get playerInfo => 'Infó';

  @override
  String get playerKind => 'Típus';

  @override
  String get playerReasonRecording => 'Rögzítés gomb';

  @override
  String get trimTitle => 'Felvétel vágása';

  @override
  String get trimHint =>
      'A fogantyúk húzásával válassza ki a megtartandó részt. Az eredeti felvétel változatlan marad.';

  @override
  String get trimStartHandle => 'Vágás kezdete';

  @override
  String get trimEndHandle => 'Vágás vége';

  @override
  String trimSelection(String duration) {
    return '$duration kijelölve';
  }

  @override
  String get trimSave => 'Mentés új felvételként';

  @override
  String get trimSaving => 'Vágott felvétel mentése…';

  @override
  String get trimSaved => 'Vágott felvétel mentve';

  @override
  String get trimOpenNew => 'Megnyitás';

  @override
  String get trimFailed => 'Nem sikerült megvágni a felvételt.';

  @override
  String get trimStorageFull =>
      'Nincs elég szabad hely a vágott felvétel mentéséhez.';

  @override
  String get trimPreview => 'Kijelölés lejátszása';

  @override
  String get settingsTitle => 'Beállítások';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'MI';

  @override
  String get settingsSectionAlerts => 'Figyelmeztetések';

  @override
  String get settingsSectionAlertCategories => 'Figyelmeztetési kategóriák';

  @override
  String get settingsSectionRecording => 'Rögzítés';

  @override
  String get settingsSectionDriving => 'Vezetés';

  @override
  String get settingsSectionPower => 'Energia';

  @override
  String get settingsSectionEmergency => 'Vészhelyzet';

  @override
  String get settingsSectionAppearance => 'Megjelenés';

  @override
  String get settingsSectionLanguage => 'Nyelv';

  @override
  String get settingsSectionInformation => 'Információk';

  @override
  String get settingsCameraLens => 'Kameraobjektív';

  @override
  String get settingsLensWide => 'Nagy látószögű';

  @override
  String get settingsLensUltraWide => 'Ultraszéles';

  @override
  String get settingsLensTelephoto => 'Teleobjektív';

  @override
  String get settingsLensUnavailable => 'Nem érhető el ezen az iPhone-on';

  @override
  String get settingsStabilization => 'Stabilizálás';

  @override
  String get settingsStabAuto => 'Automatikus';

  @override
  String get settingsStabOff => 'Ki';

  @override
  String get settingsStabStandard => 'Normál';

  @override
  String get settingsStabCinematic => 'Filmes';

  @override
  String get settingsOverlayOpacity => 'Átfedés átlátszatlansága';

  @override
  String get settingsShowFps => 'Teljesítményadatok megjelenítése';

  @override
  String get settingsShowFpsSubtitle =>
      'Képfrekvencia és következtetési idő az érzékelési nézetben';

  @override
  String get settingsCameraFooter =>
      'Az objektív és a stabilizálás módosításai a kamera következő indításakor lépnek életbe.';

  @override
  String get settingsAiModel => 'MI-modell';

  @override
  String get settingsConfidence => 'Érzékelési megbízhatóság';

  @override
  String get settingsTracking => 'Objektumkövetés';

  @override
  String get settingsTrackingSubtitle =>
      'Stabilan tartja az objektumokat a képkockák között';

  @override
  String get settingsShowLabels => 'Címkék megjelenítése';

  @override
  String get settingsShowConfidence => 'Megbízhatóság megjelenítése';

  @override
  String get settingsSegmentationOpacity => 'Észlelési maszk átlátszatlansága';

  @override
  String get settingsAiFooter =>
      'Alacsonyabb megbízhatóság több objektumot mutat, de több téves érzékelést is. Az érzékelések pontatlanok lehetnek.';

  @override
  String get settingsVoiceAlerts => 'Hangfigyelmeztetések';

  @override
  String get settingsVoiceLanguage => 'Hang nyelve';

  @override
  String get settingsVoiceLanguageAuto => 'Az alkalmazás nyelve';

  @override
  String get settingsVoice => 'Hang';

  @override
  String get settingsVoiceDefault => 'Rendszer alapértelmezése';

  @override
  String get settingsVoiceQualityEnhanced => 'Továbbfejlesztett';

  @override
  String get settingsVoiceQualityPremium => 'Kiváló minőség';

  @override
  String get settingsNoVoices =>
      'Ehhez a nyelvhez nincs telepített hang. Adjon hozzá egyet az iOS Beállítások › Kisegítő lehetőségek › Felolvasott tartalom menüpontban.';

  @override
  String get settingsAlertPedestrian => 'Gyalogosok';

  @override
  String get settingsAlertCyclist => 'Kerékpárosok';

  @override
  String get settingsAlertMotorcycle => 'Motorkerékpárok';

  @override
  String get settingsAlertBus => 'Buszok';

  @override
  String get settingsAlertVehicleClose => 'Jármű közvetlenül előttünk';

  @override
  String get settingsAlertTrafficLight => 'Jelzőlámpa-váltás';

  @override
  String get settingsAlertTrafficMoving => 'Elindult az előttünk álló forgalom';

  @override
  String get settingsAlertStopSign => 'Stoptáblák';

  @override
  String get settingsSensitivity => 'Érzékenység';

  @override
  String get settingsSensitivityLow => 'Alacsony';

  @override
  String get settingsSensitivityMedium => 'Közepes';

  @override
  String get settingsSensitivityHigh => 'Magas';

  @override
  String get settingsCooldown => 'Ismétlési időköz';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds mp';
  }

  @override
  String get settingsVolume => 'Hangerő';

  @override
  String get settingsQuietMode => 'Csendes mód';

  @override
  String get settingsQuietModeSubtitle =>
      'Csak a legfontosabb figyelmeztetések hangzanak el';

  @override
  String get settingsTestVoice => 'Hang tesztelése';

  @override
  String get settingsTestVoiceDone => 'Mintafigyelmeztetés lejátszása…';

  @override
  String get settingsParkingBeeps => 'Parkolási hangjelzések';

  @override
  String get settingsBeepVolume => 'Hangjelzés hangereje';

  @override
  String get settingsAlertsFooter =>
      'A figyelmeztetések csak segítséget nyújtanak. Mindig figyelje az utat – a csend nem jelenti azt, hogy szabad az út.';

  @override
  String get settingsRecordingProfile => 'Felvétel minősége';

  @override
  String get settingsProfileStandard => 'Normál · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Eseménypuffer';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds másodperc';
  }

  @override
  String get settingsManualMaxLength => 'Kézi rögzítés maximális hossza';

  @override
  String get settingsManualMaxUnlimited => 'Korlátlan';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes perc';
  }

  @override
  String get settingsRecordAudio => 'Hang rögzítése';

  @override
  String get settingsRecordAudioSubtitle =>
      'A mentett eseményekhez az utastér hangját is tartalmazza';

  @override
  String get settingsMicDenied =>
      'A mikrofonhozzáférés ki van kapcsolva. Engedélyezze a Beállításokban a hangrögzítéshez.';

  @override
  String get settingsWatermark => 'Corvista vízjel';

  @override
  String get settingsTimestamp => 'Dátum- és időbélyeg';

  @override
  String get settingsSaveLocation => 'Helyadat mentése a felvételekkel';

  @override
  String get settingsStorage => 'Tárhely és felvételek';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count felvétel',
      one: '1 felvétel',
      zero: 'Nincs felvétel',
    );
    return '$_temp0 · $used használt · $free szabad';
  }

  @override
  String get settingsRecordingFooter =>
      'A folyamatos puffer az iPhone-on marad, és állandóan felülíródik. A háttérben semmi sem kerül rögzítésre.';

  @override
  String get settingsDefaultView => 'Alapértelmezett nézet';

  @override
  String get settingsUnits => 'Mértékegységek';

  @override
  String get settingsShowCompass => 'Iránytű megjelenítése';

  @override
  String get settingsHudStyle => 'HUD-stílus';

  @override
  String get settingsHudCustomize => 'HUD testreszabása';

  @override
  String get settingsDrivingSide => 'Közlekedési oldal';

  @override
  String get settingsDrivingSideAuto => 'Automatikus';

  @override
  String get settingsDrivingSideRight => 'Jobb';

  @override
  String get settingsDrivingSideLeft => 'Bal';

  @override
  String get settingsVirtualStyle => 'Virtuális nézet stílusa';

  @override
  String get settingsVirtualMinimal => 'Minimális';

  @override
  String get settingsVirtualPerspective => 'Perspektíva';

  @override
  String get settingsVirtualHighContrast => 'Nagy kontraszt';

  @override
  String get settingsKeepScreenOn =>
      'Képernyő bekapcsolva tartása vezetés közben';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Kanyarról kanyarra útvonalterv megjelenítése a zárolási képernyőn és a Dynamic Islanden';

  @override
  String get driveRecordingPausedBackground =>
      'A rögzítés szünetelt, amíg a Corvista a háttérben volt';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Szünet';

  @override
  String get liveActivityDashcamOff => 'Kamera ki';

  @override
  String get liveActivityEnded => 'A navigáció véget ért';

  @override
  String get liveActivityEta => 'Érkezés';

  @override
  String get settingsAutoRecenter => 'Térkép automatikus középre igazítása';

  @override
  String get settingsHudStyleClassic => 'Klasszikus';

  @override
  String get settingsHudStyleGrid => 'Rács';

  @override
  String get settingsHudStyleMinimal => 'Minimális';

  @override
  String get settingsHudStylePerformance => 'Teljesítmény';

  @override
  String get settingsHudStyleNavigation => 'Navigáció';

  @override
  String get settingsHudStyleNight => 'Éjszakai';

  @override
  String get settingsHudStyleHighContrast => 'Nagy kontraszt';

  @override
  String get settingsPowerMode => 'Energiamód';

  @override
  String get settingsPowerBalanced => 'Kiegyensúlyozott';

  @override
  String get settingsPowerPerformance => 'Teljesítmény';

  @override
  String get settingsPowerSaver => 'Energiatakarékos';

  @override
  String get settingsPowerFooter =>
      'A Corvista automatikusan csökkenti az MI sebességét és a vizuális effektusokat, ha az iPhone felmelegszik vagy az akkumulátor lemerülőben van.';

  @override
  String get settingsThermal => 'Hőmérsékleti állapot';

  @override
  String get settingsThermalNominal => 'Normál';

  @override
  String get settingsThermalFair => 'Meleg';

  @override
  String get settingsThermalSerious => 'Forró';

  @override
  String get settingsThermalCritical => 'Kritikus';

  @override
  String get settingsBattery => 'Akkumulátor';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Töltés';
  }

  @override
  String get settingsLowPowerMode =>
      'Az Alacsony fogyasztású mód be van kapcsolva – az MI csökkentett sebességgel fut.';

  @override
  String get settingsAiRate => 'Az MI jelenlegi sebessége';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Ütközésérzékelés';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Be · $seconds mp visszaszámlálás';
  }

  @override
  String get settingsEmergencyFooter =>
      'Kísérleti funkció. Nem helyettesíti a segélyszolgálatokat.';

  @override
  String get settingsTheme => 'Téma';

  @override
  String get settingsThemeSystem => 'Rendszer';

  @override
  String get settingsThemeDark => 'Sötét';

  @override
  String get settingsThemeLight => 'Világos';

  @override
  String get settingsReduceMotion => 'Mozgás csökkentése';

  @override
  String get settingsReduceMotionSubtitle =>
      'Minimalizálja az animációkat az alkalmazásban';

  @override
  String get settingsAppLanguage => 'Alkalmazás nyelve';

  @override
  String get settingsPrivacyPolicy => 'Adatvédelmi irányelvek';

  @override
  String get settingsTerms => 'Felhasználási feltételek';

  @override
  String get settingsHelp => 'Súgó';

  @override
  String get settingsSupport => 'Kapcsolat az ügyfélszolgálattal';

  @override
  String get settingsLicenses => 'Nyílt forráskódú licencek';

  @override
  String get settingsSupportUnavailable =>
      'A Mail nem nyitható meg. Írjon a support@corvista.app címre.';

  @override
  String get settingsSafety => 'Biztonsági információk';

  @override
  String get settingsDiagnostics => 'Diagnosztika';

  @override
  String get settingsVersion => 'Verzió';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'HUD testreszabása';

  @override
  String get hudCustomPreview => 'Előnézet · mintaértékek';

  @override
  String get hudCustomStyle => 'Stílus';

  @override
  String get hudCustomElements => 'Elemek';

  @override
  String get hudCustomSpeed => 'Sebesség';

  @override
  String get hudCustomHeading => 'Irány és iránytű';

  @override
  String get hudCustomClock => 'Óra';

  @override
  String get hudCustomBattery => 'Akkumulátor és hőmérséklet';

  @override
  String get hudCustomDetections => 'MI-állapot és érzékelések';

  @override
  String get hudCustomWeather => 'Időjárás';

  @override
  String get hudCustomAppearance => 'Méret és átlátszatlanság';

  @override
  String get hudCustomSize => 'Méret';

  @override
  String get hudCustomOpacity => 'Átlátszatlanság';

  @override
  String get hudCustomFooter =>
      'A figyelmeztetések, például a túlmelegedés, akkor is megjelennek, ha az elemek el vannak rejtve.';

  @override
  String get hudCustomDescClassic => 'Kiegyensúlyozott műszeregység';

  @override
  String get hudCustomDescGrid => 'Perspektivikus rács az úton';

  @override
  String get hudCustomDescMinimal => 'Csak a sebesség, semmi más';

  @override
  String get hudCustomDescPerformance => 'Sebességív élő adatokkal';

  @override
  String get hudCustomDescNavigation => 'Először a következő manőver';

  @override
  String get hudCustomDescNight =>
      'Tompított, vöröses árnyalat éjszakai vezetéshez';

  @override
  String get hudCustomDescHighContrast =>
      'Maximális olvashatóság erős napfényben';

  @override
  String get languageTitle => 'Nyelv';

  @override
  String get languageSystem => 'Rendszer alapértelmezése';

  @override
  String get languageSystemSubtitle => 'Az iPhone nyelvének követése';

  @override
  String get languageFooter =>
      'További nyelvek érkeznek. A hangfigyelmeztetések nyelve külön is beállítható a Figyelmeztetések alatt.';

  @override
  String get diagTitle => 'Diagnosztika';

  @override
  String get diagPerformance => 'Teljesítmény';

  @override
  String get diagInference => 'Következtetési idő';

  @override
  String get diagDetectHz => 'Érzékelési sebesség';

  @override
  String get diagCameraFps => 'Kamera képfrekvenciája';

  @override
  String get diagMemory => 'Memória';

  @override
  String get diagDropped => 'Eldobott képkockák';

  @override
  String get diagSegmentation => 'Szegmentálási idő';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Állapot';

  @override
  String get diagSource => 'Forrás';

  @override
  String get diagSourceCamera => 'Élő kamera';

  @override
  String get diagSourceFile => 'Tesztvideó-fájl';

  @override
  String get diagResolution => 'Pufferméret';

  @override
  String get diagLens => 'Objektív';

  @override
  String get diagError => 'Utolsó hiba';

  @override
  String get diagModel => 'MI-modell';

  @override
  String get diagModelLoad => 'Modell betöltési ideje';

  @override
  String get diagPower => 'Energia';

  @override
  String get diagSegHz => 'Szegmentálási sebesség';

  @override
  String get diagReduced => 'Csökkentett effektusok';

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
  String get diagCamIdle => 'Tétlen';

  @override
  String get diagCamStarting => 'Indul';

  @override
  String get diagCamRunning => 'Fut';

  @override
  String get diagCamInterrupted => 'Megszakítva';

  @override
  String get diagCamStopped => 'Leállítva';

  @override
  String get diagCamUnavailable => 'Nem érhető el';

  @override
  String get diagCamPermissionDenied => 'Engedély megtagadva';

  @override
  String get diagCamError => 'Hiba';

  @override
  String get diagTestFootage => 'Tesztvideó';

  @override
  String get diagTestFootageBody =>
      'Valódi, eszközön futó érzékelés helyi videófájlon a kamera helyett. Minden nézet TESZTFELVÉTEL felirattal jelöli.';

  @override
  String get diagPathLabel => 'Videófájl elérési útja';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Documents/test_drive.mp4 használata';

  @override
  String get diagRun => 'Tesztvideó futtatása';

  @override
  String get diagRunStarted =>
      'A tesztvideó elindult. Nyissa meg a vezetési nézetet a megtekintéséhez.';

  @override
  String get diagBackToCamera => 'Vissza az élő kamerához';

  @override
  String get diagDebugOnly =>
      'A tesztvideó csak fejlesztői buildekben érhető el.';

  @override
  String get diagFileMissing => 'Ezen az elérési úton nincs fájl.';

  @override
  String get emergencySetupTitle => 'Ütközésérzékelés';

  @override
  String get emergencyExperimental => 'Kísérleti';

  @override
  String get emergencyIntro =>
      'Vezetés közben a Corvista az iPhone mozgásérzékelőivel figyelheti a lehetséges súlyos ütközést. Ha ilyet érzékel, visszaszámlálás indul. Ha nem szakítja meg, a Corvista felajánlja a segélyszolgálat hívását és az üzenetküldést a kapcsolatainak.';

  @override
  String get emergencyDisclaimer1 =>
      'Nem helyettesíti a segélyszolgálatokat, sem a jármű saját ütközésérzékelését.';

  @override
  String get emergencyDisclaimer2 =>
      'Hívás indítása vagy üzenet küldése előtt az iOS mindig megerősítést kér.';

  @override
  String get emergencyDisclaimer3 =>
      'Az ütközések kimaradhatnak, az erős fékezés vagy a zökkenők pedig összetéveszthetők velük.';

  @override
  String get emergencyParkedWarning =>
      'Ezt a beállítást állva végezze el. A beállítások zárolva vannak, amíg a jármű mozog.';

  @override
  String get emergencyEnable => 'Ütközésérzékelés engedélyezése';

  @override
  String get emergencyEnableSubtitle => 'Csak vezetési munkamenet alatt aktív';

  @override
  String get emergencyNeedNumber => 'Először adjon meg egy segélyhívó számot.';

  @override
  String get emergencyContacts => 'Vészhelyzeti kapcsolatok';

  @override
  String get emergencyAddContact => 'Kapcsolat hozzáadása';

  @override
  String get emergencyNoContacts =>
      'Még nincsenek kapcsolatok. A kapcsolatok csak az Ön megerősítése után kapnak üzenetet.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Eltávolítja: $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Ütközés után nem lesz felajánlva címzettként.';

  @override
  String get emergencyRemove => 'Eltávolítás';

  @override
  String get emergencyContactsError => 'A kapcsolatok nem tölthetők be.';

  @override
  String get emergencyNumber => 'Segélyhívó szám';

  @override
  String get emergencyNumberHint => 'pl. 112 vagy 911';

  @override
  String get emergencyMessage => 'Üzenetsablon';

  @override
  String get emergencyMessageDefault =>
      'Lehet, hogy járműbalesetet szenvedtem. Ezt az üzenetet a Corvista készítette, és tartalmazza az utolsó ismert tartózkodási helyemet, ha elérhető.';

  @override
  String get emergencyMessageHint =>
      'Hagyja üresen az alapértelmezett üzenet használatához.';

  @override
  String get emergencyCountdown => 'Visszaszámlálás hossza';

  @override
  String get emergencyVoiceCancel => 'Megszakítás hanggal';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Mondja azt, hogy „Jól vagyok” vagy „Mégse” a visszaszámlálás alatt. Ahol elérhető, eszközön futó beszédfelismerést használ.';

  @override
  String get emergencyVoicePermDenied =>
      'A hangos megszakításhoz mikrofon- és beszédfelismerési hozzáférés szükséges.';

  @override
  String get emergencyAutoSave => 'Eseményfelvétel automatikus mentése';

  @override
  String get emergencyTest => 'Visszaszámlálás tesztelése (hívás nélkül)';

  @override
  String get emergencyTestBody =>
      'Szimulált ütközést futtat, hogy láthassa a visszaszámlálást. Tesztmódban soha nem indul hívás és nem megy el üzenet.';

  @override
  String get emergencyNotSet => 'Nincs beállítva';

  @override
  String get emergencyAlertHeadline =>
      'Lehetséges súlyos ütközést érzékeltünk.';

  @override
  String get emergencyAlertSubtitle => 'Jól van?';

  @override
  String get emergencyAlertCancel => 'Jól vagyok – Megszakítás';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds másodperc van hátra',
      one: '1 másodperc van hátra',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Figyelés – a megszakításhoz mondja: „Jól vagyok”';

  @override
  String emergencyAlertHeard(String text) {
    return 'Hallott szöveg: „$text”';
  }

  @override
  String get emergencyAlertEscalated =>
      'Nincs válasz. Válassza ki, mi történjen:';

  @override
  String get emergencyAlertCall => 'Segélyszolgálat hívása';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'A(z) $number számot hívja. Az iOS megerősítést kér.';
  }

  @override
  String get emergencyAlertMessage => 'Üzenet a kapcsolatoknak';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Megnyit egy előkészített üzenetet. Ön dönti el, elküldi-e.';

  @override
  String get emergencyAlertTestMode => 'Tesztmód – hívás nem indul';

  @override
  String get emergencyAlertTestBadge => 'TESZT';

  @override
  String get emergencyAlertClose => 'Jól vagyok – Bezárás';

  @override
  String get emergencyMsgSent => 'Üzenet elküldve.';

  @override
  String get emergencyMsgCancelled => 'Az üzenet nem lett elküldve.';

  @override
  String get emergencyMsgFailed => 'Az üzenet nem küldhető el.';

  @override
  String get emergencyMsgUnavailable =>
      'Az üzenetküldés nem érhető el ezen az eszközön.';

  @override
  String emergencyCallFailed(String number) {
    return 'A hívás nem indítható. Hívja Ön a(z) $number számot.';
  }

  @override
  String get modelsTitle => 'MI-modellek';

  @override
  String get modelsIntro =>
      'Minden modell az alkalmazással érkezik, és teljes egészében az iPhone-on fut. A kamera képe soha nem hagyja el az eszközt.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Élő: $ms ms képkockánként · $hz érzékelés/mp';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Betöltve $ms ms alatt';
  }

  @override
  String get modelsEfficientName => 'Hatékony';

  @override
  String get modelsEfficientDesc =>
      'Gyors, kompakt érzékelő hosszú utakhoz, alacsony hőtermeléssel és akkumulátorhasználattal.';

  @override
  String get modelsEnhancedName => 'Továbbfejlesztett';

  @override
  String get modelsEnhancedDesc =>
      'Nagyobb érzékelő, amely kisebb és távolabbi objektumokat is megtalál, nagyobb energiaigénnyel.';

  @override
  String get modelsSegmentationName => 'Szegmentálás';

  @override
  String get modelsSegmentationDesc =>
      'A gyors érzékelést útfelületi és objektummaszkokkal egészíti ki az Észlelés nézethez.';

  @override
  String get modelsNoneName => 'MI szüneteltetve';

  @override
  String get modelsNoneDesc =>
      'A kamera és a felvétel objektumérzékelés nélkül is fut tovább. A legalacsonyabb energiafogyasztás.';

  @override
  String get modelsGenericDesc => 'Eszközön futó objektumérzékelő modell.';

  @override
  String get modelsFunctionDetection =>
      'Járműveket, személyeket, kerékpárokat, motorkerékpárokat, buszokat, jelzőlámpákat és stoptáblákat érzékel';

  @override
  String get modelsFunctionSegmentation =>
      'Útfelületi és objektummaszkokat ad hozzá';

  @override
  String get modelsFunctionNone => 'Nincs érzékelés; csak autós kamerafelvétel';

  @override
  String get modelsSize => 'Méret';

  @override
  String get modelsInput => 'Bemenet';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Működik ezekkel';

  @override
  String get modelsStatusInstalled => 'Telepítve (beépített)';

  @override
  String get modelsStatusNotInstalled => 'Nincs telepítve';

  @override
  String get modelsSelected => 'Kiválasztva';

  @override
  String get modelsUse => 'Modell használata';

  @override
  String get modelsSwitching => 'Modell betöltése…';

  @override
  String modelsSwitched(String name) {
    return 'A(z) $name mostantól aktív';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Ezen az eszközön mérve: átlagosan $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Ezen az eszközön nincs mérve';

  @override
  String get modelsBenchmarkRun => 'Teljesítménymérés futtatása';

  @override
  String get modelsBenchmarkRunning => 'Mérés folyamatban…';

  @override
  String get modelsBenchmarkSelectHint =>
      'A méréshez válassza ki ezt a modellt.';

  @override
  String get modelsBenchmarkDone => 'A mérés kész';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'A mérés sikertelen: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Utolsó frissítés: $date';
  }

  @override
  String get safetyTitle => 'Biztonsági információk';

  @override
  String get safetyIntro =>
      'A Corvista vezetési figyelmet segítő eszköz. Nem irányítja a járművet, és nem helyettesítheti az Ön figyelmét, ítélőképességét vagy a jármű biztonsági rendszereit.';

  @override
  String get safetyBeforeTitle => 'Indulás előtt';

  @override
  String get safetyBefore1 =>
      'Rögzítse az iPhone-t biztonságosan, jogszerű helyen, úgy, hogy ne takarja el a kilátást, a légzsákokat vagy a kezelőszerveket.';

  @override
  String get safetyBefore2 =>
      'A beállításokat, a nézet kiválasztását és az úti cél megadását állva végezze el.';

  @override
  String get safetyBefore3 =>
      'Hosszabb utakhoz csatlakoztasson töltőt, és ha lehet, tartsa a telefont távol a közvetlen napfénytől.';

  @override
  String get safetyWhileTitle => 'Vezetés közben';

  @override
  String get safetyWhile1 =>
      'Tartsa szemét az úton. A nagy képernyőgombokat csak akkor használja, ha ez biztonságos és jogszerű.';

  @override
  String get safetyWhile2 =>
      'A figyelmeztetések csak segítséget nyújtanak, nem megbízható riasztások. A csend soha nem jelenti azt, hogy szabad az út.';

  @override
  String get safetyWhile3 =>
      'Ha eltérnek, a közlekedési szabályokat, jelzéseket és táblákat kövesse, ne az alkalmazást.';

  @override
  String get safetyLimitsTitle => 'Korlátozások';

  @override
  String get safetyLimits1 =>
      'Egyetlen telefonkamera csak azt látja, ami előtte van. A látószögén kívüli, takarásban lévő vagy nagyon közeli objektumokat nem érzékeli.';

  @override
  String get safetyLimits2 =>
      'Az érzékelések kimaradhatnak, késhetnek vagy tévesek lehetnek, különösen éjszaka, esőben, ködben, vakításkor vagy piszkos szélvédő esetén.';

  @override
  String get safetyLimits3 =>
      'Csak a támogatott kategóriákat ismeri fel: járművek, buszok, motorkerékpárok, kerékpárok, személyek, jelzőlámpák és stoptáblák. A virtuális nézet sávjelzései stilizáltak, nem érzékelt sávok.';

  @override
  String get safetyLimits4 =>
      'A közelség hozzávetőleges zónákként jelenik meg (Nagyon közel, Közel, Közepes, Messze), soha nem mért távolságként. A parkolási nézet nem helyettesíti a parkolóradart.';

  @override
  String get safetyHeatTitle => 'Hő és akkumulátor';

  @override
  String get safetyHeat1 =>
      'A folyamatos kamera- és MI-használat melegíti az iPhone-t. A Corvista csökkenti az elemzési sebességet, ha az eszköz felforrósodik, és figyelmeztetést jelenít meg; ha az iOS túlmelegszik, a kamera leállhat.';

  @override
  String get safetyEmergencyTitle => 'Vészhelyzeti funkció';

  @override
  String get safetyEmergency1 =>
      'A lehetséges ütközés érzékelése kísérleti funkció. Valódi ütközéseket is elmulaszthat, és más események is kiválthatják.';

  @override
  String get safetyEmergency2 =>
      'Soha nem vesz fel kapcsolatot senkivel csendben: az iOS hívás vagy üzenet előtt mindig megerősítést kér. Nem helyettesíti, hogy Ön maga hívja a segélyszolgálatot.';

  @override
  String get privacyTitle => 'Adatvédelem';

  @override
  String get privacyIntro =>
      'A Corvista úgy készült, hogy a vezetési adatok az iPhone-on maradjanak. Nincs Corvista-fiók, és a Corvista nem üzemeltet saját szervereket.';

  @override
  String get privacyCameraTitle => 'Kamera és MI';

  @override
  String get privacyCamera1 =>
      'Az objektumérzékelés, a követés és a szegmentálás teljes egészében az iPhone-on fut. A kamera képkockái soha nem kerülnek feltöltésre.';

  @override
  String get privacyCamera2 =>
      'A kamera csak akkor működik, amíg a Corvista nyitva van a képernyőn. Az alkalmazás háttérbe kerülésekor szünetel – nincs rejtett háttérfelvétel.';

  @override
  String get privacyRecordingsTitle => 'Felvételek';

  @override
  String get privacyRecordings1 =>
      'A folyamatos puffer ideiglenes, és állandóan felülíródik. A felvétel csak akkor marad meg, ha az Esemény mentése gombra koppint, vagy – ha engedélyezi – lehetséges ütközés után.';

  @override
  String get privacyRecordings2 =>
      'A mentett felvételek a Corvista privát tárhelyén maradnak az iPhone-on. Csak akkor hagyják el az eszközt, ha a Megosztást választja. Az alkalmazás törlésével ezek is törlődnek.';

  @override
  String get privacyRecordings3 =>
      'A hang csak akkor kerül rögzítésre, ha bekapcsolja és megadja a mikrofonhozzáférést.';

  @override
  String get privacyLocationTitle => 'Helyadat';

  @override
  String get privacyLocation1 =>
      'A helyadatot az alkalmazás megnyitott állapotában a sebességhez, a térképhez, az útvonalakhoz és az időjáráshoz használjuk. Ha a „Helyadat mentése” be van kapcsolva, a mentéskori pozíció a felvétellel együtt az eszközön tárolódik.';

  @override
  String get privacyNetworkTitle => 'Hálózati szolgáltatások';

  @override
  String get privacyNetwork1 =>
      'Apple Maps – térképmegjelenítés, helykeresés és útvonaltervezés. A keresett szöveg és hozzávetőleges tartózkodási helye az Apple-nek kerül elküldésre.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) – aktuális és óránkénti időjárás az Ön tartózkodási helyén.';

  @override
  String get privacyNetwork4 =>
      'A Corvista nem tartalmaz hirdetéseket, sem harmadik felek analitikáját vagy követését.';

  @override
  String get privacyEmergencyTitle => 'Vészhelyzeti kapcsolatok';

  @override
  String get privacyEmergency1 =>
      'Az Ön által választott kapcsolatok az eszköz iOS-kulcstartójában tárolódnak. A hangos megszakítás ahol elérhető, eszközön futó beszédfelismerést használ. A hívások és üzenetek csak azután indulnak el, hogy az iOS-ben megerősíti őket.';

  @override
  String get privacyControlsTitle => 'Az Ön lehetőségei';

  @override
  String get privacyControls1 =>
      'A felvételeket bármikor törölheti a Felvételek között, a kamera-, mikrofon-, helyadat- és beszédhozzáférést pedig módosíthatja vagy visszavonhatja az iOS Beállításaiban.';

  @override
  String get termsTitle => 'Felhasználási feltételek';

  @override
  String get termsIntro =>
      'A Corvista használatával elfogadja ezeket a feltételeket. Az Apple szabványos Licensed Application End User License Agreement szerződése is érvényes.';

  @override
  String get termsUseTitle => 'A Corvista használata';

  @override
  String get termsUse1 =>
      'A Corvista vezetési figyelmet és autós kamerát támogató eszköz. Ön mindenkor teljes mértékben felelős a biztonságos és szabályos vezetésért.';

  @override
  String get termsUse2 =>
      'Ne használja az alkalmazást úgy, hogy az elvonja a figyelmét vezetés közben. Az eszközt biztonságosan és jogszerűen rögzítse.';

  @override
  String get termsAccuracyTitle => 'Pontosságra vonatkozó garancia nélkül';

  @override
  String get termsAccuracy1 =>
      'Az érzékelések, zónák, figyelmeztetések, térképjelölők, útvonalak és az időjárás hiányosak, késettek vagy tévesek lehetnek. A Corvista nem irányítja a járművet.';

  @override
  String get termsAccuracy2 =>
      'A vészhelyzeti funkció kísérleti, előfordulhat, hogy nem érzékel egy ütközést, vagy tévesen aktiválódik.';

  @override
  String get termsRecordingTitle => 'Felvételi jogszabályok';

  @override
  String get termsRecording1 =>
      'Az autós kamerákra, a hangrögzítésre és az emberek filmezésére vonatkozó jogszabályok országonként és régiónként eltérnek. Ön felel a betartásukért, a felvételek megosztását is beleértve.';

  @override
  String get termsLiabilityTitle => 'Felelősség';

  @override
  String get termsLiability1 =>
      'Az alkalmazást „adott állapotában” biztosítjuk. A jogszabályok által megengedett mértékben a fejlesztő nem felel a használatból vagy a kimenetre való támaszkodásból eredő balesetekért, veszteségekért, bírságokért vagy károkért.';

  @override
  String get termsChangesTitle => 'Módosítások';

  @override
  String get termsChanges1 =>
      'Ezek a feltételek az alkalmazás új verzióival frissülhetnek. A frissítés utáni további használat a módosított feltételek elfogadását jelenti.';

  @override
  String get helpTitle => 'Súgó';

  @override
  String get helpIntro =>
      'Válaszok gyakori kérdésekre. Biztonsági útmutatásért lásd a Biztonsági információk részt.';

  @override
  String get helpQSave => 'Hogyan őrizhetem meg egy esemény felvételét?';

  @override
  String get helpASaveBuffer =>
      'Koppintson a vezetési nézet nagy Esemény mentése gombjára. A Corvista a gördülő puffer utolsó 20 vagy 30 másodpercét (a Beállítások › Rögzítés alatt választható) a Felvételek közé menti.';

  @override
  String get helpQWhere => 'Hol tárolódnak a felvételeim?';

  @override
  String get helpAWhere =>
      'A Corvista privát tárhelyén az iPhone-on. Soha nem kerülnek feltöltésre. A lejátszóban a Megosztással küldhet vagy exportálhat egy felvételt.';

  @override
  String get helpQZones => 'Mennyire pontosak a közelségi zónák?';

  @override
  String get helpAZones =>
      'A zónák egyetlen kamerából, jellemző objektumméretek alapján készített durva becslések. Tekintse őket hozzávetőleges támpontnak, soha nem távolságnak.';

  @override
  String get helpQSlow => 'Miért lassul le az érzékelés?';

  @override
  String get helpASlow =>
      'Ha az iPhone felmelegszik, az akkumulátor lemerülőben van, vagy az Alacsony fogyasztású mód be van kapcsolva, a Corvista az eszköz védelme érdekében csökkenti az elemzési sebességet. Az energiamódot a Beállításokban módosíthatja.';

  @override
  String get helpQMap => 'A térkép, a keresés vagy az időjárás nem működik.';

  @override
  String get helpAMap =>
      'Ezekhez a funkciókhoz internetkapcsolat és helyadat-hozzáférés szükséges. Ellenőrizze a kapcsolatot, és engedélyezze a Corvista számára a helyadatot az iOS Beállításaiban.';

  @override
  String get helpQSimulator => 'A kamera nem elérhetőként jelenik meg.';

  @override
  String get helpASimulator =>
      'Ellenőrizze, hogy a kamerahozzáférés engedélyezve van az iOS Beállításaiban, és hogy másik alkalmazás nem használja a kamerát. Az iOS Simulatorban nincs kamera; helyette helyi tesztvideó használható.';

  @override
  String get emergencyMsgNoContacts =>
      'Először adjon hozzá egy vészhelyzeti kapcsolatot.';

  @override
  String get cameraStarting => 'Kamera indítása…';

  @override
  String get cameraInterrupted => 'Kamera szüneteltetve';

  @override
  String get cameraInterruptedBody =>
      'Az iOS szüneteltette a kamerát, például hívás közben vagy amikor másik alkalmazás használja. Automatikusan folytatódik.';

  @override
  String get cameraUnavailable => 'A kamera nem érhető el';

  @override
  String get cameraUnavailableBody =>
      'Ezen az eszközön nincs elérhető kamera. Az érzékelési, felvételi és parkolási nézetekhez a hátoldali kamera szükséges.';

  @override
  String get cameraRunTestFootage => 'Tesztvideó futtatása';

  @override
  String get cameraPermissionDenied => 'A kamerahozzáférés ki van kapcsolva';

  @override
  String get cameraPermissionDeniedBody =>
      'A Corvistának szüksége van a kamerára az érzékeléshez, az autós kamerafelvételhez és a parkolási nézetekhez. Kapcsolja be a Kamera hozzáférést a Beállításokban.';

  @override
  String get cameraError => 'Kamerahiba';

  @override
  String get cameraStopped => 'A kamera leállt';

  @override
  String get cameraStart => 'Kamera indítása';

  @override
  String get cameraFocusHint => 'Koppintson a fókuszáláshoz';

  @override
  String get cameraPreviewLabel => 'Élő kameranézet az érzékelt objektumokkal';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · MI $hz Hz · $ms ms · eldobva $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Sebesség $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Nincs GPS-sebesség';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Irány $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds mp';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Autós kamera pufferfelvétele, $seconds / $target másodperc pufferelve';
  }

  @override
  String get hudRecIdle => 'REC ki';

  @override
  String get hudRecSaving => 'Mentés…';

  @override
  String get hudRecError => 'REC-hiba';

  @override
  String get hudAiPaused => 'MI szüneteltetve';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objektum',
      one: '1 objektum',
      zero: 'Nincs objektum',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objektum érzékelve',
      one: '1 objektum érzékelve',
      zero: 'nincs érzékelt objektum',
    );
    return 'MI-modell: $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Forró – az MI lelassítva';

  @override
  String get hudThermalCritical => 'Túl forró – az MI szünetel';

  @override
  String hudBatteryLow(String percent) {
    return 'Akkumulátor $percent';
  }

  @override
  String get hudLowPower => 'Alacsony fogyasztású mód';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Időjárás: $temperature, $condition. Koppintson a részletekért.';
  }

  @override
  String get hudNoGuidance =>
      'Keressen úti célt a Térkép nézetben, hogy itt lássa a kanyarról kanyarra útmutatást.';

  @override
  String get navArrived => 'Megérkezett';

  @override
  String get navRerouting => 'Újratervezés…';

  @override
  String get navSearchHint => 'Úti cél keresése';

  @override
  String get navSearchFieldHint => 'Cím, hely vagy vállalkozás';

  @override
  String get navNoResults => 'Nincs találat';

  @override
  String get navSearching => 'Keresés…';

  @override
  String get navSearchStartTyping =>
      'Írjon be egy címet vagy helynevet. Az eredmények az Apple Mapsből érkeznek, és internetkapcsolat szükséges hozzájuk.';

  @override
  String get navErrorUnavailable =>
      'A keresés és az útvonaltervezés nem érhető el – ellenőrizze az internetkapcsolatot.';

  @override
  String get navErrorNoLocation =>
      'Várakozás a helyadatra az útvonal megtervezéséhez.';

  @override
  String get navErrorPermission =>
      'A helyadat-hozzáférés ki van kapcsolva, ezért az útvonalak nem indíthatók az Ön pozíciójából.';

  @override
  String navErrorGeneric(String code) {
    return 'Az útvonalak nem tölthetők be ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Útvonalak ide: $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Érkezés: $time';
  }

  @override
  String get navStart => 'Indítás';

  @override
  String get navEnd => 'Befejezés';

  @override
  String get navEndLabel => 'Navigáció befejezése';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration van hátra';
  }

  @override
  String navAdvisory(String text) {
    return 'Figyelmeztetés: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes perc',
      one: '1 perc',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours ó $minutes perc';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return '$index. útvonal: $name';
  }

  @override
  String get weatherTitle => 'Időjárás';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Hőérzet: $temperature';
  }

  @override
  String get weatherPrecipitation => 'Csapadék';

  @override
  String get weatherWind => 'Szél';

  @override
  String get weatherVisibility => 'Látótávolság';

  @override
  String get weatherHumidity => 'Páratartalom';

  @override
  String get weatherHourly => 'Következő órák';

  @override
  String weatherAsOf(String time) {
    return 'Frissítve: $time';
  }

  @override
  String get weatherRefresh => 'Időjárás frissítése';

  @override
  String get weatherUnavailable => 'Az időjárás jelenleg nem érhető el.';

  @override
  String get weatherNoLocation => 'Az időjáráshoz szükség van a helyadatra.';

  @override
  String get weatherLegal => 'Adatforrások és jogi információk';

  @override
  String weatherProvidedBy(String service) {
    return 'Időjárási adatok: $service';
  }

  @override
  String get weatherNow => 'Most';

  @override
  String get virtualEmpty => 'Nincs támogatott objektum érzékelve';

  @override
  String get virtualEmptyCameraOff =>
      'A virtuális nézethez élő kamera szükséges.';

  @override
  String get virtualLaneDisclaimer =>
      'A sávjelzések szemléltető jellegűek, nem érzékeltek.';

  @override
  String virtualNearest(String zone) {
    return 'Legközelebbi: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtuális útjelenet: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'MI $status';
  }

  @override
  String get virtualStatusLive => 'él';

  @override
  String get virtualStatusPaused => 'szünetel';

  @override
  String get virtualStatusCameraOff => 'Kamera ki';

  @override
  String get virtualStatusTestFootage => 'Tesztfelvétel';

  @override
  String get virtualEmptyHint =>
      'A járművek, személyek, kerékpárok, lámpák és stoptáblák érzékeléskor itt jelennek meg.';

  @override
  String get mapRecenter => 'Középre';

  @override
  String get mapZoomIn => 'Nagyítás';

  @override
  String get mapZoomOut => 'Kicsinyítés';

  @override
  String get mapUnsupported => 'Az interaktív térkép iPhone-on érhető el.';

  @override
  String get mapObjectsApprox => 'Az objektumjelölők hozzávetőleges pozíciók.';

  @override
  String get mapWeatherUnavailable => 'Az időjárás nem érhető el';

  @override
  String get navErrorNoRoute => 'Nem található útvonal ehhez az úti célhoz.';

  @override
  String get navDismiss => 'Bezárás';

  @override
  String get navGo => 'Indulás';

  @override
  String get navFastest => 'Leggyorsabb';

  @override
  String get navThen => 'Majd';

  @override
  String get navRecents => 'Legutóbbiak';

  @override
  String get navClearRecents => 'Törlés';

  @override
  String get navSearchSubmitHint =>
      'Nyomja meg a Keresés gombot az összes találat megtekintéséhez';

  @override
  String get navPlaces => 'Helyek';

  @override
  String get navEtaLabel => 'érkezés';

  @override
  String get navTimeLeftLabel => 'hátra';

  @override
  String get navOverview => 'Áttekintés';

  @override
  String get navMute => 'Hang némítása';

  @override
  String get navUnmute => 'Hang bekapcsolása';

  @override
  String get navEndConfirm => 'Befejezi a navigációt?';

  @override
  String navEndConfirmBody(String place) {
    return 'A(z) $place felé tartó útmutatás leáll.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Megérkezett ide: $place';
  }

  @override
  String get navDone => 'Kész';

  @override
  String get navWeakGps => 'Gyenge GPS-jel';

  @override
  String get navLocationOff =>
      'A helyadat ki van kapcsolva. Kapcsolja be az útvonaltervezéshez és a navigációhoz.';

  @override
  String get navVoiceGuidance => 'Hangos útmutatás';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance múlva, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, majd $second';
  }

  @override
  String get navSpeakRerouting => 'Újratervezés';

  @override
  String get navSpeakArrived => 'Megérkezett';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count méter',
      one: '1 méter',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilométer',
      one: '1 kilométer',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count láb',
      one: '1 láb',
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
    return 'Haladjon tovább $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Ebben a régióban ehhez az úthoz nem érhető el útmutatás. Próbálkozzon másik úti céllal.';

  @override
  String navContinueFor(String distance) {
    return 'Haladjon tovább $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value mérföld',
      one: '1 mérföld',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Legközelebbi: $object · $zone';
  }

  @override
  String get parkingNothing => 'Semmi nem érzékelhető a látómezőben';

  @override
  String get parkingBeeps => 'Közelségi hangjelzések';

  @override
  String get parkingVolume => 'Hangjelzés hangereje';

  @override
  String get parkingLimitations =>
      'Egyetlen kamera, nem 360°. A kamera látómezején kívüli objektumokat nem érzékeli. Nem helyettesíti a parkolóradart; a becslések tévesek lehetnek, és a csend nem jelenti azt, hogy a terület szabad.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Felülnézeti közelségi nézet. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Eredeti';

  @override
  String get perceptionModeBoxes => 'Keretek';

  @override
  String get perceptionModeMasks => 'Objektummaszkok';

  @override
  String get perceptionModeRoad => 'Útfelület';

  @override
  String get perceptionModeCombined => 'Kombinált';

  @override
  String get perceptionOpacity => 'Maszk átlátszatlansága';

  @override
  String get perceptionDisclaimer =>
      'Az útfelületi maszk hozzávetőleges vizuális réteg. Nem mutatja a járható területet és a sávokat.';

  @override
  String get perceptionNeedsModel =>
      'A maszkok megtekintéséhez válassza a Szegmentálás modellt.';

  @override
  String get perceptionChooseModel => 'Modell kiválasztása';

  @override
  String get perceptionWaiting => 'Várakozás az első szegmentálási képkockára…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Keretek';

  @override
  String get perceptionShortObjects => 'Objektumok';

  @override
  String get perceptionShortRoad => 'Út';

  @override
  String get perceptionShortAll => 'Mind';

  @override
  String get perceptionModesLabel => 'Észlelési rétegek';

  @override
  String get perceptionStatusWarmingUp => 'Bemelegítés…';

  @override
  String get perceptionStatusLoadingModel => 'Modell betöltése…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Maszkok szüneteltetve';

  @override
  String get perceptionLegend => 'Maszkjelmagyarázat';

  @override
  String get perceptionUnavailable => 'A maszkok nem érhetők el';

  @override
  String get driveSave => 'Mentés';

  @override
  String get driveSaveIncident => 'Esemény mentése';

  @override
  String driveSaveHint(int seconds) {
    return 'Elmenti az autós kamera utolsó $seconds másodpercét';
  }

  @override
  String get driveSaving => 'Esemény mentése…';

  @override
  String hudRecManualLabel(String time) {
    return 'Rögzítés folyamatban, $time';
  }

  @override
  String get driveRecord => 'Rögzítés';

  @override
  String get driveRecordStartA11y => 'Rögzítés indítása';

  @override
  String driveRecordStopA11y(String time) {
    return 'Rögzítés leállítása, $time rögzítve';
  }

  @override
  String get driveRecordHint =>
      'Folyamatosan rögzít a leállításig, az utolsó 5 másodpercet is beleértve';

  @override
  String get driveRecordFailed => 'A rögzítést nem sikerült elindítani';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rögzítés mentve · $count rész',
      one: 'Rögzítés mentve',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'A rögzítés leállt: a tárhely majdnem megtelt',
      'max_duration': 'A rögzítés leállt: elérte a maximális hosszt',
      'camera_stopped': 'A rögzítés a kamerával együtt leállt',
      'background': 'A rögzítés leállt: az alkalmazás a háttérbe került',
      'thermal': 'A rögzítés leállt: a telefon túl meleg',
      'other': 'A rögzítés leállt',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Esemény mentve · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Megtekintés';

  @override
  String get driveSaveFailed => 'Az esemény nem menthető.';

  @override
  String get driveSaveNotRunning =>
      'A rögzítés még nem indult el – várja meg a kamera indulását, majd próbálja újra.';

  @override
  String get driveSaveTestFootage =>
      'A tesztvideó nem kerül rögzítésre. Az események mentése az élő kamerával működik.';

  @override
  String get driveSaveStorageFull =>
      'Az iPhone tárhelye megtelt. Szabadítson fel helyet, vagy törölje a régebbi felvételeket.';

  @override
  String get driveSaveIoError => 'A felvételt nem sikerült a tárhelyre írni.';

  @override
  String get driveClips => 'Felvételek';

  @override
  String get driveSettings => 'Beállítások';

  @override
  String get driveViewSwitcher => 'Vezetési nézetek';

  @override
  String get driveLocationDenied =>
      'A helyadat ki van kapcsolva – a sebesség, a térképek és az útvonalak nem érhetők el.';

  @override
  String get driveCameraDenied =>
      'A kamerahozzáférés ki van kapcsolva – az érzékelés és a rögzítés nem érhető el.';

  @override
  String get driveRecorderFallback =>
      'Rögzítés hang nélkül: a mikrofonhozzáférés ki van kapcsolva.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'A rögzítési beállítások módosultak: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Az iPhone forró. Az MI lassabban fut a lehűléshez – tartsa távol a közvetlen naptól, és szellőzőnyílás közelében.';

  @override
  String get drivePowerThermalCritical =>
      'Az iPhone túl forró. Az MI-érzékelés szünetel, amíg le nem hűl; a rögzítés lehetőség szerint folytatódik.';

  @override
  String get drivePowerLowPower =>
      'Az Alacsony fogyasztású mód be van kapcsolva – az MI csökkentett sebességgel fut.';

  @override
  String get drivePowerBatteryLow =>
      'Az akkumulátor lemerülőben van – vezetés közben csatlakoztassa az iPhone-t töltőre.';

  @override
  String get onboardingTitle1 => 'Lásson többet minden úton.';

  @override
  String get onboardingBody1 =>
      'Változtassa iPhone-ját intelligens autós kamerává és vezetési társsá.';

  @override
  String get onboardingTitle2 => 'Intelligencia minden képkockában.';

  @override
  String get onboardingBody2 =>
      'Ismerje fel a támogatott járműveket, személyeket, kerékpárokat és útjelzéseket közvetlenül az iPhone-on.';

  @override
  String get onboardingTitle3 => 'Egy út. Több nézőpont.';

  @override
  String get onboardingBody3 =>
      'Váltson az élő érzékelés, a virtuális vezetési nézetek, az interaktív térképek és a parkolási megjelenítés között.';

  @override
  String get onboardingTitle4 => 'Őrizze meg a fontos pillanatokat.';

  @override
  String get onboardingBody4 =>
      'Mentse az autós kamera friss felvételeit, tekintse át az eseményeket, és ossza meg a felvételeket.';

  @override
  String get onboardingTitle5 => 'Biztonság és adatvédelem';

  @override
  String get onboardingSafety1 =>
      'A Corvista vezetési figyelmet segítő eszköz. Tartsa szemét az úton.';

  @override
  String get onboardingSafety2 =>
      'Nem irányítja a járművet, és nem helyettesíti az ítélőképességét.';

  @override
  String get onboardingSafety3 =>
      'Az érzékelések és becslések pontatlanok lehetnek, vagy kimaradhatnak.';

  @override
  String get onboardingSafety4 =>
      'A kamerakép feldolgozása az iPhone-on történik – a videó nem kerül feltöltésre.';

  @override
  String get onboardingSafety5 =>
      'A térképekhez, a kereséshez, az útvonalakhoz és az időjáráshoz internetkapcsolat szükséges.';

  @override
  String get onboardingSafety6 =>
      'Rögzítse az iPhone-t biztonságosan, hogy ne takarja el a kilátást.';

  @override
  String get onboardingSafety7 => 'A beállítást fejezze be, mielőtt elindul.';

  @override
  String get onboardingAcknowledge =>
      'Tudomásul veszem, hogy a Corvista figyelmet segítő eszköz, és továbbra is én felelek a biztonságos vezetésért.';

  @override
  String get onboardingReadSafety =>
      'A teljes biztonsági információ elolvasása';

  @override
  String get onboardingNext => 'Tovább';

  @override
  String get onboardingSkip => 'Kihagyás';

  @override
  String get onboardingAgree => 'Folytatás';

  @override
  String onboardingPageLabel(int current, int total) {
    return '$current. oldal / $total';
  }

  @override
  String get permTitle => 'Engedélyek';

  @override
  String get permIntro =>
      'A Corvista csak azt kéri, amire az egyes funkcióknak szükségük van. Ezeket bármikor módosíthatja a Beállításokban.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Az érzékeléshez, az autós kamerafelvételhez és a parkolási nézethez szükséges. A videó feldolgozása az iPhone-on történik.';

  @override
  String get permLocationTitle => 'Helyadat';

  @override
  String get permLocationBody =>
      'GPS-sebességhez, térképhez, útvonalakhoz, időjáráshoz és a mentett felvételek címkézéséhez. Csak az alkalmazás használata közben.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'A beszédfelismerést csak akkor kéri, ha bekapcsolja a hangos megszakítást a vészhelyzeti riasztásokhoz.';

  @override
  String get permRequired => 'Kötelező';

  @override
  String get permOptional => 'Opcionális';

  @override
  String get permAllow => 'Engedélyezés';

  @override
  String get permGranted => 'Engedélyezve';

  @override
  String get permDenied => 'Megtagadva';

  @override
  String get permLimited => 'Korlátozott';

  @override
  String get permRestricted => 'Korlátozva';

  @override
  String get permStart => 'Vezetés indítása';

  @override
  String get permCameraNeeded =>
      'Folytathatja kamerahozzáférés nélkül is, de az érzékelés és a rögzítés nem fog működni, amíg a Beállításokban nem engedélyezi.';

  @override
  String get permSetupIntro =>
      'A Corvistának ezekre van szüksége a teljes működéshez. Koppintson az Összes engedélyezése gombra, és az iOS sorban rákérdez mindegyikre. Bármikor módosíthatja őket a Beállításokban.';

  @override
  String get permCameraLine =>
      'Az érzékeléshez, az autós kamerafelvételhez és a parkolási nézethez szükséges. A videó feldolgozása az iPhone-on történik, soha nem kerül feltöltésre.';

  @override
  String get permLocationLine =>
      'GPS-sebesség, térkép, útvonalak, időjárás és a felvételek mentési helye. Csak az alkalmazás használata közben.';

  @override
  String get permMicLine =>
      'Az utastér hangja az eseményfelvételekben, valamint a megszakító kifejezés meghallása vészhelyzeti riasztás közben.';

  @override
  String get permSpeechTitle => 'Beszédfelismerés';

  @override
  String get permSpeechLine =>
      'Felismeri a megszakító kifejezést vészhelyzeti visszaszámlálás közben, az iPhone-on, ahol támogatott.';

  @override
  String get permAllowAll => 'Összes engedélyezése';

  @override
  String permAsking(String permission) {
    return 'Engedély kérése: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Néhány engedély ki van kapcsolva. Kapcsolja be őket a Beállításokban, hogy használhassa ezeket a funkciókat.';

  @override
  String get permNotNow => 'Most nem';

  @override
  String get tourLabel => 'Vezetési képernyő bemutatója';

  @override
  String tourProgress(int current, int total) {
    return '$current. lépés / $total';
  }

  @override
  String get tourNext => 'Tovább';

  @override
  String get tourBack => 'Vissza';

  @override
  String get tourSkip => 'Bemutató kihagyása';

  @override
  String get tourFinish => 'Vezetés indítása';

  @override
  String get tourWelcomeTitle => 'Gyors bemutató';

  @override
  String get tourWelcomeBody =>
      'Egyperces áttekintés a Vezetés képernyő lényeges elemeiről. A legjobb, ha állva végzi el.';

  @override
  String get tourHudTitle => 'A műszersor';

  @override
  String get tourHudSpeed => 'A sebesség a GPS-ből származik.';

  @override
  String get tourHudRec =>
      'A REC megmutatja, hány másodpercnyi felvétel van pufferelve.';

  @override
  String get tourHudAi =>
      'Az MI-jelvény megmutatja a modellt, a látott objektumok számát és egy pontot: zöld fut, borostyán korlátozott, piros leállt.';

  @override
  String get tourSaveTitle => 'Esemény mentése';

  @override
  String tourSaveBody(int seconds) {
    return 'A Corvista folyamatos puffert tart fenn a videó utolsó $seconds másodpercéről. Ez állandóan felülíródik, ezért semmi sem marad meg, hacsak nem koppint a Mentés gombra. A mentett felvételek ezen az iPhone-on maradnak, a Felvételek között.';
  }

  @override
  String get tourRecordTitle => 'Rögzítse az egész utat';

  @override
  String get tourRecordBody =>
      'Koppintson a Rögzítés gombra a folyamatos filmezéshez a leállításig. A hosszú utak 5 perces részekben kerülnek a Felvételek közé, és az Esemény mentése rögzítés közben is működik.';

  @override
  String get tourViewsTitle => 'Az utat ötféleképpen láthatja';

  @override
  String get tourViewDetection =>
      'Élő kamera, a támogatott objektumok körül keretekkel.';

  @override
  String get tourViewVirtual =>
      'Az érzékelésekből épített egyszerűsített 3D-jelenet.';

  @override
  String get tourViewMap =>
      'Apple Maps kereséssel és kanyarról kanyarra útmutatással.';

  @override
  String get tourViewParking => 'Kamera felülnézeti közelségi nézettel.';

  @override
  String get tourViewPerception => 'Út- és objektummaszkok.';

  @override
  String get tourMapTitle => 'Keresés és kanyarról kanyarra útmutatás';

  @override
  String get tourMapBody =>
      'Nyissa meg a Térképet, koppintson a keresősávra, és válasszon úti célt. Válasszon útvonalat, majd koppintson az Indítás gombra a kanyarról kanyarra útmutatáshoz. Internetkapcsolat szükséges.';

  @override
  String get tourClipsTitle => 'Felvételek';

  @override
  String get tourClipsBody =>
      'A mentett eseményeket áttekintheti, átnevezheti, megoszthatja vagy törölheti. A felvételek az iPhone-on maradnak, hacsak meg nem osztja őket.';

  @override
  String get tourSettingsTitle => 'Beállítások';

  @override
  String get tourSettingsBody =>
      'Hangolja a hangfigyelmeztetéseket és azok érzékenységét, a felvétel minőségét és a puffer hosszát, és állítsa be a Vészhelyzet módot: kísérleti ütközésjelzés megszakító visszaszámlálással.';

  @override
  String get tourSafetyTitle => 'Indulás előtt';

  @override
  String get tourSafety1 =>
      'Rögzítse az iPhone-t biztonságosan, hogy ne takarja el a kilátást.';

  @override
  String get tourSafety2 =>
      'Vezetés közben ne használja az alkalmazást. A beállításokat állva végezze el.';

  @override
  String get tourSafety3 =>
      'Az érzékelések és zónák becslések. Tévesek lehetnek, vagy kimaradhatnak.';

  @override
  String get tourSafety4 => 'A biztonságos vezetésért továbbra is Ön felel.';

  @override
  String get helpTakeTour => 'Bemutató megtekintése';

  @override
  String get helpTakeTourSub =>
      'Egyperces, vezetett áttekintés a Vezetés képernyőről.';

  @override
  String get tripsTitle => 'Utak';

  @override
  String get tripsOpen => 'Útnapló';

  @override
  String get tripsEmptyTitle => 'Még nincsenek utak';

  @override
  String get tripsEmptyBody =>
      'Az utak automatikusan rögzítésre kerülnek, amíg a Corvistával vezet – távolság, idő, sebesség és a megtett útvonal.';

  @override
  String get tripsDisabledBody =>
      'Az útnapló ki van kapcsolva, ezért az új utak nem kerülnek rögzítésre. Kapcsolja be, hogy privát naplót vezessen az útvonalairól ezen az iPhone-on.';

  @override
  String get tripsEnable => 'Útnapló bekapcsolása';

  @override
  String get tripsToday => 'Ma';

  @override
  String get tripsYesterday => 'Tegnap';

  @override
  String tripsRecordingNow(String distance) {
    return 'Út rögzítése · $distance';
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
      other: '$count esemény',
      one: '1 esemény',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count figyelmeztetés',
      one: '1 figyelmeztetés',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count út',
      one: '1 út',
      zero: 'Nincs út',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Távolság';

  @override
  String get tripsStatDuration => 'Időtartam';

  @override
  String get tripsStatMoving => 'Mozgási idő';

  @override
  String get tripsStatAvgSpeed => 'Átl. sebesség';

  @override
  String get tripsStatMaxSpeed => 'Max. sebesség';

  @override
  String get tripsDetections => 'Érzékelések';

  @override
  String get tripsNoDetections =>
      'Ezen az úton nem kerültek naplózásra közlekedési objektumok.';

  @override
  String get tripsTimeline => 'Idővonal';

  @override
  String get tripsEventStart => 'Út elindult';

  @override
  String get tripsEventEnd => 'Út véget ért';

  @override
  String get tripsEventAlert => 'Hangfigyelmeztetés';

  @override
  String get tripsEventIncident => 'Eseményfelvétel mentve';

  @override
  String get tripsEventEmergency => 'Lehetséges ütközést érzékeltünk';

  @override
  String get tripsEventNavStart => 'Navigáció elindult';

  @override
  String get tripsEventArrive => 'Megérkezés az úti célhoz';

  @override
  String get tripsEventReroute => 'Útvonal újratervezve';

  @override
  String get tripsEventRecording => 'Rögzítés mentve';

  @override
  String get tripsOpenClip => 'Felvétel megnyitása';

  @override
  String get tripsTrackPreview => 'GPS-nyomvonal';

  @override
  String get tripsRenameTitle => 'Út átnevezése';

  @override
  String get tripsRenameHint => 'Út neve';

  @override
  String get tripsFavorite => 'Hozzáadás a kedvencekhez';

  @override
  String get tripsUnfavorite => 'Eltávolítás a kedvencek közül';

  @override
  String get tripsShareGpx => 'GPX megosztása';

  @override
  String get tripsShareFailed => 'Az út nem osztható meg.';

  @override
  String get tripsDelete => 'Út törlése';

  @override
  String get tripsDeleteConfirmTitle => 'Törli ezt az utat?';

  @override
  String get tripsDeleteConfirmBody =>
      'Az útvonal és a statisztikák törlődnek erről az iPhone-ról. Az út eseményfelvételei megmaradnak.';

  @override
  String get tripsDeleted => 'Út törölve';

  @override
  String get tripsNotFound => 'Ez az út már nem érhető el.';

  @override
  String get tripsPrivacyNote =>
      'Csak ezen az iPhone-on tárolva. Semmi nem kerül feltöltésre.';

  @override
  String get settingsSectionTrips => 'Útnapló';

  @override
  String get settingsTripLog => 'Utak rögzítése';

  @override
  String get settingsTripLogSubtitle =>
      'Az útvonalait és vezetési statisztikáit csak ezen az iPhone-on őrzi meg.';

  @override
  String get settingsTripRetention => 'Utak megőrzése';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days nap',
      one: '1 nap',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 év';

  @override
  String get settingsRetentionForever => 'Örökre';

  @override
  String get settingsTripRetentionFooter =>
      'A régebbi utak automatikusan törlődnek a Corvista indításakor.';

  @override
  String get settingsViewTrips => 'Utak megtekintése';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours ó $minutes perc';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes perc';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista-út $date';
  }

  @override
  String get settingsFreeUpSpace => 'Hely felszabadítása';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Eltávolítja az ideiglenes fájlokat és gyorsítótárakat. A mentett felvételek és utak megmaradnak.';

  @override
  String settingsFreedBytes(String size) {
    return 'Felszabadítva: $size';
  }

  @override
  String get settingsNothingToFree =>
      'Gyorsítótárak törölve – nincs eltávolítandó ideiglenes fájl.';

  @override
  String get settingsSectionPrivacyData => 'Adatvédelem és adatok';

  @override
  String get settingsPrivacyDataFooter =>
      'A felvételeket, utakat és beállításokat csak ez az iPhone tárolja. Csak akkor hagyják el, ha Ön megosztja őket.';

  @override
  String get settingsDeleteAllData => 'Minden adat törlése';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Felvételek, utak, kapcsolatok és beállítások törlése erről az iPhone-ról';

  @override
  String get deleteAllTitle => 'Törli az összes adatot?';

  @override
  String get deleteAllMessage =>
      'Ez véglegesen eltávolítja erről az iPhone-ról:\n• Eseményfelvételek és bélyegképek\n• Útnapló és GPS-nyomvonalak\n• Vészhelyzeti kapcsolatok és vészhelyzeti események\n• Észlelési naplók és a diagnosztikai napló\n• Beállítások és legutóbbi úti célok\n• Ideiglenes rögzítési puffer és gyorsítótár\n\nEz nem vonható vissza. A Corvista ezután újra az üdvözlőképernyőkkel indul.';

  @override
  String get deleteAllConfirm => 'Minden törlése';

  @override
  String get deleteAllInProgress => 'Törlés…';

  @override
  String get deleteAllDone => 'Minden adat törölve';

  @override
  String get deleteAllPartial =>
      'Néhány elemet nem sikerült törölni. Próbálja újra a Beállításokból.';

  @override
  String get diagLogSection => 'Diagnosztikai napló';

  @override
  String get diagLogFooter =>
      'A hibák naplózása kizárólag ezen az iPhone-on történik, helyadatok, kapcsolatnevek és telefonszámok nélkül. Semmi nem kerül elküldésre, hacsak Ön nem osztja meg a naplót.';

  @override
  String get diagLogShare => 'Diagnosztikai napló megosztása';

  @override
  String get diagLogEmpty => 'Üres';

  @override
  String get diagLogClear => 'Napló törlése';

  @override
  String get diagLogClearTitle => 'Törli a diagnosztikai naplót?';

  @override
  String get diagLogClearBody =>
      'A mentett hibabejegyzések törlődnek erről az iPhone-ról.';

  @override
  String get diagLogCleared => 'Diagnosztikai napló törölve';

  @override
  String get diagLogShareFailed =>
      'A diagnosztikai napló megosztása nem sikerült.';

  @override
  String get privacyControls2 =>
      'Beállítások › Adatvédelem és adatok › Minden adat törlése minden felvételt, utat, kapcsolatot, naplót és beállítást töröl, amelyet a Corvista ezen az iPhone-on tárol.';

  @override
  String get parkingZoneStop => 'Állj';

  @override
  String get parkingZoneVeryClose => 'Nagyon közel';

  @override
  String get parkingZoneClose => 'Közel';

  @override
  String get parkingZoneNothingClose => 'Nincs észlelt közeli tárgy';

  @override
  String get parkingNotDetected =>
      'A falak, oszlopok, cölöpök és szegélykövek nem észlelhetők';

  @override
  String get parkingApprox => 'kb.';

  @override
  String get parkingSideLeft => 'Bal';

  @override
  String get parkingSideCenter => 'Közép';

  @override
  String get parkingSideRight => 'Jobb';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Csak az első kamera képe — nem 360°-os rendszer';

  @override
  String get parkingMuteBeeps => 'Hangjelzés némítása';

  @override
  String get parkingUnmuteBeeps => 'Hangjelzés bekapcsolása';

  @override
  String get parkingAbout => 'A parkolási nézetről';

  @override
  String get parkingLimitationsDetail =>
      'Csak a kamera előtti terület figyelt. Az érzékelő felismeri az autókat, buszokat és teherautókat, embereket, kerékpárokat és motorkerékpárokat. A falakat, oszlopokat, cölöpöket, szegélyköveket, terelőoszlopokat, sorompókat és alacsony akadályokat NEM érzékeli, és a motorháztető eltakarhatja a közvetlenül előtte lévő talajt. A távolságok egyetlen kamera alapján (a tárgy mérete és helyzete) adott durva becslések, és nagyot tévedhetnek. A csend vagy a „Nincs észlelt közeli tárgy” nem jelenti azt, hogy szabad az út – mindig nézzen körül, és használja a tükröket.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Közelség oldalanként: bal $left, közép $center, jobb $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'A hibák egy privát naplóba kerülnek ezen az iPhone-on (helyadatok, kapcsolatnevek és telefonszámok nélkül). Automatikusan soha nem kerül elküldésre; a Beállítások › Diagnosztika alatt megoszthatja vagy törölheti.';
}
