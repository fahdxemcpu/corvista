// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Видьте больше в каждой поездке.';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonBack => 'Назад';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get commonRetry => 'Повторить';

  @override
  String get commonOpenSettings => 'Открыть настройки';

  @override
  String get commonLoading => 'Загрузка…';

  @override
  String get commonError => 'Что-то пошло не так.';

  @override
  String commonErrorDetail(String message) {
    return 'Что-то пошло не так: $message';
  }

  @override
  String get commonOn => 'Вкл.';

  @override
  String get commonOff => 'Выкл.';

  @override
  String get commonRename => 'Переименовать';

  @override
  String get commonShare => 'Поделиться';

  @override
  String get commonNotAvailable => 'Недоступно';

  @override
  String get commonTestFootage => 'ТЕСТОВОЕ ВИДЕО';

  @override
  String get zoneVeryClose => 'Очень близко';

  @override
  String get zoneClose => 'Близко';

  @override
  String get zoneMedium => 'Средне';

  @override
  String get zoneFar => 'Далеко';

  @override
  String get zoneUnknown => 'Неизвестно';

  @override
  String get classPerson => 'Человек';

  @override
  String get classBicycle => 'Велосипед';

  @override
  String get classMotorcycle => 'Мотоцикл';

  @override
  String get classCar => 'Транспорт';

  @override
  String get classBus => 'Автобус';

  @override
  String get classTrafficLight => 'Светофор';

  @override
  String get classStopSign => 'Знак «Стоп»';

  @override
  String get viewDetection => 'Распознавание';

  @override
  String get viewVirtual => 'Виртуальный';

  @override
  String get viewMap => 'Карта';

  @override
  String get viewParking => 'Парковка';

  @override
  String get viewPerception => 'Восприятие';

  @override
  String get unitKmh => 'км/ч';

  @override
  String get unitMph => 'миль/ч';

  @override
  String get lightRed => 'Красный';

  @override
  String get lightYellow => 'Жёлтый';

  @override
  String get lightGreen => 'Зелёный';

  @override
  String get lightUnknown => 'Неизвестно';

  @override
  String get clipsTitle => 'Клипы';

  @override
  String get clipsSelect => 'Выбрать';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выбрано: $count',
      zero: 'Выберите клипы',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Выбрать все';

  @override
  String get clipsDeselectAll => 'Снять выбор';

  @override
  String get clipsDeleteSelected => 'Удалить выбранные';

  @override
  String get clipsGridView => 'Сетка';

  @override
  String get clipsListView => 'Список';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить $count клипа?',
      many: 'Удалить $count клипов?',
      few: 'Удалить $count клипа?',
      one: 'Удалить $count клип?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Видео будут безвозвратно удалены с вашего iPhone. Это действие нельзя отменить.',
      many: 'Видео будут безвозвратно удалены с вашего iPhone. Это действие нельзя отменить.',
      few: 'Видео будут безвозвратно удалены с вашего iPhone. Это действие нельзя отменить.',
      one: 'Видео будет безвозвратно удалено с вашего iPhone. Это действие нельзя отменить.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалено клипов: $count',
      many: 'Удалено клипов: $count',
      few: 'Удалено клипов: $count',
      one: 'Удалён $count клип',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Клипов пока нет';

  @override
  String get clipsEmptyBody =>
      'Во время поездки Corvista хранит короткий циклический буфер. Нажмите «Сохранить случай», чтобы оставить здесь последние секунды записи.';

  @override
  String get clipsLoadError => 'Не удалось загрузить клипы.';

  @override
  String get clipsStorageTitle => 'Хранилище';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Клипы $clips · Буфер $buffer · Свободно $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сохранённого клипа',
      many: '$count сохранённых клипов',
      few: '$count сохранённых клипа',
      one: '$count сохранённый клип',
      zero: 'Нет сохранённых клипов',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'На iPhone мало свободного места. Новые записи могут не сохраниться.';

  @override
  String get clipsMissingFile => 'Нет файла';

  @override
  String get clipsEmergencyBadge => 'Удар';

  @override
  String clipsUntitled(String date) {
    return 'Случай · $date';
  }

  @override
  String get clipsAudio => 'Звук записан';

  @override
  String get clipsFavorite => 'Избранное';

  @override
  String get clipsUnfavorite => 'Убрать из избранного';

  @override
  String get clipsLocation => 'Место сохранено';

  @override
  String clipsOpenClip(String title) {
    return 'Открыть клип $title';
  }

  @override
  String get playerNotFoundTitle => 'Клип не найден';

  @override
  String get playerNotFoundBody => 'Возможно, этот клип был удалён.';

  @override
  String get playerMissingTitle => 'Видеофайл отсутствует';

  @override
  String get playerMissingBody =>
      'Записи этого клипа больше нет на вашем iPhone. Вы можете удалить запись из галереи.';

  @override
  String get playerRemoveEntry => 'Удалить запись';

  @override
  String get playerLoadError => 'Не удаётся воспроизвести это видео.';

  @override
  String get playerPlay => 'Воспроизвести';

  @override
  String get playerPause => 'Пауза';

  @override
  String get playerReplay => 'Повторить';

  @override
  String get playerRenameTitle => 'Переименовать клип';

  @override
  String get playerRenameHint => 'Название клипа';

  @override
  String get playerRenamed => 'Клип переименован';

  @override
  String get playerFavorited => 'Добавлено в избранное';

  @override
  String get playerUnfavorited => 'Удалено из избранного';

  @override
  String get playerShareFailed => 'Не удалось поделиться клипом.';

  @override
  String get playerDetails => 'Сведения';

  @override
  String get playerDate => 'Записано';

  @override
  String get playerDuration => 'Длительность';

  @override
  String get playerResolution => 'Разрешение';

  @override
  String get playerSize => 'Размер файла';

  @override
  String get playerAudio => 'Звук';

  @override
  String get playerAudioYes => 'Записан';

  @override
  String get playerAudioNo => 'Не записан';

  @override
  String get playerReason => 'Сохранено';

  @override
  String get playerReasonManual => 'Кнопкой «Сохранить случай»';

  @override
  String get playerReasonEmergency => 'Обнаружен возможный удар';

  @override
  String get playerReasonRecovered => 'Восстановлено после прерывания';

  @override
  String get playerSpeed => 'Скорость GPS при сохранении';

  @override
  String get playerLocation => 'Место';

  @override
  String get playerOpenInMaps => 'Открыть в Картах';

  @override
  String get playerBack => 'Назад';

  @override
  String get playerMore => 'Ещё';

  @override
  String get clipsFilterLabel => 'Показать';

  @override
  String get clipsFilterAll => 'Все';

  @override
  String get clipsFilterRecordings => 'Записи';

  @override
  String get clipsFilterIncidents => 'Случаи';

  @override
  String get clipsFilterEmergency => 'Экстренные';

  @override
  String get clipsFilterFavorites => 'Избранное';

  @override
  String get clipsSort => 'Сортировка';

  @override
  String get clipsSortNewest => 'Сначала новые';

  @override
  String get clipsSortOldest => 'Сначала старые';

  @override
  String get clipsSortLongest => 'Сначала длинные';

  @override
  String get clipsSortLargest => 'Сначала большие';

  @override
  String get clipsToday => 'Сегодня';

  @override
  String get clipsYesterday => 'Вчера';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа',
      many: '$count клипов',
      few: '$count клипа',
      one: '$count клип',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'В этой категории пока нет клипов.';

  @override
  String get clipsFavoritesEmpty =>
      'Отметьте клип звёздочкой, чтобы он был здесь под рукой.';

  @override
  String get clipsKindRecording => 'Запись';

  @override
  String get clipsKindIncident => 'Случай';

  @override
  String get clipsKindEmergency => 'Экстренный';

  @override
  String get clipsKindTest => 'Тест';

  @override
  String clipsTripChip(String time) {
    return 'Поездка · $time';
  }

  @override
  String get clipsOpenTrip => 'Открыть поездку, в которой записан этот клип';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return 'Занято: $used · Свободно: $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Клипы занимают $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записи',
      many: '$count записей',
      few: '$count записи',
      one: '$count запись',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count случая',
      many: '$count случаев',
      few: '$count случая',
      one: '$count случай',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count экстренных',
      many: '$count экстренных',
      few: '$count экстренных',
      one: '$count экстренный',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Освободить место';

  @override
  String get clipsStorageLowGentle =>
      'Свободно менее 2 ГБ. Чтобы запись шла без сбоев, освободите место или удалите ненужные клипы.';

  @override
  String get clipsSaveToPhotos => 'Сохранить в «Фото»';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа',
      many: '$count клипов',
      few: '$count клипа',
      one: '$count клип',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить $count клипа ($size)?',
      many: 'Удалить $count клипов ($size)?',
      few: 'Удалить $count клипа ($size)?',
      one: 'Удалить этот клип ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Сохранение в «Фото»: $done из $total…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа сохранено в «Фото»',
      many: '$count клипов сохранено в «Фото»',
      few: '$count клипа сохранено в «Фото»',
      one: 'Сохранено в «Фото»',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return 'Сохранено в «Фото»: $saved · Не удалось сохранить: $failed';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista не разрешено добавлять видео в «Фото». Это можно разрешить в настройках.';

  @override
  String get clipsPhotosFailed => 'Не удалось сохранить в «Фото».';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа добавлено в избранное',
      many: '$count клипов добавлено в избранное',
      few: '$count клипа добавлено в избранное',
      one: 'Добавлено в избранное',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа удалено из избранного',
      many: '$count клипов удалено из избранного',
      few: '$count клипа удалено из избранного',
      one: 'Удалено из избранного',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (обрезан)';
  }

  @override
  String get playerTrim => 'Обрезать';

  @override
  String get playerInfo => 'Инфо';

  @override
  String get playerKind => 'Тип';

  @override
  String get playerReasonRecording => 'Кнопка записи';

  @override
  String get trimTitle => 'Обрезка клипа';

  @override
  String get trimHint =>
      'Перетащите маркеры, чтобы выбрать нужную часть. Исходный клип не изменится.';

  @override
  String get trimStartHandle => 'Начало обрезки';

  @override
  String get trimEndHandle => 'Конец обрезки';

  @override
  String trimSelection(String duration) {
    return 'Выбрано: $duration';
  }

  @override
  String get trimSave => 'Сохранить как новый клип';

  @override
  String get trimSaving => 'Сохранение обрезанного клипа…';

  @override
  String get trimSaved => 'Обрезанный клип сохранён';

  @override
  String get trimOpenNew => 'Открыть';

  @override
  String get trimFailed => 'Не удалось обрезать клип.';

  @override
  String get trimStorageFull =>
      'Недостаточно места для сохранения обрезанного клипа.';

  @override
  String get trimPreview => 'Воспроизвести выбранное';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsSectionCamera => 'Камера';

  @override
  String get settingsSectionAi => 'ИИ';

  @override
  String get settingsSectionAlerts => 'Оповещения';

  @override
  String get settingsSectionAlertCategories => 'Категории оповещений';

  @override
  String get settingsSectionRecording => 'Запись';

  @override
  String get settingsSectionDriving => 'Вождение';

  @override
  String get settingsSectionPower => 'Питание';

  @override
  String get settingsSectionEmergency => 'Экстренные случаи';

  @override
  String get settingsSectionAppearance => 'Оформление';

  @override
  String get settingsSectionLanguage => 'Язык';

  @override
  String get settingsSectionInformation => 'Информация';

  @override
  String get settingsCameraLens => 'Объектив камеры';

  @override
  String get settingsLensWide => 'Широкоугольный';

  @override
  String get settingsLensUltraWide => 'Сверхширокоугольный';

  @override
  String get settingsLensTelephoto => 'Телеобъектив';

  @override
  String get settingsLensUnavailable => 'Недоступно на этом iPhone';

  @override
  String get settingsStabilization => 'Стабилизация';

  @override
  String get settingsStabAuto => 'Авто';

  @override
  String get settingsStabOff => 'Выкл.';

  @override
  String get settingsStabStandard => 'Стандартная';

  @override
  String get settingsStabCinematic => 'Киношная';

  @override
  String get settingsOverlayOpacity => 'Прозрачность наложения';

  @override
  String get settingsShowFps => 'Показывать данные о производительности';

  @override
  String get settingsShowFpsSubtitle =>
      'Частота кадров и время обработки на экране распознавания';

  @override
  String get settingsCameraFooter =>
      'Изменения объектива и стабилизации применяются при следующем запуске камеры.';

  @override
  String get settingsAiModel => 'Модель ИИ';

  @override
  String get settingsConfidence => 'Достоверность распознавания';

  @override
  String get settingsTracking => 'Отслеживание объектов';

  @override
  String get settingsTrackingSubtitle =>
      'Удерживает объекты стабильными между кадрами';

  @override
  String get settingsShowLabels => 'Показывать подписи';

  @override
  String get settingsShowConfidence => 'Показывать достоверность';

  @override
  String get settingsSegmentationOpacity => 'Прозрачность масок восприятия';

  @override
  String get settingsAiFooter =>
      'Более низкая достоверность показывает больше объектов, но и больше ложных срабатываний. Распознавание может быть неточным.';

  @override
  String get settingsVoiceAlerts => 'Голосовые оповещения';

  @override
  String get settingsVoiceLanguage => 'Язык голоса';

  @override
  String get settingsVoiceLanguageAuto => 'Как в приложении';

  @override
  String get settingsVoice => 'Голос';

  @override
  String get settingsVoiceDefault => 'Системный';

  @override
  String get settingsVoiceQualityEnhanced => 'Улучшенный';

  @override
  String get settingsVoiceQualityPremium => 'Высокое качество';

  @override
  String get settingsNoVoices =>
      'Для этого языка не установлен ни один голос. Добавьте его в «Настройки iOS» › «Универсальный доступ» › «Речь».';

  @override
  String get settingsAlertPedestrian => 'Пешеходы';

  @override
  String get settingsAlertCyclist => 'Велосипедисты';

  @override
  String get settingsAlertMotorcycle => 'Мотоциклы';

  @override
  String get settingsAlertBus => 'Автобусы';

  @override
  String get settingsAlertVehicleClose => 'Транспорт очень близко впереди';

  @override
  String get settingsAlertTrafficLight => 'Смена сигнала светофора';

  @override
  String get settingsAlertTrafficMoving => 'Поток впереди тронулся';

  @override
  String get settingsAlertStopSign => 'Знаки «Стоп»';

  @override
  String get settingsSensitivity => 'Чувствительность';

  @override
  String get settingsSensitivityLow => 'Низкая';

  @override
  String get settingsSensitivityMedium => 'Средняя';

  @override
  String get settingsSensitivityHigh => 'Высокая';

  @override
  String get settingsCooldown => 'Интервал повтора';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds с';
  }

  @override
  String get settingsVolume => 'Громкость голоса';

  @override
  String get settingsQuietMode => 'Тихий режим';

  @override
  String get settingsQuietModeSubtitle =>
      'Озвучиваются только самые важные оповещения';

  @override
  String get settingsTestVoice => 'Проверить голос';

  @override
  String get settingsTestVoiceDone => 'Воспроизводится пример оповещения…';

  @override
  String get settingsParkingBeeps => 'Сигналы парковки';

  @override
  String get settingsBeepVolume => 'Громкость сигналов';

  @override
  String get settingsAlertsFooter =>
      'Оповещения — лишь вспомогательное средство. Всегда следите за дорогой: отсутствие сигнала не означает, что путь свободен.';

  @override
  String get settingsRecordingProfile => 'Качество записи';

  @override
  String get settingsProfileStandard => 'Стандартное · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Буфер записи';

  @override
  String settingsBufferSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds секунды',
      many: '$seconds секунд',
      few: '$seconds секунды',
      one: '$seconds секунда',
    );
    return '$_temp0';
  }

  @override
  String get settingsManualMaxLength => 'Макс. длина ручной записи';

  @override
  String get settingsManualMaxUnlimited => 'Без ограничений';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String get settingsRecordAudio => 'Записывать звук';

  @override
  String get settingsRecordAudioSubtitle =>
      'Добавляет звук из салона в сохранённые записи';

  @override
  String get settingsMicDenied =>
      'Доступ к микрофону выключен. Разрешите его в настройках, чтобы записывать звук.';

  @override
  String get settingsWatermark => 'Водяной знак Corvista';

  @override
  String get settingsTimestamp => 'Дата и время на видео';

  @override
  String get settingsSaveLocation => 'Сохранять место вместе с клипами';

  @override
  String get settingsStorage => 'Хранилище и клипы';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клипа',
      many: '$count клипов',
      few: '$count клипа',
      one: '$count клип',
      zero: 'Нет клипов',
    );
    return '$_temp0 · занято $used · свободно $free';
  }

  @override
  String get settingsRecordingFooter =>
      'Циклический буфер хранится только на вашем iPhone и постоянно перезаписывается. В фоновом режиме ничего не записывается.';

  @override
  String get settingsDefaultView => 'Вид по умолчанию';

  @override
  String get settingsUnits => 'Единицы измерения';

  @override
  String get settingsShowCompass => 'Показывать компас';

  @override
  String get settingsHudStyle => 'Стиль HUD';

  @override
  String get settingsHudCustomize => 'Настроить HUD';

  @override
  String get settingsDrivingSide => 'Сторона движения';

  @override
  String get settingsDrivingSideAuto => 'Авто';

  @override
  String get settingsDrivingSideRight => 'Правостороннее';

  @override
  String get settingsDrivingSideLeft => 'Левостороннее';

  @override
  String get settingsVirtualStyle => 'Стиль виртуального вида';

  @override
  String get settingsVirtualMinimal => 'Минимальный';

  @override
  String get settingsVirtualPerspective => 'Перспектива';

  @override
  String get settingsVirtualHighContrast => 'Высокий контраст';

  @override
  String get settingsKeepScreenOn => 'Не гасить экран во время вождения';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Показывать пошаговые указания маршрута на экране блокировки и в Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Запись приостановлена, пока Corvista был в фоновом режиме';

  @override
  String get liveActivityRec => 'ЗАП.';

  @override
  String get liveActivityPaused => 'Пауза';

  @override
  String get liveActivityDashcamOff => 'Камера выкл.';

  @override
  String get liveActivityEnded => 'Навигация завершена';

  @override
  String get liveActivityEta => 'Прибытие';

  @override
  String get settingsAutoRecenter => 'Автоцентрирование карты';

  @override
  String get settingsHudStyleClassic => 'Классический';

  @override
  String get settingsHudStyleGrid => 'Сетка';

  @override
  String get settingsHudStyleMinimal => 'Минимальный';

  @override
  String get settingsHudStylePerformance => 'Спортивный';

  @override
  String get settingsHudStyleNavigation => 'Навигация';

  @override
  String get settingsHudStyleNight => 'Ночной';

  @override
  String get settingsHudStyleHighContrast => 'Высокий контраст';

  @override
  String get settingsPowerMode => 'Режим питания';

  @override
  String get settingsPowerBalanced => 'Сбалансированный';

  @override
  String get settingsPowerPerformance => 'Производительность';

  @override
  String get settingsPowerSaver => 'Экономия';

  @override
  String get settingsPowerFooter =>
      'Corvista автоматически снижает частоту работы ИИ и визуальные эффекты, когда iPhone нагревается или заряд батареи низкий.';

  @override
  String get settingsThermal => 'Температура';

  @override
  String get settingsThermalNominal => 'Норма';

  @override
  String get settingsThermalFair => 'Тёплый';

  @override
  String get settingsThermalSerious => 'Горячий';

  @override
  String get settingsThermalCritical => 'Критическая';

  @override
  String get settingsBattery => 'Аккумулятор';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Зарядка';
  }

  @override
  String get settingsLowPowerMode =>
      'Включён режим энергосбережения — ИИ работает с пониженной частотой.';

  @override
  String get settingsAiRate => 'Текущая частота ИИ';

  @override
  String settingsHzValue(String value) {
    return '$value Гц';
  }

  @override
  String get settingsEmergencySetup => 'Обнаружение удара';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Вкл. · обратный отсчёт $seconds с';
  }

  @override
  String get settingsEmergencyFooter =>
      'Экспериментальная функция. Не заменяет экстренные службы.';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get settingsThemeSystem => 'Системная';

  @override
  String get settingsThemeDark => 'Тёмная';

  @override
  String get settingsThemeLight => 'Светлая';

  @override
  String get settingsReduceMotion => 'Уменьшение движения';

  @override
  String get settingsReduceMotionSubtitle =>
      'Минимизирует анимацию во всём приложении';

  @override
  String get settingsAppLanguage => 'Язык приложения';

  @override
  String get settingsPrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get settingsTerms => 'Условия использования';

  @override
  String get settingsHelp => 'Справка';

  @override
  String get settingsSupport => 'Связаться с поддержкой';

  @override
  String get settingsLicenses => 'Лицензии открытого ПО';

  @override
  String get settingsSupportUnavailable =>
      'Не удалось открыть Почту. Напишите на support@corvista.app.';

  @override
  String get settingsSafety => 'Информация о безопасности';

  @override
  String get settingsDiagnostics => 'Диагностика';

  @override
  String get settingsVersion => 'Версия';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Настройка HUD';

  @override
  String get hudCustomPreview => 'Просмотр · примерные значения';

  @override
  String get hudCustomStyle => 'Стиль';

  @override
  String get hudCustomElements => 'Элементы';

  @override
  String get hudCustomSpeed => 'Скорость';

  @override
  String get hudCustomHeading => 'Курс и компас';

  @override
  String get hudCustomClock => 'Часы';

  @override
  String get hudCustomBattery => 'Аккумулятор и температура';

  @override
  String get hudCustomDetections => 'Состояние ИИ и объекты';

  @override
  String get hudCustomWeather => 'Погода';

  @override
  String get hudCustomAppearance => 'Размер и прозрачность';

  @override
  String get hudCustomSize => 'Размер';

  @override
  String get hudCustomOpacity => 'Прозрачность';

  @override
  String get hudCustomFooter =>
      'Предупреждения, например о перегреве, показываются всегда, даже если элементы скрыты.';

  @override
  String get hudCustomDescClassic => 'Сбалансированная приборная панель';

  @override
  String get hudCustomDescGrid => 'Перспективная сетка поверх дороги';

  @override
  String get hudCustomDescMinimal => 'Только скорость, ничего лишнего';

  @override
  String get hudCustomDescPerformance =>
      'Дуга скорости с текущими показателями';

  @override
  String get hudCustomDescNavigation => 'Ближайший манёвр на первом плане';

  @override
  String get hudCustomDescNight =>
      'Приглушённый, с красным оттенком для ночной езды';

  @override
  String get hudCustomDescHighContrast =>
      'Максимальная читаемость на ярком солнце';

  @override
  String get languageTitle => 'Язык';

  @override
  String get languageSystem => 'Системный';

  @override
  String get languageSystemSubtitle => 'Использовать язык вашего iPhone';

  @override
  String get languageFooter =>
      'Скоро появятся новые языки. Язык голосовых оповещений можно выбрать отдельно в разделе «Оповещения».';

  @override
  String get diagTitle => 'Диагностика';

  @override
  String get diagPerformance => 'Производительность';

  @override
  String get diagInference => 'Время обработки';

  @override
  String get diagDetectHz => 'Частота распознавания';

  @override
  String get diagCameraFps => 'Частота кадров камеры';

  @override
  String get diagMemory => 'Память';

  @override
  String get diagDropped => 'Потерянные кадры';

  @override
  String get diagSegmentation => 'Время сегментации';

  @override
  String get diagCamera => 'Камера';

  @override
  String get diagStatus => 'Состояние';

  @override
  String get diagSource => 'Источник';

  @override
  String get diagSourceCamera => 'Живая камера';

  @override
  String get diagSourceFile => 'Файл тестового видео';

  @override
  String get diagResolution => 'Размер буфера';

  @override
  String get diagLens => 'Объектив';

  @override
  String get diagError => 'Последняя ошибка';

  @override
  String get diagModel => 'Модель ИИ';

  @override
  String get diagModelLoad => 'Время загрузки модели';

  @override
  String get diagPower => 'Питание';

  @override
  String get diagSegHz => 'Частота сегментации';

  @override
  String get diagReduced => 'Сниженные эффекты';

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
  String get diagCamIdle => 'Простаивает';

  @override
  String get diagCamStarting => 'Запуск';

  @override
  String get diagCamRunning => 'Работает';

  @override
  String get diagCamInterrupted => 'Прервана';

  @override
  String get diagCamStopped => 'Остановлена';

  @override
  String get diagCamUnavailable => 'Недоступна';

  @override
  String get diagCamPermissionDenied => 'Доступ запрещён';

  @override
  String get diagCamError => 'Ошибка';

  @override
  String get diagTestFootage => 'Тестовое видео';

  @override
  String get diagTestFootageBody =>
      'Запускает настоящее распознавание на устройстве по локальному видеофайлу вместо камеры. На каждом экране отображается метка «ТЕСТОВОЕ ВИДЕО».';

  @override
  String get diagPathLabel => 'Путь к видеофайлу';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Использовать Documents/test_drive.mp4';

  @override
  String get diagRun => 'Запустить тестовое видео';

  @override
  String get diagRunStarted =>
      'Тестовое видео запущено. Откройте экран вождения, чтобы увидеть его.';

  @override
  String get diagBackToCamera => 'Вернуться к живой камере';

  @override
  String get diagDebugOnly =>
      'Тестовое видео доступно только в сборках для разработки.';

  @override
  String get diagFileMissing => 'По этому пути нет файла.';

  @override
  String get emergencySetupTitle => 'Обнаружение удара';

  @override
  String get emergencyExperimental => 'Экспериментально';

  @override
  String get emergencyIntro =>
      'Во время поездки Corvista может отслеживать возможный сильный удар с помощью датчиков движения вашего iPhone. Если удар обнаружен, начинается обратный отсчёт. Если вы его не отмените, Corvista предложит позвонить в экстренные службы и отправить сообщение вашим контактам.';

  @override
  String get emergencyDisclaimer1 =>
      'Не заменяет экстренные службы и собственную систему обнаружения аварий вашего автомобиля.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS всегда запрашивает подтверждение, прежде чем совершить звонок или отправить сообщение.';

  @override
  String get emergencyDisclaimer3 =>
      'Удары могут быть пропущены, а резкое торможение или неровности дороги могут быть приняты за удар.';

  @override
  String get emergencyParkedWarning =>
      'Выполняйте эту настройку на стоянке. Пока автомобиль движется, настройки заблокированы.';

  @override
  String get emergencyEnable => 'Включить обнаружение удара';

  @override
  String get emergencyEnableSubtitle => 'Работает только во время поездки';

  @override
  String get emergencyNeedNumber => 'Сначала добавьте экстренный номер.';

  @override
  String get emergencyContacts => 'Экстренные контакты';

  @override
  String get emergencyAddContact => 'Добавить контакт';

  @override
  String get emergencyNoContacts =>
      'Контактов пока нет. Сообщение контактам отправляется только после вашего подтверждения.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Удалить контакт $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'После удара он не будет предлагаться в качестве получателя.';

  @override
  String get emergencyRemove => 'Удалить';

  @override
  String get emergencyContactsError => 'Не удалось загрузить контакты.';

  @override
  String get emergencyNumber => 'Экстренный номер';

  @override
  String get emergencyNumberHint => 'напр., 112 или 911';

  @override
  String get emergencyMessage => 'Шаблон сообщения';

  @override
  String get emergencyMessageDefault =>
      'Возможно, я попал(а) в аварию. Это сообщение подготовлено Corvista и содержит моё последнее известное местоположение, если оно доступно.';

  @override
  String get emergencyMessageHint =>
      'Оставьте пустым, чтобы использовать сообщение по умолчанию.';

  @override
  String get emergencyCountdown => 'Длительность обратного отсчёта';

  @override
  String get emergencyVoiceCancel => 'Отмена голосом';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Во время обратного отсчёта скажите «Я в порядке» или «Отмена». По возможности используется распознавание речи на устройстве.';

  @override
  String get emergencyVoicePermDenied =>
      'Для голосовой отмены нужен доступ к микрофону и распознаванию речи.';

  @override
  String get emergencyAutoSave => 'Сохранять запись происшествия автоматически';

  @override
  String get emergencyTest => 'Проверить обратный отсчёт (без звонка)';

  @override
  String get emergencyTestBody =>
      'Запускает имитацию удара, чтобы вы увидели обратный отсчёт. В тестовом режиме звонки и сообщения не отправляются.';

  @override
  String get emergencyNotSet => 'Не задано';

  @override
  String get emergencyAlertHeadline => 'Обнаружен возможный сильный удар.';

  @override
  String get emergencyAlertSubtitle => 'Вы в порядке?';

  @override
  String get emergencyAlertCancel => 'Я в порядке — Отмена';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Осталось $seconds секунды',
      many: 'Осталось $seconds секунд',
      few: 'Осталось $seconds секунды',
      one: 'Осталась $seconds секунда',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Слушаю — скажите «Я в порядке», чтобы отменить';

  @override
  String emergencyAlertHeard(String text) {
    return 'Распознано: «$text»';
  }

  @override
  String get emergencyAlertEscalated => 'Ответа нет. Выберите действие:';

  @override
  String get emergencyAlertCall => 'Позвонить в экстренные службы';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Вызов $number. iOS запросит подтверждение.';
  }

  @override
  String get emergencyAlertMessage => 'Написать контактам';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Откроется подготовленное сообщение. Отправлять ли его, решаете вы.';

  @override
  String get emergencyAlertTestMode =>
      'Тестовый режим — звонок не будет совершён';

  @override
  String get emergencyAlertTestBadge => 'ТЕСТ';

  @override
  String get emergencyAlertClose => 'Я в порядке — Закрыть';

  @override
  String get emergencyMsgSent => 'Сообщение отправлено.';

  @override
  String get emergencyMsgCancelled => 'Сообщение не отправлено.';

  @override
  String get emergencyMsgFailed => 'Не удалось отправить сообщение.';

  @override
  String get emergencyMsgUnavailable =>
      'На этом устройстве сообщения недоступны.';

  @override
  String emergencyCallFailed(String number) {
    return 'Не удалось начать звонок. Наберите $number самостоятельно.';
  }

  @override
  String get modelsTitle => 'Модели ИИ';

  @override
  String get modelsIntro =>
      'Все модели входят в состав приложения и работают целиком на вашем iPhone. Видео с камеры не покидает устройство.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'В реальном времени: $ms мс на кадр · $hz распознаваний/с';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Загружено за $ms мс';
  }

  @override
  String get modelsEfficientName => 'Экономичная';

  @override
  String get modelsEfficientDesc =>
      'Быстрый компактный детектор для долгих поездок: мало нагрева и расхода заряда.';

  @override
  String get modelsEnhancedName => 'Расширенная';

  @override
  String get modelsEnhancedDesc =>
      'Более крупный детектор, который находит мелкие и удалённые объекты, но потребляет больше энергии.';

  @override
  String get modelsSegmentationName => 'Сегментация';

  @override
  String get modelsSegmentationDesc =>
      'Сочетает быстрое распознавание с масками дорожного покрытия и объектов для экрана «Восприятие».';

  @override
  String get modelsNoneName => 'ИИ на паузе';

  @override
  String get modelsNoneDesc =>
      'Камера и запись продолжают работать без распознавания объектов. Минимальное энергопотребление.';

  @override
  String get modelsGenericDesc =>
      'Модель распознавания объектов на устройстве.';

  @override
  String get modelsFunctionDetection =>
      'Распознаёт автомобили, людей, велосипеды, мотоциклы, автобусы, светофоры и знаки «Стоп»';

  @override
  String get modelsFunctionSegmentation =>
      'Добавляет маски дорожного покрытия и объектов';

  @override
  String get modelsFunctionNone =>
      'Без распознавания; только запись видеорегистратора';

  @override
  String get modelsSize => 'Размер';

  @override
  String get modelsInput => 'Вход';

  @override
  String modelsInputValue(String size) {
    return '$size × $size пикс.';
  }

  @override
  String get modelsViews => 'Работает с видами';

  @override
  String get modelsStatusInstalled => 'Установлена (в составе приложения)';

  @override
  String get modelsStatusNotInstalled => 'Не установлена';

  @override
  String get modelsSelected => 'Выбрана';

  @override
  String get modelsUse => 'Использовать эту модель';

  @override
  String get modelsSwitching => 'Загрузка модели…';

  @override
  String modelsSwitched(String name) {
    return 'Модель «$name» активна';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Измерено на этом устройстве: в среднем $ms мс';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'На этом устройстве не измерялось';

  @override
  String get modelsBenchmarkRun => 'Запустить тест';

  @override
  String get modelsBenchmarkRunning => 'Идёт тест…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Выберите эту модель, чтобы протестировать её.';

  @override
  String get modelsBenchmarkDone => 'Тест завершён';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Тест не удался: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Обновлено: $date';
  }

  @override
  String get safetyTitle => 'Информация о безопасности';

  @override
  String get safetyIntro =>
      'Corvista — вспомогательное средство для повышения внимательности за рулём. Оно не управляет вашим автомобилем и не заменяет ваше внимание, ваше суждение и системы безопасности автомобиля.';

  @override
  String get safetyBeforeTitle => 'Перед поездкой';

  @override
  String get safetyBefore1 =>
      'Надёжно закрепите iPhone в разрешённом законом месте, где он не закрывает обзор, подушки безопасности и органы управления.';

  @override
  String get safetyBefore2 =>
      'Завершите настройку, выберите вид и задайте пункт назначения на стоянке.';

  @override
  String get safetyBefore3 =>
      'Для долгих поездок подключите зарядное устройство и по возможности не оставляйте телефон под прямыми солнечными лучами.';

  @override
  String get safetyWhileTitle => 'Во время вождения';

  @override
  String get safetyWhile1 =>
      'Смотрите на дорогу. Пользуйтесь крупными элементами управления на экране только тогда, когда это безопасно и разрешено законом.';

  @override
  String get safetyWhile2 =>
      'Оповещения — лишь вспомогательное средство, а не предупреждения, на которые можно полагаться. Отсутствие сигнала никогда не означает, что дорога свободна.';

  @override
  String get safetyWhile3 =>
      'Если приложение расходится с правилами дорожного движения, сигналами и знаками, следуйте им, а не приложению.';

  @override
  String get safetyLimitsTitle => 'Ограничения';

  @override
  String get safetyLimits1 =>
      'Одна камера телефона видит только то, что находится перед ней. Объекты вне её поля зрения, скрытые или очень близкие не распознаются.';

  @override
  String get safetyLimits2 =>
      'Объекты могут быть пропущены, распознаны с задержкой или неверно, особенно ночью, в дождь, туман, при бликах или загрязнённом лобовом стекле.';

  @override
  String get safetyLimits3 =>
      'Распознаются только поддерживаемые категории: автомобили, автобусы, мотоциклы, велосипеды, люди, светофоры и знаки «Стоп». Линии разметки на виртуальном виде стилизованы и не являются распознанными полосами.';

  @override
  String get safetyLimits4 =>
      'Близость показывается приблизительными зонами («Очень близко», «Близко», «Средне», «Далеко»), а не измеренными расстояниями. Вид парковки не заменяет парктроник.';

  @override
  String get safetyHeatTitle => 'Нагрев и аккумулятор';

  @override
  String get safetyHeat1 =>
      'Постоянная работа камеры и ИИ нагревает iPhone. Когда устройство перегревается, Corvista снижает частоту анализа и показывает предупреждение; если iOS перегреется, камера может остановиться.';

  @override
  String get safetyEmergencyTitle => 'Экстренная функция';

  @override
  String get safetyEmergency1 =>
      'Обнаружение возможного удара — экспериментальная функция. Она может пропустить настоящую аварию и может сработать из-за других событий.';

  @override
  String get safetyEmergency2 =>
      'Она никогда не связывается ни с кем втихую: iOS всегда запрашивает подтверждение звонка или сообщения. Она не заменяет вызов экстренных служб самостоятельно.';

  @override
  String get privacyTitle => 'Конфиденциальность';

  @override
  String get privacyIntro =>
      'Corvista создан так, чтобы данные о ваших поездках оставались на вашем iPhone. Учётной записи Corvista нет, и Corvista не использует собственные серверы.';

  @override
  String get privacyCameraTitle => 'Камера и ИИ';

  @override
  String get privacyCamera1 =>
      'Распознавание, отслеживание и сегментация объектов полностью выполняются на вашем iPhone. Кадры с камеры никогда не загружаются.';

  @override
  String get privacyCamera2 =>
      'Камера работает только пока Corvista открыт на экране. При переходе приложения в фоновый режим она останавливается — скрытой фоновой записи нет.';

  @override
  String get privacyRecordingsTitle => 'Записи';

  @override
  String get privacyRecordings1 =>
      'Циклический буфер временный и постоянно перезаписывается. Запись сохраняется только когда вы нажимаете «Сохранить случай» или, если вы включили эту функцию, после возможного удара.';

  @override
  String get privacyRecordings2 =>
      'Сохранённые клипы остаются в закрытом хранилище Corvista на вашем iPhone. Они покидают устройство только когда вы выбираете «Поделиться». При удалении приложения они удаляются.';

  @override
  String get privacyRecordings3 =>
      'Звук записывается только если вы включили эту функцию и предоставили доступ к микрофону.';

  @override
  String get privacyLocationTitle => 'Геопозиция';

  @override
  String get privacyLocation1 =>
      'Пока приложение открыто, геопозиция используется для определения скорости, карты, маршрутов и погоды. Если включено «Сохранять место», позиция на момент сохранения хранится вместе с клипом на вашем устройстве.';

  @override
  String get privacyNetworkTitle => 'Сетевые службы';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — отображение карты, поиск мест и маршруты. Текст вашего запроса и примерная геопозиция отправляются в Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — текущая и почасовая погода для вашей геопозиции.';

  @override
  String get privacyNetwork4 =>
      'В Corvista нет рекламы, сторонней аналитики и отслеживания.';

  @override
  String get privacyEmergencyTitle => 'Экстренные контакты';

  @override
  String get privacyEmergency1 =>
      'Выбранные вами контакты хранятся в связке ключей iOS на этом устройстве. Для голосовой отмены по возможности используется распознавание речи на устройстве. Звонки и сообщения отправляются только после вашего подтверждения в iOS.';

  @override
  String get privacyControlsTitle => 'Ваш контроль';

  @override
  String get privacyControls1 =>
      'Вы можете в любой момент удалить клипы в разделе «Клипы», а также изменить или отозвать доступ к камере, микрофону, геопозиции и распознаванию речи в настройках iOS.';

  @override
  String get termsTitle => 'Условия использования';

  @override
  String get termsIntro =>
      'Используя Corvista, вы соглашаетесь с этими условиями. Также действует стандартное Лицензионное соглашение с конечным пользователем лицензируемого приложения Apple.';

  @override
  String get termsUseTitle => 'Использование Corvista';

  @override
  String get termsUse1 =>
      'Corvista — вспомогательное средство для повышения внимательности за рулём и видеорегистратор. Вы всегда несёте полную ответственность за безопасное вождение в соответствии с законом.';

  @override
  String get termsUse2 =>
      'Не пользуйтесь приложением так, чтобы это отвлекало вас во время вождения. Закрепляйте устройство надёжно и в соответствии с законом.';

  @override
  String get termsAccuracyTitle => 'Отсутствие гарантий точности';

  @override
  String get termsAccuracy1 =>
      'Объекты, зоны, оповещения, отметки на карте, маршруты и погода могут быть неполными, запаздывать или быть неверными. Corvista не управляет вашим автомобилем.';

  @override
  String get termsAccuracy2 =>
      'Экстренная функция является экспериментальной и может не обнаружить удар или сработать ложно.';

  @override
  String get termsRecordingTitle => 'Законы о записи';

  @override
  String get termsRecording1 =>
      'Законы о видеорегистраторах, записи звука и съёмке людей различаются в зависимости от страны и региона. Вы обязаны их соблюдать, в том числе когда делитесь клипами.';

  @override
  String get termsLiabilityTitle => 'Ответственность';

  @override
  String get termsLiability1 =>
      'Приложение предоставляется «как есть». В пределах, допускаемых законом, разработчик не несёт ответственности за аварии, потери, штрафы или ущерб, возникшие в связи с его использованием или доверием к его результатам.';

  @override
  String get termsChangesTitle => 'Изменения';

  @override
  String get termsChanges1 =>
      'Эти условия могут обновляться вместе с новыми версиями приложения. Продолжая пользоваться приложением после обновления, вы принимаете изменённые условия.';

  @override
  String get helpTitle => 'Справка';

  @override
  String get helpIntro =>
      'Ответы на частые вопросы. Рекомендации по безопасности смотрите в разделе «Информация о безопасности».';

  @override
  String get helpQSave => 'Как сохранить запись происшествия?';

  @override
  String get helpASaveBuffer =>
      'Нажмите большую кнопку «Сохранить случай» на экране вождения. Corvista сохранит в «Клипы» последние 20 или 30 секунд из циклического буфера (выбор в «Настройки › Запись»).';

  @override
  String get helpQWhere => 'Где хранятся мои клипы?';

  @override
  String get helpAWhere =>
      'В закрытом хранилище Corvista на вашем iPhone. Они никогда не загружаются. Чтобы отправить или экспортировать клип, используйте «Поделиться» в плеере.';

  @override
  String get helpQZones => 'Насколько точны зоны близости?';

  @override
  String get helpAZones =>
      'Зоны — это приблизительные оценки по одной камере на основе типичных размеров объектов. Воспринимайте их как примерные подсказки, а не как расстояния.';

  @override
  String get helpQSlow => 'Почему распознавание замедляется?';

  @override
  String get helpASlow =>
      'Когда iPhone нагревается, заряд батареи низкий или включён режим энергосбережения, Corvista снижает частоту анализа, чтобы защитить устройство. Режим питания можно изменить в настройках.';

  @override
  String get helpQMap => 'Не работают карта, поиск или погода.';

  @override
  String get helpAMap =>
      'Этим функциям нужны подключение к интернету и доступ к геопозиции. Проверьте подключение и разрешите Corvista доступ к геопозиции в настройках iOS.';

  @override
  String get helpQSimulator => 'Камера отображается как недоступная.';

  @override
  String get helpASimulator =>
      'Убедитесь, что в настройках iOS разрешён доступ к камере и что её не использует другое приложение. В симуляторе iOS камеры нет; вместо неё можно использовать локальное тестовое видео.';

  @override
  String get emergencyMsgNoContacts => 'Сначала добавьте экстренный контакт.';

  @override
  String get cameraStarting => 'Запуск камеры…';

  @override
  String get cameraInterrupted => 'Камера приостановлена';

  @override
  String get cameraInterruptedBody =>
      'iOS приостановила камеру, например во время звонка или когда её использует другое приложение. Она возобновит работу автоматически.';

  @override
  String get cameraUnavailable => 'Камера недоступна';

  @override
  String get cameraUnavailableBody =>
      'На этом устройстве нет доступной камеры. Для распознавания, записи и вида парковки нужна задняя камера.';

  @override
  String get cameraRunTestFootage => 'Запустить тестовое видео';

  @override
  String get cameraPermissionDenied => 'Доступ к камере выключен';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista нужна камера для распознавания, записи видеорегистратора и вида парковки. Включите доступ к камере в настройках.';

  @override
  String get cameraError => 'Ошибка камеры';

  @override
  String get cameraStopped => 'Камера остановлена';

  @override
  String get cameraStart => 'Запустить камеру';

  @override
  String get cameraFocusHint => 'Нажмите для фокусировки';

  @override
  String get cameraPreviewLabel =>
      'Изображение с камеры в реальном времени с распознанными объектами';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Камера $fps к/с · ИИ $hz Гц · $ms мс · потеряно $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Скорость $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Нет скорости GPS';

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
    return 'Идёт запись буфера видеорегистратора, накоплено $seconds из $target секунд';
  }

  @override
  String get hudRecIdle => 'ЗАП. выкл.';

  @override
  String get hudRecSaving => 'Сохранение…';

  @override
  String get hudRecError => 'Ошибка записи';

  @override
  String get hudAiPaused => 'ИИ на паузе';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count объекта',
      many: '$count объектов',
      few: '$count объекта',
      one: '$count объект',
      zero: 'Нет объектов',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'обнаружено $count объекта',
      many: 'обнаружено $count объектов',
      few: 'обнаружено $count объекта',
      one: 'обнаружен $count объект',
      zero: 'объектов не обнаружено',
    );
    return 'Модель ИИ $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Жарко — ИИ замедлен';

  @override
  String get hudThermalCritical => 'Перегрев — ИИ на паузе';

  @override
  String hudBatteryLow(String percent) {
    return 'Заряд $percent';
  }

  @override
  String get hudLowPower => 'Энергосбережение';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Погода: $temperature, $condition. Нажмите, чтобы узнать подробности.';
  }

  @override
  String get hudNoGuidance =>
      'Найдите пункт назначения на экране карты, и здесь появятся пошаговые указания.';

  @override
  String get navArrived => 'Вы прибыли';

  @override
  String get navRerouting => 'Перестроение маршрута…';

  @override
  String get navSearchHint => 'Поиск места назначения';

  @override
  String get navSearchFieldHint => 'Адрес, место или организация';

  @override
  String get navNoResults => 'Подходящих мест нет';

  @override
  String get navSearching => 'Поиск…';

  @override
  String get navSearchStartTyping =>
      'Введите адрес или название места. Результаты предоставляет Apple Maps, нужно подключение к интернету.';

  @override
  String get navErrorUnavailable =>
      'Поиск и маршруты недоступны — проверьте подключение к интернету.';

  @override
  String get navErrorNoLocation =>
      'Ожидание геопозиции для построения маршрута.';

  @override
  String get navErrorPermission =>
      'Доступ к геопозиции выключен, поэтому маршрут нельзя начать от вашего местоположения.';

  @override
  String navErrorGeneric(String code) {
    return 'Не удалось загрузить маршруты ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Маршруты до места: $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Прибытие в $time';
  }

  @override
  String get navStart => 'Начать';

  @override
  String get navEnd => 'Завершить';

  @override
  String get navEndLabel => 'Завершить навигацию';

  @override
  String navRemaining(String distance, String duration) {
    return 'Осталось: $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Предупреждение: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes мин',
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
  String get weatherTitle => 'Погода';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Ощущается как $temperature';
  }

  @override
  String get weatherPrecipitation => 'Осадки';

  @override
  String get weatherWind => 'Ветер';

  @override
  String get weatherVisibility => 'Видимость';

  @override
  String get weatherHumidity => 'Влажность';

  @override
  String get weatherHourly => 'Ближайшие часы';

  @override
  String weatherAsOf(String time) {
    return 'Обновлено: $time';
  }

  @override
  String get weatherRefresh => 'Обновить погоду';

  @override
  String get weatherUnavailable => 'Погода сейчас недоступна.';

  @override
  String get weatherNoLocation => 'Для погоды нужна геопозиция.';

  @override
  String get weatherLegal => 'Источники данных и правовая информация';

  @override
  String weatherProvidedBy(String service) {
    return 'Данные о погоде: $service';
  }

  @override
  String get weatherNow => 'Сейчас';

  @override
  String get virtualEmpty => 'Поддерживаемых объектов не обнаружено';

  @override
  String get virtualEmptyCameraOff =>
      'Для виртуального вида нужна живая камера.';

  @override
  String get virtualLaneDisclaimer =>
      'Линии полос условные, они не распознаются.';

  @override
  String virtualNearest(String zone) {
    return 'Ближайший: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Виртуальная дорожная сцена: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'ИИ: $status';
  }

  @override
  String get virtualStatusLive => 'работает';

  @override
  String get virtualStatusPaused => 'на паузе';

  @override
  String get virtualStatusCameraOff => 'Камера выкл.';

  @override
  String get virtualStatusTestFootage => 'Тестовое видео';

  @override
  String get virtualEmptyHint =>
      'Здесь появятся автомобили, люди, велосипеды, светофоры и знаки «Стоп», когда они будут обнаружены.';

  @override
  String get mapRecenter => 'К моему месту';

  @override
  String get mapZoomIn => 'Увеличить';

  @override
  String get mapZoomOut => 'Уменьшить';

  @override
  String get mapUnsupported => 'Интерактивная карта доступна на iPhone.';

  @override
  String get mapObjectsApprox =>
      'Метки объектов показывают приблизительное положение.';

  @override
  String get mapWeatherUnavailable => 'Погода недоступна';

  @override
  String get navErrorNoRoute => 'Маршрут до этого места не найден.';

  @override
  String get navDismiss => 'Закрыть';

  @override
  String get navGo => 'Поехали';

  @override
  String get navFastest => 'Быстрый';

  @override
  String get navThen => 'Затем';

  @override
  String get navRecents => 'Недавние';

  @override
  String get navClearRecents => 'Очистить';

  @override
  String get navSearchSubmitHint =>
      'Нажмите «Найти», чтобы увидеть все подходящие места';

  @override
  String get navPlaces => 'Места';

  @override
  String get navEtaLabel => 'прибытие';

  @override
  String get navTimeLeftLabel => 'осталось';

  @override
  String get navOverview => 'Весь маршрут';

  @override
  String get navMute => 'Выключить голос';

  @override
  String get navUnmute => 'Включить голос';

  @override
  String get navEndConfirm => 'Завершить навигацию?';

  @override
  String navEndConfirmBody(String place) {
    return 'Навигация до места «$place» будет остановлена.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Вы прибыли: $place';
  }

  @override
  String get navDone => 'Готово';

  @override
  String get navWeakGps => 'Слабый сигнал GPS';

  @override
  String get navLocationOff =>
      'Геопозиция выключена. Включите её, чтобы строить маршруты и ориентироваться.';

  @override
  String get navVoiceGuidance => 'Голосовые подсказки';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Через $distance $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, затем $second';
  }

  @override
  String get navSpeakRerouting => 'Перестроение маршрута';

  @override
  String get navSpeakArrived => 'Вы прибыли';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count метра',
      many: '$count метров',
      few: '$count метра',
      one: '$count метр',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value километра',
      many: '$value километров',
      few: '$value километра',
      one: '$value километр',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фута',
      many: '$count футов',
      few: '$count фута',
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
      many: '$count ярдов',
      few: '$count ярда',
      one: '$count ярд',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Продолжайте движение $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Для этой поездки в этом регионе указания недоступны. Попробуйте другое место назначения.';

  @override
  String navContinueFor(String distance) {
    return 'Продолжайте движение $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value мили',
      many: '$value миль',
      few: '$value мили',
      one: '$value миля',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Ближайший: $object · $zone';
  }

  @override
  String get parkingNothing => 'В поле зрения ничего не обнаружено';

  @override
  String get parkingBeeps => 'Сигналы близости';

  @override
  String get parkingVolume => 'Громкость сигналов';

  @override
  String get parkingLimitations =>
      'Одна камера, не 360°. Объекты вне поля зрения камеры не распознаются. Не заменяет парктроник; оценки могут быть неверными, а отсутствие сигнала не означает, что вокруг свободно.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Вид сверху с зонами близости. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Оригинал';

  @override
  String get perceptionModeBoxes => 'Рамки';

  @override
  String get perceptionModeMasks => 'Маски объектов';

  @override
  String get perceptionModeRoad => 'Дорожное покрытие';

  @override
  String get perceptionModeCombined => 'Комбинированный';

  @override
  String get perceptionOpacity => 'Прозрачность масок';

  @override
  String get perceptionDisclaimer =>
      'Маска дорожного покрытия — приблизительный визуальный слой. Она не показывает свободное для проезда пространство или полосы.';

  @override
  String get perceptionNeedsModel =>
      'Выберите модель сегментации, чтобы увидеть маски.';

  @override
  String get perceptionChooseModel => 'Выбрать модель';

  @override
  String get perceptionWaiting => 'Ожидание первого кадра сегментации…';

  @override
  String get perceptionShortCamera => 'Камера';

  @override
  String get perceptionShortBoxes => 'Рамки';

  @override
  String get perceptionShortObjects => 'Объекты';

  @override
  String get perceptionShortRoad => 'Дорога';

  @override
  String get perceptionShortAll => 'Всё';

  @override
  String get perceptionModesLabel => 'Слои восприятия';

  @override
  String get perceptionStatusWarmingUp => 'Подготовка…';

  @override
  String get perceptionStatusLoadingModel => 'Загрузка модели…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps кадр/с';
  }

  @override
  String get perceptionStatusPaused => 'Маски приостановлены';

  @override
  String get perceptionLegend => 'Легенда масок';

  @override
  String get perceptionUnavailable => 'Маски недоступны';

  @override
  String get driveSave => 'Сохранить';

  @override
  String get driveSaveIncident => 'Сохранить случай';

  @override
  String driveSaveHint(int seconds) {
    return 'Сохраняет последние $seconds секунд записи видеорегистратора';
  }

  @override
  String get driveSaving => 'Сохранение случая…';

  @override
  String hudRecManualLabel(String time) {
    return 'Идёт запись, $time';
  }

  @override
  String get driveRecord => 'Запись';

  @override
  String get driveRecordStartA11y => 'Начать запись';

  @override
  String driveRecordStopA11y(String time) {
    return 'Остановить запись, записано $time';
  }

  @override
  String get driveRecordHint =>
      'Записывает непрерывно до остановки, включая последние 5 секунд';

  @override
  String get driveRecordFailed => 'Не удалось начать запись';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Запись сохранена · $count части',
      many: 'Запись сохранена · $count частей',
      few: 'Запись сохранена · $count части',
      one: 'Запись сохранена',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Запись остановлена: память почти заполнена',
      'max_duration': 'Запись остановлена: достигнута максимальная длина',
      'camera_stopped': 'Запись остановлена вместе с камерой',
      'background': 'Запись остановлена: приложение перешло в фон',
      'thermal': 'Запись остановлена: телефон слишком горячий',
      'other': 'Запись остановлена',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Случай сохранён · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Открыть';

  @override
  String get driveSaveFailed => 'Не удалось сохранить случай.';

  @override
  String get driveSaveNotRunning =>
      'Запись ещё не началась — дождитесь запуска камеры и повторите попытку.';

  @override
  String get driveSaveTestFootage =>
      'Тестовое видео не записывается. Сохранение случаев работает с живой камерой.';

  @override
  String get driveSaveStorageFull =>
      'На iPhone закончилось место. Освободите место или удалите старые клипы.';

  @override
  String get driveSaveIoError => 'Не удалось записать клип в хранилище.';

  @override
  String get driveClips => 'Клипы';

  @override
  String get driveSettings => 'Настройки';

  @override
  String get driveViewSwitcher => 'Виды вождения';

  @override
  String get driveLocationDenied =>
      'Геопозиция выключена — скорость, карты и маршруты недоступны.';

  @override
  String get driveCameraDenied =>
      'Доступ к камере выключен — распознавание и запись недоступны.';

  @override
  String get driveRecorderFallback =>
      'Запись без звука: доступ к микрофону выключен.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Параметры записи были изменены: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Ваш iPhone горячий. ИИ работает медленнее, чтобы остыть, — держите его вне прямых солнечных лучей и ближе к обдуву.';

  @override
  String get drivePowerThermalCritical =>
      'Ваш iPhone перегрелся. Распознавание ИИ приостановлено до остывания; запись продолжается, если это возможно.';

  @override
  String get drivePowerLowPower =>
      'Включён режим энергосбережения — ИИ работает с пониженной частотой.';

  @override
  String get drivePowerBatteryLow =>
      'Низкий заряд батареи — подключите iPhone к питанию на время поездки.';

  @override
  String get onboardingTitle1 => 'Видьте больше в каждой поездке.';

  @override
  String get onboardingBody1 =>
      'Превратите iPhone в умный видеорегистратор и помощника, повышающего внимательность за рулём.';

  @override
  String get onboardingTitle2 => 'Интеллект в каждом кадре.';

  @override
  String get onboardingBody2 =>
      'Распознавайте поддерживаемые автомобили, людей, велосипеды и дорожные сигналы прямо на вашем iPhone.';

  @override
  String get onboardingTitle3 => 'Одна дорога. Разные ракурсы.';

  @override
  String get onboardingBody3 =>
      'Переключайтесь между живым распознаванием, виртуальными видами, интерактивными картами и визуализацией парковки.';

  @override
  String get onboardingTitle4 => 'Сохраняйте важные моменты.';

  @override
  String get onboardingBody4 =>
      'Сохраняйте недавние записи видеорегистратора, просматривайте происшествия и делитесь записями.';

  @override
  String get onboardingTitle5 => 'Безопасность и конфиденциальность';

  @override
  String get onboardingSafety1 =>
      'Corvista — вспомогательное средство для повышения внимательности за рулём. Смотрите на дорогу.';

  @override
  String get onboardingSafety2 =>
      'Оно не управляет вашим автомобилем и не заменяет ваше суждение.';

  @override
  String get onboardingSafety3 =>
      'Распознавание и оценки могут быть неточными или пропускать объекты.';

  @override
  String get onboardingSafety4 =>
      'Обработка видео с камеры выполняется на вашем iPhone — видео не загружается.';

  @override
  String get onboardingSafety5 =>
      'Для карт, поиска, маршрутов и погоды нужно подключение к интернету.';

  @override
  String get onboardingSafety6 =>
      'Надёжно закрепите iPhone так, чтобы он не закрывал обзор.';

  @override
  String get onboardingSafety7 => 'Завершите настройку до начала поездки.';

  @override
  String get onboardingAcknowledge =>
      'Я понимаю, что Corvista — вспомогательное средство, и остаюсь ответственным за безопасное вождение.';

  @override
  String get onboardingReadSafety => 'Читать полную информацию о безопасности';

  @override
  String get onboardingNext => 'Далее';

  @override
  String get onboardingSkip => 'Пропустить';

  @override
  String get onboardingAgree => 'Продолжить';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Страница $current из $total';
  }

  @override
  String get permTitle => 'Разрешения';

  @override
  String get permIntro =>
      'Corvista запрашивает только то, что нужно для каждой функции. Вы можете изменить это в любой момент в настройках.';

  @override
  String get permCameraTitle => 'Камера';

  @override
  String get permCameraBody =>
      'Нужна для распознавания, записи видеорегистратора и вида парковки. Видео обрабатывается на вашем iPhone.';

  @override
  String get permLocationTitle => 'Геопозиция';

  @override
  String get permLocationBody =>
      'Используется для скорости по GPS, карты, маршрутов, погоды и пометки сохранённых клипов. Только когда вы пользуетесь приложением.';

  @override
  String get permMicTitle => 'Микрофон';

  @override
  String get permSpeechNote =>
      'Распознавание речи запрашивается, только если вы включите голосовую отмену экстренных оповещений.';

  @override
  String get permRequired => 'Обязательно';

  @override
  String get permOptional => 'Необязательно';

  @override
  String get permAllow => 'Разрешить';

  @override
  String get permGranted => 'Разрешено';

  @override
  String get permDenied => 'Запрещено';

  @override
  String get permLimited => 'Ограничено';

  @override
  String get permRestricted => 'Ограничено системой';

  @override
  String get permStart => 'Начать поездку';

  @override
  String get permCameraNeeded =>
      'Вы можете продолжить без доступа к камере, но распознавание и запись не будут работать, пока вы не разрешите его в настройках.';

  @override
  String get permSetupIntro =>
      'Для полноценной работы Corvista нужны эти разрешения. Нажмите «Разрешить все», и iOS по очереди запросит каждое. Изменить их можно в любой момент в настройках.';

  @override
  String get permCameraLine =>
      'Нужна для распознавания, записи видеорегистратора и вида парковки. Видео обрабатывается на вашем iPhone и никогда не загружается.';

  @override
  String get permLocationLine =>
      'Скорость по GPS, карта, маршруты, погода и место сохранения клипов. Только когда вы пользуетесь приложением.';

  @override
  String get permMicLine =>
      'Звук из салона в клипах происшествий и распознавание фразы отмены во время экстренного оповещения.';

  @override
  String get permSpeechTitle => 'Распознавание речи';

  @override
  String get permSpeechLine =>
      'Распознаёт вашу фразу отмены во время экстренного обратного отсчёта на вашем iPhone, где это поддерживается.';

  @override
  String get permAllowAll => 'Разрешить все';

  @override
  String permAsking(String permission) {
    return 'Запрашиваем доступ: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Некоторые разрешения выключены. Включите их в настройках, чтобы пользоваться этими функциями.';

  @override
  String get permNotNow => 'Не сейчас';

  @override
  String get tourLabel => 'Обзор экрана вождения';

  @override
  String tourProgress(int current, int total) {
    return 'Шаг $current из $total';
  }

  @override
  String get tourNext => 'Далее';

  @override
  String get tourBack => 'Назад';

  @override
  String get tourSkip => 'Пропустить обзор';

  @override
  String get tourFinish => 'Начать поездку';

  @override
  String get tourWelcomeTitle => 'Краткий обзор';

  @override
  String get tourWelcomeBody =>
      'Минутный обзор главного на экране вождения. Лучше проходить его на стоянке.';

  @override
  String get tourHudTitle => 'Ваша приборная полоса';

  @override
  String get tourHudSpeed => 'Скорость берётся из GPS.';

  @override
  String get tourHudRec =>
      '«ЗАП.» показывает, сколько секунд записи накоплено в буфере.';

  @override
  String get tourHudAi =>
      'Метка ИИ показывает модель, сколько объектов она видит, и индикатор: зелёный — работает, жёлтый — ограничена, красный — остановлена.';

  @override
  String get tourSaveTitle => 'Сохранить случай';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista хранит циклический буфер видео за последние $seconds секунд. Он постоянно перезаписывается, поэтому ничего не сохраняется, пока вы не нажмёте «Сохранить». Сохранённые клипы остаются на этом iPhone, в разделе «Клипы».';
  }

  @override
  String get tourRecordTitle => 'Запишите всю поездку';

  @override
  String get tourRecordBody =>
      'Нажмите «Запись», чтобы снимать непрерывно до остановки. Долгие поездки сохраняются в «Клипы» частями по 5 минут, а «Сохранить случай» продолжает работать во время записи.';

  @override
  String get tourViewsTitle => 'Пять способов увидеть дорогу';

  @override
  String get tourViewDetection =>
      'Живая камера с рамками вокруг поддерживаемых объектов.';

  @override
  String get tourViewVirtual =>
      'Упрощённая 3D-сцена, построенная по распознанным объектам.';

  @override
  String get tourViewMap => 'Apple Maps с поиском и пошаговой навигацией.';

  @override
  String get tourViewParking => 'Камера и вид сверху с зонами близости.';

  @override
  String get tourViewPerception => 'Маски дороги и объектов.';

  @override
  String get tourMapTitle => 'Поиск и пошаговая навигация';

  @override
  String get tourMapBody =>
      'Откройте карту, нажмите строку поиска и выберите место назначения. Выберите маршрут и нажмите «Начать», чтобы получать пошаговые указания. Нужно подключение к интернету.';

  @override
  String get tourClipsTitle => 'Клипы';

  @override
  String get tourClipsBody =>
      'Просматривайте, переименовывайте, отправляйте или удаляйте сохранённые случаи. Клипы остаются на вашем iPhone, пока вы ими не поделитесь.';

  @override
  String get tourSettingsTitle => 'Настройки';

  @override
  String get tourSettingsBody =>
      'Настройте голосовые оповещения и их чувствительность, качество записи и длину буфера, а также экстренный режим — экспериментальное оповещение об ударе с отменяемым обратным отсчётом.';

  @override
  String get tourSafetyTitle => 'Перед поездкой';

  @override
  String get tourSafety1 =>
      'Надёжно закрепите iPhone так, чтобы он не закрывал обзор.';

  @override
  String get tourSafety2 =>
      'Не пользуйтесь приложением во время вождения. Настраивайте всё на стоянке.';

  @override
  String get tourSafety3 =>
      'Распознавание и зоны — это оценки. Они могут быть неверными или пропускать объекты.';

  @override
  String get tourSafety4 =>
      'Ответственность за безопасное вождение остаётся за вами.';

  @override
  String get helpTakeTour => 'Пройти обзор';

  @override
  String get helpTakeTourSub => 'Минутный обзор экрана вождения.';

  @override
  String get tripsTitle => 'Поездки';

  @override
  String get tripsOpen => 'Журнал поездок';

  @override
  String get tripsEmptyTitle => 'Поездок пока нет';

  @override
  String get tripsEmptyBody =>
      'Поездки записываются автоматически, пока вы за рулём с Corvista: расстояние, время, скорость и ваш маршрут.';

  @override
  String get tripsDisabledBody =>
      'Журнал поездок выключен, поэтому новые поездки не записываются. Включите его, чтобы вести личный журнал маршрутов на этом iPhone.';

  @override
  String get tripsEnable => 'Включить журнал поездок';

  @override
  String get tripsToday => 'Сегодня';

  @override
  String get tripsYesterday => 'Вчера';

  @override
  String tripsRecordingNow(String distance) {
    return 'Запись поездки · $distance';
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
      other: '$count случая',
      many: '$count случаев',
      few: '$count случая',
      one: '$count случай',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count оповещения',
      many: '$count оповещений',
      few: '$count оповещения',
      one: '$count оповещение',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count поездки',
      many: '$count поездок',
      few: '$count поездки',
      one: '$count поездка',
      zero: 'Нет поездок',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Расстояние';

  @override
  String get tripsStatDuration => 'Длительность';

  @override
  String get tripsStatMoving => 'Время в движении';

  @override
  String get tripsStatAvgSpeed => 'Средняя скорость';

  @override
  String get tripsStatMaxSpeed => 'Макс. скорость';

  @override
  String get tripsDetections => 'Распознавание';

  @override
  String get tripsNoDetections =>
      'В этой поездке объекты на дороге не зафиксированы.';

  @override
  String get tripsTimeline => 'Хронология';

  @override
  String get tripsEventStart => 'Поездка начата';

  @override
  String get tripsEventEnd => 'Поездка завершена';

  @override
  String get tripsEventAlert => 'Голосовое оповещение';

  @override
  String get tripsEventIncident => 'Клип случая сохранён';

  @override
  String get tripsEventEmergency => 'Обнаружена возможная авария';

  @override
  String get tripsEventNavStart => 'Навигация начата';

  @override
  String get tripsEventArrive => 'Прибытие в пункт назначения';

  @override
  String get tripsEventReroute => 'Маршрут перестроен';

  @override
  String get tripsEventRecording => 'Запись сохранена';

  @override
  String get tripsOpenClip => 'Открыть клип';

  @override
  String get tripsTrackPreview => 'Трек GPS';

  @override
  String get tripsRenameTitle => 'Переименовать поездку';

  @override
  String get tripsRenameHint => 'Название поездки';

  @override
  String get tripsFavorite => 'Добавить в избранное';

  @override
  String get tripsUnfavorite => 'Убрать из избранного';

  @override
  String get tripsShareGpx => 'Поделиться GPX';

  @override
  String get tripsShareFailed => 'Не удалось поделиться поездкой.';

  @override
  String get tripsDelete => 'Удалить поездку';

  @override
  String get tripsDeleteConfirmTitle => 'Удалить эту поездку?';

  @override
  String get tripsDeleteConfirmBody =>
      'Маршрут и статистика будут удалены с этого iPhone. Клипы случаев из этой поездки сохранятся.';

  @override
  String get tripsDeleted => 'Поездка удалена';

  @override
  String get tripsNotFound => 'Эта поездка больше недоступна.';

  @override
  String get tripsPrivacyNote =>
      'Хранится только на этом iPhone. Ничего не загружается.';

  @override
  String get settingsSectionTrips => 'Журнал поездок';

  @override
  String get settingsTripLog => 'Записывать поездки';

  @override
  String get settingsTripLogSubtitle =>
      'Хранит ваш маршрут и статистику поездок только на этом iPhone.';

  @override
  String get settingsTripRetention => 'Хранить поездки';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 год';

  @override
  String get settingsRetentionForever => 'Всегда';

  @override
  String get settingsTripRetentionFooter =>
      'Старые поездки автоматически удаляются при запуске Corvista.';

  @override
  String get settingsViewTrips => 'Показать поездки';

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
    return 'Поездка Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Освободить место';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Удаляет временные файлы и кэш. Сохранённые клипы и поездки остаются.';

  @override
  String settingsFreedBytes(String size) {
    return 'Освобождено: $size';
  }

  @override
  String get settingsNothingToFree =>
      'Кэш очищен — временных файлов для удаления нет.';

  @override
  String get settingsSectionPrivacyData => 'Конфиденциальность и данные';

  @override
  String get settingsPrivacyDataFooter =>
      'Клипы, поездки и настройки хранятся только на этом iPhone. Они покидают его, только если вы решите ими поделиться.';

  @override
  String get settingsDeleteAllData => 'Удалить все данные';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Стереть клипы, поездки, контакты и настройки на этом iPhone';

  @override
  String get deleteAllTitle => 'Удалить все данные?';

  @override
  String get deleteAllMessage =>
      'С этого iPhone будет безвозвратно удалено:\n• Клипы случаев и миниатюры\n• Журнал поездок и треки GPS\n• Экстренные контакты и экстренные события\n• Журналы распознавания и журнал диагностики\n• Настройки и недавние места назначения\n• Временный буфер записи и кэш\n\nЭто действие нельзя отменить. После этого Corvista запустится заново с экранов приветствия.';

  @override
  String get deleteAllConfirm => 'Удалить всё';

  @override
  String get deleteAllInProgress => 'Удаление…';

  @override
  String get deleteAllDone => 'Все данные удалены';

  @override
  String get deleteAllPartial =>
      'Не удалось удалить некоторые элементы. Повторите попытку в настройках.';

  @override
  String get diagLogSection => 'Журнал диагностики';

  @override
  String get diagLogFooter =>
      'Ошибки записываются только на этом iPhone, без геопозиции, имён контактов и номеров телефонов. Ничего не отправляется, пока вы сами не поделитесь журналом.';

  @override
  String get diagLogShare => 'Поделиться журналом диагностики';

  @override
  String get diagLogEmpty => 'Пусто';

  @override
  String get diagLogClear => 'Очистить журнал';

  @override
  String get diagLogClearTitle => 'Очистить журнал диагностики?';

  @override
  String get diagLogClearBody =>
      'Сохранённые записи об ошибках будут удалены с этого iPhone.';

  @override
  String get diagLogCleared => 'Журнал диагностики очищен';

  @override
  String get diagLogShareFailed =>
      'Не удалось поделиться журналом диагностики.';

  @override
  String get privacyControls2 =>
      '«Настройки › Конфиденциальность и данные › Удалить все данные» стирает все клипы, поездки, контакты, журналы и настройки, которые Corvista хранит на этом iPhone.';

  @override
  String get parkingZoneStop => 'Стоп';

  @override
  String get parkingZoneVeryClose => 'Очень близко';

  @override
  String get parkingZoneClose => 'Близко';

  @override
  String get parkingZoneNothingClose => 'Рядом ничего не видно';

  @override
  String get parkingNotDetected =>
      'Стены, столбы, опоры и бордюры не распознаются';

  @override
  String get parkingApprox => '≈';

  @override
  String get parkingSideLeft => 'Слева';

  @override
  String get parkingSideCenter => 'По центру';

  @override
  String get parkingSideRight => 'Справа';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Только вид с передней камеры — это не система кругового обзора 360°';

  @override
  String get parkingMuteBeeps => 'Выключить сигналы';

  @override
  String get parkingUnmuteBeeps => 'Включить сигналы';

  @override
  String get parkingAbout => 'О режиме парковки';

  @override
  String get parkingLimitationsDetail =>
      'Контролируется только область перед камерой. Распознаются легковые автомобили, автобусы и грузовики, люди, велосипеды и мотоциклы. Стены, столбы, опоры, бордюры, боллары, шлагбаумы и низкие препятствия НЕ распознаются, а капот может скрывать землю прямо перед автомобилем. Расстояния — грубая оценка по одной камере (размер и положение объекта), и она может сильно ошибаться. Тишина или надпись «Рядом ничего не видно» не означает, что путь свободен: всегда осматривайтесь и пользуйтесь зеркалами.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Близость по сторонам: слева $left, по центру $center, справа $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Ошибки записываются в закрытый журнал на этом iPhone (без геопозиции, имён контактов и номеров телефонов). Он никогда не отправляется автоматически; им можно поделиться или очистить его в «Настройки › Диагностика».';
}
