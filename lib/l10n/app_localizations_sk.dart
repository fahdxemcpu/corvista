// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Uvidíte viac na každej ceste.';

  @override
  String get commonCancel => 'Zrušiť';

  @override
  String get commonDelete => 'Odstrániť';

  @override
  String get commonSave => 'Uložiť';

  @override
  String get commonBack => 'Späť';

  @override
  String get commonClose => 'Zavrieť';

  @override
  String get commonRetry => 'Skúsiť znova';

  @override
  String get commonOpenSettings => 'Otvoriť Nastavenia';

  @override
  String get commonLoading => 'Načítava sa…';

  @override
  String get commonError => 'Niečo sa pokazilo.';

  @override
  String commonErrorDetail(String message) {
    return 'Niečo sa pokazilo: $message';
  }

  @override
  String get commonOn => 'Zap.';

  @override
  String get commonOff => 'Vyp.';

  @override
  String get commonRename => 'Premenovať';

  @override
  String get commonShare => 'Zdieľať';

  @override
  String get commonNotAvailable => 'Nedostupné';

  @override
  String get commonTestFootage => 'TESTOVACÍ ZÁZNAM';

  @override
  String get zoneVeryClose => 'Veľmi blízko';

  @override
  String get zoneClose => 'Blízko';

  @override
  String get zoneMedium => 'Stredne';

  @override
  String get zoneFar => 'Ďaleko';

  @override
  String get zoneUnknown => 'Neznáma';

  @override
  String get classPerson => 'Osoba';

  @override
  String get classBicycle => 'Bicykel';

  @override
  String get classMotorcycle => 'Motocykel';

  @override
  String get classCar => 'Vozidlo';

  @override
  String get classBus => 'Autobus';

  @override
  String get classTrafficLight => 'Semafor';

  @override
  String get classStopSign => 'Značka STOP';

  @override
  String get viewDetection => 'Detekcia';

  @override
  String get viewVirtual => 'Virtuálne';

  @override
  String get viewMap => 'Mapa';

  @override
  String get viewParking => 'Parkovanie';

  @override
  String get viewPerception => 'Percepcia';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Červená';

  @override
  String get lightYellow => 'Žltá';

  @override
  String get lightGreen => 'Zelená';

  @override
  String get lightUnknown => 'Neznáma';

  @override
  String get clipsTitle => 'Záznamy';

  @override
  String get clipsSelect => 'Vybrať';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vybraných $count',
      many: 'Vybraných $count',
      few: 'Vybrané $count',
      one: 'Vybraný 1',
      zero: 'Vyberte záznamy',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Vybrať všetko';

  @override
  String get clipsDeselectAll => 'Zrušiť výber';

  @override
  String get clipsDeleteSelected => 'Odstrániť vybrané';

  @override
  String get clipsGridView => 'Zobrazenie mriežky';

  @override
  String get clipsListView => 'Zobrazenie zoznamu';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odstrániť $count záznamov?',
      many: 'Odstrániť $count záznamu?',
      few: 'Odstrániť $count záznamy?',
      one: 'Odstrániť tento záznam?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tieto videá sa natrvalo odstránia z vášho iPhonu. Túto akciu nie je možné vrátiť späť.',
      many: 'Tieto videá sa natrvalo odstránia z vášho iPhonu. Túto akciu nie je možné vrátiť späť.',
      few: 'Tieto videá sa natrvalo odstránia z vášho iPhonu. Túto akciu nie je možné vrátiť späť.',
      one: 'Video sa natrvalo odstráni z vášho iPhonu. Túto akciu nie je možné vrátiť späť.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odstránených $count záznamov',
      many: 'Odstráneného $count záznamu',
      few: 'Odstránené $count záznamy',
      one: 'Záznam odstránený',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Zatiaľ žiadne záznamy';

  @override
  String get clipsEmptyBody =>
      'Počas jazdy Corvista uchováva krátku priebežnú vyrovnávaciu pamäť. Klepnutím na Uložiť udalosť si tu ponecháte posledných niekoľko sekúnd záznamu.';

  @override
  String get clipsLoadError => 'Záznamy sa nepodarilo načítať.';

  @override
  String get clipsStorageTitle => 'Úložisko';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Záznamy $clips · Vyrovnávacia pamäť $buffer · voľné $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uložených záznamov',
      many: '$count uloženého záznamu',
      few: '$count uložené záznamy',
      one: '1 uložený záznam',
      zero: 'Žiadne uložené záznamy',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Vo vašom iPhone dochádza úložisko. Nové udalosti sa nemusia uložiť.';

  @override
  String get clipsMissingFile => 'Súbor chýba';

  @override
  String get clipsEmergencyBadge => 'Náraz';

  @override
  String clipsUntitled(String date) {
    return 'Udalosť · $date';
  }

  @override
  String get clipsAudio => 'Zvuk nahraný';

  @override
  String get clipsFavorite => 'Obľúbené';

  @override
  String get clipsUnfavorite => 'Odstrániť z obľúbených';

  @override
  String get clipsLocation => 'Poloha uložená';

  @override
  String clipsOpenClip(String title) {
    return 'Otvoriť záznam $title';
  }

  @override
  String get playerNotFoundTitle => 'Záznam sa nenašiel';

  @override
  String get playerNotFoundBody => 'Tento záznam mohol byť odstránený.';

  @override
  String get playerMissingTitle => 'Chýba videosúbor';

  @override
  String get playerMissingBody =>
      'Nahrávka tohto záznamu už vo vašom iPhone nie je. Položku môžete odstrániť z galérie.';

  @override
  String get playerRemoveEntry => 'Odstrániť položku';

  @override
  String get playerLoadError => 'Toto video sa nedá prehrať.';

  @override
  String get playerPlay => 'Prehrať';

  @override
  String get playerPause => 'Pozastaviť';

  @override
  String get playerReplay => 'Prehrať znova';

  @override
  String get playerRenameTitle => 'Premenovať záznam';

  @override
  String get playerRenameHint => 'Názov záznamu';

  @override
  String get playerRenamed => 'Záznam premenovaný';

  @override
  String get playerFavorited => 'Pridané do obľúbených';

  @override
  String get playerUnfavorited => 'Odstránené z obľúbených';

  @override
  String get playerShareFailed => 'Tento záznam sa nepodarilo zdieľať.';

  @override
  String get playerDetails => 'Podrobnosti';

  @override
  String get playerDate => 'Nahrané';

  @override
  String get playerDuration => 'Dĺžka';

  @override
  String get playerResolution => 'Rozlíšenie';

  @override
  String get playerSize => 'Veľkosť súboru';

  @override
  String get playerAudio => 'Zvuk';

  @override
  String get playerAudioYes => 'Nahraný';

  @override
  String get playerAudioNo => 'Nenahraný';

  @override
  String get playerReason => 'Uložené pomocou';

  @override
  String get playerReasonManual => 'Tlačidlo Uložiť udalosť';

  @override
  String get playerReasonEmergency => 'Detekcia možného nárazu';

  @override
  String get playerReasonRecovered => 'Obnovené po prerušení';

  @override
  String get playerSpeed => 'Rýchlosť GPS pri uložení';

  @override
  String get playerLocation => 'Poloha';

  @override
  String get playerOpenInMaps => 'Otvoriť v Mapách';

  @override
  String get playerBack => 'Späť';

  @override
  String get playerMore => 'Ďalšie akcie';

  @override
  String get clipsFilterLabel => 'Zobraziť';

  @override
  String get clipsFilterAll => 'Všetko';

  @override
  String get clipsFilterRecordings => 'Ručné';

  @override
  String get clipsFilterIncidents => 'Udalosti';

  @override
  String get clipsFilterEmergency => 'Tiesňové';

  @override
  String get clipsFilterFavorites => 'Obľúbené';

  @override
  String get clipsSort => 'Zoradenie';

  @override
  String get clipsSortNewest => 'Najnovšie prvé';

  @override
  String get clipsSortOldest => 'Najstaršie prvé';

  @override
  String get clipsSortLongest => 'Najdlhšie prvé';

  @override
  String get clipsSortLargest => 'Najväčšie prvé';

  @override
  String get clipsToday => 'Dnes';

  @override
  String get clipsYesterday => 'Včera';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count záznamov',
      many: '$count záznamu',
      few: '$count záznamy',
      one: '$count záznam',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty =>
      'V tejto kategórii zatiaľ nie sú žiadne záznamy.';

  @override
  String get clipsFavoritesEmpty =>
      'Označte záznam hviezdičkou, aby bol tu po ruke.';

  @override
  String get clipsKindRecording => 'Ručný záznam';

  @override
  String get clipsKindIncident => 'Udalosť';

  @override
  String get clipsKindEmergency => 'Tiesňový';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Jazda · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Otvoriť jazdu, počas ktorej bol záznam vytvorený';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return 'Použité $used · voľné $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Záznamy zaberajú $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ručných záznamov',
      many: '$count ručného záznamu',
      few: '$count ručné záznamy',
      one: '$count ručný záznam',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count udalostí',
      many: '$count udalosti',
      few: '$count udalosti',
      one: '$count udalosť',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tiesňových',
      many: '$count tiesňového',
      few: '$count tiesňové',
      one: '$count tiesňový',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Uvoľniť miesto';

  @override
  String get clipsStorageLowGentle =>
      'Voľné miesto je menšie ako 2 GB. Aby nahrávanie prebiehalo plynulo, uvoľnite miesto alebo odstráňte záznamy, ktoré už nepotrebujete.';

  @override
  String get clipsSaveToPhotos => 'Uložiť do Fotiek';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count záznamov',
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
      other: 'Odstrániť $count záznamov ($size)?',
      many: 'Odstrániť $count záznamu ($size)?',
      few: 'Odstrániť $count záznamy ($size)?',
      one: 'Odstrániť tento záznam ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Ukladanie do Fotiek: $done z $total…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Uložené do Fotiek: $count záznamov',
      many: 'Uložené do Fotiek: $count záznamu',
      few: 'Uložené do Fotiek: $count záznamy',
      one: 'Uložené do Fotiek',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return 'Uložené do Fotiek: $saved · nepodarilo sa uložiť: $failed';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista nemá povolenie pridávať videá do Fotiek. Môžete to povoliť v Nastaveniach.';

  @override
  String get clipsPhotosFailed => 'Uloženie do Fotiek sa nepodarilo.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pridané do obľúbených: $count záznamov',
      many: 'Pridané do obľúbených: $count záznamu',
      few: 'Pridané do obľúbených: $count záznamy',
      one: 'Pridané do obľúbených',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odstránené z obľúbených: $count záznamov',
      many: 'Odstránené z obľúbených: $count záznamu',
      few: 'Odstránené z obľúbených: $count záznamy',
      one: 'Odstránené z obľúbených',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (skrátené)';
  }

  @override
  String get playerTrim => 'Skrátiť';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Typ';

  @override
  String get playerReasonRecording => 'Tlačidlo nahrávania';

  @override
  String get trimTitle => 'Skrátiť záznam';

  @override
  String get trimHint =>
      'Presunutím úchytov vyberte časť, ktorú chcete zachovať. Pôvodný záznam zostane nezmenený.';

  @override
  String get trimStartHandle => 'Začiatok strihu';

  @override
  String get trimEndHandle => 'Koniec strihu';

  @override
  String trimSelection(String duration) {
    return 'Vybrané: $duration';
  }

  @override
  String get trimSave => 'Uložiť ako nový záznam';

  @override
  String get trimSaving => 'Ukladá sa skrátený záznam…';

  @override
  String get trimSaved => 'Skrátený záznam bol uložený';

  @override
  String get trimOpenNew => 'Otvoriť';

  @override
  String get trimFailed => 'Tento záznam sa nepodarilo skrátiť.';

  @override
  String get trimStorageFull =>
      'Nie je dosť voľného miesta na uloženie skráteného záznamu.';

  @override
  String get trimPreview => 'Prehrať výber';

  @override
  String get settingsTitle => 'Nastavenia';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Upozornenia';

  @override
  String get settingsSectionAlertCategories => 'Kategórie upozornení';

  @override
  String get settingsSectionRecording => 'Nahrávanie';

  @override
  String get settingsSectionDriving => 'Jazda';

  @override
  String get settingsSectionPower => 'Napájanie';

  @override
  String get settingsSectionEmergency => 'Tiesňové volanie';

  @override
  String get settingsSectionAppearance => 'Vzhľad';

  @override
  String get settingsSectionLanguage => 'Jazyk';

  @override
  String get settingsSectionInformation => 'Informácie';

  @override
  String get settingsCameraLens => 'Objektív';

  @override
  String get settingsLensWide => 'Širokouhlý';

  @override
  String get settingsLensUltraWide => 'Ultraširokouhlý';

  @override
  String get settingsLensTelephoto => 'Teleobjektív';

  @override
  String get settingsLensUnavailable => 'Na tomto iPhone nie je k dispozícii';

  @override
  String get settingsStabilization => 'Stabilizácia';

  @override
  String get settingsStabAuto => 'Automatická';

  @override
  String get settingsStabOff => 'Vyp.';

  @override
  String get settingsStabStandard => 'Štandardná';

  @override
  String get settingsStabCinematic => 'Filmová';

  @override
  String get settingsOverlayOpacity => 'Priehľadnosť prekrytia';

  @override
  String get settingsShowFps => 'Zobraziť štatistiky výkonu';

  @override
  String get settingsShowFpsSubtitle =>
      'Snímková frekvencia a čas inferencie v zobrazení detekcie';

  @override
  String get settingsCameraFooter =>
      'Zmeny objektívu a stabilizácie sa prejavia pri nasledujúcom spustení kamery.';

  @override
  String get settingsAiModel => 'Model AI';

  @override
  String get settingsConfidence => 'Istota detekcie';

  @override
  String get settingsTracking => 'Sledovanie objektov';

  @override
  String get settingsTrackingSubtitle => 'Stabilizuje objekty medzi snímkami';

  @override
  String get settingsShowLabels => 'Zobraziť popisky';

  @override
  String get settingsShowConfidence => 'Zobraziť istotu';

  @override
  String get settingsSegmentationOpacity => 'Priehľadnosť masky percepcie';

  @override
  String get settingsAiFooter =>
      'Nižšia istota zobrazí viac objektov, ale aj viac chybných detekcií. Detekcie môžu byť nepresné.';

  @override
  String get settingsVoiceAlerts => 'Hlasové upozornenia';

  @override
  String get settingsVoiceLanguage => 'Jazyk hlasu';

  @override
  String get settingsVoiceLanguageAuto => 'Podľa jazyka aplikácie';

  @override
  String get settingsVoice => 'Hlas';

  @override
  String get settingsVoiceDefault => 'Predvolený systémový';

  @override
  String get settingsVoiceQualityEnhanced => 'Vylepšený';

  @override
  String get settingsVoiceQualityPremium => 'Vysoká kvalita';

  @override
  String get settingsNoVoices =>
      'Pre tento jazyk nie je nainštalovaný žiadny hlas. Pridajte ho v Nastaveniach iOS › Zjednodušenie ovládania › Hovorený obsah.';

  @override
  String get settingsAlertPedestrian => 'Chodci';

  @override
  String get settingsAlertCyclist => 'Cyklisti';

  @override
  String get settingsAlertMotorcycle => 'Motocykle';

  @override
  String get settingsAlertBus => 'Autobusy';

  @override
  String get settingsAlertVehicleClose => 'Vozidlo veľmi blízko pred vami';

  @override
  String get settingsAlertTrafficLight => 'Zmeny semaforu';

  @override
  String get settingsAlertTrafficMoving => 'Rozbiehanie premávky pred vami';

  @override
  String get settingsAlertStopSign => 'Značky STOP';

  @override
  String get settingsSensitivity => 'Citlivosť';

  @override
  String get settingsSensitivityLow => 'Nízka';

  @override
  String get settingsSensitivityMedium => 'Stredná';

  @override
  String get settingsSensitivityHigh => 'Vysoká';

  @override
  String get settingsCooldown => 'Interval opakovania';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Hlasitosť hlasu';

  @override
  String get settingsQuietMode => 'Tichý režim';

  @override
  String get settingsQuietModeSubtitle =>
      'Hlasom sa oznamujú len najdôležitejšie upozornenia';

  @override
  String get settingsTestVoice => 'Vyskúšať hlas';

  @override
  String get settingsTestVoiceDone => 'Prehráva sa ukážkové upozornenie…';

  @override
  String get settingsParkingBeeps => 'Parkovacie pípanie';

  @override
  String get settingsBeepVolume => 'Hlasitosť pípania';

  @override
  String get settingsAlertsFooter =>
      'Upozornenia sú len pomôcka. Vždy sledujte cestu — ticho neznamená, že je cesta voľná.';

  @override
  String get settingsRecordingProfile => 'Kvalita nahrávania';

  @override
  String get settingsProfileStandard => 'Štandardná · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Vyrovnávacia pamäť udalosti';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsManualMaxLength => 'Max. dĺžka ručného záznamu';

  @override
  String get settingsManualMaxUnlimited => 'Bez obmedzenia';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Nahrávať zvuk';

  @override
  String get settingsRecordAudioSubtitle =>
      'Zahrnie zvuk z kabíny do uložených udalostí';

  @override
  String get settingsMicDenied =>
      'Prístup k mikrofónu je vypnutý. Povoľte ho v Nastaveniach, aby bolo možné nahrávať zvuk.';

  @override
  String get settingsWatermark => 'Vodoznak Corvista';

  @override
  String get settingsTimestamp => 'Pečiatka dátumu a času';

  @override
  String get settingsSaveLocation => 'Ukladať polohu so záznamami';

  @override
  String get settingsStorage => 'Úložisko a záznamy';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count záznamov',
      many: '$count záznamu',
      few: '$count záznamy',
      one: '1 záznam',
      zero: 'Žiadne záznamy',
    );
    return '$_temp0 · využité $used · voľné $free';
  }

  @override
  String get settingsRecordingFooter =>
      'Priebežná vyrovnávacia pamäť zostáva vo vašom iPhone a neustále sa prepisuje. Na pozadí sa nič nenahráva.';

  @override
  String get settingsDefaultView => 'Predvolené zobrazenie';

  @override
  String get settingsUnits => 'Jednotky';

  @override
  String get settingsShowCompass => 'Zobraziť kompas';

  @override
  String get settingsHudStyle => 'Štýl HUD';

  @override
  String get settingsHudCustomize => 'Prispôsobiť HUD';

  @override
  String get settingsDrivingSide => 'Strana premávky';

  @override
  String get settingsDrivingSideAuto => 'Automaticky';

  @override
  String get settingsDrivingSideRight => 'Vpravo';

  @override
  String get settingsDrivingSideLeft => 'Vľavo';

  @override
  String get settingsVirtualStyle => 'Štýl virtuálneho zobrazenia';

  @override
  String get settingsVirtualMinimal => 'Minimálny';

  @override
  String get settingsVirtualPerspective => 'Perspektívny';

  @override
  String get settingsVirtualHighContrast => 'Vysoký kontrast';

  @override
  String get settingsKeepScreenOn => 'Nevypínať displej počas jazdy';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Zobrazovať navigačné pokyny na uzamknutej obrazovke a v Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Nahrávanie pozastavené, keď bola Corvista na pozadí';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Pozastavené';

  @override
  String get liveActivityDashcamOff => 'Kamera vyp.';

  @override
  String get liveActivityEnded => 'Navigácia ukončená';

  @override
  String get liveActivityEta => 'Príchod';

  @override
  String get settingsAutoRecenter => 'Automaticky vycentrovať mapu';

  @override
  String get settingsHudStyleClassic => 'Klasický';

  @override
  String get settingsHudStyleGrid => 'Mriežka';

  @override
  String get settingsHudStyleMinimal => 'Minimálny';

  @override
  String get settingsHudStylePerformance => 'Športový';

  @override
  String get settingsHudStyleNavigation => 'Navigácia';

  @override
  String get settingsHudStyleNight => 'Nočný';

  @override
  String get settingsHudStyleHighContrast => 'Vysoký kontrast';

  @override
  String get settingsPowerMode => 'Režim napájania';

  @override
  String get settingsPowerBalanced => 'Vyvážený';

  @override
  String get settingsPowerPerformance => 'Výkon';

  @override
  String get settingsPowerSaver => 'Úspora energie';

  @override
  String get settingsPowerFooter =>
      'Corvista automaticky znižuje frekvenciu AI a vizuálne efekty, keď sa iPhone zahreje alebo je slabá batéria.';

  @override
  String get settingsThermal => 'Teplotný stav';

  @override
  String get settingsThermalNominal => 'Normálny';

  @override
  String get settingsThermalFair => 'Teplý';

  @override
  String get settingsThermalSerious => 'Horúci';

  @override
  String get settingsThermalCritical => 'Kritický';

  @override
  String get settingsBattery => 'Batéria';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Nabíja sa';
  }

  @override
  String get settingsLowPowerMode =>
      'Je zapnutý Režim nízkej spotreby — AI beží zníženou frekvenciou.';

  @override
  String get settingsAiRate => 'Aktuálna frekvencia AI';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Detekcia nárazu';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Zap. · odpočet $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Experimentálna funkcia. Nenahrádza tiesňové služby.';

  @override
  String get settingsTheme => 'Motív';

  @override
  String get settingsThemeSystem => 'Systémový';

  @override
  String get settingsThemeDark => 'Tmavý';

  @override
  String get settingsThemeLight => 'Svetlý';

  @override
  String get settingsReduceMotion => 'Obmedziť pohyb';

  @override
  String get settingsReduceMotionSubtitle =>
      'Obmedzí animácie v celej aplikácii';

  @override
  String get settingsAppLanguage => 'Jazyk aplikácie';

  @override
  String get settingsPrivacyPolicy => 'Zásady ochrany osobných údajov';

  @override
  String get settingsTerms => 'Podmienky používania';

  @override
  String get settingsHelp => 'Pomocník';

  @override
  String get settingsSupport => 'Kontaktovať podporu';

  @override
  String get settingsLicenses => 'Open-source licencie';

  @override
  String get settingsSupportUnavailable =>
      'Nepodarilo sa otvoriť Mail. Napíšte na support@corvista.app.';

  @override
  String get settingsSafety => 'Bezpečnostné informácie';

  @override
  String get settingsDiagnostics => 'Diagnostika';

  @override
  String get settingsVersion => 'Verzia';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Prispôsobiť HUD';

  @override
  String get hudCustomPreview => 'Náhľad · ukážkové hodnoty';

  @override
  String get hudCustomStyle => 'Štýl';

  @override
  String get hudCustomElements => 'Prvky';

  @override
  String get hudCustomSpeed => 'Rýchlosť';

  @override
  String get hudCustomHeading => 'Smer a kompas';

  @override
  String get hudCustomClock => 'Hodiny';

  @override
  String get hudCustomBattery => 'Batéria a teplota';

  @override
  String get hudCustomDetections => 'Stav AI a detekcie';

  @override
  String get hudCustomWeather => 'Počasie';

  @override
  String get hudCustomAppearance => 'Veľkosť a priehľadnosť';

  @override
  String get hudCustomSize => 'Veľkosť';

  @override
  String get hudCustomOpacity => 'Priehľadnosť';

  @override
  String get hudCustomFooter =>
      'Varovania, napríklad pred prehriatím, sa zobrazujú vždy, aj keď sú prvky skryté.';

  @override
  String get hudCustomDescClassic => 'Vyvážená sada ukazovateľov';

  @override
  String get hudCustomDescGrid => 'Perspektívna mriežka nad cestou';

  @override
  String get hudCustomDescMinimal => 'Len rýchlosť, nič iné';

  @override
  String get hudCustomDescPerformance => 'Oblúk rýchlosti s údajmi naživo';

  @override
  String get hudCustomDescNavigation => 'Najprv ďalší manéver';

  @override
  String get hudCustomDescNight => 'Tlmený s červeným nádychom pre nočnú jazdu';

  @override
  String get hudCustomDescHighContrast =>
      'Maximálna čitateľnosť na ostrom slnku';

  @override
  String get languageTitle => 'Jazyk';

  @override
  String get languageSystem => 'Predvolený systémový';

  @override
  String get languageSystemSubtitle => 'Použiť jazyk iPhonu';

  @override
  String get languageFooter =>
      'Ďalšie jazyky sa pripravujú. Jazyk hlasových upozornení sa dá nastaviť osobitne v časti Upozornenia.';

  @override
  String get diagTitle => 'Diagnostika';

  @override
  String get diagPerformance => 'Výkon';

  @override
  String get diagInference => 'Čas inferencie';

  @override
  String get diagDetectHz => 'Frekvencia detekcie';

  @override
  String get diagCameraFps => 'Snímková frekvencia kamery';

  @override
  String get diagMemory => 'Pamäť';

  @override
  String get diagDropped => 'Zahodené snímky';

  @override
  String get diagSegmentation => 'Čas segmentácie';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Stav';

  @override
  String get diagSource => 'Zdroj';

  @override
  String get diagSourceCamera => 'Kamera naživo';

  @override
  String get diagSourceFile => 'Testovací videosúbor';

  @override
  String get diagResolution => 'Veľkosť vyrovnávacej pamäte';

  @override
  String get diagLens => 'Objektív';

  @override
  String get diagError => 'Posledná chyba';

  @override
  String get diagModel => 'Model AI';

  @override
  String get diagModelLoad => 'Čas načítania modelu';

  @override
  String get diagPower => 'Napájanie';

  @override
  String get diagSegHz => 'Frekvencia segmentácie';

  @override
  String get diagReduced => 'Obmedzené efekty';

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
  String get diagCamStarting => 'Spúšťa sa';

  @override
  String get diagCamRunning => 'Beží';

  @override
  String get diagCamInterrupted => 'Prerušená';

  @override
  String get diagCamStopped => 'Zastavená';

  @override
  String get diagCamUnavailable => 'Nedostupná';

  @override
  String get diagCamPermissionDenied => 'Oprávnenie zamietnuté';

  @override
  String get diagCamError => 'Chyba';

  @override
  String get diagTestFootage => 'Testovací záznam';

  @override
  String get diagTestFootageBody =>
      'Spustí skutočnú detekciu v zariadení na lokálnom videosúbore namiesto kamery. Každé zobrazenie ho označí ako TESTOVACÍ ZÁZNAM.';

  @override
  String get diagPathLabel => 'Cesta k videosúboru';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Použiť Documents/test_drive.mp4';

  @override
  String get diagRun => 'Spustiť testovací záznam';

  @override
  String get diagRunStarted =>
      'Testovací záznam sa spustil. Otvorte zobrazenie jazdy, aby ste ho videli.';

  @override
  String get diagBackToCamera => 'Vrátiť sa ku kamere naživo';

  @override
  String get diagDebugOnly =>
      'Testovací záznam je dostupný len vo vývojárskych zostaveniach.';

  @override
  String get diagFileMissing => 'Na tejto ceste neexistuje žiadny súbor.';

  @override
  String get emergencySetupTitle => 'Detekcia nárazu';

  @override
  String get emergencyExperimental => 'Experimentálne';

  @override
  String get emergencyIntro =>
      'Počas jazdy môže Corvista pomocou pohybových senzorov vášho iPhonu sledovať možný vážny náraz. Ak ho zaznamená, spustí sa odpočet. Ak ho nezrušíte, Corvista ponúkne volanie tiesňových služieb a odoslanie správy vašim kontaktom.';

  @override
  String get emergencyDisclaimer1 =>
      'Nenahrádza tiesňové služby ani vlastný systém detekcie nehôd vo vašom vozidle.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS vždy vyžaduje potvrdenie pred uskutočnením hovoru alebo odoslaním správy.';

  @override
  String get emergencyDisclaimer3 =>
      'Nárazy môžu zostať nezaznamenané a prudké brzdenie či nerovnosti ich môžu pripomínať.';

  @override
  String get emergencyParkedWarning =>
      'Toto nastavenie dokončite na stojacom vozidle. Pri pohybe vozidla je nastavenie uzamknuté.';

  @override
  String get emergencyEnable => 'Zapnúť detekciu nárazu';

  @override
  String get emergencyEnableSubtitle => 'Aktívne len počas jazdy';

  @override
  String get emergencyNeedNumber => 'Najprv pridajte tiesňové číslo.';

  @override
  String get emergencyContacts => 'Tiesňové kontakty';

  @override
  String get emergencyAddContact => 'Pridať kontakt';

  @override
  String get emergencyNoContacts =>
      'Zatiaľ žiadne kontakty. Kontakty dostanú správu až po vašom potvrdení.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Odstrániť kontakt $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Po náraze už nebude ponúknutý ako príjemca.';

  @override
  String get emergencyRemove => 'Odstrániť';

  @override
  String get emergencyContactsError => 'Kontakty sa nepodarilo načítať.';

  @override
  String get emergencyNumber => 'Tiesňové číslo';

  @override
  String get emergencyNumberHint => 'napr. 112 alebo 911';

  @override
  String get emergencyMessage => 'Šablóna správy';

  @override
  String get emergencyMessageDefault =>
      'Mohlo dôjsť k mojej dopravnej nehode. Túto správu pripravila aplikácia Corvista a obsahuje moju poslednú známu polohu, ak je k dispozícii.';

  @override
  String get emergencyMessageHint =>
      'Nechajte prázdne na použitie predvolenej správy.';

  @override
  String get emergencyCountdown => 'Dĺžka odpočtu';

  @override
  String get emergencyVoiceCancel => 'Zrušenie hlasom';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Počas odpočtu povedzte „Som v poriadku“ alebo „Zrušiť“. Používa rozpoznávanie reči v zariadení, ak je dostupné.';

  @override
  String get emergencyVoicePermDenied =>
      'Na zrušenie hlasom je potrebný prístup k mikrofónu a rozpoznávaniu reči.';

  @override
  String get emergencyAutoSave => 'Ukladať záznam udalosti automaticky';

  @override
  String get emergencyTest => 'Vyskúšať odpočet (bez hovoru)';

  @override
  String get emergencyTestBody =>
      'Spustí simulovaný náraz, aby ste videli odpočet. V testovacom režime sa nikdy neuskutoční hovor ani sa neodošle správa.';

  @override
  String get emergencyNotSet => 'Nenastavené';

  @override
  String get emergencyAlertHeadline => 'Zaznamenaný možný vážny náraz.';

  @override
  String get emergencyAlertSubtitle => 'Ste v poriadku?';

  @override
  String get emergencyAlertCancel => 'Som v poriadku — Zrušiť';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Zostáva $seconds sekúnd',
      many: 'Zostáva $seconds sekundy',
      few: 'Zostávajú $seconds sekundy',
      one: 'Zostáva 1 sekunda',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Počúvam — povedzte „Som v poriadku“ a odpočet zrušíte';

  @override
  String emergencyAlertHeard(String text) {
    return 'Počuté: „$text“';
  }

  @override
  String get emergencyAlertEscalated => 'Bez odpovede. Vyberte, čo urobiť:';

  @override
  String get emergencyAlertCall => 'Zavolať tiesňové služby';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Volá číslo $number. iOS požiada o potvrdenie.';
  }

  @override
  String get emergencyAlertMessage => 'Napísať kontaktom';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Otvorí pripravenú správu. O jej odoslaní rozhodnete vy.';

  @override
  String get emergencyAlertTestMode => 'Testovací režim — hovor sa neuskutoční';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'Som v poriadku — Zavrieť';

  @override
  String get emergencyMsgSent => 'Správa odoslaná.';

  @override
  String get emergencyMsgCancelled => 'Správa nebola odoslaná.';

  @override
  String get emergencyMsgFailed => 'Správu sa nepodarilo odoslať.';

  @override
  String get emergencyMsgUnavailable =>
      'Správy nie sú na tomto zariadení dostupné.';

  @override
  String emergencyCallFailed(String number) {
    return 'Hovor sa nepodarilo začať. Zavolajte na číslo $number sami.';
  }

  @override
  String get modelsTitle => 'Modely AI';

  @override
  String get modelsIntro =>
      'Všetky modely sú súčasťou aplikácie a bežia úplne vo vašom iPhone. Obraz z kamery nikdy neopúšťa zariadenie.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Naživo: $ms ms na snímku · $hz detekcií/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Načítané za $ms ms';
  }

  @override
  String get modelsEfficientName => 'Úsporný';

  @override
  String get modelsEfficientDesc =>
      'Rýchly, kompaktný detektor určený na dlhé jazdy s nízkym zahrievaním a spotrebou batérie.';

  @override
  String get modelsEnhancedName => 'Vylepšený';

  @override
  String get modelsEnhancedDesc =>
      'Väčší detektor, ktorý nájde menšie a vzdialenejšie objekty, za cenu vyššej spotreby energie.';

  @override
  String get modelsSegmentationName => 'Segmentácia';

  @override
  String get modelsSegmentationDesc =>
      'Kombinuje rýchlu detekciu s maskami povrchu vozovky a objektov pre zobrazenie Percepcia.';

  @override
  String get modelsNoneName => 'AI pozastavená';

  @override
  String get modelsNoneDesc =>
      'Kamera a nahrávanie bežia ďalej bez detekcie objektov. Najnižšia spotreba energie.';

  @override
  String get modelsGenericDesc =>
      'Model detekcie objektov bežiaci v zariadení.';

  @override
  String get modelsFunctionDetection =>
      'Detekuje vozidlá, osoby, bicykle, motocykle, autobusy, semafory a značky STOP';

  @override
  String get modelsFunctionSegmentation =>
      'Pridáva masky povrchu vozovky a objektov';

  @override
  String get modelsFunctionNone => 'Bez detekcie; iba záznam kamery';

  @override
  String get modelsSize => 'Veľkosť';

  @override
  String get modelsInput => 'Vstup';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Funguje s';

  @override
  String get modelsStatusInstalled => 'Nainštalovaný (súčasť aplikácie)';

  @override
  String get modelsStatusNotInstalled => 'Nenainštalovaný';

  @override
  String get modelsSelected => 'Vybraný';

  @override
  String get modelsUse => 'Použiť tento model';

  @override
  String get modelsSwitching => 'Načítava sa model…';

  @override
  String modelsSwitched(String name) {
    return 'Aktívny model: $name';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Namerané na tomto zariadení: priemerne $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Na tomto zariadení nemerané';

  @override
  String get modelsBenchmarkRun => 'Spustiť test výkonu';

  @override
  String get modelsBenchmarkRunning => 'Prebieha test výkonu…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Vyberte tento model, aby ste mohli zmerať jeho výkon.';

  @override
  String get modelsBenchmarkDone => 'Test výkonu dokončený';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Test výkonu zlyhal: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Posledná aktualizácia: $date';
  }

  @override
  String get safetyTitle => 'Bezpečnostné informácie';

  @override
  String get safetyIntro =>
      'Corvista je pomôcka na vnímanie situácie počas jazdy. Neovláda vaše vozidlo a nemôže nahradiť vašu pozornosť, úsudok ani bezpečnostné systémy vozidla.';

  @override
  String get safetyBeforeTitle => 'Pred jazdou';

  @override
  String get safetyBefore1 =>
      'Upevnite iPhone bezpečne na miesto, ktoré je v súlade s predpismi a nezakrýva výhľad, airbagy ani ovládacie prvky.';

  @override
  String get safetyBefore2 =>
      'Dokončite nastavenie, vyberte zobrazenie a zadajte cieľ na stojacom vozidle.';

  @override
  String get safetyBefore3 =>
      'Na dlhšie cesty pripojte nabíjačku a ak je to možné, chráňte telefón pred priamym slnkom.';

  @override
  String get safetyWhileTitle => 'Počas jazdy';

  @override
  String get safetyWhile1 =>
      'Majte oči na ceste. Veľké ovládacie prvky na obrazovke používajte, len keď je to bezpečné a zákonné.';

  @override
  String get safetyWhile2 =>
      'Upozornenia sú pomôcka, nie varovania, na ktoré sa dá spoliehať. Ticho nikdy neznamená, že je cesta voľná.';

  @override
  String get safetyWhile3 =>
      'Pri rozpore dodržiavajte dopravné predpisy, signály a značky, nie aplikáciu.';

  @override
  String get safetyLimitsTitle => 'Obmedzenia';

  @override
  String get safetyLimits1 =>
      'Jediná kamera telefónu vidí len to, čo je pred ňou. Objekty mimo jej záberu, zakryté alebo veľmi blízko nie sú detekované.';

  @override
  String get safetyLimits2 =>
      'Detekcie môžu chýbať, prísť neskoro alebo byť chybné, najmä v noci, v daždi, v hmle, pri oslnení alebo so špinavým čelným sklom.';

  @override
  String get safetyLimits3 =>
      'Rozpoznávané sú len podporované kategórie: vozidlá, autobusy, motocykle, bicykle, osoby, semafory a značky STOP. Pruhy vo virtuálnom zobrazení sú štylizované, nie detekované.';

  @override
  String get safetyLimits4 =>
      'Vzdialenosť sa zobrazuje ako približné zóny (Veľmi blízko, Blízko, Stredne, Ďaleko), nikdy ako zmerané vzdialenosti. Zobrazenie parkovania nenahrádza parkovacie senzory.';

  @override
  String get safetyHeatTitle => 'Teplo a batéria';

  @override
  String get safetyHeat1 =>
      'Nepretržité používanie kamery a AI zahrieva iPhone. Corvista znižuje frekvenciu analýzy, keď sa zariadenie zahreje, a zobrazí varovanie; ak sa iOS prehreje, kamera sa môže zastaviť.';

  @override
  String get safetyEmergencyTitle => 'Tiesňová funkcia';

  @override
  String get safetyEmergency1 =>
      'Detekcia možného nárazu je experimentálna. Skutočnú nehodu nemusí zachytiť a môže ju spustiť iná udalosť.';

  @override
  String get safetyEmergency2 =>
      'Nikdy nikoho nekontaktuje potichu: iOS vždy vyžaduje potvrdenie hovoru alebo správy. Nenahrádza volanie tiesňových služieb vami samotnými.';

  @override
  String get privacyTitle => 'Súkromie';

  @override
  String get privacyIntro =>
      'Corvista je navrhnutá tak, aby údaje o vašich jazdách zostali vo vašom iPhone. Neexistuje žiadny účet Corvista a Corvista neprevádzkuje vlastné servery.';

  @override
  String get privacyCameraTitle => 'Kamera a AI';

  @override
  String get privacyCamera1 =>
      'Detekcia, sledovanie a segmentácia objektov prebiehajú úplne vo vašom iPhone. Snímky z kamery sa nikdy nenahrávajú.';

  @override
  String get privacyCamera2 =>
      'Kamera beží, len keď je Corvista otvorená na obrazovke. Po prechode aplikácie na pozadie sa pozastaví — neexistuje žiadne skryté nahrávanie na pozadí.';

  @override
  String get privacyRecordingsTitle => 'Záznamy';

  @override
  String get privacyRecordings1 =>
      'Priebežná vyrovnávacia pamäť je dočasná a neustále sa prepisuje. Záznam sa uchová, len keď klepnete na Uložiť udalosť alebo, ak to povolíte, po možnom náraze.';

  @override
  String get privacyRecordings2 =>
      'Uložené záznamy zostávajú v súkromnom úložisku Corvista vo vašom iPhone. Zariadenie opustia, len keď zvolíte Zdieľať. Odstránením aplikácie sa odstránia.';

  @override
  String get privacyRecordings3 =>
      'Zvuk sa nahráva, len ak ho zapnete a udelíte prístup k mikrofónu.';

  @override
  String get privacyLocationTitle => 'Poloha';

  @override
  String get privacyLocation1 =>
      'Poloha sa používa, keď je aplikácia otvorená, na rýchlosť, mapu, trasy a počasie. Ak je zapnuté „Ukladať polohu“, pozícia v okamihu uloženia sa uloží so záznamom vo vašom zariadení.';

  @override
  String get privacyNetworkTitle => 'Sieťové služby';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — zobrazenie mapy, vyhľadávanie miest a trasy. Váš hľadaný text a približná poloha sa odosielajú spoločnosti Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — aktuálne a hodinové počasie pre vašu polohu.';

  @override
  String get privacyNetwork4 =>
      'Corvista neobsahuje žiadnu reklamu ani analytiku či sledovanie tretích strán.';

  @override
  String get privacyEmergencyTitle => 'Tiesňové kontakty';

  @override
  String get privacyEmergency1 =>
      'Kontakty, ktoré vyberiete, sú uložené v kľúčenke iOS v tomto zariadení. Zrušenie hlasom využíva rozpoznávanie reči v zariadení, ak je dostupné. Hovory a správy sa odošlú až po vašom potvrdení v iOS.';

  @override
  String get privacyControlsTitle => 'Vaše možnosti';

  @override
  String get privacyControls1 =>
      'Záznamy môžete kedykoľvek odstrániť v časti Záznamy a prístup ku kamere, mikrofónu, polohe a reči môžete zmeniť alebo odvolať v Nastaveniach iOS.';

  @override
  String get termsTitle => 'Podmienky používania';

  @override
  String get termsIntro =>
      'Používaním Corvista súhlasíte s týmito podmienkami. Platí aj štandardná licenčná zmluva s koncovým používateľom licencovanej aplikácie spoločnosti Apple.';

  @override
  String get termsUseTitle => 'Používanie Corvista';

  @override
  String get termsUse1 =>
      'Corvista je pomôcka na vnímanie situácie počas jazdy a palubná kamera. Za bezpečnú a zákonnú jazdu ste po celý čas plne zodpovedný vy.';

  @override
  String get termsUse2 =>
      'Neovládajte aplikáciu spôsobom, ktorý vás počas jazdy vyrušuje. Zariadenie upevnite bezpečne a v súlade s predpismi.';

  @override
  String get termsAccuracyTitle => 'Žiadne záruky presnosti';

  @override
  String get termsAccuracy1 =>
      'Detekcie, zóny, upozornenia, značky na mape, trasy a počasie môžu byť neúplné, oneskorené alebo chybné. Corvista neovláda vaše vozidlo.';

  @override
  String get termsAccuracy2 =>
      'Tiesňová funkcia je experimentálna a nemusí náraz zaznamenať alebo sa môže spustiť chybne.';

  @override
  String get termsRecordingTitle => 'Predpisy o nahrávaní';

  @override
  String get termsRecording1 =>
      'Predpisy o palubných kamerách, nahrávaní zvuku a natáčaní osôb sa líšia podľa krajiny a regiónu. Za ich dodržiavanie zodpovedáte vy, aj pri zdieľaní záznamov.';

  @override
  String get termsLiabilityTitle => 'Zodpovednosť';

  @override
  String get termsLiability1 =>
      'Aplikácia sa poskytuje „tak, ako je“. V rozsahu povolenom zákonom vývojár nezodpovedá za nehody, straty, pokuty ani škody vzniknuté jej používaním alebo spoliehaním sa na jej výstupy.';

  @override
  String get termsChangesTitle => 'Zmeny';

  @override
  String get termsChanges1 =>
      'Tieto podmienky sa môžu aktualizovať s novými verziami aplikácie. Pokračovanie v používaní po aktualizácii znamená súhlas s upravenými podmienkami.';

  @override
  String get helpTitle => 'Pomocník';

  @override
  String get helpIntro =>
      'Odpovede na časté otázky. Bezpečnostné pokyny nájdete v časti Bezpečnostné informácie.';

  @override
  String get helpQSave => 'Ako si uchovám záznam udalosti?';

  @override
  String get helpASaveBuffer =>
      'Klepnite na veľké tlačidlo Uložiť udalosť v zobrazení jazdy. Corvista uloží do Záznamov posledných 20 alebo 30 sekúnd z priebežnej vyrovnávacej pamäte (podľa voľby v Nastavenia › Nahrávanie).';

  @override
  String get helpQWhere => 'Kde sú moje záznamy uložené?';

  @override
  String get helpAWhere =>
      'V súkromnom úložisku Corvista vo vašom iPhone. Nikdy sa nenahrávajú. Na odoslanie alebo export záznamu použite Zdieľať v prehrávači.';

  @override
  String get helpQZones => 'Aké presné sú zóny vzdialenosti?';

  @override
  String get helpAZones =>
      'Zóny sú hrubé odhady z jedinej kamery podľa typických veľkostí objektov. Berte ich ako približné nápovedy, nikdy ako vzdialenosti.';

  @override
  String get helpQSlow => 'Prečo sa detekcia spomaľuje?';

  @override
  String get helpASlow =>
      'Keď sa iPhone zahreje, batéria je slabá alebo je zapnutý Režim nízkej spotreby, Corvista znižuje frekvenciu analýzy, aby zariadenie chránila. Režim napájania môžete zmeniť v Nastaveniach.';

  @override
  String get helpQMap => 'Mapa, vyhľadávanie alebo počasie nefungujú.';

  @override
  String get helpAMap =>
      'Tieto funkcie vyžadujú pripojenie na internet a prístup k polohe. Skontrolujte pripojenie a povoľte Corvista polohu v Nastaveniach iOS.';

  @override
  String get helpQSimulator => 'Kamera sa zobrazuje ako nedostupná.';

  @override
  String get helpASimulator =>
      'Uistite sa, že je v Nastaveniach iOS povolený prístup ku kamere a že kameru nepoužíva iná aplikácia. V simulátore iOS kamera nie je; namiesto nej možno použiť lokálne testovacie video.';

  @override
  String get emergencyMsgNoContacts => 'Najprv pridajte tiesňový kontakt.';

  @override
  String get cameraStarting => 'Spúšťa sa kamera…';

  @override
  String get cameraInterrupted => 'Kamera pozastavená';

  @override
  String get cameraInterruptedBody =>
      'iOS kameru pozastavil, napríklad počas hovoru alebo keď ju používa iná aplikácia. Obnoví sa automaticky.';

  @override
  String get cameraUnavailable => 'Kamera nedostupná';

  @override
  String get cameraUnavailableBody =>
      'V tomto zariadení nie je k dispozícii žiadna kamera. Zobrazenia detekcie, nahrávania a parkovania vyžadujú zadnú kameru.';

  @override
  String get cameraRunTestFootage => 'Spustiť testovací záznam';

  @override
  String get cameraPermissionDenied => 'Prístup ku kamere je vypnutý';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista potrebuje kameru na detekciu, nahrávanie a zobrazenia parkovania. Zapnite prístup ku kamere v Nastaveniach.';

  @override
  String get cameraError => 'Chyba kamery';

  @override
  String get cameraStopped => 'Kamera zastavená';

  @override
  String get cameraStart => 'Spustiť kameru';

  @override
  String get cameraFocusHint => 'Klepnutím zaostríte';

  @override
  String get cameraPreviewLabel =>
      'Obraz z kamery naživo s detekovanými objektmi';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps sn./s · AI $hz Hz · $ms ms · zahodené $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Rýchlosť $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Žiadna rýchlosť GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Smer $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Nahrávanie do vyrovnávacej pamäte, uložené $seconds z $target sekúnd';
  }

  @override
  String get hudRecIdle => 'REC vyp.';

  @override
  String get hudRecSaving => 'Ukladá sa…';

  @override
  String get hudRecError => 'Chyba REC';

  @override
  String get hudAiPaused => 'AI pozastavená';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objektov',
      many: '$count objektu',
      few: '$count objekty',
      one: '1 objekt',
      zero: 'Žiadne objekty',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'zistených $count objektov',
      many: 'zisteného $count objektu',
      few: 'zistené $count objekty',
      one: 'zistený 1 objekt',
      zero: 'nezistené žiadne objekty',
    );
    return 'Model AI $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Horúco — AI spomalená';

  @override
  String get hudThermalCritical => 'Príliš horúco — AI pozastavená';

  @override
  String hudBatteryLow(String percent) {
    return 'Batéria $percent';
  }

  @override
  String get hudLowPower => 'Režim nízkej spotreby';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Počasie $temperature, $condition. Klepnutím zobrazíte podrobnosti.';
  }

  @override
  String get hudNoGuidance =>
      'Vyhľadajte cieľ v zobrazení Mapa a tu uvidíte navigačné pokyny.';

  @override
  String get navArrived => 'Ste v cieli';

  @override
  String get navRerouting => 'Prepočítava sa trasa…';

  @override
  String get navSearchHint => 'Hľadať cieľ';

  @override
  String get navSearchFieldHint => 'Adresa, miesto alebo firma';

  @override
  String get navNoResults => 'Žiadne zodpovedajúce miesta';

  @override
  String get navSearching => 'Hľadá sa…';

  @override
  String get navSearchStartTyping =>
      'Zadajte adresu alebo názov miesta. Výsledky pochádzajú z Apple Maps a vyžadujú pripojenie na internet.';

  @override
  String get navErrorUnavailable =>
      'Vyhľadávanie a trasy nie sú dostupné — skontrolujte pripojenie na internet.';

  @override
  String get navErrorNoLocation => 'Čaká sa na polohu na naplánovanie trasy.';

  @override
  String get navErrorPermission =>
      'Prístup k polohe je vypnutý, takže trasy nemožno začať z vašej pozície.';

  @override
  String navErrorGeneric(String code) {
    return 'Trasy sa nepodarilo načítať ($code).';
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
    return 'Príchod $time';
  }

  @override
  String get navStart => 'Štart';

  @override
  String get navEnd => 'Ukončiť';

  @override
  String get navEndLabel => 'Ukončiť navigáciu';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · zostáva $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Upozornenie: $text';
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
  String get weatherTitle => 'Počasie';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Pocitovo $temperature';
  }

  @override
  String get weatherPrecipitation => 'Zrážky';

  @override
  String get weatherWind => 'Vietor';

  @override
  String get weatherVisibility => 'Viditeľnosť';

  @override
  String get weatherHumidity => 'Vlhkosť';

  @override
  String get weatherHourly => 'Nasledujúce hodiny';

  @override
  String weatherAsOf(String time) {
    return 'Aktualizované $time';
  }

  @override
  String get weatherRefresh => 'Obnoviť počasie';

  @override
  String get weatherUnavailable => 'Počasie teraz nie je dostupné.';

  @override
  String get weatherNoLocation => 'Počasie vyžaduje vašu polohu.';

  @override
  String get weatherLegal => 'Zdroje údajov a právne informácie';

  @override
  String weatherProvidedBy(String service) {
    return 'Údaje o počasí: $service';
  }

  @override
  String get weatherNow => 'Teraz';

  @override
  String get virtualEmpty => 'Nezistili sa žiadne podporované objekty';

  @override
  String get virtualEmptyCameraOff =>
      'Virtuálne zobrazenie vyžaduje kameru naživo.';

  @override
  String get virtualLaneDisclaimer =>
      'Čiary jazdných pruhov sú ilustratívne, nie detekované.';

  @override
  String virtualNearest(String zone) {
    return 'Najbližšie: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtuálna cestná scéna: $summary';
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
  String get virtualStatusLive => 'naživo';

  @override
  String get virtualStatusPaused => 'pozastavená';

  @override
  String get virtualStatusCameraOff => 'Kamera vyp.';

  @override
  String get virtualStatusTestFootage => 'Testovací záznam';

  @override
  String get virtualEmptyHint =>
      'Vozidlá, osoby, bicykle, semafory a značky STOP sa tu zobrazia po detekcii.';

  @override
  String get mapRecenter => 'Vycentrovať';

  @override
  String get mapZoomIn => 'Priblížiť';

  @override
  String get mapZoomOut => 'Oddialiť';

  @override
  String get mapUnsupported => 'Interaktívna mapa je dostupná na iPhone.';

  @override
  String get mapObjectsApprox => 'Značky objektov ukazujú približné pozície.';

  @override
  String get mapWeatherUnavailable => 'Počasie nedostupné';

  @override
  String get navErrorNoRoute => 'Do tohto cieľa sa nenašla žiadna trasa.';

  @override
  String get navDismiss => 'Zavrieť';

  @override
  String get navGo => 'Ísť';

  @override
  String get navFastest => 'Najrýchlejšia';

  @override
  String get navThen => 'Potom';

  @override
  String get navRecents => 'Nedávne';

  @override
  String get navClearRecents => 'Vymazať';

  @override
  String get navSearchSubmitHint =>
      'Stlačením Hľadať zobrazíte všetky zodpovedajúce miesta';

  @override
  String get navPlaces => 'Miesta';

  @override
  String get navEtaLabel => 'príchod';

  @override
  String get navTimeLeftLabel => 'zostáva';

  @override
  String get navOverview => 'Prehľad trasy';

  @override
  String get navMute => 'Stlmiť hlas';

  @override
  String get navUnmute => 'Zapnúť hlas';

  @override
  String get navEndConfirm => 'Ukončiť navigáciu?';

  @override
  String navEndConfirmBody(String place) {
    return 'Navigácia do cieľa $place sa zastaví.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Ste v cieli: $place';
  }

  @override
  String get navDone => 'Hotovo';

  @override
  String get navWeakGps => 'Slabý signál GPS';

  @override
  String get navLocationOff =>
      'Poloha je vypnutá. Zapnite ju, aby ste mohli plánovať trasy a navigovať.';

  @override
  String get navVoiceGuidance => 'Hlasová navigácia';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'O $distance $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, potom $second';
  }

  @override
  String get navSpeakRerouting => 'Prepočítavam trasu';

  @override
  String get navSpeakArrived => 'Ste v cieli';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metrov',
      many: '$count metra',
      few: '$count metre',
      one: '1 meter',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilometrov',
      many: '$value kilometra',
      few: '$value kilometre',
      one: '1 kilometer',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stôp',
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
      other: '$count yardov',
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
      'Pokyny pre túto cestu nie sú v tomto regióne dostupné. Skúste iný cieľ.';

  @override
  String navContinueFor(String distance) {
    return 'Pokračujte $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value míľ',
      many: '$value míle',
      few: '$value míle',
      one: '1 míľu',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Najbližšie: $object · $zone';
  }

  @override
  String get parkingNothing => 'V zábere nič nezistené';

  @override
  String get parkingBeeps => 'Pípanie vzdialenosti';

  @override
  String get parkingVolume => 'Hlasitosť pípania';

  @override
  String get parkingLimitations =>
      'Jediná kamera, nie 360°. Objekty mimo záberu kamery nie sú detekované. Nenahrádza parkovacie senzory; odhady môžu byť chybné a ticho neznamená, že je okolie voľné.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Pohľad zhora na vzdialenosti. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Originál';

  @override
  String get perceptionModeBoxes => 'Rámčeky';

  @override
  String get perceptionModeMasks => 'Masky objektov';

  @override
  String get perceptionModeRoad => 'Povrch vozovky';

  @override
  String get perceptionModeCombined => 'Kombinované';

  @override
  String get perceptionOpacity => 'Priehľadnosť masky';

  @override
  String get perceptionDisclaimer =>
      'Maska povrchu vozovky je približná vizuálna vrstva. Nezobrazuje priechodný priestor ani jazdné pruhy.';

  @override
  String get perceptionNeedsModel =>
      'Na zobrazenie masiek vyberte model Segmentácia.';

  @override
  String get perceptionChooseModel => 'Vybrať model';

  @override
  String get perceptionWaiting => 'Čaká sa na prvý snímok segmentácie…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Rámčeky';

  @override
  String get perceptionShortObjects => 'Objekty';

  @override
  String get perceptionShortRoad => 'Cesta';

  @override
  String get perceptionShortAll => 'Všetko';

  @override
  String get perceptionModesLabel => 'Vrstvy percepcie';

  @override
  String get perceptionStatusWarmingUp => 'Zahrieva sa…';

  @override
  String get perceptionStatusLoadingModel => 'Načítava sa model…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps sn./s';
  }

  @override
  String get perceptionStatusPaused => 'Masky pozastavené';

  @override
  String get perceptionLegend => 'Legenda masiek';

  @override
  String get perceptionUnavailable => 'Masky nie sú k dispozícii';

  @override
  String get driveSave => 'Uložiť';

  @override
  String get driveSaveIncident => 'Uložiť udalosť';

  @override
  String driveSaveHint(int seconds) {
    return 'Uloží posledných $seconds s záznamu z kamery';
  }

  @override
  String get driveSaving => 'Ukladá sa udalosť…';

  @override
  String hudRecManualLabel(String time) {
    return 'Nahrávanie, $time';
  }

  @override
  String get driveRecord => 'Nahrať';

  @override
  String get driveRecordStartA11y => 'Spustiť nahrávanie';

  @override
  String driveRecordStopA11y(String time) {
    return 'Zastaviť nahrávanie, nahrané $time';
  }

  @override
  String get driveRecordHint =>
      'Nahráva nepretržite, kým ho nezastavíte, vrátane posledných 5 sekúnd';

  @override
  String get driveRecordFailed => 'Nahrávanie sa nepodarilo spustiť';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Záznam uložený · $count častí',
      many: 'Záznam uložený · $count časti',
      few: 'Záznam uložený · $count časti',
      one: 'Záznam uložený',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Nahrávanie zastavené: úložisko je takmer plné',
      'max_duration': 'Nahrávanie zastavené: dosiahla sa maximálna dĺžka',
      'camera_stopped': 'Nahrávanie zastavené spolu s kamerou',
      'background': 'Nahrávanie zastavené: aplikácia prešla do pozadia',
      'thermal': 'Nahrávanie zastavené: telefón je príliš horúci',
      'other': 'Nahrávanie zastavené',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Udalosť uložená · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Zobraziť';

  @override
  String get driveSaveFailed => 'Udalosť sa nepodarilo uložiť.';

  @override
  String get driveSaveNotRunning =>
      'Nahrávanie ešte nezačalo — počkajte na spustenie kamery a skúste to znova.';

  @override
  String get driveSaveTestFootage =>
      'Testovací záznam sa nenahráva. Ukladanie udalostí funguje s kamerou naživo.';

  @override
  String get driveSaveStorageFull =>
      'Vo vašom iPhone došlo úložisko. Uvoľnite miesto alebo odstráňte staršie záznamy.';

  @override
  String get driveSaveIoError => 'Záznam sa nepodarilo zapísať do úložiska.';

  @override
  String get driveClips => 'Záznamy';

  @override
  String get driveSettings => 'Nastavenia';

  @override
  String get driveViewSwitcher => 'Zobrazenia jazdy';

  @override
  String get driveLocationDenied =>
      'Poloha je vypnutá — rýchlosť, mapy a trasy nie sú dostupné.';

  @override
  String get driveCameraDenied =>
      'Prístup ku kamere je vypnutý — detekcia a nahrávanie nie sú dostupné.';

  @override
  String get driveRecorderFallback =>
      'Nahrávanie bez zvuku: prístup k mikrofónu je vypnutý.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Nastavenia nahrávania boli upravené: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Váš iPhone je horúci. AI beží pomalšie, aby vychladol — chráňte ho pred priamym slnkom a umiestnite ho k vetraniu.';

  @override
  String get drivePowerThermalCritical =>
      'Váš iPhone je príliš horúci. Detekcia AI je pozastavená, kým nevychladne; nahrávanie pokračuje, ak je to možné.';

  @override
  String get drivePowerLowPower =>
      'Je zapnutý Režim nízkej spotreby — AI beží zníženou frekvenciou.';

  @override
  String get drivePowerBatteryLow =>
      'Batéria je slabá — počas jazdy pripojte iPhone k napájaniu.';

  @override
  String get onboardingTitle1 => 'Uvidíte viac na každej ceste.';

  @override
  String get onboardingBody1 =>
      'Premeňte svoj iPhone na inteligentnú palubnú kameru a spoločníka na vnímanie situácie počas jazdy.';

  @override
  String get onboardingTitle2 => 'Inteligencia v každom zábere.';

  @override
  String get onboardingBody2 =>
      'Rozpoznávajte podporované vozidlá, osoby, bicykle a dopravné signály priamo vo svojom iPhone.';

  @override
  String get onboardingTitle3 => 'Jedna cesta. Viac pohľadov.';

  @override
  String get onboardingBody3 =>
      'Prepínajte medzi detekciou naživo, virtuálnymi pohľadmi na jazdu, interaktívnymi mapami a vizualizáciou parkovania.';

  @override
  String get onboardingTitle4 => 'Uchovajte dôležité okamihy.';

  @override
  String get onboardingBody4 =>
      'Ukladajte nedávne záznamy z kamery, prezerajte udalosti a zdieľajte nahrávky.';

  @override
  String get onboardingTitle5 => 'Bezpečnosť a súkromie';

  @override
  String get onboardingSafety1 =>
      'Corvista je pomôcka na vnímanie situácie počas jazdy. Majte oči na ceste.';

  @override
  String get onboardingSafety2 =>
      'Neovláda vaše vozidlo ani nenahrádza váš úsudok.';

  @override
  String get onboardingSafety3 =>
      'Detekcie a odhady môžu byť nepresné alebo chýbať.';

  @override
  String get onboardingSafety4 =>
      'Obraz z kamery sa spracúva vo vašom iPhone — video sa nenahráva.';

  @override
  String get onboardingSafety5 =>
      'Mapy, vyhľadávanie, trasy a počasie vyžadujú pripojenie na internet.';

  @override
  String get onboardingSafety6 =>
      'Upevnite iPhone bezpečne tak, aby nezakrýval výhľad.';

  @override
  String get onboardingSafety7 => 'Dokončite nastavenie pred začatím jazdy.';

  @override
  String get onboardingAcknowledge =>
      'Rozumiem, že Corvista je iba pomôcka na vnímanie situácie a že za bezpečnú jazdu zodpovedám ja.';

  @override
  String get onboardingReadSafety => 'Prečítať úplné bezpečnostné informácie';

  @override
  String get onboardingNext => 'Ďalej';

  @override
  String get onboardingSkip => 'Preskočiť';

  @override
  String get onboardingAgree => 'Pokračovať';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Strana $current z $total';
  }

  @override
  String get permTitle => 'Oprávnenia';

  @override
  String get permIntro =>
      'Corvista žiada len o to, čo každá funkcia potrebuje. Môžete to kedykoľvek zmeniť v Nastaveniach.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Vyžaduje sa na detekciu, nahrávanie a zobrazenie parkovania. Video sa spracúva vo vašom iPhone.';

  @override
  String get permLocationTitle => 'Poloha';

  @override
  String get permLocationBody =>
      'Používa sa na rýchlosť GPS, mapu, trasy, počasie a označenie uložených záznamov. Iba pri používaní aplikácie.';

  @override
  String get permMicTitle => 'Mikrofón';

  @override
  String get permSpeechNote =>
      'Rozpoznávanie reči sa vyžaduje, len ak zapnete zrušenie hlasom pri tiesňových upozorneniach.';

  @override
  String get permRequired => 'Vyžaduje sa';

  @override
  String get permOptional => 'Voliteľné';

  @override
  String get permAllow => 'Povoliť';

  @override
  String get permGranted => 'Povolené';

  @override
  String get permDenied => 'Zamietnuté';

  @override
  String get permLimited => 'Obmedzené';

  @override
  String get permRestricted => 'Obmedzené systémom';

  @override
  String get permStart => 'Začať jazdu';

  @override
  String get permCameraNeeded =>
      'Môžete pokračovať bez prístupu ku kamere, ale detekcia a nahrávanie nebudú fungovať, kým ich nepovolíte v Nastaveniach.';

  @override
  String get permSetupIntro =>
      'Corvista potrebuje tieto oprávnenia na plnú funkčnosť. Klepnite na Povoliť všetko a iOS sa vás postupne opýta na každé z nich. Môžete ich kedykoľvek zmeniť v Nastaveniach.';

  @override
  String get permCameraLine =>
      'Vyžaduje sa na detekciu, nahrávanie a zobrazenie parkovania. Video sa spracúva vo vašom iPhone a nikdy sa nenahráva.';

  @override
  String get permLocationLine =>
      'Rýchlosť GPS, mapa, trasy, počasie a miesto uloženia záznamov. Iba pri používaní aplikácie.';

  @override
  String get permMicLine =>
      'Zvuk z kabíny v záznamoch udalostí a rozpoznanie frázy na zrušenie počas tiesňového upozornenia.';

  @override
  String get permSpeechTitle => 'Rozpoznávanie reči';

  @override
  String get permSpeechLine =>
      'Rozpozná frázu na zrušenie počas tiesňového odpočtu, vo vašom iPhone tam, kde je to podporované.';

  @override
  String get permAllowAll => 'Povoliť všetko';

  @override
  String permAsking(String permission) {
    return 'Žiadosť o oprávnenie: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Niektoré oprávnenia sú vypnuté. Zapnite ich v Nastaveniach, aby ste mohli tieto funkcie používať.';

  @override
  String get permNotNow => 'Teraz nie';

  @override
  String get tourLabel => 'Prehliadka obrazovky jazdy';

  @override
  String tourProgress(int current, int total) {
    return 'Krok $current z $total';
  }

  @override
  String get tourNext => 'Ďalej';

  @override
  String get tourBack => 'Späť';

  @override
  String get tourSkip => 'Preskočiť prehliadku';

  @override
  String get tourFinish => 'Začať jazdu';

  @override
  String get tourWelcomeTitle => 'Rýchla prehliadka';

  @override
  String get tourWelcomeBody =>
      'Minútový prehľad toho najdôležitejšieho na obrazovke jazdy. Najlepšie na stojacom vozidle.';

  @override
  String get tourHudTitle => 'Pruh ukazovateľov';

  @override
  String get tourHudSpeed => 'Rýchlosť pochádza z GPS.';

  @override
  String get tourHudRec =>
      'REC ukazuje, koľko sekúnd záznamu je vo vyrovnávacej pamäti.';

  @override
  String get tourHudAi =>
      'Štítok AI ukazuje model, počet videných objektov a bodku: zelená — beží, oranžová — obmedzene, červená — zastavené.';

  @override
  String get tourSaveTitle => 'Uložiť udalosť';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista uchováva priebežnú vyrovnávaciu pamäť posledných $seconds s videa. Neustále sa prepisuje, takže sa nič neuchová, kým neklepnete na Uložiť. Uložené záznamy zostávajú v tomto iPhone, v Záznamoch.';
  }

  @override
  String get tourRecordTitle => 'Nahrajte celú jazdu';

  @override
  String get tourRecordBody =>
      'Klepnutím na Nahrať budete nahrávať nepretržite, kým nezastavíte. Dlhé jazdy sa ukladajú do Záznamov po 5-minútových častiach a Uložiť udalosť funguje aj počas nahrávania.';

  @override
  String get tourViewsTitle => 'Päť pohľadov na cestu';

  @override
  String get tourViewDetection =>
      'Kamera naživo s rámčekmi okolo podporovaných objektov.';

  @override
  String get tourViewVirtual => 'Zjednodušená 3D scéna zostavená z detekcií.';

  @override
  String get tourViewMap =>
      'Apple Maps s vyhľadávaním a navigáciou krok za krokom.';

  @override
  String get tourViewParking => 'Kamera plus pohľad zhora na vzdialenosti.';

  @override
  String get tourViewPerception => 'Masky cesty a objektov.';

  @override
  String get tourMapTitle => 'Vyhľadávanie a navigácia';

  @override
  String get tourMapBody =>
      'Otvorte Mapu, klepnite na vyhľadávacie pole a vyberte cieľ. Zvoľte trasu a klepnutím na Štart spustite navigáciu krok za krokom. Vyžaduje pripojenie na internet.';

  @override
  String get tourClipsTitle => 'Záznamy';

  @override
  String get tourClipsBody =>
      'Prezerajte, premenúvajte, zdieľajte alebo odstraňujte uložené udalosti. Záznamy zostávajú vo vašom iPhone, ak ich nezdieľate.';

  @override
  String get tourSettingsTitle => 'Nastavenia';

  @override
  String get tourSettingsBody =>
      'Upravte hlasové upozornenia a ich citlivosť, kvalitu nahrávania a dĺžku vyrovnávacej pamäte a nastavte Tiesňový režim: experimentálne upozornenie na náraz s odpočtom na zrušenie.';

  @override
  String get tourSafetyTitle => 'Pred jazdou';

  @override
  String get tourSafety1 =>
      'Upevnite iPhone bezpečne tak, aby nezakrýval výhľad.';

  @override
  String get tourSafety2 =>
      'Neovládajte aplikáciu počas jazdy. Všetko nastavte na stojacom vozidle.';

  @override
  String get tourSafety3 =>
      'Detekcie a zóny sú odhady. Môžu byť chybné alebo chýbať.';

  @override
  String get tourSafety4 => 'Za bezpečnú jazdu stále zodpovedáte vy.';

  @override
  String get helpTakeTour => 'Spustiť prehliadku';

  @override
  String get helpTakeTourSub => 'Minútová prehliadka obrazovky jazdy.';

  @override
  String get tripsTitle => 'Jazdy';

  @override
  String get tripsOpen => 'Denník jázd';

  @override
  String get tripsEmptyTitle => 'Zatiaľ žiadne jazdy';

  @override
  String get tripsEmptyBody =>
      'Jazdy sa zaznamenávajú automaticky, keď idete s Corvista — vzdialenosť, čas, rýchlosť a trasa, ktorou ste išli.';

  @override
  String get tripsDisabledBody =>
      'Denník jázd je vypnutý, takže nové jazdy sa nezaznamenávajú. Zapnite ho, aby ste vo svojom iPhone viedli súkromný záznam svojich trás.';

  @override
  String get tripsEnable => 'Zapnúť denník jázd';

  @override
  String get tripsToday => 'Dnes';

  @override
  String get tripsYesterday => 'Včera';

  @override
  String tripsRecordingNow(String distance) {
    return 'Zaznamenáva sa jazda · $distance';
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
      other: '$count udalostí',
      many: '$count udalosti',
      few: '$count udalosti',
      one: '1 udalosť',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count upozornení',
      many: '$count upozornenia',
      few: '$count upozornenia',
      one: '1 upozornenie',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jázd',
      many: '$count jazdy',
      few: '$count jazdy',
      one: '1 jazda',
      zero: 'Žiadne jazdy',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Vzdialenosť';

  @override
  String get tripsStatDuration => 'Dĺžka';

  @override
  String get tripsStatMoving => 'Čas jazdy';

  @override
  String get tripsStatAvgSpeed => 'Priem. rýchlosť';

  @override
  String get tripsStatMaxSpeed => 'Max. rýchlosť';

  @override
  String get tripsDetections => 'Detekcie';

  @override
  String get tripsNoDetections =>
      'Počas tejto jazdy sa nezaznamenali žiadne objekty na ceste.';

  @override
  String get tripsTimeline => 'Časová os';

  @override
  String get tripsEventStart => 'Jazda začala';

  @override
  String get tripsEventEnd => 'Jazda skončila';

  @override
  String get tripsEventAlert => 'Hlasové upozornenie';

  @override
  String get tripsEventIncident => 'Záznam udalosti uložený';

  @override
  String get tripsEventEmergency => 'Zaznamenaná možná nehoda';

  @override
  String get tripsEventNavStart => 'Navigácia spustená';

  @override
  String get tripsEventArrive => 'Príchod do cieľa';

  @override
  String get tripsEventReroute => 'Trasa prepočítaná';

  @override
  String get tripsEventRecording => 'Záznam uložený';

  @override
  String get tripsOpenClip => 'Otvoriť záznam';

  @override
  String get tripsTrackPreview => 'Stopa GPS';

  @override
  String get tripsRenameTitle => 'Premenovať jazdu';

  @override
  String get tripsRenameHint => 'Názov jazdy';

  @override
  String get tripsFavorite => 'Pridať do obľúbených';

  @override
  String get tripsUnfavorite => 'Odstrániť z obľúbených';

  @override
  String get tripsShareGpx => 'Zdieľať GPX';

  @override
  String get tripsShareFailed => 'Túto jazdu sa nepodarilo zdieľať.';

  @override
  String get tripsDelete => 'Odstrániť jazdu';

  @override
  String get tripsDeleteConfirmTitle => 'Odstrániť túto jazdu?';

  @override
  String get tripsDeleteConfirmBody =>
      'Trasa a štatistiky sa odstránia z tohto iPhonu. Záznamy udalostí z tejto jazdy zostanú zachované.';

  @override
  String get tripsDeleted => 'Jazda odstránená';

  @override
  String get tripsNotFound => 'Táto jazda už nie je dostupná.';

  @override
  String get tripsPrivacyNote =>
      'Uložené iba v tomto iPhone. Nič sa nenahráva.';

  @override
  String get settingsSectionTrips => 'Denník jázd';

  @override
  String get settingsTripLog => 'Zaznamenávať jazdy';

  @override
  String get settingsTripLogSubtitle =>
      'Uchováva trasu a štatistiky jázd iba v tomto iPhone.';

  @override
  String get settingsTripRetention => 'Uchovávať jazdy po dobu';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dní',
      many: '$days dňa',
      few: '$days dni',
      one: '1 deň',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 rok';

  @override
  String get settingsRetentionForever => 'Navždy';

  @override
  String get settingsTripRetentionFooter =>
      'Staršie jazdy sa automaticky odstránia pri spustení Corvista.';

  @override
  String get settingsViewTrips => 'Zobraziť jazdy';

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
    return 'Jazda Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Uvoľniť miesto';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Odstráni dočasné súbory a vyrovnávacie pamäte. Uložené záznamy a jazdy zostanú zachované.';

  @override
  String settingsFreedBytes(String size) {
    return 'Uvoľnené $size';
  }

  @override
  String get settingsNothingToFree =>
      'Vyrovnávacie pamäte vymazané — žiadne dočasné súbory na odstránenie.';

  @override
  String get settingsSectionPrivacyData => 'Súkromie a dáta';

  @override
  String get settingsPrivacyDataFooter =>
      'Záznamy, jazdy a nastavenia sú uložené iba v tomto iPhone. Opustia ho len vtedy, keď sa rozhodnete ich zdieľať.';

  @override
  String get settingsDeleteAllData => 'Odstrániť všetky dáta';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Vymazať záznamy, jazdy, kontakty a nastavenia z tohto iPhonu';

  @override
  String get deleteAllTitle => 'Odstrániť všetky dáta?';

  @override
  String get deleteAllMessage =>
      'Z tohto iPhonu sa natrvalo odstráni:\n• Záznamy udalostí a miniatúry\n• Denník jázd a stopy GPS\n• Tiesňové kontakty a tiesňové udalosti\n• Protokoly detekcie a diagnostický protokol\n• Nastavenia a nedávne ciele\n• Dočasná vyrovnávacia pamäť nahrávania a medzipamäť\n\nTúto akciu nie je možné vrátiť späť. Corvista potom začne odznova od uvítacích obrazoviek.';

  @override
  String get deleteAllConfirm => 'Odstrániť všetko';

  @override
  String get deleteAllInProgress => 'Odstraňuje sa…';

  @override
  String get deleteAllDone => 'Všetky dáta boli odstránené';

  @override
  String get deleteAllPartial =>
      'Niektoré položky sa nepodarilo odstrániť. Skúste to znova v Nastaveniach.';

  @override
  String get diagLogSection => 'Diagnostický protokol';

  @override
  String get diagLogFooter =>
      'Chyby sa zaznamenávajú iba v tomto iPhone, bez polôh, mien kontaktov a telefónnych čísel. Nič sa neodosiela, kým protokol sami nezdieľate.';

  @override
  String get diagLogShare => 'Zdieľať diagnostický protokol';

  @override
  String get diagLogEmpty => 'Prázdny';

  @override
  String get diagLogClear => 'Vymazať protokol';

  @override
  String get diagLogClearTitle => 'Vymazať diagnostický protokol?';

  @override
  String get diagLogClearBody =>
      'Uložené záznamy o chybách sa z tohto iPhonu odstránia.';

  @override
  String get diagLogCleared => 'Diagnostický protokol bol vymazaný';

  @override
  String get diagLogShareFailed =>
      'Diagnostický protokol sa nepodarilo zdieľať.';

  @override
  String get privacyControls2 =>
      'Nastavenia › Súkromie a dáta › Odstrániť všetky dáta vymaže všetky záznamy, jazdy, kontakty, protokoly a nastavenia, ktoré Corvista uchováva v tomto iPhone.';

  @override
  String get parkingZoneStop => 'Stop';

  @override
  String get parkingZoneVeryClose => 'Veľmi blízko';

  @override
  String get parkingZoneClose => 'Blízko';

  @override
  String get parkingZoneNothingClose => 'Nič blízke nevidím';

  @override
  String get parkingNotDetected =>
      'Steny, stĺpy, tyče a obrubníky sa nerozpoznávajú';

  @override
  String get parkingApprox => 'cca';

  @override
  String get parkingSideLeft => 'Vľavo';

  @override
  String get parkingSideCenter => 'Stred';

  @override
  String get parkingSideRight => 'Vpravo';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Iba pohľad z prednej kamery — nejde o systém 360°';

  @override
  String get parkingMuteBeeps => 'Stlmiť pípanie';

  @override
  String get parkingUnmuteBeeps => 'Zapnúť pípanie';

  @override
  String get parkingAbout => 'O zobrazení parkovania';

  @override
  String get parkingLimitationsDetail =>
      'Sleduje sa iba priestor pred kamerou. Detektor rozpoznáva osobné autá, autobusy a nákladné autá, ľudí, bicykle a motocykle. Steny, stĺpy, tyče, obrubníky, stĺpiky, závory a nízke prekážky sa NErozpoznávajú a kapota môže zakrývať zem tesne pred vozidlom. Vzdialenosti sú hrubé odhady z jednej kamery (podľa veľkosti a polohy objektu) a môžu sa veľmi líšiť. Ticho alebo hlásenie „Nič blízke nevidím“ neznamená, že je cesta voľná — vždy sa obzrite a používajte zrkadlá.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Blízkosť podľa strán: vľavo $left, stred $center, vpravo $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Chyby sa zapisujú do súkromného protokolu v tomto iPhone (bez polôh, mien kontaktov a telefónnych čísel). Nikdy sa neodosiela automaticky; v Nastavenia › Diagnostika ho môžete zdieľať alebo vymazať.';
}
