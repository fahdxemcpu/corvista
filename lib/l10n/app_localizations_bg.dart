// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Виждайте повече при всяко пътуване.';

  @override
  String get commonCancel => 'Отказ';

  @override
  String get commonDelete => 'Изтриване';

  @override
  String get commonSave => 'Запази';

  @override
  String get commonBack => 'Назад';

  @override
  String get commonClose => 'Затвори';

  @override
  String get commonRetry => 'Опитайте отново';

  @override
  String get commonOpenSettings => 'Отвори настройките';

  @override
  String get commonLoading => 'Зареждане…';

  @override
  String get commonError => 'Нещо се обърка.';

  @override
  String commonErrorDetail(String message) {
    return 'Нещо се обърка: $message';
  }

  @override
  String get commonOn => 'Вкл.';

  @override
  String get commonOff => 'Изкл.';

  @override
  String get commonRename => 'Преименуване';

  @override
  String get commonShare => 'Споделяне';

  @override
  String get commonNotAvailable => 'Не е налично';

  @override
  String get commonTestFootage => 'ТЕСТОВ ВИДЕОЗАПИС';

  @override
  String get zoneVeryClose => 'Много близо';

  @override
  String get zoneClose => 'Близо';

  @override
  String get zoneMedium => 'На средно разстояние';

  @override
  String get zoneFar => 'Далече';

  @override
  String get zoneUnknown => 'Неизвестно';

  @override
  String get classPerson => 'Човек';

  @override
  String get classBicycle => 'Велосипед';

  @override
  String get classMotorcycle => 'Мотоциклет';

  @override
  String get classCar => 'Превозно средство';

  @override
  String get classBus => 'Автобус';

  @override
  String get classTrafficLight => 'Светофар';

  @override
  String get classStopSign => 'Знак „Стоп“';

  @override
  String get viewDetection => 'Разпознаване';

  @override
  String get viewVirtual => 'Виртуален';

  @override
  String get viewMap => 'Карта';

  @override
  String get viewParking => 'Паркиране';

  @override
  String get viewPerception => 'Възприятие';

  @override
  String get unitKmh => 'км/ч';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Червено';

  @override
  String get lightYellow => 'Жълто';

  @override
  String get lightGreen => 'Зелено';

  @override
  String get lightUnknown => 'Неизвестно';

  @override
  String get clipsTitle => 'Клипове';

  @override
  String get clipsSelect => 'Избор';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count избрани',
      one: '1 избран',
      zero: 'Изберете клипове',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Избери всички';

  @override
  String get clipsDeselectAll => 'Махни избора';

  @override
  String get clipsDeleteSelected => 'Изтрий избраните';

  @override
  String get clipsGridView => 'Мрежов изглед';

  @override
  String get clipsListView => 'Списъчен изглед';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Да се изтрият ли $count клипа?',
      one: 'Да се изтрие ли този клип?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Видеата се премахват окончателно от вашия iPhone. Действието не може да бъде отменено.',
      one: 'Видеото се премахва окончателно от вашия iPhone. Действието не може да бъде отменено.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа са изтрити',
      one: 'Клипът е изтрит',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Все още няма клипове';

  @override
  String get clipsEmptyBody =>
      'Докато шофирате, Corvista пази кратък непрекъснат буфер. Докоснете „Запази инцидент“, за да запазите тук последните секунди видео.';

  @override
  String get clipsLoadError => 'Клиповете не можаха да се заредят.';

  @override
  String get clipsStorageTitle => 'Памет';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Клипове $clips · Буфер $buffer · $free свободни';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count запазени клипа',
      one: '1 запазен клип',
      zero: 'Няма запазени клипове',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'На вашия iPhone остава малко място. Запазването на нови инциденти може да не успее.';

  @override
  String get clipsMissingFile => 'Липсва файл';

  @override
  String get clipsEmergencyBadge => 'Удар';

  @override
  String clipsUntitled(String date) {
    return 'Инцидент · $date';
  }

  @override
  String get clipsAudio => 'Със звук';

  @override
  String get clipsFavorite => 'Любим';

  @override
  String get clipsUnfavorite => 'Премахни от любимите';

  @override
  String get clipsLocation => 'Местоположението е запазено';

  @override
  String clipsOpenClip(String title) {
    return 'Отвори клип $title';
  }

  @override
  String get playerNotFoundTitle => 'Клипът не е намерен';

  @override
  String get playerNotFoundBody => 'Възможно е този клип да е бил изтрит.';

  @override
  String get playerMissingTitle => 'Видеофайлът липсва';

  @override
  String get playerMissingBody =>
      'Записът на този клип вече не е на вашия iPhone. Можете да премахнете записа от галерията си.';

  @override
  String get playerRemoveEntry => 'Премахни записа';

  @override
  String get playerLoadError => 'Това видео не може да се възпроизведе.';

  @override
  String get playerPlay => 'Възпроизвеждане';

  @override
  String get playerPause => 'Пауза';

  @override
  String get playerReplay => 'Повторно възпроизвеждане';

  @override
  String get playerRenameTitle => 'Преименуване на клип';

  @override
  String get playerRenameHint => 'Име на клипа';

  @override
  String get playerRenamed => 'Клипът е преименуван';

  @override
  String get playerFavorited => 'Добавен към любимите';

  @override
  String get playerUnfavorited => 'Премахнат от любимите';

  @override
  String get playerShareFailed => 'Този клип не можа да бъде споделен.';

  @override
  String get playerDetails => 'Подробности';

  @override
  String get playerDate => 'Записан';

  @override
  String get playerDuration => 'Продължителност';

  @override
  String get playerResolution => 'Резолюция';

  @override
  String get playerSize => 'Размер на файла';

  @override
  String get playerAudio => 'Звук';

  @override
  String get playerAudioYes => 'Записан';

  @override
  String get playerAudioNo => 'Не е записан';

  @override
  String get playerReason => 'Запазен чрез';

  @override
  String get playerReasonManual => 'Бутон „Запази инцидент“';

  @override
  String get playerReasonEmergency => 'Възможно разпознат удар';

  @override
  String get playerReasonRecovered => 'Възстановен след прекъсване';

  @override
  String get playerSpeed => 'GPS скорост при запазване';

  @override
  String get playerLocation => 'Местоположение';

  @override
  String get playerOpenInMaps => 'Отвори в Карти';

  @override
  String get playerBack => 'Назад';

  @override
  String get playerMore => 'Още действия';

  @override
  String get clipsFilterLabel => 'Показване';

  @override
  String get clipsFilterAll => 'Всички';

  @override
  String get clipsFilterRecordings => 'Записи';

  @override
  String get clipsFilterIncidents => 'Инциденти';

  @override
  String get clipsFilterEmergency => 'Спешни';

  @override
  String get clipsFilterFavorites => 'Любими';

  @override
  String get clipsSort => 'Сортиране';

  @override
  String get clipsSortNewest => 'Първо най-новите';

  @override
  String get clipsSortOldest => 'Първо най-старите';

  @override
  String get clipsSortLongest => 'Първо най-дългите';

  @override
  String get clipsSortLargest => 'Първо най-големите';

  @override
  String get clipsToday => 'Днес';

  @override
  String get clipsYesterday => 'Вчера';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа',
      one: '1 клип',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Все още няма клипове в тази категория.';

  @override
  String get clipsFavoritesEmpty =>
      'Отбележете клип със звезда, за да го държите тук за бърз достъп.';

  @override
  String get clipsKindRecording => 'Запис';

  @override
  String get clipsKindIncident => 'Инцидент';

  @override
  String get clipsKindEmergency => 'Спешен случай';

  @override
  String get clipsKindTest => 'Тест';

  @override
  String clipsTripChip(String time) {
    return 'Пътуване · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Отваряне на пътуването, в което е записан този клип';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used заети · $free свободни';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Клиповете заемат $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записа',
      one: '1 запис',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count инцидента',
      one: '1 инцидент',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count спешни случая',
      one: '1 спешен случай',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Освобождаване на място';

  @override
  String get clipsStorageLowGentle =>
      'Остават по-малко от 2 GB свободно място. За да записвате безпроблемно, освободете място или изтрийте клипове, от които вече не се нуждаете.';

  @override
  String get clipsSaveToPhotos => 'Запази в Снимки';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа',
      one: '1 клип',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Да се изтрият ли $count клипа ($size)?',
      one: 'Да се изтрие ли този клип ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Запазване на $done от $total в Снимки…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа са запазени в Снимки',
      one: 'Запазено в Снимки',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved запазени в Снимки · $failed не можаха да се запазят';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista няма разрешение да добавя видеа в Снимки. Можете да го разрешите в Настройки.';

  @override
  String get clipsPhotosFailed => 'Запазването в Снимки не е възможно.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа са добавени към любимите',
      one: 'Добавен към любимите',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа са премахнати от любимите',
      one: 'Премахнат от любимите',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (изрязан)';
  }

  @override
  String get playerTrim => 'Изрязване';

  @override
  String get playerInfo => 'Информация';

  @override
  String get playerKind => 'Тип';

  @override
  String get playerReasonRecording => 'Бутон за запис';

  @override
  String get trimTitle => 'Изрязване на клип';

  @override
  String get trimHint =>
      'Плъзнете манипулаторите, за да изберете частта, която да запазите. Оригиналният клип остава непроменен.';

  @override
  String get trimStartHandle => 'Начало на изрязването';

  @override
  String get trimEndHandle => 'Край на изрязването';

  @override
  String trimSelection(String duration) {
    return 'Избрани: $duration';
  }

  @override
  String get trimSave => 'Запази като нов клип';

  @override
  String get trimSaving => 'Запазване на изрязания клип…';

  @override
  String get trimSaved => 'Изрязаният клип е запазен';

  @override
  String get trimOpenNew => 'Отвори';

  @override
  String get trimFailed => 'Този клип не можа да бъде изрязан.';

  @override
  String get trimStorageFull =>
      'Няма достатъчно свободно място за запазване на изрязания клип.';

  @override
  String get trimPreview => 'Пусни избраното';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsSectionCamera => 'Камера';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Предупреждения';

  @override
  String get settingsSectionAlertCategories => 'Категории предупреждения';

  @override
  String get settingsSectionRecording => 'Запис';

  @override
  String get settingsSectionDriving => 'Шофиране';

  @override
  String get settingsSectionPower => 'Захранване';

  @override
  String get settingsSectionEmergency => 'Спешни случаи';

  @override
  String get settingsSectionAppearance => 'Външен вид';

  @override
  String get settingsSectionLanguage => 'Език';

  @override
  String get settingsSectionInformation => 'Информация';

  @override
  String get settingsCameraLens => 'Обектив на камерата';

  @override
  String get settingsLensWide => 'Широкоъгълен';

  @override
  String get settingsLensUltraWide => 'Свръхширокоъгълен';

  @override
  String get settingsLensTelephoto => 'Телеобектив';

  @override
  String get settingsLensUnavailable => 'Не е наличен на този iPhone';

  @override
  String get settingsStabilization => 'Стабилизация';

  @override
  String get settingsStabAuto => 'Автоматична';

  @override
  String get settingsStabOff => 'Изкл.';

  @override
  String get settingsStabStandard => 'Стандартна';

  @override
  String get settingsStabCinematic => 'Кинематографична';

  @override
  String get settingsOverlayOpacity => 'Непрозрачност на наслагването';

  @override
  String get settingsShowFps => 'Показвай статистика за производителността';

  @override
  String get settingsShowFpsSubtitle =>
      'Кадрова честота и време за обработка в изгледа за разпознаване';

  @override
  String get settingsCameraFooter =>
      'Промените в обектива и стабилизацията се прилагат при следващото стартиране на камерата.';

  @override
  String get settingsAiModel => 'AI модел';

  @override
  String get settingsConfidence => 'Праг на сигурност при разпознаване';

  @override
  String get settingsTracking => 'Проследяване на обекти';

  @override
  String get settingsTrackingSubtitle =>
      'Задържа обектите стабилни между кадрите';

  @override
  String get settingsShowLabels => 'Показвай етикети';

  @override
  String get settingsShowConfidence => 'Показвай сигурността';

  @override
  String get settingsSegmentationOpacity =>
      'Непрозрачност на маската за възприятие';

  @override
  String get settingsAiFooter =>
      'По-нисък праг показва повече обекти, но и повече грешни разпознавания. Разпознаванията може да са неточни.';

  @override
  String get settingsVoiceAlerts => 'Гласови предупреждения';

  @override
  String get settingsVoiceLanguage => 'Език на гласа';

  @override
  String get settingsVoiceLanguageAuto => 'Като езика на приложението';

  @override
  String get settingsVoice => 'Глас';

  @override
  String get settingsVoiceDefault => 'По подразбиране в системата';

  @override
  String get settingsVoiceQualityEnhanced => 'Подобрено';

  @override
  String get settingsVoiceQualityPremium => 'Високо качество';

  @override
  String get settingsNoVoices =>
      'За този език няма инсталиран глас. Добавете такъв в настройките на iOS › Достъпност › Изговаряне на съдържание.';

  @override
  String get settingsAlertPedestrian => 'Пешеходци';

  @override
  String get settingsAlertCyclist => 'Велосипедисти';

  @override
  String get settingsAlertMotorcycle => 'Мотоциклети';

  @override
  String get settingsAlertBus => 'Автобуси';

  @override
  String get settingsAlertVehicleClose =>
      'Превозно средство много близо отпред';

  @override
  String get settingsAlertTrafficLight => 'Промени на светофара';

  @override
  String get settingsAlertTrafficMoving => 'Движение на трафика напред';

  @override
  String get settingsAlertStopSign => 'Знаци „Стоп“';

  @override
  String get settingsSensitivity => 'Чувствителност';

  @override
  String get settingsSensitivityLow => 'Ниска';

  @override
  String get settingsSensitivityMedium => 'Средна';

  @override
  String get settingsSensitivityHigh => 'Висока';

  @override
  String get settingsCooldown => 'Интервал на повторение';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds сек';
  }

  @override
  String get settingsVolume => 'Сила на гласа';

  @override
  String get settingsQuietMode => 'Тих режим';

  @override
  String get settingsQuietModeSubtitle =>
      'Изговарят се само най-важните предупреждения';

  @override
  String get settingsTestVoice => 'Тест на гласа';

  @override
  String get settingsTestVoiceDone =>
      'Възпроизвеждане на примерно предупреждение…';

  @override
  String get settingsParkingBeeps => 'Звукови сигнали при паркиране';

  @override
  String get settingsBeepVolume => 'Сила на сигналите';

  @override
  String get settingsAlertsFooter =>
      'Предупрежденията са само помощно средство. Следете винаги пътя — тишината не означава, че пътят е свободен.';

  @override
  String get settingsRecordingProfile => 'Качество на записа';

  @override
  String get settingsProfileStandard => 'Стандартно · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Буфер за инциденти';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds секунди';
  }

  @override
  String get settingsManualMaxLength =>
      'Максимална продължителност на ръчния запис';

  @override
  String get settingsManualMaxUnlimited => 'Без ограничение';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String get settingsRecordAudio => 'Записване на звук';

  @override
  String get settingsRecordAudioSubtitle =>
      'Включва звука от купето в запазените инциденти';

  @override
  String get settingsMicDenied =>
      'Достъпът до микрофона е изключен. Разрешете го в Настройки, за да се записва звук.';

  @override
  String get settingsWatermark => 'Воден знак на Corvista';

  @override
  String get settingsTimestamp => 'Отпечатък с дата и час';

  @override
  String get settingsSaveLocation => 'Запазвай местоположението с клиповете';

  @override
  String get settingsStorage => 'Памет и клипове';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа',
      one: '1 клип',
      zero: 'Няма клипове',
    );
    return '$_temp0 · $used заети · $free свободни';
  }

  @override
  String get settingsRecordingFooter =>
      'Непрекъснатият буфер остава на вашия iPhone и се презаписва постоянно. Нищо не се записва във фонов режим.';

  @override
  String get settingsDefaultView => 'Изглед по подразбиране';

  @override
  String get settingsUnits => 'Мерни единици';

  @override
  String get settingsShowCompass => 'Показвай компас';

  @override
  String get settingsHudStyle => 'Стил на HUD';

  @override
  String get settingsHudCustomize => 'Персонализиране на HUD';

  @override
  String get settingsDrivingSide => 'Страна на движение';

  @override
  String get settingsDrivingSideAuto => 'Автоматично';

  @override
  String get settingsDrivingSideRight => 'Дясно';

  @override
  String get settingsDrivingSideLeft => 'Ляво';

  @override
  String get settingsVirtualStyle => 'Стил на виртуалния изглед';

  @override
  String get settingsVirtualMinimal => 'Минимален';

  @override
  String get settingsVirtualPerspective => 'Перспектива';

  @override
  String get settingsVirtualHighContrast => 'Висок контраст';

  @override
  String get settingsKeepScreenOn => 'Дръж екрана включен при шофиране';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Показвай навигационните указания на заключения екран и в Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Записът е на пауза, докато Corvista беше във фонов режим';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'На пауза';

  @override
  String get liveActivityDashcamOff => 'Камера изкл.';

  @override
  String get liveActivityEnded => 'Навигацията приключи';

  @override
  String get liveActivityEta => 'Пристигане';

  @override
  String get settingsAutoRecenter => 'Автоматично центриране на картата';

  @override
  String get settingsHudStyleClassic => 'Класически';

  @override
  String get settingsHudStyleGrid => 'Мрежа';

  @override
  String get settingsHudStyleMinimal => 'Минимален';

  @override
  String get settingsHudStylePerformance => 'Производителност';

  @override
  String get settingsHudStyleNavigation => 'Навигация';

  @override
  String get settingsHudStyleNight => 'Нощен';

  @override
  String get settingsHudStyleHighContrast => 'Висок контраст';

  @override
  String get settingsPowerMode => 'Режим на захранване';

  @override
  String get settingsPowerBalanced => 'Балансиран';

  @override
  String get settingsPowerPerformance => 'Производителност';

  @override
  String get settingsPowerSaver => 'Икономичен';

  @override
  String get settingsPowerFooter =>
      'Corvista автоматично намалява честотата на AI и визуалните ефекти, когато iPhone се загрее или батерията е слаба.';

  @override
  String get settingsThermal => 'Температурно състояние';

  @override
  String get settingsThermalNominal => 'Нормално';

  @override
  String get settingsThermalFair => 'Топло';

  @override
  String get settingsThermalSerious => 'Горещо';

  @override
  String get settingsThermalCritical => 'Критично';

  @override
  String get settingsBattery => 'Батерия';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Зарежда се';
  }

  @override
  String get settingsLowPowerMode =>
      'Режимът на ниска мощност е включен — AI работи с намалена честота.';

  @override
  String get settingsAiRate => 'Текуща честота на AI';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Разпознаване на удар';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Вкл. · обратно броене $seconds сек';
  }

  @override
  String get settingsEmergencyFooter =>
      'Експериментална функция. Не замества спешните служби.';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get settingsThemeSystem => 'Системна';

  @override
  String get settingsThemeDark => 'Тъмна';

  @override
  String get settingsThemeLight => 'Светла';

  @override
  String get settingsReduceMotion => 'Намаляване на движението';

  @override
  String get settingsReduceMotionSubtitle =>
      'Свежда анимациите в приложението до минимум';

  @override
  String get settingsAppLanguage => 'Език на приложението';

  @override
  String get settingsPrivacyPolicy => 'Политика за поверителност';

  @override
  String get settingsTerms => 'Условия за ползване';

  @override
  String get settingsHelp => 'Помощ';

  @override
  String get settingsSupport => 'Връзка с поддръжката';

  @override
  String get settingsLicenses => 'Лицензи за отворен код';

  @override
  String get settingsSupportUnavailable =>
      'Mail не можа да се отвори. Пишете на support@corvista.app.';

  @override
  String get settingsSafety => 'Информация за безопасност';

  @override
  String get settingsDiagnostics => 'Диагностика';

  @override
  String get settingsVersion => 'Версия';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Персонализиране на HUD';

  @override
  String get hudCustomPreview => 'Преглед · примерни стойности';

  @override
  String get hudCustomStyle => 'Стил';

  @override
  String get hudCustomElements => 'Елементи';

  @override
  String get hudCustomSpeed => 'Скорост';

  @override
  String get hudCustomHeading => 'Посока и компас';

  @override
  String get hudCustomClock => 'Часовник';

  @override
  String get hudCustomBattery => 'Батерия и температура';

  @override
  String get hudCustomDetections => 'Състояние на AI и разпознавания';

  @override
  String get hudCustomWeather => 'Времето';

  @override
  String get hudCustomAppearance => 'Размер и непрозрачност';

  @override
  String get hudCustomSize => 'Размер';

  @override
  String get hudCustomOpacity => 'Непрозрачност';

  @override
  String get hudCustomFooter =>
      'Предупреждения като прегряване се показват винаги, дори когато елементите са скрити.';

  @override
  String get hudCustomDescClassic => 'Балансирано табло с уреди';

  @override
  String get hudCustomDescGrid => 'Перспективна мрежа над пътя';

  @override
  String get hudCustomDescMinimal => 'Само скорост, нищо друго';

  @override
  String get hudCustomDescPerformance =>
      'Дъга за скоростта с показания на живо';

  @override
  String get hudCustomDescNavigation => 'Първо следващата маневра';

  @override
  String get hudCustomDescNight =>
      'Приглушен, с червеникав нюанс за нощно шофиране';

  @override
  String get hudCustomDescHighContrast =>
      'Максимална четливост на силно слънце';

  @override
  String get languageTitle => 'Език';

  @override
  String get languageSystem => 'По подразбиране в системата';

  @override
  String get languageSystemSubtitle => 'Следва езика на вашия iPhone';

  @override
  String get languageFooter =>
      'Предстоят още езици. Езикът на гласовите предупреждения може да се зададе отделно в Предупреждения.';

  @override
  String get diagTitle => 'Диагностика';

  @override
  String get diagPerformance => 'Производителност';

  @override
  String get diagInference => 'Време за обработка';

  @override
  String get diagDetectHz => 'Честота на разпознаване';

  @override
  String get diagCameraFps => 'Кадрова честота на камерата';

  @override
  String get diagMemory => 'Памет';

  @override
  String get diagDropped => 'Пропуснати кадри';

  @override
  String get diagSegmentation => 'Време за сегментиране';

  @override
  String get diagCamera => 'Камера';

  @override
  String get diagStatus => 'Състояние';

  @override
  String get diagSource => 'Източник';

  @override
  String get diagSourceCamera => 'Камера на живо';

  @override
  String get diagSourceFile => 'Тестов видеофайл';

  @override
  String get diagResolution => 'Размер на буфера';

  @override
  String get diagLens => 'Обектив';

  @override
  String get diagError => 'Последна грешка';

  @override
  String get diagModel => 'AI модел';

  @override
  String get diagModelLoad => 'Време за зареждане на модела';

  @override
  String get diagPower => 'Захранване';

  @override
  String get diagSegHz => 'Честота на сегментиране';

  @override
  String get diagReduced => 'Намалени ефекти';

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
  String get diagCamIdle => 'Неактивна';

  @override
  String get diagCamStarting => 'Стартира';

  @override
  String get diagCamRunning => 'Работи';

  @override
  String get diagCamInterrupted => 'Прекъсната';

  @override
  String get diagCamStopped => 'Спряна';

  @override
  String get diagCamUnavailable => 'Недостъпна';

  @override
  String get diagCamPermissionDenied => 'Достъпът е отказан';

  @override
  String get diagCamError => 'Грешка';

  @override
  String get diagTestFootage => 'Тестов видеозапис';

  @override
  String get diagTestFootageBody =>
      'Изпълнявайте реално разпознаване на устройството върху локален видеофайл вместо камерата. Всеки изглед го отбелязва като ТЕСТОВ ВИДЕОЗАПИС.';

  @override
  String get diagPathLabel => 'Път до видеофайла';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Използвай Documents/test_drive.mp4';

  @override
  String get diagRun => 'Пусни тестов видеозапис';

  @override
  String get diagRunStarted =>
      'Тестовият видеозапис стартира. Отворете изгледа за шофиране, за да го видите.';

  @override
  String get diagBackToCamera => 'Връщане към камерата на живо';

  @override
  String get diagDebugOnly =>
      'Тестовият видеозапис е наличен само в разработчески версии.';

  @override
  String get diagFileMissing => 'На този път няма файл.';

  @override
  String get emergencySetupTitle => 'Разпознаване на удар';

  @override
  String get emergencyExperimental => 'Експериментално';

  @override
  String get emergencyIntro =>
      'Докато шофирате, Corvista може да следи за възможен тежък удар чрез сензорите за движение на вашия iPhone. Ако бъде засечен такъв, започва обратно броене. Ако не го отмените, Corvista предлага да се обадите на спешните служби и да изпратите съобщение на контактите си.';

  @override
  String get emergencyDisclaimer1 =>
      'Не замества спешните служби, нито собствената система за засичане на катастрофи на автомобила.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS винаги изисква потвърждение, преди да се осъществи обаждане или да се изпрати съобщение.';

  @override
  String get emergencyDisclaimer3 =>
      'Удари може да бъдат пропуснати, а рязкото спиране или неравностите може да бъдат сбъркани с удар.';

  @override
  String get emergencyParkedWarning =>
      'Завършете тази настройка при паркирано превозно средство. Настройките са заключени, докато превозното средство се движи.';

  @override
  String get emergencyEnable => 'Включване на разпознаването на удар';

  @override
  String get emergencyEnableSubtitle => 'Активно само по време на пътуване';

  @override
  String get emergencyNeedNumber => 'Първо добавете спешен номер.';

  @override
  String get emergencyContacts => 'Спешни контакти';

  @override
  String get emergencyAddContact => 'Добави контакт';

  @override
  String get emergencyNoContacts =>
      'Все още няма контакти. Контактите получават съобщение само след като го потвърдите.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Да се премахне ли $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Няма да бъде предлаган като получател след удар.';

  @override
  String get emergencyRemove => 'Премахни';

  @override
  String get emergencyContactsError => 'Контактите не можаха да се заредят.';

  @override
  String get emergencyNumber => 'Спешен номер';

  @override
  String get emergencyNumberHint => 'напр. 112 или 911';

  @override
  String get emergencyMessage => 'Шаблон на съобщението';

  @override
  String get emergencyMessageDefault =>
      'Възможно е да съм участвал в пътен инцидент. Това съобщение е подготвено от Corvista и включва последното ми известно местоположение, ако е налично.';

  @override
  String get emergencyMessageHint =>
      'Оставете празно, за да се използва съобщението по подразбиране.';

  @override
  String get emergencyCountdown => 'Продължителност на обратното броене';

  @override
  String get emergencyVoiceCancel => 'Отмяна с глас';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Кажете „Добре съм“ или „Отказ“ по време на обратното броене. Използва разпознаване на реч на устройството, където е налично.';

  @override
  String get emergencyVoicePermDenied =>
      'За отмяна с глас е нужен достъп до микрофона и до разпознаването на реч.';

  @override
  String get emergencyAutoSave => 'Автоматично запазване на клип на инцидента';

  @override
  String get emergencyTest => 'Тест на обратното броене (без обаждане)';

  @override
  String get emergencyTestBody =>
      'Пуска симулиран удар, за да видите обратното броене. В тестов режим никога не се осъществява обаждане и не се изпраща съобщение.';

  @override
  String get emergencyNotSet => 'Не е зададен';

  @override
  String get emergencyAlertHeadline => 'Засечен е възможен тежък удар.';

  @override
  String get emergencyAlertSubtitle => 'Добре ли сте?';

  @override
  String get emergencyAlertCancel => 'Добре съм — Отказ';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Остават $seconds секунди',
      one: 'Остава 1 секунда',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => 'Слушам — кажете „Добре съм“ за отмяна';

  @override
  String emergencyAlertHeard(String text) {
    return 'Чух: „$text“';
  }

  @override
  String get emergencyAlertEscalated =>
      'Няма отговор. Изберете какво да се направи:';

  @override
  String get emergencyAlertCall => 'Обаждане на спешните служби';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Набира $number. iOS ще поиска потвърждение.';
  }

  @override
  String get emergencyAlertMessage => 'Съобщение до контактите';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Отваря подготвено съобщение. Вие решавате дали да го изпратите.';

  @override
  String get emergencyAlertTestMode =>
      'Тестов режим — няма да се осъществи обаждане';

  @override
  String get emergencyAlertTestBadge => 'ТЕСТ';

  @override
  String get emergencyAlertClose => 'Добре съм — Затвори';

  @override
  String get emergencyMsgSent => 'Съобщението е изпратено.';

  @override
  String get emergencyMsgCancelled => 'Съобщението не е изпратено.';

  @override
  String get emergencyMsgFailed => 'Съобщението не можа да бъде изпратено.';

  @override
  String get emergencyMsgUnavailable =>
      'Съобщенията не са налични на това устройство.';

  @override
  String emergencyCallFailed(String number) {
    return 'Обаждането не можа да започне. Наберете $number сами.';
  }

  @override
  String get modelsTitle => 'AI модели';

  @override
  String get modelsIntro =>
      'Всички модели са включени в приложението и работят изцяло на вашия iPhone. Образът от камерата никога не напуска устройството.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'На живо: $ms ms на кадър · $hz разпознавания/сек';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Зареден за $ms ms';
  }

  @override
  String get modelsEfficientName => 'Ефективен';

  @override
  String get modelsEfficientDesc =>
      'Бърз и компактен детектор за дълги пътувания с ниско нагряване и разход на батерия.';

  @override
  String get modelsEnhancedName => 'Подобрен';

  @override
  String get modelsEnhancedDesc =>
      'По-голям детектор, който открива по-малки и по-далечни обекти, при по-висок разход на енергия.';

  @override
  String get modelsSegmentationName => 'Сегментиране';

  @override
  String get modelsSegmentationDesc =>
      'Съчетава бързо разпознаване с маски на пътната настилка и обектите за изгледа „Възприятие“.';

  @override
  String get modelsNoneName => 'AI на пауза';

  @override
  String get modelsNoneDesc =>
      'Камерата и записът продължават без разпознаване на обекти. Най-нисък разход на енергия.';

  @override
  String get modelsGenericDesc =>
      'Модел за разпознаване на обекти на устройството.';

  @override
  String get modelsFunctionDetection =>
      'Разпознава превозни средства, хора, велосипеди, мотоциклети, автобуси, светофари и знаци „Стоп“';

  @override
  String get modelsFunctionSegmentation =>
      'Добавя маски на пътната настилка и обектите';

  @override
  String get modelsFunctionNone =>
      'Без разпознаване; само запис на видеорегистратор';

  @override
  String get modelsSize => 'Размер';

  @override
  String get modelsInput => 'Вход';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Работи с';

  @override
  String get modelsStatusInstalled => 'Инсталиран (вграден)';

  @override
  String get modelsStatusNotInstalled => 'Не е инсталиран';

  @override
  String get modelsSelected => 'Избран';

  @override
  String get modelsUse => 'Използвай този модел';

  @override
  String get modelsSwitching => 'Зареждане на модела…';

  @override
  String modelsSwitched(String name) {
    return '$name вече е активен';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Измерено на това устройство: средно $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Не е измерено на това устройство';

  @override
  String get modelsBenchmarkRun => 'Пусни тест за производителност';

  @override
  String get modelsBenchmarkRunning => 'Измерване на производителността…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Изберете този модел, за да го тествате.';

  @override
  String get modelsBenchmarkDone => 'Тестът приключи';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Тестът не успя: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Последна актуализация: $date';
  }

  @override
  String get safetyTitle => 'Информация за безопасност';

  @override
  String get safetyIntro =>
      'Corvista е помощно средство за вниманието при шофиране. Не управлява вашето превозно средство и не може да замести вашето внимание, преценка или системите за безопасност на автомобила.';

  @override
  String get safetyBeforeTitle => 'Преди да потеглите';

  @override
  String get safetyBefore1 =>
      'Закрепете iPhone стабилно на законно място, което не пречи на видимостта, въздушните възглавници или органите за управление.';

  @override
  String get safetyBefore2 =>
      'Завършете настройката, изберете изглед и задайте дестинация, докато сте паркирани.';

  @override
  String get safetyBefore3 =>
      'Свържете зарядно устройство при по-дълги пътувания и по възможност пазете телефона от директна слънчева светлина.';

  @override
  String get safetyWhileTitle => 'Докато шофирате';

  @override
  String get safetyWhile1 =>
      'Дръжте погледа си на пътя. Използвайте големите контроли на екрана само когато е безопасно и разрешено.';

  @override
  String get safetyWhile2 =>
      'Предупрежденията са помощни средства, не предупреждения, на които можете да разчитате. Тишината никога не означава, че пътят е свободен.';

  @override
  String get safetyWhile3 =>
      'Спазвайте правилата за движение, сигналите и пътните знаци — а не приложението — когато те не съвпадат.';

  @override
  String get safetyLimitsTitle => 'Ограничения';

  @override
  String get safetyLimits1 =>
      'Камерата на един телефон вижда само това, което е пред нея. Обекти извън полезрението, скрити или много близо не се разпознават.';

  @override
  String get safetyLimits2 =>
      'Разпознаванията може да бъдат пропуснати, закъснели или грешни, особено нощем, в дъжд, мъгла, при отблясъци или с мръсно предно стъкло.';

  @override
  String get safetyLimits3 =>
      'Разпознават се само поддържаните категории: превозни средства, автобуси, мотоциклети, велосипеди, хора, светофари и знаци „Стоп“. Линиите на лентите във виртуалния изглед са илюстративни, а не разпознати ленти.';

  @override
  String get safetyLimits4 =>
      'Близостта се показва като приблизителни зони (Много близо, Близо, На средно разстояние, Далече), никога като измерени разстояния. Изгледът за паркиране не замества парктроника.';

  @override
  String get safetyHeatTitle => 'Нагряване и батерия';

  @override
  String get safetyHeat1 =>
      'Непрекъснатото използване на камерата и AI загрява вашия iPhone. Corvista намалява честотата на анализ, когато устройството се нагрее, и показва предупреждение; ако iOS прегрее, камерата може да спре.';

  @override
  String get safetyEmergencyTitle => 'Функция за спешни случаи';

  @override
  String get safetyEmergency1 =>
      'Разпознаването на възможен удар е експериментално. Може да пропусне реални катастрофи и да бъде задействано от други събития.';

  @override
  String get safetyEmergency2 =>
      'Никога не се свързва с никого тайно: iOS винаги изисква потвърждение за обаждане или съобщение. Не замества самостоятелното обаждане до спешните служби.';

  @override
  String get privacyTitle => 'Поверителност';

  @override
  String get privacyIntro =>
      'Corvista е създадено така, че данните ви от шофиране да останат на вашия iPhone. Няма акаунт в Corvista и Corvista не поддържа собствени сървъри.';

  @override
  String get privacyCameraTitle => 'Камера и AI';

  @override
  String get privacyCamera1 =>
      'Разпознаването, проследяването и сегментирането на обекти се извършват изцяло на вашия iPhone. Кадрите от камерата никога не се качват.';

  @override
  String get privacyCamera2 =>
      'Камерата работи само докато Corvista е отворено на екрана. Спира, когато приложението премине във фонов режим — няма скрит фонов запис.';

  @override
  String get privacyRecordingsTitle => 'Записи';

  @override
  String get privacyRecordings1 =>
      'Непрекъснатият буфер е временен и се презаписва постоянно. Видеото се пази само когато докоснете „Запази инцидент“ или, ако сте го включили, след възможен удар.';

  @override
  String get privacyRecordings2 =>
      'Запазените клипове остават в личното хранилище на Corvista на вашия iPhone. Напускат устройството само когато изберете „Споделяне“. Изтриването на приложението ги изтрива.';

  @override
  String get privacyRecordings3 =>
      'Звукът се записва само ако го включите и дадете достъп до микрофона.';

  @override
  String get privacyLocationTitle => 'Местоположение';

  @override
  String get privacyLocation1 =>
      'Местоположението се използва, докато приложението е отворено, за скоростта, картата, маршрутите и времето. Ако „Запази местоположението“ е включено, позицията в момента на запазване се съхранява с клипа на вашето устройство.';

  @override
  String get privacyNetworkTitle => 'Мрежови услуги';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — показване на картата, търсене на места и маршрути. Търсеният от вас текст и приблизителното ви местоположение се изпращат на Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — текущо и почасово време за вашето местоположение.';

  @override
  String get privacyNetwork4 =>
      'Corvista не съдържа реклами, нито анализи или проследяване от трети страни.';

  @override
  String get privacyEmergencyTitle => 'Спешни контакти';

  @override
  String get privacyEmergency1 =>
      'Избраните от вас контакти се съхраняват в iOS Keychain на това устройство. Отмяната с глас използва разпознаване на реч на устройството, където е налично. Обаждания и съобщения се изпращат само след като ги потвърдите в iOS.';

  @override
  String get privacyControlsTitle => 'Вашите контроли';

  @override
  String get privacyControls1 =>
      'Можете да изтривате клипове по всяко време в Клипове и да променяте или отнемате достъпа до камерата, микрофона, местоположението и речта в настройките на iOS.';

  @override
  String get termsTitle => 'Условия за ползване';

  @override
  String get termsIntro =>
      'С използването на Corvista приемате тези условия. Прилага се и стандартното Лицензионно споразумение с крайния потребител за лицензирани приложения на Apple.';

  @override
  String get termsUseTitle => 'Използване на Corvista';

  @override
  String get termsUse1 =>
      'Corvista е помощно средство за вниманието при шофиране и видеорегистратор. Вие оставате изцяло отговорни за безопасното и законосъобразно шофиране по всяко време.';

  @override
  String get termsUse2 =>
      'Не използвайте приложението по начини, които ви разсейват по време на шофиране. Закрепете устройството стабилно и законосъобразно.';

  @override
  String get termsAccuracyTitle => 'Без гаранции за точност';

  @override
  String get termsAccuracy1 =>
      'Разпознаванията, зоните, предупрежденията, маркерите на картата, маршрутите и времето може да са непълни, закъснели или грешни. Corvista не управлява вашето превозно средство.';

  @override
  String get termsAccuracy2 =>
      'Функцията за спешни случаи е експериментална и може да не засече удар или да се задейства погрешно.';

  @override
  String get termsRecordingTitle => 'Закони за записването';

  @override
  String get termsRecording1 =>
      'Законите за видеорегистраторите, записа на звук и заснемането на хора се различават по държави и региони. Вие отговаряте за спазването им, включително когато споделяте клипове.';

  @override
  String get termsLiabilityTitle => 'Отговорност';

  @override
  String get termsLiability1 =>
      'Приложението се предоставя „както е“. Доколкото законът позволява, разработчикът не носи отговорност за произшествия, загуби, глоби или вреди, произтичащи от използването му или от доверие в резултатите му.';

  @override
  String get termsChangesTitle => 'Промени';

  @override
  String get termsChanges1 =>
      'Тези условия може да бъдат актуализирани с нови версии на приложението. Продължаването на ползването след актуализация означава, че приемате променените условия.';

  @override
  String get helpTitle => 'Помощ';

  @override
  String get helpIntro =>
      'Отговори на често задавани въпроси. За насоки за безопасност вижте Информация за безопасност.';

  @override
  String get helpQSave => 'Как да запазя видеото от инцидент?';

  @override
  String get helpASaveBuffer =>
      'Докоснете големия бутон „Запази инцидент“ в изгледа за шофиране. Corvista запазва в Клипове последните 20 или 30 секунди от непрекъснатия си буфер (по ваш избор в Настройки › Запис).';

  @override
  String get helpQWhere => 'Къде се съхраняват клиповете ми?';

  @override
  String get helpAWhere =>
      'В личното хранилище на Corvista на вашия iPhone. Никога не се качват. Използвайте „Споделяне“ в плейъра, за да изпратите или експортирате клип.';

  @override
  String get helpQZones => 'Колко точни са зоните за близост?';

  @override
  String get helpAZones =>
      'Зоните са груби оценки от една камера по типични размери на обектите. Приемайте ги като приблизителни подсказки, а не като разстояния.';

  @override
  String get helpQSlow => 'Защо разпознаването се забавя?';

  @override
  String get helpASlow =>
      'Когато iPhone се загрее, батерията е слаба или е включен режимът на ниска мощност, Corvista намалява честотата на анализ, за да защити устройството. Можете да смените режима на захранване в Настройки.';

  @override
  String get helpQMap => 'Картата, търсенето или времето не работят.';

  @override
  String get helpAMap =>
      'Тези функции изискват интернет връзка и достъп до местоположението. Проверете връзката си и разрешете местоположението за Corvista в настройките на iOS.';

  @override
  String get helpQSimulator => 'Камерата е показана като недостъпна.';

  @override
  String get helpASimulator =>
      'Уверете се, че достъпът до камерата е разрешен в настройките на iOS и че друго приложение не ползва камерата. В iOS Simulator няма камера; вместо това може да се използва локално тестово видео.';

  @override
  String get emergencyMsgNoContacts => 'Първо добавете спешен контакт.';

  @override
  String get cameraStarting => 'Камерата стартира…';

  @override
  String get cameraInterrupted => 'Камерата е на пауза';

  @override
  String get cameraInterruptedBody =>
      'iOS постави камерата на пауза, например по време на разговор или когато друго приложение я използва. Ще продължи автоматично.';

  @override
  String get cameraUnavailable => 'Камерата не е налична';

  @override
  String get cameraUnavailableBody =>
      'На това устройство няма налична камера. Изгледите за разпознаване, запис и паркиране изискват задната камера.';

  @override
  String get cameraRunTestFootage => 'Пусни тестов видеозапис';

  @override
  String get cameraPermissionDenied => 'Достъпът до камерата е изключен';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista се нуждае от камерата за разпознаване, запис на видеорегистратор и изгледите за паркиране. Включете достъпа до камерата в Настройки.';

  @override
  String get cameraError => 'Грешка в камерата';

  @override
  String get cameraStopped => 'Камерата е спряна';

  @override
  String get cameraStart => 'Стартирай камерата';

  @override
  String get cameraFocusHint => 'Докоснете за фокусиране';

  @override
  String get cameraPreviewLabel =>
      'Изглед от камерата на живо с разпознати обекти';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Камера $fps fps · AI $hz Hz · $ms ms · пропуснати $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Скорост $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Няма GPS скорост';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Посока $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $secondsс';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Запис в буфера на видеорегистратора, $seconds от $target секунди в буфера';
  }

  @override
  String get hudRecIdle => 'REC изкл.';

  @override
  String get hudRecSaving => 'Запазване…';

  @override
  String get hudRecError => 'Грешка в REC';

  @override
  String get hudAiPaused => 'AI на пауза';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count обекта',
      one: '1 обект',
      zero: 'Няма обекти',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count разпознати обекта',
      one: '1 разпознат обект',
      zero: 'няма разпознати обекти',
    );
    return 'AI модел $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Горещо — AI е забавен';

  @override
  String get hudThermalCritical => 'Твърде горещо — AI е на пауза';

  @override
  String hudBatteryLow(String percent) {
    return 'Батерия $percent';
  }

  @override
  String get hudLowPower => 'Режим на ниска мощност';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Времето $temperature, $condition. Докоснете за подробности.';
  }

  @override
  String get hudNoGuidance =>
      'Потърсете дестинация в изгледа „Карта“, за да виждате тук навигационни указания.';

  @override
  String get navArrived => 'Пристигнахте';

  @override
  String get navRerouting => 'Преизчисляване на маршрута…';

  @override
  String get navSearchHint => 'Търсене на дестинация';

  @override
  String get navSearchFieldHint => 'Адрес, място или обект';

  @override
  String get navNoResults => 'Няма съвпадащи места';

  @override
  String get navSearching => 'Търсене…';

  @override
  String get navSearchStartTyping =>
      'Въведете адрес или име на място. Резултатите идват от Apple Maps и изискват интернет връзка.';

  @override
  String get navErrorUnavailable =>
      'Търсенето и маршрутите не са налични — проверете интернет връзката си.';

  @override
  String get navErrorNoLocation =>
      'Изчакване на местоположението ви, за да се планира маршрут.';

  @override
  String get navErrorPermission =>
      'Достъпът до местоположението е изключен, затова маршрутите не могат да започнат от вашата позиция.';

  @override
  String navErrorGeneric(String code) {
    return 'Маршрутите не можаха да се заредят ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Маршрути до $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Пристигане $time';
  }

  @override
  String get navStart => 'Старт';

  @override
  String get navEnd => 'Край';

  @override
  String get navEndLabel => 'Край на навигацията';

  @override
  String navRemaining(String distance, String duration) {
    return 'Остават $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Съобщение: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes мин',
      one: '1 мин',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours ч $minutes мин';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Маршрут $index: $name';
  }

  @override
  String get weatherTitle => 'Времето';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Усеща се като $temperature';
  }

  @override
  String get weatherPrecipitation => 'Валежи';

  @override
  String get weatherWind => 'Вятър';

  @override
  String get weatherVisibility => 'Видимост';

  @override
  String get weatherHumidity => 'Влажност';

  @override
  String get weatherHourly => 'Следващите часове';

  @override
  String weatherAsOf(String time) {
    return 'Актуализирано $time';
  }

  @override
  String get weatherRefresh => 'Обнови времето';

  @override
  String get weatherUnavailable => 'Времето не е налично в момента.';

  @override
  String get weatherNoLocation => 'Времето се нуждае от вашето местоположение.';

  @override
  String get weatherLegal => 'Източници на данни и правна информация';

  @override
  String weatherProvidedBy(String service) {
    return 'Данни за времето: $service';
  }

  @override
  String get weatherNow => 'Сега';

  @override
  String get virtualEmpty => 'Не са разпознати поддържани обекти';

  @override
  String get virtualEmptyCameraOff =>
      'Виртуалният изглед изисква камерата на живо.';

  @override
  String get virtualLaneDisclaimer =>
      'Линиите на лентите са илюстративни, не са разпознати.';

  @override
  String virtualNearest(String zone) {
    return 'Най-близо: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Виртуална пътна сцена: $summary';
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
  String get virtualStatusLive => 'на живо';

  @override
  String get virtualStatusPaused => 'на пауза';

  @override
  String get virtualStatusCameraOff => 'Камера изкл.';

  @override
  String get virtualStatusTestFootage => 'Тестов видеозапис';

  @override
  String get virtualEmptyHint =>
      'Превозни средства, хора, велосипеди, светофари и знаци „Стоп“ се показват тук, когато бъдат разпознати.';

  @override
  String get mapRecenter => 'Центриране';

  @override
  String get mapZoomIn => 'Приближаване';

  @override
  String get mapZoomOut => 'Отдалечаване';

  @override
  String get mapUnsupported => 'Интерактивната карта е налична на iPhone.';

  @override
  String get mapObjectsApprox =>
      'Маркерите на обектите са приблизителни позиции.';

  @override
  String get mapWeatherUnavailable => 'Времето не е налично';

  @override
  String get navErrorNoRoute => 'Не е намерен маршрут до тази дестинация.';

  @override
  String get navDismiss => 'Затвори';

  @override
  String get navGo => 'Тръгни';

  @override
  String get navFastest => 'Най-бърз';

  @override
  String get navThen => 'След това';

  @override
  String get navRecents => 'Скорошни';

  @override
  String get navClearRecents => 'Изчисти';

  @override
  String get navSearchSubmitHint =>
      'Натиснете „Търсене“, за да видите всички съвпадащи места';

  @override
  String get navPlaces => 'Места';

  @override
  String get navEtaLabel => 'пристигане';

  @override
  String get navTimeLeftLabel => 'остава';

  @override
  String get navOverview => 'Общ изглед';

  @override
  String get navMute => 'Заглуши гласа';

  @override
  String get navUnmute => 'Включи гласа';

  @override
  String get navEndConfirm => 'Да се прекрати ли навигацията?';

  @override
  String navEndConfirmBody(String place) {
    return 'Насоките до $place ще спрат.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Пристигнахте в $place';
  }

  @override
  String get navDone => 'Готово';

  @override
  String get navWeakGps => 'Слаб GPS сигнал';

  @override
  String get navLocationOff =>
      'Местоположението е изключено. Включете го, за да планирате маршрути и да навигирате.';

  @override
  String get navVoiceGuidance => 'Гласови указания';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'След $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, след това $second';
  }

  @override
  String get navSpeakRerouting => 'Преизчисляване на маршрута';

  @override
  String get navSpeakArrived => 'Пристигнахте';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count метра',
      one: '1 метър',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value километра',
      one: '1 километър',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фута',
      one: '1 фут',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ярда',
      one: '1 ярд',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Продължете $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Указания за това пътуване не са налични в този регион. Опитайте с друга дестинация.';

  @override
  String navContinueFor(String distance) {
    return 'Продължете $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value мили',
      one: '1 миля',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Най-близо: $object · $zone';
  }

  @override
  String get parkingNothing => 'Нищо не е разпознато в обхвата';

  @override
  String get parkingBeeps => 'Сигнали за близост';

  @override
  String get parkingVolume => 'Сила на сигналите';

  @override
  String get parkingLimitations =>
      'Една камера, не 360°. Обекти извън обхвата на камерата не се разпознават. Не замества парктроника; оценките може да са грешни, а тишината не означава, че зоната е свободна.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Изглед за близост отгоре. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Оригинал';

  @override
  String get perceptionModeBoxes => 'Рамки';

  @override
  String get perceptionModeMasks => 'Маски на обекти';

  @override
  String get perceptionModeRoad => 'Пътна настилка';

  @override
  String get perceptionModeCombined => 'Комбиниран';

  @override
  String get perceptionOpacity => 'Непрозрачност на маската';

  @override
  String get perceptionDisclaimer =>
      'Маската на пътната настилка е приблизителен визуален слой. Не показва проходимо пространство или ленти.';

  @override
  String get perceptionNeedsModel =>
      'Изберете модела „Сегментиране“, за да видите маски.';

  @override
  String get perceptionChooseModel => 'Избор на модел';

  @override
  String get perceptionWaiting =>
      'Изчакване на първия кадър на сегментирането…';

  @override
  String get perceptionShortCamera => 'Камера';

  @override
  String get perceptionShortBoxes => 'Рамки';

  @override
  String get perceptionShortObjects => 'Обекти';

  @override
  String get perceptionShortRoad => 'Път';

  @override
  String get perceptionShortAll => 'Всички';

  @override
  String get perceptionModesLabel => 'Слоеве на възприятие';

  @override
  String get perceptionStatusWarmingUp => 'Подготовка…';

  @override
  String get perceptionStatusLoadingModel => 'Зареждане на модела…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Маските са на пауза';

  @override
  String get perceptionLegend => 'Легенда на маските';

  @override
  String get perceptionUnavailable => 'Маските не са налични';

  @override
  String get driveSave => 'Запази';

  @override
  String get driveSaveIncident => 'Запази инцидент';

  @override
  String driveSaveHint(int seconds) {
    return 'Запазва последните $seconds секунди от записа на видеорегистратора';
  }

  @override
  String get driveSaving => 'Запазване на инцидента…';

  @override
  String hudRecManualLabel(String time) {
    return 'Записва се, $time';
  }

  @override
  String get driveRecord => 'Запис';

  @override
  String get driveRecordStartA11y => 'Започни записа';

  @override
  String driveRecordStopA11y(String time) {
    return 'Спри записа, записани $time';
  }

  @override
  String get driveRecordHint =>
      'Записва непрекъснато, докато не го спрете, включително последните 5 секунди';

  @override
  String get driveRecordFailed => 'Записът не можа да започне';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Записът е запазен · $count части',
      one: 'Записът е запазен',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Записът е спрян: паметта е почти пълна',
      'max_duration':
          'Записът е спрян: достигната е максималната продължителност',
      'camera_stopped': 'Записът е спрян заедно с камерата',
      'background': 'Записът е спрян: приложението премина на заден план',
      'thermal': 'Записът е спрян: телефонът е твърде горещ',
      'other': 'Записът е спрян',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Инцидентът е запазен · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Преглед';

  @override
  String get driveSaveFailed => 'Инцидентът не можа да бъде запазен.';

  @override
  String get driveSaveNotRunning =>
      'Записът още не е започнал — изчакайте камерата да стартира и опитайте отново.';

  @override
  String get driveSaveTestFootage =>
      'Тестовият видеозапис не се записва. Запазването на инциденти работи с камерата на живо.';

  @override
  String get driveSaveStorageFull =>
      'На вашия iPhone няма свободно място. Освободете място или изтрийте по-стари клипове.';

  @override
  String get driveSaveIoError => 'Клипът не можа да бъде записан в паметта.';

  @override
  String get driveClips => 'Клипове';

  @override
  String get driveSettings => 'Настройки';

  @override
  String get driveViewSwitcher => 'Изгледи за шофиране';

  @override
  String get driveLocationDenied =>
      'Местоположението е изключено — скоростта, картите и маршрутите не са налични.';

  @override
  String get driveCameraDenied =>
      'Достъпът до камерата е изключен — разпознаването и записът не са налични.';

  @override
  String get driveRecorderFallback =>
      'Запис без звук: достъпът до микрофона е изключен.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Настройките за запис бяха коригирани: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Вашият iPhone е горещ. AI работи по-бавно, за да се охлади — пазете го от директно слънце и го дръжте до вентилационен отвор.';

  @override
  String get drivePowerThermalCritical =>
      'Вашият iPhone е твърде горещ. Разпознаването с AI е на пауза, докато се охлади; записът продължава, ако е възможно.';

  @override
  String get drivePowerLowPower =>
      'Режимът на ниска мощност е включен — AI работи с намалена честота.';

  @override
  String get drivePowerBatteryLow =>
      'Батерията е слаба — свържете iPhone към захранване, докато шофирате.';

  @override
  String get onboardingTitle1 => 'Виждайте повече при всяко пътуване.';

  @override
  String get onboardingBody1 =>
      'Превърнете своя iPhone в интелигентен видеорегистратор и помощник за вниманието при шофиране.';

  @override
  String get onboardingTitle2 => 'Интелигентност във всеки кадър.';

  @override
  String get onboardingBody2 =>
      'Разпознавайте поддържани превозни средства, хора, велосипеди и пътни сигнали директно на вашия iPhone.';

  @override
  String get onboardingTitle3 => 'Един път. Много гледни точки.';

  @override
  String get onboardingBody3 =>
      'Превключвайте между разпознаване на живо, виртуални изгледи за шофиране, интерактивни карти и визуализация при паркиране.';

  @override
  String get onboardingTitle4 => 'Запазете важните моменти.';

  @override
  String get onboardingBody4 =>
      'Запазвайте скорошни записи от видеорегистратора, преглеждайте инциденти и споделяйте записи.';

  @override
  String get onboardingTitle5 => 'Безопасност и поверителност';

  @override
  String get onboardingSafety1 =>
      'Corvista е помощно средство за вниманието при шофиране. Дръжте погледа си на пътя.';

  @override
  String get onboardingSafety2 =>
      'Не управлява вашето превозно средство и не замества вашата преценка.';

  @override
  String get onboardingSafety3 =>
      'Разпознаванията и оценките може да са неточни или пропуснати.';

  @override
  String get onboardingSafety4 =>
      'Обработката на камерата става на вашия iPhone — видеото не се качва.';

  @override
  String get onboardingSafety5 =>
      'Картите, търсенето, маршрутите и времето изискват интернет връзка.';

  @override
  String get onboardingSafety6 =>
      'Закрепете iPhone стабилно, така че да не пречи на видимостта.';

  @override
  String get onboardingSafety7 =>
      'Завършете настройката, преди да започнете да шофирате.';

  @override
  String get onboardingAcknowledge =>
      'Разбирам, че Corvista е помощно средство за вниманието и че оставам отговорен/на за безопасното шофиране.';

  @override
  String get onboardingReadSafety =>
      'Прочетете пълната информация за безопасност';

  @override
  String get onboardingNext => 'Напред';

  @override
  String get onboardingSkip => 'Пропусни';

  @override
  String get onboardingAgree => 'Продължи';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Страница $current от $total';
  }

  @override
  String get permTitle => 'Разрешения';

  @override
  String get permIntro =>
      'Corvista иска само това, от което се нуждае всяка функция. Можете да ги промените по всяко време в Настройки.';

  @override
  String get permCameraTitle => 'Камера';

  @override
  String get permCameraBody =>
      'Необходима за разпознаване, запис на видеорегистратор и изгледа за паркиране. Видеото се обработва на вашия iPhone.';

  @override
  String get permLocationTitle => 'Местоположение';

  @override
  String get permLocationBody =>
      'Използва се за GPS скорост, карта, маршрути, времето и отбелязване на запазените клипове. Само докато ползвате приложението.';

  @override
  String get permMicTitle => 'Микрофон';

  @override
  String get permSpeechNote =>
      'Разпознаване на реч се изисква само ако включите отмяна с глас за спешните предупреждения.';

  @override
  String get permRequired => 'Задължително';

  @override
  String get permOptional => 'По избор';

  @override
  String get permAllow => 'Разреши';

  @override
  String get permGranted => 'Разрешено';

  @override
  String get permDenied => 'Отказано';

  @override
  String get permLimited => 'Ограничено';

  @override
  String get permRestricted => 'Ограничено от системата';

  @override
  String get permStart => 'Започни шофиране';

  @override
  String get permCameraNeeded =>
      'Можете да продължите без достъп до камерата, но разпознаването и записът няма да работят, докато не го разрешите в Настройки.';

  @override
  String get permSetupIntro =>
      'Corvista се нуждае от тях, за да работи пълноценно. Докоснете „Разреши всички“ и iOS ще поиска всяко поред. Можете да ги промените по всяко време в Настройки.';

  @override
  String get permCameraLine =>
      'Необходима за разпознаване, запис на видеорегистратор и изгледа за паркиране. Видеото се обработва на вашия iPhone и никога не се качва.';

  @override
  String get permLocationLine =>
      'GPS скорост, карта, маршрути, времето и къде са запазени клиповете. Само докато ползвате приложението.';

  @override
  String get permMicLine =>
      'Звук от купето в клиповете на инциденти и разпознаване на вашата фраза за отмяна по време на спешно предупреждение.';

  @override
  String get permSpeechTitle => 'Разпознаване на реч';

  @override
  String get permSpeechLine =>
      'Разпознава вашата фраза за отмяна по време на спешно обратно броене, на вашия iPhone, където се поддържа.';

  @override
  String get permAllowAll => 'Разреши всички';

  @override
  String permAsking(String permission) {
    return 'Искане на разрешение: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Някои разрешения са изключени. Включете ги в Настройки, за да ползвате тези функции.';

  @override
  String get permNotNow => 'Не сега';

  @override
  String get tourLabel => 'Обиколка на екрана за шофиране';

  @override
  String tourProgress(int current, int total) {
    return 'Стъпка $current от $total';
  }

  @override
  String get tourNext => 'Напред';

  @override
  String get tourBack => 'Назад';

  @override
  String get tourSkip => 'Пропусни обиколката';

  @override
  String get tourFinish => 'Започни шофиране';

  @override
  String get tourWelcomeTitle => 'Вашата кратка обиколка';

  @override
  String get tourWelcomeBody =>
      'Едноминутен поглед към най-важното на екрана за шофиране. Най-добре при паркирано превозно средство.';

  @override
  String get tourHudTitle => 'Вашата лента с показания';

  @override
  String get tourHudSpeed => 'Скоростта идва от GPS.';

  @override
  String get tourHudRec => 'REC показва колко секунди запис има в буфера.';

  @override
  String get tourHudAi =>
      'Чипът AI показва модела, колко обекта вижда и точка: зелена — работи, кехлибарена — ограничено, червена — спряно.';

  @override
  String get tourSaveTitle => 'Запази инцидент';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista пази непрекъснат буфер с последните $seconds секунди видео. Той се презаписва постоянно, затова нищо не се пази, освен ако не докоснете „Запази“. Запазените клипове остават на този iPhone, в Клипове.';
  }

  @override
  String get tourRecordTitle => 'Запишете цялото пътуване';

  @override
  String get tourRecordBody =>
      'Докоснете „Запис“, за да снимате непрекъснато, докато не спрете. Дългите пътувания се запазват в Клипове на части по 5 минути, а „Запази инцидент“ продължава да работи по време на запис.';

  @override
  String get tourViewsTitle => 'Пет начина да виждате пътя';

  @override
  String get tourViewDetection =>
      'Камера на живо с рамки около поддържаните обекти.';

  @override
  String get tourViewVirtual =>
      'Опростена 3D сцена, изградена от разпознаванията.';

  @override
  String get tourViewMap => 'Apple Maps с търсене и навигация завой по завой.';

  @override
  String get tourViewParking => 'Камера плюс изглед за близост отгоре.';

  @override
  String get tourViewPerception => 'Маски на пътя и обектите.';

  @override
  String get tourMapTitle => 'Търсене и навигация завой по завой';

  @override
  String get tourMapBody =>
      'Отворете „Карта“, докоснете лентата за търсене и изберете дестинация. Изберете маршрут и докоснете „Старт“ за навигация завой по завой. Изисква интернет връзка.';

  @override
  String get tourClipsTitle => 'Клипове';

  @override
  String get tourClipsBody =>
      'Преглеждайте, преименувайте, споделяйте или изтривайте запазени инциденти. Клиповете остават на вашия iPhone, освен ако не ги споделите.';

  @override
  String get tourSettingsTitle => 'Настройки';

  @override
  String get tourSettingsBody =>
      'Настройте гласовите предупреждения и тяхната чувствителност, качеството на записа и дължината на буфера и конфигурирайте режима за спешни случаи: експериментално предупреждение за удар с обратно броене за отмяна.';

  @override
  String get tourSafetyTitle => 'Преди да потеглите';

  @override
  String get tourSafety1 =>
      'Закрепете iPhone стабилно, където не пречи на видимостта.';

  @override
  String get tourSafety2 =>
      'Не използвайте приложението, докато шофирате. Настройвайте нещата, докато сте паркирани.';

  @override
  String get tourSafety3 =>
      'Разпознаванията и зоните са оценки. Могат да бъдат грешни или пропуснати.';

  @override
  String get tourSafety4 => 'Вие оставате отговорни за безопасното шофиране.';

  @override
  String get helpTakeTour => 'Започнете обиколката';

  @override
  String get helpTakeTourSub =>
      'Едноминутна насочена обиколка на екрана за шофиране.';

  @override
  String get tripsTitle => 'Пътувания';

  @override
  String get tripsOpen => 'Дневник на пътуванията';

  @override
  String get tripsEmptyTitle => 'Все още няма пътувания';

  @override
  String get tripsEmptyBody =>
      'Пътуванията се записват автоматично, докато шофирате с Corvista — разстояние, време, скорост и маршрутът, който сте изминали.';

  @override
  String get tripsDisabledBody =>
      'Дневникът на пътуванията е изключен, затова новите пътувания не се записват. Включете го, за да пазите личен дневник на маршрутите си на този iPhone.';

  @override
  String get tripsEnable => 'Включи дневника на пътуванията';

  @override
  String get tripsToday => 'Днес';

  @override
  String get tripsYesterday => 'Вчера';

  @override
  String tripsRecordingNow(String distance) {
    return 'Записва се пътуване · $distance';
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
      other: '$count инцидента',
      one: '1 инцидент',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count предупреждения',
      one: '1 предупреждение',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count пътувания',
      one: '1 пътуване',
      zero: 'Няма пътувания',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Разстояние';

  @override
  String get tripsStatDuration => 'Продължителност';

  @override
  String get tripsStatMoving => 'Време в движение';

  @override
  String get tripsStatAvgSpeed => 'Ср. скорост';

  @override
  String get tripsStatMaxSpeed => 'Макс. скорост';

  @override
  String get tripsDetections => 'Разпознавания';

  @override
  String get tripsNoDetections =>
      'При това пътуване не са отчетени пътни обекти.';

  @override
  String get tripsTimeline => 'Хронология';

  @override
  String get tripsEventStart => 'Пътуването започна';

  @override
  String get tripsEventEnd => 'Пътуването приключи';

  @override
  String get tripsEventAlert => 'Гласово предупреждение';

  @override
  String get tripsEventIncident => 'Клипът на инцидента е запазен';

  @override
  String get tripsEventEmergency => 'Засечена е възможна катастрофа';

  @override
  String get tripsEventNavStart => 'Навигацията започна';

  @override
  String get tripsEventArrive => 'Пристигане на дестинацията';

  @override
  String get tripsEventReroute => 'Маршрутът е преизчислен';

  @override
  String get tripsEventRecording => 'Записът е запазен';

  @override
  String get tripsOpenClip => 'Отвори клип';

  @override
  String get tripsTrackPreview => 'GPS трасе';

  @override
  String get tripsRenameTitle => 'Преименуване на пътуване';

  @override
  String get tripsRenameHint => 'Име на пътуването';

  @override
  String get tripsFavorite => 'Добави към любимите';

  @override
  String get tripsUnfavorite => 'Премахни от любимите';

  @override
  String get tripsShareGpx => 'Сподели GPX';

  @override
  String get tripsShareFailed => 'Това пътуване не можа да бъде споделено.';

  @override
  String get tripsDelete => 'Изтрий пътуването';

  @override
  String get tripsDeleteConfirmTitle => 'Да се изтрие ли това пътуване?';

  @override
  String get tripsDeleteConfirmBody =>
      'Маршрутът и статистиката ще бъдат премахнати от този iPhone. Клиповете на инциденти от това пътуване се запазват.';

  @override
  String get tripsDeleted => 'Пътуването е изтрито';

  @override
  String get tripsNotFound => 'Това пътуване вече не е налично.';

  @override
  String get tripsPrivacyNote =>
      'Съхранява се само на този iPhone. Нищо не се качва.';

  @override
  String get settingsSectionTrips => 'Дневник на пътуванията';

  @override
  String get settingsTripLog => 'Записвай пътуванията';

  @override
  String get settingsTripLogSubtitle =>
      'Пази маршрута и статистиката от шофирането само на този iPhone.';

  @override
  String get settingsTripRetention => 'Пази пътуванията за';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дни',
      one: '1 ден',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 година';

  @override
  String get settingsRetentionForever => 'Завинаги';

  @override
  String get settingsTripRetentionFooter =>
      'По-старите пътувания се изтриват автоматично при стартиране на Corvista.';

  @override
  String get settingsViewTrips => 'Преглед на пътуванията';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours ч $minutes мин';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes мин';
  }

  @override
  String tripsGpxName(String date) {
    return 'Пътуване с Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Освободи място';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Премахва временни файлове и кешове. Запазените клипове и пътувания се пазят.';

  @override
  String settingsFreedBytes(String size) {
    return 'Освободени $size';
  }

  @override
  String get settingsNothingToFree =>
      'Кешовете са изчистени — няма временни файлове за премахване.';

  @override
  String get settingsSectionPrivacyData => 'Поверителност и данни';

  @override
  String get settingsPrivacyDataFooter =>
      'Клиповете, пътуванията и настройките се съхраняват само на този iPhone. Те го напускат само когато решите да ги споделите.';

  @override
  String get settingsDeleteAllData => 'Изтриване на всички данни';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Изтриване на клипове, пътувания, контакти и настройки от този iPhone';

  @override
  String get deleteAllTitle => 'Да се изтрият ли всички данни?';

  @override
  String get deleteAllMessage =>
      'Това ще премахне завинаги от този iPhone:\n• Клиповете от инциденти и миниатюрите\n• Дневника на пътуванията и GPS следите\n• Спешните контакти и спешните събития\n• Дневниците на разпознаването и диагностичния дневник\n• Настройките и скорошните дестинации\n• Временния буфер за запис и кеша\n\nТова не може да бъде отменено. След това Corvista ще започне отново от приветствените екрани.';

  @override
  String get deleteAllConfirm => 'Изтрий всичко';

  @override
  String get deleteAllInProgress => 'Изтриване…';

  @override
  String get deleteAllDone => 'Всички данни са изтрити';

  @override
  String get deleteAllPartial =>
      'Някои елементи не можаха да бъдат изтрити. Опитайте отново от Настройки.';

  @override
  String get diagLogSection => 'Диагностичен дневник';

  @override
  String get diagLogFooter =>
      'Грешките се записват само на този iPhone, без местоположения, имена на контакти или телефонни номера. Нищо не се изпраща, освен ако сами не споделите дневника.';

  @override
  String get diagLogShare => 'Сподели диагностичния дневник';

  @override
  String get diagLogEmpty => 'Празен';

  @override
  String get diagLogClear => 'Изчисти дневника';

  @override
  String get diagLogClearTitle => 'Да се изчисти ли диагностичният дневник?';

  @override
  String get diagLogClearBody =>
      'Запазените записи за грешки ще бъдат изтрити от този iPhone.';

  @override
  String get diagLogCleared => 'Диагностичният дневник е изчистен';

  @override
  String get diagLogShareFailed =>
      'Диагностичният дневник не можа да бъде споделен.';

  @override
  String get privacyControls2 =>
      'Настройки › Поверителност и данни › Изтриване на всички данни изтрива всеки клип, пътуване, контакт, дневник и настройка, съхранени от Corvista на този iPhone.';

  @override
  String get parkingZoneStop => 'Стоп';

  @override
  String get parkingZoneVeryClose => 'Много близо';

  @override
  String get parkingZoneClose => 'Близо';

  @override
  String get parkingZoneNothingClose => 'Не се забелязва нищо наблизо';

  @override
  String get parkingNotDetected =>
      'Стени, колони, стълбове и бордюри не се разпознават';

  @override
  String get parkingApprox => 'прибл.';

  @override
  String get parkingSideLeft => 'Ляво';

  @override
  String get parkingSideCenter => 'Център';

  @override
  String get parkingSideRight => 'Дясно';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Само изглед от предната камера — не е система 360°';

  @override
  String get parkingMuteBeeps => 'Заглуши сигналите';

  @override
  String get parkingUnmuteBeeps => 'Включи сигналите';

  @override
  String get parkingAbout => 'За изгледа за паркиране';

  @override
  String get parkingLimitationsDetail =>
      'Наблюдава се само зоната пред камерата. Детекторът разпознава леки автомобили, автобуси и камиони, хора, велосипеди и мотоциклети. Стени, колони, стълбове, бордюри, колчета, бариери и ниски препятствия НЕ се разпознават, а капакът на двигателя може да скрива земята непосредствено пред автомобила. Разстоянията са груби предположения от една камера (по размера и положението на обекта) и могат да са много неточни. Тишината или „Не се забелязва нищо наблизо“ не означава, че пътят е свободен — винаги оглеждайте наоколо и използвайте огледалата.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Близост по страни: ляво $left, център $center, дясно $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Грешките се записват в личен дневник на този iPhone (без местоположения, имена на контакти или телефонни номера). Той никога не се изпраща автоматично; можете да го споделите или изчистите в Настройки › Диагностика.';
}
