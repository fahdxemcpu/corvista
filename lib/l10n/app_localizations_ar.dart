// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'شاهد المزيد في كل رحلة.';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonBack => 'رجوع';

  @override
  String get commonClose => 'إغلاق';

  @override
  String get commonRetry => 'إعادة المحاولة';

  @override
  String get commonOpenSettings => 'فتح الإعدادات';

  @override
  String get commonLoading => 'جارٍ التحميل…';

  @override
  String get commonError => 'حدث خطأ ما.';

  @override
  String commonErrorDetail(String message) {
    return 'حدث خطأ ما: $message';
  }

  @override
  String get commonOn => 'مفعّل';

  @override
  String get commonOff => 'متوقف';

  @override
  String get commonRename => 'إعادة تسمية';

  @override
  String get commonShare => 'مشاركة';

  @override
  String get commonNotAvailable => 'غير متاح';

  @override
  String get commonTestFootage => 'لقطات اختبار';

  @override
  String get zoneVeryClose => 'قريب جدًا';

  @override
  String get zoneClose => 'قريب';

  @override
  String get zoneMedium => 'متوسط';

  @override
  String get zoneFar => 'بعيد';

  @override
  String get zoneUnknown => 'غير معروف';

  @override
  String get classPerson => 'شخص';

  @override
  String get classBicycle => 'دراجة هوائية';

  @override
  String get classMotorcycle => 'دراجة نارية';

  @override
  String get classCar => 'مركبة';

  @override
  String get classBus => 'حافلة';

  @override
  String get classTrafficLight => 'إشارة مرور';

  @override
  String get classStopSign => 'علامة التوقف';

  @override
  String get viewDetection => 'الكشف';

  @override
  String get viewVirtual => 'افتراضي';

  @override
  String get viewMap => 'الخريطة';

  @override
  String get viewParking => 'الركن';

  @override
  String get viewPerception => 'الإدراك';

  @override
  String get unitKmh => 'كم/س';

  @override
  String get unitMph => 'ميل/س';

  @override
  String get lightRed => 'أحمر';

  @override
  String get lightYellow => 'أصفر';

  @override
  String get lightGreen => 'أخضر';

  @override
  String get lightUnknown => 'غير معروف';

  @override
  String get clipsTitle => 'المقاطع';

  @override
  String get clipsSelect => 'تحديد';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم تحديد $count مقطع',
      many: 'تم تحديد $count مقطعًا',
      few: 'تم تحديد $count مقاطع',
      two: 'تم تحديد مقطعين',
      one: 'تم تحديد مقطع واحد',
      zero: 'تحديد المقاطع',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'تحديد الكل';

  @override
  String get clipsDeselectAll => 'إلغاء تحديد الكل';

  @override
  String get clipsDeleteSelected => 'حذف المحدد';

  @override
  String get clipsGridView => 'عرض شبكي';

  @override
  String get clipsListView => 'عرض قائمة';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count مقطع؟',
      many: 'حذف $count مقطعًا؟',
      few: 'حذف $count مقاطع؟',
      two: 'حذف المقطعين؟',
      zero: 'حذف $count مقطع؟',
      one: 'حذف هذا المقطع؟',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ستُحذف هذه الفيديوهات نهائيًا من iPhone لديك. لا يمكن التراجع عن هذا الإجراء.',
      many: 'ستُحذف هذه الفيديوهات نهائيًا من iPhone لديك. لا يمكن التراجع عن هذا الإجراء.',
      few: 'ستُحذف هذه الفيديوهات نهائيًا من iPhone لديك. لا يمكن التراجع عن هذا الإجراء.',
      two: 'ستُحذف هذه الفيديوهات نهائيًا من iPhone لديك. لا يمكن التراجع عن هذا الإجراء.',
      zero: 'ستُحذف هذه الفيديوهات نهائيًا من iPhone لديك. لا يمكن التراجع عن هذا الإجراء.',
      one: 'سيُحذف الفيديو نهائيًا من iPhone لديك. لا يمكن التراجع عن هذا الإجراء.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حذف $count مقطع',
      many: 'تم حذف $count مقطعًا',
      few: 'تم حذف $count مقاطع',
      two: 'تم حذف المقطعين',
      zero: 'تم حذف $count مقطع',
      one: 'تم حذف المقطع',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'لا توجد مقاطع بعد';

  @override
  String get clipsEmptyBody =>
      'أثناء القيادة، يحتفظ Corvista بذاكرة مؤقتة قصيرة متجددة. اضغط «حفظ الحادث» لحفظ آخر ثوانٍ من التسجيل هنا.';

  @override
  String get clipsLoadError => 'تعذّر تحميل المقاطع.';

  @override
  String get clipsStorageTitle => 'التخزين';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'المقاطع $clips · الذاكرة المؤقتة $buffer · المتاح $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مقطع محفوظ',
      many: '$count مقطعًا محفوظًا',
      few: '$count مقاطع محفوظة',
      two: 'مقطعان محفوظان',
      one: 'مقطع محفوظ واحد',
      zero: 'لا توجد مقاطع محفوظة',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'مساحة التخزين في iPhone منخفضة. قد يتعذّر حفظ الحوادث الجديدة.';

  @override
  String get clipsMissingFile => 'الملف مفقود';

  @override
  String get clipsEmergencyBadge => 'اصطدام';

  @override
  String clipsUntitled(String date) {
    return 'حادث · $date';
  }

  @override
  String get clipsAudio => 'تم تسجيل الصوت';

  @override
  String get clipsFavorite => 'مفضّل';

  @override
  String get clipsUnfavorite => 'إزالة من المفضلة';

  @override
  String get clipsLocation => 'تم حفظ الموقع';

  @override
  String clipsOpenClip(String title) {
    return 'فتح المقطع $title';
  }

  @override
  String get playerNotFoundTitle => 'المقطع غير موجود';

  @override
  String get playerNotFoundBody => 'ربما تم حذف هذا المقطع.';

  @override
  String get playerMissingTitle => 'ملف الفيديو مفقود';

  @override
  String get playerMissingBody =>
      'لم يعد تسجيل هذا المقطع موجودًا على iPhone لديك. يمكنك إزالة الإدخال من المعرض.';

  @override
  String get playerRemoveEntry => 'إزالة الإدخال';

  @override
  String get playerLoadError => 'تعذّر تشغيل هذا الفيديو.';

  @override
  String get playerPlay => 'تشغيل';

  @override
  String get playerPause => 'إيقاف مؤقت';

  @override
  String get playerReplay => 'إعادة التشغيل';

  @override
  String get playerRenameTitle => 'إعادة تسمية المقطع';

  @override
  String get playerRenameHint => 'اسم المقطع';

  @override
  String get playerRenamed => 'تمت إعادة تسمية المقطع';

  @override
  String get playerFavorited => 'تمت الإضافة إلى المفضلة';

  @override
  String get playerUnfavorited => 'تمت الإزالة من المفضلة';

  @override
  String get playerShareFailed => 'تعذّرت مشاركة هذا المقطع.';

  @override
  String get playerDetails => 'التفاصيل';

  @override
  String get playerDate => 'تاريخ التسجيل';

  @override
  String get playerDuration => 'المدة';

  @override
  String get playerResolution => 'الدقة';

  @override
  String get playerSize => 'حجم الملف';

  @override
  String get playerAudio => 'الصوت';

  @override
  String get playerAudioYes => 'تم تسجيله';

  @override
  String get playerAudioNo => 'لم يُسجَّل';

  @override
  String get playerReason => 'سبب الحفظ';

  @override
  String get playerReasonManual => 'زر حفظ الحادث';

  @override
  String get playerReasonEmergency => 'اكتشاف اصطدام محتمل';

  @override
  String get playerReasonRecovered => 'تمت الاستعادة بعد انقطاع';

  @override
  String get playerSpeed => 'سرعة GPS عند الحفظ';

  @override
  String get playerLocation => 'الموقع';

  @override
  String get playerOpenInMaps => 'فتح في الخرائط';

  @override
  String get playerBack => 'رجوع';

  @override
  String get playerMore => 'مزيد من الإجراءات';

  @override
  String get clipsFilterLabel => 'عرض';

  @override
  String get clipsFilterAll => 'الكل';

  @override
  String get clipsFilterRecordings => 'التسجيلات';

  @override
  String get clipsFilterIncidents => 'الحوادث';

  @override
  String get clipsFilterEmergency => 'الطوارئ';

  @override
  String get clipsFilterFavorites => 'المفضلة';

  @override
  String get clipsSort => 'ترتيب';

  @override
  String get clipsSortNewest => 'الأحدث أولًا';

  @override
  String get clipsSortOldest => 'الأقدم أولًا';

  @override
  String get clipsSortLongest => 'الأطول أولًا';

  @override
  String get clipsSortLargest => 'الأكبر أولًا';

  @override
  String get clipsToday => 'اليوم';

  @override
  String get clipsYesterday => 'أمس';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مقطع',
      many: '$count مقطعًا',
      few: '$count مقاطع',
      two: 'مقطعان',
      one: 'مقطع واحد',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'لا توجد مقاطع في هذه الفئة بعد.';

  @override
  String get clipsFavoritesEmpty => 'ضع نجمة على مقطع ليبقى هنا للوصول السريع.';

  @override
  String get clipsKindRecording => 'تسجيل';

  @override
  String get clipsKindIncident => 'حادث';

  @override
  String get clipsKindEmergency => 'طوارئ';

  @override
  String get clipsKindTest => 'اختبار';

  @override
  String clipsTripChip(String time) {
    return 'الرحلة · $time';
  }

  @override
  String get clipsOpenTrip => 'فتح الرحلة التي سُجّل فيها هذا المقطع';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return 'المستخدم $used · المتاح $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'تشغل المقاطع $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تسجيل',
      many: '$count تسجيلًا',
      few: '$count تسجيلات',
      two: 'تسجيلان',
      one: 'تسجيل واحد',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حادث',
      many: '$count حادثًا',
      few: '$count حوادث',
      two: 'حادثان',
      one: 'حادث واحد',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حالة طوارئ',
      many: '$count حالة طوارئ',
      few: '$count حالات طوارئ',
      two: 'حالتا طوارئ',
      one: 'حالة طوارئ واحدة',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'تفريغ مساحة';

  @override
  String get clipsStorageLowGentle =>
      'المساحة المتاحة أقل من 2 غيغابايت. لمواصلة التسجيل بسلاسة، أفرغ مساحة أو احذف المقاطع التي لا تحتاج إليها.';

  @override
  String get clipsSaveToPhotos => 'حفظ في الصور';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مقطع',
      many: '$count مقطعًا',
      few: '$count مقاطع',
      two: 'مقطعان',
      one: 'مقطع واحد',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count مقطع ($size)؟',
      many: 'حذف $count مقطعًا ($size)؟',
      few: 'حذف $count مقاطع ($size)؟',
      two: 'حذف المقطعين ($size)؟',
      one: 'حذف هذا المقطع ($size)؟',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'جارٍ حفظ $done من $total في الصور…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حفظ $count مقطع في الصور',
      many: 'تم حفظ $count مقطعًا في الصور',
      few: 'تم حفظ $count مقاطع في الصور',
      two: 'تم حفظ مقطعين في الصور',
      one: 'تم الحفظ في الصور',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return 'تم حفظ $saved في الصور · تعذّر حفظ $failed';
  }

  @override
  String get clipsPhotosDenied =>
      'لا يُسمح لـ Corvista بإضافة مقاطع فيديو إلى الصور. يمكنك السماح بذلك من الإعدادات.';

  @override
  String get clipsPhotosFailed => 'تعذّر الحفظ في الصور.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تمت إضافة $count مقطع إلى المفضلة',
      many: 'تمت إضافة $count مقطعًا إلى المفضلة',
      few: 'تمت إضافة $count مقاطع إلى المفضلة',
      two: 'تمت إضافة مقطعين إلى المفضلة',
      one: 'تمت الإضافة إلى المفضلة',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تمت إزالة $count مقطع من المفضلة',
      many: 'تمت إزالة $count مقطعًا من المفضلة',
      few: 'تمت إزالة $count مقاطع من المفضلة',
      two: 'تمت إزالة مقطعين من المفضلة',
      one: 'تمت الإزالة من المفضلة',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (مقتطع)';
  }

  @override
  String get playerTrim => 'اقتطاع';

  @override
  String get playerInfo => 'معلومات';

  @override
  String get playerKind => 'النوع';

  @override
  String get playerReasonRecording => 'زر التسجيل';

  @override
  String get trimTitle => 'اقتطاع المقطع';

  @override
  String get trimHint =>
      'اسحب المقبضين لاختيار الجزء الذي تريد الاحتفاظ به. يبقى المقطع الأصلي دون تغيير.';

  @override
  String get trimStartHandle => 'بداية الاقتطاع';

  @override
  String get trimEndHandle => 'نهاية الاقتطاع';

  @override
  String trimSelection(String duration) {
    return 'المدة المحددة: $duration';
  }

  @override
  String get trimSave => 'حفظ كمقطع جديد';

  @override
  String get trimSaving => 'جارٍ حفظ المقطع المقتطع…';

  @override
  String get trimSaved => 'تم حفظ المقطع المقتطع';

  @override
  String get trimOpenNew => 'فتح';

  @override
  String get trimFailed => 'تعذّر اقتطاع هذا المقطع.';

  @override
  String get trimStorageFull => 'لا توجد مساحة كافية لحفظ المقطع المقتطع.';

  @override
  String get trimPreview => 'تشغيل المحدد';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsSectionCamera => 'الكاميرا';

  @override
  String get settingsSectionAi => 'الذكاء الاصطناعي';

  @override
  String get settingsSectionAlerts => 'التنبيهات';

  @override
  String get settingsSectionAlertCategories => 'فئات التنبيه';

  @override
  String get settingsSectionRecording => 'التسجيل';

  @override
  String get settingsSectionDriving => 'القيادة';

  @override
  String get settingsSectionPower => 'الطاقة';

  @override
  String get settingsSectionEmergency => 'الطوارئ';

  @override
  String get settingsSectionAppearance => 'المظهر';

  @override
  String get settingsSectionLanguage => 'اللغة';

  @override
  String get settingsSectionInformation => 'معلومات';

  @override
  String get settingsCameraLens => 'عدسة الكاميرا';

  @override
  String get settingsLensWide => 'عريضة';

  @override
  String get settingsLensUltraWide => 'فائقة الاتساع';

  @override
  String get settingsLensTelephoto => 'تقريب';

  @override
  String get settingsLensUnavailable => 'غير متاحة على هذا الـ iPhone';

  @override
  String get settingsStabilization => 'التثبيت';

  @override
  String get settingsStabAuto => 'تلقائي';

  @override
  String get settingsStabOff => 'متوقف';

  @override
  String get settingsStabStandard => 'قياسي';

  @override
  String get settingsStabCinematic => 'سينمائي';

  @override
  String get settingsOverlayOpacity => 'شفافية الطبقة';

  @override
  String get settingsShowFps => 'إظهار إحصاءات الأداء';

  @override
  String get settingsShowFpsSubtitle =>
      'معدل الإطارات ووقت الاستدلال في عرض الكشف';

  @override
  String get settingsCameraFooter =>
      'تُطبَّق تغييرات العدسة والتثبيت عند التشغيل التالي للكاميرا.';

  @override
  String get settingsAiModel => 'نموذج الذكاء الاصطناعي';

  @override
  String get settingsConfidence => 'دقة الكشف';

  @override
  String get settingsTracking => 'تتبّع الكائنات';

  @override
  String get settingsTrackingSubtitle => 'يحافظ على ثبات الكائنات بين الإطارات';

  @override
  String get settingsShowLabels => 'إظهار التسميات';

  @override
  String get settingsShowConfidence => 'إظهار نسبة الثقة';

  @override
  String get settingsSegmentationOpacity => 'شفافية قناع الإدراك';

  @override
  String get settingsAiFooter =>
      'خفض الثقة يُظهر كائنات أكثر لكن مع المزيد من الكشف الخاطئ. قد يكون الكشف غير دقيق.';

  @override
  String get settingsVoiceAlerts => 'التنبيهات الصوتية';

  @override
  String get settingsVoiceLanguage => 'لغة الصوت';

  @override
  String get settingsVoiceLanguageAuto => 'مطابقة لغة التطبيق';

  @override
  String get settingsVoice => 'الصوت';

  @override
  String get settingsVoiceDefault => 'افتراضي النظام';

  @override
  String get settingsVoiceQualityEnhanced => 'محسّن';

  @override
  String get settingsVoiceQualityPremium => 'جودة عالية';

  @override
  String get settingsNoVoices =>
      'لا يوجد صوت مثبّت لهذه اللغة. أضف صوتًا من إعدادات iOS › إمكانية الوصول › المحتوى المنطوق.';

  @override
  String get settingsAlertPedestrian => 'المشاة';

  @override
  String get settingsAlertCyclist => 'راكبو الدراجات';

  @override
  String get settingsAlertMotorcycle => 'الدراجات النارية';

  @override
  String get settingsAlertBus => 'الحافلات';

  @override
  String get settingsAlertVehicleClose => 'مركبة قريبة جدًا في الأمام';

  @override
  String get settingsAlertTrafficLight => 'تغيّر إشارة المرور';

  @override
  String get settingsAlertTrafficMoving => 'تحرّك السير في الأمام';

  @override
  String get settingsAlertStopSign => 'علامات التوقف';

  @override
  String get settingsSensitivity => 'الحساسية';

  @override
  String get settingsSensitivityLow => 'منخفضة';

  @override
  String get settingsSensitivityMedium => 'متوسطة';

  @override
  String get settingsSensitivityHigh => 'مرتفعة';

  @override
  String get settingsCooldown => 'فاصل التكرار';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds ث';
  }

  @override
  String get settingsVolume => 'مستوى صوت التنبيهات';

  @override
  String get settingsQuietMode => 'الوضع الهادئ';

  @override
  String get settingsQuietModeSubtitle => 'تُنطق أهم التنبيهات فقط';

  @override
  String get settingsTestVoice => 'اختبار الصوت';

  @override
  String get settingsTestVoiceDone => 'جارٍ تشغيل تنبيه تجريبي…';

  @override
  String get settingsParkingBeeps => 'صفير الركن';

  @override
  String get settingsBeepVolume => 'مستوى الصفير';

  @override
  String get settingsAlertsFooter =>
      'التنبيهات وسيلة مساعدة فقط. راقب الطريق دائمًا؛ فالصمت لا يعني أن الطريق خالٍ.';

  @override
  String get settingsRecordingProfile => 'جودة التسجيل';

  @override
  String get settingsProfileStandard => 'قياسي · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'ذاكرة الحوادث المؤقتة';

  @override
  String settingsBufferSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds ثانية',
      many: '$seconds ثانية',
      few: '$seconds ثوانٍ',
      two: 'ثانيتان',
      one: 'ثانية واحدة',
      zero: '$seconds ثانية',
    );
    return '$_temp0';
  }

  @override
  String get settingsManualMaxLength => 'أقصى مدة للتسجيل اليدوي';

  @override
  String get settingsManualMaxUnlimited => 'غير محدودة';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes د';
  }

  @override
  String get settingsRecordAudio => 'تسجيل الصوت';

  @override
  String get settingsRecordAudioSubtitle =>
      'يشمل صوت المقصورة في الحوادث المحفوظة';

  @override
  String get settingsMicDenied =>
      'الوصول إلى الميكروفون متوقف. اسمح به من الإعدادات لتسجيل الصوت.';

  @override
  String get settingsWatermark => 'علامة Corvista المائية';

  @override
  String get settingsTimestamp => 'ختم التاريخ والوقت';

  @override
  String get settingsSaveLocation => 'حفظ الموقع مع المقاطع';

  @override
  String get settingsStorage => 'التخزين والمقاطع';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مقطع',
      many: '$count مقطعًا',
      few: '$count مقاطع',
      two: 'مقطعان',
      one: 'مقطع واحد',
      zero: 'لا توجد مقاطع',
    );
    return '$_temp0 · المستخدم $used · المتاح $free';
  }

  @override
  String get settingsRecordingFooter =>
      'تبقى الذاكرة المؤقتة المتجددة على iPhone لديك ويُعاد الكتابة فوقها باستمرار. لا يتم التسجيل في الخلفية.';

  @override
  String get settingsDefaultView => 'العرض الافتراضي';

  @override
  String get settingsUnits => 'الوحدات';

  @override
  String get settingsShowCompass => 'إظهار البوصلة';

  @override
  String get settingsHudStyle => 'نمط العرض الأمامي';

  @override
  String get settingsHudCustomize => 'تخصيص العرض الأمامي';

  @override
  String get settingsDrivingSide => 'جهة القيادة';

  @override
  String get settingsDrivingSideAuto => 'تلقائي';

  @override
  String get settingsDrivingSideRight => 'اليمين';

  @override
  String get settingsDrivingSideLeft => 'اليسار';

  @override
  String get settingsVirtualStyle => 'نمط العرض الافتراضي';

  @override
  String get settingsVirtualMinimal => 'مبسّط';

  @override
  String get settingsVirtualPerspective => 'منظوري';

  @override
  String get settingsVirtualHighContrast => 'تباين عالٍ';

  @override
  String get settingsKeepScreenOn => 'إبقاء الشاشة مضاءة أثناء القيادة';

  @override
  String get settingsLiveActivity => 'النشاط المباشر';

  @override
  String get settingsLiveActivityDesc =>
      'عرض الإرشادات خطوة بخطوة على شاشة القفل وفي Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'توقّف التسجيل مؤقتًا أثناء وجود Corvista في الخلفية';

  @override
  String get liveActivityRec => 'تسجيل';

  @override
  String get liveActivityPaused => 'متوقف مؤقتًا';

  @override
  String get liveActivityDashcamOff => 'الكاميرا متوقفة';

  @override
  String get liveActivityEnded => 'انتهت الملاحة';

  @override
  String get liveActivityEta => 'الوصول';

  @override
  String get settingsAutoRecenter => 'إعادة تمركز الخريطة تلقائيًا';

  @override
  String get settingsHudStyleClassic => 'كلاسيكي';

  @override
  String get settingsHudStyleGrid => 'شبكي';

  @override
  String get settingsHudStyleMinimal => 'مبسّط';

  @override
  String get settingsHudStylePerformance => 'الأداء';

  @override
  String get settingsHudStyleNavigation => 'الملاحة';

  @override
  String get settingsHudStyleNight => 'ليلي';

  @override
  String get settingsHudStyleHighContrast => 'تباين عالٍ';

  @override
  String get settingsPowerMode => 'وضع الطاقة';

  @override
  String get settingsPowerBalanced => 'متوازن';

  @override
  String get settingsPowerPerformance => 'الأداء';

  @override
  String get settingsPowerSaver => 'توفير الطاقة';

  @override
  String get settingsPowerFooter =>
      'يخفض Corvista معدل الذكاء الاصطناعي والمؤثرات البصرية تلقائيًا عندما ترتفع حرارة iPhone أو تنخفض البطارية.';

  @override
  String get settingsThermal => 'الحالة الحرارية';

  @override
  String get settingsThermalNominal => 'طبيعية';

  @override
  String get settingsThermalFair => 'دافئ';

  @override
  String get settingsThermalSerious => 'ساخن';

  @override
  String get settingsThermalCritical => 'حرجة';

  @override
  String get settingsBattery => 'البطارية';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · قيد الشحن';
  }

  @override
  String get settingsLowPowerMode =>
      'وضع الطاقة المنخفضة مفعّل — يعمل الذكاء الاصطناعي بمعدل أقل.';

  @override
  String get settingsAiRate => 'معدل الذكاء الاصطناعي الحالي';

  @override
  String settingsHzValue(String value) {
    return '$value هرتز';
  }

  @override
  String get settingsEmergencySetup => 'كشف الاصطدام';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'مفعّل · عدّ تنازلي $seconds ث';
  }

  @override
  String get settingsEmergencyFooter => 'تجريبي. ليس بديلًا عن خدمات الطوارئ.';

  @override
  String get settingsTheme => 'السمة';

  @override
  String get settingsThemeSystem => 'النظام';

  @override
  String get settingsThemeDark => 'داكنة';

  @override
  String get settingsThemeLight => 'فاتحة';

  @override
  String get settingsReduceMotion => 'تقليل الحركة';

  @override
  String get settingsReduceMotionSubtitle => 'يقلل الحركات في أرجاء التطبيق';

  @override
  String get settingsAppLanguage => 'لغة التطبيق';

  @override
  String get settingsPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get settingsTerms => 'شروط الاستخدام';

  @override
  String get settingsHelp => 'المساعدة';

  @override
  String get settingsSupport => 'التواصل مع الدعم';

  @override
  String get settingsLicenses => 'تراخيص المصدر المفتوح';

  @override
  String get settingsSupportUnavailable =>
      'تعذّر فتح البريد. راسل support@corvista.app.';

  @override
  String get settingsSafety => 'معلومات السلامة';

  @override
  String get settingsDiagnostics => 'التشخيص';

  @override
  String get settingsVersion => 'الإصدار';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'تخصيص العرض الأمامي';

  @override
  String get hudCustomPreview => 'معاينة · قيم تجريبية';

  @override
  String get hudCustomStyle => 'النمط';

  @override
  String get hudCustomElements => 'العناصر';

  @override
  String get hudCustomSpeed => 'السرعة';

  @override
  String get hudCustomHeading => 'الاتجاه والبوصلة';

  @override
  String get hudCustomClock => 'الساعة';

  @override
  String get hudCustomBattery => 'البطارية والحرارة';

  @override
  String get hudCustomDetections => 'حالة الذكاء الاصطناعي والكشف';

  @override
  String get hudCustomWeather => 'الطقس';

  @override
  String get hudCustomAppearance => 'الحجم والشفافية';

  @override
  String get hudCustomSize => 'الحجم';

  @override
  String get hudCustomOpacity => 'الشفافية';

  @override
  String get hudCustomFooter =>
      'تظهر التحذيرات مثل ارتفاع الحرارة دائمًا، حتى عند إخفاء العناصر.';

  @override
  String get hudCustomDescClassic => 'لوحة عدادات متوازنة';

  @override
  String get hudCustomDescGrid => 'شبكة منظورية فوق الطريق';

  @override
  String get hudCustomDescMinimal => 'السرعة فقط دون غيرها';

  @override
  String get hudCustomDescPerformance => 'قوس السرعة مع قراءات مباشرة';

  @override
  String get hudCustomDescNavigation => 'المناورة التالية أولًا';

  @override
  String get hudCustomDescNight => 'خافت ومائل إلى الأحمر للقيادة الليلية';

  @override
  String get hudCustomDescHighContrast => 'أقصى وضوح تحت الشمس الساطعة';

  @override
  String get languageTitle => 'اللغة';

  @override
  String get languageSystem => 'افتراضي النظام';

  @override
  String get languageSystemSubtitle => 'اتباع لغة iPhone';

  @override
  String get languageFooter =>
      'المزيد من اللغات قريبًا. يمكن ضبط لغة التنبيهات الصوتية بشكل منفصل ضمن التنبيهات.';

  @override
  String get diagTitle => 'التشخيص';

  @override
  String get diagPerformance => 'الأداء';

  @override
  String get diagInference => 'وقت الاستدلال';

  @override
  String get diagDetectHz => 'معدل الكشف';

  @override
  String get diagCameraFps => 'معدل إطارات الكاميرا';

  @override
  String get diagMemory => 'الذاكرة';

  @override
  String get diagDropped => 'الإطارات المفقودة';

  @override
  String get diagSegmentation => 'وقت التجزئة';

  @override
  String get diagCamera => 'الكاميرا';

  @override
  String get diagStatus => 'الحالة';

  @override
  String get diagSource => 'المصدر';

  @override
  String get diagSourceCamera => 'الكاميرا المباشرة';

  @override
  String get diagSourceFile => 'ملف لقطات اختبار';

  @override
  String get diagResolution => 'حجم الذاكرة المؤقتة';

  @override
  String get diagLens => 'العدسة';

  @override
  String get diagError => 'آخر خطأ';

  @override
  String get diagModel => 'نموذج الذكاء الاصطناعي';

  @override
  String get diagModelLoad => 'وقت تحميل النموذج';

  @override
  String get diagPower => 'الطاقة';

  @override
  String get diagSegHz => 'معدل التجزئة';

  @override
  String get diagReduced => 'مؤثرات مخفّضة';

  @override
  String diagMs(String value) {
    return '$value مللي ثانية';
  }

  @override
  String diagFps(String value) {
    return '$value إطار/ث';
  }

  @override
  String diagMb(String value) {
    return '$value ميغابايت';
  }

  @override
  String get diagCamIdle => 'خاملة';

  @override
  String get diagCamStarting => 'قيد البدء';

  @override
  String get diagCamRunning => 'تعمل';

  @override
  String get diagCamInterrupted => 'متوقفة مؤقتًا';

  @override
  String get diagCamStopped => 'متوقفة';

  @override
  String get diagCamUnavailable => 'غير متاحة';

  @override
  String get diagCamPermissionDenied => 'تم رفض الإذن';

  @override
  String get diagCamError => 'خطأ';

  @override
  String get diagTestFootage => 'لقطات اختبار';

  @override
  String get diagTestFootageBody =>
      'شغّل الكشف الفعلي على الجهاز باستخدام ملف فيديو محلي بدلًا من الكاميرا. تُوسَم كل العروض بعبارة «لقطات اختبار».';

  @override
  String get diagPathLabel => 'مسار ملف الفيديو';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'استخدام Documents/test_drive.mp4';

  @override
  String get diagRun => 'تشغيل لقطات الاختبار';

  @override
  String get diagRunStarted =>
      'بدأت لقطات الاختبار. افتح عرض القيادة لمشاهدتها.';

  @override
  String get diagBackToCamera => 'العودة إلى الكاميرا المباشرة';

  @override
  String get diagDebugOnly => 'لقطات الاختبار متاحة في إصدارات التطوير فقط.';

  @override
  String get diagFileMissing => 'لا يوجد ملف في هذا المسار.';

  @override
  String get emergencySetupTitle => 'كشف الاصطدام';

  @override
  String get emergencyExperimental => 'تجريبي';

  @override
  String get emergencyIntro =>
      'أثناء القيادة، يمكن لـ Corvista رصد اصطدام شديد محتمل باستخدام مستشعرات الحركة في iPhone. عند رصده يبدأ عدّ تنازلي. إذا لم تلغِه، يعرض Corvista الاتصال بخدمات الطوارئ ومراسلة جهات اتصالك.';

  @override
  String get emergencyDisclaimer1 =>
      'ليس بديلًا عن خدمات الطوارئ أو عن نظام كشف الحوادث في مركبتك.';

  @override
  String get emergencyDisclaimer2 =>
      'يطلب منك iOS دائمًا التأكيد قبل إجراء اتصال أو إرسال رسالة.';

  @override
  String get emergencyDisclaimer3 =>
      'قد لا يتم رصد بعض الاصطدامات، وقد يُخلط بين الفرملة القوية أو المطبات وبين الاصطدام.';

  @override
  String get emergencyParkedWarning =>
      'أكمل هذا الإعداد والمركبة متوقفة. الإعدادات مقفلة أثناء حركة المركبة.';

  @override
  String get emergencyEnable => 'تفعيل كشف الاصطدام';

  @override
  String get emergencyEnableSubtitle => 'يعمل أثناء جلسة القيادة فقط';

  @override
  String get emergencyNeedNumber => 'أضف رقم طوارئ أولًا.';

  @override
  String get emergencyContacts => 'جهات اتصال الطوارئ';

  @override
  String get emergencyAddContact => 'إضافة جهة اتصال';

  @override
  String get emergencyNoContacts =>
      'لا توجد جهات اتصال بعد. لا تتلقى جهات الاتصال رسالة إلا بعد تأكيدك.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'إزالة $name؟';
  }

  @override
  String get emergencyRemoveContactBody => 'لن تُعرض كمستلم بعد أي اصطدام.';

  @override
  String get emergencyRemove => 'إزالة';

  @override
  String get emergencyContactsError => 'تعذّر تحميل جهات الاتصال.';

  @override
  String get emergencyNumber => 'رقم الطوارئ';

  @override
  String get emergencyNumberHint => 'مثال: 112 أو 911';

  @override
  String get emergencyMessage => 'قالب الرسالة';

  @override
  String get emergencyMessageDefault =>
      'ربما تعرضت لحادث مركبة. أُعدّت هذه الرسالة بواسطة Corvista وتتضمن آخر موقع معروف لي إن توفر.';

  @override
  String get emergencyMessageHint =>
      'اتركه فارغًا لاستخدام الرسالة الافتراضية.';

  @override
  String get emergencyCountdown => 'مدة العدّ التنازلي';

  @override
  String get emergencyVoiceCancel => 'الإلغاء بالصوت';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'قل «أنا بخير» أو «إلغاء» أثناء العدّ التنازلي. يستخدم التعرّف على الكلام على الجهاز حيثما توفر.';

  @override
  String get emergencyVoicePermDenied =>
      'يلزم الوصول إلى الميكروفون والتعرّف على الكلام للإلغاء بالصوت.';

  @override
  String get emergencyAutoSave => 'حفظ مقطع الحادث تلقائيًا';

  @override
  String get emergencyTest => 'اختبار العدّ التنازلي (دون اتصال)';

  @override
  String get emergencyTestBody =>
      'يشغّل اصطدامًا تجريبيًا لتشاهد العدّ التنازلي. لا يتم أي اتصال أو إرسال رسالة في وضع الاختبار.';

  @override
  String get emergencyNotSet => 'غير محدد';

  @override
  String get emergencyAlertHeadline => 'تم رصد اصطدام شديد محتمل.';

  @override
  String get emergencyAlertSubtitle => 'هل أنت بخير؟';

  @override
  String get emergencyAlertCancel => 'أنا بخير — إلغاء';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'تبقّت $seconds ثانية',
      many: 'تبقّت $seconds ثانية',
      few: 'تبقّت $seconds ثوانٍ',
      two: 'تبقّت ثانيتان',
      zero: 'تبقّت $seconds ثانية',
      one: 'تبقّت ثانية واحدة',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => 'جارٍ الاستماع — قل «أنا بخير» للإلغاء';

  @override
  String emergencyAlertHeard(String text) {
    return 'ما سُمع: “$text”';
  }

  @override
  String get emergencyAlertEscalated => 'لا استجابة. اختر الإجراء:';

  @override
  String get emergencyAlertCall => 'الاتصال بخدمات الطوارئ';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'يتصل بالرقم $number. سيطلب منك iOS التأكيد.';
  }

  @override
  String get emergencyAlertMessage => 'مراسلة جهات الاتصال';

  @override
  String get emergencyAlertMessageSubtitle =>
      'يفتح رسالة جاهزة. أنت من يقرر إرسالها.';

  @override
  String get emergencyAlertTestMode => 'وضع الاختبار — لن يتم إجراء أي اتصال';

  @override
  String get emergencyAlertTestBadge => 'اختبار';

  @override
  String get emergencyAlertClose => 'أنا بخير — إغلاق';

  @override
  String get emergencyMsgSent => 'تم إرسال الرسالة.';

  @override
  String get emergencyMsgCancelled => 'لم يتم إرسال الرسالة.';

  @override
  String get emergencyMsgFailed => 'تعذّر إرسال الرسالة.';

  @override
  String get emergencyMsgUnavailable => 'المراسلة غير متاحة على هذا الجهاز.';

  @override
  String emergencyCallFailed(String number) {
    return 'تعذّر بدء الاتصال. اتصل بالرقم $number بنفسك.';
  }

  @override
  String get modelsTitle => 'نماذج الذكاء الاصطناعي';

  @override
  String get modelsIntro =>
      'جميع النماذج مضمّنة مع التطبيق وتعمل بالكامل على iPhone لديك. لا يغادر بث الكاميرا الجهاز أبدًا.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'مباشر: $ms مللي ثانية لكل إطار · $hz عملية كشف/ث';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'تم التحميل خلال $ms مللي ثانية';
  }

  @override
  String get modelsEfficientName => 'الموفّر';

  @override
  String get modelsEfficientDesc =>
      'كاشف سريع وخفيف مضبوط للرحلات الطويلة بحرارة واستهلاك بطارية منخفضين.';

  @override
  String get modelsEnhancedName => 'المحسّن';

  @override
  String get modelsEnhancedDesc =>
      'كاشف أكبر يرصد الكائنات الأصغر والأبعد، مقابل استهلاك أعلى للطاقة.';

  @override
  String get modelsSegmentationName => 'التجزئة';

  @override
  String get modelsSegmentationDesc =>
      'يجمع بين الكشف السريع وأقنعة سطح الطريق والكائنات لعرض الإدراك.';

  @override
  String get modelsNoneName => 'الذكاء الاصطناعي متوقف مؤقتًا';

  @override
  String get modelsNoneDesc =>
      'تستمر الكاميرا والتسجيل بالعمل دون كشف الكائنات. أقل استهلاك للطاقة.';

  @override
  String get modelsGenericDesc => 'نموذج لكشف الكائنات على الجهاز.';

  @override
  String get modelsFunctionDetection =>
      'يكشف المركبات والأشخاص والدراجات الهوائية والنارية والحافلات وإشارات المرور وعلامات التوقف';

  @override
  String get modelsFunctionSegmentation => 'يضيف أقنعة لسطح الطريق والكائنات';

  @override
  String get modelsFunctionNone => 'بلا كشف؛ تسجيل كاميرا السيارة فقط';

  @override
  String get modelsSize => 'الحجم';

  @override
  String get modelsInput => 'الدخل';

  @override
  String modelsInputValue(String size) {
    return '$size × $size بكسل';
  }

  @override
  String get modelsViews => 'يعمل مع';

  @override
  String get modelsStatusInstalled => 'مثبّت (مضمّن)';

  @override
  String get modelsStatusNotInstalled => 'غير مثبّت';

  @override
  String get modelsSelected => 'محدد';

  @override
  String get modelsUse => 'استخدام هذا النموذج';

  @override
  String get modelsSwitching => 'جارٍ تحميل النموذج…';

  @override
  String modelsSwitched(String name) {
    return 'تم تفعيل $name';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'تم القياس على هذا الجهاز: متوسط $ms مللي ثانية';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'لم يُقَس على هذا الجهاز';

  @override
  String get modelsBenchmarkRun => 'تشغيل اختبار الأداء';

  @override
  String get modelsBenchmarkRunning => 'جارٍ اختبار الأداء…';

  @override
  String get modelsBenchmarkSelectHint => 'حدّد هذا النموذج لاختباره.';

  @override
  String get modelsBenchmarkDone => 'اكتمل اختبار الأداء';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'فشل اختبار الأداء: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'آخر تحديث: $date';
  }

  @override
  String get safetyTitle => 'معلومات السلامة';

  @override
  String get safetyIntro =>
      'Corvista أداة مساعدة للوعي أثناء القيادة. لا يتحكم في مركبتك ولا يغني عن انتباهك وتقديرك الشخصي أو عن أنظمة السلامة في المركبة.';

  @override
  String get safetyBeforeTitle => 'قبل القيادة';

  @override
  String get safetyBefore1 =>
      'ثبّت iPhone بإحكام في موضع قانوني لا يحجب الرؤية أو الوسائد الهوائية أو أدوات التحكم.';

  @override
  String get safetyBefore2 =>
      'أكمل الإعداد واختر العرض وحدّد وجهتك أثناء التوقف.';

  @override
  String get safetyBefore3 =>
      'صِل الشاحن في الرحلات الطويلة وأبقِ الهاتف بعيدًا عن أشعة الشمس المباشرة قدر الإمكان.';

  @override
  String get safetyWhileTitle => 'أثناء القيادة';

  @override
  String get safetyWhile1 =>
      'أبقِ عينيك على الطريق. استخدم عناصر التحكم الكبيرة على الشاشة فقط عندما يكون ذلك آمنًا وقانونيًا.';

  @override
  String get safetyWhile2 =>
      'التنبيهات وسائل مساعدة وليست تحذيرات يمكن الاعتماد عليها. الصمت لا يعني أبدًا أن الطريق خالٍ.';

  @override
  String get safetyWhile3 =>
      'اتبع قوانين المرور والإشارات واللافتات، لا التطبيق، عند اختلافها.';

  @override
  String get safetyLimitsTitle => 'القيود';

  @override
  String get safetyLimits1 =>
      'كاميرا الهاتف الواحدة ترى ما أمامها فقط. لا يتم كشف الكائنات الواقعة خارج مجال رؤيتها أو المحجوبة أو القريبة جدًا.';

  @override
  String get safetyLimits2 =>
      'قد يفوت الكشف بعض الكائنات أو يتأخر أو يخطئ، خصوصًا ليلًا أو في المطر أو الضباب أو الوهج أو مع زجاج أمامي متّسخ.';

  @override
  String get safetyLimits3 =>
      'يتم التعرّف على الفئات المدعومة فقط: المركبات والحافلات والدراجات النارية والدراجات الهوائية والأشخاص وإشارات المرور وعلامات التوقف. إشارات المسار في العرض الافتراضي مرسومة بشكل توضيحي وليست مسارات تم كشفها.';

  @override
  String get safetyLimits4 =>
      'تُعرض المسافة كمناطق تقريبية (قريب جدًا، قريب، متوسط، بعيد) وليس كمسافات مقيسة. عرض الركن ليس بديلًا عن حساسات الركن.';

  @override
  String get safetyHeatTitle => 'الحرارة والبطارية';

  @override
  String get safetyHeat1 =>
      'يؤدي الاستخدام المتواصل للكاميرا والذكاء الاصطناعي إلى تسخين iPhone. يخفض Corvista معدل التحليل عندما يسخن الجهاز ويعرض تحذيرًا؛ وإذا سخّن iOS بشكل مفرط فقد تتوقف الكاميرا.';

  @override
  String get safetyEmergencyTitle => 'ميزة الطوارئ';

  @override
  String get safetyEmergency1 =>
      'كشف الاصطدام المحتمل ميزة تجريبية. قد لا يرصد حوادث اصطدام حقيقية، وقد يتفعّل بسبب أحداث أخرى.';

  @override
  String get safetyEmergency2 =>
      'لا يتصل بأحد دون علمك: يطلب iOS دائمًا تأكيد أي اتصال أو رسالة. وهو ليس بديلًا عن الاتصال بخدمات الطوارئ بنفسك.';

  @override
  String get privacyTitle => 'الخصوصية';

  @override
  String get privacyIntro =>
      'صُمم Corvista ليبقي بيانات قيادتك على iPhone لديك. لا يوجد حساب Corvista، ولا يشغّل Corvista خوادم خاصة به.';

  @override
  String get privacyCameraTitle => 'الكاميرا والذكاء الاصطناعي';

  @override
  String get privacyCamera1 =>
      'يعمل كشف الكائنات وتتبّعها وتجزئتها بالكامل على iPhone لديك. لا يتم رفع إطارات الكاميرا أبدًا.';

  @override
  String get privacyCamera2 =>
      'تعمل الكاميرا فقط أثناء ظهور Corvista على الشاشة. وتتوقف عند انتقال التطبيق إلى الخلفية؛ فلا يوجد تسجيل خفي في الخلفية.';

  @override
  String get privacyRecordingsTitle => 'التسجيلات';

  @override
  String get privacyRecordings1 =>
      'الذاكرة المؤقتة المتجددة مؤقتة ويُعاد الكتابة فوقها باستمرار. لا يُحفظ التسجيل إلا عند الضغط على «حفظ الحادث» أو، إذا فعّلت ذلك، بعد اصطدام محتمل.';

  @override
  String get privacyRecordings2 =>
      'تبقى المقاطع المحفوظة في مساحة التخزين الخاصة بـ Corvista على iPhone لديك. ولا تغادر الجهاز إلا عند اختيارك «مشاركة». حذف التطبيق يحذفها.';

  @override
  String get privacyRecordings3 =>
      'لا يُسجَّل الصوت إلا إذا فعّلته ومنحت إذن الميكروفون.';

  @override
  String get privacyLocationTitle => 'الموقع';

  @override
  String get privacyLocation1 =>
      'يُستخدم الموقع أثناء فتح التطبيق لعرض السرعة والخريطة والمسارات والطقس. إذا كان خيار «حفظ الموقع» مفعّلًا، يُخزَّن الموقع وقت الحفظ مع المقطع على جهازك.';

  @override
  String get privacyNetworkTitle => 'خدمات الشبكة';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — عرض الخريطة والبحث عن الأماكن والمسارات. يُرسَل نص البحث وموقعك التقريبي إلى Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — الطقس الحالي وبالساعة لموقعك.';

  @override
  String get privacyNetwork4 =>
      'لا يتضمن Corvista أي إعلانات ولا أي تحليلات أو تتبّع من جهات خارجية.';

  @override
  String get privacyEmergencyTitle => 'جهات اتصال الطوارئ';

  @override
  String get privacyEmergency1 =>
      'تُخزَّن جهات الاتصال التي تختارها في سلسلة مفاتيح iOS على هذا الجهاز. يستخدم الإلغاء بالصوت التعرّف على الكلام على الجهاز حيثما توفر. لا تُرسَل المكالمات والرسائل إلا بعد تأكيدك لها في iOS.';

  @override
  String get privacyControlsTitle => 'خياراتك';

  @override
  String get privacyControls1 =>
      'يمكنك حذف المقاطع في أي وقت من «المقاطع»، وتغيير أو سحب إذن الكاميرا والميكروفون والموقع والكلام من إعدادات iOS.';

  @override
  String get termsTitle => 'شروط الاستخدام';

  @override
  String get termsIntro =>
      'باستخدامك Corvista فإنك توافق على هذه الشروط. كما تسري اتفاقية ترخيص المستخدم النهائي القياسية للتطبيقات من Apple.';

  @override
  String get termsUseTitle => 'استخدام Corvista';

  @override
  String get termsUse1 =>
      'Corvista أداة مساعدة للوعي أثناء القيادة وكاميرا للسيارة. تظل مسؤولًا مسؤولية كاملة عن القيادة بأمان وبصورة قانونية في جميع الأوقات.';

  @override
  String get termsUse2 =>
      'لا تتفاعل مع التطبيق بطرق تشتّت انتباهك أثناء القيادة. ثبّت الجهاز بإحكام وبشكل قانوني.';

  @override
  String get termsAccuracyTitle => 'لا ضمانات للدقة';

  @override
  String get termsAccuracy1 =>
      'قد تكون عمليات الكشف والمناطق والتنبيهات وعلامات الخريطة والمسارات والطقس ناقصة أو متأخرة أو خاطئة. لا يتحكم Corvista في مركبتك.';

  @override
  String get termsAccuracy2 =>
      'ميزة الطوارئ تجريبية وقد لا ترصد اصطدامًا، أو قد تتفعّل دون سبب.';

  @override
  String get termsRecordingTitle => 'قوانين التسجيل';

  @override
  String get termsRecording1 =>
      'تختلف القوانين المتعلقة بكاميرات السيارات وتسجيل الصوت وتصوير الأشخاص من بلد إلى آخر ومن منطقة إلى أخرى. أنت مسؤول عن الالتزام بها، بما في ذلك عند مشاركة المقاطع.';

  @override
  String get termsLiabilityTitle => 'المسؤولية';

  @override
  String get termsLiability1 =>
      'يُقدَّم التطبيق «كما هو». وفي الحدود التي يسمح بها القانون، لا يتحمل المطوّر المسؤولية عن الحوادث أو الخسائر أو الغرامات أو الأضرار الناجمة عن استخدامه أو الاعتماد على مخرجاته.';

  @override
  String get termsChangesTitle => 'التغييرات';

  @override
  String get termsChanges1 =>
      'قد تُحدَّث هذه الشروط مع الإصدارات الجديدة من التطبيق. ويعني استمرارك في الاستخدام بعد التحديث قبولك للشروط المعدّلة.';

  @override
  String get helpTitle => 'المساعدة';

  @override
  String get helpIntro =>
      'إجابات عن الأسئلة الشائعة. للاطلاع على إرشادات السلامة، راجع «معلومات السلامة».';

  @override
  String get helpQSave => 'كيف أحتفظ بتسجيل حادث؟';

  @override
  String get helpASaveBuffer =>
      'اضغط على زر «حفظ الحادث» الكبير في شاشة القيادة. يحفظ Corvista آخر 20 أو 30 ثانية من ذاكرته المؤقتة المتجددة (حسب اختيارك في الإعدادات › التسجيل) في المقاطع.';

  @override
  String get helpQWhere => 'أين تُخزَّن مقاطعي؟';

  @override
  String get helpAWhere =>
      'في مساحة التخزين الخاصة بـ Corvista على iPhone لديك. لا يتم رفعها أبدًا. استخدم «مشاركة» في المشغّل لإرسال المقطع أو تصديره.';

  @override
  String get helpQZones => 'ما مدى دقة مناطق القرب؟';

  @override
  String get helpAZones =>
      'المناطق تقديرات تقريبية من كاميرا واحدة بالاعتماد على أحجام الكائنات المعتادة. تعامل معها كإشارات تقريبية وليس كمسافات.';

  @override
  String get helpQSlow => 'لماذا يبطؤ الكشف؟';

  @override
  String get helpASlow =>
      'عندما يسخن iPhone أو تنخفض البطارية أو يكون وضع الطاقة المنخفضة مفعّلًا، يخفض Corvista معدل التحليل لحماية الجهاز. يمكنك تغيير وضع الطاقة من الإعدادات.';

  @override
  String get helpQMap => 'الخريطة أو البحث أو الطقس لا يعمل.';

  @override
  String get helpAMap =>
      'تحتاج هذه الميزات إلى اتصال بالإنترنت وإذن الموقع. تحقق من اتصالك واسمح بالموقع لـ Corvista في إعدادات iOS.';

  @override
  String get helpQSimulator => 'تظهر الكاميرا على أنها غير متاحة.';

  @override
  String get helpASimulator =>
      'تأكد من السماح بالوصول إلى الكاميرا في إعدادات iOS وأن تطبيقًا آخر لا يستخدمها. لا توجد كاميرا في iOS Simulator؛ ويمكن استخدام فيديو اختبار محلي بدلًا منها.';

  @override
  String get emergencyMsgNoContacts => 'أضف جهة اتصال طوارئ أولًا.';

  @override
  String get cameraStarting => 'جارٍ تشغيل الكاميرا…';

  @override
  String get cameraInterrupted => 'الكاميرا متوقفة مؤقتًا';

  @override
  String get cameraInterruptedBody =>
      'أوقف iOS الكاميرا مؤقتًا، مثلًا أثناء مكالمة أو عند استخدام تطبيق آخر لها. ستستأنف تلقائيًا.';

  @override
  String get cameraUnavailable => 'الكاميرا غير متاحة';

  @override
  String get cameraUnavailableBody =>
      'لا توجد كاميرا متاحة على هذا الجهاز. تحتاج عروض الكشف والتسجيل والركن إلى الكاميرا الخلفية.';

  @override
  String get cameraRunTestFootage => 'تشغيل لقطات الاختبار';

  @override
  String get cameraPermissionDenied => 'الوصول إلى الكاميرا متوقف';

  @override
  String get cameraPermissionDeniedBody =>
      'يحتاج Corvista إلى الكاميرا للكشف وتسجيل كاميرا السيارة وعروض الركن. فعّل الوصول إلى الكاميرا من الإعدادات.';

  @override
  String get cameraError => 'خطأ في الكاميرا';

  @override
  String get cameraStopped => 'الكاميرا متوقفة';

  @override
  String get cameraStart => 'تشغيل الكاميرا';

  @override
  String get cameraFocusHint => 'اضغط للتركيز';

  @override
  String get cameraPreviewLabel => 'عرض مباشر للكاميرا مع الكائنات المكتشفة';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'الكاميرا $fps إطار/ث · الذكاء الاصطناعي $hz هرتز · $ms مللي ثانية · مفقود $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'السرعة $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'لا توجد سرعة GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'الاتجاه $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'تسجيل $secondsث';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'تسجيل الذاكرة المؤقتة لكاميرا السيارة، تم تخزين $seconds من $target ثانية';
  }

  @override
  String get hudRecIdle => 'التسجيل متوقف';

  @override
  String get hudRecSaving => 'جارٍ الحفظ…';

  @override
  String get hudRecError => 'خطأ في التسجيل';

  @override
  String get hudAiPaused => 'الذكاء الاصطناعي متوقف';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count كائن',
      many: '$count كائنًا',
      few: '$count كائنات',
      two: 'كائنان',
      one: 'كائن واحد',
      zero: 'لا كائنات',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم كشف $count كائن',
      many: 'تم كشف $count كائنًا',
      few: 'تم كشف $count كائنات',
      two: 'تم كشف كائنين',
      one: 'تم كشف كائن واحد',
      zero: 'لم يتم كشف أي كائن',
    );
    return 'نموذج الذكاء الاصطناعي $model، $_temp0';
  }

  @override
  String get hudThermalSerious => 'ساخن — الذكاء الاصطناعي أبطأ';

  @override
  String get hudThermalCritical => 'شديد السخونة — الذكاء الاصطناعي متوقف';

  @override
  String hudBatteryLow(String percent) {
    return 'البطارية $percent';
  }

  @override
  String get hudLowPower => 'وضع الطاقة المنخفضة';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'الطقس $temperature، $condition. اضغط للتفاصيل.';
  }

  @override
  String get hudNoGuidance =>
      'ابحث عن وجهة في عرض الخريطة لتظهر هنا الإرشادات خطوة بخطوة.';

  @override
  String get navArrived => 'لقد وصلت';

  @override
  String get navRerouting => 'جارٍ إعادة التوجيه…';

  @override
  String get navSearchHint => 'ابحث عن وجهة';

  @override
  String get navSearchFieldHint => 'عنوان أو مكان أو نشاط تجاري';

  @override
  String get navNoResults => 'لا توجد أماكن مطابقة';

  @override
  String get navSearching => 'جارٍ البحث…';

  @override
  String get navSearchStartTyping =>
      'اكتب عنوانًا أو اسم مكان. تأتي النتائج من Apple Maps وتتطلب اتصالًا بالإنترنت.';

  @override
  String get navErrorUnavailable =>
      'البحث والمسارات غير متاحة — تحقق من اتصالك بالإنترنت.';

  @override
  String get navErrorNoLocation => 'بانتظار تحديد موقعك لتخطيط المسار.';

  @override
  String get navErrorPermission =>
      'الوصول إلى الموقع متوقف، لذا لا يمكن بدء المسارات من موقعك.';

  @override
  String navErrorGeneric(String code) {
    return 'تعذّر تحميل المسارات ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'المسارات إلى $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'الوصول $time';
  }

  @override
  String get navStart => 'ابدأ';

  @override
  String get navEnd => 'إنهاء';

  @override
  String get navEndLabel => 'إنهاء الملاحة';

  @override
  String navRemaining(String distance, String duration) {
    return 'المتبقي $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'تنبيه: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes د',
      many: '$minutes د',
      few: '$minutes د',
      two: '$minutes د',
      zero: '$minutes د',
      one: '1 د',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours س $minutes د';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'المسار $index: $name';
  }

  @override
  String get weatherTitle => 'الطقس';

  @override
  String weatherFeelsLike(String temperature) {
    return 'الإحساس $temperature';
  }

  @override
  String get weatherPrecipitation => 'الهطول';

  @override
  String get weatherWind => 'الرياح';

  @override
  String get weatherVisibility => 'مدى الرؤية';

  @override
  String get weatherHumidity => 'الرطوبة';

  @override
  String get weatherHourly => 'الساعات القادمة';

  @override
  String weatherAsOf(String time) {
    return 'آخر تحديث $time';
  }

  @override
  String get weatherRefresh => 'تحديث الطقس';

  @override
  String get weatherUnavailable => 'الطقس غير متاح حاليًا.';

  @override
  String get weatherNoLocation => 'يحتاج الطقس إلى موقعك.';

  @override
  String get weatherLegal => 'مصادر البيانات والمعلومات القانونية';

  @override
  String weatherProvidedBy(String service) {
    return 'بيانات الطقس: $service';
  }

  @override
  String get weatherNow => 'الآن';

  @override
  String get virtualEmpty => 'لم يتم كشف أي كائنات مدعومة';

  @override
  String get virtualEmptyCameraOff =>
      'يحتاج العرض الافتراضي إلى الكاميرا المباشرة.';

  @override
  String get virtualLaneDisclaimer => 'خطوط المسار توضيحية وليست مكتشفة.';

  @override
  String virtualNearest(String zone) {
    return 'الأقرب: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'مشهد الطريق الافتراضي: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'الذكاء الاصطناعي $status';
  }

  @override
  String get virtualStatusLive => 'يعمل';

  @override
  String get virtualStatusPaused => 'متوقف مؤقتًا';

  @override
  String get virtualStatusCameraOff => 'الكاميرا متوقفة';

  @override
  String get virtualStatusTestFootage => 'لقطات اختبار';

  @override
  String get virtualEmptyHint =>
      'تظهر هنا المركبات والأشخاص والدراجات وإشارات المرور وعلامات التوقف عند اكتشافها.';

  @override
  String get mapRecenter => 'إعادة التمركز';

  @override
  String get mapZoomIn => 'تكبير';

  @override
  String get mapZoomOut => 'تصغير';

  @override
  String get mapUnsupported => 'الخريطة التفاعلية متاحة على iPhone.';

  @override
  String get mapObjectsApprox => 'علامات الكائنات مواضع تقريبية.';

  @override
  String get mapWeatherUnavailable => 'الطقس غير متاح';

  @override
  String get navErrorNoRoute => 'لم يتم العثور على مسار إلى هذه الوجهة.';

  @override
  String get navDismiss => 'إغلاق';

  @override
  String get navGo => 'انطلق';

  @override
  String get navFastest => 'الأسرع';

  @override
  String get navThen => 'ثم';

  @override
  String get navRecents => 'الأخيرة';

  @override
  String get navClearRecents => 'مسح';

  @override
  String get navSearchSubmitHint => 'اضغط على بحث لعرض كل الأماكن المطابقة';

  @override
  String get navPlaces => 'الأماكن';

  @override
  String get navEtaLabel => 'الوصول';

  @override
  String get navTimeLeftLabel => 'متبقٍ';

  @override
  String get navOverview => 'نظرة عامة';

  @override
  String get navMute => 'كتم الصوت';

  @override
  String get navUnmute => 'إلغاء كتم الصوت';

  @override
  String get navEndConfirm => 'إنهاء الملاحة؟';

  @override
  String navEndConfirmBody(String place) {
    return 'سيتوقف التوجيه إلى $place.';
  }

  @override
  String navArrivedAt(String place) {
    return 'لقد وصلت إلى $place';
  }

  @override
  String get navDone => 'تم';

  @override
  String get navWeakGps => 'إشارة GPS ضعيفة';

  @override
  String get navLocationOff => 'الموقع متوقف. فعّله لتخطيط المسارات والملاحة.';

  @override
  String get navVoiceGuidance => 'التوجيه الصوتي';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'بعد $distance، $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first، ثم $second';
  }

  @override
  String get navSpeakRerouting => 'جارٍ إعادة التوجيه';

  @override
  String get navSpeakArrived => 'لقد وصلت';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count متر',
      many: '$count مترًا',
      few: '$count أمتار',
      two: 'مترين',
      zero: '$count متر',
      one: 'متر واحد',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value كيلومتر',
      many: '$value كيلومترًا',
      few: '$value كيلومترات',
      two: 'كيلومترين',
      zero: '$value كيلومتر',
      one: 'كيلومتر واحد',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قدم',
      many: '$count قدمًا',
      few: '$count أقدام',
      two: 'قدمين',
      zero: '$count قدم',
      one: 'قدم واحدة',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ياردة',
      many: '$count ياردة',
      few: '$count ياردات',
      two: 'ياردتين',
      one: 'ياردة واحدة',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'تابع لمسافة $distance';
  }

  @override
  String get navErrorNoDirections =>
      'الاتجاهات غير متاحة لهذه الرحلة في هذه المنطقة. جرّب وجهة أخرى.';

  @override
  String navContinueFor(String distance) {
    return 'تابع لمسافة $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value ميل',
      many: '$value ميلًا',
      few: '$value أميال',
      two: 'ميلين',
      zero: '$value ميل',
      one: 'ميل واحد',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'الأقرب: $object · $zone';
  }

  @override
  String get parkingNothing => 'لا شيء مكتشف في مجال الرؤية';

  @override
  String get parkingBeeps => 'صفير القرب';

  @override
  String get parkingVolume => 'مستوى الصفير';

  @override
  String get parkingLimitations =>
      'كاميرا واحدة، وليست 360°. لا يتم كشف الكائنات خارج مجال الكاميرا. ليس بديلًا عن حساسات الركن؛ فقد تكون التقديرات خاطئة، والصمت لا يعني أن المنطقة خالية.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'عرض القرب من الأعلى. $summary';
  }

  @override
  String get perceptionModeOriginal => 'الأصلي';

  @override
  String get perceptionModeBoxes => 'المربعات';

  @override
  String get perceptionModeMasks => 'أقنعة الكائنات';

  @override
  String get perceptionModeRoad => 'سطح الطريق';

  @override
  String get perceptionModeCombined => 'مدمج';

  @override
  String get perceptionOpacity => 'شفافية القناع';

  @override
  String get perceptionDisclaimer =>
      'قناع سطح الطريق طبقة بصرية تقريبية. ولا يُظهر المساحة الصالحة للقيادة أو المسارات.';

  @override
  String get perceptionNeedsModel => 'اختر نموذج التجزئة لعرض الأقنعة.';

  @override
  String get perceptionChooseModel => 'اختيار النموذج';

  @override
  String get perceptionWaiting => 'بانتظار أول إطار تجزئة…';

  @override
  String get perceptionShortCamera => 'كاميرا';

  @override
  String get perceptionShortBoxes => 'مربعات';

  @override
  String get perceptionShortObjects => 'كائنات';

  @override
  String get perceptionShortRoad => 'طريق';

  @override
  String get perceptionShortAll => 'الكل';

  @override
  String get perceptionModesLabel => 'طبقات الإدراك';

  @override
  String get perceptionStatusWarmingUp => 'جارٍ التهيئة…';

  @override
  String get perceptionStatusLoadingModel => 'جارٍ تحميل النموذج…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps إطار/ث';
  }

  @override
  String get perceptionStatusPaused => 'الأقنعة متوقفة مؤقتًا';

  @override
  String get perceptionLegend => 'مفتاح الأقنعة';

  @override
  String get perceptionUnavailable => 'الأقنعة غير متاحة';

  @override
  String get driveSave => 'حفظ';

  @override
  String get driveSaveIncident => 'حفظ الحادث';

  @override
  String driveSaveHint(int seconds) {
    return 'يحفظ آخر $seconds ثانية من تسجيل كاميرا السيارة';
  }

  @override
  String get driveSaving => 'جارٍ حفظ الحادث…';

  @override
  String hudRecManualLabel(String time) {
    return 'جارٍ التسجيل، $time';
  }

  @override
  String get driveRecord => 'تسجيل';

  @override
  String get driveRecordStartA11y => 'بدء التسجيل';

  @override
  String driveRecordStopA11y(String time) {
    return 'إيقاف التسجيل، تم تسجيل $time';
  }

  @override
  String get driveRecordHint =>
      'يسجّل باستمرار حتى توقفه، بما في ذلك آخر 5 ثوانٍ';

  @override
  String get driveRecordFailed => 'تعذّر بدء التسجيل';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حفظ التسجيل · $count جزء',
      many: 'تم حفظ التسجيل · $count جزءًا',
      few: 'تم حفظ التسجيل · $count أجزاء',
      two: 'تم حفظ التسجيل · جزآن',
      one: 'تم حفظ التسجيل',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'توقّف التسجيل: المساحة شبه ممتلئة',
      'max_duration': 'توقّف التسجيل: تم بلوغ الحد الأقصى للمدة',
      'camera_stopped': 'توقّف التسجيل مع إيقاف الكاميرا',
      'background': 'توقّف التسجيل: انتقل التطبيق إلى الخلفية',
      'thermal': 'توقّف التسجيل: الهاتف ساخن جدًا',
      'other': 'توقّف التسجيل',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'تم حفظ الحادث · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'عرض';

  @override
  String get driveSaveFailed => 'تعذّر حفظ الحادث.';

  @override
  String get driveSaveNotRunning =>
      'لم يبدأ التسجيل بعد — انتظر تشغيل الكاميرا ثم أعد المحاولة.';

  @override
  String get driveSaveTestFootage =>
      'لا تُسجَّل لقطات الاختبار. يعمل حفظ الحوادث مع الكاميرا المباشرة.';

  @override
  String get driveSaveStorageFull =>
      'مساحة التخزين في iPhone ممتلئة. وفّر مساحة أو احذف مقاطع أقدم.';

  @override
  String get driveSaveIoError => 'تعذّرت كتابة المقطع في وحدة التخزين.';

  @override
  String get driveClips => 'المقاطع';

  @override
  String get driveSettings => 'الإعدادات';

  @override
  String get driveViewSwitcher => 'عروض القيادة';

  @override
  String get driveLocationDenied =>
      'الموقع متوقف — السرعة والخرائط والمسارات غير متاحة.';

  @override
  String get driveCameraDenied =>
      'الوصول إلى الكاميرا متوقف — الكشف والتسجيل غير متاحين.';

  @override
  String get driveRecorderFallback =>
      'التسجيل دون صوت: الوصول إلى الميكروفون متوقف.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'تم تعديل إعدادات التسجيل: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhone ساخن. يعمل الذكاء الاصطناعي بشكل أبطأ ليبرد — أبقِه بعيدًا عن الشمس المباشرة وقرب فتحة التهوية.';

  @override
  String get drivePowerThermalCritical =>
      'iPhone شديد السخونة. تم إيقاف كشف الذكاء الاصطناعي مؤقتًا حتى يبرد؛ ويستمر التسجيل إن أمكن.';

  @override
  String get drivePowerLowPower =>
      'وضع الطاقة المنخفضة مفعّل — يعمل الذكاء الاصطناعي بمعدل أقل.';

  @override
  String get drivePowerBatteryLow =>
      'البطارية منخفضة — صِل iPhone بالطاقة أثناء القيادة.';

  @override
  String get onboardingTitle1 => 'شاهد المزيد في كل رحلة.';

  @override
  String get onboardingBody1 =>
      'حوّل iPhone إلى كاميرا سيارة ذكية ورفيق للوعي أثناء القيادة.';

  @override
  String get onboardingTitle2 => 'ذكاء في كل إطار.';

  @override
  String get onboardingBody2 =>
      'تعرّف على المركبات والأشخاص والدراجات وإشارات الطريق المدعومة مباشرة على iPhone لديك.';

  @override
  String get onboardingTitle3 => 'طريق واحد. زوايا متعددة.';

  @override
  String get onboardingBody3 =>
      'تنقّل بين الكشف المباشر وعروض القيادة الافتراضية والخرائط التفاعلية وعرض الركن.';

  @override
  String get onboardingTitle4 => 'احتفظ بما يهمّ من اللحظات.';

  @override
  String get onboardingBody4 =>
      'احفظ تسجيلات كاميرا السيارة الأخيرة، وراجع الحوادث، وشارك التسجيلات.';

  @override
  String get onboardingTitle5 => 'السلامة والخصوصية';

  @override
  String get onboardingSafety1 =>
      'Corvista أداة مساعدة للوعي أثناء القيادة. أبقِ عينيك على الطريق.';

  @override
  String get onboardingSafety2 =>
      'لا يتحكم في مركبتك ولا يحل محل تقديرك الشخصي.';

  @override
  String get onboardingSafety3 =>
      'قد تكون عمليات الكشف والتقديرات غير دقيقة أو قد تفوتها بعض الأمور.';

  @override
  String get onboardingSafety4 =>
      'تتم معالجة الكاميرا على iPhone لديك — ولا يُرفع الفيديو.';

  @override
  String get onboardingSafety5 =>
      'تحتاج الخرائط والبحث والمسارات والطقس إلى اتصال بالإنترنت.';

  @override
  String get onboardingSafety6 => 'ثبّت iPhone بإحكام بحيث لا يحجب رؤيتك.';

  @override
  String get onboardingSafety7 => 'أكمل الإعداد قبل أن تبدأ القيادة.';

  @override
  String get onboardingAcknowledge =>
      'أدرك أن Corvista أداة مساعدة للوعي وأنني أظل مسؤولًا عن القيادة بأمان.';

  @override
  String get onboardingReadSafety => 'قراءة معلومات السلامة كاملة';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingAgree => 'متابعة';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'الصفحة $current من $total';
  }

  @override
  String get permTitle => 'الأذونات';

  @override
  String get permIntro =>
      'يطلب Corvista فقط ما تحتاجه كل ميزة. يمكنك تغيير ذلك في أي وقت من الإعدادات.';

  @override
  String get permCameraTitle => 'الكاميرا';

  @override
  String get permCameraBody =>
      'مطلوبة للكشف وتسجيل كاميرا السيارة وعرض الركن. تتم معالجة الفيديو على iPhone لديك.';

  @override
  String get permLocationTitle => 'الموقع';

  @override
  String get permLocationBody =>
      'يُستخدم لسرعة GPS والخريطة والمسارات والطقس ووسم المقاطع المحفوظة. فقط أثناء استخدامك التطبيق.';

  @override
  String get permMicTitle => 'الميكروفون';

  @override
  String get permSpeechNote =>
      'لا يُطلب إذن التعرّف على الكلام إلا إذا فعّلت الإلغاء بالصوت لتنبيهات الطوارئ.';

  @override
  String get permRequired => 'مطلوب';

  @override
  String get permOptional => 'اختياري';

  @override
  String get permAllow => 'سماح';

  @override
  String get permGranted => 'مسموح';

  @override
  String get permDenied => 'مرفوض';

  @override
  String get permLimited => 'محدود';

  @override
  String get permRestricted => 'مقيّد';

  @override
  String get permStart => 'ابدأ القيادة';

  @override
  String get permCameraNeeded =>
      'يمكنك المتابعة دون الوصول إلى الكاميرا، لكن الكشف والتسجيل لن يعملا حتى تسمح به من الإعدادات.';

  @override
  String get permSetupIntro =>
      'يحتاج Corvista إلى هذه الأذونات ليعمل بالكامل. اضغط «السماح للكل» وسيطلب iOS كل إذن على حدة. يمكنك تغييرها في أي وقت من الإعدادات.';

  @override
  String get permCameraLine =>
      'مطلوبة للكشف وتسجيل كاميرا السيارة وعرض الركن. تتم معالجة الفيديو على iPhone ولا يُرفع أبدًا.';

  @override
  String get permLocationLine =>
      'سرعة GPS والخريطة والمسارات والطقس وأماكن حفظ المقاطع. فقط أثناء استخدامك للتطبيق.';

  @override
  String get permMicLine =>
      'صوت المقصورة في مقاطع الحوادث، والاستماع إلى عبارة الإلغاء أثناء تنبيه الطوارئ.';

  @override
  String get permSpeechTitle => 'التعرّف على الكلام';

  @override
  String get permSpeechLine =>
      'يتعرّف على عبارة الإلغاء أثناء العدّ التنازلي للطوارئ، على iPhone حيثما كان ذلك مدعومًا.';

  @override
  String get permAllowAll => 'السماح للكل';

  @override
  String permAsking(String permission) {
    return 'جارٍ طلب إذن $permission…';
  }

  @override
  String get permSomeDenied =>
      'بعض الأذونات متوقفة. فعّلها من الإعدادات لاستخدام هذه الميزات.';

  @override
  String get permNotNow => 'ليس الآن';

  @override
  String get tourLabel => 'جولة في شاشة القيادة';

  @override
  String tourProgress(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get tourNext => 'التالي';

  @override
  String get tourBack => 'رجوع';

  @override
  String get tourSkip => 'تخطّي الجولة';

  @override
  String get tourFinish => 'ابدأ القيادة';

  @override
  String get tourWelcomeTitle => 'جولتك السريعة';

  @override
  String get tourWelcomeBody =>
      'نظرة سريعة خلال دقيقة على أهم ما في شاشة القيادة. يُفضّل إجراؤها أثناء التوقف.';

  @override
  String get tourHudTitle => 'شريط القياسات';

  @override
  String get tourHudSpeed => 'تأتي السرعة من GPS.';

  @override
  String get tourHudRec => 'يعرض REC عدد ثواني اللقطات المخزّنة مؤقتًا.';

  @override
  String get tourHudAi =>
      'تعرض شارة الذكاء الاصطناعي النموذج وعدد الكائنات التي يراها ونقطة: خضراء تعني يعمل، وكهرمانية محدود، وحمراء متوقف.';

  @override
  String get tourSaveTitle => 'حفظ الحادث';

  @override
  String tourSaveBody(int seconds) {
    return 'يحتفظ Corvista بذاكرة مؤقتة متجددة لآخر $seconds ثانية من الفيديو. يُعاد الكتابة فوقها باستمرار، فلا يُحفظ شيء ما لم تضغط «حفظ». تبقى المقاطع المحفوظة على iPhone هذا، في «المقاطع».';
  }

  @override
  String get tourRecordTitle => 'سجّل الرحلة كاملة';

  @override
  String get tourRecordBody =>
      'اضغط «تسجيل» للتصوير باستمرار حتى توقفه. تُحفظ الرحلات الطويلة في المقاطع على شكل أجزاء مدة كل منها 5 دقائق، ويستمر عمل «حفظ الحادث» أثناء التسجيل.';

  @override
  String get tourViewsTitle => 'خمس طرق لرؤية الطريق';

  @override
  String get tourViewDetection =>
      'الكاميرا المباشرة مع مربعات حول الكائنات المدعومة.';

  @override
  String get tourViewVirtual =>
      'مشهد ثلاثي الأبعاد مبسّط مبني على نتائج الكشف.';

  @override
  String get tourViewMap => 'خرائط Apple مع البحث والإرشاد خطوة بخطوة.';

  @override
  String get tourViewParking => 'الكاميرا مع عرض علوي للمسافات القريبة.';

  @override
  String get tourViewPerception => 'أقنعة للطريق والكائنات.';

  @override
  String get tourMapTitle => 'البحث والإرشاد خطوة بخطوة';

  @override
  String get tourMapBody =>
      'افتح الخريطة، واضغط شريط البحث، واختر وجهتك. اختر مسارًا ثم اضغط «ابدأ» للإرشاد خطوة بخطوة. يتطلب اتصالًا بالإنترنت.';

  @override
  String get tourClipsTitle => 'المقاطع';

  @override
  String get tourClipsBody =>
      'راجع الحوادث المحفوظة أو أعد تسميتها أو شاركها أو احذفها. تبقى المقاطع على iPhone ما لم تشاركها.';

  @override
  String get tourSettingsTitle => 'الإعدادات';

  @override
  String get tourSettingsBody =>
      'اضبط التنبيهات الصوتية وحساسيتها وجودة التسجيل ومدة الذاكرة المؤقتة، وأعدّ وضع الطوارئ: تنبيه تجريبي عند الاصطدام مع عدّ تنازلي للإلغاء.';

  @override
  String get tourSafetyTitle => 'قبل أن تقود';

  @override
  String get tourSafety1 => 'ثبّت iPhone بإحكام في مكان لا يحجب رؤيتك.';

  @override
  String get tourSafety2 =>
      'لا تتفاعل مع التطبيق أثناء القيادة. أجرِ الإعدادات وأنت متوقف.';

  @override
  String get tourSafety3 =>
      'عمليات الكشف والمناطق تقديرية. قد تكون خاطئة أو قد تفوتها بعض الحالات.';

  @override
  String get tourSafety4 => 'تبقى مسؤولًا عن القيادة بأمان.';

  @override
  String get helpTakeTour => 'ابدأ الجولة';

  @override
  String get helpTakeTourSub => 'جولة إرشادية في شاشة القيادة خلال دقيقة.';

  @override
  String get tripsTitle => 'الرحلات';

  @override
  String get tripsOpen => 'سجل الرحلات';

  @override
  String get tripsEmptyTitle => 'لا توجد رحلات بعد';

  @override
  String get tripsEmptyBody =>
      'تُسجَّل الرحلات تلقائيًا أثناء قيادتك مع Corvista، بما في ذلك المسافة والوقت والسرعة والمسار الذي سلكته.';

  @override
  String get tripsDisabledBody =>
      'سجل الرحلات متوقف، لذا لا تُسجَّل الرحلات الجديدة. فعّله للاحتفاظ بسجل خاص لمساراتك على iPhone هذا.';

  @override
  String get tripsEnable => 'تفعيل سجل الرحلات';

  @override
  String get tripsToday => 'اليوم';

  @override
  String get tripsYesterday => 'أمس';

  @override
  String tripsRecordingNow(String distance) {
    return 'تسجيل رحلة · $distance';
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
      other: '$count حادث',
      many: '$count حادثًا',
      few: '$count حوادث',
      two: 'حادثان',
      one: 'حادث واحد',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تنبيه',
      many: '$count تنبيهًا',
      few: '$count تنبيهات',
      two: 'تنبيهان',
      one: 'تنبيه واحد',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رحلة',
      many: '$count رحلة',
      few: '$count رحلات',
      two: 'رحلتان',
      one: 'رحلة واحدة',
      zero: 'لا رحلات',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'المسافة';

  @override
  String get tripsStatDuration => 'المدة';

  @override
  String get tripsStatMoving => 'وقت الحركة';

  @override
  String get tripsStatAvgSpeed => 'متوسط السرعة';

  @override
  String get tripsStatMaxSpeed => 'أقصى سرعة';

  @override
  String get tripsDetections => 'عمليات الكشف';

  @override
  String get tripsNoDetections =>
      'لم تُسجَّل أي كائنات على الطريق في هذه الرحلة.';

  @override
  String get tripsTimeline => 'الخط الزمني';

  @override
  String get tripsEventStart => 'بدأت الرحلة';

  @override
  String get tripsEventEnd => 'انتهت الرحلة';

  @override
  String get tripsEventAlert => 'تنبيه صوتي';

  @override
  String get tripsEventIncident => 'تم حفظ مقطع حادث';

  @override
  String get tripsEventEmergency => 'رُصد اصطدام محتمل';

  @override
  String get tripsEventNavStart => 'بدأ الإرشاد';

  @override
  String get tripsEventArrive => 'تم الوصول إلى الوجهة';

  @override
  String get tripsEventReroute => 'أُعيد حساب المسار';

  @override
  String get tripsEventRecording => 'تم حفظ التسجيل';

  @override
  String get tripsOpenClip => 'فتح المقطع';

  @override
  String get tripsTrackPreview => 'مسار GPS';

  @override
  String get tripsRenameTitle => 'إعادة تسمية الرحلة';

  @override
  String get tripsRenameHint => 'اسم الرحلة';

  @override
  String get tripsFavorite => 'إضافة إلى المفضلة';

  @override
  String get tripsUnfavorite => 'إزالة من المفضلة';

  @override
  String get tripsShareGpx => 'مشاركة GPX';

  @override
  String get tripsShareFailed => 'تعذّرت مشاركة هذه الرحلة.';

  @override
  String get tripsDelete => 'حذف الرحلة';

  @override
  String get tripsDeleteConfirmTitle => 'حذف هذه الرحلة؟';

  @override
  String get tripsDeleteConfirmBody =>
      'سيُحذف المسار والإحصاءات من iPhone هذا. تبقى مقاطع الحوادث من هذه الرحلة محفوظة.';

  @override
  String get tripsDeleted => 'تم حذف الرحلة';

  @override
  String get tripsNotFound => 'هذه الرحلة لم تعد متاحة.';

  @override
  String get tripsPrivacyNote => 'محفوظة على iPhone هذا فقط. لا يُرفع أي شيء.';

  @override
  String get settingsSectionTrips => 'سجل الرحلات';

  @override
  String get settingsTripLog => 'تسجيل الرحلات';

  @override
  String get settingsTripLogSubtitle =>
      'يحتفظ بمسارك وإحصاءات قيادتك على iPhone هذا فقط.';

  @override
  String get settingsTripRetention => 'الاحتفاظ بالرحلات لمدة';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days يوم',
      many: '$days يومًا',
      few: '$days أيام',
      two: 'يومان',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => 'سنة واحدة';

  @override
  String get settingsRetentionForever => 'دائمًا';

  @override
  String get settingsTripRetentionFooter =>
      'تُحذف الرحلات الأقدم تلقائيًا عند تشغيل Corvista.';

  @override
  String get settingsViewTrips => 'عرض الرحلات';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours س $minutes د';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes د';
  }

  @override
  String tripsGpxName(String date) {
    return 'رحلة Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'تحرير مساحة';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'يزيل الملفات المؤقتة وذاكرة التخزين المؤقت. تبقى المقاطع والرحلات المحفوظة.';

  @override
  String settingsFreedBytes(String size) {
    return 'تم تحرير $size';
  }

  @override
  String get settingsNothingToFree =>
      'تم مسح ذاكرة التخزين المؤقت — لا توجد ملفات مؤقتة لإزالتها.';

  @override
  String get settingsSectionPrivacyData => 'الخصوصية والبيانات';

  @override
  String get settingsPrivacyDataFooter =>
      'تُخزَّن المقاطع والرحلات والإعدادات على هذا iPhone فقط. ولا تغادره إلا عندما تختار مشاركتها.';

  @override
  String get settingsDeleteAllData => 'حذف جميع البيانات';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'مسح المقاطع والرحلات وجهات الاتصال والإعدادات من هذا iPhone';

  @override
  String get deleteAllTitle => 'حذف جميع البيانات؟';

  @override
  String get deleteAllMessage =>
      'سيؤدي هذا إلى إزالة ما يلي من هذا iPhone بشكل دائم:\n• مقاطع الحوادث وصورها المصغرة\n• سجل الرحلات ومسارات GPS\n• جهات اتصال الطوارئ وأحداث الطوارئ\n• سجلات الكشف وسجل التشخيص\n• الإعدادات والوجهات الأخيرة\n• الذاكرة المؤقتة للتسجيل والتخزين المؤقت\n\nلا يمكن التراجع عن هذا الإجراء. بعد ذلك سيبدأ Corvista من جديد من شاشات الترحيب.';

  @override
  String get deleteAllConfirm => 'حذف كل شيء';

  @override
  String get deleteAllInProgress => 'جارٍ الحذف…';

  @override
  String get deleteAllDone => 'تم حذف جميع البيانات';

  @override
  String get deleteAllPartial =>
      'تعذّر حذف بعض العناصر. أعد المحاولة من الإعدادات.';

  @override
  String get diagLogSection => 'سجل التشخيص';

  @override
  String get diagLogFooter =>
      'تُسجَّل الأخطاء على هذا iPhone فقط، دون المواقع أو أسماء جهات الاتصال أو أرقام الهواتف. لا يُرسَل أي شيء ما لم تشارك السجل بنفسك.';

  @override
  String get diagLogShare => 'مشاركة سجل التشخيص';

  @override
  String get diagLogEmpty => 'فارغ';

  @override
  String get diagLogClear => 'مسح السجل';

  @override
  String get diagLogClearTitle => 'مسح سجل التشخيص؟';

  @override
  String get diagLogClearBody =>
      'سيتم حذف إدخالات الأخطاء المحفوظة من هذا iPhone.';

  @override
  String get diagLogCleared => 'تم مسح سجل التشخيص';

  @override
  String get diagLogShareFailed => 'تعذّرت مشاركة سجل التشخيص.';

  @override
  String get privacyControls2 =>
      'الإعدادات › الخصوصية والبيانات › حذف جميع البيانات يمسح كل مقطع ورحلة وجهة اتصال وسجل وإعداد خزّنه Corvista على هذا iPhone.';

  @override
  String get parkingZoneStop => 'قف';

  @override
  String get parkingZoneVeryClose => 'قريب جدًا';

  @override
  String get parkingZoneClose => 'قريب';

  @override
  String get parkingZoneNothingClose => 'لا شيء قريب ظاهر';

  @override
  String get parkingNotDetected =>
      'لا يتم كشف الجدران والأعمدة والأعمدة الصغيرة والأرصفة';

  @override
  String get parkingApprox => 'تقريبًا';

  @override
  String get parkingSideLeft => 'يسار';

  @override
  String get parkingSideCenter => 'وسط';

  @override
  String get parkingSideRight => 'يمين';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => 'عرض الكاميرا الأمامية فقط — وليس نظام 360°';

  @override
  String get parkingMuteBeeps => 'كتم الصفير';

  @override
  String get parkingUnmuteBeeps => 'تشغيل الصفير';

  @override
  String get parkingAbout => 'حول عرض الركن';

  @override
  String get parkingLimitationsDetail =>
      'تتم مراقبة المنطقة الواقعة أمام الكاميرا فقط. يتعرّف الكاشف على السيارات والحافلات والشاحنات والأشخاص والدراجات الهوائية والدراجات النارية. أما الجدران والأعمدة والأعمدة الصغيرة والأرصفة والحواجز والعوائق المنخفضة فلا يتم كشفها، وقد يحجب غطاء المحرك الأرض الواقعة أمامك مباشرة. المسافات تقديرات تقريبية من كاميرا واحدة (بحسب حجم الجسم وموضعه) وقد تكون خاطئة بفارق كبير. الصمت أو عبارة «لا شيء قريب ظاهر» لا يعني أن الطريق خالٍ — انظر حولك دائمًا واستخدم المرايا.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'القرب حسب الجهة: يسار $left، وسط $center، يمين $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'تُكتب الأخطاء في سجل خاص على هذا iPhone (دون مواقع أو أسماء جهات اتصال أو أرقام هواتف). ولا يُرسَل تلقائيًا أبدًا؛ يمكنك مشاركته أو مسحه من الإعدادات › التشخيص.';
}
