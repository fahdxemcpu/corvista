// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'ہر سفر میں مزید دیکھیں۔';

  @override
  String get commonCancel => 'منسوخ کریں';

  @override
  String get commonDelete => 'حذف کریں';

  @override
  String get commonSave => 'محفوظ کریں';

  @override
  String get commonBack => 'واپس';

  @override
  String get commonClose => 'بند کریں';

  @override
  String get commonRetry => 'دوبارہ کوشش کریں';

  @override
  String get commonOpenSettings => 'ترتیبات کھولیں';

  @override
  String get commonLoading => 'لوڈ ہو رہا ہے…';

  @override
  String get commonError => 'کچھ غلط ہو گیا۔';

  @override
  String commonErrorDetail(String message) {
    return 'کچھ غلط ہو گیا: $message';
  }

  @override
  String get commonOn => 'آن';

  @override
  String get commonOff => 'آف';

  @override
  String get commonRename => 'نام تبدیل کریں';

  @override
  String get commonShare => 'شیئر کریں';

  @override
  String get commonNotAvailable => 'دستیاب نہیں';

  @override
  String get commonTestFootage => 'ٹیسٹ فوٹیج';

  @override
  String get zoneVeryClose => 'بہت قریب';

  @override
  String get zoneClose => 'قریب';

  @override
  String get zoneMedium => 'درمیانہ';

  @override
  String get zoneFar => 'دور';

  @override
  String get zoneUnknown => 'نامعلوم';

  @override
  String get classPerson => 'شخص';

  @override
  String get classBicycle => 'سائیکل';

  @override
  String get classMotorcycle => 'موٹر سائیکل';

  @override
  String get classCar => 'گاڑی';

  @override
  String get classBus => 'بس';

  @override
  String get classTrafficLight => 'ٹریفک سگنل';

  @override
  String get classStopSign => 'رکنے کا نشان';

  @override
  String get viewDetection => 'شناخت';

  @override
  String get viewVirtual => 'ورچوئل';

  @override
  String get viewMap => 'نقشہ';

  @override
  String get viewParking => 'پارکنگ';

  @override
  String get viewPerception => 'ادراک';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'سرخ';

  @override
  String get lightYellow => 'پیلا';

  @override
  String get lightGreen => 'سبز';

  @override
  String get lightUnknown => 'نامعلوم';

  @override
  String get clipsTitle => 'کلپس';

  @override
  String get clipsSelect => 'منتخب کریں';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count منتخب',
      one: '1 منتخب',
      zero: 'کلپس منتخب کریں',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'سب منتخب کریں';

  @override
  String get clipsDeselectAll => 'سب کا انتخاب ختم کریں';

  @override
  String get clipsDeleteSelected => 'منتخب شدہ حذف کریں';

  @override
  String get clipsGridView => 'گرڈ ویو';

  @override
  String get clipsListView => 'فہرست ویو';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلپس حذف کریں؟',
      one: 'یہ کلپ حذف کریں؟',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'یہ ویڈیوز آپ کے iPhone سے مستقل طور پر ہٹا دی جائیں گی۔ اسے واپس نہیں کیا جا سکتا۔',
      one: 'یہ ویڈیو آپ کے iPhone سے مستقل طور پر ہٹا دی جائے گی۔ اسے واپس نہیں کیا جا سکتا۔',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلپس حذف ہو گئے',
      one: 'کلپ حذف ہو گیا',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'ابھی کوئی کلپ نہیں';

  @override
  String get clipsEmptyBody =>
      'ڈرائیونگ کے دوران Corvista ایک مختصر رولنگ بفر رکھتا ہے۔ فوٹیج کے آخری چند سیکنڈ یہاں رکھنے کے لیے “واقعہ محفوظ کریں” پر ٹیپ کریں۔';

  @override
  String get clipsLoadError => 'آپ کے کلپس لوڈ نہیں ہو سکے۔';

  @override
  String get clipsStorageTitle => 'اسٹوریج';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'کلپس $clips · بفر $buffer · $free خالی';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count محفوظ کلپس',
      one: '1 محفوظ کلپ',
      zero: 'کوئی محفوظ کلپ نہیں',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'آپ کے iPhone کی اسٹوریج کم ہے۔ نئے واقعات محفوظ نہ ہو سکیں۔';

  @override
  String get clipsMissingFile => 'فائل موجود نہیں';

  @override
  String get clipsEmergencyBadge => 'ٹکر';

  @override
  String clipsUntitled(String date) {
    return 'واقعہ · $date';
  }

  @override
  String get clipsAudio => 'آواز ریکارڈ ہوئی';

  @override
  String get clipsFavorite => 'پسندیدہ';

  @override
  String get clipsUnfavorite => 'پسندیدہ سے ہٹائیں';

  @override
  String get clipsLocation => 'مقام محفوظ ہے';

  @override
  String clipsOpenClip(String title) {
    return 'کلپ $title کھولیں';
  }

  @override
  String get playerNotFoundTitle => 'کلپ نہیں ملا';

  @override
  String get playerNotFoundBody => 'ہو سکتا ہے یہ کلپ حذف ہو چکا ہو۔';

  @override
  String get playerMissingTitle => 'ویڈیو فائل موجود نہیں';

  @override
  String get playerMissingBody =>
      'اس کلپ کی ریکارڈنگ اب آپ کے iPhone پر موجود نہیں۔ آپ گیلری سے اندراج ہٹا سکتے ہیں۔';

  @override
  String get playerRemoveEntry => 'اندراج ہٹائیں';

  @override
  String get playerLoadError => 'یہ ویڈیو نہیں چل سکتی۔';

  @override
  String get playerPlay => 'چلائیں';

  @override
  String get playerPause => 'روکیں';

  @override
  String get playerReplay => 'دوبارہ چلائیں';

  @override
  String get playerRenameTitle => 'کلپ کا نام تبدیل کریں';

  @override
  String get playerRenameHint => 'کلپ کا نام';

  @override
  String get playerRenamed => 'کلپ کا نام تبدیل ہو گیا';

  @override
  String get playerFavorited => 'پسندیدہ میں شامل کیا گیا';

  @override
  String get playerUnfavorited => 'پسندیدہ سے ہٹا دیا گیا';

  @override
  String get playerShareFailed => 'یہ کلپ شیئر نہیں ہو سکا۔';

  @override
  String get playerDetails => 'تفصیلات';

  @override
  String get playerDate => 'ریکارڈ ہوا';

  @override
  String get playerDuration => 'دورانیہ';

  @override
  String get playerResolution => 'ریزولوشن';

  @override
  String get playerSize => 'فائل کا سائز';

  @override
  String get playerAudio => 'آواز';

  @override
  String get playerAudioYes => 'ریکارڈ ہوئی';

  @override
  String get playerAudioNo => 'ریکارڈ نہیں ہوئی';

  @override
  String get playerReason => 'محفوظ کرنے کی وجہ';

  @override
  String get playerReasonManual => 'واقعہ محفوظ کریں بٹن';

  @override
  String get playerReasonEmergency => 'ممکنہ ٹکر کی شناخت';

  @override
  String get playerReasonRecovered => 'رکاوٹ کے بعد بازیافت شدہ';

  @override
  String get playerSpeed => 'محفوظ کرتے وقت GPS رفتار';

  @override
  String get playerLocation => 'مقام';

  @override
  String get playerOpenInMaps => 'نقشے میں کھولیں';

  @override
  String get playerBack => 'واپس';

  @override
  String get playerMore => 'مزید کارروائیاں';

  @override
  String get clipsFilterLabel => 'دکھائیں';

  @override
  String get clipsFilterAll => 'سب';

  @override
  String get clipsFilterRecordings => 'ریکارڈنگز';

  @override
  String get clipsFilterIncidents => 'واقعات';

  @override
  String get clipsFilterEmergency => 'ہنگامی';

  @override
  String get clipsFilterFavorites => 'پسندیدہ';

  @override
  String get clipsSort => 'ترتیب';

  @override
  String get clipsSortNewest => 'نئے پہلے';

  @override
  String get clipsSortOldest => 'پرانے پہلے';

  @override
  String get clipsSortLongest => 'طویل ترین پہلے';

  @override
  String get clipsSortLargest => 'سب سے بڑے پہلے';

  @override
  String get clipsToday => 'آج';

  @override
  String get clipsYesterday => 'کل';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلپس',
      one: '1 کلپ',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'اس زمرے میں ابھی کوئی کلپ نہیں۔';

  @override
  String get clipsFavoritesEmpty =>
      'فوری رسائی کے لیے کسی کلپ پر ستارہ لگائیں، وہ یہاں رہے گا۔';

  @override
  String get clipsKindRecording => 'ریکارڈنگ';

  @override
  String get clipsKindIncident => 'واقعہ';

  @override
  String get clipsKindEmergency => 'ہنگامی';

  @override
  String get clipsKindTest => 'ٹیسٹ';

  @override
  String clipsTripChip(String time) {
    return 'سفر · $time';
  }

  @override
  String get clipsOpenTrip => 'وہ سفر کھولیں جس میں یہ کلپ ریکارڈ ہوا';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used استعمال شدہ · $free خالی';
  }

  @override
  String clipsStorageClips(String size) {
    return 'کلپس $size جگہ لیتے ہیں';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ریکارڈنگز',
      one: '1 ریکارڈنگ',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count واقعات',
      one: '1 واقعہ',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ہنگامی کلپس',
      one: '1 ہنگامی کلپ',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'جگہ خالی کریں';

  @override
  String get clipsStorageLowGentle =>
      '2 GB سے کم جگہ خالی ہے۔ ریکارڈنگ بہتر طور پر جاری رکھنے کے لیے جگہ خالی کریں یا وہ کلپس ہٹا دیں جن کی اب ضرورت نہیں۔';

  @override
  String get clipsSaveToPhotos => 'فوٹوز میں محفوظ کریں';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلپس',
      one: '1 کلپ',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلپس ($size) حذف کریں؟',
      one: 'یہ کلپ ($size) حذف کریں؟',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return '$total میں سے $done فوٹوز میں محفوظ ہو رہے ہیں…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلپس فوٹوز میں محفوظ ہو گئے',
      one: 'فوٹوز میں محفوظ ہو گیا',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved فوٹوز میں محفوظ ہوئے · $failed محفوظ نہیں ہو سکے';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista کو فوٹوز میں ویڈیوز شامل کرنے کی اجازت نہیں ہے۔ آپ ترتیبات میں اجازت دے سکتے ہیں۔';

  @override
  String get clipsPhotosFailed => 'فوٹوز میں محفوظ نہیں ہو سکا۔';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلپس پسندیدہ میں شامل ہو گئے',
      one: 'پسندیدہ میں شامل ہو گیا',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلپس پسندیدہ سے ہٹا دیے گئے',
      one: 'پسندیدہ سے ہٹا دیا گیا',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (تراشا ہوا)';
  }

  @override
  String get playerTrim => 'تراشیں';

  @override
  String get playerInfo => 'معلومات';

  @override
  String get playerKind => 'قسم';

  @override
  String get playerReasonRecording => 'ریکارڈ بٹن';

  @override
  String get trimTitle => 'کلپ تراشیں';

  @override
  String get trimHint =>
      'رکھنے والا حصہ چننے کے لیے ہینڈلز کو کھینچیں۔ اصل کلپ جوں کا توں رہتا ہے۔';

  @override
  String get trimStartHandle => 'تراش کی ابتدا';

  @override
  String get trimEndHandle => 'تراش کا اختتام';

  @override
  String trimSelection(String duration) {
    return '$duration منتخب';
  }

  @override
  String get trimSave => 'نئے کلپ کے طور پر محفوظ کریں';

  @override
  String get trimSaving => 'تراشا ہوا کلپ محفوظ ہو رہا ہے…';

  @override
  String get trimSaved => 'تراشا ہوا کلپ محفوظ ہو گیا';

  @override
  String get trimOpenNew => 'کھولیں';

  @override
  String get trimFailed => 'یہ کلپ تراشا نہیں جا سکا۔';

  @override
  String get trimStorageFull =>
      'تراشا ہوا کلپ محفوظ کرنے کے لیے کافی جگہ خالی نہیں ہے۔';

  @override
  String get trimPreview => 'منتخب حصہ چلائیں';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get settingsSectionCamera => 'کیمرا';

  @override
  String get settingsSectionAi => 'مصنوعی ذہانت';

  @override
  String get settingsSectionAlerts => 'الرٹس';

  @override
  String get settingsSectionAlertCategories => 'الرٹ کی اقسام';

  @override
  String get settingsSectionRecording => 'ریکارڈنگ';

  @override
  String get settingsSectionDriving => 'ڈرائیونگ';

  @override
  String get settingsSectionPower => 'پاور';

  @override
  String get settingsSectionEmergency => 'ہنگامی';

  @override
  String get settingsSectionAppearance => 'ظاہری شکل';

  @override
  String get settingsSectionLanguage => 'زبان';

  @override
  String get settingsSectionInformation => 'معلومات';

  @override
  String get settingsCameraLens => 'کیمرا لینس';

  @override
  String get settingsLensWide => 'وائیڈ';

  @override
  String get settingsLensUltraWide => 'الٹرا وائیڈ';

  @override
  String get settingsLensTelephoto => 'ٹیلی فوٹو';

  @override
  String get settingsLensUnavailable => 'اس iPhone پر دستیاب نہیں';

  @override
  String get settingsStabilization => 'استحکام';

  @override
  String get settingsStabAuto => 'خودکار';

  @override
  String get settingsStabOff => 'آف';

  @override
  String get settingsStabStandard => 'معیاری';

  @override
  String get settingsStabCinematic => 'سنیمائی';

  @override
  String get settingsOverlayOpacity => 'اوورلے کی شفافیت';

  @override
  String get settingsShowFps => 'کارکردگی کے اعدادوشمار دکھائیں';

  @override
  String get settingsShowFpsSubtitle =>
      'شناخت ویو پر فریم ریٹ اور انفرنس کا وقت';

  @override
  String get settingsCameraFooter =>
      'لینس اور استحکام کی تبدیلیاں کیمرا اگلی بار شروع ہونے پر لاگو ہوں گی۔';

  @override
  String get settingsAiModel => 'اے آئی ماڈل';

  @override
  String get settingsConfidence => 'شناخت کا اعتماد';

  @override
  String get settingsTracking => 'اشیاء کی ٹریکنگ';

  @override
  String get settingsTrackingSubtitle =>
      'فریمز کے درمیان اشیاء کو مستحکم رکھتی ہے';

  @override
  String get settingsShowLabels => 'لیبلز دکھائیں';

  @override
  String get settingsShowConfidence => 'اعتماد دکھائیں';

  @override
  String get settingsSegmentationOpacity => 'ادراک ماسک کی شفافیت';

  @override
  String get settingsAiFooter =>
      'کم اعتماد سے زیادہ اشیاء نظر آتی ہیں لیکن غلط شناختیں بھی بڑھ جاتی ہیں۔ شناخت غیر درست ہو سکتی ہے۔';

  @override
  String get settingsVoiceAlerts => 'صوتی الرٹس';

  @override
  String get settingsVoiceLanguage => 'آواز کی زبان';

  @override
  String get settingsVoiceLanguageAuto => 'ایپ کی زبان کے مطابق';

  @override
  String get settingsVoice => 'آواز';

  @override
  String get settingsVoiceDefault => 'سسٹم ڈیفالٹ';

  @override
  String get settingsVoiceQualityEnhanced => 'بہتر';

  @override
  String get settingsVoiceQualityPremium => 'اعلیٰ معیار';

  @override
  String get settingsNoVoices =>
      'اس زبان کے لیے کوئی آواز انسٹال نہیں ہے۔ iOS ترتیبات › ایکسیسبیلٹی › Spoken Content میں ایک آواز شامل کریں۔';

  @override
  String get settingsAlertPedestrian => 'پیدل چلنے والے';

  @override
  String get settingsAlertCyclist => 'سائیکل سوار';

  @override
  String get settingsAlertMotorcycle => 'موٹر سائیکلیں';

  @override
  String get settingsAlertBus => 'بسیں';

  @override
  String get settingsAlertVehicleClose => 'آگے بہت قریب گاڑی';

  @override
  String get settingsAlertTrafficLight => 'ٹریفک سگنل کی تبدیلی';

  @override
  String get settingsAlertTrafficMoving => 'آگے ٹریفک چل پڑی';

  @override
  String get settingsAlertStopSign => 'رکنے کے نشان';

  @override
  String get settingsSensitivity => 'حساسیت';

  @override
  String get settingsSensitivityLow => 'کم';

  @override
  String get settingsSensitivityMedium => 'درمیانی';

  @override
  String get settingsSensitivityHigh => 'زیادہ';

  @override
  String get settingsCooldown => 'دہرانے کا وقفہ';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds سیکنڈ';
  }

  @override
  String get settingsVolume => 'آواز کی بلندی';

  @override
  String get settingsQuietMode => 'خاموش موڈ';

  @override
  String get settingsQuietModeSubtitle => 'صرف اہم ترین الرٹس بولے جاتے ہیں';

  @override
  String get settingsTestVoice => 'آواز کی جانچ';

  @override
  String get settingsTestVoiceDone => 'نمونہ الرٹ چل رہا ہے…';

  @override
  String get settingsParkingBeeps => 'پارکنگ بیپس';

  @override
  String get settingsBeepVolume => 'بیپ کی بلندی';

  @override
  String get settingsAlertsFooter =>
      'الرٹس صرف ایک معاون ہیں۔ ہمیشہ سڑک پر نظر رکھیں — خاموشی کا مطلب یہ نہیں کہ راستہ صاف ہے۔';

  @override
  String get settingsRecordingProfile => 'ریکارڈنگ کا معیار';

  @override
  String get settingsProfileStandard => 'معیاری · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'واقعے کا بفر';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds سیکنڈ';
  }

  @override
  String get settingsManualMaxLength =>
      'دستی ریکارڈنگ کی زیادہ سے زیادہ لمبائی';

  @override
  String get settingsManualMaxUnlimited => 'لامحدود';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes منٹ';
  }

  @override
  String get settingsRecordAudio => 'آواز ریکارڈ کریں';

  @override
  String get settingsRecordAudioSubtitle =>
      'محفوظ کردہ واقعات میں گاڑی کے اندر کی آواز شامل کرتا ہے';

  @override
  String get settingsMicDenied =>
      'مائیکروفون تک رسائی بند ہے۔ آواز ریکارڈ کرنے کے لیے اسے ترتیبات میں اجازت دیں۔';

  @override
  String get settingsWatermark => 'Corvista واٹر مارک';

  @override
  String get settingsTimestamp => 'تاریخ اور وقت کی مہر';

  @override
  String get settingsSaveLocation => 'کلپس کے ساتھ مقام محفوظ کریں';

  @override
  String get settingsStorage => 'اسٹوریج اور کلپس';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلپس',
      one: '1 کلپ',
      zero: 'کوئی کلپ نہیں',
    );
    return '$_temp0 · $used استعمال شدہ · $free خالی';
  }

  @override
  String get settingsRecordingFooter =>
      'رولنگ بفر آپ کے iPhone پر رہتا ہے اور مسلسل اوور رائٹ ہوتا رہتا ہے۔ پس منظر میں کچھ ریکارڈ نہیں ہوتا۔';

  @override
  String get settingsDefaultView => 'ڈیفالٹ ویو';

  @override
  String get settingsUnits => 'اکائیاں';

  @override
  String get settingsShowCompass => 'قطب نما دکھائیں';

  @override
  String get settingsHudStyle => 'HUD کا انداز';

  @override
  String get settingsHudCustomize => 'HUD حسبِ ضرورت بنائیں';

  @override
  String get settingsDrivingSide => 'ڈرائیونگ کی سمت';

  @override
  String get settingsDrivingSideAuto => 'خودکار';

  @override
  String get settingsDrivingSideRight => 'دائیں';

  @override
  String get settingsDrivingSideLeft => 'بائیں';

  @override
  String get settingsVirtualStyle => 'ورچوئل ویو کا انداز';

  @override
  String get settingsVirtualMinimal => 'کم سے کم';

  @override
  String get settingsVirtualPerspective => 'پرسپیکٹو';

  @override
  String get settingsVirtualHighContrast => 'ہائی کنٹراسٹ';

  @override
  String get settingsKeepScreenOn => 'ڈرائیونگ کے دوران اسکرین آن رکھیں';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'لاک اسکرین اور Dynamic Island پر موڑ بہ موڑ رہنمائی دکھائیں';

  @override
  String get driveRecordingPausedBackground =>
      'Corvista کے پس منظر میں ہونے کے دوران ریکارڈنگ رک گئی';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'رکا ہوا';

  @override
  String get liveActivityDashcamOff => 'کیم بند';

  @override
  String get liveActivityEnded => 'نیویگیشن ختم';

  @override
  String get liveActivityEta => 'آمد';

  @override
  String get settingsAutoRecenter => 'نقشہ خودکار طور پر مرکز میں لائیں';

  @override
  String get settingsHudStyleClassic => 'کلاسک';

  @override
  String get settingsHudStyleGrid => 'گرڈ';

  @override
  String get settingsHudStyleMinimal => 'کم سے کم';

  @override
  String get settingsHudStylePerformance => 'کارکردگی';

  @override
  String get settingsHudStyleNavigation => 'نیویگیشن';

  @override
  String get settingsHudStyleNight => 'رات';

  @override
  String get settingsHudStyleHighContrast => 'ہائی کنٹراسٹ';

  @override
  String get settingsPowerMode => 'پاور موڈ';

  @override
  String get settingsPowerBalanced => 'متوازن';

  @override
  String get settingsPowerPerformance => 'کارکردگی';

  @override
  String get settingsPowerSaver => 'پاور سیور';

  @override
  String get settingsPowerFooter =>
      'جب آپ کا iPhone گرم ہو یا بیٹری کم ہو تو Corvista اے آئی کی شرح اور بصری اثرات خودکار طور پر کم کر دیتا ہے۔';

  @override
  String get settingsThermal => 'حرارتی حالت';

  @override
  String get settingsThermalNominal => 'معمول';

  @override
  String get settingsThermalFair => 'گرم';

  @override
  String get settingsThermalSerious => 'بہت گرم';

  @override
  String get settingsThermalCritical => 'نازک';

  @override
  String get settingsBattery => 'بیٹری';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · چارج ہو رہی ہے';
  }

  @override
  String get settingsLowPowerMode =>
      'لو پاور موڈ آن ہے — اے آئی کم شرح پر چل رہا ہے۔';

  @override
  String get settingsAiRate => 'اے آئی کی موجودہ شرح';

  @override
  String settingsHzValue(String value) {
    return '$value ہرٹز';
  }

  @override
  String get settingsEmergencySetup => 'ٹکر کی شناخت';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'آن · $seconds سیکنڈ کی الٹی گنتی';
  }

  @override
  String get settingsEmergencyFooter => 'تجرباتی۔ ہنگامی خدمات کا متبادل نہیں۔';

  @override
  String get settingsTheme => 'تھیم';

  @override
  String get settingsThemeSystem => 'سسٹم';

  @override
  String get settingsThemeDark => 'گہرا';

  @override
  String get settingsThemeLight => 'روشن';

  @override
  String get settingsReduceMotion => 'حرکت کم کریں';

  @override
  String get settingsReduceMotionSubtitle =>
      'پوری ایپ میں اینیمیشنز کم سے کم کرتا ہے';

  @override
  String get settingsAppLanguage => 'ایپ کی زبان';

  @override
  String get settingsPrivacyPolicy => 'رازداری کی پالیسی';

  @override
  String get settingsTerms => 'استعمال کی شرائط';

  @override
  String get settingsHelp => 'مدد';

  @override
  String get settingsSupport => 'سپورٹ سے رابطہ کریں';

  @override
  String get settingsLicenses => 'اوپن سورس لائسنس';

  @override
  String get settingsSupportUnavailable =>
      'Mail نہیں کھل سکی۔ support@corvista.app پر لکھیں۔';

  @override
  String get settingsSafety => 'حفاظتی معلومات';

  @override
  String get settingsDiagnostics => 'تشخیصی معلومات';

  @override
  String get settingsVersion => 'ورژن';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'HUD حسبِ ضرورت بنائیں';

  @override
  String get hudCustomPreview => 'پیش نظارہ · نمونہ اقدار';

  @override
  String get hudCustomStyle => 'انداز';

  @override
  String get hudCustomElements => 'عناصر';

  @override
  String get hudCustomSpeed => 'رفتار';

  @override
  String get hudCustomHeading => 'سمت اور قطب نما';

  @override
  String get hudCustomClock => 'گھڑی';

  @override
  String get hudCustomBattery => 'بیٹری اور درجہ حرارت';

  @override
  String get hudCustomDetections => 'اے آئی کی حالت اور شناختیں';

  @override
  String get hudCustomWeather => 'موسم';

  @override
  String get hudCustomAppearance => 'سائز اور شفافیت';

  @override
  String get hudCustomSize => 'سائز';

  @override
  String get hudCustomOpacity => 'شفافیت';

  @override
  String get hudCustomFooter =>
      'زیادہ گرمی جیسی وارننگز ہمیشہ دکھائی جاتی ہیں، چاہے عناصر چھپے ہوں۔';

  @override
  String get hudCustomDescClassic => 'متوازن انسٹرومنٹ کلسٹر';

  @override
  String get hudCustomDescGrid => 'سڑک پر پرسپیکٹو گرڈ';

  @override
  String get hudCustomDescMinimal => 'صرف رفتار، اور کچھ نہیں';

  @override
  String get hudCustomDescPerformance => 'لائیو ریڈ آؤٹس کے ساتھ رفتار کی کمان';

  @override
  String get hudCustomDescNavigation => 'اگلا موڑ سب سے پہلے';

  @override
  String get hudCustomDescNight => 'رات کی ڈرائیونگ کے لیے مدھم اور سرخی مائل';

  @override
  String get hudCustomDescHighContrast => 'تیز دھوپ میں زیادہ سے زیادہ وضاحت';

  @override
  String get languageTitle => 'زبان';

  @override
  String get languageSystem => 'سسٹم ڈیفالٹ';

  @override
  String get languageSystemSubtitle => 'آپ کے iPhone کی زبان کے مطابق';

  @override
  String get languageFooter =>
      'مزید زبانیں آ رہی ہیں۔ صوتی الرٹ کی زبان الرٹس کے تحت الگ سے سیٹ کی جا سکتی ہے۔';

  @override
  String get diagTitle => 'تشخیصی معلومات';

  @override
  String get diagPerformance => 'کارکردگی';

  @override
  String get diagInference => 'انفرنس کا وقت';

  @override
  String get diagDetectHz => 'شناخت کی شرح';

  @override
  String get diagCameraFps => 'کیمرا فریم ریٹ';

  @override
  String get diagMemory => 'میموری';

  @override
  String get diagDropped => 'چھوٹے ہوئے فریمز';

  @override
  String get diagSegmentation => 'سیگمنٹیشن کا وقت';

  @override
  String get diagCamera => 'کیمرا';

  @override
  String get diagStatus => 'حیثیت';

  @override
  String get diagSource => 'ماخذ';

  @override
  String get diagSourceCamera => 'لائیو کیمرا';

  @override
  String get diagSourceFile => 'ٹیسٹ فوٹیج فائل';

  @override
  String get diagResolution => 'بفر کا سائز';

  @override
  String get diagLens => 'لینس';

  @override
  String get diagError => 'آخری خرابی';

  @override
  String get diagModel => 'اے آئی ماڈل';

  @override
  String get diagModelLoad => 'ماڈل لوڈ ہونے کا وقت';

  @override
  String get diagPower => 'پاور';

  @override
  String get diagSegHz => 'سیگمنٹیشن کی شرح';

  @override
  String get diagReduced => 'کم کیے گئے اثرات';

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
  String get diagCamIdle => 'غیر فعال';

  @override
  String get diagCamStarting => 'شروع ہو رہا ہے';

  @override
  String get diagCamRunning => 'چل رہا ہے';

  @override
  String get diagCamInterrupted => 'رکاوٹ آئی';

  @override
  String get diagCamStopped => 'رک گیا';

  @override
  String get diagCamUnavailable => 'دستیاب نہیں';

  @override
  String get diagCamPermissionDenied => 'اجازت مسترد';

  @override
  String get diagCamError => 'خرابی';

  @override
  String get diagTestFootage => 'ٹیسٹ فوٹیج';

  @override
  String get diagTestFootageBody =>
      'کیمرے کے بجائے مقامی ویڈیو فائل پر ڈیوائس پر حقیقی شناخت چلائیں۔ ہر ویو اسے ٹیسٹ فوٹیج کا لیبل دیتا ہے۔';

  @override
  String get diagPathLabel => 'ویڈیو فائل کا راستہ';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Documents/test_drive.mp4 استعمال کریں';

  @override
  String get diagRun => 'ٹیسٹ فوٹیج چلائیں';

  @override
  String get diagRunStarted =>
      'ٹیسٹ فوٹیج شروع ہو گئی۔ اسے دیکھنے کے لیے ڈرائیو ویو کھولیں۔';

  @override
  String get diagBackToCamera => 'لائیو کیمرے پر واپس جائیں';

  @override
  String get diagDebugOnly => 'ٹیسٹ فوٹیج صرف ڈیولپمنٹ بلڈز میں دستیاب ہے۔';

  @override
  String get diagFileMissing => 'اس راستے پر کوئی فائل موجود نہیں۔';

  @override
  String get emergencySetupTitle => 'ٹکر کی شناخت';

  @override
  String get emergencyExperimental => 'تجرباتی';

  @override
  String get emergencyIntro =>
      'ڈرائیونگ کے دوران Corvista آپ کے iPhone کے موشن سینسرز کی مدد سے کسی ممکنہ شدید ٹکر پر نظر رکھ سکتا ہے۔ اگر ایسی ٹکر کا پتا چلے تو الٹی گنتی شروع ہوتی ہے۔ اگر آپ اسے منسوخ نہ کریں تو Corvista ہنگامی خدمات کو کال کرنے اور آپ کے رابطوں کو پیغام بھیجنے کی پیشکش کرتا ہے۔';

  @override
  String get emergencyDisclaimer1 =>
      'ہنگامی خدمات یا آپ کی گاڑی کے اپنے حادثے کی شناخت کے نظام کا متبادل نہیں۔';

  @override
  String get emergencyDisclaimer2 =>
      'کال کرنے یا پیغام بھیجنے سے پہلے iOS ہمیشہ آپ سے تصدیق مانگتا ہے۔';

  @override
  String get emergencyDisclaimer3 =>
      'ٹکر کی شناخت چھوٹ سکتی ہے، اور سخت بریک یا جھٹکوں کو غلطی سے ٹکر سمجھا جا سکتا ہے۔';

  @override
  String get emergencyParkedWarning =>
      'یہ سیٹ اپ گاڑی کھڑی ہونے پر مکمل کریں۔ گاڑی کے چلنے کے دوران ترتیبات مقفل رہتی ہیں۔';

  @override
  String get emergencyEnable => 'ٹکر کی شناخت فعال کریں';

  @override
  String get emergencyEnableSubtitle => 'صرف ڈرائیو سیشن کے دوران فعال';

  @override
  String get emergencyNeedNumber => 'پہلے ہنگامی نمبر شامل کریں۔';

  @override
  String get emergencyContacts => 'ہنگامی رابطے';

  @override
  String get emergencyAddContact => 'رابطہ شامل کریں';

  @override
  String get emergencyNoContacts =>
      'ابھی کوئی رابطہ نہیں۔ رابطوں کو پیغام آپ کی تصدیق کے بعد ہی بھیجا جاتا ہے۔';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '$name کو ہٹائیں؟';
  }

  @override
  String get emergencyRemoveContactBody =>
      'ٹکر کے بعد انہیں وصول کنندہ کے طور پر پیش نہیں کیا جائے گا۔';

  @override
  String get emergencyRemove => 'ہٹائیں';

  @override
  String get emergencyContactsError => 'رابطے لوڈ نہیں ہو سکے۔';

  @override
  String get emergencyNumber => 'ہنگامی نمبر';

  @override
  String get emergencyNumberHint => 'مثلاً 112 یا 911';

  @override
  String get emergencyMessage => 'پیغام کا سانچہ';

  @override
  String get emergencyMessageDefault =>
      'ممکن ہے میرا گاڑی کا حادثہ ہوا ہو۔ یہ پیغام Corvista نے تیار کیا ہے اور اس میں میرا آخری معلوم مقام شامل ہے، اگر دستیاب ہو۔';

  @override
  String get emergencyMessageHint =>
      'ڈیفالٹ پیغام استعمال کرنے کے لیے خالی چھوڑ دیں۔';

  @override
  String get emergencyCountdown => 'الٹی گنتی کا دورانیہ';

  @override
  String get emergencyVoiceCancel => 'آواز سے منسوخ کریں';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'الٹی گنتی کے دوران “میں ٹھیک ہوں” یا “منسوخ” کہیں۔ جہاں دستیاب ہو ڈیوائس پر اسپیچ ریکگنیشن استعمال ہوتی ہے۔';

  @override
  String get emergencyVoicePermDenied =>
      'آواز سے منسوخی کے لیے مائیکروفون اور اسپیچ ریکگنیشن تک رسائی درکار ہے۔';

  @override
  String get emergencyAutoSave => 'واقعے کا کلپ خودکار طور پر محفوظ کریں';

  @override
  String get emergencyTest => 'الٹی گنتی کی جانچ (کال کے بغیر)';

  @override
  String get emergencyTestBody =>
      'ایک فرضی ٹکر چلاتا ہے تاکہ آپ الٹی گنتی دیکھ سکیں۔ ٹیسٹ موڈ میں کوئی کال یا پیغام کبھی نہیں کیا جاتا۔';

  @override
  String get emergencyNotSet => 'سیٹ نہیں';

  @override
  String get emergencyAlertHeadline => 'ممکنہ شدید ٹکر کی شناخت ہوئی۔';

  @override
  String get emergencyAlertSubtitle => 'کیا آپ ٹھیک ہیں؟';

  @override
  String get emergencyAlertCancel => 'میں ٹھیک ہوں — منسوخ کریں';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds سیکنڈ باقی',
      one: '1 سیکنڈ باقی',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'سن رہا ہے — منسوخ کرنے کے لیے “میں ٹھیک ہوں” کہیں';

  @override
  String emergencyAlertHeard(String text) {
    return 'سنا گیا: “$text”';
  }

  @override
  String get emergencyAlertEscalated =>
      'کوئی جواب نہیں ملا۔ منتخب کریں کیا کرنا ہے:';

  @override
  String get emergencyAlertCall => 'ہنگامی خدمات کو کال کریں';

  @override
  String emergencyAlertCallNumber(String number) {
    return '$number پر کال کرتا ہے۔ iOS آپ سے تصدیق مانگے گا۔';
  }

  @override
  String get emergencyAlertMessage => 'رابطوں کو پیغام بھیجیں';

  @override
  String get emergencyAlertMessageSubtitle =>
      'تیار شدہ پیغام کھولتا ہے۔ بھیجنا ہے یا نہیں، یہ آپ طے کرتے ہیں۔';

  @override
  String get emergencyAlertTestMode => 'ٹیسٹ موڈ — کوئی کال نہیں کی جائے گی';

  @override
  String get emergencyAlertTestBadge => 'ٹیسٹ';

  @override
  String get emergencyAlertClose => 'میں ٹھیک ہوں — بند کریں';

  @override
  String get emergencyMsgSent => 'پیغام بھیج دیا گیا۔';

  @override
  String get emergencyMsgCancelled => 'پیغام نہیں بھیجا گیا۔';

  @override
  String get emergencyMsgFailed => 'پیغام نہیں بھیجا جا سکا۔';

  @override
  String get emergencyMsgUnavailable => 'اس ڈیوائس پر پیغام رسانی دستیاب نہیں۔';

  @override
  String emergencyCallFailed(String number) {
    return 'کال شروع نہیں ہو سکی۔ $number پر خود کال کریں۔';
  }

  @override
  String get modelsTitle => 'اے آئی ماڈلز';

  @override
  String get modelsIntro =>
      'تمام ماڈلز ایپ کے ساتھ شامل ہیں اور مکمل طور پر آپ کے iPhone پر چلتے ہیں۔ آپ کا کیمرا فیڈ کبھی ڈیوائس سے باہر نہیں جاتا۔';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'لائیو: $ms ms فی فریم · $hz شناختیں فی سیکنڈ';
  }

  @override
  String modelsLastLoad(String ms) {
    return '$ms ms میں لوڈ ہوا';
  }

  @override
  String get modelsEfficientName => 'کم خرچ';

  @override
  String get modelsEfficientDesc =>
      'تیز اور مختصر ڈیٹیکٹر، کم حرارت اور کم بیٹری استعمال کے ساتھ طویل ڈرائیوز کے لیے موزوں۔';

  @override
  String get modelsEnhancedName => 'بہتر';

  @override
  String get modelsEnhancedDesc =>
      'بڑا ڈیٹیکٹر جو چھوٹی اور زیادہ دور کی اشیاء تلاش کرتا ہے، زیادہ پاور خرچ کے ساتھ۔';

  @override
  String get modelsSegmentationName => 'سیگمنٹیشن';

  @override
  String get modelsSegmentationDesc =>
      'ادراک ویو کے لیے تیز شناخت کو سڑک کی سطح اور اشیاء کے ماسکس کے ساتھ ملاتا ہے۔';

  @override
  String get modelsNoneName => 'اے آئی رکا ہوا';

  @override
  String get modelsNoneDesc =>
      'اشیاء کی شناخت کے بغیر کیمرا اور ریکارڈنگ چلتی رہتی ہیں۔ سب سے کم پاور استعمال۔';

  @override
  String get modelsGenericDesc => 'ڈیوائس پر اشیاء کی شناخت کا ماڈل۔';

  @override
  String get modelsFunctionDetection =>
      'گاڑیاں، لوگ، سائیکلیں، موٹر سائیکلیں، بسیں، ٹریفک سگنل اور رکنے کے نشان پہچانتا ہے';

  @override
  String get modelsFunctionSegmentation =>
      'سڑک کی سطح اور اشیاء کے ماسکس شامل کرتا ہے';

  @override
  String get modelsFunctionNone => 'کوئی شناخت نہیں؛ صرف ڈیش کیم ریکارڈنگ';

  @override
  String get modelsSize => 'سائز';

  @override
  String get modelsInput => 'ان پٹ';

  @override
  String modelsInputValue(String size) {
    return '$size × $size پکسل';
  }

  @override
  String get modelsViews => 'کے ساتھ کام کرتا ہے';

  @override
  String get modelsStatusInstalled => 'انسٹال شدہ (شامل)';

  @override
  String get modelsStatusNotInstalled => 'انسٹال نہیں';

  @override
  String get modelsSelected => 'منتخب';

  @override
  String get modelsUse => 'یہ ماڈل استعمال کریں';

  @override
  String get modelsSwitching => 'ماڈل لوڈ ہو رہا ہے…';

  @override
  String modelsSwitched(String name) {
    return '$name اب فعال ہے';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'اس ڈیوائس پر ناپا گیا: اوسط $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'اس ڈیوائس پر نہیں ناپا گیا';

  @override
  String get modelsBenchmarkRun => 'بینچ مارک چلائیں';

  @override
  String get modelsBenchmarkRunning => 'بینچ مارک جاری ہے…';

  @override
  String get modelsBenchmarkSelectHint =>
      'بینچ مارک کے لیے یہ ماڈل منتخب کریں۔';

  @override
  String get modelsBenchmarkDone => 'بینچ مارک مکمل';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'بینچ مارک ناکام: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'آخری اپ ڈیٹ $date';
  }

  @override
  String get safetyTitle => 'حفاظتی معلومات';

  @override
  String get safetyIntro =>
      'Corvista ڈرائیونگ کے دوران آگاہی بڑھانے کا ایک معاون ہے۔ یہ آپ کی گاڑی کو کنٹرول نہیں کرتا اور آپ کی اپنی توجہ، فیصلے یا گاڑی کے حفاظتی نظاموں کی جگہ نہیں لے سکتا۔';

  @override
  String get safetyBeforeTitle => 'ڈرائیو سے پہلے';

  @override
  String get safetyBefore1 =>
      'اپنا iPhone محفوظ طریقے سے اور قانونی جگہ پر لگائیں جو آپ کی نظر، ایئر بیگز یا کنٹرولز کو نہ روکے۔';

  @override
  String get safetyBefore2 =>
      'سیٹ اپ مکمل کریں، ویو منتخب کریں اور منزل گاڑی کھڑی ہونے پر طے کریں۔';

  @override
  String get safetyBefore3 =>
      'طویل ڈرائیو کے لیے چارجر لگائیں اور جہاں ممکن ہو فون کو براہ راست دھوپ سے دور رکھیں۔';

  @override
  String get safetyWhileTitle => 'ڈرائیونگ کے دوران';

  @override
  String get safetyWhile1 =>
      'نظر سڑک پر رکھیں۔ اسکرین کے بڑے کنٹرولز صرف تب استعمال کریں جب ایسا کرنا محفوظ اور قانونی ہو۔';

  @override
  String get safetyWhile2 =>
      'الرٹس معاون ہیں، ایسی وارننگز نہیں جن پر بھروسا کیا جا سکے۔ خاموشی کا مطلب کبھی یہ نہیں کہ سڑک صاف ہے۔';

  @override
  String get safetyWhile3 =>
      'اختلاف کی صورت میں ایپ کی نہیں، ٹریفک قوانین، سگنلز اور سڑک کے نشانات کی پیروی کریں۔';

  @override
  String get safetyLimitsTitle => 'حدود';

  @override
  String get safetyLimits1 =>
      'فون کا ایک کیمرا صرف وہی دیکھتا ہے جو اس کے سامنے ہو۔ نظر سے باہر، چھپی ہوئی یا بہت قریب کی اشیاء کی شناخت نہیں ہوتی۔';

  @override
  String get safetyLimits2 =>
      'شناخت چھوٹ سکتی ہے، دیر سے ہو سکتی ہے یا غلط ہو سکتی ہے، خاص طور پر رات، بارش، دھند، چکاچوند یا گندے ونڈ اسکرین کی صورت میں۔';

  @override
  String get safetyLimits3 =>
      'صرف معاون اقسام پہچانی جاتی ہیں: گاڑیاں، بسیں، موٹر سائیکلیں، سائیکلیں، لوگ، ٹریفک سگنل اور رکنے کے نشان۔ ورچوئل ویو میں لین کے اشارے علامتی ہیں، پہچانی گئی لینیں نہیں۔';

  @override
  String get safetyLimits4 =>
      'قربت تقریبی زونز (بہت قریب، قریب، درمیانہ، دور) کے طور پر دکھائی جاتی ہے، ناپے گئے فاصلوں کے طور پر نہیں۔ پارکنگ ویو پارکنگ سینسر کا متبادل نہیں ہے۔';

  @override
  String get safetyHeatTitle => 'حرارت اور بیٹری';

  @override
  String get safetyHeat1 =>
      'کیمرے اور اے آئی کا مسلسل استعمال آپ کے iPhone کو گرم کرتا ہے۔ ڈیوائس گرم ہونے پر Corvista تجزیے کی شرح کم کر دیتا ہے اور وارننگ دکھاتا ہے؛ اگر iOS حد سے زیادہ گرم ہو جائے تو کیمرا رک سکتا ہے۔';

  @override
  String get safetyEmergencyTitle => 'ہنگامی خصوصیت';

  @override
  String get safetyEmergency1 =>
      'ممکنہ ٹکر کی شناخت تجرباتی ہے۔ یہ حقیقی حادثات کو چھوڑ سکتی ہے اور دیگر واقعات سے بھی فعال ہو سکتی ہے۔';

  @override
  String get safetyEmergency2 =>
      'یہ کبھی خاموشی سے کسی سے رابطہ نہیں کرتی: iOS کال یا پیغام کے لیے ہمیشہ آپ سے تصدیق مانگتا ہے۔ یہ خود ہنگامی خدمات کو کال کرنے کا متبادل نہیں ہے۔';

  @override
  String get privacyTitle => 'رازداری';

  @override
  String get privacyIntro =>
      'Corvista اس طرح بنایا گیا ہے کہ آپ کا ڈرائیونگ ڈیٹا آپ کے iPhone پر رہے۔ کوئی Corvista اکاؤنٹ نہیں ہے، اور Corvista اپنے سرورز نہیں چلاتا۔';

  @override
  String get privacyCameraTitle => 'کیمرا اور اے آئی';

  @override
  String get privacyCamera1 =>
      'اشیاء کی شناخت، ٹریکنگ اور سیگمنٹیشن مکمل طور پر آپ کے iPhone پر چلتی ہیں۔ کیمرے کے فریمز کبھی اپ لوڈ نہیں ہوتے۔';

  @override
  String get privacyCamera2 =>
      'کیمرا صرف تب چلتا ہے جب Corvista اسکرین پر کھلا ہو۔ ایپ کے پس منظر میں جانے پر یہ رک جاتا ہے — پس منظر میں کوئی خفیہ ریکارڈنگ نہیں ہوتی۔';

  @override
  String get privacyRecordingsTitle => 'ریکارڈنگز';

  @override
  String get privacyRecordings1 =>
      'رولنگ بفر عارضی ہے اور مسلسل اوور رائٹ ہوتا ہے۔ فوٹیج صرف تب رکھی جاتی ہے جب آپ “واقعہ محفوظ کریں” پر ٹیپ کریں یا، اگر آپ نے فعال کیا ہو، ممکنہ ٹکر کے بعد۔';

  @override
  String get privacyRecordings2 =>
      'محفوظ کلپس آپ کے iPhone پر Corvista کی نجی اسٹوریج میں رہتے ہیں۔ وہ صرف تب ڈیوائس سے باہر جاتے ہیں جب آپ شیئر کریں۔ ایپ حذف کرنے سے وہ حذف ہو جاتے ہیں۔';

  @override
  String get privacyRecordings3 =>
      'آواز صرف تب ریکارڈ ہوتی ہے جب آپ اسے آن کریں اور مائیکروفون تک رسائی دیں۔';

  @override
  String get privacyLocationTitle => 'مقام';

  @override
  String get privacyLocation1 =>
      'ایپ کھلی ہونے کے دوران مقام آپ کی رفتار، نقشے، راستوں اور موسم کے لیے استعمال ہوتا ہے۔ اگر “مقام محفوظ کریں” آن ہو تو محفوظ کرنے کے وقت کا مقام کلپ کے ساتھ آپ کی ڈیوائس پر رکھا جاتا ہے۔';

  @override
  String get privacyNetworkTitle => 'نیٹ ورک سروسز';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — نقشہ دکھانا، مقامات کی تلاش اور راستے۔ آپ کا تلاش کا متن اور تقریبی مقام Apple کو بھیجا جاتا ہے۔';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — آپ کے مقام کا موجودہ اور ہر گھنٹے کا موسم۔';

  @override
  String get privacyNetwork4 =>
      'Corvista میں کوئی اشتہار اور کوئی تھرڈ پارٹی اینالیٹکس یا ٹریکنگ شامل نہیں۔';

  @override
  String get privacyEmergencyTitle => 'ہنگامی رابطے';

  @override
  String get privacyEmergency1 =>
      'آپ کے منتخب کردہ رابطے اسی ڈیوائس پر iOS Keychain میں محفوظ ہوتے ہیں۔ آواز سے منسوخی جہاں دستیاب ہو ڈیوائس پر اسپیچ ریکگنیشن استعمال کرتی ہے۔ کالز اور پیغامات صرف آپ کے iOS میں تصدیق کرنے کے بعد بھیجے جاتے ہیں۔';

  @override
  String get privacyControlsTitle => 'آپ کے اختیارات';

  @override
  String get privacyControls1 =>
      'آپ کلپس میں کسی بھی وقت کلپس حذف کر سکتے ہیں، اور iOS ترتیبات میں کیمرا، مائیکروفون، مقام اور اسپیچ تک رسائی تبدیل یا منسوخ کر سکتے ہیں۔';

  @override
  String get termsTitle => 'استعمال کی شرائط';

  @override
  String get termsIntro =>
      'Corvista استعمال کر کے آپ ان شرائط سے اتفاق کرتے ہیں۔ Apple کا معیاری Licensed Application End User License Agreement بھی لاگو ہوتا ہے۔';

  @override
  String get termsUseTitle => 'Corvista کا استعمال';

  @override
  String get termsUse1 =>
      'Corvista ڈرائیونگ کی آگاہی اور ڈیش کیم کا معاون ہے۔ ہر وقت محفوظ اور قانونی طور پر ڈرائیو کرنے کی مکمل ذمہ داری آپ پر ہے۔';

  @override
  String get termsUse2 =>
      'ڈرائیونگ کے دوران ایپ کو ایسے انداز میں استعمال نہ کریں جو آپ کی توجہ بٹائے۔ ڈیوائس کو محفوظ اور قانونی طریقے سے لگائیں۔';

  @override
  String get termsAccuracyTitle => 'درستی کی کوئی ضمانت نہیں';

  @override
  String get termsAccuracy1 =>
      'شناختیں، زونز، الرٹس، نقشے کے مارکرز، راستے اور موسم نامکمل، تاخیر سے یا غلط ہو سکتے ہیں۔ Corvista آپ کی گاڑی کو کنٹرول نہیں کرتا۔';

  @override
  String get termsAccuracy2 =>
      'ہنگامی خصوصیت تجرباتی ہے اور ہو سکتا ہے ٹکر کی شناخت نہ کرے یا غلطی سے فعال ہو جائے۔';

  @override
  String get termsRecordingTitle => 'ریکارڈنگ کے قوانین';

  @override
  String get termsRecording1 =>
      'ڈیش کیم، آواز کی ریکارڈنگ اور لوگوں کی فلم بندی سے متعلق قوانین ملک اور خطے کے لحاظ سے مختلف ہوتے ہیں۔ ان پر عمل کرنے کی ذمہ داری آپ کی ہے، بشمول کلپس شیئر کرتے وقت۔';

  @override
  String get termsLiabilityTitle => 'ذمہ داری';

  @override
  String get termsLiability1 =>
      'ایپ “جیسی ہے” کی بنیاد پر فراہم کی جاتی ہے۔ قانون کی اجازت کی حد تک، ڈیولپر اس کے استعمال یا اس کے نتائج پر انحصار سے پیدا ہونے والے حادثات، نقصانات، جرمانوں یا ہرجانے کا ذمہ دار نہیں۔';

  @override
  String get termsChangesTitle => 'تبدیلیاں';

  @override
  String get termsChanges1 =>
      'یہ شرائط ایپ کے نئے ورژنز کے ساتھ اپ ڈیٹ ہو سکتی ہیں۔ اپ ڈیٹ کے بعد استعمال جاری رکھنے کا مطلب ہے کہ آپ نظر ثانی شدہ شرائط قبول کرتے ہیں۔';

  @override
  String get helpTitle => 'مدد';

  @override
  String get helpIntro =>
      'عام سوالات کے جوابات۔ حفاظتی رہنمائی کے لیے حفاظتی معلومات دیکھیں۔';

  @override
  String get helpQSave => 'میں کسی واقعے کی فوٹیج کیسے محفوظ رکھوں؟';

  @override
  String get helpASaveBuffer =>
      'ڈرائیو ویو میں بڑے «واقعہ محفوظ کریں» بٹن پر ٹیپ کریں۔ Corvista اپنے مسلسل بفر کے آخری 20 یا 30 سیکنڈ کلپس میں محفوظ کر دیتا ہے (آپ کا انتخاب ترتیبات › ریکارڈنگ میں)۔';

  @override
  String get helpQWhere => 'میرے کلپس کہاں محفوظ ہوتے ہیں؟';

  @override
  String get helpAWhere =>
      'آپ کے iPhone پر Corvista کی نجی اسٹوریج میں۔ وہ کبھی اپ لوڈ نہیں ہوتے۔ کلپ بھیجنے یا ایکسپورٹ کرنے کے لیے پلیئر میں شیئر استعمال کریں۔';

  @override
  String get helpQZones => 'قربت کے زونز کتنے درست ہیں؟';

  @override
  String get helpAZones =>
      'زونز ایک کیمرے سے اشیاء کے عام سائز کی بنیاد پر موٹے اندازے ہیں۔ انہیں تقریبی اشارے سمجھیں، کبھی فاصلہ نہیں۔';

  @override
  String get helpQSlow => 'شناخت سست کیوں ہو جاتی ہے؟';

  @override
  String get helpASlow =>
      'جب آپ کا iPhone گرم ہو، بیٹری کم ہو یا لو پاور موڈ آن ہو تو Corvista ڈیوائس کی حفاظت کے لیے تجزیے کی شرح کم کر دیتا ہے۔ آپ ترتیبات میں پاور موڈ تبدیل کر سکتے ہیں۔';

  @override
  String get helpQMap => 'نقشہ، تلاش یا موسم کام نہیں کر رہا۔';

  @override
  String get helpAMap =>
      'ان خصوصیات کے لیے انٹرنیٹ کنکشن اور مقام تک رسائی درکار ہے۔ اپنا کنکشن چیک کریں اور iOS ترتیبات میں Corvista کے لیے مقام کی اجازت دیں۔';

  @override
  String get helpQSimulator => 'کیمرا دستیاب نہیں دکھا رہا۔';

  @override
  String get helpASimulator =>
      'یقینی بنائیں کہ iOS ترتیبات میں کیمرے تک رسائی کی اجازت ہے اور کوئی دوسری ایپ کیمرا استعمال نہیں کر رہی۔ iOS Simulator میں کیمرا نہیں ہوتا؛ اس کی جگہ مقامی ٹیسٹ ویڈیو استعمال کی جا سکتی ہے۔';

  @override
  String get emergencyMsgNoContacts => 'پہلے ایک ہنگامی رابطہ شامل کریں۔';

  @override
  String get cameraStarting => 'کیمرا شروع ہو رہا ہے…';

  @override
  String get cameraInterrupted => 'کیمرا رک گیا';

  @override
  String get cameraInterruptedBody =>
      'iOS نے کیمرا روک دیا ہے، مثلاً کال کے دوران یا جب کوئی دوسری ایپ اسے استعمال کر رہی ہو۔ یہ خود بخود دوبارہ شروع ہو جائے گا۔';

  @override
  String get cameraUnavailable => 'کیمرا دستیاب نہیں';

  @override
  String get cameraUnavailableBody =>
      'اس ڈیوائس پر کوئی کیمرا دستیاب نہیں۔ شناخت، ریکارڈنگ اور پارکنگ ویوز کے لیے پچھلا کیمرا درکار ہے۔';

  @override
  String get cameraRunTestFootage => 'ٹیسٹ فوٹیج چلائیں';

  @override
  String get cameraPermissionDenied => 'کیمرے تک رسائی بند ہے';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista کو شناخت، ڈیش کیم ریکارڈنگ اور پارکنگ ویوز کے لیے کیمرا درکار ہے۔ ترتیبات میں کیمرا رسائی آن کریں۔';

  @override
  String get cameraError => 'کیمرے کی خرابی';

  @override
  String get cameraStopped => 'کیمرا رک گیا';

  @override
  String get cameraStart => 'کیمرا شروع کریں';

  @override
  String get cameraFocusHint => 'فوکس کے لیے ٹیپ کریں';

  @override
  String get cameraPreviewLabel => 'شناخت شدہ اشیاء کے ساتھ لائیو کیمرا ویو';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'کیمرا $fps fps · اے آئی $hz Hz · $ms ms · چھوٹے فریمز $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'رفتار $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'GPS رفتار دستیاب نہیں';

  @override
  String hudHeading(String direction, String degrees) {
    return 'سمت $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds سیکنڈ';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'ڈیش کیم بفر ریکارڈنگ، $target میں سے $seconds سیکنڈ بفر ہو چکے';
  }

  @override
  String get hudRecIdle => 'REC بند';

  @override
  String get hudRecSaving => 'محفوظ ہو رہا ہے…';

  @override
  String get hudRecError => 'REC میں خرابی';

  @override
  String get hudAiPaused => 'اے آئی رکا ہوا';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count اشیاء',
      one: '1 شے',
      zero: 'کوئی شے نہیں',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count اشیاء ملیں',
      one: '1 شے ملی',
      zero: 'کوئی شے نہیں ملی',
    );
    return 'اے آئی ماڈل $model، $_temp0';
  }

  @override
  String get hudThermalSerious => 'گرم — اے آئی سست';

  @override
  String get hudThermalCritical => 'بہت زیادہ گرم — اے آئی رکا ہوا';

  @override
  String hudBatteryLow(String percent) {
    return 'بیٹری $percent';
  }

  @override
  String get hudLowPower => 'لو پاور موڈ';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'موسم $temperature، $condition۔ تفصیلات کے لیے ٹیپ کریں۔';
  }

  @override
  String get hudNoGuidance =>
      'یہاں موڑ بہ موڑ رہنمائی دیکھنے کے لیے نقشہ ویو میں منزل تلاش کریں۔';

  @override
  String get navArrived => 'آپ پہنچ گئے ہیں';

  @override
  String get navRerouting => 'راستہ دوبارہ بنایا جا رہا ہے…';

  @override
  String get navSearchHint => 'منزل تلاش کریں';

  @override
  String get navSearchFieldHint => 'پتا، جگہ یا کاروبار';

  @override
  String get navNoResults => 'کوئی مماثل مقام نہیں';

  @override
  String get navSearching => 'تلاش جاری ہے…';

  @override
  String get navSearchStartTyping =>
      'پتا یا جگہ کا نام لکھیں۔ نتائج Apple Maps سے آتے ہیں اور انٹرنیٹ کنکشن درکار ہے۔';

  @override
  String get navErrorUnavailable =>
      'تلاش اور راستے دستیاب نہیں — اپنا انٹرنیٹ کنکشن چیک کریں۔';

  @override
  String get navErrorNoLocation =>
      'راستہ بنانے کے لیے آپ کے مقام کا انتظار ہے۔';

  @override
  String get navErrorPermission =>
      'مقام تک رسائی بند ہے، اس لیے راستے آپ کی موجودہ جگہ سے شروع نہیں ہو سکتے۔';

  @override
  String navErrorGeneric(String code) {
    return 'راستے لوڈ نہیں ہو سکے ($code)۔';
  }

  @override
  String navRoutesTitle(String place) {
    return '$place تک کے راستے';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'آمد $time';
  }

  @override
  String get navStart => 'شروع کریں';

  @override
  String get navEnd => 'ختم کریں';

  @override
  String get navEndLabel => 'نیویگیشن ختم کریں';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration باقی';
  }

  @override
  String navAdvisory(String text) {
    return 'مشورہ: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes منٹ',
      one: '1 منٹ',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours گھنٹے $minutes منٹ';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'راستہ $index: $name';
  }

  @override
  String get weatherTitle => 'موسم';

  @override
  String weatherFeelsLike(String temperature) {
    return 'محسوس ہوتا ہے $temperature';
  }

  @override
  String get weatherPrecipitation => 'بارش';

  @override
  String get weatherWind => 'ہوا';

  @override
  String get weatherVisibility => 'حدِ نگاہ';

  @override
  String get weatherHumidity => 'نمی';

  @override
  String get weatherHourly => 'اگلے چند گھنٹے';

  @override
  String weatherAsOf(String time) {
    return 'اپ ڈیٹ $time';
  }

  @override
  String get weatherRefresh => 'موسم ریفریش کریں';

  @override
  String get weatherUnavailable => 'موسم اس وقت دستیاب نہیں۔';

  @override
  String get weatherNoLocation => 'موسم کے لیے آپ کا مقام درکار ہے۔';

  @override
  String get weatherLegal => 'ڈیٹا کے ذرائع اور قانونی معلومات';

  @override
  String weatherProvidedBy(String service) {
    return 'موسم کا ڈیٹا: $service';
  }

  @override
  String get weatherNow => 'ابھی';

  @override
  String get virtualEmpty => 'کوئی معاون شے نہیں ملی';

  @override
  String get virtualEmptyCameraOff => 'ورچوئل ویو کے لیے لائیو کیمرا درکار ہے۔';

  @override
  String get virtualLaneDisclaimer =>
      'لین کی لکیریں صرف مثال کے لیے ہیں، شناخت شدہ نہیں۔';

  @override
  String virtualNearest(String zone) {
    return 'سب سے قریب: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'ورچوئل سڑک کا منظر: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'اے آئی $status';
  }

  @override
  String get virtualStatusLive => 'فعال';

  @override
  String get virtualStatusPaused => 'رکا ہوا';

  @override
  String get virtualStatusCameraOff => 'کیمرا بند';

  @override
  String get virtualStatusTestFootage => 'ٹیسٹ فوٹیج';

  @override
  String get virtualEmptyHint =>
      'گاڑیاں، لوگ، سائیکلیں، سگنل اور رکنے کے نشان شناخت ہونے پر یہاں نظر آتے ہیں۔';

  @override
  String get mapRecenter => 'مرکز میں لائیں';

  @override
  String get mapZoomIn => 'زوم اِن';

  @override
  String get mapZoomOut => 'زوم آؤٹ';

  @override
  String get mapUnsupported => 'انٹرایکٹو نقشہ iPhone پر دستیاب ہے۔';

  @override
  String get mapObjectsApprox => 'اشیاء کے نشانات تقریبی مقامات ہیں۔';

  @override
  String get mapWeatherUnavailable => 'موسم دستیاب نہیں';

  @override
  String get navErrorNoRoute => 'اس منزل تک کوئی راستہ نہیں ملا۔';

  @override
  String get navDismiss => 'ہٹائیں';

  @override
  String get navGo => 'چلیں';

  @override
  String get navFastest => 'تیز ترین';

  @override
  String get navThen => 'پھر';

  @override
  String get navRecents => 'حالیہ';

  @override
  String get navClearRecents => 'صاف کریں';

  @override
  String get navSearchSubmitHint =>
      'تمام مماثل مقامات دیکھنے کے لیے تلاش دبائیں';

  @override
  String get navPlaces => 'مقامات';

  @override
  String get navEtaLabel => 'آمد';

  @override
  String get navTimeLeftLabel => 'باقی';

  @override
  String get navOverview => 'جائزہ';

  @override
  String get navMute => 'آواز خاموش کریں';

  @override
  String get navUnmute => 'آواز بحال کریں';

  @override
  String get navEndConfirm => 'نیویگیشن ختم کریں؟';

  @override
  String navEndConfirmBody(String place) {
    return '$place تک کی رہنمائی رک جائے گی۔';
  }

  @override
  String navArrivedAt(String place) {
    return 'آپ $place پہنچ گئے ہیں';
  }

  @override
  String get navDone => 'مکمل';

  @override
  String get navWeakGps => 'کمزور GPS سگنل';

  @override
  String get navLocationOff =>
      'مقام بند ہے۔ راستے بنانے اور نیویگیشن کے لیے اسے آن کریں۔';

  @override
  String get navVoiceGuidance => 'صوتی رہنمائی';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance بعد، $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first، پھر $second';
  }

  @override
  String get navSpeakRerouting => 'راستہ دوبارہ بنایا جا رہا ہے';

  @override
  String get navSpeakArrived => 'آپ پہنچ گئے ہیں';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count میٹر',
      one: 'ایک میٹر',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value کلومیٹر',
      one: 'ایک کلومیٹر',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فٹ',
      one: 'ایک فٹ',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گز',
      one: 'ایک گز',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return '$distance تک سیدھا چلتے رہیں';
  }

  @override
  String get navErrorNoDirections =>
      'اس خطے میں اس سفر کے لیے رہنمائی دستیاب نہیں۔ کوئی اور منزل آزمائیں۔';

  @override
  String navContinueFor(String distance) {
    return '$distance تک سیدھا چلتے رہیں';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value میل',
      one: 'ایک میل',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'سب سے قریب: $object · $zone';
  }

  @override
  String get parkingNothing => 'منظر میں کچھ نہیں ملا';

  @override
  String get parkingBeeps => 'قربت کے بیپس';

  @override
  String get parkingVolume => 'بیپ کی بلندی';

  @override
  String get parkingLimitations =>
      'ایک کیمرا، 360° نہیں۔ کیمرے کے منظر سے باہر کی اشیاء کی شناخت نہیں ہوتی۔ پارکنگ سینسرز کا متبادل نہیں؛ اندازے غلط ہو سکتے ہیں اور خاموشی کا مطلب یہ نہیں کہ جگہ صاف ہے۔';

  @override
  String parkingTopDownLabel(String summary) {
    return 'اوپر سے قربت کا ویو۔ $summary';
  }

  @override
  String get perceptionModeOriginal => 'اصل';

  @override
  String get perceptionModeBoxes => 'خانے';

  @override
  String get perceptionModeMasks => 'اشیاء کے ماسکس';

  @override
  String get perceptionModeRoad => 'سڑک کی سطح';

  @override
  String get perceptionModeCombined => 'مشترکہ';

  @override
  String get perceptionOpacity => 'ماسک کی شفافیت';

  @override
  String get perceptionDisclaimer =>
      'سڑک کی سطح کا ماسک ایک تقریبی بصری تہہ ہے۔ یہ قابلِ ڈرائیو جگہ یا لینیں نہیں دکھاتا۔';

  @override
  String get perceptionNeedsModel =>
      'ماسکس دیکھنے کے لیے سیگمنٹیشن ماڈل منتخب کریں۔';

  @override
  String get perceptionChooseModel => 'ماڈل منتخب کریں';

  @override
  String get perceptionWaiting => 'پہلے سیگمنٹیشن فریم کا انتظار ہے…';

  @override
  String get perceptionShortCamera => 'کیمرا';

  @override
  String get perceptionShortBoxes => 'خانے';

  @override
  String get perceptionShortObjects => 'اشیا';

  @override
  String get perceptionShortRoad => 'سڑک';

  @override
  String get perceptionShortAll => 'سب';

  @override
  String get perceptionModesLabel => 'ادراکی تہیں';

  @override
  String get perceptionStatusWarmingUp => 'تیار ہو رہا ہے…';

  @override
  String get perceptionStatusLoadingModel => 'ماڈل لوڈ ہو رہا ہے…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'ماسک رکے ہوئے ہیں';

  @override
  String get perceptionLegend => 'ماسک کی وضاحتی کلید';

  @override
  String get perceptionUnavailable => 'ماسک دستیاب نہیں';

  @override
  String get driveSave => 'محفوظ کریں';

  @override
  String get driveSaveIncident => 'واقعہ محفوظ کریں';

  @override
  String driveSaveHint(int seconds) {
    return 'ڈیش کیم فوٹیج کے آخری $seconds سیکنڈ محفوظ کرتا ہے';
  }

  @override
  String get driveSaving => 'واقعہ محفوظ ہو رہا ہے…';

  @override
  String hudRecManualLabel(String time) {
    return 'ریکارڈنگ جاری ہے، $time';
  }

  @override
  String get driveRecord => 'ریکارڈ';

  @override
  String get driveRecordStartA11y => 'ریکارڈنگ شروع کریں';

  @override
  String driveRecordStopA11y(String time) {
    return 'ریکارڈنگ روکیں، $time ریکارڈ ہوئی';
  }

  @override
  String get driveRecordHint =>
      'آپ کے روکنے تک مسلسل ریکارڈ کرتا ہے، اس سے پہلے کے 5 سیکنڈ سمیت';

  @override
  String get driveRecordFailed => 'ریکارڈنگ شروع نہیں ہو سکی';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ریکارڈنگ محفوظ ہو گئی · $count حصے',
      one: 'ریکارڈنگ محفوظ ہو گئی',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'ریکارڈنگ رک گئی: اسٹوریج تقریباً بھر چکی ہے',
      'max_duration': 'ریکارڈنگ رک گئی: زیادہ سے زیادہ لمبائی پوری ہو گئی',
      'camera_stopped': 'ریکارڈنگ کیمرے کے ساتھ رک گئی',
      'background': 'ریکارڈنگ رک گئی: ایپ پس منظر میں چلی گئی',
      'thermal': 'ریکارڈنگ رک گئی: فون بہت گرم ہے',
      'other': 'ریکارڈنگ رک گئی',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'واقعہ محفوظ · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'دیکھیں';

  @override
  String get driveSaveFailed => 'واقعہ محفوظ نہیں ہو سکا۔';

  @override
  String get driveSaveNotRunning =>
      'ریکارڈنگ ابھی شروع نہیں ہوئی — کیمرا شروع ہونے کا انتظار کریں، پھر دوبارہ کوشش کریں۔';

  @override
  String get driveSaveTestFootage =>
      'ٹیسٹ فوٹیج ریکارڈ نہیں ہوتی۔ واقعہ محفوظ کرنا لائیو کیمرے کے ساتھ کام کرتا ہے۔';

  @override
  String get driveSaveStorageFull =>
      'آپ کے iPhone کی اسٹوریج ختم ہو گئی ہے۔ جگہ خالی کریں یا پرانے کلپس حذف کریں۔';

  @override
  String get driveSaveIoError => 'کلپ اسٹوریج میں نہیں لکھا جا سکا۔';

  @override
  String get driveClips => 'کلپس';

  @override
  String get driveSettings => 'ترتیبات';

  @override
  String get driveViewSwitcher => 'ڈرائیو ویوز';

  @override
  String get driveLocationDenied =>
      'مقام بند ہے — رفتار، نقشے اور راستے دستیاب نہیں۔';

  @override
  String get driveCameraDenied =>
      'کیمرا رسائی بند ہے — شناخت اور ریکارڈنگ دستیاب نہیں۔';

  @override
  String get driveRecorderFallback =>
      'آواز کے بغیر ریکارڈنگ: مائیکروفون تک رسائی بند ہے۔';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'ریکارڈنگ کی ترتیبات ایڈجسٹ کی گئیں: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'آپ کا iPhone گرم ہے۔ ٹھنڈا ہونے کے لیے اے آئی سست چل رہا ہے — اسے براہ راست دھوپ سے دور اور ہوا کے سوراخ کے قریب رکھیں۔';

  @override
  String get drivePowerThermalCritical =>
      'آپ کا iPhone بہت زیادہ گرم ہے۔ ٹھنڈا ہونے تک اے آئی کی شناخت رکی رہے گی؛ ممکن ہو تو ریکارڈنگ جاری رہتی ہے۔';

  @override
  String get drivePowerLowPower =>
      'لو پاور موڈ آن ہے — اے آئی کم شرح پر چل رہا ہے۔';

  @override
  String get drivePowerBatteryLow =>
      'بیٹری کم ہے — ڈرائیونگ کے دوران اپنے iPhone کو بجلی سے جوڑیں۔';

  @override
  String get onboardingTitle1 => 'ہر سفر میں مزید دیکھیں۔';

  @override
  String get onboardingBody1 =>
      'اپنے iPhone کو ایک ذہین ڈیش کیم اور ڈرائیونگ آگاہی کا ساتھی بنائیں۔';

  @override
  String get onboardingTitle2 => 'ہر فریم میں ذہانت۔';

  @override
  String get onboardingBody2 =>
      'معاون گاڑیاں، لوگ، سائیکلیں اور سڑک کے اشارے براہ راست اپنے iPhone پر پہچانیں۔';

  @override
  String get onboardingTitle3 => 'ایک سڑک۔ کئی زاویے۔';

  @override
  String get onboardingBody3 =>
      'لائیو شناخت، ورچوئل ڈرائیونگ ویوز، انٹرایکٹو نقشوں اور پارکنگ ویژولائزیشن کے درمیان تبدیل کریں۔';

  @override
  String get onboardingTitle4 => 'اہم لمحات محفوظ رکھیں۔';

  @override
  String get onboardingBody4 =>
      'حالیہ ڈیش کیم فوٹیج محفوظ کریں، واقعات کا جائزہ لیں اور ریکارڈنگز شیئر کریں۔';

  @override
  String get onboardingTitle5 => 'حفاظت اور رازداری';

  @override
  String get onboardingSafety1 =>
      'Corvista ڈرائیونگ آگاہی کا معاون ہے۔ نظر سڑک پر رکھیں۔';

  @override
  String get onboardingSafety2 =>
      'یہ آپ کی گاڑی کو کنٹرول نہیں کرتا اور آپ کے فیصلے کی جگہ نہیں لیتا۔';

  @override
  String get onboardingSafety3 =>
      'شناخت اور اندازے غلط ہو سکتے ہیں یا چھوٹ سکتے ہیں۔';

  @override
  String get onboardingSafety4 =>
      'کیمرے کی پروسیسنگ آپ کے iPhone پر ہوتی ہے — ویڈیو اپ لوڈ نہیں ہوتی۔';

  @override
  String get onboardingSafety5 =>
      'نقشے، تلاش، راستے اور موسم کے لیے انٹرنیٹ کنکشن درکار ہے۔';

  @override
  String get onboardingSafety6 =>
      'اپنا iPhone محفوظ طریقے سے لگائیں تاکہ وہ آپ کی نظر نہ روکے۔';

  @override
  String get onboardingSafety7 =>
      'ڈرائیونگ شروع کرنے سے پہلے سیٹ اپ مکمل کریں۔';

  @override
  String get onboardingAcknowledge =>
      'میں سمجھتا/سمجھتی ہوں کہ Corvista صرف آگاہی کا معاون ہے اور محفوظ ڈرائیونگ کی ذمہ داری میری ہی ہے۔';

  @override
  String get onboardingReadSafety => 'مکمل حفاظتی معلومات پڑھیں';

  @override
  String get onboardingNext => 'آگے';

  @override
  String get onboardingSkip => 'چھوڑیں';

  @override
  String get onboardingAgree => 'جاری رکھیں';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'صفحہ $current از $total';
  }

  @override
  String get permTitle => 'اجازتیں';

  @override
  String get permIntro =>
      'Corvista صرف وہی مانگتا ہے جو ہر خصوصیت کو درکار ہو۔ آپ انہیں کسی بھی وقت ترتیبات میں تبدیل کر سکتے ہیں۔';

  @override
  String get permCameraTitle => 'کیمرا';

  @override
  String get permCameraBody =>
      'شناخت، ڈیش کیم ریکارڈنگ اور پارکنگ ویو کے لیے ضروری۔ ویڈیو آپ کے iPhone پر پروسیس ہوتی ہے۔';

  @override
  String get permLocationTitle => 'مقام';

  @override
  String get permLocationBody =>
      'GPS رفتار، نقشے، راستوں، موسم اور محفوظ کلپس کو ٹیگ کرنے کے لیے۔ صرف تب جب آپ ایپ استعمال کریں۔';

  @override
  String get permMicTitle => 'مائیکروفون';

  @override
  String get permSpeechNote =>
      'اسپیچ ریکگنیشن صرف تب مانگی جاتی ہے جب آپ ہنگامی الرٹس کے لیے آواز سے منسوخی آن کریں۔';

  @override
  String get permRequired => 'ضروری';

  @override
  String get permOptional => 'اختیاری';

  @override
  String get permAllow => 'اجازت دیں';

  @override
  String get permGranted => 'اجازت ہے';

  @override
  String get permDenied => 'مسترد';

  @override
  String get permLimited => 'محدود';

  @override
  String get permRestricted => 'پابندی کے ساتھ';

  @override
  String get permStart => 'ڈرائیونگ شروع کریں';

  @override
  String get permCameraNeeded =>
      'آپ کیمرا رسائی کے بغیر جاری رکھ سکتے ہیں، لیکن شناخت اور ریکارڈنگ تب تک کام نہیں کریں گی جب تک آپ ترتیبات میں اجازت نہ دیں۔';

  @override
  String get permSetupIntro =>
      'مکمل کارکردگی کے لیے Corvista کو یہ درکار ہیں۔ “سب کی اجازت دیں” پر ٹیپ کریں اور iOS باری باری ہر ایک کے بارے میں پوچھے گا۔ آپ انہیں کسی بھی وقت ترتیبات میں تبدیل کر سکتے ہیں۔';

  @override
  String get permCameraLine =>
      'شناخت، ڈیش کیم ریکارڈنگ اور پارکنگ ویو کے لیے ضروری۔ ویڈیو آپ کے iPhone پر پروسیس ہوتی ہے، کبھی اپ لوڈ نہیں ہوتی۔';

  @override
  String get permLocationLine =>
      'GPS رفتار، نقشے، راستے، موسم اور یہ کہ کلپس کہاں محفوظ ہوئے۔ صرف تب جب آپ ایپ استعمال کریں۔';

  @override
  String get permMicLine =>
      'واقعے کے کلپس میں گاڑی کے اندر کی آواز، اور ہنگامی الرٹ کے دوران آپ کا منسوخی کا جملہ سننے کے لیے۔';

  @override
  String get permSpeechTitle => 'اسپیچ ریکگنیشن';

  @override
  String get permSpeechLine =>
      'ہنگامی الٹی گنتی کے دوران آپ کا منسوخی کا جملہ پہچانتی ہے، جہاں معاون ہو آپ کے iPhone پر۔';

  @override
  String get permAllowAll => 'سب کی اجازت دیں';

  @override
  String permAsking(String permission) {
    return '$permission کے لیے پوچھا جا رہا ہے…';
  }

  @override
  String get permSomeDenied =>
      'کچھ اجازتیں بند ہیں۔ ان خصوصیات کے استعمال کے لیے انہیں ترتیبات میں آن کریں۔';

  @override
  String get permNotNow => 'ابھی نہیں';

  @override
  String get tourLabel => 'ڈرائیو اسکرین کا دورہ';

  @override
  String tourProgress(int current, int total) {
    return 'مرحلہ $current از $total';
  }

  @override
  String get tourNext => 'آگے';

  @override
  String get tourBack => 'پیچھے';

  @override
  String get tourSkip => 'دورہ چھوڑیں';

  @override
  String get tourFinish => 'ڈرائیونگ شروع کریں';

  @override
  String get tourWelcomeTitle => 'آپ کا مختصر دورہ';

  @override
  String get tourWelcomeBody =>
      'ڈرائیو اسکرین کی اہم چیزوں پر ایک منٹ کی نظر۔ بہتر ہے کہ گاڑی کھڑی ہونے پر دیکھیں۔';

  @override
  String get tourHudTitle => 'آپ کی انسٹرومنٹ پٹی';

  @override
  String get tourHudSpeed => 'رفتار GPS سے آتی ہے۔';

  @override
  String get tourHudRec => 'REC دکھاتا ہے کہ فوٹیج کے کتنے سیکنڈ بفر میں ہیں۔';

  @override
  String get tourHudAi =>
      'اے آئی چپ ماڈل، نظر آنے والی اشیاء کی تعداد اور ایک نقطہ دکھاتا ہے: سبز چل رہا ہے، زرد محدود، سرخ رکا ہوا۔';

  @override
  String get tourSaveTitle => 'واقعہ محفوظ کریں';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista ویڈیو کے آخری $seconds سیکنڈ کا رولنگ بفر رکھتا ہے۔ یہ مسلسل اوور رائٹ ہوتا ہے، اس لیے جب تک آپ محفوظ کریں پر ٹیپ نہ کریں کچھ نہیں رکھا جاتا۔ محفوظ کلپس اسی iPhone پر کلپس میں رہتے ہیں۔';
  }

  @override
  String get tourRecordTitle => 'پورے سفر کی ریکارڈنگ کریں';

  @override
  String get tourRecordBody =>
      'آپ کے روکنے تک مسلسل فلم بندی کے لیے «ریکارڈ» پر ٹیپ کریں۔ طویل سفر کلپس میں 5 منٹ کے حصوں میں محفوظ ہوتے ہیں، اور ریکارڈنگ کے دوران بھی «واقعہ محفوظ کریں» کام کرتا رہتا ہے۔';

  @override
  String get tourViewsTitle => 'سڑک دیکھنے کے پانچ طریقے';

  @override
  String get tourViewDetection =>
      'معاون اشیاء کے گرد خانوں کے ساتھ لائیو کیمرا۔';

  @override
  String get tourViewVirtual => 'شناخت سے بنایا گیا سادہ تھری ڈی منظر۔';

  @override
  String get tourViewMap => 'تلاش اور موڑ بہ موڑ رہنمائی کے ساتھ Apple Maps۔';

  @override
  String get tourViewParking => 'کیمرا اور اوپر سے قربت کا ویو۔';

  @override
  String get tourViewPerception => 'سڑک اور اشیاء کے ماسکس۔';

  @override
  String get tourMapTitle => 'تلاش اور موڑ بہ موڑ';

  @override
  String get tourMapBody =>
      'نقشہ کھولیں، سرچ بار پر ٹیپ کریں اور منزل چنیں۔ راستہ منتخب کریں، پھر موڑ بہ موڑ رہنمائی کے لیے شروع کریں پر ٹیپ کریں۔ انٹرنیٹ کنکشن درکار ہے۔';

  @override
  String get tourClipsTitle => 'کلپس';

  @override
  String get tourClipsBody =>
      'محفوظ واقعات کا جائزہ لیں، نام بدلیں، شیئر کریں یا حذف کریں۔ کلپس آپ کے iPhone پر رہتے ہیں جب تک آپ انہیں شیئر نہ کریں۔';

  @override
  String get tourSettingsTitle => 'ترتیبات';

  @override
  String get tourSettingsBody =>
      'صوتی الرٹس اور ان کی حساسیت، ریکارڈنگ کا معیار اور بفر کی لمبائی ایڈجسٹ کریں، اور ہنگامی موڈ سیٹ کریں: منسوخی کی الٹی گنتی کے ساتھ ایک تجرباتی ٹکر الرٹ۔';

  @override
  String get tourSafetyTitle => 'ڈرائیو سے پہلے';

  @override
  String get tourSafety1 =>
      'اپنا iPhone محفوظ طریقے سے ایسی جگہ لگائیں جو آپ کی نظر نہ روکے۔';

  @override
  String get tourSafety2 =>
      'ڈرائیونگ کے دوران ایپ استعمال نہ کریں۔ سب کچھ گاڑی کھڑی ہونے پر سیٹ کریں۔';

  @override
  String get tourSafety3 =>
      'شناخت اور زونز اندازے ہیں۔ یہ غلط ہو سکتے ہیں یا چھوٹ سکتے ہیں۔';

  @override
  String get tourSafety4 => 'محفوظ ڈرائیونگ کی ذمہ داری آپ ہی پر رہتی ہے۔';

  @override
  String get helpTakeTour => 'دورہ کریں';

  @override
  String get helpTakeTourSub => 'ڈرائیو اسکرین کی ایک منٹ کی رہنمائی۔';

  @override
  String get tripsTitle => 'سفر';

  @override
  String get tripsOpen => 'سفر کا لاگ';

  @override
  String get tripsEmptyTitle => 'ابھی کوئی سفر نہیں';

  @override
  String get tripsEmptyBody =>
      'Corvista کے ساتھ ڈرائیونگ کے دوران سفر خود بخود ریکارڈ ہوتے ہیں — فاصلہ، وقت، رفتار اور آپ کا اختیار کردہ راستہ۔';

  @override
  String get tripsDisabledBody =>
      'سفر کا لاگ بند ہے، اس لیے نئی ڈرائیوز ریکارڈ نہیں ہوتیں۔ اس iPhone پر اپنے راستوں کا نجی لاگ رکھنے کے لیے اسے آن کریں۔';

  @override
  String get tripsEnable => 'سفر کا لاگ آن کریں';

  @override
  String get tripsToday => 'آج';

  @override
  String get tripsYesterday => 'کل';

  @override
  String tripsRecordingNow(String distance) {
    return 'سفر ریکارڈ ہو رہا ہے · $distance';
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
      other: '$count واقعات',
      one: '1 واقعہ',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count الرٹس',
      one: '1 الرٹ',
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
      zero: 'کوئی سفر نہیں',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'فاصلہ';

  @override
  String get tripsStatDuration => 'دورانیہ';

  @override
  String get tripsStatMoving => 'حرکت کا وقت';

  @override
  String get tripsStatAvgSpeed => 'اوسط رفتار';

  @override
  String get tripsStatMaxSpeed => 'زیادہ سے زیادہ رفتار';

  @override
  String get tripsDetections => 'شناختیں';

  @override
  String get tripsNoDetections => 'اس سفر میں سڑک کی کوئی شے لاگ نہیں ہوئی۔';

  @override
  String get tripsTimeline => 'ٹائم لائن';

  @override
  String get tripsEventStart => 'سفر شروع ہوا';

  @override
  String get tripsEventEnd => 'سفر ختم ہوا';

  @override
  String get tripsEventAlert => 'صوتی الرٹ';

  @override
  String get tripsEventIncident => 'واقعے کا کلپ محفوظ ہوا';

  @override
  String get tripsEventEmergency => 'ممکنہ حادثے کی شناخت ہوئی';

  @override
  String get tripsEventNavStart => 'نیویگیشن شروع ہوئی';

  @override
  String get tripsEventArrive => 'منزل پر پہنچ گئے';

  @override
  String get tripsEventReroute => 'راستہ دوبارہ بنایا گیا';

  @override
  String get tripsEventRecording => 'ریکارڈنگ محفوظ ہو گئی';

  @override
  String get tripsOpenClip => 'کلپ کھولیں';

  @override
  String get tripsTrackPreview => 'GPS ٹریک';

  @override
  String get tripsRenameTitle => 'سفر کا نام تبدیل کریں';

  @override
  String get tripsRenameHint => 'سفر کا نام';

  @override
  String get tripsFavorite => 'پسندیدہ میں شامل کریں';

  @override
  String get tripsUnfavorite => 'پسندیدہ سے ہٹائیں';

  @override
  String get tripsShareGpx => 'GPX شیئر کریں';

  @override
  String get tripsShareFailed => 'یہ سفر شیئر نہیں ہو سکا۔';

  @override
  String get tripsDelete => 'سفر حذف کریں';

  @override
  String get tripsDeleteConfirmTitle => 'یہ سفر حذف کریں؟';

  @override
  String get tripsDeleteConfirmBody =>
      'راستہ اور اعدادوشمار اس iPhone سے ہٹا دیے جائیں گے۔ اس سفر کے واقعے کے کلپس محفوظ رہیں گے۔';

  @override
  String get tripsDeleted => 'سفر حذف ہو گیا';

  @override
  String get tripsNotFound => 'یہ سفر اب دستیاب نہیں۔';

  @override
  String get tripsPrivacyNote =>
      'صرف اس iPhone پر محفوظ ہے۔ کچھ بھی اپ لوڈ نہیں ہوتا۔';

  @override
  String get settingsSectionTrips => 'سفر کا لاگ';

  @override
  String get settingsTripLog => 'سفر ریکارڈ کریں';

  @override
  String get settingsTripLogSubtitle =>
      'آپ کا راستہ اور ڈرائیو کے اعدادوشمار صرف اس iPhone پر رکھتا ہے۔';

  @override
  String get settingsTripRetention => 'سفر محفوظ رکھیں';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days دن',
      one: '1 دن',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 سال';

  @override
  String get settingsRetentionForever => 'ہمیشہ';

  @override
  String get settingsTripRetentionFooter =>
      'Corvista شروع ہونے پر پرانے سفر خود بخود حذف ہو جاتے ہیں۔';

  @override
  String get settingsViewTrips => 'سفر دیکھیں';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours گھنٹے $minutes منٹ';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes منٹ';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista سفر $date';
  }

  @override
  String get settingsFreeUpSpace => 'جگہ خالی کریں';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'عارضی فائلیں اور کیشے ہٹاتا ہے۔ محفوظ کلپس اور سفر برقرار رہتے ہیں۔';

  @override
  String settingsFreedBytes(String size) {
    return '$size خالی ہوئی';
  }

  @override
  String get settingsNothingToFree =>
      'کیشے صاف ہو گئے — ہٹانے کے لیے کوئی عارضی فائل نہیں۔';

  @override
  String get settingsSectionPrivacyData => 'رازداری اور ڈیٹا';

  @override
  String get settingsPrivacyDataFooter =>
      'کلپس، سفر اور ترتیبات صرف اسی iPhone پر محفوظ ہوتی ہیں۔ یہ اس سے باہر صرف تب جاتی ہیں جب آپ خود انہیں شیئر کرنے کا انتخاب کریں۔';

  @override
  String get settingsDeleteAllData => 'تمام ڈیٹا حذف کریں';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'اس iPhone سے کلپس، سفر، رابطے اور ترتیبات مٹائیں';

  @override
  String get deleteAllTitle => 'تمام ڈیٹا حذف کریں؟';

  @override
  String get deleteAllMessage =>
      'یہ اس iPhone سے مستقل طور پر ہٹا دے گا:\n• واقعے کے کلپس اور تھمب نیلز\n• سفری لاگ اور GPS ٹریکس\n• ہنگامی رابطے اور ہنگامی واقعات\n• شناخت کے لاگز اور تشخیصی لاگ\n• ترتیبات اور حالیہ منزلیں\n• عارضی ریکارڈنگ بفر اور کیش\n\nیہ عمل واپس نہیں ہو سکتا۔ اس کے بعد Corvista خوش آمدید اسکرینز سے دوبارہ شروع ہوگا۔';

  @override
  String get deleteAllConfirm => 'سب کچھ حذف کریں';

  @override
  String get deleteAllInProgress => 'حذف ہو رہا ہے…';

  @override
  String get deleteAllDone => 'تمام ڈیٹا حذف ہو گیا';

  @override
  String get deleteAllPartial =>
      'کچھ آئٹمز حذف نہیں ہو سکے۔ ترتیبات سے دوبارہ کوشش کریں۔';

  @override
  String get diagLogSection => 'تشخیصی لاگ';

  @override
  String get diagLogFooter =>
      'خرابیاں صرف اسی iPhone پر درج ہوتی ہیں، مقامات، رابطوں کے ناموں یا فون نمبروں کے بغیر۔ جب تک آپ خود لاگ شیئر نہ کریں، کچھ نہیں بھیجا جاتا۔';

  @override
  String get diagLogShare => 'تشخیصی لاگ شیئر کریں';

  @override
  String get diagLogEmpty => 'خالی';

  @override
  String get diagLogClear => 'لاگ صاف کریں';

  @override
  String get diagLogClearTitle => 'تشخیصی لاگ صاف کریں؟';

  @override
  String get diagLogClearBody =>
      'محفوظ شدہ خرابی کے اندراجات اس iPhone سے حذف کر دیے جائیں گے۔';

  @override
  String get diagLogCleared => 'تشخیصی لاگ صاف ہو گیا';

  @override
  String get diagLogShareFailed => 'تشخیصی لاگ شیئر نہیں ہو سکا۔';

  @override
  String get privacyControls2 =>
      'ترتیبات › رازداری اور ڈیٹا › تمام ڈیٹا حذف کریں، اس iPhone پر Corvista کے محفوظ کردہ ہر کلپ، سفر، رابطے، لاگ اور ترتیب کو مٹا دیتا ہے۔';

  @override
  String get parkingZoneStop => 'رکیں';

  @override
  String get parkingZoneVeryClose => 'بہت قریب';

  @override
  String get parkingZoneClose => 'قریب';

  @override
  String get parkingZoneNothingClose => 'قریب کچھ نظر نہیں آیا';

  @override
  String get parkingNotDetected =>
      'دیواریں، ستون، کھمبے اور فٹ پاتھ کے کنارے شناخت نہیں ہوتے';

  @override
  String get parkingApprox => 'تقریباً';

  @override
  String get parkingSideLeft => 'بائیں';

  @override
  String get parkingSideCenter => 'درمیان';

  @override
  String get parkingSideRight => 'دائیں';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => 'صرف سامنے کے کیمرے کا منظر — 360° سسٹم نہیں';

  @override
  String get parkingMuteBeeps => 'بیپس خاموش کریں';

  @override
  String get parkingUnmuteBeeps => 'بیپس آن کریں';

  @override
  String get parkingAbout => 'پارکنگ ویو کے بارے میں';

  @override
  String get parkingLimitationsDetail =>
      'صرف کیمرے کے سامنے کا علاقہ دیکھا جاتا ہے۔ ڈیٹیکٹر کاروں، بسوں اور ٹرکوں، لوگوں، سائیکلوں اور موٹر سائیکلوں کو پہچانتا ہے۔ دیواریں، ستون، کھمبے، فٹ پاتھ کے کنارے، بولارڈز، رکاوٹیں اور نیچی رکاوٹیں شناخت نہیں ہوتیں، اور بونٹ عین سامنے کی زمین کو چھپا سکتا ہے۔ فاصلے ایک کیمرے سے (چیز کے سائز اور مقام کی بنیاد پر) لگائے گئے موٹے اندازے ہیں اور کافی غلط ہو سکتے ہیں۔ خاموشی یا «قریب کچھ نظر نہیں آیا» کا مطلب یہ نہیں کہ راستہ صاف ہے — ہمیشہ اردگرد دیکھیں اور آئینوں کا استعمال کریں۔';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'اطراف کے لحاظ سے قربت: بائیں $left، درمیان $center، دائیں $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'خرابیاں اس iPhone پر ایک نجی لاگ میں لکھی جاتی ہیں (مقامات، رابطوں کے ناموں یا فون نمبروں کے بغیر)۔ یہ کبھی خودکار طور پر نہیں بھیجا جاتا؛ آپ اسے ترتیبات › تشخیصی معلومات میں شیئر یا صاف کر سکتے ہیں۔';
}
