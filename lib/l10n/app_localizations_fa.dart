// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'از هر رانندگی بیشتر ببینید.';

  @override
  String get commonCancel => 'لغو';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonSave => 'ذخیره';

  @override
  String get commonBack => 'بازگشت';

  @override
  String get commonClose => 'بستن';

  @override
  String get commonRetry => 'تلاش دوباره';

  @override
  String get commonOpenSettings => 'باز کردن تنظیمات';

  @override
  String get commonLoading => 'در حال بارگذاری…';

  @override
  String get commonError => 'مشکلی پیش آمد.';

  @override
  String commonErrorDetail(String message) {
    return 'مشکلی پیش آمد: $message';
  }

  @override
  String get commonOn => 'روشن';

  @override
  String get commonOff => 'خاموش';

  @override
  String get commonRename => 'تغییر نام';

  @override
  String get commonShare => 'اشتراک‌گذاری';

  @override
  String get commonNotAvailable => 'در دسترس نیست';

  @override
  String get commonTestFootage => 'ویدیوی آزمایشی';

  @override
  String get zoneVeryClose => 'بسیار نزدیک';

  @override
  String get zoneClose => 'نزدیک';

  @override
  String get zoneMedium => 'متوسط';

  @override
  String get zoneFar => 'دور';

  @override
  String get zoneUnknown => 'نامشخص';

  @override
  String get classPerson => 'فرد';

  @override
  String get classBicycle => 'دوچرخه';

  @override
  String get classMotorcycle => 'موتورسیکلت';

  @override
  String get classCar => 'خودرو';

  @override
  String get classBus => 'اتوبوس';

  @override
  String get classTrafficLight => 'چراغ راهنمایی';

  @override
  String get classStopSign => 'علامت ایست';

  @override
  String get viewDetection => 'تشخیص';

  @override
  String get viewVirtual => 'مجازی';

  @override
  String get viewMap => 'نقشه';

  @override
  String get viewParking => 'پارک';

  @override
  String get viewPerception => 'ادراک';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'قرمز';

  @override
  String get lightYellow => 'زرد';

  @override
  String get lightGreen => 'سبز';

  @override
  String get lightUnknown => 'نامشخص';

  @override
  String get clipsTitle => 'کلیپ‌ها';

  @override
  String get clipsSelect => 'انتخاب';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مورد انتخاب شد',
      one: '1 مورد انتخاب شد',
      zero: 'انتخاب کلیپ‌ها',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'انتخاب همه';

  @override
  String get clipsDeselectAll => 'لغو انتخاب همه';

  @override
  String get clipsDeleteSelected => 'حذف موارد انتخاب‌شده';

  @override
  String get clipsGridView => 'نمای شبکه‌ای';

  @override
  String get clipsListView => 'نمای فهرستی';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلیپ حذف شود؟',
      one: 'این کلیپ حذف شود؟',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'این ویدیوها برای همیشه از iPhone شما حذف می‌شوند. این کار قابل بازگشت نیست.',
      one: 'این ویدیو برای همیشه از iPhone شما حذف می‌شود. این کار قابل بازگشت نیست.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلیپ حذف شد',
      one: 'کلیپ حذف شد',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'هنوز کلیپی وجود ندارد';

  @override
  String get clipsEmptyBody =>
      'هنگام رانندگی، Corvista یک بافر چرخشی کوتاه نگه می‌دارد. برای نگه داشتن ثانیه‌های آخر ویدیو در اینجا، «ذخیرهٔ رویداد» را بزنید.';

  @override
  String get clipsLoadError => 'بارگذاری کلیپ‌های شما ممکن نشد.';

  @override
  String get clipsStorageTitle => 'فضای ذخیره‌سازی';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'کلیپ‌ها $clips · بافر $buffer · $free آزاد';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلیپ ذخیره‌شده',
      one: '1 کلیپ ذخیره‌شده',
      zero: 'کلیپ ذخیره‌شده‌ای نیست',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'فضای ذخیره‌سازی iPhone شما کم است. ممکن است ذخیرهٔ رویدادهای جدید ناموفق باشد.';

  @override
  String get clipsMissingFile => 'فایل وجود ندارد';

  @override
  String get clipsEmergencyBadge => 'برخورد';

  @override
  String clipsUntitled(String date) {
    return 'رویداد · $date';
  }

  @override
  String get clipsAudio => 'صدا ضبط شده است';

  @override
  String get clipsFavorite => 'مورد علاقه';

  @override
  String get clipsUnfavorite => 'حذف از موارد علاقه';

  @override
  String get clipsLocation => 'مکان ذخیره شده است';

  @override
  String clipsOpenClip(String title) {
    return 'باز کردن کلیپ $title';
  }

  @override
  String get playerNotFoundTitle => 'کلیپ پیدا نشد';

  @override
  String get playerNotFoundBody => 'ممکن است این کلیپ حذف شده باشد.';

  @override
  String get playerMissingTitle => 'فایل ویدیو وجود ندارد';

  @override
  String get playerMissingBody =>
      'ضبط این کلیپ دیگر روی iPhone شما نیست. می‌توانید این مورد را از گالری حذف کنید.';

  @override
  String get playerRemoveEntry => 'حذف مورد';

  @override
  String get playerLoadError => 'پخش این ویدیو ممکن نیست.';

  @override
  String get playerPlay => 'پخش';

  @override
  String get playerPause => 'توقف';

  @override
  String get playerReplay => 'پخش مجدد';

  @override
  String get playerRenameTitle => 'تغییر نام کلیپ';

  @override
  String get playerRenameHint => 'نام کلیپ';

  @override
  String get playerRenamed => 'نام کلیپ تغییر کرد';

  @override
  String get playerFavorited => 'به موارد علاقه اضافه شد';

  @override
  String get playerUnfavorited => 'از موارد علاقه حذف شد';

  @override
  String get playerShareFailed => 'اشتراک‌گذاری این کلیپ ممکن نشد.';

  @override
  String get playerDetails => 'جزئیات';

  @override
  String get playerDate => 'زمان ضبط';

  @override
  String get playerDuration => 'مدت';

  @override
  String get playerResolution => 'وضوح تصویر';

  @override
  String get playerSize => 'حجم فایل';

  @override
  String get playerAudio => 'صدا';

  @override
  String get playerAudioYes => 'ضبط شده';

  @override
  String get playerAudioNo => 'ضبط نشده';

  @override
  String get playerReason => 'ذخیره‌شده توسط';

  @override
  String get playerReasonManual => 'دکمهٔ ذخیرهٔ رویداد';

  @override
  String get playerReasonEmergency => 'تشخیص برخورد احتمالی';

  @override
  String get playerReasonRecovered => 'بازیابی‌شده پس از وقفه';

  @override
  String get playerSpeed => 'سرعت GPS هنگام ذخیره';

  @override
  String get playerLocation => 'مکان';

  @override
  String get playerOpenInMaps => 'باز کردن در نقشه';

  @override
  String get playerBack => 'بازگشت';

  @override
  String get playerMore => 'اقدامات بیشتر';

  @override
  String get clipsFilterLabel => 'نمایش';

  @override
  String get clipsFilterAll => 'همه';

  @override
  String get clipsFilterRecordings => 'ضبط‌ها';

  @override
  String get clipsFilterIncidents => 'رویدادها';

  @override
  String get clipsFilterEmergency => 'اضطراری';

  @override
  String get clipsFilterFavorites => 'موارد دلخواه';

  @override
  String get clipsSort => 'مرتب‌سازی';

  @override
  String get clipsSortNewest => 'جدیدترین‌ها اول';

  @override
  String get clipsSortOldest => 'قدیمی‌ترین‌ها اول';

  @override
  String get clipsSortLongest => 'طولانی‌ترین‌ها اول';

  @override
  String get clipsSortLargest => 'بزرگ‌ترین‌ها اول';

  @override
  String get clipsToday => 'امروز';

  @override
  String get clipsYesterday => 'دیروز';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلیپ',
      one: '۱ کلیپ',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'هنوز کلیپی در این دسته نیست.';

  @override
  String get clipsFavoritesEmpty =>
      'کلیپی را ستاره‌دار کنید تا برای دسترسی سریع اینجا بماند.';

  @override
  String get clipsKindRecording => 'ضبط';

  @override
  String get clipsKindIncident => 'رویداد';

  @override
  String get clipsKindEmergency => 'اضطراری';

  @override
  String get clipsKindTest => 'آزمایشی';

  @override
  String clipsTripChip(String time) {
    return 'سفر · $time';
  }

  @override
  String get clipsOpenTrip => 'باز کردن سفری که این کلیپ در آن ضبط شده است';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used استفاده‌شده · $free آزاد';
  }

  @override
  String clipsStorageClips(String size) {
    return 'کلیپ‌ها $size فضا می‌گیرند';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ضبط',
      one: '۱ ضبط',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رویداد',
      one: '۱ رویداد',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مورد اضطراری',
      one: '۱ مورد اضطراری',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'آزاد کردن فضا';

  @override
  String get clipsStorageLowGentle =>
      'کمتر از ۲ گیگابایت فضای آزاد باقی مانده است. برای ضبط روان، فضا آزاد کنید یا کلیپ‌هایی را که دیگر نیاز ندارید حذف کنید.';

  @override
  String get clipsSaveToPhotos => 'ذخیره در عکس‌ها';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلیپ',
      one: '۱ کلیپ',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلیپ ($size) حذف شود؟',
      one: 'این کلیپ ($size) حذف شود؟',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'در حال ذخیرهٔ $done از $total در عکس‌ها…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلیپ در عکس‌ها ذخیره شد',
      one: 'در عکس‌ها ذخیره شد',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved مورد در عکس‌ها ذخیره شد · $failed مورد ذخیره نشد';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista اجازهٔ افزودن ویدیو به عکس‌ها را ندارد. می‌توانید در تنظیمات اجازه دهید.';

  @override
  String get clipsPhotosFailed => 'ذخیره در عکس‌ها انجام نشد.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلیپ به موارد دلخواه افزوده شد',
      one: 'به موارد دلخواه افزوده شد',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلیپ از موارد دلخواه حذف شد',
      one: 'از موارد دلخواه حذف شد',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (برش‌خورده)';
  }

  @override
  String get playerTrim => 'برش';

  @override
  String get playerInfo => 'اطلاعات';

  @override
  String get playerKind => 'نوع';

  @override
  String get playerReasonRecording => 'دکمهٔ ضبط';

  @override
  String get trimTitle => 'برش کلیپ';

  @override
  String get trimHint =>
      'دستگیره‌ها را بکشید تا بخشی را که می‌خواهید نگه دارید انتخاب کنید. کلیپ اصلی بدون تغییر می‌ماند.';

  @override
  String get trimStartHandle => 'شروع برش';

  @override
  String get trimEndHandle => 'پایان برش';

  @override
  String trimSelection(String duration) {
    return '$duration انتخاب شد';
  }

  @override
  String get trimSave => 'ذخیره به‌عنوان کلیپ جدید';

  @override
  String get trimSaving => 'در حال ذخیرهٔ کلیپ برش‌خورده…';

  @override
  String get trimSaved => 'کلیپ برش‌خورده ذخیره شد';

  @override
  String get trimOpenNew => 'باز کردن';

  @override
  String get trimFailed => 'برش این کلیپ انجام نشد.';

  @override
  String get trimStorageFull =>
      'فضای آزاد کافی برای ذخیرهٔ کلیپ برش‌خورده وجود ندارد.';

  @override
  String get trimPreview => 'پخش بخش انتخاب‌شده';

  @override
  String get settingsTitle => 'تنظیمات';

  @override
  String get settingsSectionCamera => 'دوربین';

  @override
  String get settingsSectionAi => 'هوش مصنوعی';

  @override
  String get settingsSectionAlerts => 'هشدارها';

  @override
  String get settingsSectionAlertCategories => 'دسته‌های هشدار';

  @override
  String get settingsSectionRecording => 'ضبط';

  @override
  String get settingsSectionDriving => 'رانندگی';

  @override
  String get settingsSectionPower => 'انرژی';

  @override
  String get settingsSectionEmergency => 'اضطراری';

  @override
  String get settingsSectionAppearance => 'ظاهر';

  @override
  String get settingsSectionLanguage => 'زبان';

  @override
  String get settingsSectionInformation => 'اطلاعات';

  @override
  String get settingsCameraLens => 'لنز دوربین';

  @override
  String get settingsLensWide => 'واید';

  @override
  String get settingsLensUltraWide => 'اولتراواید';

  @override
  String get settingsLensTelephoto => 'تله‌فوتو';

  @override
  String get settingsLensUnavailable => 'در این iPhone در دسترس نیست';

  @override
  String get settingsStabilization => 'پایدارسازی';

  @override
  String get settingsStabAuto => 'خودکار';

  @override
  String get settingsStabOff => 'خاموش';

  @override
  String get settingsStabStandard => 'استاندارد';

  @override
  String get settingsStabCinematic => 'سینمایی';

  @override
  String get settingsOverlayOpacity => 'شفافیت لایهٔ روی تصویر';

  @override
  String get settingsShowFps => 'نمایش آمار عملکرد';

  @override
  String get settingsShowFpsSubtitle => 'نرخ فریم و زمان پردازش در نمای تشخیص';

  @override
  String get settingsCameraFooter =>
      'تغییرات لنز و پایدارسازی دفعهٔ بعد که دوربین راه‌اندازی شود اعمال می‌شوند.';

  @override
  String get settingsAiModel => 'مدل هوش مصنوعی';

  @override
  String get settingsConfidence => 'اطمینان تشخیص';

  @override
  String get settingsTracking => 'ردیابی اشیا';

  @override
  String get settingsTrackingSubtitle =>
      'اشیا را بین فریم‌ها پایدار نگه می‌دارد';

  @override
  String get settingsShowLabels => 'نمایش برچسب‌ها';

  @override
  String get settingsShowConfidence => 'نمایش میزان اطمینان';

  @override
  String get settingsSegmentationOpacity => 'شفافیت ماسک ادراک';

  @override
  String get settingsAiFooter =>
      'اطمینان کمتر، اشیای بیشتری نشان می‌دهد اما تشخیص‌های اشتباه هم بیشتر می‌شود. تشخیص‌ها ممکن است نادرست باشند.';

  @override
  String get settingsVoiceAlerts => 'هشدارهای صوتی';

  @override
  String get settingsVoiceLanguage => 'زبان صدا';

  @override
  String get settingsVoiceLanguageAuto => 'مطابق زبان برنامه';

  @override
  String get settingsVoice => 'صدا';

  @override
  String get settingsVoiceDefault => 'پیش‌فرض سیستم';

  @override
  String get settingsVoiceQualityEnhanced => 'بهبودیافته';

  @override
  String get settingsVoiceQualityPremium => 'کیفیت بالا';

  @override
  String get settingsNoVoices =>
      'برای این زبان صدایی نصب نشده است. از مسیر تنظیمات iOS › دسترس‌پذیری › Spoken Content یک صدا اضافه کنید.';

  @override
  String get settingsAlertPedestrian => 'عابران پیاده';

  @override
  String get settingsAlertCyclist => 'دوچرخه‌سواران';

  @override
  String get settingsAlertMotorcycle => 'موتورسیکلت‌ها';

  @override
  String get settingsAlertBus => 'اتوبوس‌ها';

  @override
  String get settingsAlertVehicleClose => 'خودروی بسیار نزدیک در جلو';

  @override
  String get settingsAlertTrafficLight => 'تغییر چراغ راهنمایی';

  @override
  String get settingsAlertTrafficMoving => 'حرکت ترافیک جلو';

  @override
  String get settingsAlertStopSign => 'علائم ایست';

  @override
  String get settingsSensitivity => 'حساسیت';

  @override
  String get settingsSensitivityLow => 'کم';

  @override
  String get settingsSensitivityMedium => 'متوسط';

  @override
  String get settingsSensitivityHigh => 'زیاد';

  @override
  String get settingsCooldown => 'فاصلهٔ تکرار';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds ث';
  }

  @override
  String get settingsVolume => 'بلندی صدا';

  @override
  String get settingsQuietMode => 'حالت آرام';

  @override
  String get settingsQuietModeSubtitle =>
      'فقط مهم‌ترین هشدارها به‌صورت صوتی اعلام می‌شوند';

  @override
  String get settingsTestVoice => 'آزمایش صدا';

  @override
  String get settingsTestVoiceDone => 'در حال پخش یک هشدار نمونه…';

  @override
  String get settingsParkingBeeps => 'بوق‌های پارک';

  @override
  String get settingsBeepVolume => 'بلندی بوق';

  @override
  String get settingsAlertsFooter =>
      'هشدارها فقط کمک‌ابزارند. همیشه به جاده نگاه کنید — سکوت به معنی آزاد بودن مسیر نیست.';

  @override
  String get settingsRecordingProfile => 'کیفیت ضبط';

  @override
  String get settingsProfileStandard => 'استاندارد · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'بافر رویداد';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds ثانیه';
  }

  @override
  String get settingsManualMaxLength => 'حداکثر طول ضبط دستی';

  @override
  String get settingsManualMaxUnlimited => 'نامحدود';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes دقیقه';
  }

  @override
  String get settingsRecordAudio => 'ضبط صدا';

  @override
  String get settingsRecordAudioSubtitle =>
      'صدای داخل کابین را در رویدادهای ذخیره‌شده شامل می‌کند';

  @override
  String get settingsMicDenied =>
      'دسترسی به میکروفون خاموش است. برای ضبط صدا آن را در تنظیمات مجاز کنید.';

  @override
  String get settingsWatermark => 'واترمارک Corvista';

  @override
  String get settingsTimestamp => 'مهر تاریخ و ساعت';

  @override
  String get settingsSaveLocation => 'ذخیرهٔ مکان همراه کلیپ‌ها';

  @override
  String get settingsStorage => 'فضای ذخیره‌سازی و کلیپ‌ها';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلیپ',
      one: '1 کلیپ',
      zero: 'بدون کلیپ',
    );
    return '$_temp0 · $used مصرف‌شده · $free آزاد';
  }

  @override
  String get settingsRecordingFooter =>
      'بافر چرخشی روی iPhone شما می‌ماند و پیوسته بازنویسی می‌شود. هیچ چیزی در پس‌زمینه ضبط نمی‌شود.';

  @override
  String get settingsDefaultView => 'نمای پیش‌فرض';

  @override
  String get settingsUnits => 'واحدها';

  @override
  String get settingsShowCompass => 'نمایش قطب‌نما';

  @override
  String get settingsHudStyle => 'سبک HUD';

  @override
  String get settingsHudCustomize => 'سفارشی‌سازی HUD';

  @override
  String get settingsDrivingSide => 'سمت رانندگی';

  @override
  String get settingsDrivingSideAuto => 'خودکار';

  @override
  String get settingsDrivingSideRight => 'راست';

  @override
  String get settingsDrivingSideLeft => 'چپ';

  @override
  String get settingsVirtualStyle => 'سبک نمای مجازی';

  @override
  String get settingsVirtualMinimal => 'حداقلی';

  @override
  String get settingsVirtualPerspective => 'پرسپکتیو';

  @override
  String get settingsVirtualHighContrast => 'کنتراست بالا';

  @override
  String get settingsKeepScreenOn => 'روشن نگه داشتن صفحه هنگام رانندگی';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'نمایش راهنمای گام‌به‌گام مسیر در صفحهٔ قفل و Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'ضبط هنگامی که Corvista در پس‌زمینه بود متوقف شد';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'متوقف';

  @override
  String get liveActivityDashcamOff => 'دوربین خاموش';

  @override
  String get liveActivityEnded => 'مسیریابی پایان یافت';

  @override
  String get liveActivityEta => 'رسیدن';

  @override
  String get settingsAutoRecenter => 'بازگشت خودکار نقشه به موقعیت';

  @override
  String get settingsHudStyleClassic => 'کلاسیک';

  @override
  String get settingsHudStyleGrid => 'شبکه‌ای';

  @override
  String get settingsHudStyleMinimal => 'حداقلی';

  @override
  String get settingsHudStylePerformance => 'عملکرد';

  @override
  String get settingsHudStyleNavigation => 'مسیریابی';

  @override
  String get settingsHudStyleNight => 'شب';

  @override
  String get settingsHudStyleHighContrast => 'کنتراست بالا';

  @override
  String get settingsPowerMode => 'حالت انرژی';

  @override
  String get settingsPowerBalanced => 'متعادل';

  @override
  String get settingsPowerPerformance => 'عملکرد';

  @override
  String get settingsPowerSaver => 'صرفه‌جویی در انرژی';

  @override
  String get settingsPowerFooter =>
      'وقتی iPhone گرم می‌شود یا باتری کم است، Corvista نرخ هوش مصنوعی و جلوه‌های بصری را خودکار کاهش می‌دهد.';

  @override
  String get settingsThermal => 'وضعیت دما';

  @override
  String get settingsThermalNominal => 'عادی';

  @override
  String get settingsThermalFair => 'گرم';

  @override
  String get settingsThermalSerious => 'داغ';

  @override
  String get settingsThermalCritical => 'بحرانی';

  @override
  String get settingsBattery => 'باتری';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · در حال شارژ';
  }

  @override
  String get settingsLowPowerMode =>
      'حالت کم‌مصرف روشن است — هوش مصنوعی با نرخ کاهش‌یافته کار می‌کند.';

  @override
  String get settingsAiRate => 'نرخ فعلی هوش مصنوعی';

  @override
  String settingsHzValue(String value) {
    return '$value هرتز';
  }

  @override
  String get settingsEmergencySetup => 'تشخیص برخورد';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'روشن · شمارش معکوس $seconds ثانیه‌ای';
  }

  @override
  String get settingsEmergencyFooter => 'آزمایشی. جایگزین خدمات اضطراری نیست.';

  @override
  String get settingsTheme => 'پوسته';

  @override
  String get settingsThemeSystem => 'سیستم';

  @override
  String get settingsThemeDark => 'تیره';

  @override
  String get settingsThemeLight => 'روشن';

  @override
  String get settingsReduceMotion => 'کاهش حرکت';

  @override
  String get settingsReduceMotionSubtitle =>
      'انیمیشن‌ها را در سراسر برنامه به حداقل می‌رساند';

  @override
  String get settingsAppLanguage => 'زبان برنامه';

  @override
  String get settingsPrivacyPolicy => 'سیاست حریم خصوصی';

  @override
  String get settingsTerms => 'شرایط استفاده';

  @override
  String get settingsHelp => 'راهنما';

  @override
  String get settingsSupport => 'تماس با پشتیبانی';

  @override
  String get settingsLicenses => 'مجوزهای متن‌باز';

  @override
  String get settingsSupportUnavailable =>
      'باز کردن Mail ممکن نشد. به support@corvista.app بنویسید.';

  @override
  String get settingsSafety => 'اطلاعات ایمنی';

  @override
  String get settingsDiagnostics => 'عیب‌یابی';

  @override
  String get settingsVersion => 'نسخه';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'سفارشی‌سازی HUD';

  @override
  String get hudCustomPreview => 'پیش‌نمایش · مقادیر نمونه';

  @override
  String get hudCustomStyle => 'سبک';

  @override
  String get hudCustomElements => 'عناصر';

  @override
  String get hudCustomSpeed => 'سرعت';

  @override
  String get hudCustomHeading => 'جهت و قطب‌نما';

  @override
  String get hudCustomClock => 'ساعت';

  @override
  String get hudCustomBattery => 'باتری و دما';

  @override
  String get hudCustomDetections => 'وضعیت هوش مصنوعی و تشخیص‌ها';

  @override
  String get hudCustomWeather => 'آب‌وهوا';

  @override
  String get hudCustomAppearance => 'اندازه و شفافیت';

  @override
  String get hudCustomSize => 'اندازه';

  @override
  String get hudCustomOpacity => 'شفافیت';

  @override
  String get hudCustomFooter =>
      'هشدارهایی مانند داغ شدن بیش‌ازحد همیشه نمایش داده می‌شوند، حتی اگر عناصر پنهان باشند.';

  @override
  String get hudCustomDescClassic => 'صفحه‌نمایش متعادل ابزار';

  @override
  String get hudCustomDescGrid => 'شبکهٔ پرسپکتیو روی جاده';

  @override
  String get hudCustomDescMinimal => 'فقط سرعت، نه چیز دیگر';

  @override
  String get hudCustomDescPerformance => 'کمان سرعت با داده‌های زنده';

  @override
  String get hudCustomDescNavigation => 'ابتدا مانور بعدی';

  @override
  String get hudCustomDescNight => 'کم‌نور و متمایل به قرمز برای رانندگی شبانه';

  @override
  String get hudCustomDescHighContrast => 'بیشترین خوانایی زیر نور شدید خورشید';

  @override
  String get languageTitle => 'زبان';

  @override
  String get languageSystem => 'پیش‌فرض سیستم';

  @override
  String get languageSystemSubtitle => 'مطابق زبان iPhone شما';

  @override
  String get languageFooter =>
      'زبان‌های بیشتری در راه است. زبان هشدار صوتی را می‌توان جداگانه در بخش هشدارها تنظیم کرد.';

  @override
  String get diagTitle => 'عیب‌یابی';

  @override
  String get diagPerformance => 'عملکرد';

  @override
  String get diagInference => 'زمان استنتاج';

  @override
  String get diagDetectHz => 'نرخ تشخیص';

  @override
  String get diagCameraFps => 'نرخ فریم دوربین';

  @override
  String get diagMemory => 'حافظه';

  @override
  String get diagDropped => 'فریم‌های ازدست‌رفته';

  @override
  String get diagSegmentation => 'زمان قطعه‌بندی';

  @override
  String get diagCamera => 'دوربین';

  @override
  String get diagStatus => 'وضعیت';

  @override
  String get diagSource => 'منبع';

  @override
  String get diagSourceCamera => 'دوربین زنده';

  @override
  String get diagSourceFile => 'فایل ویدیوی آزمایشی';

  @override
  String get diagResolution => 'اندازهٔ بافر';

  @override
  String get diagLens => 'لنز';

  @override
  String get diagError => 'آخرین خطا';

  @override
  String get diagModel => 'مدل هوش مصنوعی';

  @override
  String get diagModelLoad => 'زمان بارگذاری مدل';

  @override
  String get diagPower => 'انرژی';

  @override
  String get diagSegHz => 'نرخ قطعه‌بندی';

  @override
  String get diagReduced => 'جلوه‌های کاهش‌یافته';

  @override
  String diagMs(String value) {
    return '$value میلی‌ثانیه';
  }

  @override
  String diagFps(String value) {
    return '$value فریم بر ثانیه';
  }

  @override
  String diagMb(String value) {
    return '$value MB';
  }

  @override
  String get diagCamIdle => 'بیکار';

  @override
  String get diagCamStarting => 'در حال شروع';

  @override
  String get diagCamRunning => 'در حال اجرا';

  @override
  String get diagCamInterrupted => 'قطع‌شده';

  @override
  String get diagCamStopped => 'متوقف';

  @override
  String get diagCamUnavailable => 'در دسترس نیست';

  @override
  String get diagCamPermissionDenied => 'اجازه داده نشد';

  @override
  String get diagCamError => 'خطا';

  @override
  String get diagTestFootage => 'ویدیوی آزمایشی';

  @override
  String get diagTestFootageBody =>
      'به‌جای دوربین، تشخیص واقعی روی دستگاه را روی یک فایل ویدیوی محلی اجرا کنید. هر نما آن را «ویدیوی آزمایشی» برچسب می‌زند.';

  @override
  String get diagPathLabel => 'مسیر فایل ویدیو';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'استفاده از Documents/test_drive.mp4';

  @override
  String get diagRun => 'اجرای ویدیوی آزمایشی';

  @override
  String get diagRunStarted =>
      'ویدیوی آزمایشی شروع شد. برای دیدن آن، نمای رانندگی را باز کنید.';

  @override
  String get diagBackToCamera => 'بازگشت به دوربین زنده';

  @override
  String get diagDebugOnly =>
      'ویدیوی آزمایشی فقط در نسخه‌های توسعه در دسترس است.';

  @override
  String get diagFileMissing => 'در این مسیر فایلی وجود ندارد.';

  @override
  String get emergencySetupTitle => 'تشخیص برخورد';

  @override
  String get emergencyExperimental => 'آزمایشی';

  @override
  String get emergencyIntro =>
      'هنگام رانندگی، Corvista می‌تواند با حسگرهای حرکتی iPhone شما مراقب یک برخورد شدید احتمالی باشد. اگر برخوردی تشخیص داده شود، شمارش معکوس آغاز می‌شود. اگر آن را لغو نکنید، Corvista پیشنهاد می‌دهد با خدمات اضطراری تماس بگیرد و برای مخاطبان شما پیام بفرستد.';

  @override
  String get emergencyDisclaimer1 =>
      'جایگزین خدمات اضطراری یا سامانهٔ تشخیص تصادف خود خودرو نیست.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS همیشه پیش از برقراری تماس یا ارسال پیام از شما تأیید می‌گیرد.';

  @override
  String get emergencyDisclaimer3 =>
      'ممکن است برخوردها تشخیص داده نشوند، و ترمز شدید یا دست‌انداز ممکن است به‌اشتباه برخورد تلقی شود.';

  @override
  String get emergencyParkedWarning =>
      'این تنظیمات را هنگام توقف کامل کنید. تا زمانی که خودرو در حرکت است، تنظیمات قفل می‌مانند.';

  @override
  String get emergencyEnable => 'فعال‌سازی تشخیص برخورد';

  @override
  String get emergencyEnableSubtitle => 'فقط هنگام رانندگی فعال است';

  @override
  String get emergencyNeedNumber => 'ابتدا یک شماره اضطراری اضافه کنید.';

  @override
  String get emergencyContacts => 'مخاطبان اضطراری';

  @override
  String get emergencyAddContact => 'افزودن مخاطب';

  @override
  String get emergencyNoContacts =>
      'هنوز مخاطبی نیست. مخاطبان فقط پس از تأیید شما پیام دریافت می‌کنند.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '$name حذف شود؟';
  }

  @override
  String get emergencyRemoveContactBody =>
      'پس از برخورد، او به‌عنوان گیرنده پیشنهاد نخواهد شد.';

  @override
  String get emergencyRemove => 'حذف';

  @override
  String get emergencyContactsError => 'بارگذاری مخاطبان ممکن نشد.';

  @override
  String get emergencyNumber => 'شمارهٔ اضطراری';

  @override
  String get emergencyNumberHint => 'مثلاً 112 یا 911';

  @override
  String get emergencyMessage => 'الگوی پیام';

  @override
  String get emergencyMessageDefault =>
      'ممکن است دچار تصادف رانندگی شده باشم. این پیام را Corvista تهیه کرده و در صورت دسترس‌پذیری، آخرین مکان شناخته‌شدهٔ من را شامل می‌شود.';

  @override
  String get emergencyMessageHint =>
      'برای استفاده از پیام پیش‌فرض خالی بگذارید.';

  @override
  String get emergencyCountdown => 'مدت شمارش معکوس';

  @override
  String get emergencyVoiceCancel => 'لغو با صدا';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'هنگام شمارش معکوس بگویید «من خوبم» یا «لغو». در صورت امکان از تشخیص گفتار روی دستگاه استفاده می‌کند.';

  @override
  String get emergencyVoicePermDenied =>
      'برای لغو با صدا، دسترسی به میکروفون و تشخیص گفتار لازم است.';

  @override
  String get emergencyAutoSave => 'ذخیرهٔ خودکار کلیپ رویداد';

  @override
  String get emergencyTest => 'آزمایش شمارش معکوس (بدون تماس)';

  @override
  String get emergencyTestBody =>
      'یک برخورد شبیه‌سازی‌شده اجرا می‌کند تا شمارش معکوس را ببینید. در حالت آزمایشی هرگز تماس یا پیامی ارسال نمی‌شود.';

  @override
  String get emergencyNotSet => 'تنظیم نشده';

  @override
  String get emergencyAlertHeadline => 'برخورد شدید احتمالی تشخیص داده شد.';

  @override
  String get emergencyAlertSubtitle => 'حال شما خوب است؟';

  @override
  String get emergencyAlertCancel => 'من خوبم — لغو';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds ثانیه مانده',
      one: '1 ثانیه مانده',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'در حال گوش دادن — برای لغو بگویید «من خوبم»';

  @override
  String emergencyAlertHeard(String text) {
    return 'شنیده شد: «$text»';
  }

  @override
  String get emergencyAlertEscalated =>
      'پاسخی دریافت نشد. یک گزینه را انتخاب کنید:';

  @override
  String get emergencyAlertCall => 'تماس با خدمات اضطراری';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'با $number تماس می‌گیرد. iOS از شما تأیید می‌خواهد.';
  }

  @override
  String get emergencyAlertMessage => 'پیام به مخاطبان';

  @override
  String get emergencyAlertMessageSubtitle =>
      'یک پیام آماده را باز می‌کند. شما تصمیم می‌گیرید ارسال شود یا نه.';

  @override
  String get emergencyAlertTestMode =>
      'حالت آزمایشی — هیچ تماسی برقرار نمی‌شود';

  @override
  String get emergencyAlertTestBadge => 'آزمایشی';

  @override
  String get emergencyAlertClose => 'من خوبم — بستن';

  @override
  String get emergencyMsgSent => 'پیام ارسال شد.';

  @override
  String get emergencyMsgCancelled => 'پیام ارسال نشد.';

  @override
  String get emergencyMsgFailed => 'ارسال پیام ممکن نشد.';

  @override
  String get emergencyMsgUnavailable =>
      'ارسال پیام در این دستگاه در دسترس نیست.';

  @override
  String emergencyCallFailed(String number) {
    return 'شروع تماس ممکن نشد. خودتان با $number تماس بگیرید.';
  }

  @override
  String get modelsTitle => 'مدل‌های هوش مصنوعی';

  @override
  String get modelsIntro =>
      'همهٔ مدل‌ها همراه برنامه ارائه می‌شوند و کاملاً روی iPhone شما اجرا می‌شوند. تصویر دوربین هرگز از دستگاه خارج نمی‌شود.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'زنده: $ms میلی‌ثانیه برای هر فریم · $hz تشخیص در ثانیه';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'در $ms میلی‌ثانیه بارگذاری شد';
  }

  @override
  String get modelsEfficientName => 'کارآمد';

  @override
  String get modelsEfficientDesc =>
      'آشکارساز سریع و فشرده، بهینه برای رانندگی‌های طولانی با گرمای کم و مصرف کم باتری.';

  @override
  String get modelsEnhancedName => 'پیشرفته';

  @override
  String get modelsEnhancedDesc =>
      'آشکارساز بزرگ‌تر که اشیای کوچک‌تر و دورتر را پیدا می‌کند، با مصرف انرژی بیشتر.';

  @override
  String get modelsSegmentationName => 'قطعه‌بندی';

  @override
  String get modelsSegmentationDesc =>
      'تشخیص سریع را با ماسک سطح جاده و اشیا برای نمای ادراک ترکیب می‌کند.';

  @override
  String get modelsNoneName => 'هوش مصنوعی متوقف';

  @override
  String get modelsNoneDesc =>
      'دوربین و ضبط بدون تشخیص اشیا ادامه می‌یابند. کمترین مصرف انرژی.';

  @override
  String get modelsGenericDesc => 'مدل تشخیص اشیا روی دستگاه.';

  @override
  String get modelsFunctionDetection =>
      'خودروها، افراد، دوچرخه‌ها، موتورسیکلت‌ها، اتوبوس‌ها، چراغ‌های راهنمایی و علائم ایست را تشخیص می‌دهد';

  @override
  String get modelsFunctionSegmentation =>
      'ماسک سطح جاده و اشیا را اضافه می‌کند';

  @override
  String get modelsFunctionNone => 'بدون تشخیص؛ فقط ضبط دوربین خودرو';

  @override
  String get modelsSize => 'اندازه';

  @override
  String get modelsInput => 'ورودی';

  @override
  String modelsInputValue(String size) {
    return '$size × $size پیکسل';
  }

  @override
  String get modelsViews => 'سازگار با';

  @override
  String get modelsStatusInstalled => 'نصب‌شده (همراه برنامه)';

  @override
  String get modelsStatusNotInstalled => 'نصب نشده';

  @override
  String get modelsSelected => 'انتخاب‌شده';

  @override
  String get modelsUse => 'استفاده از این مدل';

  @override
  String get modelsSwitching => 'در حال بارگذاری مدل…';

  @override
  String modelsSwitched(String name) {
    return '$name اکنون فعال است';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'اندازه‌گیری‌شده روی این دستگاه: میانگین $ms میلی‌ثانیه';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'روی این دستگاه اندازه‌گیری نشده';

  @override
  String get modelsBenchmarkRun => 'اجرای محک‌زنی';

  @override
  String get modelsBenchmarkRunning => 'در حال محک‌زنی…';

  @override
  String get modelsBenchmarkSelectHint =>
      'برای محک‌زنی، این مدل را انتخاب کنید.';

  @override
  String get modelsBenchmarkDone => 'محک‌زنی کامل شد';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'محک‌زنی ناموفق بود: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'آخرین به‌روزرسانی: $date';
  }

  @override
  String get safetyTitle => 'اطلاعات ایمنی';

  @override
  String get safetyIntro =>
      'Corvista ابزاری برای افزایش آگاهی هنگام رانندگی است. این برنامه خودروی شما را کنترل نمی‌کند و نمی‌تواند جای توجه و قضاوت خودتان یا سامانه‌های ایمنی خودرو را بگیرد.';

  @override
  String get safetyBeforeTitle => 'پیش از رانندگی';

  @override
  String get safetyBefore1 =>
      'iPhone را به‌طور محکم و در موقعیتی قانونی نصب کنید که دید شما، کیسه‌های هوا یا کنترل‌ها را مسدود نکند.';

  @override
  String get safetyBefore2 =>
      'تنظیمات را کامل کنید، یک نما انتخاب کنید و مقصد را هنگام توقف تعیین کنید.';

  @override
  String get safetyBefore3 =>
      'برای رانندگی‌های طولانی‌تر شارژر وصل کنید و تا حد امکان گوشی را از نور مستقیم خورشید دور نگه دارید.';

  @override
  String get safetyWhileTitle => 'هنگام رانندگی';

  @override
  String get safetyWhile1 =>
      'چشمان خود را به جاده بدوزید. فقط وقتی ایمن و قانونی است از کنترل‌های بزرگ روی صفحه استفاده کنید.';

  @override
  String get safetyWhile2 =>
      'هشدارها کمک‌ابزارند، نه اخطارهایی که بتوان به آن‌ها تکیه کرد. سکوت هرگز به معنی آزاد بودن جاده نیست.';

  @override
  String get safetyWhile3 =>
      'در صورت تعارض، از قوانین راهنمایی و رانندگی، چراغ‌ها و علائم جاده پیروی کنید — نه برنامه.';

  @override
  String get safetyLimitsTitle => 'محدودیت‌ها';

  @override
  String get safetyLimits1 =>
      'دوربین یک گوشی فقط آنچه را روبه‌روی آن است می‌بیند. اشیای خارج از دید، پنهان یا بسیار نزدیک تشخیص داده نمی‌شوند.';

  @override
  String get safetyLimits2 =>
      'ممکن است تشخیص‌ها از قلم بیفتند، با تأخیر باشند یا اشتباه باشند، به‌ویژه در شب، باران، مه، نور خیره‌کننده یا با شیشهٔ جلوی کثیف.';

  @override
  String get safetyLimits3 =>
      'فقط دسته‌های پشتیبانی‌شده شناسایی می‌شوند: خودروها، اتوبوس‌ها، موتورسیکلت‌ها، دوچرخه‌ها، افراد، چراغ‌های راهنمایی و علائم ایست. نشانه‌های خط در نمای مجازی نمادین هستند، نه خطوط تشخیص‌داده‌شده.';

  @override
  String get safetyLimits4 =>
      'نزدیکی به‌صورت محدوده‌های تقریبی (بسیار نزدیک، نزدیک، متوسط، دور) نشان داده می‌شود، نه فاصلهٔ اندازه‌گیری‌شده. نمای پارک جایگزین حسگر پارک نیست.';

  @override
  String get safetyHeatTitle => 'گرما و باتری';

  @override
  String get safetyHeat1 =>
      'استفادهٔ پیوسته از دوربین و هوش مصنوعی iPhone را گرم می‌کند. وقتی دستگاه داغ شود، Corvista نرخ تحلیل را کاهش می‌دهد و هشداری نشان می‌دهد؛ اگر iOS بیش‌ازحد گرم شود، ممکن است دوربین متوقف شود.';

  @override
  String get safetyEmergencyTitle => 'ویژگی اضطراری';

  @override
  String get safetyEmergency1 =>
      'تشخیص برخورد احتمالی آزمایشی است. ممکن است تصادف‌های واقعی را از دست بدهد و ممکن است با رویدادهای دیگر فعال شود.';

  @override
  String get safetyEmergency2 =>
      'هرگز بی‌صدا با کسی تماس نمی‌گیرد: iOS همیشه برای تماس یا پیام از شما تأیید می‌گیرد. جایگزین تماس خودتان با خدمات اضطراری نیست.';

  @override
  String get privacyTitle => 'حریم خصوصی';

  @override
  String get privacyIntro =>
      'Corvista طوری طراحی شده که داده‌های رانندگی شما روی iPhone بماند. حساب Corvista وجود ندارد و Corvista سرور اختصاصی خود را اجرا نمی‌کند.';

  @override
  String get privacyCameraTitle => 'دوربین و هوش مصنوعی';

  @override
  String get privacyCamera1 =>
      'تشخیص اشیا، ردیابی و قطعه‌بندی کاملاً روی iPhone شما اجرا می‌شوند. فریم‌های دوربین هرگز آپلود نمی‌شوند.';

  @override
  String get privacyCamera2 =>
      'دوربین فقط زمانی کار می‌کند که Corvista روی صفحه باز باشد. با رفتن برنامه به پس‌زمینه متوقف می‌شود — هیچ ضبط پنهانی در پس‌زمینه وجود ندارد.';

  @override
  String get privacyRecordingsTitle => 'ضبط‌ها';

  @override
  String get privacyRecordings1 =>
      'بافر چرخشی موقت است و پیوسته بازنویسی می‌شود. ویدیو فقط وقتی نگه داشته می‌شود که «ذخیرهٔ رویداد» را بزنید یا، در صورت فعال‌سازی، پس از یک برخورد احتمالی.';

  @override
  String get privacyRecordings2 =>
      'کلیپ‌های ذخیره‌شده در فضای خصوصی Corvista روی iPhone شما می‌مانند. فقط وقتی «اشتراک‌گذاری» را انتخاب کنید از دستگاه خارج می‌شوند. حذف برنامه آن‌ها را حذف می‌کند.';

  @override
  String get privacyRecordings3 =>
      'صدا فقط در صورتی ضبط می‌شود که آن را روشن کنید و دسترسی میکروفون بدهید.';

  @override
  String get privacyLocationTitle => 'مکان';

  @override
  String get privacyLocation1 =>
      'مکان هنگامی که برنامه باز است برای سرعت، نقشه، مسیرها و آب‌وهوا استفاده می‌شود. اگر «ذخیرهٔ مکان» روشن باشد، موقعیت لحظهٔ ذخیره همراه کلیپ روی دستگاه شما نگه داشته می‌شود.';

  @override
  String get privacyNetworkTitle => 'خدمات شبکه';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — نمایش نقشه، جست‌وجوی مکان و مسیرها. متن جست‌وجو و مکان تقریبی شما به Apple ارسال می‌شود.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — آب‌وهوای فعلی و ساعتی برای مکان شما.';

  @override
  String get privacyNetwork4 =>
      'Corvista هیچ تبلیغ، تحلیل یا ردیابی شخص ثالثی ندارد.';

  @override
  String get privacyEmergencyTitle => 'مخاطبان اضطراری';

  @override
  String get privacyEmergency1 =>
      'مخاطبانی که انتخاب می‌کنید در iOS Keychain روی همین دستگاه ذخیره می‌شوند. لغو با صدا در صورت امکان از تشخیص گفتار روی دستگاه استفاده می‌کند. تماس‌ها و پیام‌ها فقط پس از تأیید شما در iOS ارسال می‌شوند.';

  @override
  String get privacyControlsTitle => 'کنترل‌های شما';

  @override
  String get privacyControls1 =>
      'هر زمان می‌توانید کلیپ‌ها را در بخش کلیپ‌ها حذف کنید و دسترسی دوربین، میکروفون، مکان و گفتار را در تنظیمات iOS تغییر دهید یا لغو کنید.';

  @override
  String get termsTitle => 'شرایط استفاده';

  @override
  String get termsIntro =>
      'با استفاده از Corvista با این شرایط موافقت می‌کنید. قرارداد استاندارد مجوز کاربر نهایی برنامهٔ دارای مجوز Apple نیز اعمال می‌شود.';

  @override
  String get termsUseTitle => 'استفاده از Corvista';

  @override
  String get termsUse1 =>
      'Corvista ابزاری برای آگاهی هنگام رانندگی و دوربین خودرو است. مسئولیت رانندگی ایمن و قانونی همواره کاملاً با شماست.';

  @override
  String get termsUse2 =>
      'هنگام رانندگی به‌گونه‌ای با برنامه کار نکنید که حواس شما را پرت کند. دستگاه را محکم و قانونی نصب کنید.';

  @override
  String get termsAccuracyTitle => 'بدون تضمین دقت';

  @override
  String get termsAccuracy1 =>
      'تشخیص‌ها، محدوده‌ها، هشدارها، نشانگرهای نقشه، مسیرها و آب‌وهوا ممکن است ناقص، با تأخیر یا نادرست باشند. Corvista خودروی شما را کنترل نمی‌کند.';

  @override
  String get termsAccuracy2 =>
      'ویژگی اضطراری آزمایشی است و ممکن است برخوردی را تشخیص ندهد یا به‌اشتباه فعال شود.';

  @override
  String get termsRecordingTitle => 'قوانین ضبط';

  @override
  String get termsRecording1 =>
      'قوانین مربوط به دوربین خودرو، ضبط صدا و فیلم‌برداری از افراد در کشورها و مناطق مختلف متفاوت است. رعایت آن‌ها، از جمله هنگام اشتراک‌گذاری کلیپ‌ها، بر عهدهٔ شماست.';

  @override
  String get termsLiabilityTitle => 'مسئولیت';

  @override
  String get termsLiability1 =>
      'برنامه «به همان صورتی که هست» ارائه می‌شود. تا حدی که قانون اجازه می‌دهد، توسعه‌دهنده مسئول حوادث، خسارت‌ها، جریمه‌ها یا زیان‌های ناشی از استفاده از آن یا اتکا به خروجی آن نیست.';

  @override
  String get termsChangesTitle => 'تغییرات';

  @override
  String get termsChanges1 =>
      'این شرایط ممکن است با نسخه‌های جدید برنامه به‌روزرسانی شود. ادامهٔ استفاده پس از به‌روزرسانی به معنی پذیرش شرایط اصلاح‌شده است.';

  @override
  String get helpTitle => 'راهنما';

  @override
  String get helpIntro =>
      'پاسخ به پرسش‌های متداول. برای راهنمای ایمنی، «اطلاعات ایمنی» را ببینید.';

  @override
  String get helpQSave => 'چگونه ویدیوی یک رویداد را نگه دارم؟';

  @override
  String get helpASaveBuffer =>
      'در نمای رانندگی روی دکمهٔ بزرگ «ذخیرهٔ رویداد» بزنید. Corvista ۲۰ یا ۳۰ ثانیهٔ آخر حافظهٔ موقت پیوستهٔ خود را (انتخاب شما در تنظیمات › ضبط) در کلیپ‌ها ذخیره می‌کند.';

  @override
  String get helpQWhere => 'کلیپ‌های من کجا ذخیره می‌شوند؟';

  @override
  String get helpAWhere =>
      'در فضای خصوصی Corvista روی iPhone شما. هرگز آپلود نمی‌شوند. برای ارسال یا خروجی گرفتن از یک کلیپ، از «اشتراک‌گذاری» در پخش‌کننده استفاده کنید.';

  @override
  String get helpQZones => 'محدوده‌های نزدیکی چقدر دقیق‌اند؟';

  @override
  String get helpAZones =>
      'محدوده‌ها برآوردهای تقریبی از یک دوربین با استفاده از اندازه‌های معمول اشیا هستند. آن‌ها را راهنمای تقریبی بدانید، نه فاصله.';

  @override
  String get helpQSlow => 'چرا تشخیص کند می‌شود؟';

  @override
  String get helpASlow =>
      'وقتی iPhone گرم می‌شود، باتری کم است یا حالت کم‌مصرف روشن است، Corvista برای محافظت از دستگاه نرخ تحلیل را کاهش می‌دهد. می‌توانید حالت انرژی را در تنظیمات تغییر دهید.';

  @override
  String get helpQMap => 'نقشه، جست‌وجو یا آب‌وهوا کار نمی‌کند.';

  @override
  String get helpAMap =>
      'این ویژگی‌ها به اتصال اینترنت و دسترسی به مکان نیاز دارند. اتصال خود را بررسی کنید و در تنظیمات iOS مکان را برای Corvista مجاز کنید.';

  @override
  String get helpQSimulator => 'دوربین در دسترس نیست.';

  @override
  String get helpASimulator =>
      'مطمئن شوید دسترسی دوربین در تنظیمات iOS مجاز است و برنامهٔ دیگری از دوربین استفاده نمی‌کند. در iOS Simulator دوربین وجود ندارد؛ می‌توان به‌جای آن از یک ویدیوی آزمایشی محلی استفاده کرد.';

  @override
  String get emergencyMsgNoContacts => 'ابتدا یک مخاطب اضطراری اضافه کنید.';

  @override
  String get cameraStarting => 'در حال راه‌اندازی دوربین…';

  @override
  String get cameraInterrupted => 'دوربین متوقف شد';

  @override
  String get cameraInterruptedBody =>
      'iOS دوربین را متوقف کرده است، مثلاً هنگام تماس یا استفادهٔ برنامهٔ دیگر از آن. به‌طور خودکار از سر گرفته می‌شود.';

  @override
  String get cameraUnavailable => 'دوربین در دسترس نیست';

  @override
  String get cameraUnavailableBody =>
      'در این دستگاه دوربینی در دسترس نیست. نمای تشخیص، ضبط و پارک به دوربین پشت نیاز دارند.';

  @override
  String get cameraRunTestFootage => 'اجرای ویدیوی آزمایشی';

  @override
  String get cameraPermissionDenied => 'دسترسی به دوربین خاموش است';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista برای تشخیص، ضبط دوربین خودرو و نمای پارک به دوربین نیاز دارد. دسترسی دوربین را در تنظیمات روشن کنید.';

  @override
  String get cameraError => 'خطای دوربین';

  @override
  String get cameraStopped => 'دوربین متوقف شد';

  @override
  String get cameraStart => 'راه‌اندازی دوربین';

  @override
  String get cameraFocusHint => 'برای فوکوس ضربه بزنید';

  @override
  String get cameraPreviewLabel => 'نمای زندهٔ دوربین با اشیای تشخیص‌داده‌شده';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'دوربین $fps fps · هوش مصنوعی $hz Hz · $ms ms · ازدست‌رفته $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'سرعت $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'سرعت GPS موجود نیست';

  @override
  String hudHeading(String direction, String degrees) {
    return 'جهت $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds ثانیه';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'ضبط بافر دوربین خودرو، $seconds ثانیه از $target ثانیه ذخیره شده';
  }

  @override
  String get hudRecIdle => 'REC خاموش';

  @override
  String get hudRecSaving => 'در حال ذخیره…';

  @override
  String get hudRecError => 'خطای REC';

  @override
  String get hudAiPaused => 'هوش مصنوعی متوقف';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شیء',
      one: '1 شیء',
      zero: 'بدون شیء',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شیء تشخیص داده شد',
      one: '1 شیء تشخیص داده شد',
      zero: 'شیئی تشخیص داده نشد',
    );
    return 'مدل هوش مصنوعی $model، $_temp0';
  }

  @override
  String get hudThermalSerious => 'داغ — هوش مصنوعی کند شد';

  @override
  String get hudThermalCritical => 'بیش‌ازحد داغ — هوش مصنوعی متوقف شد';

  @override
  String hudBatteryLow(String percent) {
    return 'باتری $percent';
  }

  @override
  String get hudLowPower => 'حالت کم‌مصرف';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'آب‌وهوا $temperature، $condition. برای جزئیات ضربه بزنید.';
  }

  @override
  String get hudNoGuidance =>
      'برای دیدن راهنمای گام‌به‌گام در اینجا، در نمای نقشه مقصدی جست‌وجو کنید.';

  @override
  String get navArrived => 'به مقصد رسیدید';

  @override
  String get navRerouting => 'در حال مسیریابی مجدد…';

  @override
  String get navSearchHint => 'جست‌وجوی مقصد';

  @override
  String get navSearchFieldHint => 'نشانی، مکان یا کسب‌وکار';

  @override
  String get navNoResults => 'مکان مطابقی پیدا نشد';

  @override
  String get navSearching => 'در حال جست‌وجو…';

  @override
  String get navSearchStartTyping =>
      'نشانی یا نام مکان را بنویسید. نتایج از Apple Maps می‌آیند و به اتصال اینترنت نیاز دارند.';

  @override
  String get navErrorUnavailable =>
      'جست‌وجو و مسیرها در دسترس نیستند — اتصال اینترنت خود را بررسی کنید.';

  @override
  String get navErrorNoLocation => 'در انتظار مکان شما برای برنامه‌ریزی مسیر.';

  @override
  String get navErrorPermission =>
      'دسترسی به مکان خاموش است، پس مسیرها نمی‌توانند از موقعیت شما آغاز شوند.';

  @override
  String navErrorGeneric(String code) {
    return 'بارگذاری مسیرها ممکن نشد ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'مسیرها به $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'رسیدن $time';
  }

  @override
  String get navStart => 'شروع';

  @override
  String get navEnd => 'پایان';

  @override
  String get navEndLabel => 'پایان مسیریابی';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration مانده';
  }

  @override
  String navAdvisory(String text) {
    return 'توجه: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes دقیقه',
      one: '1 دقیقه',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours ساعت و $minutes دقیقه';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'مسیر $index: $name';
  }

  @override
  String get weatherTitle => 'آب‌وهوا';

  @override
  String weatherFeelsLike(String temperature) {
    return 'احساس‌شده $temperature';
  }

  @override
  String get weatherPrecipitation => 'بارش';

  @override
  String get weatherWind => 'باد';

  @override
  String get weatherVisibility => 'میدان دید';

  @override
  String get weatherHumidity => 'رطوبت';

  @override
  String get weatherHourly => 'ساعت‌های آینده';

  @override
  String weatherAsOf(String time) {
    return 'به‌روزرسانی $time';
  }

  @override
  String get weatherRefresh => 'تازه‌سازی آب‌وهوا';

  @override
  String get weatherUnavailable => 'آب‌وهوا در حال حاضر در دسترس نیست.';

  @override
  String get weatherNoLocation => 'آب‌وهوا به مکان شما نیاز دارد.';

  @override
  String get weatherLegal => 'منابع داده و مسائل حقوقی';

  @override
  String weatherProvidedBy(String service) {
    return 'داده‌های آب‌وهوا: $service';
  }

  @override
  String get weatherNow => 'اکنون';

  @override
  String get virtualEmpty => 'شیء پشتیبانی‌شده‌ای تشخیص داده نشد';

  @override
  String get virtualEmptyCameraOff => 'نمای مجازی به دوربین زنده نیاز دارد.';

  @override
  String get virtualLaneDisclaimer =>
      'خطوط خط‌کشی نمونه‌ای هستند و تشخیص داده نشده‌اند.';

  @override
  String virtualNearest(String zone) {
    return 'نزدیک‌ترین: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'صحنهٔ مجازی جاده: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'هوش مصنوعی $status';
  }

  @override
  String get virtualStatusLive => 'فعال';

  @override
  String get virtualStatusPaused => 'متوقف';

  @override
  String get virtualStatusCameraOff => 'دوربین خاموش';

  @override
  String get virtualStatusTestFootage => 'ویدیوی آزمایشی';

  @override
  String get virtualEmptyHint =>
      'خودروها، افراد، دوچرخه‌ها، چراغ‌ها و علائم ایست هنگام تشخیص در اینجا نمایان می‌شوند.';

  @override
  String get mapRecenter => 'بازگرداندن به مرکز';

  @override
  String get mapZoomIn => 'بزرگ‌نمایی';

  @override
  String get mapZoomOut => 'کوچک‌نمایی';

  @override
  String get mapUnsupported => 'نقشهٔ تعاملی در iPhone در دسترس است.';

  @override
  String get mapObjectsApprox => 'نشانگرهای اشیا موقعیت‌های تقریبی هستند.';

  @override
  String get mapWeatherUnavailable => 'آب‌وهوا در دسترس نیست';

  @override
  String get navErrorNoRoute => 'مسیری به این مقصد پیدا نشد.';

  @override
  String get navDismiss => 'بستن';

  @override
  String get navGo => 'برو';

  @override
  String get navFastest => 'سریع‌ترین';

  @override
  String get navThen => 'سپس';

  @override
  String get navRecents => 'اخیر';

  @override
  String get navClearRecents => 'پاک کردن';

  @override
  String get navSearchSubmitHint =>
      'برای دیدن همهٔ مکان‌های مطابق، جست‌وجو را بزنید';

  @override
  String get navPlaces => 'مکان‌ها';

  @override
  String get navEtaLabel => 'رسیدن';

  @override
  String get navTimeLeftLabel => 'مانده';

  @override
  String get navOverview => 'نمای کلی';

  @override
  String get navMute => 'بی‌صدا کردن راهنما';

  @override
  String get navUnmute => 'فعال کردن صدای راهنما';

  @override
  String get navEndConfirm => 'مسیریابی پایان یابد؟';

  @override
  String navEndConfirmBody(String place) {
    return 'راهنمایی به $place متوقف خواهد شد.';
  }

  @override
  String navArrivedAt(String place) {
    return 'به $place رسیدید';
  }

  @override
  String get navDone => 'تمام';

  @override
  String get navWeakGps => 'سیگنال GPS ضعیف';

  @override
  String get navLocationOff =>
      'مکان خاموش است. برای برنامه‌ریزی مسیر و مسیریابی آن را روشن کنید.';

  @override
  String get navVoiceGuidance => 'راهنمای صوتی';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance دیگر، $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first، سپس $second';
  }

  @override
  String get navSpeakRerouting => 'در حال مسیریابی مجدد';

  @override
  String get navSpeakArrived => 'به مقصد رسیدید';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count متر',
      one: 'یک متر',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value کیلومتر',
      one: 'یک کیلومتر',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فوت',
      one: 'یک فوت',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count یارد',
      one: 'یک یارد',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return '$distance مستقیم ادامه دهید';
  }

  @override
  String get navErrorNoDirections =>
      'راهنمای مسیر برای این سفر در این منطقه در دسترس نیست. مقصد دیگری امتحان کنید.';

  @override
  String navContinueFor(String distance) {
    return '$distance مستقیم ادامه دهید';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value مایل',
      one: 'یک مایل',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'نزدیک‌ترین: $object · $zone';
  }

  @override
  String get parkingNothing => 'چیزی در دید تشخیص داده نشد';

  @override
  String get parkingBeeps => 'بوق نزدیکی';

  @override
  String get parkingVolume => 'بلندی بوق';

  @override
  String get parkingLimitations =>
      'یک دوربین، نه 360°. اشیای خارج از دید دوربین تشخیص داده نمی‌شوند. جایگزین حسگر پارک نیست؛ برآوردها ممکن است اشتباه باشند و سکوت به معنی آزاد بودن محدوده نیست.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'نمای نزدیکی از بالا. $summary';
  }

  @override
  String get perceptionModeOriginal => 'اصلی';

  @override
  String get perceptionModeBoxes => 'کادرها';

  @override
  String get perceptionModeMasks => 'ماسک اشیا';

  @override
  String get perceptionModeRoad => 'سطح جاده';

  @override
  String get perceptionModeCombined => 'ترکیبی';

  @override
  String get perceptionOpacity => 'شفافیت ماسک';

  @override
  String get perceptionDisclaimer =>
      'ماسک سطح جاده یک لایهٔ بصری تقریبی است. فضای قابل رانندگی یا خطوط را نشان نمی‌دهد.';

  @override
  String get perceptionNeedsModel =>
      'برای دیدن ماسک‌ها، مدل قطعه‌بندی را انتخاب کنید.';

  @override
  String get perceptionChooseModel => 'انتخاب مدل';

  @override
  String get perceptionWaiting => 'در انتظار اولین فریم قطعه‌بندی…';

  @override
  String get perceptionShortCamera => 'دوربین';

  @override
  String get perceptionShortBoxes => 'کادرها';

  @override
  String get perceptionShortObjects => 'اشیا';

  @override
  String get perceptionShortRoad => 'جاده';

  @override
  String get perceptionShortAll => 'همه';

  @override
  String get perceptionModesLabel => 'لایه‌های ادراک';

  @override
  String get perceptionStatusWarmingUp => 'در حال آماده‌سازی…';

  @override
  String get perceptionStatusLoadingModel => 'در حال بارگذاری مدل…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'ماسک‌ها متوقف شد';

  @override
  String get perceptionLegend => 'راهنمای ماسک‌ها';

  @override
  String get perceptionUnavailable => 'ماسک‌ها در دسترس نیستند';

  @override
  String get driveSave => 'ذخیره';

  @override
  String get driveSaveIncident => 'ذخیرهٔ رویداد';

  @override
  String driveSaveHint(int seconds) {
    return '$seconds ثانیهٔ آخر ویدیوی دوربین خودرو را ذخیره می‌کند';
  }

  @override
  String get driveSaving => 'در حال ذخیرهٔ رویداد…';

  @override
  String hudRecManualLabel(String time) {
    return 'در حال ضبط، $time';
  }

  @override
  String get driveRecord => 'ضبط';

  @override
  String get driveRecordStartA11y => 'شروع ضبط';

  @override
  String driveRecordStopA11y(String time) {
    return 'توقف ضبط، $time ضبط شد';
  }

  @override
  String get driveRecordHint =>
      'تا زمانی که متوقف کنید پیوسته ضبط می‌کند، با ۵ ثانیهٔ پیش از آن';

  @override
  String get driveRecordFailed => 'شروع ضبط ممکن نشد';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ضبط ذخیره شد · $count بخش',
      one: 'ضبط ذخیره شد',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'ضبط متوقف شد: حافظه تقریباً پر است',
      'max_duration': 'ضبط متوقف شد: به حداکثر طول رسید',
      'camera_stopped': 'ضبط همراه با دوربین متوقف شد',
      'background': 'ضبط متوقف شد: برنامه به پس‌زمینه رفت',
      'thermal': 'ضبط متوقف شد: گوشی بیش از حد داغ است',
      'other': 'ضبط متوقف شد',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'رویداد ذخیره شد · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'مشاهده';

  @override
  String get driveSaveFailed => 'ذخیرهٔ رویداد ممکن نشد.';

  @override
  String get driveSaveNotRunning =>
      'ضبط هنوز شروع نشده است — منتظر شروع دوربین بمانید و دوباره تلاش کنید.';

  @override
  String get driveSaveTestFootage =>
      'ویدیوی آزمایشی ضبط نمی‌شود. ذخیرهٔ رویداد با دوربین زنده کار می‌کند.';

  @override
  String get driveSaveStorageFull =>
      'فضای ذخیره‌سازی iPhone شما پر است. فضا آزاد کنید یا کلیپ‌های قدیمی را حذف کنید.';

  @override
  String get driveSaveIoError => 'نوشتن کلیپ در فضای ذخیره‌سازی ممکن نشد.';

  @override
  String get driveClips => 'کلیپ‌ها';

  @override
  String get driveSettings => 'تنظیمات';

  @override
  String get driveViewSwitcher => 'نماهای رانندگی';

  @override
  String get driveLocationDenied =>
      'مکان خاموش است — سرعت، نقشه و مسیرها در دسترس نیستند.';

  @override
  String get driveCameraDenied =>
      'دسترسی دوربین خاموش است — تشخیص و ضبط در دسترس نیستند.';

  @override
  String get driveRecorderFallback =>
      'ضبط بدون صدا: دسترسی میکروفون خاموش است.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'تنظیمات ضبط تغییر کرد: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhone شما داغ است. هوش مصنوعی برای خنک شدن کندتر اجرا می‌شود — آن را از نور مستقیم خورشید دور و نزدیک دریچهٔ تهویه نگه دارید.';

  @override
  String get drivePowerThermalCritical =>
      'iPhone شما بیش‌ازحد داغ است. تشخیص هوش مصنوعی تا خنک شدن متوقف است؛ ضبط در صورت امکان ادامه می‌یابد.';

  @override
  String get drivePowerLowPower =>
      'حالت کم‌مصرف روشن است — هوش مصنوعی با نرخ کاهش‌یافته کار می‌کند.';

  @override
  String get drivePowerBatteryLow =>
      'باتری کم است — هنگام رانندگی iPhone را به برق وصل کنید.';

  @override
  String get onboardingTitle1 => 'از هر رانندگی بیشتر ببینید.';

  @override
  String get onboardingBody1 =>
      'iPhone خود را به یک دوربین خودروی هوشمند و همراه آگاهی رانندگی تبدیل کنید.';

  @override
  String get onboardingTitle2 => 'هوشمندی در هر فریم.';

  @override
  String get onboardingBody2 =>
      'خودروها، افراد، دوچرخه‌ها و علائم جاده‌ای پشتیبانی‌شده را مستقیماً روی iPhone خود تشخیص دهید.';

  @override
  String get onboardingTitle3 => 'یک جاده. چند دیدگاه.';

  @override
  String get onboardingBody3 =>
      'بین تشخیص زنده، نماهای رانندگی مجازی، نقشه‌های تعاملی و نمایش پارک جابه‌جا شوید.';

  @override
  String get onboardingTitle4 => 'لحظه‌های مهم را نگه دارید.';

  @override
  String get onboardingBody4 =>
      'ویدیوهای اخیر دوربین خودرو را ذخیره کنید، رویدادها را مرور کنید و ضبط‌ها را به اشتراک بگذارید.';

  @override
  String get onboardingTitle5 => 'ایمنی و حریم خصوصی';

  @override
  String get onboardingSafety1 =>
      'Corvista ابزاری برای افزایش آگاهی هنگام رانندگی است. چشمانتان را به جاده بدوزید.';

  @override
  String get onboardingSafety2 =>
      'خودروی شما را کنترل نمی‌کند و جای قضاوت شما را نمی‌گیرد.';

  @override
  String get onboardingSafety3 =>
      'تشخیص‌ها و برآوردها ممکن است نادرست باشند یا از قلم بیفتند.';

  @override
  String get onboardingSafety4 =>
      'پردازش دوربین روی iPhone شما انجام می‌شود — ویدیو آپلود نمی‌شود.';

  @override
  String get onboardingSafety5 =>
      'نقشه، جست‌وجو، مسیرها و آب‌وهوا به اتصال اینترنت نیاز دارند.';

  @override
  String get onboardingSafety6 =>
      'iPhone را محکم نصب کنید تا دید شما را مسدود نکند.';

  @override
  String get onboardingSafety7 => 'پیش از شروع رانندگی، تنظیمات را کامل کنید.';

  @override
  String get onboardingAcknowledge =>
      'می‌دانم Corvista ابزاری برای افزایش آگاهی است و مسئولیت رانندگی ایمن همچنان با من است.';

  @override
  String get onboardingReadSafety => 'خواندن اطلاعات کامل ایمنی';

  @override
  String get onboardingNext => 'بعدی';

  @override
  String get onboardingSkip => 'رد کردن';

  @override
  String get onboardingAgree => 'ادامه';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'صفحهٔ $current از $total';
  }

  @override
  String get permTitle => 'دسترسی‌ها';

  @override
  String get permIntro =>
      'Corvista فقط آنچه هر ویژگی نیاز دارد را درخواست می‌کند. هر زمان می‌توانید آن‌ها را در تنظیمات تغییر دهید.';

  @override
  String get permCameraTitle => 'دوربین';

  @override
  String get permCameraBody =>
      'برای تشخیص، ضبط دوربین خودرو و نمای پارک لازم است. ویدیو روی iPhone شما پردازش می‌شود.';

  @override
  String get permLocationTitle => 'مکان';

  @override
  String get permLocationBody =>
      'برای سرعت GPS، نقشه، مسیرها، آب‌وهوا و برچسب‌گذاری کلیپ‌های ذخیره‌شده. فقط هنگامی که از برنامه استفاده می‌کنید.';

  @override
  String get permMicTitle => 'میکروفون';

  @override
  String get permSpeechNote =>
      'تشخیص گفتار فقط در صورتی درخواست می‌شود که لغو با صدا را برای هشدارهای اضطراری روشن کنید.';

  @override
  String get permRequired => 'ضروری';

  @override
  String get permOptional => 'اختیاری';

  @override
  String get permAllow => 'اجازه';

  @override
  String get permGranted => 'مجاز';

  @override
  String get permDenied => 'ردشده';

  @override
  String get permLimited => 'محدود';

  @override
  String get permRestricted => 'محدودشده';

  @override
  String get permStart => 'شروع رانندگی';

  @override
  String get permCameraNeeded =>
      'می‌توانید بدون دسترسی به دوربین ادامه دهید، اما تشخیص و ضبط تا زمانی که در تنظیمات اجازه ندهید کار نمی‌کنند.';

  @override
  String get permSetupIntro =>
      'Corvista برای کارکرد کامل به این موارد نیاز دارد. «اجازه به همه» را بزنید تا iOS یکی‌یکی درخواست کند. هر زمان می‌توانید آن‌ها را در تنظیمات تغییر دهید.';

  @override
  String get permCameraLine =>
      'برای تشخیص، ضبط دوربین خودرو و نمای پارک لازم است. ویدیو روی iPhone شما پردازش می‌شود و هرگز آپلود نمی‌شود.';

  @override
  String get permLocationLine =>
      'سرعت GPS، نقشه، مسیرها، آب‌وهوا و محل ذخیرهٔ کلیپ‌ها. فقط هنگامی که از برنامه استفاده می‌کنید.';

  @override
  String get permMicLine =>
      'صدای داخل کابین در کلیپ‌های رویداد، و شنیدن عبارت لغو شما هنگام هشدار اضطراری.';

  @override
  String get permSpeechTitle => 'تشخیص گفتار';

  @override
  String get permSpeechLine =>
      'عبارت لغو شما را هنگام شمارش معکوس اضطراری، در صورت پشتیبانی روی iPhone شما، تشخیص می‌دهد.';

  @override
  String get permAllowAll => 'اجازه به همه';

  @override
  String permAsking(String permission) {
    return 'در حال درخواست $permission…';
  }

  @override
  String get permSomeDenied =>
      'برخی دسترسی‌ها خاموش‌اند. برای استفاده از آن ویژگی‌ها در تنظیمات روشنشان کنید.';

  @override
  String get permNotNow => 'حالا نه';

  @override
  String get tourLabel => 'راهنمای صفحهٔ رانندگی';

  @override
  String tourProgress(int current, int total) {
    return 'گام $current از $total';
  }

  @override
  String get tourNext => 'بعدی';

  @override
  String get tourBack => 'قبلی';

  @override
  String get tourSkip => 'رد کردن راهنما';

  @override
  String get tourFinish => 'شروع رانندگی';

  @override
  String get tourWelcomeTitle => 'راهنمای سریع شما';

  @override
  String get tourWelcomeBody =>
      'نگاهی یک‌دقیقه‌ای به آنچه در صفحهٔ رانندگی اهمیت دارد. بهتر است هنگام توقف انجام شود.';

  @override
  String get tourHudTitle => 'نوار ابزار شما';

  @override
  String get tourHudSpeed => 'سرعت از GPS می‌آید.';

  @override
  String get tourHudRec =>
      'REC نشان می‌دهد چند ثانیه ویدیو در بافر ذخیره شده است.';

  @override
  String get tourHudAi =>
      'نشان هوش مصنوعی مدل، تعداد اشیای دیده‌شده و یک نقطه را نشان می‌دهد: سبز در حال اجرا، نارنجی محدود، قرمز متوقف.';

  @override
  String get tourSaveTitle => 'ذخیرهٔ رویداد';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista یک بافر چرخشی از $seconds ثانیهٔ آخر ویدیو نگه می‌دارد. این بافر پیوسته بازنویسی می‌شود، پس تا «ذخیره» را نزنید چیزی نگه داشته نمی‌شود. کلیپ‌های ذخیره‌شده روی همین iPhone، در بخش کلیپ‌ها می‌مانند.';
  }

  @override
  String get tourRecordTitle => 'کل رانندگی را ضبط کنید';

  @override
  String get tourRecordBody =>
      '«ضبط» را بزنید تا تا زمان توقف، پیوسته فیلم‌برداری شود. رانندگی‌های طولانی در کلیپ‌ها به‌صورت بخش‌های ۵ دقیقه‌ای ذخیره می‌شوند و «ذخیرهٔ رویداد» هنگام ضبط هم کار می‌کند.';

  @override
  String get tourViewsTitle => 'پنج راه برای دیدن جاده';

  @override
  String get tourViewDetection => 'دوربین زنده با کادر دور اشیای پشتیبانی‌شده.';

  @override
  String get tourViewVirtual =>
      'صحنهٔ سه‌بعدی ساده‌شده که از تشخیص‌ها ساخته می‌شود.';

  @override
  String get tourViewMap => 'Apple Maps با جست‌وجو و راهنمای گام‌به‌گام.';

  @override
  String get tourViewParking => 'دوربین به‌علاوهٔ نمای نزدیکی از بالا.';

  @override
  String get tourViewPerception => 'ماسک جاده و اشیا.';

  @override
  String get tourMapTitle => 'جست‌وجو و مسیریابی گام‌به‌گام';

  @override
  String get tourMapBody =>
      'نقشه را باز کنید، روی نوار جست‌وجو بزنید و مقصدی انتخاب کنید. یک مسیر برگزینید و برای راهنمای گام‌به‌گام «شروع» را بزنید. به اتصال اینترنت نیاز دارد.';

  @override
  String get tourClipsTitle => 'کلیپ‌ها';

  @override
  String get tourClipsBody =>
      'رویدادهای ذخیره‌شده را مرور کنید، نامشان را تغییر دهید، به اشتراک بگذارید یا حذف کنید. کلیپ‌ها روی iPhone شما می‌مانند مگر اینکه به اشتراک بگذارید.';

  @override
  String get tourSettingsTitle => 'تنظیمات';

  @override
  String get tourSettingsBody =>
      'هشدارهای صوتی و حساسیت آن‌ها، کیفیت ضبط و طول بافر را تنظیم کنید و حالت اضطراری را راه بیندازید: هشدار آزمایشی برخورد با شمارش معکوس لغو.';

  @override
  String get tourSafetyTitle => 'پیش از رانندگی';

  @override
  String get tourSafety1 =>
      'iPhone را محکم و در جایی نصب کنید که دید شما را مسدود نکند.';

  @override
  String get tourSafety2 =>
      'هنگام رانندگی با برنامه کار نکنید. موارد را هنگام توقف تنظیم کنید.';

  @override
  String get tourSafety3 =>
      'تشخیص‌ها و محدوده‌ها برآورد هستند. ممکن است اشتباه باشند یا از قلم بیفتند.';

  @override
  String get tourSafety4 => 'مسئولیت رانندگی ایمن همچنان با شماست.';

  @override
  String get helpTakeTour => 'مشاهدهٔ راهنما';

  @override
  String get helpTakeTourSub =>
      'نگاهی راهنمایی‌شدهٔ یک‌دقیقه‌ای به صفحهٔ رانندگی.';

  @override
  String get tripsTitle => 'سفرها';

  @override
  String get tripsOpen => 'گزارش سفر';

  @override
  String get tripsEmptyTitle => 'هنوز سفری نیست';

  @override
  String get tripsEmptyBody =>
      'سفرها هنگام رانندگی با Corvista به‌طور خودکار ثبت می‌شوند — مسافت، زمان، سرعت و مسیری که رفتید.';

  @override
  String get tripsDisabledBody =>
      'گزارش سفر خاموش است، پس رانندگی‌های جدید ثبت نمی‌شوند. آن را روشن کنید تا گزارشی خصوصی از مسیرهایتان روی این iPhone نگه دارید.';

  @override
  String get tripsEnable => 'روشن کردن گزارش سفر';

  @override
  String get tripsToday => 'امروز';

  @override
  String get tripsYesterday => 'دیروز';

  @override
  String tripsRecordingNow(String distance) {
    return 'در حال ثبت سفر · $distance';
  }

  @override
  String tripsTimeRange(String start, String end) {
    return '$start – $end';
  }

  @override
  String tripsPlaceRange(String start, String end) {
    return '$start ← $end';
  }

  @override
  String tripsIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رویداد',
      one: '1 رویداد',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count هشدار',
      one: '1 هشدار',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سفر',
      one: '1 سفر',
      zero: 'بدون سفر',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'مسافت';

  @override
  String get tripsStatDuration => 'مدت';

  @override
  String get tripsStatMoving => 'زمان حرکت';

  @override
  String get tripsStatAvgSpeed => 'سرعت میانگین';

  @override
  String get tripsStatMaxSpeed => 'بیشینهٔ سرعت';

  @override
  String get tripsDetections => 'تشخیص‌ها';

  @override
  String get tripsNoDetections => 'هیچ شیء جاده‌ای در این سفر ثبت نشد.';

  @override
  String get tripsTimeline => 'خط زمان';

  @override
  String get tripsEventStart => 'سفر آغاز شد';

  @override
  String get tripsEventEnd => 'سفر پایان یافت';

  @override
  String get tripsEventAlert => 'هشدار صوتی';

  @override
  String get tripsEventIncident => 'کلیپ رویداد ذخیره شد';

  @override
  String get tripsEventEmergency => 'تصادف احتمالی تشخیص داده شد';

  @override
  String get tripsEventNavStart => 'مسیریابی آغاز شد';

  @override
  String get tripsEventArrive => 'رسیدن به مقصد';

  @override
  String get tripsEventReroute => 'مسیر دوباره محاسبه شد';

  @override
  String get tripsEventRecording => 'ضبط ذخیره شد';

  @override
  String get tripsOpenClip => 'باز کردن کلیپ';

  @override
  String get tripsTrackPreview => 'مسیر GPS';

  @override
  String get tripsRenameTitle => 'تغییر نام سفر';

  @override
  String get tripsRenameHint => 'نام سفر';

  @override
  String get tripsFavorite => 'افزودن به موارد علاقه';

  @override
  String get tripsUnfavorite => 'حذف از موارد علاقه';

  @override
  String get tripsShareGpx => 'اشتراک‌گذاری GPX';

  @override
  String get tripsShareFailed => 'اشتراک‌گذاری این سفر ممکن نشد.';

  @override
  String get tripsDelete => 'حذف سفر';

  @override
  String get tripsDeleteConfirmTitle => 'این سفر حذف شود؟';

  @override
  String get tripsDeleteConfirmBody =>
      'مسیر و آمار از این iPhone حذف می‌شوند. کلیپ‌های رویداد این سفر نگه داشته می‌شوند.';

  @override
  String get tripsDeleted => 'سفر حذف شد';

  @override
  String get tripsNotFound => 'این سفر دیگر در دسترس نیست.';

  @override
  String get tripsPrivacyNote =>
      'فقط روی این iPhone ذخیره می‌شود. چیزی آپلود نمی‌شود.';

  @override
  String get settingsSectionTrips => 'گزارش سفر';

  @override
  String get settingsTripLog => 'ثبت سفرها';

  @override
  String get settingsTripLogSubtitle =>
      'مسیر و آمار رانندگی شما را فقط روی این iPhone نگه می‌دارد.';

  @override
  String get settingsTripRetention => 'نگهداری سفرها به مدت';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days روز',
      one: '1 روز',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 سال';

  @override
  String get settingsRetentionForever => 'برای همیشه';

  @override
  String get settingsTripRetentionFooter =>
      'سفرهای قدیمی‌تر هنگام راه‌اندازی Corvista خودکار حذف می‌شوند.';

  @override
  String get settingsViewTrips => 'مشاهدهٔ سفرها';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours ساعت و $minutes دقیقه';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes دقیقه';
  }

  @override
  String tripsGpxName(String date) {
    return 'سفر Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'آزاد کردن فضا';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'فایل‌های موقت و حافظه‌های نهان را حذف می‌کند. کلیپ‌ها و سفرهای ذخیره‌شده نگه داشته می‌شوند.';

  @override
  String settingsFreedBytes(String size) {
    return '$size آزاد شد';
  }

  @override
  String get settingsNothingToFree =>
      'حافظه‌های نهان پاک شد — فایل موقتی برای حذف نیست.';

  @override
  String get settingsSectionPrivacyData => 'حریم خصوصی و داده‌ها';

  @override
  String get settingsPrivacyDataFooter =>
      'کلیپ‌ها، سفرها و تنظیمات فقط روی همین iPhone ذخیره می‌شوند و فقط زمانی از آن خارج می‌شوند که خودتان به اشتراک بگذارید.';

  @override
  String get settingsDeleteAllData => 'حذف همهٔ داده‌ها';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'پاک کردن کلیپ‌ها، سفرها، مخاطبان و تنظیمات از این iPhone';

  @override
  String get deleteAllTitle => 'همهٔ داده‌ها حذف شود؟';

  @override
  String get deleteAllMessage =>
      'این کار موارد زیر را برای همیشه از این iPhone حذف می‌کند:\n• کلیپ‌های رویداد و تصاویر بندانگشتی\n• گزارش سفرها و مسیرهای GPS\n• مخاطبان اضطراری و رویدادهای اضطراری\n• گزارش‌های تشخیص و گزارش عیب‌یابی\n• تنظیمات و مقصدهای اخیر\n• حافظهٔ موقت ضبط و کش\n\nاین کار قابل بازگشت نیست. سپس Corvista دوباره از صفحه‌های خوش‌آمدگویی شروع می‌شود.';

  @override
  String get deleteAllConfirm => 'حذف همه‌چیز';

  @override
  String get deleteAllInProgress => 'در حال حذف…';

  @override
  String get deleteAllDone => 'همهٔ داده‌ها حذف شد';

  @override
  String get deleteAllPartial =>
      'حذف برخی موارد انجام نشد. دوباره از تنظیمات امتحان کنید.';

  @override
  String get diagLogSection => 'گزارش عیب‌یابی';

  @override
  String get diagLogFooter =>
      'خطاها فقط روی همین iPhone و بدون مکان، نام مخاطبان یا شماره تلفن ثبت می‌شوند. چیزی ارسال نمی‌شود مگر اینکه خودتان گزارش را به اشتراک بگذارید.';

  @override
  String get diagLogShare => 'اشتراک‌گذاری گزارش عیب‌یابی';

  @override
  String get diagLogEmpty => 'خالی';

  @override
  String get diagLogClear => 'پاک کردن گزارش';

  @override
  String get diagLogClearTitle => 'گزارش عیب‌یابی پاک شود؟';

  @override
  String get diagLogClearBody =>
      'ورودی‌های خطای ذخیره‌شده از این iPhone حذف خواهند شد.';

  @override
  String get diagLogCleared => 'گزارش عیب‌یابی پاک شد';

  @override
  String get diagLogShareFailed => 'اشتراک‌گذاری گزارش عیب‌یابی انجام نشد.';

  @override
  String get privacyControls2 =>
      'تنظیمات › حریم خصوصی و داده‌ها › حذف همهٔ داده‌ها هر کلیپ، سفر، مخاطب، گزارش و تنظیمی را که Corvista روی این iPhone ذخیره کرده است پاک می‌کند.';

  @override
  String get parkingZoneStop => 'توقف';

  @override
  String get parkingZoneVeryClose => 'بسیار نزدیک';

  @override
  String get parkingZoneClose => 'نزدیک';

  @override
  String get parkingZoneNothingClose => 'چیز نزدیکی دیده نشد';

  @override
  String get parkingNotDetected =>
      'دیوار، ستون، تیر و لبهٔ پیاده‌رو شناسایی نمی‌شوند';

  @override
  String get parkingApprox => 'حدود';

  @override
  String get parkingSideLeft => 'چپ';

  @override
  String get parkingSideCenter => 'وسط';

  @override
  String get parkingSideRight => 'راست';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => 'فقط نمای دوربین جلو — سامانهٔ ۳۶۰ درجه نیست';

  @override
  String get parkingMuteBeeps => 'بی‌صدا کردن بوق‌ها';

  @override
  String get parkingUnmuteBeeps => 'روشن کردن بوق‌ها';

  @override
  String get parkingAbout => 'دربارهٔ نمای پارک';

  @override
  String get parkingLimitationsDetail =>
      'فقط ناحیهٔ جلوی دوربین پایش می‌شود. آشکارساز خودروها، اتوبوس‌ها و کامیون‌ها، افراد، دوچرخه‌ها و موتورسیکلت‌ها را تشخیص می‌دهد. دیوار، ستون، تیر، لبهٔ پیاده‌رو، موانع کوتاه و حائل‌ها شناسایی نمی‌شوند و کاپوت ممکن است زمین درست جلوی خودرو را بپوشاند. فاصله‌ها حدس‌هایی تقریبی از یک دوربین (بر پایهٔ اندازه و موقعیت جسم) هستند و ممکن است بسیار اشتباه باشند. سکوت یا «چیز نزدیکی دیده نشد» به معنی آزاد بودن مسیر نیست — همیشه اطراف را نگاه کنید و از آینه‌ها استفاده کنید.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'نزدیکی به تفکیک سمت: چپ $left، وسط $center، راست $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'خطاها در یک گزارش خصوصی روی این iPhone نوشته می‌شوند (بدون مکان، نام مخاطبان یا شماره تلفن). این گزارش هرگز خودکار ارسال نمی‌شود؛ می‌توانید آن را در تنظیمات › عیب‌یابی به اشتراک بگذارید یا پاک کنید.';
}
