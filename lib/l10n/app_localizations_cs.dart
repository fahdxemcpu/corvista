// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Uvidíte víc na každé cestě.';

  @override
  String get commonCancel => 'Zrušit';

  @override
  String get commonDelete => 'Smazat';

  @override
  String get commonSave => 'Uložit';

  @override
  String get commonBack => 'Zpět';

  @override
  String get commonClose => 'Zavřít';

  @override
  String get commonRetry => 'Zkusit znovu';

  @override
  String get commonOpenSettings => 'Otevřít Nastavení';

  @override
  String get commonLoading => 'Načítání…';

  @override
  String get commonError => 'Něco se pokazilo.';

  @override
  String commonErrorDetail(String message) {
    return 'Něco se pokazilo: $message';
  }

  @override
  String get commonOn => 'Zap.';

  @override
  String get commonOff => 'Vyp.';

  @override
  String get commonRename => 'Přejmenovat';

  @override
  String get commonShare => 'Sdílet';

  @override
  String get commonNotAvailable => 'Nedostupné';

  @override
  String get commonTestFootage => 'TESTOVACÍ ZÁZNAM';

  @override
  String get zoneVeryClose => 'Velmi blízko';

  @override
  String get zoneClose => 'Blízko';

  @override
  String get zoneMedium => 'Střední';

  @override
  String get zoneFar => 'Daleko';

  @override
  String get zoneUnknown => 'Neznámá';

  @override
  String get classPerson => 'Osoba';

  @override
  String get classBicycle => 'Kolo';

  @override
  String get classMotorcycle => 'Motocykl';

  @override
  String get classCar => 'Vozidlo';

  @override
  String get classBus => 'Autobus';

  @override
  String get classTrafficLight => 'Semafor';

  @override
  String get classStopSign => 'Značka STOP';

  @override
  String get viewDetection => 'Detekce';

  @override
  String get viewVirtual => 'Virtuální';

  @override
  String get viewMap => 'Mapa';

  @override
  String get viewParking => 'Parkování';

  @override
  String get viewPerception => 'Percepce';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Červená';

  @override
  String get lightYellow => 'Žlutá';

  @override
  String get lightGreen => 'Zelená';

  @override
  String get lightUnknown => 'Neznámá';

  @override
  String get clipsTitle => 'Záznamy';

  @override
  String get clipsSelect => 'Vybrat';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vybráno $count',
      many: 'Vybráno $count',
      few: 'Vybrány $count',
      one: 'Vybrán 1',
      zero: 'Vyberte záznamy',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Vybrat vše';

  @override
  String get clipsDeselectAll => 'Zrušit výběr';

  @override
  String get clipsDeleteSelected => 'Smazat vybrané';

  @override
  String get clipsGridView => 'Zobrazení mřížky';

  @override
  String get clipsListView => 'Zobrazení seznamu';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Smazat $count záznamů?',
      many: 'Smazat $count záznamu?',
      few: 'Smazat $count záznamy?',
      one: 'Smazat tento záznam?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tato videa budou trvale odstraněna z vašeho iPhonu. Tuto akci nelze vrátit zpět.',
      many: 'Tato videa budou trvale odstraněna z vašeho iPhonu. Tuto akci nelze vrátit zpět.',
      few: 'Tato videa budou trvale odstraněna z vašeho iPhonu. Tuto akci nelze vrátit zpět.',
      one: 'Video bude trvale odstraněno z vašeho iPhonu. Tuto akci nelze vrátit zpět.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Smazáno $count záznamů',
      many: 'Smazáno $count záznamu',
      few: 'Smazány $count záznamy',
      one: 'Záznam smazán',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Zatím žádné záznamy';

  @override
  String get clipsEmptyBody =>
      'Během jízdy Corvista uchovává krátkou průběžnou vyrovnávací paměť. Klepnutím na Uložit událost si zde ponecháte posledních několik sekund záznamu.';

  @override
  String get clipsLoadError => 'Záznamy se nepodařilo načíst.';

  @override
  String get clipsStorageTitle => 'Úložiště';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Záznamy $clips · Vyrovnávací paměť $buffer · volno $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uložených záznamů',
      many: '$count uloženého záznamu',
      few: '$count uložené záznamy',
      one: '1 uložený záznam',
      zero: 'Žádné uložené záznamy',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'V iPhonu dochází úložiště. Nové události se nemusí uložit.';

  @override
  String get clipsMissingFile => 'Soubor chybí';

  @override
  String get clipsEmergencyBadge => 'Náraz';

  @override
  String clipsUntitled(String date) {
    return 'Událost · $date';
  }

  @override
  String get clipsAudio => 'Zvuk nahrán';

  @override
  String get clipsFavorite => 'Oblíbené';

  @override
  String get clipsUnfavorite => 'Odebrat z oblíbených';

  @override
  String get clipsLocation => 'Poloha uložena';

  @override
  String clipsOpenClip(String title) {
    return 'Otevřít záznam $title';
  }

  @override
  String get playerNotFoundTitle => 'Záznam nenalezen';

  @override
  String get playerNotFoundBody => 'Tento záznam mohl být smazán.';

  @override
  String get playerMissingTitle => 'Chybí videosoubor';

  @override
  String get playerMissingBody =>
      'Nahrávka tohoto záznamu už v iPhonu není. Položku můžete odstranit z galerie.';

  @override
  String get playerRemoveEntry => 'Odstranit položku';

  @override
  String get playerLoadError => 'Toto video nelze přehrát.';

  @override
  String get playerPlay => 'Přehrát';

  @override
  String get playerPause => 'Pozastavit';

  @override
  String get playerReplay => 'Přehrát znovu';

  @override
  String get playerRenameTitle => 'Přejmenovat záznam';

  @override
  String get playerRenameHint => 'Název záznamu';

  @override
  String get playerRenamed => 'Záznam přejmenován';

  @override
  String get playerFavorited => 'Přidáno do oblíbených';

  @override
  String get playerUnfavorited => 'Odebráno z oblíbených';

  @override
  String get playerShareFailed => 'Tento záznam se nepodařilo sdílet.';

  @override
  String get playerDetails => 'Podrobnosti';

  @override
  String get playerDate => 'Nahráno';

  @override
  String get playerDuration => 'Délka';

  @override
  String get playerResolution => 'Rozlišení';

  @override
  String get playerSize => 'Velikost souboru';

  @override
  String get playerAudio => 'Zvuk';

  @override
  String get playerAudioYes => 'Nahrán';

  @override
  String get playerAudioNo => 'Nenahrán';

  @override
  String get playerReason => 'Uloženo pomocí';

  @override
  String get playerReasonManual => 'Tlačítko Uložit událost';

  @override
  String get playerReasonEmergency => 'Detekce možného nárazu';

  @override
  String get playerReasonRecovered => 'Obnoveno po přerušení';

  @override
  String get playerSpeed => 'Rychlost GPS při uložení';

  @override
  String get playerLocation => 'Poloha';

  @override
  String get playerOpenInMaps => 'Otevřít v Mapách';

  @override
  String get playerBack => 'Zpět';

  @override
  String get playerMore => 'Další akce';

  @override
  String get clipsFilterLabel => 'Zobrazit';

  @override
  String get clipsFilterAll => 'Vše';

  @override
  String get clipsFilterRecordings => 'Ruční';

  @override
  String get clipsFilterIncidents => 'Události';

  @override
  String get clipsFilterEmergency => 'Tísňové';

  @override
  String get clipsFilterFavorites => 'Oblíbené';

  @override
  String get clipsSort => 'Řazení';

  @override
  String get clipsSortNewest => 'Nejnovější první';

  @override
  String get clipsSortOldest => 'Nejstarší první';

  @override
  String get clipsSortLongest => 'Nejdelší první';

  @override
  String get clipsSortLargest => 'Největší první';

  @override
  String get clipsToday => 'Dnes';

  @override
  String get clipsYesterday => 'Včera';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count záznamů',
      many: '$count záznamu',
      few: '$count záznamy',
      one: '$count záznam',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'V této kategorii zatím nejsou žádné záznamy.';

  @override
  String get clipsFavoritesEmpty =>
      'Označte záznam hvězdičkou, aby byl tady po ruce.';

  @override
  String get clipsKindRecording => 'Ruční záznam';

  @override
  String get clipsKindIncident => 'Událost';

  @override
  String get clipsKindEmergency => 'Tísňový';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Jízda · $time';
  }

  @override
  String get clipsOpenTrip => 'Otevřít jízdu, během které byl záznam pořízen';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return 'Využito $used · volno $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Záznamy zabírají $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ručních záznamů',
      many: '$count ručního záznamu',
      few: '$count ruční záznamy',
      one: '$count ruční záznam',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count událostí',
      many: '$count události',
      few: '$count události',
      one: '$count událost',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tísňových',
      many: '$count tísňového',
      few: '$count tísňové',
      one: '$count tísňový',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Uvolnit místo';

  @override
  String get clipsStorageLowGentle =>
      'Volné místo je menší než 2 GB. Aby nahrávání probíhalo plynule, uvolněte místo nebo smažte záznamy, které už nepotřebujete.';

  @override
  String get clipsSaveToPhotos => 'Uložit do Fotek';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count záznamů',
      many: '$count záznamu',
      few: '$count záznamy',
      one: '$count záznam',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Smazat $count záznamů ($size)?',
      many: 'Smazat $count záznamu ($size)?',
      few: 'Smazat $count záznamy ($size)?',
      one: 'Smazat tento záznam ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Ukládání do Fotek: $done z $total…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Uloženo $count záznamů do Fotek',
      many: 'Uloženo $count záznamu do Fotek',
      few: 'Uloženy $count záznamy do Fotek',
      one: 'Uloženo do Fotek',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return 'Uloženo do Fotek: $saved · nepodařilo se uložit: $failed';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista nemá povolení přidávat videa do Fotek. Můžete to povolit v Nastavení.';

  @override
  String get clipsPhotosFailed => 'Uložení do Fotek se nepodařilo.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Přidáno $count záznamů do oblíbených',
      many: 'Přidáno $count záznamu do oblíbených',
      few: 'Přidány $count záznamy do oblíbených',
      one: 'Přidáno do oblíbených',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odebráno $count záznamů z oblíbených',
      many: 'Odebráno $count záznamu z oblíbených',
      few: 'Odebrány $count záznamy z oblíbených',
      one: 'Odebráno z oblíbených',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (zkráceno)';
  }

  @override
  String get playerTrim => 'Zkrátit';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Typ';

  @override
  String get playerReasonRecording => 'Tlačítko nahrávání';

  @override
  String get trimTitle => 'Zkrátit záznam';

  @override
  String get trimHint =>
      'Přetažením úchytů vyberte část, kterou chcete zachovat. Původní záznam zůstane beze změny.';

  @override
  String get trimStartHandle => 'Začátek střihu';

  @override
  String get trimEndHandle => 'Konec střihu';

  @override
  String trimSelection(String duration) {
    return 'Vybráno: $duration';
  }

  @override
  String get trimSave => 'Uložit jako nový záznam';

  @override
  String get trimSaving => 'Ukládání zkráceného záznamu…';

  @override
  String get trimSaved => 'Zkrácený záznam uložen';

  @override
  String get trimOpenNew => 'Otevřít';

  @override
  String get trimFailed => 'Tento záznam se nepodařilo zkrátit.';

  @override
  String get trimStorageFull =>
      'Není dost volného místa pro uložení zkráceného záznamu.';

  @override
  String get trimPreview => 'Přehrát výběr';

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Upozornění';

  @override
  String get settingsSectionAlertCategories => 'Kategorie upozornění';

  @override
  String get settingsSectionRecording => 'Nahrávání';

  @override
  String get settingsSectionDriving => 'Jízda';

  @override
  String get settingsSectionPower => 'Napájení';

  @override
  String get settingsSectionEmergency => 'Tísňové volání';

  @override
  String get settingsSectionAppearance => 'Vzhled';

  @override
  String get settingsSectionLanguage => 'Jazyk';

  @override
  String get settingsSectionInformation => 'Informace';

  @override
  String get settingsCameraLens => 'Objektiv';

  @override
  String get settingsLensWide => 'Širokoúhlý';

  @override
  String get settingsLensUltraWide => 'Ultraširokoúhlý';

  @override
  String get settingsLensTelephoto => 'Teleobjektiv';

  @override
  String get settingsLensUnavailable => 'Na tomto iPhonu není k dispozici';

  @override
  String get settingsStabilization => 'Stabilizace';

  @override
  String get settingsStabAuto => 'Automatická';

  @override
  String get settingsStabOff => 'Vyp.';

  @override
  String get settingsStabStandard => 'Standardní';

  @override
  String get settingsStabCinematic => 'Filmová';

  @override
  String get settingsOverlayOpacity => 'Průhlednost překryvu';

  @override
  String get settingsShowFps => 'Zobrazit statistiky výkonu';

  @override
  String get settingsShowFpsSubtitle =>
      'Snímková frekvence a doba inference v zobrazení detekce';

  @override
  String get settingsCameraFooter =>
      'Změny objektivu a stabilizace se projeví při příštím spuštění kamery.';

  @override
  String get settingsAiModel => 'Model AI';

  @override
  String get settingsConfidence => 'Jistota detekce';

  @override
  String get settingsTracking => 'Sledování objektů';

  @override
  String get settingsTrackingSubtitle => 'Stabilizuje objekty mezi snímky';

  @override
  String get settingsShowLabels => 'Zobrazit popisky';

  @override
  String get settingsShowConfidence => 'Zobrazit jistotu';

  @override
  String get settingsSegmentationOpacity => 'Průhlednost masky percepce';

  @override
  String get settingsAiFooter =>
      'Nižší jistota zobrazí více objektů, ale také více chybných detekcí. Detekce mohou být nepřesné.';

  @override
  String get settingsVoiceAlerts => 'Hlasová upozornění';

  @override
  String get settingsVoiceLanguage => 'Jazyk hlasu';

  @override
  String get settingsVoiceLanguageAuto => 'Podle jazyka aplikace';

  @override
  String get settingsVoice => 'Hlas';

  @override
  String get settingsVoiceDefault => 'Výchozí systémový';

  @override
  String get settingsVoiceQualityEnhanced => 'Vylepšený';

  @override
  String get settingsVoiceQualityPremium => 'Vysoká kvalita';

  @override
  String get settingsNoVoices =>
      'Pro tento jazyk není nainstalován žádný hlas. Přidejte jej v Nastavení iOS › Zpřístupnění › Mluvený obsah.';

  @override
  String get settingsAlertPedestrian => 'Chodci';

  @override
  String get settingsAlertCyclist => 'Cyklisté';

  @override
  String get settingsAlertMotorcycle => 'Motocykly';

  @override
  String get settingsAlertBus => 'Autobusy';

  @override
  String get settingsAlertVehicleClose => 'Vozidlo velmi blízko před vámi';

  @override
  String get settingsAlertTrafficLight => 'Změny semaforu';

  @override
  String get settingsAlertTrafficMoving => 'Rozjíždění provozu před vámi';

  @override
  String get settingsAlertStopSign => 'Značky STOP';

  @override
  String get settingsSensitivity => 'Citlivost';

  @override
  String get settingsSensitivityLow => 'Nízká';

  @override
  String get settingsSensitivityMedium => 'Střední';

  @override
  String get settingsSensitivityHigh => 'Vysoká';

  @override
  String get settingsCooldown => 'Interval opakování';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Hlasitost hlasu';

  @override
  String get settingsQuietMode => 'Tichý režim';

  @override
  String get settingsQuietModeSubtitle =>
      'Hlasem se oznamují jen nejdůležitější upozornění';

  @override
  String get settingsTestVoice => 'Vyzkoušet hlas';

  @override
  String get settingsTestVoiceDone => 'Přehrává se ukázkové upozornění…';

  @override
  String get settingsParkingBeeps => 'Parkovací pípání';

  @override
  String get settingsBeepVolume => 'Hlasitost pípání';

  @override
  String get settingsAlertsFooter =>
      'Upozornění jsou pouze pomůcka. Vždy sledujte silnici — ticho neznamená, že je cesta volná.';

  @override
  String get settingsRecordingProfile => 'Kvalita nahrávání';

  @override
  String get settingsProfileStandard => 'Standardní · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Vyrovnávací paměť události';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsManualMaxLength => 'Max. délka ručního záznamu';

  @override
  String get settingsManualMaxUnlimited => 'Neomezeně';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Nahrávat zvuk';

  @override
  String get settingsRecordAudioSubtitle =>
      'Zahrne zvuk z kabiny do uložených událostí';

  @override
  String get settingsMicDenied =>
      'Přístup k mikrofonu je vypnutý. Povolte jej v Nastavení, aby bylo možné nahrávat zvuk.';

  @override
  String get settingsWatermark => 'Vodoznak Corvista';

  @override
  String get settingsTimestamp => 'Razítko data a času';

  @override
  String get settingsSaveLocation => 'Ukládat polohu se záznamy';

  @override
  String get settingsStorage => 'Úložiště a záznamy';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count záznamů',
      many: '$count záznamu',
      few: '$count záznamy',
      one: '1 záznam',
      zero: 'Žádné záznamy',
    );
    return '$_temp0 · využito $used · volno $free';
  }

  @override
  String get settingsRecordingFooter =>
      'Průběžná vyrovnávací paměť zůstává ve vašem iPhonu a neustále se přepisuje. Na pozadí se nic nenahrává.';

  @override
  String get settingsDefaultView => 'Výchozí zobrazení';

  @override
  String get settingsUnits => 'Jednotky';

  @override
  String get settingsShowCompass => 'Zobrazit kompas';

  @override
  String get settingsHudStyle => 'Styl HUD';

  @override
  String get settingsHudCustomize => 'Přizpůsobit HUD';

  @override
  String get settingsDrivingSide => 'Strana provozu';

  @override
  String get settingsDrivingSideAuto => 'Automaticky';

  @override
  String get settingsDrivingSideRight => 'Vpravo';

  @override
  String get settingsDrivingSideLeft => 'Vlevo';

  @override
  String get settingsVirtualStyle => 'Styl virtuálního zobrazení';

  @override
  String get settingsVirtualMinimal => 'Minimální';

  @override
  String get settingsVirtualPerspective => 'Perspektivní';

  @override
  String get settingsVirtualHighContrast => 'Vysoký kontrast';

  @override
  String get settingsKeepScreenOn => 'Nevypínat displej při jízdě';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Zobrazovat navigační pokyny na zamčené obrazovce a v Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Nahrávání pozastaveno, když byla Corvista na pozadí';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Pozastaveno';

  @override
  String get liveActivityDashcamOff => 'Kamera vyp.';

  @override
  String get liveActivityEnded => 'Navigace ukončena';

  @override
  String get liveActivityEta => 'Příjezd';

  @override
  String get settingsAutoRecenter => 'Automaticky vystředit mapu';

  @override
  String get settingsHudStyleClassic => 'Klasický';

  @override
  String get settingsHudStyleGrid => 'Mřížka';

  @override
  String get settingsHudStyleMinimal => 'Minimální';

  @override
  String get settingsHudStylePerformance => 'Sportovní';

  @override
  String get settingsHudStyleNavigation => 'Navigace';

  @override
  String get settingsHudStyleNight => 'Noční';

  @override
  String get settingsHudStyleHighContrast => 'Vysoký kontrast';

  @override
  String get settingsPowerMode => 'Režim napájení';

  @override
  String get settingsPowerBalanced => 'Vyvážený';

  @override
  String get settingsPowerPerformance => 'Výkon';

  @override
  String get settingsPowerSaver => 'Úspora energie';

  @override
  String get settingsPowerFooter =>
      'Corvista automaticky snižuje frekvenci AI a vizuální efekty, když se iPhone zahřeje nebo je slabá baterie.';

  @override
  String get settingsThermal => 'Teplotní stav';

  @override
  String get settingsThermalNominal => 'Normální';

  @override
  String get settingsThermalFair => 'Teplý';

  @override
  String get settingsThermalSerious => 'Horký';

  @override
  String get settingsThermalCritical => 'Kritický';

  @override
  String get settingsBattery => 'Baterie';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Nabíjení';
  }

  @override
  String get settingsLowPowerMode =>
      'Je zapnutý Úsporný režim — AI běží sníženou frekvencí.';

  @override
  String get settingsAiRate => 'Aktuální frekvence AI';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Detekce nárazu';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Zap. · odpočet $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Experimentální funkce. Nenahrazuje tísňové služby.';

  @override
  String get settingsTheme => 'Motiv';

  @override
  String get settingsThemeSystem => 'Systémový';

  @override
  String get settingsThemeDark => 'Tmavý';

  @override
  String get settingsThemeLight => 'Světlý';

  @override
  String get settingsReduceMotion => 'Omezit pohyb';

  @override
  String get settingsReduceMotionSubtitle => 'Omezí animace v celé aplikaci';

  @override
  String get settingsAppLanguage => 'Jazyk aplikace';

  @override
  String get settingsPrivacyPolicy => 'Zásady ochrany osobních údajů';

  @override
  String get settingsTerms => 'Podmínky použití';

  @override
  String get settingsHelp => 'Nápověda';

  @override
  String get settingsSupport => 'Kontaktovat podporu';

  @override
  String get settingsLicenses => 'Open-source licence';

  @override
  String get settingsSupportUnavailable =>
      'Nepodařilo se otevřít Mail. Napište na support@corvista.app.';

  @override
  String get settingsSafety => 'Bezpečnostní informace';

  @override
  String get settingsDiagnostics => 'Diagnostika';

  @override
  String get settingsVersion => 'Verze';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Přizpůsobit HUD';

  @override
  String get hudCustomPreview => 'Náhled · ukázkové hodnoty';

  @override
  String get hudCustomStyle => 'Styl';

  @override
  String get hudCustomElements => 'Prvky';

  @override
  String get hudCustomSpeed => 'Rychlost';

  @override
  String get hudCustomHeading => 'Směr a kompas';

  @override
  String get hudCustomClock => 'Hodiny';

  @override
  String get hudCustomBattery => 'Baterie a teplota';

  @override
  String get hudCustomDetections => 'Stav AI a detekce';

  @override
  String get hudCustomWeather => 'Počasí';

  @override
  String get hudCustomAppearance => 'Velikost a průhlednost';

  @override
  String get hudCustomSize => 'Velikost';

  @override
  String get hudCustomOpacity => 'Průhlednost';

  @override
  String get hudCustomFooter =>
      'Varování, například před přehřátím, se zobrazují vždy, i když jsou prvky skryté.';

  @override
  String get hudCustomDescClassic => 'Vyvážená sada ukazatelů';

  @override
  String get hudCustomDescGrid => 'Perspektivní mřížka nad silnicí';

  @override
  String get hudCustomDescMinimal => 'Jen rychlost, nic dalšího';

  @override
  String get hudCustomDescPerformance => 'Oblouk rychlosti s živými údaji';

  @override
  String get hudCustomDescNavigation => 'Nejdřív další manévr';

  @override
  String get hudCustomDescNight =>
      'Ztlumený s červeným nádechem pro noční jízdu';

  @override
  String get hudCustomDescHighContrast =>
      'Maximální čitelnost na ostrém slunci';

  @override
  String get languageTitle => 'Jazyk';

  @override
  String get languageSystem => 'Výchozí systémový';

  @override
  String get languageSystemSubtitle => 'Použít jazyk iPhonu';

  @override
  String get languageFooter =>
      'Další jazyky se připravují. Jazyk hlasových upozornění lze nastavit zvlášť v části Upozornění.';

  @override
  String get diagTitle => 'Diagnostika';

  @override
  String get diagPerformance => 'Výkon';

  @override
  String get diagInference => 'Doba inference';

  @override
  String get diagDetectHz => 'Frekvence detekce';

  @override
  String get diagCameraFps => 'Snímková frekvence kamery';

  @override
  String get diagMemory => 'Paměť';

  @override
  String get diagDropped => 'Zahozené snímky';

  @override
  String get diagSegmentation => 'Doba segmentace';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Stav';

  @override
  String get diagSource => 'Zdroj';

  @override
  String get diagSourceCamera => 'Živá kamera';

  @override
  String get diagSourceFile => 'Testovací videosoubor';

  @override
  String get diagResolution => 'Velikost vyrovnávací paměti';

  @override
  String get diagLens => 'Objektiv';

  @override
  String get diagError => 'Poslední chyba';

  @override
  String get diagModel => 'Model AI';

  @override
  String get diagModelLoad => 'Doba načtení modelu';

  @override
  String get diagPower => 'Napájení';

  @override
  String get diagSegHz => 'Frekvence segmentace';

  @override
  String get diagReduced => 'Omezené efekty';

  @override
  String diagMs(String value) {
    return '$value ms';
  }

  @override
  String diagFps(String value) {
    return '$value sn./s';
  }

  @override
  String diagMb(String value) {
    return '$value MB';
  }

  @override
  String get diagCamIdle => 'Nečinná';

  @override
  String get diagCamStarting => 'Spouští se';

  @override
  String get diagCamRunning => 'Běží';

  @override
  String get diagCamInterrupted => 'Přerušena';

  @override
  String get diagCamStopped => 'Zastavena';

  @override
  String get diagCamUnavailable => 'Nedostupná';

  @override
  String get diagCamPermissionDenied => 'Oprávnění zamítnuto';

  @override
  String get diagCamError => 'Chyba';

  @override
  String get diagTestFootage => 'Testovací záznam';

  @override
  String get diagTestFootageBody =>
      'Spustí skutečnou detekci v zařízení na místním videosouboru místo kamery. Každé zobrazení jej označí jako TESTOVACÍ ZÁZNAM.';

  @override
  String get diagPathLabel => 'Cesta k videosouboru';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Použít Documents/test_drive.mp4';

  @override
  String get diagRun => 'Spustit testovací záznam';

  @override
  String get diagRunStarted =>
      'Testovací záznam spuštěn. Otevřete zobrazení jízdy, abyste jej viděli.';

  @override
  String get diagBackToCamera => 'Vrátit se k živé kameře';

  @override
  String get diagDebugOnly =>
      'Testovací záznam je dostupný jen ve vývojových sestaveních.';

  @override
  String get diagFileMissing => 'Na této cestě žádný soubor neexistuje.';

  @override
  String get emergencySetupTitle => 'Detekce nárazu';

  @override
  String get emergencyExperimental => 'Experimentální';

  @override
  String get emergencyIntro =>
      'Během jízdy může Corvista pomocí pohybových senzorů vašeho iPhonu sledovat možný vážný náraz. Pokud jej zjistí, spustí se odpočet. Pokud jej nezrušíte, Corvista nabídne volání tísňových služeb a odeslání zprávy vašim kontaktům.';

  @override
  String get emergencyDisclaimer1 =>
      'Nenahrazuje tísňové služby ani vlastní systém detekce nehod ve vašem vozidle.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS vždy požaduje potvrzení před uskutečněním hovoru nebo odesláním zprávy.';

  @override
  String get emergencyDisclaimer3 =>
      'Nárazy mohou zůstat nezjištěny a prudké brzdění či nerovnosti je mohou připomínat.';

  @override
  String get emergencyParkedWarning =>
      'Toto nastavení dokončete na stojícím vozidle. Při pohybu vozidla je nastavení uzamčeno.';

  @override
  String get emergencyEnable => 'Zapnout detekci nárazu';

  @override
  String get emergencyEnableSubtitle => 'Aktivní jen během jízdy';

  @override
  String get emergencyNeedNumber => 'Nejprve přidejte tísňové číslo.';

  @override
  String get emergencyContacts => 'Tísňové kontakty';

  @override
  String get emergencyAddContact => 'Přidat kontakt';

  @override
  String get emergencyNoContacts =>
      'Zatím žádné kontakty. Kontakty obdrží zprávu až po vašem potvrzení.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Odebrat kontakt $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Po nárazu už nebude nabídnut jako příjemce.';

  @override
  String get emergencyRemove => 'Odebrat';

  @override
  String get emergencyContactsError => 'Kontakty se nepodařilo načíst.';

  @override
  String get emergencyNumber => 'Tísňové číslo';

  @override
  String get emergencyNumberHint => 'např. 112 nebo 911';

  @override
  String get emergencyMessage => 'Šablona zprávy';

  @override
  String get emergencyMessageDefault =>
      'Možná jsem měl(a) dopravní nehodu. Tuto zprávu připravila aplikace Corvista a obsahuje mou poslední známou polohu, pokud je k dispozici.';

  @override
  String get emergencyMessageHint =>
      'Nechte prázdné pro použití výchozí zprávy.';

  @override
  String get emergencyCountdown => 'Délka odpočtu';

  @override
  String get emergencyVoiceCancel => 'Zrušení hlasem';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Během odpočtu řekněte „Jsem v pořádku“ nebo „Zrušit“. Používá rozpoznávání řeči v zařízení, pokud je dostupné.';

  @override
  String get emergencyVoicePermDenied =>
      'Ke zrušení hlasem je potřeba přístup k mikrofonu a rozpoznávání řeči.';

  @override
  String get emergencyAutoSave => 'Ukládat záznam události automaticky';

  @override
  String get emergencyTest => 'Vyzkoušet odpočet (bez hovoru)';

  @override
  String get emergencyTestBody =>
      'Spustí simulovaný náraz, abyste viděli odpočet. V testovacím režimu se nikdy neuskuteční hovor ani neodešle zpráva.';

  @override
  String get emergencyNotSet => 'Nenastaveno';

  @override
  String get emergencyAlertHeadline => 'Zjištěn možný vážný náraz.';

  @override
  String get emergencyAlertSubtitle => 'Jste v pořádku?';

  @override
  String get emergencyAlertCancel => 'Jsem v pořádku — Zrušit';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Zbývá $seconds sekund',
      many: 'Zbývá $seconds sekundy',
      few: 'Zbývají $seconds sekundy',
      one: 'Zbývá 1 sekunda',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Poslouchám — řekněte „Jsem v pořádku“ a odpočet zrušíte';

  @override
  String emergencyAlertHeard(String text) {
    return 'Slyšeno: „$text“';
  }

  @override
  String get emergencyAlertEscalated => 'Bez odpovědi. Vyberte, co udělat:';

  @override
  String get emergencyAlertCall => 'Volat tísňové služby';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Volá číslo $number. iOS požádá o potvrzení.';
  }

  @override
  String get emergencyAlertMessage => 'Napsat kontaktům';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Otevře připravenou zprávu. O jejím odeslání rozhodnete vy.';

  @override
  String get emergencyAlertTestMode => 'Testovací režim — hovor se neuskuteční';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'Jsem v pořádku — Zavřít';

  @override
  String get emergencyMsgSent => 'Zpráva odeslána.';

  @override
  String get emergencyMsgCancelled => 'Zpráva nebyla odeslána.';

  @override
  String get emergencyMsgFailed => 'Zprávu se nepodařilo odeslat.';

  @override
  String get emergencyMsgUnavailable =>
      'Zprávy nejsou na tomto zařízení dostupné.';

  @override
  String emergencyCallFailed(String number) {
    return 'Hovor se nepodařilo zahájit. Zavolejte na číslo $number sami.';
  }

  @override
  String get modelsTitle => 'Modely AI';

  @override
  String get modelsIntro =>
      'Všechny modely jsou součástí aplikace a běží zcela ve vašem iPhonu. Obraz z kamery nikdy neopouští zařízení.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Živě: $ms ms na snímek · $hz detekcí/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Načteno za $ms ms';
  }

  @override
  String get modelsEfficientName => 'Úsporný';

  @override
  String get modelsEfficientDesc =>
      'Rychlý, kompaktní detektor určený pro dlouhé jízdy s nízkým zahříváním a spotřebou baterie.';

  @override
  String get modelsEnhancedName => 'Vylepšený';

  @override
  String get modelsEnhancedDesc =>
      'Větší detektor, který najde menší a vzdálenější objekty, za cenu vyšší spotřeby energie.';

  @override
  String get modelsSegmentationName => 'Segmentace';

  @override
  String get modelsSegmentationDesc =>
      'Kombinuje rychlou detekci s maskami povrchu vozovky a objektů pro zobrazení Percepce.';

  @override
  String get modelsNoneName => 'AI pozastaveno';

  @override
  String get modelsNoneDesc =>
      'Kamera a nahrávání běží dál bez detekce objektů. Nejnižší spotřeba energie.';

  @override
  String get modelsGenericDesc => 'Model detekce objektů běžící v zařízení.';

  @override
  String get modelsFunctionDetection =>
      'Detekuje vozidla, osoby, kola, motocykly, autobusy, semafory a značky STOP';

  @override
  String get modelsFunctionSegmentation =>
      'Přidává masky povrchu vozovky a objektů';

  @override
  String get modelsFunctionNone => 'Bez detekce; pouze záznam kamery';

  @override
  String get modelsSize => 'Velikost';

  @override
  String get modelsInput => 'Vstup';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Funguje s';

  @override
  String get modelsStatusInstalled => 'Nainstalováno (součást aplikace)';

  @override
  String get modelsStatusNotInstalled => 'Nenainstalováno';

  @override
  String get modelsSelected => 'Vybráno';

  @override
  String get modelsUse => 'Použít tento model';

  @override
  String get modelsSwitching => 'Načítání modelu…';

  @override
  String modelsSwitched(String name) {
    return 'Aktivní model: $name';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Naměřeno na tomto zařízení: průměrně $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Na tomto zařízení neměřeno';

  @override
  String get modelsBenchmarkRun => 'Spustit test výkonu';

  @override
  String get modelsBenchmarkRunning => 'Probíhá test výkonu…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Vyberte tento model, abyste mohli změřit jeho výkon.';

  @override
  String get modelsBenchmarkDone => 'Test výkonu dokončen';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Test výkonu selhal: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Poslední aktualizace: $date';
  }

  @override
  String get safetyTitle => 'Bezpečnostní informace';

  @override
  String get safetyIntro =>
      'Corvista je pomůcka pro vnímání situace při řízení. Neovládá vaše vozidlo a nemůže nahradit vaši pozornost, úsudek ani bezpečnostní systémy vozidla.';

  @override
  String get safetyBeforeTitle => 'Před jízdou';

  @override
  String get safetyBefore1 =>
      'Upevněte iPhone bezpečně na místo, které je v souladu s předpisy a nezakrývá výhled, airbagy ani ovládací prvky.';

  @override
  String get safetyBefore2 =>
      'Dokončete nastavení, vyberte zobrazení a zadejte cíl na stojícím vozidle.';

  @override
  String get safetyBefore3 =>
      'Na delší cesty připojte nabíječku a pokud možno chraňte telefon před přímým sluncem.';

  @override
  String get safetyWhileTitle => 'Během jízdy';

  @override
  String get safetyWhile1 =>
      'Držte pohled na silnici. Velké ovládací prvky na obrazovce používejte, jen když je to bezpečné a zákonné.';

  @override
  String get safetyWhile2 =>
      'Upozornění jsou pomůcka, ne varování, na která se lze spolehnout. Ticho nikdy neznamená, že je cesta volná.';

  @override
  String get safetyWhile3 =>
      'Při rozporu dodržujte dopravní předpisy, signály a značky, nikoli aplikaci.';

  @override
  String get safetyLimitsTitle => 'Omezení';

  @override
  String get safetyLimits1 =>
      'Jediná kamera telefonu vidí jen to, co je před ní. Objekty mimo její záběr, zakryté nebo velmi blízko nejsou detekovány.';

  @override
  String get safetyLimits2 =>
      'Detekce mohou chybět, přijít pozdě nebo být chybné, zejména v noci, za deště, mlhy, v oslnění nebo při špinavém čelním skle.';

  @override
  String get safetyLimits3 =>
      'Rozpoznávány jsou jen podporované kategorie: vozidla, autobusy, motocykly, kola, osoby, semafory a značky STOP. Pruhy ve virtuálním zobrazení jsou stylizované, nikoli detekované.';

  @override
  String get safetyLimits4 =>
      'Vzdálenost se zobrazuje jako přibližné zóny (Velmi blízko, Blízko, Střední, Daleko), nikdy jako změřené vzdálenosti. Zobrazení parkování nenahrazuje parkovací senzory.';

  @override
  String get safetyHeatTitle => 'Teplo a baterie';

  @override
  String get safetyHeat1 =>
      'Nepřetržité používání kamery a AI zahřívá iPhone. Corvista snižuje frekvenci analýzy, když se zařízení zahřeje, a zobrazí varování; pokud se iOS přehřeje, kamera se může zastavit.';

  @override
  String get safetyEmergencyTitle => 'Tísňová funkce';

  @override
  String get safetyEmergency1 =>
      'Detekce možného nárazu je experimentální. Skutečnou nehodu nemusí zachytit a může ji spustit jiná událost.';

  @override
  String get safetyEmergency2 =>
      'Nikdy nikoho nekontaktuje potichu: iOS vždy požaduje potvrzení hovoru nebo zprávy. Nenahrazuje volání tísňových služeb vámi samotnými.';

  @override
  String get privacyTitle => 'Soukromí';

  @override
  String get privacyIntro =>
      'Corvista je navržena tak, aby data o vašich jízdách zůstala ve vašem iPhonu. Neexistuje žádný účet Corvista a Corvista neprovozuje vlastní servery.';

  @override
  String get privacyCameraTitle => 'Kamera a AI';

  @override
  String get privacyCamera1 =>
      'Detekce, sledování a segmentace objektů probíhají zcela ve vašem iPhonu. Snímky z kamery se nikdy nenahrávají.';

  @override
  String get privacyCamera2 =>
      'Kamera běží, jen když je Corvista otevřená na obrazovce. Po přechodu aplikace na pozadí se pozastaví — neexistuje žádné skryté nahrávání na pozadí.';

  @override
  String get privacyRecordingsTitle => 'Záznamy';

  @override
  String get privacyRecordings1 =>
      'Průběžná vyrovnávací paměť je dočasná a neustále se přepisuje. Záznam se uchová, jen když klepnete na Uložit událost nebo, pokud to povolíte, po možném nárazu.';

  @override
  String get privacyRecordings2 =>
      'Uložené záznamy zůstávají v soukromém úložišti Corvista ve vašem iPhonu. Zařízení opustí, jen když zvolíte Sdílet. Smazáním aplikace se smažou.';

  @override
  String get privacyRecordings3 =>
      'Zvuk se nahrává, jen pokud jej zapnete a udělíte přístup k mikrofonu.';

  @override
  String get privacyLocationTitle => 'Poloha';

  @override
  String get privacyLocation1 =>
      'Poloha se používá, když je aplikace otevřená, pro rychlost, mapu, trasy a počasí. Pokud je zapnuto „Ukládat polohu“, uloží se pozice v okamžiku uložení se záznamem ve vašem zařízení.';

  @override
  String get privacyNetworkTitle => 'Síťové služby';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — zobrazení mapy, vyhledávání míst a trasy. Váš hledaný text a přibližná poloha se odesílají společnosti Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — aktuální a hodinové počasí pro vaši polohu.';

  @override
  String get privacyNetwork4 =>
      'Corvista neobsahuje žádnou reklamu ani analytiku či sledování třetích stran.';

  @override
  String get privacyEmergencyTitle => 'Tísňové kontakty';

  @override
  String get privacyEmergency1 =>
      'Kontakty, které vyberete, jsou uloženy v klíčence iOS v tomto zařízení. Zrušení hlasem využívá rozpoznávání řeči v zařízení, pokud je dostupné. Hovory a zprávy se odešlou až po vašem potvrzení v iOS.';

  @override
  String get privacyControlsTitle => 'Vaše možnosti';

  @override
  String get privacyControls1 =>
      'Záznamy můžete kdykoli smazat v části Záznamy a přístup ke kameře, mikrofonu, poloze a řeči můžete změnit nebo odvolat v Nastavení iOS.';

  @override
  String get termsTitle => 'Podmínky použití';

  @override
  String get termsIntro =>
      'Používáním Corvista souhlasíte s těmito podmínkami. Platí také standardní licenční smlouva s koncovým uživatelem licencované aplikace společnosti Apple.';

  @override
  String get termsUseTitle => 'Používání Corvista';

  @override
  String get termsUse1 =>
      'Corvista je pomůcka pro vnímání situace při řízení a palubní kamera. Za bezpečnou a zákonnou jízdu jste po celou dobu plně odpovědní vy.';

  @override
  String get termsUse2 =>
      'Neovládejte aplikaci způsobem, který vás za jízdy rozptyluje. Zařízení upevněte bezpečně a v souladu s předpisy.';

  @override
  String get termsAccuracyTitle => 'Žádné záruky přesnosti';

  @override
  String get termsAccuracy1 =>
      'Detekce, zóny, upozornění, značky na mapě, trasy a počasí mohou být neúplné, zpožděné nebo chybné. Corvista neovládá vaše vozidlo.';

  @override
  String get termsAccuracy2 =>
      'Tísňová funkce je experimentální a nemusí náraz zjistit nebo se může spustit chybně.';

  @override
  String get termsRecordingTitle => 'Předpisy o nahrávání';

  @override
  String get termsRecording1 =>
      'Předpisy o palubních kamerách, nahrávání zvuku a natáčení osob se liší podle země a regionu. Za jejich dodržování odpovídáte vy, i při sdílení záznamů.';

  @override
  String get termsLiabilityTitle => 'Odpovědnost';

  @override
  String get termsLiability1 =>
      'Aplikace je poskytována „tak, jak je“. V rozsahu povoleném zákonem vývojář nenese odpovědnost za nehody, ztráty, pokuty ani škody vzniklé jejím používáním nebo spoléháním na její výstupy.';

  @override
  String get termsChangesTitle => 'Změny';

  @override
  String get termsChanges1 =>
      'Tyto podmínky mohou být aktualizovány s novými verzemi aplikace. Pokračování v používání po aktualizaci znamená souhlas s upravenými podmínkami.';

  @override
  String get helpTitle => 'Nápověda';

  @override
  String get helpIntro =>
      'Odpovědi na časté otázky. Bezpečnostní pokyny najdete v části Bezpečnostní informace.';

  @override
  String get helpQSave => 'Jak si uchovám záznam události?';

  @override
  String get helpASaveBuffer =>
      'Klepněte na velké tlačítko Uložit událost v zobrazení jízdy. Corvista uloží do Záznamů posledních 20 nebo 30 sekund z průběžné vyrovnávací paměti (podle volby v Nastavení › Nahrávání).';

  @override
  String get helpQWhere => 'Kde jsou moje záznamy uloženy?';

  @override
  String get helpAWhere =>
      'V soukromém úložišti Corvista ve vašem iPhonu. Nikdy se nenahrávají. K odeslání nebo exportu záznamu použijte Sdílet v přehrávači.';

  @override
  String get helpQZones => 'Jak přesné jsou zóny vzdálenosti?';

  @override
  String get helpAZones =>
      'Zóny jsou hrubé odhady z jediné kamery podle typických velikostí objektů. Berte je jako přibližné nápovědy, nikdy jako vzdálenosti.';

  @override
  String get helpQSlow => 'Proč se detekce zpomaluje?';

  @override
  String get helpASlow =>
      'Když se iPhone zahřeje, baterie je slabá nebo je zapnutý Úsporný režim, Corvista snižuje frekvenci analýzy, aby zařízení chránila. Režim napájení můžete změnit v Nastavení.';

  @override
  String get helpQMap => 'Mapa, vyhledávání nebo počasí nefungují.';

  @override
  String get helpAMap =>
      'Tyto funkce vyžadují připojení k internetu a přístup k poloze. Zkontrolujte připojení a povolte Corvista polohu v Nastavení iOS.';

  @override
  String get helpQSimulator => 'Kamera se zobrazuje jako nedostupná.';

  @override
  String get helpASimulator =>
      'Ujistěte se, že je v Nastavení iOS povolen přístup ke kameře a že kameru nepoužívá jiná aplikace. V simulátoru iOS kamera není; místo ní lze použít místní testovací video.';

  @override
  String get emergencyMsgNoContacts => 'Nejprve přidejte tísňový kontakt.';

  @override
  String get cameraStarting => 'Spouštění kamery…';

  @override
  String get cameraInterrupted => 'Kamera pozastavena';

  @override
  String get cameraInterruptedBody =>
      'iOS kameru pozastavil, například během hovoru nebo když ji používá jiná aplikace. Obnoví se automaticky.';

  @override
  String get cameraUnavailable => 'Kamera nedostupná';

  @override
  String get cameraUnavailableBody =>
      'V tomto zařízení není k dispozici žádná kamera. Zobrazení detekce, nahrávání a parkování vyžadují zadní kameru.';

  @override
  String get cameraRunTestFootage => 'Spustit testovací záznam';

  @override
  String get cameraPermissionDenied => 'Přístup ke kameře je vypnutý';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista potřebuje kameru pro detekci, nahrávání a zobrazení parkování. Zapněte přístup ke kameře v Nastavení.';

  @override
  String get cameraError => 'Chyba kamery';

  @override
  String get cameraStopped => 'Kamera zastavena';

  @override
  String get cameraStart => 'Spustit kameru';

  @override
  String get cameraFocusHint => 'Klepnutím zaostříte';

  @override
  String get cameraPreviewLabel => 'Živý obraz z kamery s detekovanými objekty';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps sn./s · AI $hz Hz · $ms ms · zahozeno $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Rychlost $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Žádná rychlost GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Směr $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Nahrávání do vyrovnávací paměti, uloženo $seconds z $target sekund';
  }

  @override
  String get hudRecIdle => 'REC vyp.';

  @override
  String get hudRecSaving => 'Ukládání…';

  @override
  String get hudRecError => 'Chyba REC';

  @override
  String get hudAiPaused => 'AI pozastaveno';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objektů',
      many: '$count objektu',
      few: '$count objekty',
      one: '1 objekt',
      zero: 'Žádné objekty',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'detekováno $count objektů',
      many: 'detekováno $count objektu',
      few: 'detekovány $count objekty',
      one: 'detekován 1 objekt',
      zero: 'nebyly detekovány žádné objekty',
    );
    return 'Model AI $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Horko — AI zpomaleno';

  @override
  String get hudThermalCritical => 'Příliš horko — AI pozastaveno';

  @override
  String hudBatteryLow(String percent) {
    return 'Baterie $percent';
  }

  @override
  String get hudLowPower => 'Úsporný režim';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Počasí $temperature, $condition. Klepnutím zobrazíte podrobnosti.';
  }

  @override
  String get hudNoGuidance =>
      'Vyhledejte cíl v zobrazení Mapa a zde uvidíte navigační pokyny.';

  @override
  String get navArrived => 'Jste v cíli';

  @override
  String get navRerouting => 'Přepočítávání trasy…';

  @override
  String get navSearchHint => 'Hledat cíl';

  @override
  String get navSearchFieldHint => 'Adresa, místo nebo firma';

  @override
  String get navNoResults => 'Žádná odpovídající místa';

  @override
  String get navSearching => 'Hledání…';

  @override
  String get navSearchStartTyping =>
      'Zadejte adresu nebo název místa. Výsledky pocházejí z Apple Maps a vyžadují připojení k internetu.';

  @override
  String get navErrorUnavailable =>
      'Vyhledávání a trasy nejsou dostupné — zkontrolujte připojení k internetu.';

  @override
  String get navErrorNoLocation => 'Čekání na polohu pro naplánování trasy.';

  @override
  String get navErrorPermission =>
      'Přístup k poloze je vypnutý, takže trasy nelze zahájit z vaší pozice.';

  @override
  String navErrorGeneric(String code) {
    return 'Trasy se nepodařilo načíst ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Trasy do: $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Příjezd $time';
  }

  @override
  String get navStart => 'Start';

  @override
  String get navEnd => 'Ukončit';

  @override
  String get navEndLabel => 'Ukončit navigaci';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · zbývá $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Upozornění: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min',
      many: '$minutes min',
      few: '$minutes min',
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
    return 'Trasa $index: $name';
  }

  @override
  String get weatherTitle => 'Počasí';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Pocitově $temperature';
  }

  @override
  String get weatherPrecipitation => 'Srážky';

  @override
  String get weatherWind => 'Vítr';

  @override
  String get weatherVisibility => 'Viditelnost';

  @override
  String get weatherHumidity => 'Vlhkost';

  @override
  String get weatherHourly => 'Následující hodiny';

  @override
  String weatherAsOf(String time) {
    return 'Aktualizováno $time';
  }

  @override
  String get weatherRefresh => 'Obnovit počasí';

  @override
  String get weatherUnavailable => 'Počasí teď není dostupné.';

  @override
  String get weatherNoLocation => 'Počasí vyžaduje vaši polohu.';

  @override
  String get weatherLegal => 'Zdroje dat a právní informace';

  @override
  String weatherProvidedBy(String service) {
    return 'Data o počasí: $service';
  }

  @override
  String get weatherNow => 'Nyní';

  @override
  String get virtualEmpty => 'Nebyly detekovány žádné podporované objekty';

  @override
  String get virtualEmptyCameraOff =>
      'Virtuální zobrazení vyžaduje živou kameru.';

  @override
  String get virtualLaneDisclaimer =>
      'Čáry jízdních pruhů jsou ilustrativní, nejsou detekované.';

  @override
  String virtualNearest(String zone) {
    return 'Nejblíže: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtuální silniční scéna: $summary';
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
  String get virtualStatusLive => 'živě';

  @override
  String get virtualStatusPaused => 'pozastaveno';

  @override
  String get virtualStatusCameraOff => 'Kamera vyp.';

  @override
  String get virtualStatusTestFootage => 'Testovací záznam';

  @override
  String get virtualEmptyHint =>
      'Vozidla, osoby, kola, semafory a značky STOP se zde zobrazí po detekci.';

  @override
  String get mapRecenter => 'Vystředit';

  @override
  String get mapZoomIn => 'Přiblížit';

  @override
  String get mapZoomOut => 'Oddálit';

  @override
  String get mapUnsupported => 'Interaktivní mapa je dostupná na iPhonu.';

  @override
  String get mapObjectsApprox => 'Značky objektů ukazují přibližné pozice.';

  @override
  String get mapWeatherUnavailable => 'Počasí nedostupné';

  @override
  String get navErrorNoRoute => 'Do tohoto cíle nebyla nalezena žádná trasa.';

  @override
  String get navDismiss => 'Zavřít';

  @override
  String get navGo => 'Jet';

  @override
  String get navFastest => 'Nejrychlejší';

  @override
  String get navThen => 'Poté';

  @override
  String get navRecents => 'Nedávné';

  @override
  String get navClearRecents => 'Vymazat';

  @override
  String get navSearchSubmitHint =>
      'Stisknutím Hledat zobrazíte všechna odpovídající místa';

  @override
  String get navPlaces => 'Místa';

  @override
  String get navEtaLabel => 'příjezd';

  @override
  String get navTimeLeftLabel => 'zbývá';

  @override
  String get navOverview => 'Přehled trasy';

  @override
  String get navMute => 'Ztlumit hlas';

  @override
  String get navUnmute => 'Zapnout hlas';

  @override
  String get navEndConfirm => 'Ukončit navigaci?';

  @override
  String navEndConfirmBody(String place) {
    return 'Navigace do cíle $place bude zastavena.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Jste v cíli: $place';
  }

  @override
  String get navDone => 'Hotovo';

  @override
  String get navWeakGps => 'Slabý signál GPS';

  @override
  String get navLocationOff =>
      'Poloha je vypnutá. Zapněte ji, abyste mohli plánovat trasy a navigovat.';

  @override
  String get navVoiceGuidance => 'Hlasová navigace';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Za $distance $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, poté $second';
  }

  @override
  String get navSpeakRerouting => 'Přepočítávám trasu';

  @override
  String get navSpeakArrived => 'Jste v cíli';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metrů',
      many: '$count metru',
      few: '$count metry',
      one: '1 metr',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilometrů',
      many: '$value kilometru',
      few: '$value kilometry',
      one: '1 kilometr',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stop',
      many: '$count stopy',
      few: '$count stopy',
      one: '1 stopu',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yardů',
      many: '$count yardu',
      few: '$count yardy',
      one: '1 yard',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Pokračujte $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Pokyny pro tuto cestu nejsou v tomto regionu dostupné. Zkuste jiný cíl.';

  @override
  String navContinueFor(String distance) {
    return 'Pokračujte $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value mil',
      many: '$value míle',
      few: '$value míle',
      one: '1 míli',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Nejblíže: $object · $zone';
  }

  @override
  String get parkingNothing => 'V záběru nic nedetekováno';

  @override
  String get parkingBeeps => 'Pípání vzdálenosti';

  @override
  String get parkingVolume => 'Hlasitost pípání';

  @override
  String get parkingLimitations =>
      'Jediná kamera, ne 360°. Objekty mimo záběr kamery nejsou detekovány. Nenahrazuje parkovací senzory; odhady mohou být chybné a ticho neznamená, že je okolí volné.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Pohled shora na vzdálenosti. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Originál';

  @override
  String get perceptionModeBoxes => 'Rámečky';

  @override
  String get perceptionModeMasks => 'Masky objektů';

  @override
  String get perceptionModeRoad => 'Povrch vozovky';

  @override
  String get perceptionModeCombined => 'Kombinované';

  @override
  String get perceptionOpacity => 'Průhlednost masky';

  @override
  String get perceptionDisclaimer =>
      'Maska povrchu vozovky je přibližná vizuální vrstva. Nezobrazuje průjezdný prostor ani jízdní pruhy.';

  @override
  String get perceptionNeedsModel =>
      'Pro zobrazení masek vyberte model Segmentace.';

  @override
  String get perceptionChooseModel => 'Vybrat model';

  @override
  String get perceptionWaiting => 'Čekání na první snímek segmentace…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Rámečky';

  @override
  String get perceptionShortObjects => 'Objekty';

  @override
  String get perceptionShortRoad => 'Silnice';

  @override
  String get perceptionShortAll => 'Vše';

  @override
  String get perceptionModesLabel => 'Vrstvy percepce';

  @override
  String get perceptionStatusWarmingUp => 'Zahřívání…';

  @override
  String get perceptionStatusLoadingModel => 'Načítání modelu…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps sn./s';
  }

  @override
  String get perceptionStatusPaused => 'Masky pozastaveny';

  @override
  String get perceptionLegend => 'Legenda masek';

  @override
  String get perceptionUnavailable => 'Masky nejsou k dispozici';

  @override
  String get driveSave => 'Uložit';

  @override
  String get driveSaveIncident => 'Uložit událost';

  @override
  String driveSaveHint(int seconds) {
    return 'Uloží posledních $seconds s záznamu z kamery';
  }

  @override
  String get driveSaving => 'Ukládání události…';

  @override
  String hudRecManualLabel(String time) {
    return 'Nahrávání, $time';
  }

  @override
  String get driveRecord => 'Nahrát';

  @override
  String get driveRecordStartA11y => 'Spustit nahrávání';

  @override
  String driveRecordStopA11y(String time) {
    return 'Zastavit nahrávání, nahráno $time';
  }

  @override
  String get driveRecordHint =>
      'Nahrává nepřetržitě, dokud nezastavíte, včetně posledních 5 sekund';

  @override
  String get driveRecordFailed => 'Nahrávání se nepodařilo spustit';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Záznam uložen · $count částí',
      many: 'Záznam uložen · $count části',
      few: 'Záznam uložen · $count části',
      one: 'Záznam uložen',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Nahrávání zastaveno: úložiště je téměř plné',
      'max_duration': 'Nahrávání zastaveno: dosažena maximální délka',
      'camera_stopped': 'Nahrávání zastaveno spolu s kamerou',
      'background': 'Nahrávání zastaveno: aplikace přešla do pozadí',
      'thermal': 'Nahrávání zastaveno: telefon je příliš horký',
      'other': 'Nahrávání zastaveno',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Událost uložena · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Zobrazit';

  @override
  String get driveSaveFailed => 'Událost se nepodařilo uložit.';

  @override
  String get driveSaveNotRunning =>
      'Nahrávání ještě nezačalo — počkejte na spuštění kamery a zkuste to znovu.';

  @override
  String get driveSaveTestFootage =>
      'Testovací záznam se nenahrává. Ukládání událostí funguje s živou kamerou.';

  @override
  String get driveSaveStorageFull =>
      'V iPhonu došlo úložiště. Uvolněte místo nebo smažte starší záznamy.';

  @override
  String get driveSaveIoError => 'Záznam se nepodařilo zapsat do úložiště.';

  @override
  String get driveClips => 'Záznamy';

  @override
  String get driveSettings => 'Nastavení';

  @override
  String get driveViewSwitcher => 'Zobrazení jízdy';

  @override
  String get driveLocationDenied =>
      'Poloha je vypnutá — rychlost, mapy a trasy nejsou dostupné.';

  @override
  String get driveCameraDenied =>
      'Přístup ke kameře je vypnutý — detekce a nahrávání nejsou dostupné.';

  @override
  String get driveRecorderFallback =>
      'Nahrávání bez zvuku: přístup k mikrofonu je vypnutý.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Nastavení nahrávání bylo upraveno: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Váš iPhone je horký. AI běží pomaleji, aby vychladl — chraňte ho před přímým sluncem a umístěte ho k ventilaci.';

  @override
  String get drivePowerThermalCritical =>
      'Váš iPhone je příliš horký. Detekce AI je pozastavena, dokud nevychladne; nahrávání pokračuje, pokud je to možné.';

  @override
  String get drivePowerLowPower =>
      'Je zapnutý Úsporný režim — AI běží sníženou frekvencí.';

  @override
  String get drivePowerBatteryLow =>
      'Baterie je slabá — za jízdy připojte iPhone k napájení.';

  @override
  String get onboardingTitle1 => 'Uvidíte víc na každé cestě.';

  @override
  String get onboardingBody1 =>
      'Přeměňte svůj iPhone na inteligentní palubní kameru a společníka pro vnímání situace při řízení.';

  @override
  String get onboardingTitle2 => 'Inteligence v každém snímku.';

  @override
  String get onboardingBody2 =>
      'Rozpoznávejte podporovaná vozidla, osoby, kola a dopravní signály přímo v iPhonu.';

  @override
  String get onboardingTitle3 => 'Jedna silnice. Více pohledů.';

  @override
  String get onboardingBody3 =>
      'Přepínejte mezi živou detekcí, virtuálními pohledy na jízdu, interaktivními mapami a vizualizací parkování.';

  @override
  String get onboardingTitle4 => 'Uchovejte důležité okamžiky.';

  @override
  String get onboardingBody4 =>
      'Ukládejte nedávné záznamy z kamery, prohlížejte události a sdílejte nahrávky.';

  @override
  String get onboardingTitle5 => 'Bezpečnost a soukromí';

  @override
  String get onboardingSafety1 =>
      'Corvista je pomůcka pro vnímání situace při řízení. Sledujte silnici.';

  @override
  String get onboardingSafety2 =>
      'Neovládá vaše vozidlo ani nenahrazuje váš úsudek.';

  @override
  String get onboardingSafety3 =>
      'Detekce a odhady mohou být nepřesné nebo chybět.';

  @override
  String get onboardingSafety4 =>
      'Obraz z kamery se zpracovává ve vašem iPhonu — video se nenahrává.';

  @override
  String get onboardingSafety5 =>
      'Mapy, vyhledávání, trasy a počasí vyžadují připojení k internetu.';

  @override
  String get onboardingSafety6 =>
      'Upevněte iPhone bezpečně tak, aby nezakrýval výhled.';

  @override
  String get onboardingSafety7 => 'Dokončete nastavení před zahájením jízdy.';

  @override
  String get onboardingAcknowledge =>
      'Rozumím, že Corvista je pouze pomůcka pro vnímání situace a že za bezpečnou jízdu odpovídám já.';

  @override
  String get onboardingReadSafety => 'Přečíst úplné bezpečnostní informace';

  @override
  String get onboardingNext => 'Další';

  @override
  String get onboardingSkip => 'Přeskočit';

  @override
  String get onboardingAgree => 'Pokračovat';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Strana $current z $total';
  }

  @override
  String get permTitle => 'Oprávnění';

  @override
  String get permIntro =>
      'Corvista žádá jen o to, co každá funkce potřebuje. Můžete to kdykoli změnit v Nastavení.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Vyžadováno pro detekci, nahrávání a zobrazení parkování. Video se zpracovává ve vašem iPhonu.';

  @override
  String get permLocationTitle => 'Poloha';

  @override
  String get permLocationBody =>
      'Používá se pro rychlost GPS, mapu, trasy, počasí a označení uložených záznamů. Pouze při používání aplikace.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'Rozpoznávání řeči se vyžaduje, jen pokud zapnete zrušení hlasem u tísňových upozornění.';

  @override
  String get permRequired => 'Vyžadováno';

  @override
  String get permOptional => 'Volitelné';

  @override
  String get permAllow => 'Povolit';

  @override
  String get permGranted => 'Povoleno';

  @override
  String get permDenied => 'Zamítnuto';

  @override
  String get permLimited => 'Omezeno';

  @override
  String get permRestricted => 'Omezeno systémem';

  @override
  String get permStart => 'Zahájit jízdu';

  @override
  String get permCameraNeeded =>
      'Můžete pokračovat bez přístupu ke kameře, ale detekce a nahrávání nebudou fungovat, dokud je nepovolíte v Nastavení.';

  @override
  String get permSetupIntro =>
      'Corvista potřebuje tato oprávnění pro plnou funkčnost. Klepněte na Povolit vše a iOS se vás postupně zeptá na každé z nich. Můžete je kdykoli změnit v Nastavení.';

  @override
  String get permCameraLine =>
      'Vyžadováno pro detekci, nahrávání a zobrazení parkování. Video se zpracovává ve vašem iPhonu a nikdy se nenahrává.';

  @override
  String get permLocationLine =>
      'Rychlost GPS, mapa, trasy, počasí a místo uložení záznamů. Pouze při používání aplikace.';

  @override
  String get permMicLine =>
      'Zvuk z kabiny v záznamech událostí a rozpoznání fráze pro zrušení během tísňového upozornění.';

  @override
  String get permSpeechTitle => 'Rozpoznávání řeči';

  @override
  String get permSpeechLine =>
      'Rozpozná frázi pro zrušení během tísňového odpočtu, ve vašem iPhonu tam, kde je to podporováno.';

  @override
  String get permAllowAll => 'Povolit vše';

  @override
  String permAsking(String permission) {
    return 'Žádost o oprávnění: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Některá oprávnění jsou vypnutá. Zapněte je v Nastavení, abyste mohli tyto funkce používat.';

  @override
  String get permNotNow => 'Teď ne';

  @override
  String get tourLabel => 'Prohlídka obrazovky jízdy';

  @override
  String tourProgress(int current, int total) {
    return 'Krok $current z $total';
  }

  @override
  String get tourNext => 'Další';

  @override
  String get tourBack => 'Zpět';

  @override
  String get tourSkip => 'Přeskočit prohlídku';

  @override
  String get tourFinish => 'Zahájit jízdu';

  @override
  String get tourWelcomeTitle => 'Rychlá prohlídka';

  @override
  String get tourWelcomeBody =>
      'Minutový přehled toho nejdůležitějšího na obrazovce jízdy. Nejlépe na stojícím vozidle.';

  @override
  String get tourHudTitle => 'Pruh ukazatelů';

  @override
  String get tourHudSpeed => 'Rychlost pochází z GPS.';

  @override
  String get tourHudRec =>
      'REC ukazuje, kolik sekund záznamu je ve vyrovnávací paměti.';

  @override
  String get tourHudAi =>
      'Štítek AI ukazuje model, počet viděných objektů a tečku: zelená — běží, oranžová — omezeně, červená — zastaveno.';

  @override
  String get tourSaveTitle => 'Uložit událost';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista uchovává průběžnou vyrovnávací paměť posledních $seconds s videa. Neustále se přepisuje, takže se nic neuchová, dokud nezaklepnete na Uložit. Uložené záznamy zůstávají v tomto iPhonu, v Záznamech.';
  }

  @override
  String get tourRecordTitle => 'Nahrajte celou jízdu';

  @override
  String get tourRecordBody =>
      'Klepnutím na Nahrát budete natáčet nepřetržitě, dokud nezastavíte. Dlouhé jízdy se ukládají do Záznamů po 5minutových částech a Uložit událost funguje i během nahrávání.';

  @override
  String get tourViewsTitle => 'Pět pohledů na silnici';

  @override
  String get tourViewDetection =>
      'Živá kamera s rámečky kolem podporovaných objektů.';

  @override
  String get tourViewVirtual => 'Zjednodušená 3D scéna sestavená z detekcí.';

  @override
  String get tourViewMap =>
      'Apple Maps s vyhledáváním a navigací krok za krokem.';

  @override
  String get tourViewParking => 'Kamera plus pohled shora na vzdálenosti.';

  @override
  String get tourViewPerception => 'Masky silnice a objektů.';

  @override
  String get tourMapTitle => 'Vyhledávání a navigace';

  @override
  String get tourMapBody =>
      'Otevřete Mapu, klepněte na vyhledávací pole a vyberte cíl. Zvolte trasu a klepnutím na Start zahajte navigaci krok za krokem. Vyžaduje připojení k internetu.';

  @override
  String get tourClipsTitle => 'Záznamy';

  @override
  String get tourClipsBody =>
      'Prohlížejte, přejmenovávejte, sdílejte nebo mažte uložené události. Záznamy zůstávají v iPhonu, pokud je nesdílíte.';

  @override
  String get tourSettingsTitle => 'Nastavení';

  @override
  String get tourSettingsBody =>
      'Upravte hlasová upozornění a jejich citlivost, kvalitu nahrávání a délku vyrovnávací paměti a nastavte Tísňový režim: experimentální upozornění na náraz s odpočtem pro zrušení.';

  @override
  String get tourSafetyTitle => 'Před jízdou';

  @override
  String get tourSafety1 =>
      'Upevněte iPhone bezpečně tak, aby nezakrýval výhled.';

  @override
  String get tourSafety2 =>
      'Neovládejte aplikaci za jízdy. Vše nastavte na stojícím vozidle.';

  @override
  String get tourSafety3 =>
      'Detekce a zóny jsou odhady. Mohou být chybné nebo chybět.';

  @override
  String get tourSafety4 => 'Za bezpečnou jízdu stále odpovídáte vy.';

  @override
  String get helpTakeTour => 'Spustit prohlídku';

  @override
  String get helpTakeTourSub => 'Minutová prohlídka obrazovky jízdy.';

  @override
  String get tripsTitle => 'Jízdy';

  @override
  String get tripsOpen => 'Deník jízd';

  @override
  String get tripsEmptyTitle => 'Zatím žádné jízdy';

  @override
  String get tripsEmptyBody =>
      'Jízdy se zaznamenávají automaticky, když jedete s Corvista — vzdálenost, čas, rychlost a trasa, kterou jste jeli.';

  @override
  String get tripsDisabledBody =>
      'Deník jízd je vypnutý, takže nové jízdy se nezaznamenávají. Zapněte jej, abyste v tomto iPhonu vedli soukromý záznam svých tras.';

  @override
  String get tripsEnable => 'Zapnout deník jízd';

  @override
  String get tripsToday => 'Dnes';

  @override
  String get tripsYesterday => 'Včera';

  @override
  String tripsRecordingNow(String distance) {
    return 'Zaznamenává se jízda · $distance';
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
      other: '$count událostí',
      many: '$count události',
      few: '$count události',
      one: '1 událost',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count upozornění',
      many: '$count upozornění',
      few: '$count upozornění',
      one: '1 upozornění',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jízd',
      many: '$count jízdy',
      few: '$count jízdy',
      one: '1 jízda',
      zero: 'Žádné jízdy',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Vzdálenost';

  @override
  String get tripsStatDuration => 'Délka';

  @override
  String get tripsStatMoving => 'Doba jízdy';

  @override
  String get tripsStatAvgSpeed => 'Prům. rychlost';

  @override
  String get tripsStatMaxSpeed => 'Max. rychlost';

  @override
  String get tripsDetections => 'Detekce';

  @override
  String get tripsNoDetections =>
      'Během této jízdy nebyly zaznamenány žádné objekty na silnici.';

  @override
  String get tripsTimeline => 'Časová osa';

  @override
  String get tripsEventStart => 'Jízda zahájena';

  @override
  String get tripsEventEnd => 'Jízda ukončena';

  @override
  String get tripsEventAlert => 'Hlasové upozornění';

  @override
  String get tripsEventIncident => 'Záznam události uložen';

  @override
  String get tripsEventEmergency => 'Zjištěna možná nehoda';

  @override
  String get tripsEventNavStart => 'Navigace zahájena';

  @override
  String get tripsEventArrive => 'Příjezd do cíle';

  @override
  String get tripsEventReroute => 'Trasa přepočítána';

  @override
  String get tripsEventRecording => 'Záznam uložen';

  @override
  String get tripsOpenClip => 'Otevřít záznam';

  @override
  String get tripsTrackPreview => 'Stopa GPS';

  @override
  String get tripsRenameTitle => 'Přejmenovat jízdu';

  @override
  String get tripsRenameHint => 'Název jízdy';

  @override
  String get tripsFavorite => 'Přidat do oblíbených';

  @override
  String get tripsUnfavorite => 'Odebrat z oblíbených';

  @override
  String get tripsShareGpx => 'Sdílet GPX';

  @override
  String get tripsShareFailed => 'Tuto jízdu se nepodařilo sdílet.';

  @override
  String get tripsDelete => 'Smazat jízdu';

  @override
  String get tripsDeleteConfirmTitle => 'Smazat tuto jízdu?';

  @override
  String get tripsDeleteConfirmBody =>
      'Trasa a statistiky budou z tohoto iPhonu odstraněny. Záznamy událostí z této jízdy zůstanou zachovány.';

  @override
  String get tripsDeleted => 'Jízda smazána';

  @override
  String get tripsNotFound => 'Tato jízda už není dostupná.';

  @override
  String get tripsPrivacyNote =>
      'Uloženo pouze v tomto iPhonu. Nic se nenahrává.';

  @override
  String get settingsSectionTrips => 'Deník jízd';

  @override
  String get settingsTripLog => 'Zaznamenávat jízdy';

  @override
  String get settingsTripLogSubtitle =>
      'Uchovává trasu a statistiky jízd pouze v tomto iPhonu.';

  @override
  String get settingsTripRetention => 'Uchovávat jízdy po dobu';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dní',
      many: '$days dne',
      few: '$days dny',
      one: '1 den',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 rok';

  @override
  String get settingsRetentionForever => 'Navždy';

  @override
  String get settingsTripRetentionFooter =>
      'Starší jízdy se automaticky smažou při spuštění Corvista.';

  @override
  String get settingsViewTrips => 'Zobrazit jízdy';

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
    return 'Jízda Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Uvolnit místo';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Odstraní dočasné soubory a mezipaměti. Uložené záznamy a jízdy zůstanou zachovány.';

  @override
  String settingsFreedBytes(String size) {
    return 'Uvolněno $size';
  }

  @override
  String get settingsNothingToFree =>
      'Mezipaměti vymazány — žádné dočasné soubory k odstranění.';

  @override
  String get settingsSectionPrivacyData => 'Soukromí a data';

  @override
  String get settingsPrivacyDataFooter =>
      'Záznamy, jízdy a nastavení jsou uloženy pouze v tomto iPhonu. Opustí ho jen tehdy, když se rozhodnete je sdílet.';

  @override
  String get settingsDeleteAllData => 'Smazat všechna data';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Vymazat záznamy, jízdy, kontakty a nastavení z tohoto iPhonu';

  @override
  String get deleteAllTitle => 'Smazat všechna data?';

  @override
  String get deleteAllMessage =>
      'Z tohoto iPhonu bude trvale odstraněno:\n• Záznamy událostí a miniatury\n• Deník jízd a stopy GPS\n• Tísňové kontakty a tísňové události\n• Protokoly detekce a diagnostický protokol\n• Nastavení a nedávné cíle\n• Dočasná vyrovnávací paměť nahrávání a mezipaměť\n\nTuto akci nelze vrátit zpět. Corvista poté začne znovu od uvítacích obrazovek.';

  @override
  String get deleteAllConfirm => 'Smazat vše';

  @override
  String get deleteAllInProgress => 'Mazání…';

  @override
  String get deleteAllDone => 'Všechna data byla smazána';

  @override
  String get deleteAllPartial =>
      'Některé položky se nepodařilo smazat. Zkuste to znovu v Nastavení.';

  @override
  String get diagLogSection => 'Diagnostický protokol';

  @override
  String get diagLogFooter =>
      'Chyby se zaznamenávají pouze v tomto iPhonu, bez poloh, jmen kontaktů a telefonních čísel. Nic se neodesílá, dokud protokol sami nesdílíte.';

  @override
  String get diagLogShare => 'Sdílet diagnostický protokol';

  @override
  String get diagLogEmpty => 'Prázdný';

  @override
  String get diagLogClear => 'Vymazat protokol';

  @override
  String get diagLogClearTitle => 'Vymazat diagnostický protokol?';

  @override
  String get diagLogClearBody =>
      'Uložené záznamy o chybách budou z tohoto iPhonu odstraněny.';

  @override
  String get diagLogCleared => 'Diagnostický protokol vymazán';

  @override
  String get diagLogShareFailed =>
      'Diagnostický protokol se nepodařilo sdílet.';

  @override
  String get privacyControls2 =>
      'Nastavení › Soukromí a data › Smazat všechna data vymaže všechny záznamy, jízdy, kontakty, protokoly a nastavení, které Corvista v tomto iPhonu uchovává.';

  @override
  String get parkingZoneStop => 'Stop';

  @override
  String get parkingZoneVeryClose => 'Velmi blízko';

  @override
  String get parkingZoneClose => 'Blízko';

  @override
  String get parkingZoneNothingClose => 'Nic blízkého nevidím';

  @override
  String get parkingNotDetected =>
      'Zdi, sloupy, tyče a obrubníky se nerozpoznávají';

  @override
  String get parkingApprox => 'cca';

  @override
  String get parkingSideLeft => 'Vlevo';

  @override
  String get parkingSideCenter => 'Střed';

  @override
  String get parkingSideRight => 'Vpravo';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Pouze pohled z přední kamery — nejde o systém 360°';

  @override
  String get parkingMuteBeeps => 'Ztlumit pípání';

  @override
  String get parkingUnmuteBeeps => 'Zapnout pípání';

  @override
  String get parkingAbout => 'O zobrazení parkování';

  @override
  String get parkingLimitationsDetail =>
      'Sleduje se pouze prostor před kamerou. Detektor rozpoznává osobní auta, autobusy a nákladní vozy, lidi, jízdní kola a motocykly. Zdi, sloupy, tyče, obrubníky, patníky, závory a nízké překážky se NErozpoznávají a kapota může zakrývat zem těsně před vozidlem. Vzdálenosti jsou hrubé odhady z jedné kamery (podle velikosti a polohy objektu) a mohou se hodně lišit. Ticho nebo hlášení „Nic blízkého nevidím“ neznamená, že je cesta volná — vždy se rozhlédněte a používejte zrcátka.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Blízkost podle stran: vlevo $left, střed $center, vpravo $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Chyby se zapisují do soukromého protokolu v tomto iPhonu (bez poloh, jmen kontaktů a telefonních čísel). Nikdy se neodesílá automaticky; v Nastavení › Diagnostika ho můžete sdílet nebo vymazat.';
}
