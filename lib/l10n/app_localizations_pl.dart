// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Zobacz więcej w każdej podróży.';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonDelete => 'Usuń';

  @override
  String get commonSave => 'Zapisz';

  @override
  String get commonBack => 'Wstecz';

  @override
  String get commonClose => 'Zamknij';

  @override
  String get commonRetry => 'Spróbuj ponownie';

  @override
  String get commonOpenSettings => 'Otwórz Ustawienia';

  @override
  String get commonLoading => 'Ładowanie…';

  @override
  String get commonError => 'Coś poszło nie tak.';

  @override
  String commonErrorDetail(String message) {
    return 'Coś poszło nie tak: $message';
  }

  @override
  String get commonOn => 'Wł.';

  @override
  String get commonOff => 'Wył.';

  @override
  String get commonRename => 'Zmień nazwę';

  @override
  String get commonShare => 'Udostępnij';

  @override
  String get commonNotAvailable => 'Niedostępne';

  @override
  String get commonTestFootage => 'MATERIAŁ TESTOWY';

  @override
  String get zoneVeryClose => 'Bardzo blisko';

  @override
  String get zoneClose => 'Blisko';

  @override
  String get zoneMedium => 'Średnio';

  @override
  String get zoneFar => 'Daleko';

  @override
  String get zoneUnknown => 'Nieznana';

  @override
  String get classPerson => 'Osoba';

  @override
  String get classBicycle => 'Rower';

  @override
  String get classMotorcycle => 'Motocykl';

  @override
  String get classCar => 'Pojazd';

  @override
  String get classBus => 'Autobus';

  @override
  String get classTrafficLight => 'Sygnalizator';

  @override
  String get classStopSign => 'Znak STOP';

  @override
  String get viewDetection => 'Detekcja';

  @override
  String get viewVirtual => 'Wirtualny';

  @override
  String get viewMap => 'Mapa';

  @override
  String get viewParking => 'Parkowanie';

  @override
  String get viewPerception => 'Percepcja';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Czerwone';

  @override
  String get lightYellow => 'Żółte';

  @override
  String get lightGreen => 'Zielone';

  @override
  String get lightUnknown => 'Nieznane';

  @override
  String get clipsTitle => 'Nagrania';

  @override
  String get clipsSelect => 'Wybierz';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wybrano $count',
      many: 'Wybrano $count',
      few: 'Wybrano $count',
      one: 'Wybrano 1',
      zero: 'Wybierz nagrania',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Zaznacz wszystko';

  @override
  String get clipsDeselectAll => 'Odznacz wszystko';

  @override
  String get clipsDeleteSelected => 'Usuń zaznaczone';

  @override
  String get clipsGridView => 'Widok siatki';

  @override
  String get clipsListView => 'Widok listy';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunąć $count nagrania?',
      many: 'Usunąć $count nagrań?',
      few: 'Usunąć $count nagrania?',
      one: 'Usunąć to nagranie?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Te filmy zostaną trwale usunięte z Twojego iPhone’a. Tej operacji nie można cofnąć.',
      many: 'Te filmy zostaną trwale usunięte z Twojego iPhone’a. Tej operacji nie można cofnąć.',
      few: 'Te filmy zostaną trwale usunięte z Twojego iPhone’a. Tej operacji nie można cofnąć.',
      one: 'Film zostanie trwale usunięty z Twojego iPhone’a. Tej operacji nie można cofnąć.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunięto $count nagrania',
      many: 'Usunięto $count nagrań',
      few: 'Usunięto $count nagrania',
      one: 'Usunięto nagranie',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Brak nagrań';

  @override
  String get clipsEmptyBody =>
      'Podczas jazdy Corvista przechowuje krótki bufor ciągły. Stuknij Zapisz zdarzenie, aby zachować tutaj ostatnie sekundy nagrania.';

  @override
  String get clipsLoadError => 'Nie udało się wczytać nagrań.';

  @override
  String get clipsStorageTitle => 'Pamięć';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Nagrania $clips · Bufor $buffer · wolne $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zapisanego nagrania',
      many: '$count zapisanych nagrań',
      few: '$count zapisane nagrania',
      one: '1 zapisane nagranie',
      zero: 'Brak zapisanych nagrań',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Na Twoim iPhonie kończy się miejsce. Nowe zdarzenia mogą się nie zapisać.';

  @override
  String get clipsMissingFile => 'Brak pliku';

  @override
  String get clipsEmergencyBadge => 'Uderzenie';

  @override
  String clipsUntitled(String date) {
    return 'Zdarzenie · $date';
  }

  @override
  String get clipsAudio => 'Nagrano dźwięk';

  @override
  String get clipsFavorite => 'Ulubione';

  @override
  String get clipsUnfavorite => 'Usuń z ulubionych';

  @override
  String get clipsLocation => 'Zapisano lokalizację';

  @override
  String clipsOpenClip(String title) {
    return 'Otwórz nagranie $title';
  }

  @override
  String get playerNotFoundTitle => 'Nie znaleziono nagrania';

  @override
  String get playerNotFoundBody => 'To nagranie mogło zostać usunięte.';

  @override
  String get playerMissingTitle => 'Brak pliku wideo';

  @override
  String get playerMissingBody =>
      'Zapisu tego nagrania nie ma już na Twoim iPhonie. Możesz usunąć wpis z galerii.';

  @override
  String get playerRemoveEntry => 'Usuń wpis';

  @override
  String get playerLoadError => 'Nie można odtworzyć tego filmu.';

  @override
  String get playerPlay => 'Odtwórz';

  @override
  String get playerPause => 'Wstrzymaj';

  @override
  String get playerReplay => 'Odtwórz ponownie';

  @override
  String get playerRenameTitle => 'Zmień nazwę nagrania';

  @override
  String get playerRenameHint => 'Nazwa nagrania';

  @override
  String get playerRenamed => 'Zmieniono nazwę nagrania';

  @override
  String get playerFavorited => 'Dodano do ulubionych';

  @override
  String get playerUnfavorited => 'Usunięto z ulubionych';

  @override
  String get playerShareFailed => 'Nie udało się udostępnić tego nagrania.';

  @override
  String get playerDetails => 'Szczegóły';

  @override
  String get playerDate => 'Nagrano';

  @override
  String get playerDuration => 'Czas trwania';

  @override
  String get playerResolution => 'Rozdzielczość';

  @override
  String get playerSize => 'Rozmiar pliku';

  @override
  String get playerAudio => 'Dźwięk';

  @override
  String get playerAudioYes => 'Nagrany';

  @override
  String get playerAudioNo => 'Nienagrany';

  @override
  String get playerReason => 'Zapisano przez';

  @override
  String get playerReasonManual => 'Przycisk Zapisz zdarzenie';

  @override
  String get playerReasonEmergency => 'Wykrycie możliwego uderzenia';

  @override
  String get playerReasonRecovered => 'Odzyskano po przerwaniu';

  @override
  String get playerSpeed => 'Prędkość GPS w chwili zapisu';

  @override
  String get playerLocation => 'Lokalizacja';

  @override
  String get playerOpenInMaps => 'Otwórz w Mapach';

  @override
  String get playerBack => 'Wstecz';

  @override
  String get playerMore => 'Więcej działań';

  @override
  String get clipsFilterLabel => 'Pokaż';

  @override
  String get clipsFilterAll => 'Wszystkie';

  @override
  String get clipsFilterRecordings => 'Ręczne';

  @override
  String get clipsFilterIncidents => 'Zdarzenia';

  @override
  String get clipsFilterEmergency => 'Awaryjne';

  @override
  String get clipsFilterFavorites => 'Ulubione';

  @override
  String get clipsSort => 'Sortuj';

  @override
  String get clipsSortNewest => 'Od najnowszych';

  @override
  String get clipsSortOldest => 'Od najstarszych';

  @override
  String get clipsSortLongest => 'Od najdłuższych';

  @override
  String get clipsSortLargest => 'Od największych';

  @override
  String get clipsToday => 'Dzisiaj';

  @override
  String get clipsYesterday => 'Wczoraj';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nagrania',
      many: '$count nagrań',
      few: '$count nagrania',
      one: '$count nagranie',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'W tej kategorii nie ma jeszcze nagrań.';

  @override
  String get clipsFavoritesEmpty =>
      'Oznacz nagranie gwiazdką, aby mieć je tutaj pod ręką.';

  @override
  String get clipsKindRecording => 'Nagranie ręczne';

  @override
  String get clipsKindIncident => 'Zdarzenie';

  @override
  String get clipsKindEmergency => 'Awaryjne';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Przejazd · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Otwórz przejazd, podczas którego zapisano to nagranie';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return 'Zajęte: $used · wolne: $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Nagrania zajmują $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nagrania ręcznego',
      many: '$count nagrań ręcznych',
      few: '$count nagrania ręczne',
      one: '$count nagranie ręczne',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zdarzenia',
      many: '$count zdarzeń',
      few: '$count zdarzenia',
      one: '$count zdarzenie',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count awaryjnego',
      many: '$count awaryjnych',
      few: '$count awaryjne',
      one: '$count awaryjne',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Zwolnij miejsce';

  @override
  String get clipsStorageLowGentle =>
      'Wolne mniej niż 2 GB. Aby nagrywanie działało płynnie, zwolnij miejsce lub usuń niepotrzebne nagrania.';

  @override
  String get clipsSaveToPhotos => 'Zapisz w Zdjęciach';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nagrania',
      many: '$count nagrań',
      few: '$count nagrania',
      one: '$count nagranie',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunąć $count nagrania ($size)?',
      many: 'Usunąć $count nagrań ($size)?',
      few: 'Usunąć $count nagrania ($size)?',
      one: 'Usunąć to nagranie ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Zapisywanie w Zdjęciach: $done z $total…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zapisano w Zdjęciach: $count nagrania',
      many: 'Zapisano w Zdjęciach: $count nagrań',
      few: 'Zapisano w Zdjęciach: $count nagrania',
      one: 'Zapisano w Zdjęciach',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return 'Zapisano w Zdjęciach: $saved · nie udało się zapisać: $failed';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista nie ma zgody na dodawanie filmów do Zdjęć. Możesz ją przyznać w Ustawieniach.';

  @override
  String get clipsPhotosFailed => 'Nie udało się zapisać w Zdjęciach.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dodano do ulubionych: $count nagrania',
      many: 'Dodano do ulubionych: $count nagrań',
      few: 'Dodano do ulubionych: $count nagrania',
      one: 'Dodano do ulubionych',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunięto z ulubionych: $count nagrania',
      many: 'Usunięto z ulubionych: $count nagrań',
      few: 'Usunięto z ulubionych: $count nagrania',
      one: 'Usunięto z ulubionych',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (przycięte)';
  }

  @override
  String get playerTrim => 'Przytnij';

  @override
  String get playerInfo => 'Informacje';

  @override
  String get playerKind => 'Typ';

  @override
  String get playerReasonRecording => 'Przycisk nagrywania';

  @override
  String get trimTitle => 'Przytnij nagranie';

  @override
  String get trimHint =>
      'Przeciągnij uchwyty, aby wybrać część do zachowania. Oryginalne nagranie pozostanie bez zmian.';

  @override
  String get trimStartHandle => 'Początek przycięcia';

  @override
  String get trimEndHandle => 'Koniec przycięcia';

  @override
  String trimSelection(String duration) {
    return 'Wybrano: $duration';
  }

  @override
  String get trimSave => 'Zapisz jako nowe nagranie';

  @override
  String get trimSaving => 'Zapisywanie przyciętego nagrania…';

  @override
  String get trimSaved => 'Zapisano przycięte nagranie';

  @override
  String get trimOpenNew => 'Otwórz';

  @override
  String get trimFailed => 'Nie udało się przyciąć tego nagrania.';

  @override
  String get trimStorageFull =>
      'Za mało wolnego miejsca, aby zapisać przycięte nagranie.';

  @override
  String get trimPreview => 'Odtwórz zaznaczenie';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Alerty';

  @override
  String get settingsSectionAlertCategories => 'Kategorie alertów';

  @override
  String get settingsSectionRecording => 'Nagrywanie';

  @override
  String get settingsSectionDriving => 'Jazda';

  @override
  String get settingsSectionPower => 'Zasilanie';

  @override
  String get settingsSectionEmergency => 'Awaryjne';

  @override
  String get settingsSectionAppearance => 'Wygląd';

  @override
  String get settingsSectionLanguage => 'Język';

  @override
  String get settingsSectionInformation => 'Informacje';

  @override
  String get settingsCameraLens => 'Obiektyw';

  @override
  String get settingsLensWide => 'Szerokokątny';

  @override
  String get settingsLensUltraWide => 'Ultraszerokokątny';

  @override
  String get settingsLensTelephoto => 'Teleobiektyw';

  @override
  String get settingsLensUnavailable => 'Niedostępny w tym iPhonie';

  @override
  String get settingsStabilization => 'Stabilizacja';

  @override
  String get settingsStabAuto => 'Automatyczna';

  @override
  String get settingsStabOff => 'Wył.';

  @override
  String get settingsStabStandard => 'Standardowa';

  @override
  String get settingsStabCinematic => 'Filmowa';

  @override
  String get settingsOverlayOpacity => 'Przezroczystość nakładki';

  @override
  String get settingsShowFps => 'Pokaż statystyki wydajności';

  @override
  String get settingsShowFpsSubtitle =>
      'Liczba klatek i czas inferencji w widoku detekcji';

  @override
  String get settingsCameraFooter =>
      'Zmiany obiektywu i stabilizacji zostaną zastosowane przy następnym uruchomieniu kamery.';

  @override
  String get settingsAiModel => 'Model AI';

  @override
  String get settingsConfidence => 'Pewność detekcji';

  @override
  String get settingsTracking => 'Śledzenie obiektów';

  @override
  String get settingsTrackingSubtitle => 'Stabilizuje obiekty między klatkami';

  @override
  String get settingsShowLabels => 'Pokaż etykiety';

  @override
  String get settingsShowConfidence => 'Pokaż pewność';

  @override
  String get settingsSegmentationOpacity => 'Przezroczystość maski percepcji';

  @override
  String get settingsAiFooter =>
      'Niższa pewność pokazuje więcej obiektów, ale też więcej fałszywych detekcji. Detekcje mogą być niedokładne.';

  @override
  String get settingsVoiceAlerts => 'Alerty głosowe';

  @override
  String get settingsVoiceLanguage => 'Język głosu';

  @override
  String get settingsVoiceLanguageAuto => 'Zgodny z językiem aplikacji';

  @override
  String get settingsVoice => 'Głos';

  @override
  String get settingsVoiceDefault => 'Domyślny systemowy';

  @override
  String get settingsVoiceQualityEnhanced => 'Ulepszony';

  @override
  String get settingsVoiceQualityPremium => 'Wysoka jakość';

  @override
  String get settingsNoVoices =>
      'Dla tego języka nie zainstalowano żadnego głosu. Dodaj go w Ustawieniach iOS › Dostępność › Czytanie zawartości.';

  @override
  String get settingsAlertPedestrian => 'Piesi';

  @override
  String get settingsAlertCyclist => 'Rowerzyści';

  @override
  String get settingsAlertMotorcycle => 'Motocykle';

  @override
  String get settingsAlertBus => 'Autobusy';

  @override
  String get settingsAlertVehicleClose => 'Pojazd bardzo blisko z przodu';

  @override
  String get settingsAlertTrafficLight => 'Zmiany świateł';

  @override
  String get settingsAlertTrafficMoving => 'Ruszanie ruchu z przodu';

  @override
  String get settingsAlertStopSign => 'Znaki STOP';

  @override
  String get settingsSensitivity => 'Czułość';

  @override
  String get settingsSensitivityLow => 'Niska';

  @override
  String get settingsSensitivityMedium => 'Średnia';

  @override
  String get settingsSensitivityHigh => 'Wysoka';

  @override
  String get settingsCooldown => 'Odstęp powtórzeń';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Głośność głosu';

  @override
  String get settingsQuietMode => 'Tryb cichy';

  @override
  String get settingsQuietModeSubtitle =>
      'Odczytywane są tylko najważniejsze alerty';

  @override
  String get settingsTestVoice => 'Testuj głos';

  @override
  String get settingsTestVoiceDone => 'Odtwarzanie przykładowego alertu…';

  @override
  String get settingsParkingBeeps => 'Sygnały parkowania';

  @override
  String get settingsBeepVolume => 'Głośność sygnału';

  @override
  String get settingsAlertsFooter =>
      'Alerty to tylko pomoc. Zawsze obserwuj drogę — brak sygnału nie oznacza, że droga jest wolna.';

  @override
  String get settingsRecordingProfile => 'Jakość nagrywania';

  @override
  String get settingsProfileStandard => 'Standardowa · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Bufor zdarzeń';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsManualMaxLength => 'Maks. długość nagrania ręcznego';

  @override
  String get settingsManualMaxUnlimited => 'Bez limitu';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Nagrywaj dźwięk';

  @override
  String get settingsRecordAudioSubtitle =>
      'Dodaje dźwięk z kabiny do zapisanych zdarzeń';

  @override
  String get settingsMicDenied =>
      'Dostęp do mikrofonu jest wyłączony. Zezwól na niego w Ustawieniach, aby nagrywać dźwięk.';

  @override
  String get settingsWatermark => 'Znak wodny Corvista';

  @override
  String get settingsTimestamp => 'Data i godzina na nagraniu';

  @override
  String get settingsSaveLocation => 'Zapisuj lokalizację z nagraniami';

  @override
  String get settingsStorage => 'Pamięć i nagrania';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nagrania',
      many: '$count nagrań',
      few: '$count nagrania',
      one: '1 nagranie',
      zero: 'Brak nagrań',
    );
    return '$_temp0 · zajęte $used · wolne $free';
  }

  @override
  String get settingsRecordingFooter =>
      'Bufor ciągły pozostaje na Twoim iPhonie i jest stale nadpisywany. Nic nie jest nagrywane w tle.';

  @override
  String get settingsDefaultView => 'Widok domyślny';

  @override
  String get settingsUnits => 'Jednostki';

  @override
  String get settingsShowCompass => 'Pokaż kompas';

  @override
  String get settingsHudStyle => 'Styl HUD';

  @override
  String get settingsHudCustomize => 'Dostosuj HUD';

  @override
  String get settingsDrivingSide => 'Strona ruchu';

  @override
  String get settingsDrivingSideAuto => 'Automatycznie';

  @override
  String get settingsDrivingSideRight => 'Prawostronny';

  @override
  String get settingsDrivingSideLeft => 'Lewostronny';

  @override
  String get settingsVirtualStyle => 'Styl widoku wirtualnego';

  @override
  String get settingsVirtualMinimal => 'Minimalny';

  @override
  String get settingsVirtualPerspective => 'Perspektywiczny';

  @override
  String get settingsVirtualHighContrast => 'Wysoki kontrast';

  @override
  String get settingsKeepScreenOn => 'Nie wygaszaj ekranu podczas jazdy';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Pokazuj wskazówki nawigacji na ekranie blokady i w Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Nagrywanie wstrzymane, gdy Corvista działała w tle';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Wstrzymano';

  @override
  String get liveActivityDashcamOff => 'Kamera wył.';

  @override
  String get liveActivityEnded => 'Nawigacja zakończona';

  @override
  String get liveActivityEta => 'Przyjazd';

  @override
  String get settingsAutoRecenter => 'Automatycznie wyśrodkuj mapę';

  @override
  String get settingsHudStyleClassic => 'Klasyczny';

  @override
  String get settingsHudStyleGrid => 'Siatka';

  @override
  String get settingsHudStyleMinimal => 'Minimalny';

  @override
  String get settingsHudStylePerformance => 'Sportowy';

  @override
  String get settingsHudStyleNavigation => 'Nawigacja';

  @override
  String get settingsHudStyleNight => 'Nocny';

  @override
  String get settingsHudStyleHighContrast => 'Wysoki kontrast';

  @override
  String get settingsPowerMode => 'Tryb zasilania';

  @override
  String get settingsPowerBalanced => 'Zrównoważony';

  @override
  String get settingsPowerPerformance => 'Wydajność';

  @override
  String get settingsPowerSaver => 'Oszczędzanie energii';

  @override
  String get settingsPowerFooter =>
      'Corvista automatycznie obniża częstotliwość AI i efekty wizualne, gdy iPhone się nagrzewa lub bateria jest słaba.';

  @override
  String get settingsThermal => 'Stan termiczny';

  @override
  String get settingsThermalNominal => 'Normalny';

  @override
  String get settingsThermalFair => 'Ciepły';

  @override
  String get settingsThermalSerious => 'Gorący';

  @override
  String get settingsThermalCritical => 'Krytyczny';

  @override
  String get settingsBattery => 'Bateria';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Ładowanie';
  }

  @override
  String get settingsLowPowerMode =>
      'Tryb niskiego zużycia energii jest włączony — AI działa wolniej.';

  @override
  String get settingsAiRate => 'Bieżąca częstotliwość AI';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Wykrywanie uderzenia';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Wł. · odliczanie $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Funkcja eksperymentalna. Nie zastępuje służb ratunkowych.';

  @override
  String get settingsTheme => 'Motyw';

  @override
  String get settingsThemeSystem => 'Systemowy';

  @override
  String get settingsThemeDark => 'Ciemny';

  @override
  String get settingsThemeLight => 'Jasny';

  @override
  String get settingsReduceMotion => 'Ogranicz animacje';

  @override
  String get settingsReduceMotionSubtitle =>
      'Zmniejsza liczbę animacji w całej aplikacji';

  @override
  String get settingsAppLanguage => 'Język aplikacji';

  @override
  String get settingsPrivacyPolicy => 'Polityka prywatności';

  @override
  String get settingsTerms => 'Warunki korzystania';

  @override
  String get settingsHelp => 'Pomoc';

  @override
  String get settingsSupport => 'Skontaktuj się z pomocą';

  @override
  String get settingsLicenses => 'Licencje open source';

  @override
  String get settingsSupportUnavailable =>
      'Nie udało się otworzyć Poczty. Napisz na adres support@corvista.app.';

  @override
  String get settingsSafety => 'Informacje o bezpieczeństwie';

  @override
  String get settingsDiagnostics => 'Diagnostyka';

  @override
  String get settingsVersion => 'Wersja';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Dostosuj HUD';

  @override
  String get hudCustomPreview => 'Podgląd · wartości przykładowe';

  @override
  String get hudCustomStyle => 'Styl';

  @override
  String get hudCustomElements => 'Elementy';

  @override
  String get hudCustomSpeed => 'Prędkość';

  @override
  String get hudCustomHeading => 'Kierunek i kompas';

  @override
  String get hudCustomClock => 'Zegar';

  @override
  String get hudCustomBattery => 'Bateria i temperatura';

  @override
  String get hudCustomDetections => 'Stan AI i detekcje';

  @override
  String get hudCustomWeather => 'Pogoda';

  @override
  String get hudCustomAppearance => 'Rozmiar i przezroczystość';

  @override
  String get hudCustomSize => 'Rozmiar';

  @override
  String get hudCustomOpacity => 'Przezroczystość';

  @override
  String get hudCustomFooter =>
      'Ostrzeżenia, np. o przegrzaniu, są zawsze widoczne, nawet gdy elementy są ukryte.';

  @override
  String get hudCustomDescClassic => 'Zrównoważony zestaw wskaźników';

  @override
  String get hudCustomDescGrid => 'Siatka perspektywiczna nad drogą';

  @override
  String get hudCustomDescMinimal => 'Tylko prędkość, nic więcej';

  @override
  String get hudCustomDescPerformance => 'Łuk prędkości z odczytami na żywo';

  @override
  String get hudCustomDescNavigation => 'Najpierw następny manewr';

  @override
  String get hudCustomDescNight =>
      'Przyciemniony, z czerwonym odcieniem do jazdy nocą';

  @override
  String get hudCustomDescHighContrast =>
      'Maksymalna czytelność w jasnym słońcu';

  @override
  String get languageTitle => 'Język';

  @override
  String get languageSystem => 'Domyślny systemowy';

  @override
  String get languageSystemSubtitle => 'Używaj języka iPhone’a';

  @override
  String get languageFooter =>
      'Wkrótce więcej języków. Język alertów głosowych można ustawić osobno w sekcji Alerty.';

  @override
  String get diagTitle => 'Diagnostyka';

  @override
  String get diagPerformance => 'Wydajność';

  @override
  String get diagInference => 'Czas inferencji';

  @override
  String get diagDetectHz => 'Częstotliwość detekcji';

  @override
  String get diagCameraFps => 'Liczba klatek kamery';

  @override
  String get diagMemory => 'Pamięć';

  @override
  String get diagDropped => 'Utracone klatki';

  @override
  String get diagSegmentation => 'Czas segmentacji';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Stan';

  @override
  String get diagSource => 'Źródło';

  @override
  String get diagSourceCamera => 'Kamera na żywo';

  @override
  String get diagSourceFile => 'Testowy plik wideo';

  @override
  String get diagResolution => 'Rozmiar bufora';

  @override
  String get diagLens => 'Obiektyw';

  @override
  String get diagError => 'Ostatni błąd';

  @override
  String get diagModel => 'Model AI';

  @override
  String get diagModelLoad => 'Czas ładowania modelu';

  @override
  String get diagPower => 'Zasilanie';

  @override
  String get diagSegHz => 'Częstotliwość segmentacji';

  @override
  String get diagReduced => 'Ograniczone efekty';

  @override
  String diagMs(String value) {
    return '$value ms';
  }

  @override
  String diagFps(String value) {
    return '$value kl./s';
  }

  @override
  String diagMb(String value) {
    return '$value MB';
  }

  @override
  String get diagCamIdle => 'Bezczynna';

  @override
  String get diagCamStarting => 'Uruchamianie';

  @override
  String get diagCamRunning => 'Działa';

  @override
  String get diagCamInterrupted => 'Przerwana';

  @override
  String get diagCamStopped => 'Zatrzymana';

  @override
  String get diagCamUnavailable => 'Niedostępna';

  @override
  String get diagCamPermissionDenied => 'Brak zgody';

  @override
  String get diagCamError => 'Błąd';

  @override
  String get diagTestFootage => 'Materiał testowy';

  @override
  String get diagTestFootageBody =>
      'Uruchom rzeczywistą detekcję na urządzeniu na lokalnym pliku wideo zamiast kamery. Każdy widok oznacza go jako MATERIAŁ TESTOWY.';

  @override
  String get diagPathLabel => 'Ścieżka pliku wideo';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Użyj Documents/test_drive.mp4';

  @override
  String get diagRun => 'Uruchom materiał testowy';

  @override
  String get diagRunStarted =>
      'Uruchomiono materiał testowy. Otwórz widok jazdy, aby go zobaczyć.';

  @override
  String get diagBackToCamera => 'Wróć do kamery na żywo';

  @override
  String get diagDebugOnly =>
      'Materiał testowy jest dostępny tylko w wersjach deweloperskich.';

  @override
  String get diagFileMissing => 'Pod tą ścieżką nie ma pliku.';

  @override
  String get emergencySetupTitle => 'Wykrywanie uderzenia';

  @override
  String get emergencyExperimental => 'Eksperymentalne';

  @override
  String get emergencyIntro =>
      'Podczas jazdy Corvista może wykrywać możliwe poważne uderzenie za pomocą czujników ruchu w Twoim iPhonie. Po jego wykryciu rozpoczyna się odliczanie. Jeśli go nie anulujesz, Corvista zaproponuje połączenie ze służbami ratunkowymi i wysłanie wiadomości do Twoich kontaktów.';

  @override
  String get emergencyDisclaimer1 =>
      'Nie zastępuje służb ratunkowych ani własnego systemu wykrywania kolizji w pojeździe.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS zawsze prosi o potwierdzenie przed wykonaniem połączenia lub wysłaniem wiadomości.';

  @override
  String get emergencyDisclaimer3 =>
      'Uderzenia mogą zostać pominięte, a gwałtowne hamowanie lub wyboje mogą zostać z nimi pomylone.';

  @override
  String get emergencyParkedWarning =>
      'Skonfiguruj tę funkcję podczas postoju. Ustawienia są zablokowane, gdy pojazd się porusza.';

  @override
  String get emergencyEnable => 'Włącz wykrywanie uderzenia';

  @override
  String get emergencyEnableSubtitle => 'Aktywne tylko podczas jazdy';

  @override
  String get emergencyNeedNumber => 'Najpierw dodaj numer alarmowy.';

  @override
  String get emergencyContacts => 'Kontakty alarmowe';

  @override
  String get emergencyAddContact => 'Dodaj kontakt';

  @override
  String get emergencyNoContacts =>
      'Brak kontaktów. Kontakty otrzymają wiadomość dopiero po Twoim potwierdzeniu.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Usunąć kontakt $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Nie będzie on proponowany jako odbiorca po uderzeniu.';

  @override
  String get emergencyRemove => 'Usuń';

  @override
  String get emergencyContactsError => 'Nie udało się wczytać kontaktów.';

  @override
  String get emergencyNumber => 'Numer alarmowy';

  @override
  String get emergencyNumberHint => 'np. 112 lub 911';

  @override
  String get emergencyMessage => 'Szablon wiadomości';

  @override
  String get emergencyMessageDefault =>
      'Mogło dojść do wypadku z moim udziałem w pojeździe. Ta wiadomość została przygotowana przez Corvista i zawiera moją ostatnią znaną lokalizację, jeśli jest dostępna.';

  @override
  String get emergencyMessageHint =>
      'Pozostaw puste, aby użyć wiadomości domyślnej.';

  @override
  String get emergencyCountdown => 'Czas odliczania';

  @override
  String get emergencyVoiceCancel => 'Anulowanie głosem';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Powiedz „Nic mi nie jest” lub „Anuluj” podczas odliczania. Używa rozpoznawania mowy na urządzeniu, jeśli jest dostępne.';

  @override
  String get emergencyVoicePermDenied =>
      'Do anulowania głosem potrzebny jest dostęp do mikrofonu i rozpoznawania mowy.';

  @override
  String get emergencyAutoSave => 'Zapisuj nagranie zdarzenia automatycznie';

  @override
  String get emergencyTest => 'Test odliczania (bez połączenia)';

  @override
  String get emergencyTestBody =>
      'Uruchamia symulowane uderzenie, aby pokazać odliczanie. W trybie testowym nigdy nie jest wykonywane połączenie ani wysyłana wiadomość.';

  @override
  String get emergencyNotSet => 'Nie ustawiono';

  @override
  String get emergencyAlertHeadline => 'Wykryto możliwe poważne uderzenie.';

  @override
  String get emergencyAlertSubtitle => 'Czy wszystko w porządku?';

  @override
  String get emergencyAlertCancel => 'Nic mi nie jest — Anuluj';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Pozostało $seconds sekundy',
      many: 'Pozostało $seconds sekund',
      few: 'Pozostały $seconds sekundy',
      one: 'Pozostała 1 sekunda',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Nasłuchiwanie — powiedz „Nic mi nie jest”, aby anulować';

  @override
  String emergencyAlertHeard(String text) {
    return 'Usłyszano: „$text”';
  }

  @override
  String get emergencyAlertEscalated => 'Brak odpowiedzi. Wybierz, co zrobić:';

  @override
  String get emergencyAlertCall => 'Zadzwoń do służb ratunkowych';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Dzwoni pod numer $number. iOS poprosi o potwierdzenie.';
  }

  @override
  String get emergencyAlertMessage => 'Wyślij wiadomość do kontaktów';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Otwiera przygotowaną wiadomość. To Ty decydujesz, czy ją wysłać.';

  @override
  String get emergencyAlertTestMode =>
      'Tryb testowy — połączenie nie zostanie wykonane';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'Nic mi nie jest — Zamknij';

  @override
  String get emergencyMsgSent => 'Wiadomość wysłana.';

  @override
  String get emergencyMsgCancelled => 'Wiadomość nie została wysłana.';

  @override
  String get emergencyMsgFailed => 'Nie udało się wysłać wiadomości.';

  @override
  String get emergencyMsgUnavailable =>
      'Wiadomości nie są dostępne na tym urządzeniu.';

  @override
  String emergencyCallFailed(String number) {
    return 'Nie udało się rozpocząć połączenia. Zadzwoń samodzielnie pod numer $number.';
  }

  @override
  String get modelsTitle => 'Modele AI';

  @override
  String get modelsIntro =>
      'Wszystkie modele są dołączone do aplikacji i działają w całości na Twoim iPhonie. Obraz z kamery nigdy nie opuszcza urządzenia.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Na żywo: $ms ms na klatkę · $hz detekcji/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Załadowano w $ms ms';
  }

  @override
  String get modelsEfficientName => 'Oszczędny';

  @override
  String get modelsEfficientDesc =>
      'Szybki, kompaktowy detektor przeznaczony do długich tras, z niskim nagrzewaniem i zużyciem baterii.';

  @override
  String get modelsEnhancedName => 'Rozszerzony';

  @override
  String get modelsEnhancedDesc =>
      'Większy detektor, który wykrywa mniejsze i dalsze obiekty, kosztem wyższego zużycia energii.';

  @override
  String get modelsSegmentationName => 'Segmentacja';

  @override
  String get modelsSegmentationDesc =>
      'Łączy szybką detekcję z maskami nawierzchni i obiektów dla widoku Percepcja.';

  @override
  String get modelsNoneName => 'AI wstrzymane';

  @override
  String get modelsNoneDesc =>
      'Kamera i nagrywanie działają dalej bez detekcji obiektów. Najniższe zużycie energii.';

  @override
  String get modelsGenericDesc =>
      'Model detekcji obiektów działający na urządzeniu.';

  @override
  String get modelsFunctionDetection =>
      'Wykrywa pojazdy, osoby, rowery, motocykle, autobusy, sygnalizatory i znaki STOP';

  @override
  String get modelsFunctionSegmentation =>
      'Dodaje maski nawierzchni i obiektów';

  @override
  String get modelsFunctionNone =>
      'Bez detekcji; tylko nagrywanie wideorejestratora';

  @override
  String get modelsSize => 'Rozmiar';

  @override
  String get modelsInput => 'Wejście';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Współpracuje z';

  @override
  String get modelsStatusInstalled => 'Zainstalowany (wbudowany)';

  @override
  String get modelsStatusNotInstalled => 'Niezainstalowany';

  @override
  String get modelsSelected => 'Wybrany';

  @override
  String get modelsUse => 'Użyj tego modelu';

  @override
  String get modelsSwitching => 'Ładowanie modelu…';

  @override
  String modelsSwitched(String name) {
    return 'Aktywny model: $name';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Zmierzono na tym urządzeniu: średnio $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Nie zmierzono na tym urządzeniu';

  @override
  String get modelsBenchmarkRun => 'Uruchom test wydajności';

  @override
  String get modelsBenchmarkRunning => 'Trwa test wydajności…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Wybierz ten model, aby przeprowadzić jego test wydajności.';

  @override
  String get modelsBenchmarkDone => 'Test wydajności zakończony';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Test wydajności nie powiódł się: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Ostatnia aktualizacja: $date';
  }

  @override
  String get safetyTitle => 'Informacje o bezpieczeństwie';

  @override
  String get safetyIntro =>
      'Corvista to pomoc zwiększająca świadomość sytuacji na drodze. Nie steruje Twoim pojazdem i nie zastąpi Twojej uwagi, oceny sytuacji ani systemów bezpieczeństwa pojazdu.';

  @override
  String get safetyBeforeTitle => 'Przed jazdą';

  @override
  String get safetyBefore1 =>
      'Zamocuj iPhone’a stabilnie, w dozwolonym miejscu, tak aby nie zasłaniał widoku, poduszek powietrznych ani elementów sterowania.';

  @override
  String get safetyBefore2 =>
      'Dokończ konfigurację, wybierz widok i ustaw cel podróży na postoju.';

  @override
  String get safetyBefore3 =>
      'Podłącz ładowarkę na dłuższe trasy i, jeśli to możliwe, chroń telefon przed bezpośrednim słońcem.';

  @override
  String get safetyWhileTitle => 'Podczas jazdy';

  @override
  String get safetyWhile1 =>
      'Patrz na drogę. Używaj dużych elementów sterowania na ekranie tylko wtedy, gdy jest to bezpieczne i zgodne z prawem.';

  @override
  String get safetyWhile2 =>
      'Alerty to pomoc, a nie ostrzeżenia, na których można polegać. Brak sygnału nigdy nie oznacza, że droga jest wolna.';

  @override
  String get safetyWhile3 =>
      'W razie sprzeczności przestrzegaj przepisów, sygnałów i znaków drogowych, a nie aplikacji.';

  @override
  String get safetyLimitsTitle => 'Ograniczenia';

  @override
  String get safetyLimits1 =>
      'Pojedyncza kamera telefonu widzi tylko to, co jest przed nią. Obiekty poza jej polem widzenia, zasłonięte lub bardzo blisko nie są wykrywane.';

  @override
  String get safetyLimits2 =>
      'Detekcje mogą być pominięte, spóźnione lub błędne, zwłaszcza w nocy, podczas deszczu, mgły, olśnienia lub przy brudnej szybie.';

  @override
  String get safetyLimits3 =>
      'Rozpoznawane są tylko obsługiwane kategorie: pojazdy, autobusy, motocykle, rowery, osoby, sygnalizatory i znaki STOP. Wskazówki pasów w widoku wirtualnym są stylizowane, a nie wykrywane.';

  @override
  String get safetyLimits4 =>
      'Odległość jest pokazywana jako przybliżone strefy (Bardzo blisko, Blisko, Średnio, Daleko), nigdy jako zmierzone dystanse. Widok parkowania nie zastępuje czujników parkowania.';

  @override
  String get safetyHeatTitle => 'Temperatura i bateria';

  @override
  String get safetyHeat1 =>
      'Ciągłe używanie kamery i AI nagrzewa iPhone’a. Corvista obniża częstotliwość analizy, gdy urządzenie się przegrzewa, i wyświetla ostrzeżenie; jeśli iOS wykryje przegrzanie, kamera może się zatrzymać.';

  @override
  String get safetyEmergencyTitle => 'Funkcja alarmowa';

  @override
  String get safetyEmergency1 =>
      'Wykrywanie możliwego uderzenia jest eksperymentalne. Może nie wykryć rzeczywistej kolizji i może zostać uruchomione przez inne zdarzenia.';

  @override
  String get safetyEmergency2 =>
      'Nigdy nie kontaktuje się z nikim po cichu: iOS zawsze prosi o potwierdzenie połączenia lub wiadomości. Nie zastępuje samodzielnego wezwania służb ratunkowych.';

  @override
  String get privacyTitle => 'Prywatność';

  @override
  String get privacyIntro =>
      'Corvista została zaprojektowana tak, aby dane o Twoich przejazdach pozostawały na Twoim iPhonie. Nie istnieje konto Corvista, a Corvista nie prowadzi własnych serwerów.';

  @override
  String get privacyCameraTitle => 'Kamera i AI';

  @override
  String get privacyCamera1 =>
      'Wykrywanie, śledzenie i segmentacja obiektów odbywają się w całości na Twoim iPhonie. Klatki z kamery nigdy nie są przesyłane.';

  @override
  String get privacyCamera2 =>
      'Kamera działa tylko wtedy, gdy Corvista jest otwarta na ekranie. Zatrzymuje się, gdy aplikacja przechodzi w tło — nie ma ukrytego nagrywania w tle.';

  @override
  String get privacyRecordingsTitle => 'Nagrania';

  @override
  String get privacyRecordings1 =>
      'Bufor ciągły jest tymczasowy i stale nadpisywany. Materiał jest zachowywany tylko po stuknięciu Zapisz zdarzenie lub, jeśli to włączysz, po wykryciu możliwego uderzenia.';

  @override
  String get privacyRecordings2 =>
      'Zapisane nagrania pozostają w prywatnej pamięci Corvista na Twoim iPhonie. Opuszczają urządzenie tylko wtedy, gdy wybierzesz Udostępnij. Usunięcie aplikacji usuwa je.';

  @override
  String get privacyRecordings3 =>
      'Dźwięk jest nagrywany tylko wtedy, gdy go włączysz i udzielisz dostępu do mikrofonu.';

  @override
  String get privacyLocationTitle => 'Lokalizacja';

  @override
  String get privacyLocation1 =>
      'Lokalizacja jest używana, gdy aplikacja jest otwarta, do określania prędkości, wyświetlania mapy, tras i pogody. Jeśli opcja „Zapisuj lokalizację” jest włączona, pozycja z chwili zapisu jest przechowywana z nagraniem na Twoim urządzeniu.';

  @override
  String get privacyNetworkTitle => 'Usługi sieciowe';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — wyświetlanie mapy, wyszukiwanie miejsc i trasy. Wpisywany tekst i przybliżona lokalizacja są wysyłane do Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — bieżąca i godzinowa pogoda dla Twojej lokalizacji.';

  @override
  String get privacyNetwork4 =>
      'Corvista nie zawiera reklam ani analityki czy śledzenia podmiotów zewnętrznych.';

  @override
  String get privacyEmergencyTitle => 'Kontakty alarmowe';

  @override
  String get privacyEmergency1 =>
      'Wybrane przez Ciebie kontakty są przechowywane w pęku kluczy iOS na tym urządzeniu. Anulowanie głosem korzysta z rozpoznawania mowy na urządzeniu, jeśli jest dostępne. Połączenia i wiadomości są wysyłane dopiero po Twoim potwierdzeniu w iOS.';

  @override
  String get privacyControlsTitle => 'Twoja kontrola';

  @override
  String get privacyControls1 =>
      'Możesz w każdej chwili usunąć nagrania w sekcji Nagrania oraz zmienić lub cofnąć dostęp do kamery, mikrofonu, lokalizacji i mowy w Ustawieniach iOS.';

  @override
  String get termsTitle => 'Warunki korzystania';

  @override
  String get termsIntro =>
      'Korzystając z Corvista, akceptujesz te warunki. Obowiązuje również standardowa Umowa licencyjna użytkownika końcowego aplikacji licencjonowanej Apple.';

  @override
  String get termsUseTitle => 'Korzystanie z Corvista';

  @override
  String get termsUse1 =>
      'Corvista to pomoc zwiększająca świadomość sytuacji na drodze i wideorejestrator. Przez cały czas to Ty ponosisz pełną odpowiedzialność za bezpieczną jazdę zgodną z prawem.';

  @override
  String get termsUse2 =>
      'Nie obsługuj aplikacji w sposób, który rozprasza Cię podczas jazdy. Zamocuj urządzenie stabilnie i zgodnie z prawem.';

  @override
  String get termsAccuracyTitle => 'Brak gwarancji dokładności';

  @override
  String get termsAccuracy1 =>
      'Detekcje, strefy, alerty, znaczniki na mapie, trasy i pogoda mogą być niepełne, opóźnione lub błędne. Corvista nie steruje Twoim pojazdem.';

  @override
  String get termsAccuracy2 =>
      'Funkcja alarmowa jest eksperymentalna i może nie wykryć uderzenia lub uruchomić się fałszywie.';

  @override
  String get termsRecordingTitle => 'Przepisy o nagrywaniu';

  @override
  String get termsRecording1 =>
      'Przepisy dotyczące wideorejestratorów, nagrywania dźwięku i filmowania osób różnią się w zależności od kraju i regionu. Odpowiadasz za ich przestrzeganie, także podczas udostępniania nagrań.';

  @override
  String get termsLiabilityTitle => 'Odpowiedzialność';

  @override
  String get termsLiability1 =>
      'Aplikacja jest udostępniana „w stanie, w jakim jest”. W zakresie dozwolonym przez prawo twórca nie ponosi odpowiedzialności za wypadki, straty, mandaty ani szkody wynikające z jej używania lub polegania na jej wynikach.';

  @override
  String get termsChangesTitle => 'Zmiany';

  @override
  String get termsChanges1 =>
      'Warunki mogą być aktualizowane wraz z nowymi wersjami aplikacji. Dalsze korzystanie po aktualizacji oznacza akceptację zmienionych warunków.';

  @override
  String get helpTitle => 'Pomoc';

  @override
  String get helpIntro =>
      'Odpowiedzi na częste pytania. Wskazówki dotyczące bezpieczeństwa znajdziesz w Informacjach o bezpieczeństwie.';

  @override
  String get helpQSave => 'Jak zachować nagranie zdarzenia?';

  @override
  String get helpASaveBuffer =>
      'Stuknij duży przycisk Zapisz zdarzenie w widoku jazdy. Corvista zapisze w Nagraniach ostatnie 20 lub 30 sekund z bufora ciągłego (do wyboru w Ustawienia › Nagrywanie).';

  @override
  String get helpQWhere => 'Gdzie są przechowywane moje nagrania?';

  @override
  String get helpAWhere =>
      'W prywatnej pamięci Corvista na Twoim iPhonie. Nigdy nie są przesyłane. Użyj opcji Udostępnij w odtwarzaczu, aby wysłać lub wyeksportować nagranie.';

  @override
  String get helpQZones => 'Jak dokładne są strefy odległości?';

  @override
  String get helpAZones =>
      'Strefy to przybliżone szacunki z pojedynczej kamery, oparte na typowych rozmiarach obiektów. Traktuj je jako orientacyjne wskazówki, nigdy jako odległości.';

  @override
  String get helpQSlow => 'Dlaczego detekcja zwalnia?';

  @override
  String get helpASlow =>
      'Gdy iPhone się nagrzewa, bateria jest słaba lub włączony jest tryb niskiego zużycia energii, Corvista obniża częstotliwość analizy, aby chronić urządzenie. Tryb zasilania możesz zmienić w Ustawieniach.';

  @override
  String get helpQMap => 'Mapa, wyszukiwanie lub pogoda nie działają.';

  @override
  String get helpAMap =>
      'Te funkcje wymagają połączenia z internetem i dostępu do lokalizacji. Sprawdź połączenie i zezwól Corvista na lokalizację w Ustawieniach iOS.';

  @override
  String get helpQSimulator => 'Kamera jest wyświetlana jako niedostępna.';

  @override
  String get helpASimulator =>
      'Upewnij się, że dostęp do kamery jest dozwolony w Ustawieniach iOS i że żadna inna aplikacja nie używa kamery. W symulatorze iOS nie ma kamery; zamiast niej można użyć lokalnego filmu testowego.';

  @override
  String get emergencyMsgNoContacts => 'Najpierw dodaj kontakt alarmowy.';

  @override
  String get cameraStarting => 'Uruchamianie kamery…';

  @override
  String get cameraInterrupted => 'Kamera wstrzymana';

  @override
  String get cameraInterruptedBody =>
      'iOS wstrzymał kamerę, np. podczas rozmowy lub gdy używa jej inna aplikacja. Zostanie wznowiona automatycznie.';

  @override
  String get cameraUnavailable => 'Kamera niedostępna';

  @override
  String get cameraUnavailableBody =>
      'Na tym urządzeniu nie ma dostępnej kamery. Widoki detekcji, nagrywania i parkowania wymagają tylnej kamery.';

  @override
  String get cameraRunTestFootage => 'Uruchom materiał testowy';

  @override
  String get cameraPermissionDenied => 'Dostęp do kamery jest wyłączony';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista potrzebuje kamery do detekcji, nagrywania i widoków parkowania. Włącz dostęp do kamery w Ustawieniach.';

  @override
  String get cameraError => 'Błąd kamery';

  @override
  String get cameraStopped => 'Kamera zatrzymana';

  @override
  String get cameraStart => 'Uruchom kamerę';

  @override
  String get cameraFocusHint => 'Stuknij, aby ustawić ostrość';

  @override
  String get cameraPreviewLabel =>
      'Obraz z kamery na żywo z wykrytymi obiektami';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps kl./s · AI $hz Hz · $ms ms · utracone $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Prędkość $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Brak prędkości GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Kierunek $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Bufor nagrywania wideorejestratora, zbuforowano $seconds z $target sekund';
  }

  @override
  String get hudRecIdle => 'REC wył.';

  @override
  String get hudRecSaving => 'Zapisywanie…';

  @override
  String get hudRecError => 'Błąd REC';

  @override
  String get hudAiPaused => 'AI wstrzymane';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obiektu',
      many: '$count obiektów',
      few: '$count obiekty',
      one: '1 obiekt',
      zero: 'Brak obiektów',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'wykryto $count obiektu',
      many: 'wykryto $count obiektów',
      few: 'wykryto $count obiekty',
      one: 'wykryto 1 obiekt',
      zero: 'nie wykryto obiektów',
    );
    return 'Model AI $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Gorąco — AI zwolnione';

  @override
  String get hudThermalCritical => 'Za gorąco — AI wstrzymane';

  @override
  String hudBatteryLow(String percent) {
    return 'Bateria $percent';
  }

  @override
  String get hudLowPower => 'Tryb niskiego zużycia energii';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Pogoda $temperature, $condition. Stuknij, aby zobaczyć szczegóły.';
  }

  @override
  String get hudNoGuidance =>
      'Wyszukaj cel podróży w widoku Mapa, aby zobaczyć tutaj wskazówki nawigacji.';

  @override
  String get navArrived => 'Jesteś na miejscu';

  @override
  String get navRerouting => 'Wyznaczanie nowej trasy…';

  @override
  String get navSearchHint => 'Szukaj celu';

  @override
  String get navSearchFieldHint => 'Adres, miejsce lub firma';

  @override
  String get navNoResults => 'Brak pasujących miejsc';

  @override
  String get navSearching => 'Wyszukiwanie…';

  @override
  String get navSearchStartTyping =>
      'Wpisz adres lub nazwę miejsca. Wyniki pochodzą z Apple Maps i wymagają połączenia z internetem.';

  @override
  String get navErrorUnavailable =>
      'Wyszukiwanie i trasy są niedostępne — sprawdź połączenie z internetem.';

  @override
  String get navErrorNoLocation =>
      'Oczekiwanie na lokalizację, aby zaplanować trasę.';

  @override
  String get navErrorPermission =>
      'Dostęp do lokalizacji jest wyłączony, więc trasy nie mogą rozpoczynać się od Twojej pozycji.';

  @override
  String navErrorGeneric(String code) {
    return 'Nie udało się wczytać tras ($code).';
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
    return 'Przyjazd $time';
  }

  @override
  String get navStart => 'Start';

  @override
  String get navEnd => 'Zakończ';

  @override
  String get navEndLabel => 'Zakończ nawigację';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · zostało $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Uwaga: $text';
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
    return '$hours godz. $minutes min';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Trasa $index: $name';
  }

  @override
  String get weatherTitle => 'Pogoda';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Odczuwalna $temperature';
  }

  @override
  String get weatherPrecipitation => 'Opady';

  @override
  String get weatherWind => 'Wiatr';

  @override
  String get weatherVisibility => 'Widoczność';

  @override
  String get weatherHumidity => 'Wilgotność';

  @override
  String get weatherHourly => 'Najbliższe godziny';

  @override
  String weatherAsOf(String time) {
    return 'Zaktualizowano $time';
  }

  @override
  String get weatherRefresh => 'Odśwież pogodę';

  @override
  String get weatherUnavailable => 'Pogoda jest teraz niedostępna.';

  @override
  String get weatherNoLocation => 'Pogoda wymaga Twojej lokalizacji.';

  @override
  String get weatherLegal => 'Źródła danych i informacje prawne';

  @override
  String weatherProvidedBy(String service) {
    return 'Dane pogodowe: $service';
  }

  @override
  String get weatherNow => 'Teraz';

  @override
  String get virtualEmpty => 'Nie wykryto obsługiwanych obiektów';

  @override
  String get virtualEmptyCameraOff => 'Widok wirtualny wymaga kamery na żywo.';

  @override
  String get virtualLaneDisclaimer =>
      'Linie pasów są ilustracyjne, nie wykrywane.';

  @override
  String virtualNearest(String zone) {
    return 'Najbliższy: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Wirtualna scena drogowa: $summary';
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
  String get virtualStatusLive => 'aktywne';

  @override
  String get virtualStatusPaused => 'wstrzymane';

  @override
  String get virtualStatusCameraOff => 'Kamera wył.';

  @override
  String get virtualStatusTestFootage => 'Materiał testowy';

  @override
  String get virtualEmptyHint =>
      'Pojazdy, osoby, rowery, światła i znaki STOP pojawią się tutaj po wykryciu.';

  @override
  String get mapRecenter => 'Wyśrodkuj';

  @override
  String get mapZoomIn => 'Przybliż';

  @override
  String get mapZoomOut => 'Oddal';

  @override
  String get mapUnsupported => 'Interaktywna mapa jest dostępna na iPhonie.';

  @override
  String get mapObjectsApprox =>
      'Znaczniki obiektów pokazują przybliżone pozycje.';

  @override
  String get mapWeatherUnavailable => 'Pogoda niedostępna';

  @override
  String get navErrorNoRoute => 'Nie znaleziono trasy do tego celu.';

  @override
  String get navDismiss => 'Odrzuć';

  @override
  String get navGo => 'Jedź';

  @override
  String get navFastest => 'Najszybsza';

  @override
  String get navThen => 'Następnie';

  @override
  String get navRecents => 'Ostatnie';

  @override
  String get navClearRecents => 'Wyczyść';

  @override
  String get navSearchSubmitHint =>
      'Naciśnij Szukaj, aby zobaczyć wszystkie pasujące miejsca';

  @override
  String get navPlaces => 'Miejsca';

  @override
  String get navEtaLabel => 'przyjazd';

  @override
  String get navTimeLeftLabel => 'zostało';

  @override
  String get navOverview => 'Przegląd trasy';

  @override
  String get navMute => 'Wycisz głos';

  @override
  String get navUnmute => 'Włącz głos';

  @override
  String get navEndConfirm => 'Zakończyć nawigację?';

  @override
  String navEndConfirmBody(String place) {
    return 'Prowadzenie do: $place zostanie zatrzymane.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Jesteś na miejscu: $place';
  }

  @override
  String get navDone => 'Gotowe';

  @override
  String get navWeakGps => 'Słaby sygnał GPS';

  @override
  String get navLocationOff =>
      'Lokalizacja jest wyłączona. Włącz ją, aby planować trasy i nawigować.';

  @override
  String get navVoiceGuidance => 'Wskazówki głosowe';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Za $distance $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, a następnie $second';
  }

  @override
  String get navSpeakRerouting => 'Wyznaczam nową trasę';

  @override
  String get navSpeakArrived => 'Jesteś na miejscu';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metra',
      many: '$count metrów',
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
      other: '$value kilometra',
      many: '$value kilometrów',
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
      other: '$count stopy',
      many: '$count stóp',
      few: '$count stopy',
      one: '1 stopa',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jarda',
      many: '$count jardów',
      few: '$count jardy',
      one: '1 jard',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Jedź prosto przez $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Wskazówki dojazdu nie są dostępne dla tej trasy w tym regionie. Spróbuj wybrać inny cel.';

  @override
  String navContinueFor(String distance) {
    return 'Jedź prosto przez $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value mili',
      many: '$value mil',
      few: '$value mile',
      one: '1 mila',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Najbliżej: $object · $zone';
  }

  @override
  String get parkingNothing => 'Nic nie wykryto w polu widzenia';

  @override
  String get parkingBeeps => 'Sygnały zbliżania';

  @override
  String get parkingVolume => 'Głośność sygnału';

  @override
  String get parkingLimitations =>
      'Jedna kamera, nie 360°. Obiekty poza polem widzenia kamery nie są wykrywane. Nie zastępuje czujników parkowania; szacunki mogą być błędne, a brak sygnału nie oznacza, że okolica jest wolna.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Widok zbliżania z góry. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Oryginał';

  @override
  String get perceptionModeBoxes => 'Ramki';

  @override
  String get perceptionModeMasks => 'Maski obiektów';

  @override
  String get perceptionModeRoad => 'Nawierzchnia';

  @override
  String get perceptionModeCombined => 'Połączony';

  @override
  String get perceptionOpacity => 'Przezroczystość maski';

  @override
  String get perceptionDisclaimer =>
      'Maska nawierzchni to przybliżona warstwa wizualna. Nie pokazuje przestrzeni dostępnej do jazdy ani pasów ruchu.';

  @override
  String get perceptionNeedsModel =>
      'Wybierz model Segmentacja, aby zobaczyć maski.';

  @override
  String get perceptionChooseModel => 'Wybierz model';

  @override
  String get perceptionWaiting => 'Oczekiwanie na pierwszą klatkę segmentacji…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Ramki';

  @override
  String get perceptionShortObjects => 'Obiekty';

  @override
  String get perceptionShortRoad => 'Droga';

  @override
  String get perceptionShortAll => 'Wszystko';

  @override
  String get perceptionModesLabel => 'Warstwy percepcji';

  @override
  String get perceptionStatusWarmingUp => 'Rozgrzewanie…';

  @override
  String get perceptionStatusLoadingModel => 'Wczytywanie modelu…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps kl./s';
  }

  @override
  String get perceptionStatusPaused => 'Maski wstrzymane';

  @override
  String get perceptionLegend => 'Legenda masek';

  @override
  String get perceptionUnavailable => 'Maski niedostępne';

  @override
  String get driveSave => 'Zapisz';

  @override
  String get driveSaveIncident => 'Zapisz zdarzenie';

  @override
  String driveSaveHint(int seconds) {
    return 'Zapisuje ostatnie $seconds s nagrania wideorejestratora';
  }

  @override
  String get driveSaving => 'Zapisywanie zdarzenia…';

  @override
  String hudRecManualLabel(String time) {
    return 'Nagrywanie, $time';
  }

  @override
  String get driveRecord => 'Nagraj';

  @override
  String get driveRecordStartA11y => 'Rozpocznij nagrywanie';

  @override
  String driveRecordStopA11y(String time) {
    return 'Zatrzymaj nagrywanie, nagrano $time';
  }

  @override
  String get driveRecordHint =>
      'Nagrywa nieprzerwanie do zatrzymania, wraz z ostatnimi 5 sekundami';

  @override
  String get driveRecordFailed => 'Nie udało się rozpocząć nagrywania';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zapisano nagranie · $count części',
      many: 'Zapisano nagranie · $count części',
      few: 'Zapisano nagranie · $count części',
      one: 'Zapisano nagranie',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Nagrywanie zatrzymane: pamięć prawie pełna',
      'max_duration': 'Nagrywanie zatrzymane: osiągnięto maksymalną długość',
      'camera_stopped': 'Nagrywanie zatrzymane wraz z kamerą',
      'background': 'Nagrywanie zatrzymane: aplikacja przeszła w tło',
      'thermal': 'Nagrywanie zatrzymane: telefon jest zbyt gorący',
      'other': 'Nagrywanie zatrzymane',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Zdarzenie zapisane · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Zobacz';

  @override
  String get driveSaveFailed => 'Nie udało się zapisać zdarzenia.';

  @override
  String get driveSaveNotRunning =>
      'Nagrywanie jeszcze się nie rozpoczęło — poczekaj na uruchomienie kamery i spróbuj ponownie.';

  @override
  String get driveSaveTestFootage =>
      'Materiał testowy nie jest nagrywany. Zapisywanie zdarzeń działa z kamerą na żywo.';

  @override
  String get driveSaveStorageFull =>
      'Na Twoim iPhonie brakuje miejsca. Zwolnij miejsce lub usuń starsze nagrania.';

  @override
  String get driveSaveIoError => 'Nie udało się zapisać nagrania w pamięci.';

  @override
  String get driveClips => 'Nagrania';

  @override
  String get driveSettings => 'Ustawienia';

  @override
  String get driveViewSwitcher => 'Widoki jazdy';

  @override
  String get driveLocationDenied =>
      'Lokalizacja jest wyłączona — prędkość, mapy i trasy są niedostępne.';

  @override
  String get driveCameraDenied =>
      'Dostęp do kamery jest wyłączony — detekcja i nagrywanie są niedostępne.';

  @override
  String get driveRecorderFallback =>
      'Nagrywanie bez dźwięku: dostęp do mikrofonu jest wyłączony.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Dostosowano ustawienia nagrywania: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Twój iPhone jest gorący. AI działa wolniej, aby ostygnąć — chroń go przed bezpośrednim słońcem i ustaw w pobliżu nawiewu.';

  @override
  String get drivePowerThermalCritical =>
      'Twój iPhone jest zbyt gorący. Detekcja AI jest wstrzymana do czasu ostygnięcia; nagrywanie trwa, jeśli to możliwe.';

  @override
  String get drivePowerLowPower =>
      'Tryb niskiego zużycia energii jest włączony — AI działa wolniej.';

  @override
  String get drivePowerBatteryLow =>
      'Bateria jest słaba — podłącz iPhone’a do zasilania podczas jazdy.';

  @override
  String get onboardingTitle1 => 'Zobacz więcej w każdej podróży.';

  @override
  String get onboardingBody1 =>
      'Zamień iPhone’a w inteligentny wideorejestrator i towarzysza świadomej jazdy.';

  @override
  String get onboardingTitle2 => 'Inteligencja w każdej klatce.';

  @override
  String get onboardingBody2 =>
      'Rozpoznawaj obsługiwane pojazdy, osoby, rowery i sygnały drogowe bezpośrednio na iPhonie.';

  @override
  String get onboardingTitle3 => 'Jedna droga. Wiele perspektyw.';

  @override
  String get onboardingBody3 =>
      'Przełączaj się między detekcją na żywo, widokami wirtualnymi, mapami interaktywnymi i wizualizacją parkowania.';

  @override
  String get onboardingTitle4 => 'Zachowaj ważne chwile.';

  @override
  String get onboardingBody4 =>
      'Zapisuj niedawne nagrania wideorejestratora, przeglądaj zdarzenia i udostępniaj nagrania.';

  @override
  String get onboardingTitle5 => 'Bezpieczeństwo i prywatność';

  @override
  String get onboardingSafety1 =>
      'Corvista to pomoc zwiększająca świadomość sytuacji na drodze. Patrz na drogę.';

  @override
  String get onboardingSafety2 =>
      'Nie steruje pojazdem ani nie zastępuje Twojej oceny sytuacji.';

  @override
  String get onboardingSafety3 =>
      'Detekcje i szacunki mogą być niedokładne lub pominięte.';

  @override
  String get onboardingSafety4 =>
      'Obraz z kamery jest przetwarzany na Twoim iPhonie — wideo nie jest przesyłane.';

  @override
  String get onboardingSafety5 =>
      'Mapy, wyszukiwanie, trasy i pogoda wymagają połączenia z internetem.';

  @override
  String get onboardingSafety6 =>
      'Zamocuj iPhone’a stabilnie, aby nie zasłaniał widoku.';

  @override
  String get onboardingSafety7 =>
      'Dokończ konfigurację przed rozpoczęciem jazdy.';

  @override
  String get onboardingAcknowledge =>
      'Rozumiem, że Corvista jest pomocą zwiększającą świadomość sytuacji i że nadal odpowiadam za bezpieczną jazdę.';

  @override
  String get onboardingReadSafety =>
      'Przeczytaj pełne informacje o bezpieczeństwie';

  @override
  String get onboardingNext => 'Dalej';

  @override
  String get onboardingSkip => 'Pomiń';

  @override
  String get onboardingAgree => 'Kontynuuj';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Strona $current z $total';
  }

  @override
  String get permTitle => 'Uprawnienia';

  @override
  String get permIntro =>
      'Corvista prosi tylko o to, czego potrzebuje każda funkcja. Możesz to zmienić w dowolnym momencie w Ustawieniach.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Wymagana do detekcji, nagrywania wideorejestratora i widoku parkowania. Wideo jest przetwarzane na Twoim iPhonie.';

  @override
  String get permLocationTitle => 'Lokalizacja';

  @override
  String get permLocationBody =>
      'Używana do prędkości GPS, mapy, tras, pogody i oznaczania zapisanych nagrań. Tylko podczas korzystania z aplikacji.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'Rozpoznawanie mowy jest wymagane tylko po włączeniu anulowania głosem dla alertów awaryjnych.';

  @override
  String get permRequired => 'Wymagane';

  @override
  String get permOptional => 'Opcjonalne';

  @override
  String get permAllow => 'Zezwól';

  @override
  String get permGranted => 'Dozwolone';

  @override
  String get permDenied => 'Odmówiono';

  @override
  String get permLimited => 'Ograniczone';

  @override
  String get permRestricted => 'Zastrzeżone';

  @override
  String get permStart => 'Zacznij jazdę';

  @override
  String get permCameraNeeded =>
      'Możesz kontynuować bez dostępu do kamery, ale detekcja i nagrywanie nie będą działać, dopóki nie zezwolisz na to w Ustawieniach.';

  @override
  String get permSetupIntro =>
      'Corvista potrzebuje tych uprawnień do pełnego działania. Stuknij Zezwól na wszystko, a iOS zapyta o każde po kolei. Możesz je zmienić w dowolnym momencie w Ustawieniach.';

  @override
  String get permCameraLine =>
      'Wymagana do detekcji, nagrywania wideorejestratora i widoku parkowania. Wideo jest przetwarzane na Twoim iPhonie, nigdy nie jest przesyłane.';

  @override
  String get permLocationLine =>
      'Prędkość GPS, mapa, trasy, pogoda i miejsce zapisania nagrań. Tylko podczas korzystania z aplikacji.';

  @override
  String get permMicLine =>
      'Dźwięk z kabiny w nagraniach zdarzeń oraz rozpoznawanie frazy anulowania podczas alertu awaryjnego.';

  @override
  String get permSpeechTitle => 'Rozpoznawanie mowy';

  @override
  String get permSpeechLine =>
      'Rozpoznaje frazę anulowania podczas odliczania awaryjnego, na Twoim iPhonie, jeśli jest to obsługiwane.';

  @override
  String get permAllowAll => 'Zezwól na wszystko';

  @override
  String permAsking(String permission) {
    return 'Prośba o dostęp: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Niektóre uprawnienia są wyłączone. Włącz je w Ustawieniach, aby korzystać z tych funkcji.';

  @override
  String get permNotNow => 'Nie teraz';

  @override
  String get tourLabel => 'Przewodnik po ekranie jazdy';

  @override
  String tourProgress(int current, int total) {
    return 'Krok $current z $total';
  }

  @override
  String get tourNext => 'Dalej';

  @override
  String get tourBack => 'Wstecz';

  @override
  String get tourSkip => 'Pomiń przewodnik';

  @override
  String get tourFinish => 'Zacznij jazdę';

  @override
  String get tourWelcomeTitle => 'Krótki przewodnik';

  @override
  String get tourWelcomeBody =>
      'Minutowy przegląd najważniejszych elementów ekranu jazdy. Najlepiej na postoju.';

  @override
  String get tourHudTitle => 'Pasek wskaźników';

  @override
  String get tourHudSpeed => 'Prędkość pochodzi z GPS.';

  @override
  String get tourHudRec =>
      'REC pokazuje, ile sekund nagrania znajduje się w buforze.';

  @override
  String get tourHudAi =>
      'Znacznik AI pokazuje model, liczbę widzianych obiektów i kropkę: zielona — działa, bursztynowa — ograniczone, czerwona — zatrzymane.';

  @override
  String get tourSaveTitle => 'Zapisz zdarzenie';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista przechowuje bufor ciągły z ostatnich $seconds s wideo. Jest on stale nadpisywany, więc nic nie jest zachowywane, dopóki nie stukniesz Zapisz. Zapisane nagrania pozostają na tym iPhonie, w Nagraniach.';
  }

  @override
  String get tourRecordTitle => 'Nagraj całą jazdę';

  @override
  String get tourRecordBody =>
      'Stuknij Nagraj, aby filmować nieprzerwanie do zatrzymania. Długie przejazdy są zapisywane w Nagraniach w częściach po 5 minut, a Zapisz zdarzenie działa także podczas nagrywania.';

  @override
  String get tourViewsTitle => 'Pięć sposobów patrzenia na drogę';

  @override
  String get tourViewDetection =>
      'Kamera na żywo z ramkami wokół obsługiwanych obiektów.';

  @override
  String get tourViewVirtual => 'Uproszczona scena 3D zbudowana z detekcji.';

  @override
  String get tourViewMap =>
      'Apple Maps z wyszukiwaniem i nawigacją zakręt po zakręcie.';

  @override
  String get tourViewParking => 'Kamera plus widok zbliżania z góry.';

  @override
  String get tourViewPerception => 'Maski drogi i obiektów.';

  @override
  String get tourMapTitle => 'Wyszukiwanie i nawigacja';

  @override
  String get tourMapBody =>
      'Otwórz Mapę, stuknij pasek wyszukiwania i wybierz cel. Wybierz trasę, a następnie stuknij Start, aby rozpocząć nawigację. Wymaga połączenia z internetem.';

  @override
  String get tourClipsTitle => 'Nagrania';

  @override
  String get tourClipsBody =>
      'Przeglądaj, zmieniaj nazwy, udostępniaj lub usuwaj zapisane zdarzenia. Nagrania pozostają na Twoim iPhonie, chyba że je udostępnisz.';

  @override
  String get tourSettingsTitle => 'Ustawienia';

  @override
  String get tourSettingsBody =>
      'Dostosuj alerty głosowe i ich czułość, jakość nagrywania i długość bufora oraz skonfiguruj tryb awaryjny: eksperymentalny alert o uderzeniu z odliczaniem do anulowania.';

  @override
  String get tourSafetyTitle => 'Przed jazdą';

  @override
  String get tourSafety1 =>
      'Zamocuj iPhone’a stabilnie, tak aby nie zasłaniał widoku.';

  @override
  String get tourSafety2 =>
      'Nie obsługuj aplikacji podczas jazdy. Skonfiguruj wszystko na postoju.';

  @override
  String get tourSafety3 =>
      'Detekcje i strefy to szacunki. Mogą być błędne lub pominięte.';

  @override
  String get tourSafety4 => 'Nadal odpowiadasz za bezpieczną jazdę.';

  @override
  String get helpTakeTour => 'Zobacz przewodnik';

  @override
  String get helpTakeTourSub => 'Minutowy przegląd ekranu jazdy.';

  @override
  String get tripsTitle => 'Przejazdy';

  @override
  String get tripsOpen => 'Dziennik przejazdów';

  @override
  String get tripsEmptyTitle => 'Brak przejazdów';

  @override
  String get tripsEmptyBody =>
      'Przejazdy są zapisywane automatycznie podczas jazdy z Corvista — dystans, czas, prędkość i przebyta trasa.';

  @override
  String get tripsDisabledBody =>
      'Dziennik przejazdów jest wyłączony, więc nowe przejazdy nie są zapisywane. Włącz go, aby prowadzić prywatny dziennik tras na tym iPhonie.';

  @override
  String get tripsEnable => 'Włącz dziennik przejazdów';

  @override
  String get tripsToday => 'Dzisiaj';

  @override
  String get tripsYesterday => 'Wczoraj';

  @override
  String tripsRecordingNow(String distance) {
    return 'Zapisywanie przejazdu · $distance';
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
      other: '$count zdarzenia',
      many: '$count zdarzeń',
      few: '$count zdarzenia',
      one: '1 zdarzenie',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alertu',
      many: '$count alertów',
      few: '$count alerty',
      one: '1 alert',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przejazdu',
      many: '$count przejazdów',
      few: '$count przejazdy',
      one: '1 przejazd',
      zero: 'Brak przejazdów',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Dystans';

  @override
  String get tripsStatDuration => 'Czas trwania';

  @override
  String get tripsStatMoving => 'Czas jazdy';

  @override
  String get tripsStatAvgSpeed => 'Śr. prędkość';

  @override
  String get tripsStatMaxSpeed => 'Maks. prędkość';

  @override
  String get tripsDetections => 'Detekcje';

  @override
  String get tripsNoDetections =>
      'W tym przejeździe nie zapisano żadnych obiektów drogowych.';

  @override
  String get tripsTimeline => 'Oś czasu';

  @override
  String get tripsEventStart => 'Przejazd rozpoczęty';

  @override
  String get tripsEventEnd => 'Przejazd zakończony';

  @override
  String get tripsEventAlert => 'Alert głosowy';

  @override
  String get tripsEventIncident => 'Zapisano nagranie zdarzenia';

  @override
  String get tripsEventEmergency => 'Wykryto możliwą kolizję';

  @override
  String get tripsEventNavStart => 'Rozpoczęto nawigację';

  @override
  String get tripsEventArrive => 'Dotarcie do celu';

  @override
  String get tripsEventReroute => 'Przeliczono trasę';

  @override
  String get tripsEventRecording => 'Zapisano nagranie';

  @override
  String get tripsOpenClip => 'Otwórz nagranie';

  @override
  String get tripsTrackPreview => 'Ślad GPS';

  @override
  String get tripsRenameTitle => 'Zmień nazwę przejazdu';

  @override
  String get tripsRenameHint => 'Nazwa przejazdu';

  @override
  String get tripsFavorite => 'Dodaj do ulubionych';

  @override
  String get tripsUnfavorite => 'Usuń z ulubionych';

  @override
  String get tripsShareGpx => 'Udostępnij GPX';

  @override
  String get tripsShareFailed => 'Nie udało się udostępnić tego przejazdu.';

  @override
  String get tripsDelete => 'Usuń przejazd';

  @override
  String get tripsDeleteConfirmTitle => 'Usunąć ten przejazd?';

  @override
  String get tripsDeleteConfirmBody =>
      'Trasa i statystyki zostaną usunięte z tego iPhone’a. Nagrania zdarzeń z tego przejazdu zostaną zachowane.';

  @override
  String get tripsDeleted => 'Przejazd usunięty';

  @override
  String get tripsNotFound => 'Ten przejazd nie jest już dostępny.';

  @override
  String get tripsPrivacyNote =>
      'Przechowywane tylko na tym iPhonie. Nic nie jest przesyłane.';

  @override
  String get settingsSectionTrips => 'Dziennik przejazdów';

  @override
  String get settingsTripLog => 'Zapisuj przejazdy';

  @override
  String get settingsTripLogSubtitle =>
      'Przechowuje trasę i statystyki jazdy tylko na tym iPhonie.';

  @override
  String get settingsTripRetention => 'Przechowuj przejazdy przez';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '1 dzień',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 rok';

  @override
  String get settingsRetentionForever => 'Zawsze';

  @override
  String get settingsTripRetentionFooter =>
      'Starsze przejazdy są usuwane automatycznie po uruchomieniu Corvista.';

  @override
  String get settingsViewTrips => 'Zobacz przejazdy';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours godz. $minutes min';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes min';
  }

  @override
  String tripsGpxName(String date) {
    return 'Przejazd Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Zwolnij miejsce';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Usuwa pliki tymczasowe i pamięć podręczną. Zapisane nagrania i przejazdy są zachowywane.';

  @override
  String settingsFreedBytes(String size) {
    return 'Zwolniono $size';
  }

  @override
  String get settingsNothingToFree =>
      'Wyczyszczono pamięć podręczną — brak plików tymczasowych do usunięcia.';

  @override
  String get settingsSectionPrivacyData => 'Prywatność i dane';

  @override
  String get settingsPrivacyDataFooter =>
      'Nagrania, przejazdy i ustawienia są przechowywane tylko na tym iPhonie. Opuszczają go wyłącznie wtedy, gdy zdecydujesz się je udostępnić.';

  @override
  String get settingsDeleteAllData => 'Usuń wszystkie dane';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Wymaż nagrania, przejazdy, kontakty i ustawienia z tego iPhone’a';

  @override
  String get deleteAllTitle => 'Usunąć wszystkie dane?';

  @override
  String get deleteAllMessage =>
      'Z tego iPhone’a zostaną trwale usunięte:\n• Nagrania zdarzeń i miniatury\n• Dziennik przejazdów i ślady GPS\n• Kontakty awaryjne i zdarzenia awaryjne\n• Dzienniki detekcji i dziennik diagnostyczny\n• Ustawienia i ostatnie cele\n• Tymczasowy bufor nagrywania i pamięć podręczna\n\nTej operacji nie można cofnąć. Następnie Corvista uruchomi się od ekranów powitalnych.';

  @override
  String get deleteAllConfirm => 'Usuń wszystko';

  @override
  String get deleteAllInProgress => 'Usuwanie…';

  @override
  String get deleteAllDone => 'Usunięto wszystkie dane';

  @override
  String get deleteAllPartial =>
      'Nie udało się usunąć niektórych elementów. Spróbuj ponownie w Ustawieniach.';

  @override
  String get diagLogSection => 'Dziennik diagnostyczny';

  @override
  String get diagLogFooter =>
      'Błędy są zapisywane tylko na tym iPhonie, bez lokalizacji, nazw kontaktów i numerów telefonów. Nic nie jest wysyłane, dopóki sam nie udostępnisz dziennika.';

  @override
  String get diagLogShare => 'Udostępnij dziennik diagnostyczny';

  @override
  String get diagLogEmpty => 'Pusty';

  @override
  String get diagLogClear => 'Wyczyść dziennik';

  @override
  String get diagLogClearTitle => 'Wyczyścić dziennik diagnostyczny?';

  @override
  String get diagLogClearBody =>
      'Zapisane wpisy o błędach zostaną usunięte z tego iPhone’a.';

  @override
  String get diagLogCleared => 'Wyczyszczono dziennik diagnostyczny';

  @override
  String get diagLogShareFailed =>
      'Nie udało się udostępnić dziennika diagnostycznego.';

  @override
  String get privacyControls2 =>
      'Ustawienia › Prywatność i dane › Usuń wszystkie dane wymazuje każde nagranie, przejazd, kontakt, dziennik i ustawienie, które Corvista zapisała na tym iPhonie.';

  @override
  String get parkingZoneStop => 'Stop';

  @override
  String get parkingZoneVeryClose => 'Bardzo blisko';

  @override
  String get parkingZoneClose => 'Blisko';

  @override
  String get parkingZoneNothingClose => 'Nic blisko nie widać';

  @override
  String get parkingNotDetected =>
      'Ściany, słupy, słupki i krawężniki nie są wykrywane';

  @override
  String get parkingApprox => 'ok.';

  @override
  String get parkingSideLeft => 'Lewo';

  @override
  String get parkingSideCenter => 'Środek';

  @override
  String get parkingSideRight => 'Prawo';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Tylko widok z przedniej kamery — to nie system 360°';

  @override
  String get parkingMuteBeeps => 'Wycisz sygnały';

  @override
  String get parkingUnmuteBeeps => 'Włącz sygnały';

  @override
  String get parkingAbout => 'O widoku parkowania';

  @override
  String get parkingLimitationsDetail =>
      'Obserwowany jest tylko obszar przed kamerą. Detektor rozpoznaje samochody osobowe, autobusy i ciężarówki, ludzi, rowery i motocykle. Ściany, słupy, słupki, krawężniki, pachołki, szlabany i niskie przeszkody NIE są wykrywane, a maska silnika może zasłaniać podłoże tuż przed autem. Odległości to zgrubne szacunki z jednej kamery (na podstawie wielkości i położenia obiektu) i mogą się bardzo mylić. Cisza lub komunikat „Nic blisko nie widać” nie oznacza, że droga jest wolna — zawsze rozglądaj się i korzystaj z lusterek.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Bliskość według stron: lewo $left, środek $center, prawo $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Błędy są zapisywane w prywatnym dzienniku na tym iPhonie (bez lokalizacji, nazw kontaktów i numerów telefonów). Nigdy nie jest on wysyłany automatycznie; możesz go udostępnić lub wyczyścić w Ustawienia › Diagnostyka.';
}
