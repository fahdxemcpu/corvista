// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Бачте більше в кожній поїздці.';

  @override
  String get commonCancel => 'Скасувати';

  @override
  String get commonDelete => 'Видалити';

  @override
  String get commonSave => 'Зберегти';

  @override
  String get commonBack => 'Назад';

  @override
  String get commonClose => 'Закрити';

  @override
  String get commonRetry => 'Повторити';

  @override
  String get commonOpenSettings => 'Відкрити налаштування';

  @override
  String get commonLoading => 'Завантаження…';

  @override
  String get commonError => 'Щось пішло не так.';

  @override
  String commonErrorDetail(String message) {
    return 'Щось пішло не так: $message';
  }

  @override
  String get commonOn => 'Увімк.';

  @override
  String get commonOff => 'Вимк.';

  @override
  String get commonRename => 'Перейменувати';

  @override
  String get commonShare => 'Поділитися';

  @override
  String get commonNotAvailable => 'Недоступно';

  @override
  String get commonTestFootage => 'ТЕСТОВЕ ВІДЕО';

  @override
  String get zoneVeryClose => 'Дуже близько';

  @override
  String get zoneClose => 'Близько';

  @override
  String get zoneMedium => 'Середньо';

  @override
  String get zoneFar => 'Далеко';

  @override
  String get zoneUnknown => 'Невідомо';

  @override
  String get classPerson => 'Людина';

  @override
  String get classBicycle => 'Велосипед';

  @override
  String get classMotorcycle => 'Мотоцикл';

  @override
  String get classCar => 'Транспорт';

  @override
  String get classBus => 'Автобус';

  @override
  String get classTrafficLight => 'Світлофор';

  @override
  String get classStopSign => 'Знак «Стоп»';

  @override
  String get viewDetection => 'Розпізнавання';

  @override
  String get viewVirtual => 'Віртуальний';

  @override
  String get viewMap => 'Мапа';

  @override
  String get viewParking => 'Паркування';

  @override
  String get viewPerception => 'Сприйняття';

  @override
  String get unitKmh => 'км/год';

  @override
  String get unitMph => 'миль/год';

  @override
  String get lightRed => 'Червоний';

  @override
  String get lightYellow => 'Жовтий';

  @override
  String get lightGreen => 'Зелений';

  @override
  String get lightUnknown => 'Невідомо';

  @override
  String get clipsTitle => 'Кліпи';

  @override
  String get clipsSelect => 'Вибрати';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Вибрано: $count',
      zero: 'Виберіть кліпи',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Вибрати все';

  @override
  String get clipsDeselectAll => 'Зняти вибір';

  @override
  String get clipsDeleteSelected => 'Видалити вибрані';

  @override
  String get clipsGridView => 'Сітка';

  @override
  String get clipsListView => 'Список';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Видалити $count кліпа?',
      many: 'Видалити $count кліпів?',
      few: 'Видалити $count кліпи?',
      one: 'Видалити $count кліп?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Відео буде остаточно видалено з вашого iPhone. Цю дію не можна скасувати.',
      many: 'Відео буде остаточно видалено з вашого iPhone. Цю дію не можна скасувати.',
      few: 'Відео буде остаточно видалено з вашого iPhone. Цю дію не можна скасувати.',
      one: 'Відео буде остаточно видалено з вашого iPhone. Цю дію не можна скасувати.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Видалено $count кліпа',
      many: 'Видалено $count кліпів',
      few: 'Видалено $count кліпи',
      one: 'Видалено $count кліп',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Кліпів поки немає';

  @override
  String get clipsEmptyBody =>
      'Під час поїздки Corvista зберігає короткий циклічний буфер. Натисніть «Зберегти випадок», щоб залишити тут останні секунди запису.';

  @override
  String get clipsLoadError => 'Не вдалося завантажити кліпи.';

  @override
  String get clipsStorageTitle => 'Сховище';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Кліпи $clips · Буфер $buffer · Вільно $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count збереженого кліпа',
      many: '$count збережених кліпів',
      few: '$count збережені кліпи',
      one: '$count збережений кліп',
      zero: 'Немає збережених кліпів',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'На iPhone мало вільного місця. Нові записи можуть не зберегтися.';

  @override
  String get clipsMissingFile => 'Немає файлу';

  @override
  String get clipsEmergencyBadge => 'Удар';

  @override
  String clipsUntitled(String date) {
    return 'Випадок · $date';
  }

  @override
  String get clipsAudio => 'Звук записано';

  @override
  String get clipsFavorite => 'Обране';

  @override
  String get clipsUnfavorite => 'Прибрати з обраного';

  @override
  String get clipsLocation => 'Місце збережено';

  @override
  String clipsOpenClip(String title) {
    return 'Відкрити кліп $title';
  }

  @override
  String get playerNotFoundTitle => 'Кліп не знайдено';

  @override
  String get playerNotFoundBody => 'Можливо, цей кліп було видалено.';

  @override
  String get playerMissingTitle => 'Відеофайл відсутній';

  @override
  String get playerMissingBody =>
      'Запису цього кліпу більше немає на вашому iPhone. Ви можете видалити запис із галереї.';

  @override
  String get playerRemoveEntry => 'Видалити запис';

  @override
  String get playerLoadError => 'Не вдається відтворити це відео.';

  @override
  String get playerPlay => 'Відтворити';

  @override
  String get playerPause => 'Пауза';

  @override
  String get playerReplay => 'Повторити';

  @override
  String get playerRenameTitle => 'Перейменувати кліп';

  @override
  String get playerRenameHint => 'Назва кліпу';

  @override
  String get playerRenamed => 'Кліп перейменовано';

  @override
  String get playerFavorited => 'Додано до обраного';

  @override
  String get playerUnfavorited => 'Видалено з обраного';

  @override
  String get playerShareFailed => 'Не вдалося поділитися кліпом.';

  @override
  String get playerDetails => 'Відомості';

  @override
  String get playerDate => 'Записано';

  @override
  String get playerDuration => 'Тривалість';

  @override
  String get playerResolution => 'Роздільність';

  @override
  String get playerSize => 'Розмір файлу';

  @override
  String get playerAudio => 'Звук';

  @override
  String get playerAudioYes => 'Записано';

  @override
  String get playerAudioNo => 'Не записано';

  @override
  String get playerReason => 'Збережено';

  @override
  String get playerReasonManual => 'Кнопкою «Зберегти випадок»';

  @override
  String get playerReasonEmergency => 'Виявлено можливий удар';

  @override
  String get playerReasonRecovered => 'Відновлено після переривання';

  @override
  String get playerSpeed => 'Швидкість GPS під час збереження';

  @override
  String get playerLocation => 'Місце';

  @override
  String get playerOpenInMaps => 'Відкрити в Картах';

  @override
  String get playerBack => 'Назад';

  @override
  String get playerMore => 'Більше дій';

  @override
  String get clipsFilterLabel => 'Показати';

  @override
  String get clipsFilterAll => 'Усі';

  @override
  String get clipsFilterRecordings => 'Записи';

  @override
  String get clipsFilterIncidents => 'Випадки';

  @override
  String get clipsFilterEmergency => 'Екстрені';

  @override
  String get clipsFilterFavorites => 'Обране';

  @override
  String get clipsSort => 'Сортування';

  @override
  String get clipsSortNewest => 'Спочатку нові';

  @override
  String get clipsSortOldest => 'Спочатку старі';

  @override
  String get clipsSortLongest => 'Спочатку довгі';

  @override
  String get clipsSortLargest => 'Спочатку великі';

  @override
  String get clipsToday => 'Сьогодні';

  @override
  String get clipsYesterday => 'Учора';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кліпа',
      many: '$count кліпів',
      few: '$count кліпи',
      one: '$count кліп',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'У цій категорії поки немає кліпів.';

  @override
  String get clipsFavoritesEmpty =>
      'Позначте кліп зірочкою, щоб він був тут під рукою.';

  @override
  String get clipsKindRecording => 'Запис';

  @override
  String get clipsKindIncident => 'Випадок';

  @override
  String get clipsKindEmergency => 'Екстрений';

  @override
  String get clipsKindTest => 'Тест';

  @override
  String clipsTripChip(String time) {
    return 'Поїздка · $time';
  }

  @override
  String get clipsOpenTrip => 'Відкрити поїздку, у якій записано цей кліп';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return 'Використано: $used · Вільно: $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Кліпи займають $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count запису',
      many: '$count записів',
      few: '$count записи',
      one: '$count запис',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count випадку',
      many: '$count випадків',
      few: '$count випадки',
      one: '$count випадок',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count екстреного',
      many: '$count екстрених',
      few: '$count екстрені',
      one: '$count екстрений',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Звільнити місце';

  @override
  String get clipsStorageLowGentle =>
      'Вільно менш ніж 2 ГБ. Щоб запис працював без збоїв, звільніть місце або видаліть непотрібні кліпи.';

  @override
  String get clipsSaveToPhotos => 'Зберегти у «Фото»';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кліпа',
      many: '$count кліпів',
      few: '$count кліпи',
      one: '$count кліп',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Видалити $count кліпа ($size)?',
      many: 'Видалити $count кліпів ($size)?',
      few: 'Видалити $count кліпи ($size)?',
      one: 'Видалити цей кліп ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Збереження у «Фото»: $done з $total…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кліпа збережено у «Фото»',
      many: '$count кліпів збережено у «Фото»',
      few: '$count кліпи збережено у «Фото»',
      one: 'Збережено у «Фото»',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return 'Збережено у «Фото»: $saved · Не вдалося зберегти: $failed';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista не має дозволу додавати відео до «Фото». Це можна дозволити в налаштуваннях.';

  @override
  String get clipsPhotosFailed => 'Не вдалося зберегти у «Фото».';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кліпа додано до обраного',
      many: '$count кліпів додано до обраного',
      few: '$count кліпи додано до обраного',
      one: 'Додано до обраного',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кліпа видалено з обраного',
      many: '$count кліпів видалено з обраного',
      few: '$count кліпи видалено з обраного',
      one: 'Видалено з обраного',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (обрізано)';
  }

  @override
  String get playerTrim => 'Обрізати';

  @override
  String get playerInfo => 'Інфо';

  @override
  String get playerKind => 'Тип';

  @override
  String get playerReasonRecording => 'Кнопка запису';

  @override
  String get trimTitle => 'Обрізання кліпу';

  @override
  String get trimHint =>
      'Перетягніть маркери, щоб вибрати потрібну частину. Початковий кліп не зміниться.';

  @override
  String get trimStartHandle => 'Початок обрізання';

  @override
  String get trimEndHandle => 'Кінець обрізання';

  @override
  String trimSelection(String duration) {
    return 'Вибрано: $duration';
  }

  @override
  String get trimSave => 'Зберегти як новий кліп';

  @override
  String get trimSaving => 'Збереження обрізаного кліпу…';

  @override
  String get trimSaved => 'Обрізаний кліп збережено';

  @override
  String get trimOpenNew => 'Відкрити';

  @override
  String get trimFailed => 'Не вдалося обрізати кліп.';

  @override
  String get trimStorageFull =>
      'Недостатньо місця для збереження обрізаного кліпу.';

  @override
  String get trimPreview => 'Відтворити вибране';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get settingsSectionCamera => 'Камера';

  @override
  String get settingsSectionAi => 'ШІ';

  @override
  String get settingsSectionAlerts => 'Сповіщення';

  @override
  String get settingsSectionAlertCategories => 'Категорії сповіщень';

  @override
  String get settingsSectionRecording => 'Запис';

  @override
  String get settingsSectionDriving => 'Водіння';

  @override
  String get settingsSectionPower => 'Живлення';

  @override
  String get settingsSectionEmergency => 'Екстрені випадки';

  @override
  String get settingsSectionAppearance => 'Вигляд';

  @override
  String get settingsSectionLanguage => 'Мова';

  @override
  String get settingsSectionInformation => 'Інформація';

  @override
  String get settingsCameraLens => 'Об’єктив камери';

  @override
  String get settingsLensWide => 'Ширококутний';

  @override
  String get settingsLensUltraWide => 'Надширококутний';

  @override
  String get settingsLensTelephoto => 'Телеоб’єктив';

  @override
  String get settingsLensUnavailable => 'Недоступно на цьому iPhone';

  @override
  String get settingsStabilization => 'Стабілізація';

  @override
  String get settingsStabAuto => 'Авто';

  @override
  String get settingsStabOff => 'Вимк.';

  @override
  String get settingsStabStandard => 'Стандартна';

  @override
  String get settingsStabCinematic => 'Кінематографічна';

  @override
  String get settingsOverlayOpacity => 'Прозорість накладання';

  @override
  String get settingsShowFps => 'Показувати дані про продуктивність';

  @override
  String get settingsShowFpsSubtitle =>
      'Частота кадрів і час обробки на екрані розпізнавання';

  @override
  String get settingsCameraFooter =>
      'Зміни об’єктива та стабілізації застосовуються під час наступного запуску камери.';

  @override
  String get settingsAiModel => 'Модель ШІ';

  @override
  String get settingsConfidence => 'Достовірність розпізнавання';

  @override
  String get settingsTracking => 'Відстеження об’єктів';

  @override
  String get settingsTrackingSubtitle =>
      'Утримує об’єкти стабільними між кадрами';

  @override
  String get settingsShowLabels => 'Показувати підписи';

  @override
  String get settingsShowConfidence => 'Показувати достовірність';

  @override
  String get settingsSegmentationOpacity => 'Прозорість масок сприйняття';

  @override
  String get settingsAiFooter =>
      'Нижча достовірність показує більше об’єктів, але й більше хибних спрацьовувань. Розпізнавання може бути неточним.';

  @override
  String get settingsVoiceAlerts => 'Голосові сповіщення';

  @override
  String get settingsVoiceLanguage => 'Мова голосу';

  @override
  String get settingsVoiceLanguageAuto => 'Як у застосунку';

  @override
  String get settingsVoice => 'Голос';

  @override
  String get settingsVoiceDefault => 'Системний';

  @override
  String get settingsVoiceQualityEnhanced => 'Покращений';

  @override
  String get settingsVoiceQualityPremium => 'Висока якість';

  @override
  String get settingsNoVoices =>
      'Для цієї мови не встановлено жодного голосу. Додайте його в «Налаштування iOS» › «Універсальний доступ» › «Вимовлений вміст».';

  @override
  String get settingsAlertPedestrian => 'Пішоходи';

  @override
  String get settingsAlertCyclist => 'Велосипедисти';

  @override
  String get settingsAlertMotorcycle => 'Мотоцикли';

  @override
  String get settingsAlertBus => 'Автобуси';

  @override
  String get settingsAlertVehicleClose => 'Транспорт дуже близько попереду';

  @override
  String get settingsAlertTrafficLight => 'Зміна сигналу світлофора';

  @override
  String get settingsAlertTrafficMoving => 'Потік попереду рушив';

  @override
  String get settingsAlertStopSign => 'Знаки «Стоп»';

  @override
  String get settingsSensitivity => 'Чутливість';

  @override
  String get settingsSensitivityLow => 'Низька';

  @override
  String get settingsSensitivityMedium => 'Середня';

  @override
  String get settingsSensitivityHigh => 'Висока';

  @override
  String get settingsCooldown => 'Інтервал повтору';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds с';
  }

  @override
  String get settingsVolume => 'Гучність голосу';

  @override
  String get settingsQuietMode => 'Тихий режим';

  @override
  String get settingsQuietModeSubtitle =>
      'Озвучуються лише найважливіші сповіщення';

  @override
  String get settingsTestVoice => 'Перевірити голос';

  @override
  String get settingsTestVoiceDone => 'Відтворюється приклад сповіщення…';

  @override
  String get settingsParkingBeeps => 'Сигнали паркування';

  @override
  String get settingsBeepVolume => 'Гучність сигналів';

  @override
  String get settingsAlertsFooter =>
      'Сповіщення — лише допоміжний засіб. Завжди стежте за дорогою: відсутність сигналу не означає, що шлях вільний.';

  @override
  String get settingsRecordingProfile => 'Якість запису';

  @override
  String get settingsProfileStandard => 'Стандартна · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Буфер запису';

  @override
  String settingsBufferSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds секунди',
      many: '$seconds секунд',
      few: '$seconds секунди',
      one: '$seconds секунда',
    );
    return '$_temp0';
  }

  @override
  String get settingsManualMaxLength => 'Макс. тривалість ручного запису';

  @override
  String get settingsManualMaxUnlimited => 'Без обмежень';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes хв';
  }

  @override
  String get settingsRecordAudio => 'Записувати звук';

  @override
  String get settingsRecordAudioSubtitle =>
      'Додає звук із салону до збережених записів';

  @override
  String get settingsMicDenied =>
      'Доступ до мікрофона вимкнено. Дозвольте його в налаштуваннях, щоб записувати звук.';

  @override
  String get settingsWatermark => 'Водяний знак Corvista';

  @override
  String get settingsTimestamp => 'Дата й час на відео';

  @override
  String get settingsSaveLocation => 'Зберігати місце разом із кліпами';

  @override
  String get settingsStorage => 'Сховище та кліпи';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кліпа',
      many: '$count кліпів',
      few: '$count кліпи',
      one: '$count кліп',
      zero: 'Немає кліпів',
    );
    return '$_temp0 · зайнято $used · вільно $free';
  }

  @override
  String get settingsRecordingFooter =>
      'Циклічний буфер зберігається лише на вашому iPhone та постійно перезаписується. У фоновому режимі нічого не записується.';

  @override
  String get settingsDefaultView => 'Вигляд за промовчанням';

  @override
  String get settingsUnits => 'Одиниці вимірювання';

  @override
  String get settingsShowCompass => 'Показувати компас';

  @override
  String get settingsHudStyle => 'Стиль HUD';

  @override
  String get settingsHudCustomize => 'Налаштувати HUD';

  @override
  String get settingsDrivingSide => 'Сторона руху';

  @override
  String get settingsDrivingSideAuto => 'Авто';

  @override
  String get settingsDrivingSideRight => 'Правосторонній';

  @override
  String get settingsDrivingSideLeft => 'Лівосторонній';

  @override
  String get settingsVirtualStyle => 'Стиль віртуального вигляду';

  @override
  String get settingsVirtualMinimal => 'Мінімальний';

  @override
  String get settingsVirtualPerspective => 'Перспектива';

  @override
  String get settingsVirtualHighContrast => 'Високий контраст';

  @override
  String get settingsKeepScreenOn => 'Не вимикати екран під час водіння';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Показувати покрокові вказівки маршруту на екрані блокування та в Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Запис призупинено, поки Corvista був у фоновому режимі';

  @override
  String get liveActivityRec => 'ЗАП.';

  @override
  String get liveActivityPaused => 'Пауза';

  @override
  String get liveActivityDashcamOff => 'Камера вимк.';

  @override
  String get liveActivityEnded => 'Навігацію завершено';

  @override
  String get liveActivityEta => 'Прибуття';

  @override
  String get settingsAutoRecenter => 'Автоцентрування мапи';

  @override
  String get settingsHudStyleClassic => 'Класичний';

  @override
  String get settingsHudStyleGrid => 'Сітка';

  @override
  String get settingsHudStyleMinimal => 'Мінімальний';

  @override
  String get settingsHudStylePerformance => 'Спортивний';

  @override
  String get settingsHudStyleNavigation => 'Навігація';

  @override
  String get settingsHudStyleNight => 'Нічний';

  @override
  String get settingsHudStyleHighContrast => 'Високий контраст';

  @override
  String get settingsPowerMode => 'Режим живлення';

  @override
  String get settingsPowerBalanced => 'Збалансований';

  @override
  String get settingsPowerPerformance => 'Продуктивність';

  @override
  String get settingsPowerSaver => 'Економія';

  @override
  String get settingsPowerFooter =>
      'Corvista автоматично знижує частоту роботи ШІ та візуальні ефекти, коли iPhone нагрівається або заряд акумулятора низький.';

  @override
  String get settingsThermal => 'Температура';

  @override
  String get settingsThermalNominal => 'Норма';

  @override
  String get settingsThermalFair => 'Теплий';

  @override
  String get settingsThermalSerious => 'Гарячий';

  @override
  String get settingsThermalCritical => 'Критична';

  @override
  String get settingsBattery => 'Акумулятор';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Заряджання';
  }

  @override
  String get settingsLowPowerMode =>
      'Увімкнено режим енергозбереження — ШІ працює зі зниженою частотою.';

  @override
  String get settingsAiRate => 'Поточна частота ШІ';

  @override
  String settingsHzValue(String value) {
    return '$value Гц';
  }

  @override
  String get settingsEmergencySetup => 'Виявлення удару';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Увімк. · зворотний відлік $seconds с';
  }

  @override
  String get settingsEmergencyFooter =>
      'Експериментальна функція. Не замінює екстрені служби.';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get settingsThemeSystem => 'Системна';

  @override
  String get settingsThemeDark => 'Темна';

  @override
  String get settingsThemeLight => 'Світла';

  @override
  String get settingsReduceMotion => 'Зменшення руху';

  @override
  String get settingsReduceMotionSubtitle =>
      'Мінімізує анімацію в усьому застосунку';

  @override
  String get settingsAppLanguage => 'Мова застосунку';

  @override
  String get settingsPrivacyPolicy => 'Політика конфіденційності';

  @override
  String get settingsTerms => 'Умови використання';

  @override
  String get settingsHelp => 'Довідка';

  @override
  String get settingsSupport => 'Зв’язатися з підтримкою';

  @override
  String get settingsLicenses => 'Ліцензії відкритого ПЗ';

  @override
  String get settingsSupportUnavailable =>
      'Не вдалося відкрити Пошту. Напишіть на support@corvista.app.';

  @override
  String get settingsSafety => 'Інформація про безпеку';

  @override
  String get settingsDiagnostics => 'Діагностика';

  @override
  String get settingsVersion => 'Версія';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Налаштування HUD';

  @override
  String get hudCustomPreview => 'Перегляд · приклади значень';

  @override
  String get hudCustomStyle => 'Стиль';

  @override
  String get hudCustomElements => 'Елементи';

  @override
  String get hudCustomSpeed => 'Швидкість';

  @override
  String get hudCustomHeading => 'Курс і компас';

  @override
  String get hudCustomClock => 'Годинник';

  @override
  String get hudCustomBattery => 'Акумулятор і температура';

  @override
  String get hudCustomDetections => 'Стан ШІ та об’єкти';

  @override
  String get hudCustomWeather => 'Погода';

  @override
  String get hudCustomAppearance => 'Розмір і прозорість';

  @override
  String get hudCustomSize => 'Розмір';

  @override
  String get hudCustomOpacity => 'Прозорість';

  @override
  String get hudCustomFooter =>
      'Попередження, наприклад про перегрівання, показуються завжди, навіть якщо елементи приховано.';

  @override
  String get hudCustomDescClassic => 'Збалансована панель приладів';

  @override
  String get hudCustomDescGrid => 'Перспективна сітка поверх дороги';

  @override
  String get hudCustomDescMinimal => 'Лише швидкість, нічого зайвого';

  @override
  String get hudCustomDescPerformance =>
      'Дуга швидкості з поточними показниками';

  @override
  String get hudCustomDescNavigation => 'Найближчий маневр на першому плані';

  @override
  String get hudCustomDescNight =>
      'Приглушений, із червоним відтінком для нічної їзди';

  @override
  String get hudCustomDescHighContrast =>
      'Максимальна читабельність на яскравому сонці';

  @override
  String get languageTitle => 'Мова';

  @override
  String get languageSystem => 'Системна';

  @override
  String get languageSystemSubtitle => 'Використовувати мову вашого iPhone';

  @override
  String get languageFooter =>
      'Незабаром з’являться нові мови. Мову голосових сповіщень можна вибрати окремо в розділі «Сповіщення».';

  @override
  String get diagTitle => 'Діагностика';

  @override
  String get diagPerformance => 'Продуктивність';

  @override
  String get diagInference => 'Час обробки';

  @override
  String get diagDetectHz => 'Частота розпізнавання';

  @override
  String get diagCameraFps => 'Частота кадрів камери';

  @override
  String get diagMemory => 'Пам’ять';

  @override
  String get diagDropped => 'Втрачені кадри';

  @override
  String get diagSegmentation => 'Час сегментації';

  @override
  String get diagCamera => 'Камера';

  @override
  String get diagStatus => 'Стан';

  @override
  String get diagSource => 'Джерело';

  @override
  String get diagSourceCamera => 'Жива камера';

  @override
  String get diagSourceFile => 'Файл тестового відео';

  @override
  String get diagResolution => 'Розмір буфера';

  @override
  String get diagLens => 'Об’єктив';

  @override
  String get diagError => 'Остання помилка';

  @override
  String get diagModel => 'Модель ШІ';

  @override
  String get diagModelLoad => 'Час завантаження моделі';

  @override
  String get diagPower => 'Живлення';

  @override
  String get diagSegHz => 'Частота сегментації';

  @override
  String get diagReduced => 'Знижені ефекти';

  @override
  String diagMs(String value) {
    return '$value мс';
  }

  @override
  String diagFps(String value) {
    return '$value к/с';
  }

  @override
  String diagMb(String value) {
    return '$value МБ';
  }

  @override
  String get diagCamIdle => 'Простоює';

  @override
  String get diagCamStarting => 'Запуск';

  @override
  String get diagCamRunning => 'Працює';

  @override
  String get diagCamInterrupted => 'Перервана';

  @override
  String get diagCamStopped => 'Зупинена';

  @override
  String get diagCamUnavailable => 'Недоступна';

  @override
  String get diagCamPermissionDenied => 'Доступ заборонено';

  @override
  String get diagCamError => 'Помилка';

  @override
  String get diagTestFootage => 'Тестове відео';

  @override
  String get diagTestFootageBody =>
      'Запускає справжнє розпізнавання на пристрої за локальним відеофайлом замість камери. На кожному екрані відображається мітка «ТЕСТОВЕ ВІДЕО».';

  @override
  String get diagPathLabel => 'Шлях до відеофайлу';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Використати Documents/test_drive.mp4';

  @override
  String get diagRun => 'Запустити тестове відео';

  @override
  String get diagRunStarted =>
      'Тестове відео запущено. Відкрийте екран водіння, щоб побачити його.';

  @override
  String get diagBackToCamera => 'Повернутися до живої камери';

  @override
  String get diagDebugOnly =>
      'Тестове відео доступне лише у збірках для розробки.';

  @override
  String get diagFileMissing => 'За цим шляхом немає файлу.';

  @override
  String get emergencySetupTitle => 'Виявлення удару';

  @override
  String get emergencyExperimental => 'Експериментально';

  @override
  String get emergencyIntro =>
      'Під час поїздки Corvista може відстежувати можливий сильний удар за допомогою датчиків руху вашого iPhone. Якщо удар виявлено, починається зворотний відлік. Якщо ви його не скасуєте, Corvista запропонує зателефонувати в екстрені служби та надіслати повідомлення вашим контактам.';

  @override
  String get emergencyDisclaimer1 =>
      'Не замінює екстрені служби та власну систему виявлення аварій вашого автомобіля.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS завжди запитує підтвердження, перш ніж здійснити дзвінок або надіслати повідомлення.';

  @override
  String get emergencyDisclaimer3 =>
      'Удари можуть бути пропущені, а різке гальмування чи нерівності дороги можуть бути сприйняті за удар.';

  @override
  String get emergencyParkedWarning =>
      'Виконуйте це налаштування на стоянці. Поки автомобіль рухається, налаштування заблоковано.';

  @override
  String get emergencyEnable => 'Увімкнути виявлення удару';

  @override
  String get emergencyEnableSubtitle => 'Працює лише під час поїздки';

  @override
  String get emergencyNeedNumber => 'Спочатку додайте екстрений номер.';

  @override
  String get emergencyContacts => 'Екстрені контакти';

  @override
  String get emergencyAddContact => 'Додати контакт';

  @override
  String get emergencyNoContacts =>
      'Контактів поки немає. Повідомлення контактам надсилається лише після вашого підтвердження.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Видалити контакт $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Після удару його не пропонуватимуть як одержувача.';

  @override
  String get emergencyRemove => 'Видалити';

  @override
  String get emergencyContactsError => 'Не вдалося завантажити контакти.';

  @override
  String get emergencyNumber => 'Екстрений номер';

  @override
  String get emergencyNumberHint => 'напр., 112 або 911';

  @override
  String get emergencyMessage => 'Шаблон повідомлення';

  @override
  String get emergencyMessageDefault =>
      'Можливо, я потрапив(-ла) в аварію. Це повідомлення підготовлено Corvista, воно містить моє останнє відоме місцезнаходження, якщо воно доступне.';

  @override
  String get emergencyMessageHint =>
      'Залиште порожнім, щоб використати повідомлення за промовчанням.';

  @override
  String get emergencyCountdown => 'Тривалість зворотного відліку';

  @override
  String get emergencyVoiceCancel => 'Скасування голосом';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Під час зворотного відліку скажіть «Я в нормі» або «Скасувати». Якщо можливо, використовується розпізнавання мовлення на пристрої.';

  @override
  String get emergencyVoicePermDenied =>
      'Для голосового скасування потрібен доступ до мікрофона та розпізнавання мовлення.';

  @override
  String get emergencyAutoSave => 'Зберігати запис випадку автоматично';

  @override
  String get emergencyTest => 'Перевірити зворотний відлік (без дзвінка)';

  @override
  String get emergencyTestBody =>
      'Запускає імітацію удару, щоб ви побачили зворотний відлік. У тестовому режимі дзвінки та повідомлення не надсилаються.';

  @override
  String get emergencyNotSet => 'Не задано';

  @override
  String get emergencyAlertHeadline => 'Виявлено можливий сильний удар.';

  @override
  String get emergencyAlertSubtitle => 'Ви в порядку?';

  @override
  String get emergencyAlertCancel => 'Я в нормі — Скасувати';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Залишилося $seconds секунди',
      many: 'Залишилося $seconds секунд',
      few: 'Залишилося $seconds секунди',
      one: 'Залишилася $seconds секунда',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Слухаю — скажіть «Я в нормі», щоб скасувати';

  @override
  String emergencyAlertHeard(String text) {
    return 'Розпізнано: «$text»';
  }

  @override
  String get emergencyAlertEscalated => 'Відповіді немає. Виберіть дію:';

  @override
  String get emergencyAlertCall => 'Зателефонувати в екстрені служби';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Виклик $number. iOS запросить підтвердження.';
  }

  @override
  String get emergencyAlertMessage => 'Написати контактам';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Відкриється підготовлене повідомлення. Надсилати його чи ні, вирішуєте ви.';

  @override
  String get emergencyAlertTestMode =>
      'Тестовий режим — дзвінок не буде здійснено';

  @override
  String get emergencyAlertTestBadge => 'ТЕСТ';

  @override
  String get emergencyAlertClose => 'Я в нормі — Закрити';

  @override
  String get emergencyMsgSent => 'Повідомлення надіслано.';

  @override
  String get emergencyMsgCancelled => 'Повідомлення не надіслано.';

  @override
  String get emergencyMsgFailed => 'Не вдалося надіслати повідомлення.';

  @override
  String get emergencyMsgUnavailable =>
      'На цьому пристрої повідомлення недоступні.';

  @override
  String emergencyCallFailed(String number) {
    return 'Не вдалося почати дзвінок. Наберіть $number самостійно.';
  }

  @override
  String get modelsTitle => 'Моделі ШІ';

  @override
  String get modelsIntro =>
      'Усі моделі входять до складу застосунку та працюють повністю на вашому iPhone. Відео з камери не залишає пристрій.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'У реальному часі: $ms мс на кадр · $hz розпізнавань/с';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Завантажено за $ms мс';
  }

  @override
  String get modelsEfficientName => 'Економна';

  @override
  String get modelsEfficientDesc =>
      'Швидкий компактний детектор для довгих поїздок: мало нагрівання та витрати заряду.';

  @override
  String get modelsEnhancedName => 'Розширена';

  @override
  String get modelsEnhancedDesc =>
      'Більший детектор, що знаходить менші та віддаленіші об’єкти, але споживає більше енергії.';

  @override
  String get modelsSegmentationName => 'Сегментація';

  @override
  String get modelsSegmentationDesc =>
      'Поєднує швидке розпізнавання з масками дорожнього покриття та об’єктів для екрана «Сприйняття».';

  @override
  String get modelsNoneName => 'ШІ на паузі';

  @override
  String get modelsNoneDesc =>
      'Камера й запис продовжують працювати без розпізнавання об’єктів. Мінімальне енергоспоживання.';

  @override
  String get modelsGenericDesc => 'Модель розпізнавання об’єктів на пристрої.';

  @override
  String get modelsFunctionDetection =>
      'Розпізнає автомобілі, людей, велосипеди, мотоцикли, автобуси, світлофори та знаки «Стоп»';

  @override
  String get modelsFunctionSegmentation =>
      'Додає маски дорожнього покриття та об’єктів';

  @override
  String get modelsFunctionNone =>
      'Без розпізнавання; лише запис відеореєстратора';

  @override
  String get modelsSize => 'Розмір';

  @override
  String get modelsInput => 'Вхід';

  @override
  String modelsInputValue(String size) {
    return '$size × $size пікс.';
  }

  @override
  String get modelsViews => 'Працює з виглядами';

  @override
  String get modelsStatusInstalled => 'Установлено (у складі застосунку)';

  @override
  String get modelsStatusNotInstalled => 'Не встановлено';

  @override
  String get modelsSelected => 'Вибрано';

  @override
  String get modelsUse => 'Використовувати цю модель';

  @override
  String get modelsSwitching => 'Завантаження моделі…';

  @override
  String modelsSwitched(String name) {
    return 'Модель «$name» активна';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Виміряно на цьому пристрої: у середньому $ms мс';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'На цьому пристрої не вимірювалося';

  @override
  String get modelsBenchmarkRun => 'Запустити тест';

  @override
  String get modelsBenchmarkRunning => 'Триває тест…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Виберіть цю модель, щоб протестувати її.';

  @override
  String get modelsBenchmarkDone => 'Тест завершено';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Тест не вдався: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Оновлено: $date';
  }

  @override
  String get safetyTitle => 'Інформація про безпеку';

  @override
  String get safetyIntro =>
      'Corvista — допоміжний засіб для підвищення уважності за кермом. Він не керує вашим автомобілем і не замінює вашу увагу, ваше судження та системи безпеки автомобіля.';

  @override
  String get safetyBeforeTitle => 'Перед поїздкою';

  @override
  String get safetyBefore1 =>
      'Надійно закріпіть iPhone в дозволеному законом місці, де він не затуляє огляд, подушки безпеки та органи керування.';

  @override
  String get safetyBefore2 =>
      'Завершіть налаштування, виберіть вигляд і задайте пункт призначення на стоянці.';

  @override
  String get safetyBefore3 =>
      'Для довгих поїздок підключіть зарядний пристрій і, за можливості, не залишайте телефон під прямим сонячним промінням.';

  @override
  String get safetyWhileTitle => 'Під час водіння';

  @override
  String get safetyWhile1 =>
      'Дивіться на дорогу. Користуйтеся великими елементами керування на екрані лише тоді, коли це безпечно й дозволено законом.';

  @override
  String get safetyWhile2 =>
      'Сповіщення — це допоміжний засіб, а не попередження, на які можна покладатися. Відсутність сигналу ніколи не означає, що дорога вільна.';

  @override
  String get safetyWhile3 =>
      'Якщо застосунок суперечить правилам дорожнього руху, сигналам і знакам, дотримуйтеся їх, а не застосунку.';

  @override
  String get safetyLimitsTitle => 'Обмеження';

  @override
  String get safetyLimits1 =>
      'Одна камера телефону бачить лише те, що перед нею. Об’єкти поза її полем зору, приховані або дуже близькі не розпізнаються.';

  @override
  String get safetyLimits2 =>
      'Об’єкти можуть бути пропущені, розпізнані із запізненням або неправильно, особливо вночі, під час дощу, туману, відблисків або за брудного лобового скла.';

  @override
  String get safetyLimits3 =>
      'Розпізнаються лише підтримувані категорії: автомобілі, автобуси, мотоцикли, велосипеди, люди, світлофори та знаки «Стоп». Лінії смуг на віртуальному вигляді стилізовані й не є розпізнаними смугами.';

  @override
  String get safetyLimits4 =>
      'Близькість показується приблизними зонами («Дуже близько», «Близько», «Середньо», «Далеко»), а не виміряними відстанями. Вигляд паркування не замінює парктронік.';

  @override
  String get safetyHeatTitle => 'Нагрівання та акумулятор';

  @override
  String get safetyHeat1 =>
      'Постійна робота камери та ШІ нагріває iPhone. Коли пристрій перегрівається, Corvista знижує частоту аналізу та показує попередження; якщо iOS перегріється, камера може зупинитися.';

  @override
  String get safetyEmergencyTitle => 'Екстрена функція';

  @override
  String get safetyEmergency1 =>
      'Виявлення можливого удару — експериментальна функція. Вона може пропустити справжню аварію й може спрацювати через інші події.';

  @override
  String get safetyEmergency2 =>
      'Вона ніколи не зв’язується ні з ким потай: iOS завжди запитує підтвердження дзвінка чи повідомлення. Вона не замінює самостійний виклик екстрених служб.';

  @override
  String get privacyTitle => 'Конфіденційність';

  @override
  String get privacyIntro =>
      'Corvista створено так, щоб дані про ваші поїздки залишалися на вашому iPhone. Облікового запису Corvista немає, і Corvista не використовує власних серверів.';

  @override
  String get privacyCameraTitle => 'Камера та ШІ';

  @override
  String get privacyCamera1 =>
      'Розпізнавання, відстеження та сегментація об’єктів повністю виконуються на вашому iPhone. Кадри з камери ніколи не завантажуються.';

  @override
  String get privacyCamera2 =>
      'Камера працює лише поки Corvista відкрито на екрані. Коли застосунок переходить у фоновий режим, вона зупиняється — прихованого фонового запису немає.';

  @override
  String get privacyRecordingsTitle => 'Записи';

  @override
  String get privacyRecordings1 =>
      'Циклічний буфер тимчасовий і постійно перезаписується. Відео зберігається лише тоді, коли ви натискаєте «Зберегти випадок» або, якщо ви ввімкнули цю функцію, після можливого удару.';

  @override
  String get privacyRecordings2 =>
      'Збережені кліпи залишаються в закритому сховищі Corvista на вашому iPhone. Вони залишають пристрій лише тоді, коли ви обираєте «Поділитися». Під час видалення застосунку вони видаляються.';

  @override
  String get privacyRecordings3 =>
      'Звук записується, лише якщо ви ввімкнули цю функцію і надали доступ до мікрофона.';

  @override
  String get privacyLocationTitle => 'Геопозиція';

  @override
  String get privacyLocation1 =>
      'Поки застосунок відкрито, геопозиція використовується для визначення швидкості, мапи, маршрутів і погоди. Якщо ввімкнено «Зберігати місце», позиція на момент збереження зберігається разом із кліпом на вашому пристрої.';

  @override
  String get privacyNetworkTitle => 'Мережеві служби';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — показ мапи, пошук місць і маршрути. Текст вашого запиту та приблизна геопозиція надсилаються до Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — поточна та погодинна погода для вашої геопозиції.';

  @override
  String get privacyNetwork4 =>
      'У Corvista немає реклами, сторонньої аналітики та відстеження.';

  @override
  String get privacyEmergencyTitle => 'Екстрені контакти';

  @override
  String get privacyEmergency1 =>
      'Вибрані вами контакти зберігаються в в’язці ключів iOS на цьому пристрої. Для голосового скасування, якщо можливо, використовується розпізнавання мовлення на пристрої. Дзвінки та повідомлення надсилаються лише після вашого підтвердження в iOS.';

  @override
  String get privacyControlsTitle => 'Ваш контроль';

  @override
  String get privacyControls1 =>
      'Ви можете будь-коли видалити кліпи в розділі «Кліпи», а також змінити чи відкликати доступ до камери, мікрофона, геопозиції та розпізнавання мовлення в налаштуваннях iOS.';

  @override
  String get termsTitle => 'Умови використання';

  @override
  String get termsIntro =>
      'Користуючись Corvista, ви погоджуєтеся з цими умовами. Також діє стандартна Ліцензійна угода з кінцевим користувачем ліцензованого застосунку Apple.';

  @override
  String get termsUseTitle => 'Використання Corvista';

  @override
  String get termsUse1 =>
      'Corvista — допоміжний засіб для підвищення уважності за кермом і відеореєстратор. Ви завжди несете повну відповідальність за безпечне водіння відповідно до закону.';

  @override
  String get termsUse2 =>
      'Не користуйтеся застосунком так, щоб це відволікало вас під час водіння. Закріплюйте пристрій надійно та відповідно до закону.';

  @override
  String get termsAccuracyTitle => 'Відсутність гарантій точності';

  @override
  String get termsAccuracy1 =>
      'Об’єкти, зони, сповіщення, позначки на мапі, маршрути та погода можуть бути неповними, запізнюватися або бути неправильними. Corvista не керує вашим автомобілем.';

  @override
  String get termsAccuracy2 =>
      'Екстрена функція є експериментальною і може не виявити удар або спрацювати хибно.';

  @override
  String get termsRecordingTitle => 'Закони про запис';

  @override
  String get termsRecording1 =>
      'Закони про відеореєстратори, запис звуку та зйомку людей різняться залежно від країни та регіону. Ви зобов’язані їх дотримуватися, зокрема коли ділитеся кліпами.';

  @override
  String get termsLiabilityTitle => 'Відповідальність';

  @override
  String get termsLiability1 =>
      'Застосунок надається «як є». У межах, дозволених законом, розробник не несе відповідальності за аварії, втрати, штрафи чи збитки, що виникли внаслідок його використання або довіри до його результатів.';

  @override
  String get termsChangesTitle => 'Зміни';

  @override
  String get termsChanges1 =>
      'Ці умови можуть оновлюватися разом із новими версіями застосунку. Якщо ви продовжуєте користуватися застосунком після оновлення, ви приймаєте змінені умови.';

  @override
  String get helpTitle => 'Довідка';

  @override
  String get helpIntro =>
      'Відповіді на поширені запитання. Рекомендації щодо безпеки дивіться в розділі «Інформація про безпеку».';

  @override
  String get helpQSave => 'Як зберегти запис випадку?';

  @override
  String get helpASaveBuffer =>
      'Натисніть велику кнопку «Зберегти випадок» на екрані водіння. Corvista збереже в «Кліпи» останні 20 або 30 секунд із циклічного буфера (вибір у «Налаштування › Запис»).';

  @override
  String get helpQWhere => 'Де зберігаються мої кліпи?';

  @override
  String get helpAWhere =>
      'У закритому сховищі Corvista на вашому iPhone. Вони ніколи не завантажуються. Щоб надіслати або експортувати кліп, скористайтеся «Поділитися» в програвачі.';

  @override
  String get helpQZones => 'Наскільки точні зони близькості?';

  @override
  String get helpAZones =>
      'Зони — це приблизні оцінки за однією камерою на основі типових розмірів об’єктів. Сприймайте їх як орієнтовні підказки, а не як відстані.';

  @override
  String get helpQSlow => 'Чому розпізнавання сповільнюється?';

  @override
  String get helpASlow =>
      'Коли iPhone нагрівається, заряд акумулятора низький або ввімкнено режим енергозбереження, Corvista знижує частоту аналізу, щоб захистити пристрій. Режим живлення можна змінити в налаштуваннях.';

  @override
  String get helpQMap => 'Не працюють мапа, пошук або погода.';

  @override
  String get helpAMap =>
      'Цим функціям потрібні підключення до інтернету та доступ до геопозиції. Перевірте підключення та дозвольте Corvista доступ до геопозиції в налаштуваннях iOS.';

  @override
  String get helpQSimulator => 'Камера відображається як недоступна.';

  @override
  String get helpASimulator =>
      'Переконайтеся, що в налаштуваннях iOS дозволено доступ до камери і що її не використовує інший застосунок. У симуляторі iOS камери немає; замість неї можна використати локальне тестове відео.';

  @override
  String get emergencyMsgNoContacts => 'Спочатку додайте екстрений контакт.';

  @override
  String get cameraStarting => 'Запуск камери…';

  @override
  String get cameraInterrupted => 'Камеру призупинено';

  @override
  String get cameraInterruptedBody =>
      'iOS призупинила камеру, наприклад під час дзвінка або коли її використовує інший застосунок. Вона відновить роботу автоматично.';

  @override
  String get cameraUnavailable => 'Камера недоступна';

  @override
  String get cameraUnavailableBody =>
      'На цьому пристрої немає доступної камери. Для розпізнавання, запису та вигляду паркування потрібна задня камера.';

  @override
  String get cameraRunTestFootage => 'Запустити тестове відео';

  @override
  String get cameraPermissionDenied => 'Доступ до камери вимкнено';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista потрібна камера для розпізнавання, запису відеореєстратора та вигляду паркування. Увімкніть доступ до камери в налаштуваннях.';

  @override
  String get cameraError => 'Помилка камери';

  @override
  String get cameraStopped => 'Камеру зупинено';

  @override
  String get cameraStart => 'Запустити камеру';

  @override
  String get cameraFocusHint => 'Торкніться для фокусування';

  @override
  String get cameraPreviewLabel =>
      'Зображення з камери в реальному часі з розпізнаними об’єктами';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Камера $fps к/с · ШІ $hz Гц · $ms мс · втрачено $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Швидкість $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Немає швидкості GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Курс $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'ЗАП. $seconds с';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Триває запис буфера відеореєстратора, накопичено $seconds із $target секунд';
  }

  @override
  String get hudRecIdle => 'ЗАП. вимк.';

  @override
  String get hudRecSaving => 'Збереження…';

  @override
  String get hudRecError => 'Помилка запису';

  @override
  String get hudAiPaused => 'ШІ на паузі';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count об’єкта',
      many: '$count об’єктів',
      few: '$count об’єкти',
      one: '$count об’єкт',
      zero: 'Немає об’єктів',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'виявлено $count об’єкта',
      many: 'виявлено $count об’єктів',
      few: 'виявлено $count об’єкти',
      one: 'виявлено $count об’єкт',
      zero: 'об’єктів не виявлено',
    );
    return 'Модель ШІ $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Гаряче — ШІ уповільнено';

  @override
  String get hudThermalCritical => 'Перегрів — ШІ на паузі';

  @override
  String hudBatteryLow(String percent) {
    return 'Заряд $percent';
  }

  @override
  String get hudLowPower => 'Енергозбереження';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Погода: $temperature, $condition. Торкніться, щоб дізнатися більше.';
  }

  @override
  String get hudNoGuidance =>
      'Знайдіть пункт призначення на екрані мапи, і тут з’являться покрокові вказівки.';

  @override
  String get navArrived => 'Ви прибули';

  @override
  String get navRerouting => 'Перебудова маршруту…';

  @override
  String get navSearchHint => 'Пошук місця призначення';

  @override
  String get navSearchFieldHint => 'Адреса, місце або заклад';

  @override
  String get navNoResults => 'Відповідних місць немає';

  @override
  String get navSearching => 'Пошук…';

  @override
  String get navSearchStartTyping =>
      'Введіть адресу або назву місця. Результати надає Apple Maps, потрібне підключення до інтернету.';

  @override
  String get navErrorUnavailable =>
      'Пошук і маршрути недоступні — перевірте підключення до інтернету.';

  @override
  String get navErrorNoLocation =>
      'Очікування геопозиції для прокладання маршруту.';

  @override
  String get navErrorPermission =>
      'Доступ до геопозиції вимкнено, тому маршрут не можна почати від вашого місцезнаходження.';

  @override
  String navErrorGeneric(String code) {
    return 'Не вдалося завантажити маршрути ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Маршрути до місця: $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Прибуття о $time';
  }

  @override
  String get navStart => 'Почати';

  @override
  String get navEnd => 'Завершити';

  @override
  String get navEndLabel => 'Завершити навігацію';

  @override
  String navRemaining(String distance, String duration) {
    return 'Залишилося: $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Попередження: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes хв',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours год $minutes хв';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Маршрут $index: $name';
  }

  @override
  String get weatherTitle => 'Погода';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Відчувається як $temperature';
  }

  @override
  String get weatherPrecipitation => 'Опади';

  @override
  String get weatherWind => 'Вітер';

  @override
  String get weatherVisibility => 'Видимість';

  @override
  String get weatherHumidity => 'Вологість';

  @override
  String get weatherHourly => 'Найближчі години';

  @override
  String weatherAsOf(String time) {
    return 'Оновлено: $time';
  }

  @override
  String get weatherRefresh => 'Оновити погоду';

  @override
  String get weatherUnavailable => 'Погода зараз недоступна.';

  @override
  String get weatherNoLocation => 'Для погоди потрібна геопозиція.';

  @override
  String get weatherLegal => 'Джерела даних і правова інформація';

  @override
  String weatherProvidedBy(String service) {
    return 'Дані про погоду: $service';
  }

  @override
  String get weatherNow => 'Зараз';

  @override
  String get virtualEmpty => 'Підтримуваних об’єктів не виявлено';

  @override
  String get virtualEmptyCameraOff =>
      'Для віртуального вигляду потрібна жива камера.';

  @override
  String get virtualLaneDisclaimer =>
      'Лінії смуг умовні, вони не розпізнаються.';

  @override
  String virtualNearest(String zone) {
    return 'Найближчий: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Віртуальна дорожня сцена: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'ШІ: $status';
  }

  @override
  String get virtualStatusLive => 'працює';

  @override
  String get virtualStatusPaused => 'на паузі';

  @override
  String get virtualStatusCameraOff => 'Камера вимк.';

  @override
  String get virtualStatusTestFootage => 'Тестове відео';

  @override
  String get virtualEmptyHint =>
      'Тут з’являться автомобілі, люди, велосипеди, світлофори та знаки «Стоп», коли їх буде виявлено.';

  @override
  String get mapRecenter => 'До мого місця';

  @override
  String get mapZoomIn => 'Збільшити';

  @override
  String get mapZoomOut => 'Зменшити';

  @override
  String get mapUnsupported => 'Інтерактивна мапа доступна на iPhone.';

  @override
  String get mapObjectsApprox =>
      'Позначки об’єктів показують приблизне розташування.';

  @override
  String get mapWeatherUnavailable => 'Погода недоступна';

  @override
  String get navErrorNoRoute => 'Маршрут до цього місця не знайдено.';

  @override
  String get navDismiss => 'Закрити';

  @override
  String get navGo => 'Поїхали';

  @override
  String get navFastest => 'Найшвидший';

  @override
  String get navThen => 'Потім';

  @override
  String get navRecents => 'Нещодавні';

  @override
  String get navClearRecents => 'Очистити';

  @override
  String get navSearchSubmitHint =>
      'Натисніть «Знайти», щоб побачити всі відповідні місця';

  @override
  String get navPlaces => 'Місця';

  @override
  String get navEtaLabel => 'прибуття';

  @override
  String get navTimeLeftLabel => 'залишилось';

  @override
  String get navOverview => 'Весь маршрут';

  @override
  String get navMute => 'Вимкнути голос';

  @override
  String get navUnmute => 'Увімкнути голос';

  @override
  String get navEndConfirm => 'Завершити навігацію?';

  @override
  String navEndConfirmBody(String place) {
    return 'Навігацію до місця «$place» буде зупинено.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Ви прибули: $place';
  }

  @override
  String get navDone => 'Готово';

  @override
  String get navWeakGps => 'Слабкий сигнал GPS';

  @override
  String get navLocationOff =>
      'Геопозицію вимкнено. Увімкніть її, щоб прокладати маршрути й орієнтуватися.';

  @override
  String get navVoiceGuidance => 'Голосові підказки';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Через $distance $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, потім $second';
  }

  @override
  String get navSpeakRerouting => 'Перебудова маршруту';

  @override
  String get navSpeakArrived => 'Ви прибули';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count метра',
      many: '$count метрів',
      few: '$count метри',
      one: '$count метр',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value кілометра',
      many: '$value кілометрів',
      few: '$value кілометри',
      one: '$value кілометр',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фута',
      many: '$count футів',
      few: '$count фути',
      one: '$count фут',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ярда',
      many: '$count ярдів',
      few: '$count ярди',
      one: '$count ярд',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Продовжуйте рух $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Для цієї поїздки в цьому регіоні вказівки недоступні. Спробуйте інше місце призначення.';

  @override
  String navContinueFor(String distance) {
    return 'Продовжуйте рух $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value милі',
      many: '$value миль',
      few: '$value милі',
      one: '$value миля',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Найближчий: $object · $zone';
  }

  @override
  String get parkingNothing => 'У полі зору нічого не виявлено';

  @override
  String get parkingBeeps => 'Сигнали близькості';

  @override
  String get parkingVolume => 'Гучність сигналів';

  @override
  String get parkingLimitations =>
      'Одна камера, не 360°. Об’єкти поза полем зору камери не розпізнаються. Не замінює парктронік; оцінки можуть бути хибними, а відсутність сигналу не означає, що навколо вільно.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Вигляд згори із зонами близькості. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Оригінал';

  @override
  String get perceptionModeBoxes => 'Рамки';

  @override
  String get perceptionModeMasks => 'Маски об’єктів';

  @override
  String get perceptionModeRoad => 'Дорожнє покриття';

  @override
  String get perceptionModeCombined => 'Комбінований';

  @override
  String get perceptionOpacity => 'Прозорість масок';

  @override
  String get perceptionDisclaimer =>
      'Маска дорожнього покриття — приблизний візуальний шар. Вона не показує вільний для проїзду простір чи смуги.';

  @override
  String get perceptionNeedsModel =>
      'Виберіть модель сегментації, щоб побачити маски.';

  @override
  String get perceptionChooseModel => 'Вибрати модель';

  @override
  String get perceptionWaiting => 'Очікування першого кадру сегментації…';

  @override
  String get perceptionShortCamera => 'Камера';

  @override
  String get perceptionShortBoxes => 'Рамки';

  @override
  String get perceptionShortObjects => 'Об’єкти';

  @override
  String get perceptionShortRoad => 'Дорога';

  @override
  String get perceptionShortAll => 'Усе';

  @override
  String get perceptionModesLabel => 'Шари сприйняття';

  @override
  String get perceptionStatusWarmingUp => 'Підготовка…';

  @override
  String get perceptionStatusLoadingModel => 'Завантаження моделі…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps кадр/с';
  }

  @override
  String get perceptionStatusPaused => 'Маски призупинено';

  @override
  String get perceptionLegend => 'Легенда масок';

  @override
  String get perceptionUnavailable => 'Маски недоступні';

  @override
  String get driveSave => 'Зберегти';

  @override
  String get driveSaveIncident => 'Зберегти випадок';

  @override
  String driveSaveHint(int seconds) {
    return 'Зберігає останні $seconds секунд запису відеореєстратора';
  }

  @override
  String get driveSaving => 'Збереження випадку…';

  @override
  String hudRecManualLabel(String time) {
    return 'Триває запис, $time';
  }

  @override
  String get driveRecord => 'Запис';

  @override
  String get driveRecordStartA11y => 'Почати запис';

  @override
  String driveRecordStopA11y(String time) {
    return 'Зупинити запис, записано $time';
  }

  @override
  String get driveRecordHint =>
      'Записує безперервно до зупинки, враховуючи останні 5 секунд';

  @override
  String get driveRecordFailed => 'Не вдалося почати запис';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Запис збережено · $count частини',
      many: 'Запис збережено · $count частин',
      few: 'Запис збережено · $count частини',
      one: 'Запис збережено',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Запис зупинено: пам’ять майже заповнена',
      'max_duration': 'Запис зупинено: досягнуто максимальної тривалості',
      'camera_stopped': 'Запис зупинено разом із камерою',
      'background': 'Запис зупинено: застосунок перейшов у фоновий режим',
      'thermal': 'Запис зупинено: телефон занадто гарячий',
      'other': 'Запис зупинено',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Випадок збережено · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Відкрити';

  @override
  String get driveSaveFailed => 'Не вдалося зберегти випадок.';

  @override
  String get driveSaveNotRunning =>
      'Запис ще не розпочався — зачекайте на запуск камери та повторіть спробу.';

  @override
  String get driveSaveTestFootage =>
      'Тестове відео не записується. Збереження випадків працює з живою камерою.';

  @override
  String get driveSaveStorageFull =>
      'На iPhone закінчилося місце. Звільніть місце або видаліть старі кліпи.';

  @override
  String get driveSaveIoError => 'Не вдалося записати кліп у сховище.';

  @override
  String get driveClips => 'Кліпи';

  @override
  String get driveSettings => 'Налаштування';

  @override
  String get driveViewSwitcher => 'Вигляди водіння';

  @override
  String get driveLocationDenied =>
      'Геопозицію вимкнено — швидкість, мапи та маршрути недоступні.';

  @override
  String get driveCameraDenied =>
      'Доступ до камери вимкнено — розпізнавання та запис недоступні.';

  @override
  String get driveRecorderFallback =>
      'Запис без звуку: доступ до мікрофона вимкнено.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Параметри запису було змінено: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Ваш iPhone гарячий. ШІ працює повільніше, щоб охолонути, — тримайте його поза прямим сонячним промінням і ближче до обдуву.';

  @override
  String get drivePowerThermalCritical =>
      'Ваш iPhone перегрівся. Розпізнавання ШІ призупинено до охолодження; запис триває, якщо це можливо.';

  @override
  String get drivePowerLowPower =>
      'Увімкнено режим енергозбереження — ШІ працює зі зниженою частотою.';

  @override
  String get drivePowerBatteryLow =>
      'Низький заряд акумулятора — підключіть iPhone до живлення на час поїздки.';

  @override
  String get onboardingTitle1 => 'Бачте більше в кожній поїздці.';

  @override
  String get onboardingBody1 =>
      'Перетворіть iPhone на розумний відеореєстратор і помічника, що підвищує уважність за кермом.';

  @override
  String get onboardingTitle2 => 'Інтелект у кожному кадрі.';

  @override
  String get onboardingBody2 =>
      'Розпізнавайте підтримувані автомобілі, людей, велосипеди та дорожні сигнали просто на вашому iPhone.';

  @override
  String get onboardingTitle3 => 'Одна дорога. Різні ракурси.';

  @override
  String get onboardingBody3 =>
      'Перемикайтеся між живим розпізнаванням, віртуальними виглядами, інтерактивними мапами та візуалізацією паркування.';

  @override
  String get onboardingTitle4 => 'Зберігайте важливі моменти.';

  @override
  String get onboardingBody4 =>
      'Зберігайте нещодавні записи відеореєстратора, переглядайте випадки та діліться записами.';

  @override
  String get onboardingTitle5 => 'Безпека та конфіденційність';

  @override
  String get onboardingSafety1 =>
      'Corvista — допоміжний засіб для підвищення уважності за кермом. Дивіться на дорогу.';

  @override
  String get onboardingSafety2 =>
      'Він не керує вашим автомобілем і не замінює ваше судження.';

  @override
  String get onboardingSafety3 =>
      'Розпізнавання та оцінки можуть бути неточними або пропускати об’єкти.';

  @override
  String get onboardingSafety4 =>
      'Обробка відео з камери відбувається на вашому iPhone — відео не завантажується.';

  @override
  String get onboardingSafety5 =>
      'Для мап, пошуку, маршрутів і погоди потрібне підключення до інтернету.';

  @override
  String get onboardingSafety6 =>
      'Надійно закріпіть iPhone так, щоб він не затуляв огляд.';

  @override
  String get onboardingSafety7 => 'Завершіть налаштування до початку поїздки.';

  @override
  String get onboardingAcknowledge =>
      'Я розумію, що Corvista — допоміжний засіб, і залишаюся відповідальним(-ою) за безпечне водіння.';

  @override
  String get onboardingReadSafety => 'Читати повну інформацію про безпеку';

  @override
  String get onboardingNext => 'Далі';

  @override
  String get onboardingSkip => 'Пропустити';

  @override
  String get onboardingAgree => 'Продовжити';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Сторінка $current із $total';
  }

  @override
  String get permTitle => 'Дозволи';

  @override
  String get permIntro =>
      'Corvista запитує лише те, що потрібно для кожної функції. Ви можете змінити це будь-коли в налаштуваннях.';

  @override
  String get permCameraTitle => 'Камера';

  @override
  String get permCameraBody =>
      'Потрібна для розпізнавання, запису відеореєстратора та вигляду паркування. Відео обробляється на вашому iPhone.';

  @override
  String get permLocationTitle => 'Геопозиція';

  @override
  String get permLocationBody =>
      'Використовується для швидкості за GPS, мапи, маршрутів, погоди та позначення збережених кліпів. Лише коли ви користуєтеся застосунком.';

  @override
  String get permMicTitle => 'Мікрофон';

  @override
  String get permSpeechNote =>
      'Розпізнавання мовлення запитується, лише якщо ви ввімкнете голосове скасування екстрених сповіщень.';

  @override
  String get permRequired => 'Обов’язково';

  @override
  String get permOptional => 'Необов’язково';

  @override
  String get permAllow => 'Дозволити';

  @override
  String get permGranted => 'Дозволено';

  @override
  String get permDenied => 'Заборонено';

  @override
  String get permLimited => 'Обмежено';

  @override
  String get permRestricted => 'Обмежено системою';

  @override
  String get permStart => 'Почати поїздку';

  @override
  String get permCameraNeeded =>
      'Ви можете продовжити без доступу до камери, але розпізнавання та запис не працюватимуть, доки ви не дозволите його в налаштуваннях.';

  @override
  String get permSetupIntro =>
      'Для повноцінної роботи Corvista потрібні ці дозволи. Натисніть «Дозволити все», і iOS по черзі запитає кожен. Змінити їх можна будь-коли в налаштуваннях.';

  @override
  String get permCameraLine =>
      'Потрібна для розпізнавання, запису відеореєстратора та вигляду паркування. Відео обробляється на вашому iPhone і ніколи не завантажується.';

  @override
  String get permLocationLine =>
      'Швидкість за GPS, мапа, маршрути, погода та місце збереження кліпів. Лише коли ви користуєтеся застосунком.';

  @override
  String get permMicLine =>
      'Звук із салону в кліпах випадків і розпізнавання фрази скасування під час екстреного сповіщення.';

  @override
  String get permSpeechTitle => 'Розпізнавання мовлення';

  @override
  String get permSpeechLine =>
      'Розпізнає вашу фразу скасування під час екстреного зворотного відліку на вашому iPhone, де це підтримується.';

  @override
  String get permAllowAll => 'Дозволити все';

  @override
  String permAsking(String permission) {
    return 'Запитуємо доступ: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Деякі дозволи вимкнено. Увімкніть їх у налаштуваннях, щоб користуватися цими функціями.';

  @override
  String get permNotNow => 'Не зараз';

  @override
  String get tourLabel => 'Огляд екрана водіння';

  @override
  String tourProgress(int current, int total) {
    return 'Крок $current із $total';
  }

  @override
  String get tourNext => 'Далі';

  @override
  String get tourBack => 'Назад';

  @override
  String get tourSkip => 'Пропустити огляд';

  @override
  String get tourFinish => 'Почати поїздку';

  @override
  String get tourWelcomeTitle => 'Короткий огляд';

  @override
  String get tourWelcomeBody =>
      'Хвилинний огляд головного на екрані водіння. Краще проходити його на стоянці.';

  @override
  String get tourHudTitle => 'Ваша панель приладів';

  @override
  String get tourHudSpeed => 'Швидкість береться з GPS.';

  @override
  String get tourHudRec =>
      '«ЗАП.» показує, скільки секунд запису накопичено в буфері.';

  @override
  String get tourHudAi =>
      'Мітка ШІ показує модель, скільки об’єктів вона бачить, та індикатор: зелений — працює, жовтогарячий — обмежена, червоний — зупинена.';

  @override
  String get tourSaveTitle => 'Зберегти випадок';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista зберігає циклічний буфер відео за останні $seconds секунд. Він постійно перезаписується, тому нічого не зберігається, доки ви не натиснете «Зберегти». Збережені кліпи залишаються на цьому iPhone, у розділі «Кліпи».';
  }

  @override
  String get tourRecordTitle => 'Запишіть усю поїздку';

  @override
  String get tourRecordBody =>
      'Натисніть «Запис», щоб знімати безперервно до зупинки. Довгі поїздки зберігаються в «Кліпи» частинами по 5 хвилин, а «Зберегти випадок» працює й під час запису.';

  @override
  String get tourViewsTitle => 'П’ять способів побачити дорогу';

  @override
  String get tourViewDetection =>
      'Жива камера з рамками навколо підтримуваних об’єктів.';

  @override
  String get tourViewVirtual =>
      'Спрощена 3D-сцена, побудована за розпізнаними об’єктами.';

  @override
  String get tourViewMap => 'Apple Maps із пошуком і покроковою навігацією.';

  @override
  String get tourViewParking => 'Камера та вигляд згори із зонами близькості.';

  @override
  String get tourViewPerception => 'Маски дороги й об’єктів.';

  @override
  String get tourMapTitle => 'Пошук і покрокова навігація';

  @override
  String get tourMapBody =>
      'Відкрийте мапу, торкніться рядка пошуку та виберіть місце призначення. Виберіть маршрут і натисніть «Почати», щоб отримувати покрокові вказівки. Потрібне підключення до інтернету.';

  @override
  String get tourClipsTitle => 'Кліпи';

  @override
  String get tourClipsBody =>
      'Переглядайте, перейменовуйте, надсилайте або видаляйте збережені випадки. Кліпи залишаються на вашому iPhone, доки ви ними не поділитеся.';

  @override
  String get tourSettingsTitle => 'Налаштування';

  @override
  String get tourSettingsBody =>
      'Налаштуйте голосові сповіщення та їхню чутливість, якість запису та довжину буфера, а також екстрений режим — експериментальне сповіщення про удар зі скасовним зворотним відліком.';

  @override
  String get tourSafetyTitle => 'Перед поїздкою';

  @override
  String get tourSafety1 =>
      'Надійно закріпіть iPhone так, щоб він не затуляв огляд.';

  @override
  String get tourSafety2 =>
      'Не користуйтеся застосунком під час водіння. Налаштовуйте все на стоянці.';

  @override
  String get tourSafety3 =>
      'Розпізнавання та зони — це оцінки. Вони можуть бути хибними або пропускати об’єкти.';

  @override
  String get tourSafety4 =>
      'Відповідальність за безпечне водіння залишається за вами.';

  @override
  String get helpTakeTour => 'Пройти огляд';

  @override
  String get helpTakeTourSub => 'Хвилинний огляд екрана водіння.';

  @override
  String get tripsTitle => 'Поїздки';

  @override
  String get tripsOpen => 'Журнал поїздок';

  @override
  String get tripsEmptyTitle => 'Поїздок поки немає';

  @override
  String get tripsEmptyBody =>
      'Поїздки записуються автоматично, поки ви за кермом із Corvista: відстань, час, швидкість і ваш маршрут.';

  @override
  String get tripsDisabledBody =>
      'Журнал поїздок вимкнено, тому нові поїздки не записуються. Увімкніть його, щоб вести приватний журнал маршрутів на цьому iPhone.';

  @override
  String get tripsEnable => 'Увімкнути журнал поїздок';

  @override
  String get tripsToday => 'Сьогодні';

  @override
  String get tripsYesterday => 'Учора';

  @override
  String tripsRecordingNow(String distance) {
    return 'Запис поїздки · $distance';
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
      other: '$count випадку',
      many: '$count випадків',
      few: '$count випадки',
      one: '$count випадок',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сповіщення',
      many: '$count сповіщень',
      few: '$count сповіщення',
      one: '$count сповіщення',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count поїздки',
      many: '$count поїздок',
      few: '$count поїздки',
      one: '$count поїздка',
      zero: 'Немає поїздок',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Відстань';

  @override
  String get tripsStatDuration => 'Тривалість';

  @override
  String get tripsStatMoving => 'Час у русі';

  @override
  String get tripsStatAvgSpeed => 'Середня швидкість';

  @override
  String get tripsStatMaxSpeed => 'Макс. швидкість';

  @override
  String get tripsDetections => 'Розпізнавання';

  @override
  String get tripsNoDetections =>
      'Під час цієї поїздки об’єкти на дорозі не зафіксовано.';

  @override
  String get tripsTimeline => 'Хронологія';

  @override
  String get tripsEventStart => 'Поїздку розпочато';

  @override
  String get tripsEventEnd => 'Поїздку завершено';

  @override
  String get tripsEventAlert => 'Голосове сповіщення';

  @override
  String get tripsEventIncident => 'Кліп випадку збережено';

  @override
  String get tripsEventEmergency => 'Виявлено можливу аварію';

  @override
  String get tripsEventNavStart => 'Навігацію розпочато';

  @override
  String get tripsEventArrive => 'Прибуття до пункту призначення';

  @override
  String get tripsEventReroute => 'Маршрут перебудовано';

  @override
  String get tripsEventRecording => 'Запис збережено';

  @override
  String get tripsOpenClip => 'Відкрити кліп';

  @override
  String get tripsTrackPreview => 'Трек GPS';

  @override
  String get tripsRenameTitle => 'Перейменувати поїздку';

  @override
  String get tripsRenameHint => 'Назва поїздки';

  @override
  String get tripsFavorite => 'Додати до обраного';

  @override
  String get tripsUnfavorite => 'Прибрати з обраного';

  @override
  String get tripsShareGpx => 'Поділитися GPX';

  @override
  String get tripsShareFailed => 'Не вдалося поділитися поїздкою.';

  @override
  String get tripsDelete => 'Видалити поїздку';

  @override
  String get tripsDeleteConfirmTitle => 'Видалити цю поїздку?';

  @override
  String get tripsDeleteConfirmBody =>
      'Маршрут і статистику буде видалено з цього iPhone. Кліпи випадків із цієї поїздки збережуться.';

  @override
  String get tripsDeleted => 'Поїздку видалено';

  @override
  String get tripsNotFound => 'Ця поїздка більше недоступна.';

  @override
  String get tripsPrivacyNote =>
      'Зберігається лише на цьому iPhone. Нічого не завантажується.';

  @override
  String get settingsSectionTrips => 'Журнал поїздок';

  @override
  String get settingsTripLog => 'Записувати поїздки';

  @override
  String get settingsTripLogSubtitle =>
      'Зберігає ваш маршрут і статистику поїздок лише на цьому iPhone.';

  @override
  String get settingsTripRetention => 'Зберігати поїздки';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days днів',
      few: '$days дні',
      one: '$days день',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 рік';

  @override
  String get settingsRetentionForever => 'Завжди';

  @override
  String get settingsTripRetentionFooter =>
      'Старі поїздки автоматично видаляються під час запуску Corvista.';

  @override
  String get settingsViewTrips => 'Показати поїздки';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours год $minutes хв';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes хв';
  }

  @override
  String tripsGpxName(String date) {
    return 'Поїздка Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Звільнити місце';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Видаляє тимчасові файли та кеш. Збережені кліпи й поїздки залишаються.';

  @override
  String settingsFreedBytes(String size) {
    return 'Звільнено: $size';
  }

  @override
  String get settingsNothingToFree =>
      'Кеш очищено — тимчасових файлів для видалення немає.';

  @override
  String get settingsSectionPrivacyData => 'Конфіденційність і дані';

  @override
  String get settingsPrivacyDataFooter =>
      'Кліпи, поїздки та налаштування зберігаються лише на цьому iPhone. Вони залишають його, лише якщо ви вирішите ними поділитися.';

  @override
  String get settingsDeleteAllData => 'Видалити всі дані';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Стерти кліпи, поїздки, контакти й налаштування на цьому iPhone';

  @override
  String get deleteAllTitle => 'Видалити всі дані?';

  @override
  String get deleteAllMessage =>
      'З цього iPhone буде остаточно видалено:\n• Кліпи випадків і мініатюри\n• Журнал поїздок і треки GPS\n• Екстрені контакти й екстрені події\n• Журнали розпізнавання та журнал діагностики\n• Налаштування й нещодавні місця призначення\n• Тимчасовий буфер запису та кеш\n\nЦю дію не можна скасувати. Після цього Corvista запуститься знову з екранів привітання.';

  @override
  String get deleteAllConfirm => 'Видалити все';

  @override
  String get deleteAllInProgress => 'Видалення…';

  @override
  String get deleteAllDone => 'Усі дані видалено';

  @override
  String get deleteAllPartial =>
      'Не вдалося видалити деякі елементи. Повторіть спробу в налаштуваннях.';

  @override
  String get diagLogSection => 'Журнал діагностики';

  @override
  String get diagLogFooter =>
      'Помилки записуються лише на цьому iPhone, без геопозиції, імен контактів і номерів телефонів. Нічого не надсилається, доки ви самі не поділитеся журналом.';

  @override
  String get diagLogShare => 'Поділитися журналом діагностики';

  @override
  String get diagLogEmpty => 'Порожньо';

  @override
  String get diagLogClear => 'Очистити журнал';

  @override
  String get diagLogClearTitle => 'Очистити журнал діагностики?';

  @override
  String get diagLogClearBody =>
      'Збережені записи про помилки буде видалено з цього iPhone.';

  @override
  String get diagLogCleared => 'Журнал діагностики очищено';

  @override
  String get diagLogShareFailed =>
      'Не вдалося поділитися журналом діагностики.';

  @override
  String get privacyControls2 =>
      '«Налаштування › Конфіденційність і дані › Видалити всі дані» стирає всі кліпи, поїздки, контакти, журнали й налаштування, які Corvista зберігає на цьому iPhone.';

  @override
  String get parkingZoneStop => 'Стоп';

  @override
  String get parkingZoneVeryClose => 'Дуже близько';

  @override
  String get parkingZoneClose => 'Близько';

  @override
  String get parkingZoneNothingClose => 'Поруч нічого не видно';

  @override
  String get parkingNotDetected =>
      'Стіни, стовпи, опори та бордюри не розпізнаються';

  @override
  String get parkingApprox => '≈';

  @override
  String get parkingSideLeft => 'Ліворуч';

  @override
  String get parkingSideCenter => 'По центру';

  @override
  String get parkingSideRight => 'Праворуч';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Лише вид із передньої камери — це не система кругового огляду 360°';

  @override
  String get parkingMuteBeeps => 'Вимкнути сигнали';

  @override
  String get parkingUnmuteBeeps => 'Увімкнути сигнали';

  @override
  String get parkingAbout => 'Про режим паркування';

  @override
  String get parkingLimitationsDetail =>
      'Контролюється лише ділянка перед камерою. Розпізнаються легкові автомобілі, автобуси й вантажівки, люди, велосипеди та мотоцикли. Стіни, стовпи, опори, бордюри, болларди, шлагбауми й низькі перешкоди НЕ розпізнаються, а капот може затуляти землю просто перед автомобілем. Відстані — груба оцінка за однією камерою (розмір і положення об’єкта), і вона може сильно помилятися. Тиша або напис «Поруч нічого не видно» не означає, що шлях вільний: завжди оглядайтеся й користуйтеся дзеркалами.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Близькість за сторонами: ліворуч $left, по центру $center, праворуч $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Помилки записуються в закритий журнал на цьому iPhone (без геопозиції, імен контактів і номерів телефонів). Він ніколи не надсилається автоматично; ним можна поділитися або очистити його в «Налаштування › Діагностика».';
}
