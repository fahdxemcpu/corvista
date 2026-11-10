// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'ראו יותר מכל נסיעה.';

  @override
  String get commonCancel => 'ביטול';

  @override
  String get commonDelete => 'מחיקה';

  @override
  String get commonSave => 'שמירה';

  @override
  String get commonBack => 'חזרה';

  @override
  String get commonClose => 'סגירה';

  @override
  String get commonRetry => 'נסו שוב';

  @override
  String get commonOpenSettings => 'פתיחת הגדרות';

  @override
  String get commonLoading => 'טוען…';

  @override
  String get commonError => 'משהו השתבש.';

  @override
  String commonErrorDetail(String message) {
    return 'משהו השתבש: $message';
  }

  @override
  String get commonOn => 'פועל';

  @override
  String get commonOff => 'כבוי';

  @override
  String get commonRename => 'שינוי שם';

  @override
  String get commonShare => 'שיתוף';

  @override
  String get commonNotAvailable => 'לא זמין';

  @override
  String get commonTestFootage => 'צילום בדיקה';

  @override
  String get zoneVeryClose => 'קרוב מאוד';

  @override
  String get zoneClose => 'קרוב';

  @override
  String get zoneMedium => 'בינוני';

  @override
  String get zoneFar => 'רחוק';

  @override
  String get zoneUnknown => 'לא ידוע';

  @override
  String get classPerson => 'אדם';

  @override
  String get classBicycle => 'אופניים';

  @override
  String get classMotorcycle => 'אופנוע';

  @override
  String get classCar => 'רכב';

  @override
  String get classBus => 'אוטובוס';

  @override
  String get classTrafficLight => 'רמזור';

  @override
  String get classStopSign => 'תמרור עצור';

  @override
  String get viewDetection => 'זיהוי';

  @override
  String get viewVirtual => 'וירטואלי';

  @override
  String get viewMap => 'מפה';

  @override
  String get viewParking => 'חניה';

  @override
  String get viewPerception => 'תפיסה';

  @override
  String get unitKmh => 'קמ״ש';

  @override
  String get unitMph => 'מייל לשעה';

  @override
  String get lightRed => 'אדום';

  @override
  String get lightYellow => 'צהוב';

  @override
  String get lightGreen => 'ירוק';

  @override
  String get lightUnknown => 'לא ידוע';

  @override
  String get clipsTitle => 'קטעים';

  @override
  String get clipsSelect => 'בחירה';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'נבחרו $count',
      one: 'נבחר קטע אחד',
      zero: 'בחירת קטעים',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'בחירת הכול';

  @override
  String get clipsDeselectAll => 'ביטול הבחירה';

  @override
  String get clipsDeleteSelected => 'מחיקת הנבחרים';

  @override
  String get clipsGridView => 'תצוגת רשת';

  @override
  String get clipsListView => 'תצוגת רשימה';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'למחוק $count קטעים?',
      one: 'למחוק את הקטע?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'הסרטונים יוסרו לצמיתות מה-iPhone שלכם. לא ניתן לבטל פעולה זו.',
      one: 'הסרטון יוסר לצמיתות מה-iPhone שלכם. לא ניתן לבטל פעולה זו.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קטעים נמחקו',
      one: 'הקטע נמחק',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'אין קטעים עדיין';

  @override
  String get clipsEmptyBody =>
      'בזמן הנסיעה Corvista שומרת מאגר מתגלגל קצר. הקישו על ״שמירת אירוע״ כדי לשמור כאן את השניות האחרונות של הצילום.';

  @override
  String get clipsLoadError => 'לא ניתן לטעון את הקטעים שלכם.';

  @override
  String get clipsStorageTitle => 'אחסון';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'קטעים $clips · מאגר $buffer · $free פנויים';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קטעים שמורים',
      one: 'קטע שמור אחד',
      zero: 'אין קטעים שמורים',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'האחסון ב-iPhone שלכם נמוך. ייתכן ששמירת אירועים חדשים תיכשל.';

  @override
  String get clipsMissingFile => 'הקובץ חסר';

  @override
  String get clipsEmergencyBadge => 'פגיעה';

  @override
  String clipsUntitled(String date) {
    return 'אירוע · $date';
  }

  @override
  String get clipsAudio => 'הוקלט שמע';

  @override
  String get clipsFavorite => 'מועדף';

  @override
  String get clipsUnfavorite => 'הסרה מהמועדפים';

  @override
  String get clipsLocation => 'המיקום נשמר';

  @override
  String clipsOpenClip(String title) {
    return 'פתיחת הקטע $title';
  }

  @override
  String get playerNotFoundTitle => 'הקטע לא נמצא';

  @override
  String get playerNotFoundBody => 'ייתכן שהקטע נמחק.';

  @override
  String get playerMissingTitle => 'קובץ הווידאו חסר';

  @override
  String get playerMissingBody =>
      'ההקלטה של קטע זה כבר אינה ב-iPhone שלכם. אפשר להסיר את הרשומה מהגלריה.';

  @override
  String get playerRemoveEntry => 'הסרת הרשומה';

  @override
  String get playerLoadError => 'לא ניתן להפעיל את הסרטון.';

  @override
  String get playerPlay => 'הפעלה';

  @override
  String get playerPause => 'השהיה';

  @override
  String get playerReplay => 'הפעלה מחדש';

  @override
  String get playerRenameTitle => 'שינוי שם הקטע';

  @override
  String get playerRenameHint => 'שם הקטע';

  @override
  String get playerRenamed => 'שם הקטע שונה';

  @override
  String get playerFavorited => 'נוסף למועדפים';

  @override
  String get playerUnfavorited => 'הוסר מהמועדפים';

  @override
  String get playerShareFailed => 'לא ניתן לשתף את הקטע.';

  @override
  String get playerDetails => 'פרטים';

  @override
  String get playerDate => 'הוקלט';

  @override
  String get playerDuration => 'משך';

  @override
  String get playerResolution => 'רזולוציה';

  @override
  String get playerSize => 'גודל קובץ';

  @override
  String get playerAudio => 'שמע';

  @override
  String get playerAudioYes => 'הוקלט';

  @override
  String get playerAudioNo => 'לא הוקלט';

  @override
  String get playerReason => 'נשמר על ידי';

  @override
  String get playerReasonManual => 'כפתור שמירת אירוע';

  @override
  String get playerReasonEmergency => 'זיהוי פגיעה אפשרית';

  @override
  String get playerReasonRecovered => 'שוחזר לאחר הפרעה';

  @override
  String get playerSpeed => 'מהירות GPS בעת השמירה';

  @override
  String get playerLocation => 'מיקום';

  @override
  String get playerOpenInMaps => 'פתיחה במפות';

  @override
  String get playerBack => 'חזרה';

  @override
  String get playerMore => 'פעולות נוספות';

  @override
  String get clipsFilterLabel => 'הצגה';

  @override
  String get clipsFilterAll => 'הכול';

  @override
  String get clipsFilterRecordings => 'הקלטות';

  @override
  String get clipsFilterIncidents => 'אירועים';

  @override
  String get clipsFilterEmergency => 'חירום';

  @override
  String get clipsFilterFavorites => 'מועדפים';

  @override
  String get clipsSort => 'מיון';

  @override
  String get clipsSortNewest => 'החדשים ראשונים';

  @override
  String get clipsSortOldest => 'הישנים ראשונים';

  @override
  String get clipsSortLongest => 'הארוכים ראשונים';

  @override
  String get clipsSortLargest => 'הגדולים ראשונים';

  @override
  String get clipsToday => 'היום';

  @override
  String get clipsYesterday => 'אתמול';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קטעים',
      one: 'קטע אחד',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'אין עדיין קטעים בקטגוריה זו.';

  @override
  String get clipsFavoritesEmpty =>
      'סמנו קטע בכוכב כדי לשמור אותו כאן לגישה מהירה.';

  @override
  String get clipsKindRecording => 'הקלטה';

  @override
  String get clipsKindIncident => 'אירוע';

  @override
  String get clipsKindEmergency => 'חירום';

  @override
  String get clipsKindTest => 'בדיקה';

  @override
  String clipsTripChip(String time) {
    return 'נסיעה · $time';
  }

  @override
  String get clipsOpenTrip => 'פתיחת הנסיעה שבה הוקלט הקטע';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used בשימוש · $free פנויים';
  }

  @override
  String clipsStorageClips(String size) {
    return 'הקטעים תופסים $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count הקלטות',
      one: 'הקלטה אחת',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count אירועים',
      one: 'אירוע אחד',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מקרי חירום',
      one: 'מקרה חירום אחד',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'פינוי מקום';

  @override
  String get clipsStorageLowGentle =>
      'נותרו פחות מ-2 GB פנויים. כדי להמשיך להקליט בצורה חלקה, פנו מקום או הסירו קטעים שאינכם צריכים עוד.';

  @override
  String get clipsSaveToPhotos => 'שמירה בתמונות';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קטעים',
      one: 'קטע אחד',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'למחוק $count קטעים ($size)?',
      one: 'למחוק את הקטע ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'שומר $done מתוך $total בתמונות…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קטעים נשמרו בתמונות',
      one: 'נשמר בתמונות',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved נשמרו בתמונות · $failed לא ניתן היה לשמור';
  }

  @override
  String get clipsPhotosDenied =>
      'ל-Corvista אין הרשאה להוסיף סרטונים לתמונות. אפשר לאשר זאת בהגדרות.';

  @override
  String get clipsPhotosFailed => 'לא ניתן היה לשמור בתמונות.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קטעים נוספו למועדפים',
      one: 'נוסף למועדפים',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קטעים הוסרו מהמועדפים',
      one: 'הוסר מהמועדפים',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (קוצר)';
  }

  @override
  String get playerTrim => 'קיצור';

  @override
  String get playerInfo => 'מידע';

  @override
  String get playerKind => 'סוג';

  @override
  String get playerReasonRecording => 'כפתור הקלטה';

  @override
  String get trimTitle => 'קיצור קטע';

  @override
  String get trimHint =>
      'גררו את הידיות כדי לבחור את החלק לשמירה. הקטע המקורי נשאר ללא שינוי.';

  @override
  String get trimStartHandle => 'תחילת הקיצור';

  @override
  String get trimEndHandle => 'סוף הקיצור';

  @override
  String trimSelection(String duration) {
    return 'נבחרו $duration';
  }

  @override
  String get trimSave => 'שמירה כקטע חדש';

  @override
  String get trimSaving => 'שומר את הקטע המקוצר…';

  @override
  String get trimSaved => 'הקטע המקוצר נשמר';

  @override
  String get trimOpenNew => 'פתיחה';

  @override
  String get trimFailed => 'לא ניתן היה לקצר את הקטע.';

  @override
  String get trimStorageFull => 'אין מספיק מקום פנוי לשמירת הקטע המקוצר.';

  @override
  String get trimPreview => 'ניגון הבחירה';

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get settingsSectionCamera => 'מצלמה';

  @override
  String get settingsSectionAi => 'בינה מלאכותית';

  @override
  String get settingsSectionAlerts => 'התראות';

  @override
  String get settingsSectionAlertCategories => 'קטגוריות התראה';

  @override
  String get settingsSectionRecording => 'הקלטה';

  @override
  String get settingsSectionDriving => 'נהיגה';

  @override
  String get settingsSectionPower => 'צריכת חשמל';

  @override
  String get settingsSectionEmergency => 'חירום';

  @override
  String get settingsSectionAppearance => 'מראה';

  @override
  String get settingsSectionLanguage => 'שפה';

  @override
  String get settingsSectionInformation => 'מידע';

  @override
  String get settingsCameraLens => 'עדשת מצלמה';

  @override
  String get settingsLensWide => 'רחבה';

  @override
  String get settingsLensUltraWide => 'רחבה במיוחד';

  @override
  String get settingsLensTelephoto => 'טלפוטו';

  @override
  String get settingsLensUnavailable => 'לא זמינה ב-iPhone זה';

  @override
  String get settingsStabilization => 'ייצוב';

  @override
  String get settingsStabAuto => 'אוטומטי';

  @override
  String get settingsStabOff => 'כבוי';

  @override
  String get settingsStabStandard => 'רגיל';

  @override
  String get settingsStabCinematic => 'קולנועי';

  @override
  String get settingsOverlayOpacity => 'שקיפות שכבת-על';

  @override
  String get settingsShowFps => 'הצגת נתוני ביצועים';

  @override
  String get settingsShowFpsSubtitle => 'קצב פריימים וזמן עיבוד בתצוגת הזיהוי';

  @override
  String get settingsCameraFooter =>
      'שינויים בעדשה ובייצוב ייכנסו לתוקף בפעם הבאה שהמצלמה תופעל.';

  @override
  String get settingsAiModel => 'מודל בינה מלאכותית';

  @override
  String get settingsConfidence => 'רמת ביטחון בזיהוי';

  @override
  String get settingsTracking => 'מעקב אחר עצמים';

  @override
  String get settingsTrackingSubtitle => 'שומר על יציבות העצמים בין פריימים';

  @override
  String get settingsShowLabels => 'הצגת תוויות';

  @override
  String get settingsShowConfidence => 'הצגת רמת ביטחון';

  @override
  String get settingsSegmentationOpacity => 'שקיפות מסכת התפיסה';

  @override
  String get settingsAiFooter =>
      'רמת ביטחון נמוכה יותר מציגה יותר עצמים, אך גם יותר זיהויים שגויים. זיהויים עלולים להיות לא מדויקים.';

  @override
  String get settingsVoiceAlerts => 'התראות קוליות';

  @override
  String get settingsVoiceLanguage => 'שפת הקול';

  @override
  String get settingsVoiceLanguageAuto => 'לפי שפת האפליקציה';

  @override
  String get settingsVoice => 'קול';

  @override
  String get settingsVoiceDefault => 'ברירת מחדל של המערכת';

  @override
  String get settingsVoiceQualityEnhanced => 'משופר';

  @override
  String get settingsVoiceQualityPremium => 'איכות גבוהה';

  @override
  String get settingsNoVoices =>
      'לא מותקן קול לשפה זו. אפשר להוסיף קול ב-iOS ‏הגדרות › נגישות › תוכן מדובר.';

  @override
  String get settingsAlertPedestrian => 'הולכי רגל';

  @override
  String get settingsAlertCyclist => 'רוכבי אופניים';

  @override
  String get settingsAlertMotorcycle => 'אופנועים';

  @override
  String get settingsAlertBus => 'אוטובוסים';

  @override
  String get settingsAlertVehicleClose => 'רכב קרוב מאוד מלפנים';

  @override
  String get settingsAlertTrafficLight => 'שינויי רמזור';

  @override
  String get settingsAlertTrafficMoving => 'התנועה לפנים נעה';

  @override
  String get settingsAlertStopSign => 'תמרורי עצור';

  @override
  String get settingsSensitivity => 'רגישות';

  @override
  String get settingsSensitivityLow => 'נמוכה';

  @override
  String get settingsSensitivityMedium => 'בינונית';

  @override
  String get settingsSensitivityHigh => 'גבוהה';

  @override
  String get settingsCooldown => 'מרווח בין חזרות';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds שנ׳';
  }

  @override
  String get settingsVolume => 'עוצמת הקול';

  @override
  String get settingsQuietMode => 'מצב שקט';

  @override
  String get settingsQuietModeSubtitle => 'רק ההתראות החשובות ביותר מושמעות';

  @override
  String get settingsTestVoice => 'בדיקת קול';

  @override
  String get settingsTestVoiceDone => 'מושמעת התראה לדוגמה…';

  @override
  String get settingsParkingBeeps => 'צפצופי חניה';

  @override
  String get settingsBeepVolume => 'עוצמת הצפצוף';

  @override
  String get settingsAlertsFooter =>
      'ההתראות הן כלי עזר בלבד. הקפידו להסתכל על הכביש — שקט אינו אומר שהדרך פנויה.';

  @override
  String get settingsRecordingProfile => 'איכות הקלטה';

  @override
  String get settingsProfileStandard => 'רגילה · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'מאגר אירועים';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds שניות';
  }

  @override
  String get settingsManualMaxLength => 'אורך מרבי להקלטה ידנית';

  @override
  String get settingsManualMaxUnlimited => 'ללא הגבלה';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes דק׳';
  }

  @override
  String get settingsRecordAudio => 'הקלטת שמע';

  @override
  String get settingsRecordAudioSubtitle =>
      'כולל שמע מתוך הרכב באירועים שנשמרים';

  @override
  String get settingsMicDenied =>
      'הגישה למיקרופון כבויה. אפשרו אותה בהגדרות כדי להקליט שמע.';

  @override
  String get settingsWatermark => 'סימן מים של Corvista';

  @override
  String get settingsTimestamp => 'חותמת תאריך ושעה';

  @override
  String get settingsSaveLocation => 'שמירת מיקום עם הקטעים';

  @override
  String get settingsStorage => 'אחסון וקטעים';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קטעים',
      one: 'קטע אחד',
      zero: 'אין קטעים',
    );
    return '$_temp0 · $used בשימוש · $free פנויים';
  }

  @override
  String get settingsRecordingFooter =>
      'המאגר המתגלגל נשאר ב-iPhone שלכם ונדרס ברציפות. דבר אינו מוקלט ברקע.';

  @override
  String get settingsDefaultView => 'תצוגת ברירת מחדל';

  @override
  String get settingsUnits => 'יחידות';

  @override
  String get settingsShowCompass => 'הצגת מצפן';

  @override
  String get settingsHudStyle => 'סגנון HUD';

  @override
  String get settingsHudCustomize => 'התאמת HUD';

  @override
  String get settingsDrivingSide => 'צד נהיגה';

  @override
  String get settingsDrivingSideAuto => 'אוטומטי';

  @override
  String get settingsDrivingSideRight => 'ימין';

  @override
  String get settingsDrivingSideLeft => 'שמאל';

  @override
  String get settingsVirtualStyle => 'סגנון התצוגה הווירטואלית';

  @override
  String get settingsVirtualMinimal => 'מינימלי';

  @override
  String get settingsVirtualPerspective => 'פרספקטיבה';

  @override
  String get settingsVirtualHighContrast => 'ניגודיות גבוהה';

  @override
  String get settingsKeepScreenOn => 'השארת המסך דלוק בזמן נהיגה';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'הצגת הוראות ניווט במסך הנעילה וב-Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'ההקלטה הושהתה בזמן ש-Corvista הייתה ברקע';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'מושהה';

  @override
  String get liveActivityDashcamOff => 'מצלמה כבויה';

  @override
  String get liveActivityEnded => 'הניווט הסתיים';

  @override
  String get liveActivityEta => 'הגעה';

  @override
  String get settingsAutoRecenter => 'מירכוז אוטומטי של המפה';

  @override
  String get settingsHudStyleClassic => 'קלאסי';

  @override
  String get settingsHudStyleGrid => 'רשת';

  @override
  String get settingsHudStyleMinimal => 'מינימלי';

  @override
  String get settingsHudStylePerformance => 'ביצועים';

  @override
  String get settingsHudStyleNavigation => 'ניווט';

  @override
  String get settingsHudStyleNight => 'לילה';

  @override
  String get settingsHudStyleHighContrast => 'ניגודיות גבוהה';

  @override
  String get settingsPowerMode => 'מצב צריכת חשמל';

  @override
  String get settingsPowerBalanced => 'מאוזן';

  @override
  String get settingsPowerPerformance => 'ביצועים';

  @override
  String get settingsPowerSaver => 'חיסכון בחשמל';

  @override
  String get settingsPowerFooter =>
      'Corvista מפחיתה אוטומטית את קצב הבינה המלאכותית ואת האפקטים החזותיים כשה-iPhone מתחמם או כשהסוללה חלשה.';

  @override
  String get settingsThermal => 'מצב תרמי';

  @override
  String get settingsThermalNominal => 'תקין';

  @override
  String get settingsThermalFair => 'חם';

  @override
  String get settingsThermalSerious => 'חם מאוד';

  @override
  String get settingsThermalCritical => 'קריטי';

  @override
  String get settingsBattery => 'סוללה';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · בטעינה';
  }

  @override
  String get settingsLowPowerMode =>
      'מצב צריכת חשמל נמוכה פועל — הבינה המלאכותית פועלת בקצב מופחת.';

  @override
  String get settingsAiRate => 'קצב נוכחי של הבינה המלאכותית';

  @override
  String settingsHzValue(String value) {
    return '$value הרץ';
  }

  @override
  String get settingsEmergencySetup => 'זיהוי פגיעה';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'פועל · ספירה לאחור של $seconds שנ׳';
  }

  @override
  String get settingsEmergencyFooter => 'ניסיוני. אינו תחליף לשירותי חירום.';

  @override
  String get settingsTheme => 'ערכת נושא';

  @override
  String get settingsThemeSystem => 'מערכת';

  @override
  String get settingsThemeDark => 'כהה';

  @override
  String get settingsThemeLight => 'בהירה';

  @override
  String get settingsReduceMotion => 'הפחתת תנועה';

  @override
  String get settingsReduceMotionSubtitle => 'ממזער אנימציות בכל האפליקציה';

  @override
  String get settingsAppLanguage => 'שפת האפליקציה';

  @override
  String get settingsPrivacyPolicy => 'מדיניות פרטיות';

  @override
  String get settingsTerms => 'תנאי שימוש';

  @override
  String get settingsHelp => 'עזרה';

  @override
  String get settingsSupport => 'פנייה לתמיכה';

  @override
  String get settingsLicenses => 'רישיונות קוד פתוח';

  @override
  String get settingsSupportUnavailable =>
      'לא ניתן לפתוח את Mail. כתבו אל support@corvista.app.';

  @override
  String get settingsSafety => 'מידע בטיחות';

  @override
  String get settingsDiagnostics => 'אבחון';

  @override
  String get settingsVersion => 'גרסה';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'התאמת HUD';

  @override
  String get hudCustomPreview => 'תצוגה מקדימה · ערכים לדוגמה';

  @override
  String get hudCustomStyle => 'סגנון';

  @override
  String get hudCustomElements => 'רכיבים';

  @override
  String get hudCustomSpeed => 'מהירות';

  @override
  String get hudCustomHeading => 'כיוון ומצפן';

  @override
  String get hudCustomClock => 'שעון';

  @override
  String get hudCustomBattery => 'סוללה וטמפרטורה';

  @override
  String get hudCustomDetections => 'מצב הבינה המלאכותית וזיהויים';

  @override
  String get hudCustomWeather => 'מזג אוויר';

  @override
  String get hudCustomAppearance => 'גודל ושקיפות';

  @override
  String get hudCustomSize => 'גודל';

  @override
  String get hudCustomOpacity => 'שקיפות';

  @override
  String get hudCustomFooter =>
      'אזהרות כמו התחממות יתר מוצגות תמיד, גם כשהרכיבים מוסתרים.';

  @override
  String get hudCustomDescClassic => 'לוח מחוונים מאוזן';

  @override
  String get hudCustomDescGrid => 'רשת פרספקטיבה מעל הכביש';

  @override
  String get hudCustomDescMinimal => 'מהירות בלבד, ותו לא';

  @override
  String get hudCustomDescPerformance => 'קשת מהירות עם נתונים חיים';

  @override
  String get hudCustomDescNavigation => 'הפנייה הבאה קודם';

  @override
  String get hudCustomDescNight => 'מעומעם בגוון אדום לנהיגה בלילה';

  @override
  String get hudCustomDescHighContrast => 'קריאות מרבית באור שמש חזק';

  @override
  String get languageTitle => 'שפה';

  @override
  String get languageSystem => 'ברירת מחדל של המערכת';

  @override
  String get languageSystemSubtitle => 'לפי שפת ה-iPhone שלכם';

  @override
  String get languageFooter =>
      'שפות נוספות יתווספו בקרוב. את שפת ההתראות הקוליות אפשר להגדיר בנפרד תחת התראות.';

  @override
  String get diagTitle => 'אבחון';

  @override
  String get diagPerformance => 'ביצועים';

  @override
  String get diagInference => 'זמן עיבוד';

  @override
  String get diagDetectHz => 'קצב זיהוי';

  @override
  String get diagCameraFps => 'קצב פריימים של המצלמה';

  @override
  String get diagMemory => 'זיכרון';

  @override
  String get diagDropped => 'פריימים שנפלו';

  @override
  String get diagSegmentation => 'זמן סגמנטציה';

  @override
  String get diagCamera => 'מצלמה';

  @override
  String get diagStatus => 'סטטוס';

  @override
  String get diagSource => 'מקור';

  @override
  String get diagSourceCamera => 'מצלמה חיה';

  @override
  String get diagSourceFile => 'קובץ צילום בדיקה';

  @override
  String get diagResolution => 'גודל מאגר';

  @override
  String get diagLens => 'עדשה';

  @override
  String get diagError => 'שגיאה אחרונה';

  @override
  String get diagModel => 'מודל בינה מלאכותית';

  @override
  String get diagModelLoad => 'זמן טעינת המודל';

  @override
  String get diagPower => 'צריכת חשמל';

  @override
  String get diagSegHz => 'קצב סגמנטציה';

  @override
  String get diagReduced => 'אפקטים מופחתים';

  @override
  String diagMs(String value) {
    return '$value מילישניות';
  }

  @override
  String diagFps(String value) {
    return '$value פריימים לשנייה';
  }

  @override
  String diagMb(String value) {
    return '$value MB';
  }

  @override
  String get diagCamIdle => 'במנוחה';

  @override
  String get diagCamStarting => 'מתחילה';

  @override
  String get diagCamRunning => 'פועלת';

  @override
  String get diagCamInterrupted => 'הופרעה';

  @override
  String get diagCamStopped => 'נעצרה';

  @override
  String get diagCamUnavailable => 'לא זמינה';

  @override
  String get diagCamPermissionDenied => 'ההרשאה נדחתה';

  @override
  String get diagCamError => 'שגיאה';

  @override
  String get diagTestFootage => 'צילום בדיקה';

  @override
  String get diagTestFootageBody =>
      'הפעלת זיהוי אמיתי במכשיר על קובץ וידאו מקומי במקום המצלמה. כל תצוגה מסמנת זאת כ״צילום בדיקה״.';

  @override
  String get diagPathLabel => 'נתיב קובץ הווידאו';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'שימוש ב-Documents/test_drive.mp4';

  @override
  String get diagRun => 'הפעלת צילום בדיקה';

  @override
  String get diagRunStarted =>
      'צילום הבדיקה התחיל. פתחו את תצוגת הנסיעה כדי לראות אותו.';

  @override
  String get diagBackToCamera => 'חזרה למצלמה החיה';

  @override
  String get diagDebugOnly => 'צילום בדיקה זמין רק בגרסאות פיתוח.';

  @override
  String get diagFileMissing => 'לא קיים קובץ בנתיב זה.';

  @override
  String get emergencySetupTitle => 'זיהוי פגיעה';

  @override
  String get emergencyExperimental => 'ניסיוני';

  @override
  String get emergencyIntro =>
      'במהלך נסיעה Corvista יכולה לעקוב אחר פגיעה חמורה אפשרית באמצעות חיישני התנועה של ה-iPhone שלכם. אם תזוהה פגיעה, תתחיל ספירה לאחור. אם לא תבטלו אותה, Corvista תציע להתקשר לשירותי החירום ולשלוח הודעה לאנשי הקשר שלכם.';

  @override
  String get emergencyDisclaimer1 =>
      'אינו תחליף לשירותי חירום או למערכת זיהוי התאונות של הרכב עצמו.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS תמיד מבקשת אישור לפני ביצוע שיחה או שליחת הודעה.';

  @override
  String get emergencyDisclaimer3 =>
      'פגיעות עלולות לא להתגלות, ובלימה חדה או מהמורות עלולות להיחשב בטעות לפגיעה.';

  @override
  String get emergencyParkedWarning =>
      'השלימו את ההגדרה כשהרכב חונה. ההגדרות נעולות כשהרכב בתנועה.';

  @override
  String get emergencyEnable => 'הפעלת זיהוי פגיעה';

  @override
  String get emergencyEnableSubtitle => 'פעיל רק במהלך נסיעה';

  @override
  String get emergencyNeedNumber => 'הוסיפו תחילה מספר חירום.';

  @override
  String get emergencyContacts => 'אנשי קשר לחירום';

  @override
  String get emergencyAddContact => 'הוספת איש קשר';

  @override
  String get emergencyNoContacts =>
      'אין אנשי קשר עדיין. אנשי הקשר יקבלו הודעה רק לאחר שתאשרו זאת.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'להסיר את $name?';
  }

  @override
  String get emergencyRemoveContactBody => 'איש הקשר לא יוצע כנמען לאחר פגיעה.';

  @override
  String get emergencyRemove => 'הסרה';

  @override
  String get emergencyContactsError => 'לא ניתן לטעון את אנשי הקשר.';

  @override
  String get emergencyNumber => 'מספר חירום';

  @override
  String get emergencyNumberHint => 'לדוגמה 112 או 911';

  @override
  String get emergencyMessage => 'תבנית הודעה';

  @override
  String get emergencyMessageDefault =>
      'ייתכן שהייתי מעורב בתאונת דרכים. הודעה זו הוכנה על ידי Corvista וכוללת את המיקום הידוע האחרון שלי, אם זמין.';

  @override
  String get emergencyMessageHint =>
      'השאירו ריק כדי להשתמש בהודעת ברירת המחדל.';

  @override
  String get emergencyCountdown => 'משך הספירה לאחור';

  @override
  String get emergencyVoiceCancel => 'ביטול בקול';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'אמרו “אני בסדר” או “ביטול” במהלך הספירה לאחור. משתמש בזיהוי דיבור במכשיר כשהדבר זמין.';

  @override
  String get emergencyVoicePermDenied =>
      'נדרשת גישה למיקרופון ולזיהוי דיבור לצורך ביטול בקול.';

  @override
  String get emergencyAutoSave => 'שמירה אוטומטית של קטע האירוע';

  @override
  String get emergencyTest => 'בדיקת הספירה לאחור (ללא שיחה)';

  @override
  String get emergencyTestBody =>
      'מריץ פגיעה מדומה כדי שתוכלו לראות את הספירה לאחור. במצב בדיקה לא מתבצעת שיחה ולא נשלחת הודעה.';

  @override
  String get emergencyNotSet => 'לא הוגדר';

  @override
  String get emergencyAlertHeadline => 'זוהתה פגיעה חמורה אפשרית.';

  @override
  String get emergencyAlertSubtitle => 'האם אתם בסדר?';

  @override
  String get emergencyAlertCancel => 'אני בסדר — ביטול';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'נותרו $seconds שניות',
      one: 'נותרה שנייה אחת',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => 'מאזין — אמרו “אני בסדר” כדי לבטל';

  @override
  String emergencyAlertHeard(String text) {
    return 'נשמע: “$text”';
  }

  @override
  String get emergencyAlertEscalated => 'אין תגובה. בחרו מה לעשות:';

  @override
  String get emergencyAlertCall => 'חיוג לשירותי חירום';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'מחייג אל $number. iOS תבקש מכם לאשר.';
  }

  @override
  String get emergencyAlertMessage => 'שליחת הודעה לאנשי הקשר';

  @override
  String get emergencyAlertMessageSubtitle =>
      'פותח הודעה מוכנה. אתם בוחרים אם לשלוח אותה.';

  @override
  String get emergencyAlertTestMode => 'מצב בדיקה — לא תתבצע שיחה';

  @override
  String get emergencyAlertTestBadge => 'בדיקה';

  @override
  String get emergencyAlertClose => 'אני בסדר — סגירה';

  @override
  String get emergencyMsgSent => 'ההודעה נשלחה.';

  @override
  String get emergencyMsgCancelled => 'ההודעה לא נשלחה.';

  @override
  String get emergencyMsgFailed => 'לא ניתן לשלוח את ההודעה.';

  @override
  String get emergencyMsgUnavailable => 'שליחת הודעות אינה זמינה במכשיר זה.';

  @override
  String emergencyCallFailed(String number) {
    return 'לא ניתן להתחיל את השיחה. חייגו בעצמכם אל $number.';
  }

  @override
  String get modelsTitle => 'מודלי בינה מלאכותית';

  @override
  String get modelsIntro =>
      'כל המודלים מגיעים עם האפליקציה ופועלים כולם ב-iPhone שלכם. הווידאו מהמצלמה לעולם אינו עוזב את המכשיר.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'חי: $ms מילישניות לפריים · $hz זיהויים בשנייה';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'נטען תוך $ms מילישניות';
  }

  @override
  String get modelsEfficientName => 'יעיל';

  @override
  String get modelsEfficientDesc =>
      'גלאי מהיר וקומפקטי, מותאם לנסיעות ארוכות עם חום וצריכת סוללה נמוכים.';

  @override
  String get modelsEnhancedName => 'משופר';

  @override
  String get modelsEnhancedDesc =>
      'גלאי גדול יותר המזהה עצמים קטנים ורחוקים יותר, במחיר צריכת חשמל גבוהה יותר.';

  @override
  String get modelsSegmentationName => 'סגמנטציה';

  @override
  String get modelsSegmentationDesc =>
      'משלב זיהוי מהיר עם מסכות של משטח הכביש ושל עצמים עבור תצוגת התפיסה.';

  @override
  String get modelsNoneName => 'בינה מלאכותית מושהית';

  @override
  String get modelsNoneDesc =>
      'המצלמה וההקלטה ממשיכות לפעול ללא זיהוי עצמים. צריכת החשמל הנמוכה ביותר.';

  @override
  String get modelsGenericDesc => 'מודל לזיהוי עצמים הפועל במכשיר.';

  @override
  String get modelsFunctionDetection =>
      'מזהה כלי רכב, אנשים, אופניים, אופנועים, אוטובוסים, רמזורים ותמרורי עצור';

  @override
  String get modelsFunctionSegmentation =>
      'מוסיף מסכות של משטח הכביש ושל עצמים';

  @override
  String get modelsFunctionNone => 'ללא זיהוי; הקלטת מצלמת דרך בלבד';

  @override
  String get modelsSize => 'גודל';

  @override
  String get modelsInput => 'קלט';

  @override
  String modelsInputValue(String size) {
    return '$size × $size פיקסלים';
  }

  @override
  String get modelsViews => 'פועל עם';

  @override
  String get modelsStatusInstalled => 'מותקן (מובנה)';

  @override
  String get modelsStatusNotInstalled => 'לא מותקן';

  @override
  String get modelsSelected => 'נבחר';

  @override
  String get modelsUse => 'שימוש במודל זה';

  @override
  String get modelsSwitching => 'טוען מודל…';

  @override
  String modelsSwitched(String name) {
    return '$name פעיל כעת';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'נמדד במכשיר זה: ממוצע $ms מילישניות';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'לא נמדד במכשיר זה';

  @override
  String get modelsBenchmarkRun => 'הרצת בדיקת ביצועים';

  @override
  String get modelsBenchmarkRunning => 'בודק ביצועים…';

  @override
  String get modelsBenchmarkSelectHint => 'בחרו מודל זה כדי לבדוק את ביצועיו.';

  @override
  String get modelsBenchmarkDone => 'בדיקת הביצועים הושלמה';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'בדיקת הביצועים נכשלה: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'עודכן לאחרונה: $date';
  }

  @override
  String get safetyTitle => 'מידע בטיחות';

  @override
  String get safetyIntro =>
      'Corvista היא כלי עזר למודעות בנהיגה. היא אינה שולטת ברכב שלכם ואינה יכולה להחליף את תשומת הלב ושיקול הדעת שלכם או את מערכות הבטיחות של הרכב.';

  @override
  String get safetyBeforeTitle => 'לפני הנהיגה';

  @override
  String get safetyBefore1 =>
      'קבעו את ה-iPhone בחוזקה במיקום חוקי שאינו חוסם את שדה הראייה, כריות האוויר או הבקרים.';

  @override
  String get safetyBefore2 =>
      'סיימו את ההגדרה, בחרו תצוגה וקבעו יעד כשהרכב חונה.';

  @override
  String get safetyBefore3 =>
      'חברו מטען בנסיעות ארוכות והרחיקו את הטלפון מאור שמש ישיר ככל האפשר.';

  @override
  String get safetyWhileTitle => 'במהלך הנהיגה';

  @override
  String get safetyWhile1 =>
      'שימו עיניים על הכביש. השתמשו בבקרים הגדולים שעל המסך רק כשהדבר בטוח וחוקי.';

  @override
  String get safetyWhile2 =>
      'ההתראות הן כלי עזר, ולא אזהרות שאפשר לסמוך עליהן. שקט אינו אומר שהכביש פנוי.';

  @override
  String get safetyWhile3 =>
      'פעלו לפי חוקי התנועה, האותות והתמרורים — ולא לפי האפליקציה — כשיש סתירה ביניהם.';

  @override
  String get safetyLimitsTitle => 'מגבלות';

  @override
  String get safetyLimits1 =>
      'מצלמת טלפון אחת רואה רק את מה שלפניה. עצמים מחוץ לשדה הראייה, מוסתרים או קרובים מאוד אינם מזוהים.';

  @override
  String get safetyLimits2 =>
      'זיהויים עלולים להיפספס, להתאחר או להיות שגויים, במיוחד בלילה, בגשם, בערפל, בסנוור או כשהשמשה מלוכלכת.';

  @override
  String get safetyLimits3 =>
      'רק קטגוריות נתמכות מזוהות: כלי רכב, אוטובוסים, אופנועים, אופניים, אנשים, רמזורים ותמרורי עצור. רמזי הנתיבים בתצוגה הווירטואלית הם סגנוניים ואינם נתיבים שזוהו.';

  @override
  String get safetyLimits4 =>
      'קרבה מוצגת כאזורים משוערים (קרוב מאוד, קרוב, בינוני, רחוק), ולעולם לא כמרחקים נמדדים. תצוגת החניה אינה תחליף לחיישני חניה.';

  @override
  String get safetyHeatTitle => 'חום וסוללה';

  @override
  String get safetyHeat1 =>
      'שימוש רציף במצלמה ובבינה מלאכותית מחמם את ה-iPhone. Corvista מפחיתה את קצב הניתוח כשהמכשיר מתחמם ומציגה אזהרה; אם iOS מתחממת יתר על המידה, ייתכן שהמצלמה תיעצר.';

  @override
  String get safetyEmergencyTitle => 'תכונת חירום';

  @override
  String get safetyEmergency1 =>
      'זיהוי פגיעה אפשרית הוא ניסיוני. הוא עלול לפספס תאונות אמיתיות ועלול להיות מופעל על ידי אירועים אחרים.';

  @override
  String get safetyEmergency2 =>
      'הוא לעולם אינו יוצר קשר עם איש בחשאי: iOS תמיד מבקשת אישור לשיחה או להודעה. הוא אינו תחליף להתקשרות בעצמכם לשירותי חירום.';

  @override
  String get privacyTitle => 'פרטיות';

  @override
  String get privacyIntro =>
      'Corvista תוכננה לשמור את נתוני הנהיגה שלכם ב-iPhone. אין חשבון Corvista, ו-Corvista אינה מפעילה שרתים משלה.';

  @override
  String get privacyCameraTitle => 'מצלמה ובינה מלאכותית';

  @override
  String get privacyCamera1 =>
      'זיהוי עצמים, מעקב וסגמנטציה פועלים כולם ב-iPhone שלכם. פריימים מהמצלמה לעולם אינם מועלים.';

  @override
  String get privacyCamera2 =>
      'המצלמה פועלת רק כש-Corvista פתוחה על המסך. היא מושהית כשהאפליקציה עוברת לרקע — אין הקלטה נסתרת ברקע.';

  @override
  String get privacyRecordingsTitle => 'הקלטות';

  @override
  String get privacyRecordings1 =>
      'המאגר המתגלגל זמני ונדרס ברציפות. צילום נשמר רק כשאתם מקישים על ״שמירת אירוע״ או, אם הפעלתם זאת, לאחר פגיעה אפשרית.';

  @override
  String get privacyRecordings2 =>
      'קטעים שמורים נשארים באחסון הפרטי של Corvista ב-iPhone שלכם. הם עוזבים את המכשיר רק כשאתם בוחרים ״שיתוף״. מחיקת האפליקציה מוחקת אותם.';

  @override
  String get privacyRecordings3 =>
      'שמע מוקלט רק אם הפעלתם זאת ואישרתם גישה למיקרופון.';

  @override
  String get privacyLocationTitle => 'מיקום';

  @override
  String get privacyLocation1 =>
      'המיקום משמש בזמן שהאפליקציה פתוחה עבור המהירות, המפה, המסלולים ומזג האוויר. אם ״שמירת מיקום״ פועלת, המיקום ברגע השמירה נשמר עם הקטע במכשיר שלכם.';

  @override
  String get privacyNetworkTitle => 'שירותי רשת';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — הצגת מפה, חיפוש מקומות ומסלולים. טקסט החיפוש והמיקום המשוער שלכם נשלחים אל Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — מזג האוויר הנוכחי והשעתי עבור המיקום שלכם.';

  @override
  String get privacyNetwork4 =>
      'Corvista אינה כוללת פרסומות וגם לא ניתוח נתונים או מעקב של צד שלישי.';

  @override
  String get privacyEmergencyTitle => 'אנשי קשר לחירום';

  @override
  String get privacyEmergency1 =>
      'אנשי הקשר שבחרתם נשמרים ב-iOS Keychain במכשיר זה. ביטול בקול משתמש בזיהוי דיבור במכשיר כשהדבר זמין. שיחות והודעות נשלחות רק לאחר שאישרתם אותן ב-iOS.';

  @override
  String get privacyControlsTitle => 'הבקרות שלכם';

  @override
  String get privacyControls1 =>
      'אפשר למחוק קטעים בכל עת בלשונית ״קטעים״, ולשנות או לבטל גישה למצלמה, למיקרופון, למיקום ולדיבור בהגדרות iOS.';

  @override
  String get termsTitle => 'תנאי שימוש';

  @override
  String get termsIntro =>
      'בשימוש ב-Corvista אתם מסכימים לתנאים אלה. חל גם הסכם הרישיון הסטנדרטי למשתמש קצה של יישום מורשה של Apple.';

  @override
  String get termsUseTitle => 'שימוש ב-Corvista';

  @override
  String get termsUse1 =>
      'Corvista היא כלי עזר למודעות בנהיגה ולמצלמת דרך. האחריות לנהיגה בטוחה וחוקית מוטלת עליכם בלבד, בכל עת.';

  @override
  String get termsUse2 =>
      'אל תפעילו את האפליקציה באופן שמסיח את דעתכם בזמן נהיגה. קבעו את המכשיר בחוזקה ובאופן חוקי.';

  @override
  String get termsAccuracyTitle => 'ללא התחייבות לדיוק';

  @override
  String get termsAccuracy1 =>
      'זיהויים, אזורים, התראות, סמנים במפה, מסלולים ומזג אוויר עלולים להיות חלקיים, מאוחרים או שגויים. Corvista אינה שולטת ברכב שלכם.';

  @override
  String get termsAccuracy2 =>
      'תכונת החירום היא ניסיונית ועלולה שלא לזהות פגיעה או להיות מופעלת בטעות.';

  @override
  String get termsRecordingTitle => 'חוקי הקלטה';

  @override
  String get termsRecording1 =>
      'החוקים בנוגע למצלמות דרך, הקלטת שמע וצילום אנשים שונים בין מדינות ואזורים. האחריות לציית להם, כולל בעת שיתוף קטעים, מוטלת עליכם.';

  @override
  String get termsLiabilityTitle => 'אחריות';

  @override
  String get termsLiability1 =>
      'האפליקציה מסופקת ״כפי שהיא״. במידה המותרת בדין, המפתח אינו אחראי לתאונות, הפסדים, קנסות או נזקים הנובעים מהשימוש בה או מהסתמכות על הפלט שלה.';

  @override
  String get termsChangesTitle => 'שינויים';

  @override
  String get termsChanges1 =>
      'ייתכן שתנאים אלה יעודכנו עם גרסאות חדשות של האפליקציה. המשך שימוש לאחר עדכון מהווה הסכמה לתנאים המעודכנים.';

  @override
  String get helpTitle => 'עזרה';

  @override
  String get helpIntro =>
      'תשובות לשאלות נפוצות. להנחיות בטיחות, ראו ״מידע בטיחות״.';

  @override
  String get helpQSave => 'איך שומרים צילום של אירוע?';

  @override
  String get helpASaveBuffer =>
      'הקישו על הכפתור הגדול ״שמירת אירוע״ בתצוגת הנהיגה. Corvista שומרת ב״קטעים״ את 20 או 30 השניות האחרונות מהמאגר הרציף שלה (לבחירתכם בהגדרות › הקלטה).';

  @override
  String get helpQWhere => 'היכן הקטעים שלי נשמרים?';

  @override
  String get helpAWhere =>
      'באחסון הפרטי של Corvista ב-iPhone שלכם. הם לעולם אינם מועלים. השתמשו ב״שיתוף״ בנגן כדי לשלוח או לייצא קטע.';

  @override
  String get helpQZones => 'עד כמה מדויקים אזורי הקרבה?';

  @override
  String get helpAZones =>
      'האזורים הם הערכות גסות ממצלמה אחת, לפי גדלים אופייניים של עצמים. התייחסו אליהם כרמזים משוערים, ולעולם לא כמרחקים.';

  @override
  String get helpQSlow => 'למה הזיהוי מאט?';

  @override
  String get helpASlow =>
      'כשה-iPhone מתחמם, הסוללה חלשה או מצב צריכת חשמל נמוכה פועל, Corvista מפחיתה את קצב הניתוח כדי להגן על המכשיר. אפשר לשנות את מצב צריכת החשמל בהגדרות.';

  @override
  String get helpQMap => 'המפה, החיפוש או מזג האוויר לא עובדים.';

  @override
  String get helpAMap =>
      'תכונות אלה דורשות חיבור לאינטרנט וגישה למיקום. בדקו את החיבור ואפשרו מיקום עבור Corvista בהגדרות iOS.';

  @override
  String get helpQSimulator => 'המצלמה מופיעה כלא זמינה.';

  @override
  String get helpASimulator =>
      'ודאו שהגישה למצלמה מאושרת בהגדרות iOS ושאפליקציה אחרת אינה משתמשת במצלמה. ב-iOS Simulator אין מצלמה; אפשר להשתמש במקום זאת בסרטון בדיקה מקומי.';

  @override
  String get emergencyMsgNoContacts => 'הוסיפו תחילה איש קשר לחירום.';

  @override
  String get cameraStarting => 'מפעיל מצלמה…';

  @override
  String get cameraInterrupted => 'המצלמה הושהתה';

  @override
  String get cameraInterruptedBody =>
      'iOS השהתה את המצלמה, למשל במהלך שיחה או כשאפליקציה אחרת משתמשת בה. היא תחזור לפעול אוטומטית.';

  @override
  String get cameraUnavailable => 'המצלמה אינה זמינה';

  @override
  String get cameraUnavailableBody =>
      'אין מצלמה זמינה במכשיר זה. תצוגות הזיהוי, ההקלטה והחניה דורשות את המצלמה האחורית.';

  @override
  String get cameraRunTestFootage => 'הפעלת צילום בדיקה';

  @override
  String get cameraPermissionDenied => 'הגישה למצלמה כבויה';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista זקוקה למצלמה לצורך זיהוי, הקלטת מצלמת דרך ותצוגות חניה. הפעילו את הגישה למצלמה בהגדרות.';

  @override
  String get cameraError => 'שגיאת מצלמה';

  @override
  String get cameraStopped => 'המצלמה נעצרה';

  @override
  String get cameraStart => 'הפעלת מצלמה';

  @override
  String get cameraFocusHint => 'הקישו כדי למקד';

  @override
  String get cameraPreviewLabel => 'תצוגת מצלמה חיה עם עצמים שזוהו';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'מצלמה $fps פריימים לשנייה · בינה מלאכותית $hz הרץ · $ms מילישניות · פריימים שנפלו $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'מהירות $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'אין מהירות GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'כיוון $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ‏$seconds שנ׳';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'הקלטת מאגר מצלמת הדרך, נצברו $seconds מתוך $target שניות';
  }

  @override
  String get hudRecIdle => 'REC כבוי';

  @override
  String get hudRecSaving => 'שומר…';

  @override
  String get hudRecError => 'שגיאת REC';

  @override
  String get hudAiPaused => 'בינה מלאכותית מושהית';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count עצמים',
      one: 'עצם אחד',
      zero: 'אין עצמים',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'זוהו $count עצמים',
      one: 'זוהה עצם אחד',
      zero: 'לא זוהו עצמים',
    );
    return 'מודל בינה מלאכותית $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'חם — הבינה המלאכותית האטה';

  @override
  String get hudThermalCritical => 'חם מדי — הבינה המלאכותית מושהית';

  @override
  String hudBatteryLow(String percent) {
    return 'סוללה $percent';
  }

  @override
  String get hudLowPower => 'מצב צריכת חשמל נמוכה';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'מזג אוויר $temperature, $condition. הקישו לפרטים.';
  }

  @override
  String get hudNoGuidance =>
      'חפשו יעד בתצוגת המפה כדי לראות כאן הנחיות ניווט.';

  @override
  String get navArrived => 'הגעתם ליעד';

  @override
  String get navRerouting => 'מחשב מסלול מחדש…';

  @override
  String get navSearchHint => 'חיפוש יעד';

  @override
  String get navSearchFieldHint => 'כתובת, מקום או עסק';

  @override
  String get navNoResults => 'לא נמצאו מקומות מתאימים';

  @override
  String get navSearching => 'מחפש…';

  @override
  String get navSearchStartTyping =>
      'הקלידו כתובת או שם מקום. התוצאות מגיעות מ-Apple Maps ודורשות חיבור לאינטרנט.';

  @override
  String get navErrorUnavailable =>
      'החיפוש והמסלולים אינם זמינים — בדקו את החיבור לאינטרנט.';

  @override
  String get navErrorNoLocation => 'ממתין למיקום שלכם כדי לתכנן מסלול.';

  @override
  String get navErrorPermission =>
      'הגישה למיקום כבויה, ולכן לא ניתן להתחיל מסלולים ממיקומכם.';

  @override
  String navErrorGeneric(String code) {
    return 'לא ניתן לטעון מסלולים ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'מסלולים אל $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'הגעה ב-$time';
  }

  @override
  String get navStart => 'התחלה';

  @override
  String get navEnd => 'סיום';

  @override
  String get navEndLabel => 'סיום ניווט';

  @override
  String navRemaining(String distance, String duration) {
    return 'נותרו $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'הודעה: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes דק׳',
      one: 'דקה',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours שע׳ $minutes דק׳';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'מסלול $index: $name';
  }

  @override
  String get weatherTitle => 'מזג אוויר';

  @override
  String weatherFeelsLike(String temperature) {
    return 'מרגיש כמו $temperature';
  }

  @override
  String get weatherPrecipitation => 'משקעים';

  @override
  String get weatherWind => 'רוח';

  @override
  String get weatherVisibility => 'טווח ראייה';

  @override
  String get weatherHumidity => 'לחות';

  @override
  String get weatherHourly => 'השעות הקרובות';

  @override
  String weatherAsOf(String time) {
    return 'עודכן $time';
  }

  @override
  String get weatherRefresh => 'רענון מזג האוויר';

  @override
  String get weatherUnavailable => 'מזג האוויר אינו זמין כרגע.';

  @override
  String get weatherNoLocation => 'מזג האוויר זקוק למיקום שלכם.';

  @override
  String get weatherLegal => 'מקורות נתונים ומידע משפטי';

  @override
  String weatherProvidedBy(String service) {
    return 'נתוני מזג אוויר: $service';
  }

  @override
  String get weatherNow => 'עכשיו';

  @override
  String get virtualEmpty => 'לא זוהו עצמים נתמכים';

  @override
  String get virtualEmptyCameraOff => 'התצוגה הווירטואלית זקוקה למצלמה החיה.';

  @override
  String get virtualLaneDisclaimer => 'קווי הנתיבים להמחשה בלבד ואינם מזוהים.';

  @override
  String virtualNearest(String zone) {
    return 'הקרוב ביותר: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'סצנת כביש וירטואלית: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'בינה מלאכותית: $status';
  }

  @override
  String get virtualStatusLive => 'פעילה';

  @override
  String get virtualStatusPaused => 'מושהית';

  @override
  String get virtualStatusCameraOff => 'המצלמה כבויה';

  @override
  String get virtualStatusTestFootage => 'צילום בדיקה';

  @override
  String get virtualEmptyHint =>
      'כלי רכב, אנשים, אופניים, רמזורים ותמרורי עצור יופיעו כאן כשיזוהו.';

  @override
  String get mapRecenter => 'מירכוז';

  @override
  String get mapZoomIn => 'הגדלה';

  @override
  String get mapZoomOut => 'הקטנה';

  @override
  String get mapUnsupported => 'המפה האינטראקטיבית זמינה ב-iPhone.';

  @override
  String get mapObjectsApprox => 'סמני העצמים הם מיקומים משוערים.';

  @override
  String get mapWeatherUnavailable => 'מזג האוויר אינו זמין';

  @override
  String get navErrorNoRoute => 'לא נמצא מסלול ליעד זה.';

  @override
  String get navDismiss => 'סגירה';

  @override
  String get navGo => 'יוצאים';

  @override
  String get navFastest => 'המהיר ביותר';

  @override
  String get navThen => 'אחר כך';

  @override
  String get navRecents => 'אחרונים';

  @override
  String get navClearRecents => 'ניקוי';

  @override
  String get navSearchSubmitHint =>
      'לחצו על חיפוש כדי לראות את כל המקומות המתאימים';

  @override
  String get navPlaces => 'מקומות';

  @override
  String get navEtaLabel => 'הגעה';

  @override
  String get navTimeLeftLabel => 'נותר';

  @override
  String get navOverview => 'סקירה';

  @override
  String get navMute => 'השתקת הקול';

  @override
  String get navUnmute => 'ביטול השתקת הקול';

  @override
  String get navEndConfirm => 'לסיים את הניווט?';

  @override
  String navEndConfirmBody(String place) {
    return 'ההנחיה אל $place תיפסק.';
  }

  @override
  String navArrivedAt(String place) {
    return 'הגעתם אל $place';
  }

  @override
  String get navDone => 'סיום';

  @override
  String get navWeakGps => 'אות GPS חלש';

  @override
  String get navLocationOff =>
      'המיקום כבוי. הפעילו אותו כדי לתכנן מסלולים ולנווט.';

  @override
  String get navVoiceGuidance => 'הנחיה קולית';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'בעוד $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, ואז $second';
  }

  @override
  String get navSpeakRerouting => 'מחשב מסלול מחדש';

  @override
  String get navSpeakArrived => 'הגעתם ליעד';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מטרים',
      one: 'מטר אחד',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value קילומטרים',
      one: 'קילומטר אחד',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count רגל',
      one: 'רגל אחת',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count יארדים',
      one: 'יארד אחד',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'המשיכו $distance';
  }

  @override
  String get navErrorNoDirections =>
      'הנחיות אינן זמינות לנסיעה זו באזור זה. נסו יעד אחר.';

  @override
  String navContinueFor(String distance) {
    return 'המשיכו $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value מיילים',
      one: 'מייל אחד',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'הקרוב ביותר: $object · $zone';
  }

  @override
  String get parkingNothing => 'לא זוהה דבר בתצוגה';

  @override
  String get parkingBeeps => 'צפצופי קרבה';

  @override
  String get parkingVolume => 'עוצמת הצפצוף';

  @override
  String get parkingLimitations =>
      'מצלמה אחת, לא 360°. עצמים מחוץ לשדה הראייה של המצלמה אינם מזוהים. אינו תחליף לחיישני חניה; ההערכות עלולות להיות שגויות ושקט אינו אומר שהאזור פנוי.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'תצוגת קרבה מלמעלה. $summary';
  }

  @override
  String get perceptionModeOriginal => 'מקור';

  @override
  String get perceptionModeBoxes => 'מסגרות';

  @override
  String get perceptionModeMasks => 'מסכות עצמים';

  @override
  String get perceptionModeRoad => 'משטח הכביש';

  @override
  String get perceptionModeCombined => 'משולב';

  @override
  String get perceptionOpacity => 'שקיפות המסכה';

  @override
  String get perceptionDisclaimer =>
      'מסכת משטח הכביש היא שכבה חזותית משוערת. היא אינה מציגה שטח פנוי לנסיעה או נתיבים.';

  @override
  String get perceptionNeedsModel => 'בחרו את מודל הסגמנטציה כדי לראות מסכות.';

  @override
  String get perceptionChooseModel => 'בחירת מודל';

  @override
  String get perceptionWaiting => 'ממתין לפריים הסגמנטציה הראשון…';

  @override
  String get perceptionShortCamera => 'מצלמה';

  @override
  String get perceptionShortBoxes => 'מסגרות';

  @override
  String get perceptionShortObjects => 'עצמים';

  @override
  String get perceptionShortRoad => 'כביש';

  @override
  String get perceptionShortAll => 'הכול';

  @override
  String get perceptionModesLabel => 'שכבות תפיסה';

  @override
  String get perceptionStatusWarmingUp => 'מתחמם…';

  @override
  String get perceptionStatusLoadingModel => 'טוען מודל…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'המסכות מושהות';

  @override
  String get perceptionLegend => 'מקרא המסכות';

  @override
  String get perceptionUnavailable => 'המסכות אינן זמינות';

  @override
  String get driveSave => 'שמירה';

  @override
  String get driveSaveIncident => 'שמירת אירוע';

  @override
  String driveSaveHint(int seconds) {
    return 'שומר את $seconds השניות האחרונות של צילום מצלמת הדרך';
  }

  @override
  String get driveSaving => 'שומר אירוע…';

  @override
  String hudRecManualLabel(String time) {
    return 'מקליט, $time';
  }

  @override
  String get driveRecord => 'הקלטה';

  @override
  String get driveRecordStartA11y => 'התחלת הקלטה';

  @override
  String driveRecordStopA11y(String time) {
    return 'עצירת הקלטה, הוקלטו $time';
  }

  @override
  String get driveRecordHint =>
      'מקליט ברציפות עד שתעצרו, כולל 5 השניות האחרונות';

  @override
  String get driveRecordFailed => 'לא ניתן להתחיל להקליט';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ההקלטה נשמרה · $count חלקים',
      one: 'ההקלטה נשמרה',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'ההקלטה נעצרה: האחסון כמעט מלא',
      'max_duration': 'ההקלטה נעצרה: הושג האורך המרבי',
      'camera_stopped': 'ההקלטה נעצרה יחד עם המצלמה',
      'background': 'ההקלטה נעצרה: האפליקציה עברה לרקע',
      'thermal': 'ההקלטה נעצרה: הטלפון חם מדי',
      'other': 'ההקלטה נעצרה',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'האירוע נשמר · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'צפייה';

  @override
  String get driveSaveFailed => 'לא ניתן לשמור את האירוע.';

  @override
  String get driveSaveNotRunning =>
      'ההקלטה עדיין לא התחילה — המתינו להפעלת המצלמה ונסו שוב.';

  @override
  String get driveSaveTestFootage =>
      'צילום בדיקה אינו מוקלט. שמירת אירועים פועלת עם המצלמה החיה.';

  @override
  String get driveSaveStorageFull =>
      'האחסון ב-iPhone שלכם מלא. פנו מקום או מחקו קטעים ישנים.';

  @override
  String get driveSaveIoError => 'לא ניתן היה לכתוב את הקטע לאחסון.';

  @override
  String get driveClips => 'קטעים';

  @override
  String get driveSettings => 'הגדרות';

  @override
  String get driveViewSwitcher => 'תצוגות נסיעה';

  @override
  String get driveLocationDenied =>
      'המיקום כבוי — המהירות, המפות והמסלולים אינם זמינים.';

  @override
  String get driveCameraDenied =>
      'הגישה למצלמה כבויה — הזיהוי וההקלטה אינם זמינים.';

  @override
  String get driveRecorderFallback => 'מקליט ללא שמע: הגישה למיקרופון כבויה.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'הגדרות ההקלטה הותאמו: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'ה-iPhone שלכם חם. הבינה המלאכותית פועלת לאט יותר כדי להתקרר — הרחיקו אותו משמש ישירה וקרבו אותו לפתח אוורור.';

  @override
  String get drivePowerThermalCritical =>
      'ה-iPhone שלכם חם מדי. זיהוי הבינה המלאכותית מושהה עד שיתקרר; ההקלטה נמשכת אם אפשר.';

  @override
  String get drivePowerLowPower =>
      'מצב צריכת חשמל נמוכה פועל — הבינה המלאכותית פועלת בקצב מופחת.';

  @override
  String get drivePowerBatteryLow =>
      'הסוללה חלשה — חברו את ה-iPhone לחשמל בזמן הנסיעה.';

  @override
  String get onboardingTitle1 => 'ראו יותר מכל נסיעה.';

  @override
  String get onboardingBody1 =>
      'הפכו את ה-iPhone שלכם למצלמת דרך חכמה וללוויית מודעות בנהיגה.';

  @override
  String get onboardingTitle2 => 'אינטליגנציה בכל פריים.';

  @override
  String get onboardingBody2 =>
      'זיהוי של כלי רכב נתמכים, אנשים, אופניים ואותות דרך ישירות ב-iPhone שלכם.';

  @override
  String get onboardingTitle3 => 'כביש אחד. כמה נקודות מבט.';

  @override
  String get onboardingBody3 =>
      'עברו בין זיהוי חי, תצוגות נהיגה וירטואליות, מפות אינטראקטיביות והמחשת חניה.';

  @override
  String get onboardingTitle4 => 'שמרו את הרגעים החשובים.';

  @override
  String get onboardingBody4 =>
      'שמרו צילומי מצלמת דרך אחרונים, סקרו אירועים ושתפו הקלטות.';

  @override
  String get onboardingTitle5 => 'בטיחות ופרטיות';

  @override
  String get onboardingSafety1 =>
      'Corvista היא כלי עזר למודעות בנהיגה. שימו עיניים על הכביש.';

  @override
  String get onboardingSafety2 =>
      'היא אינה שולטת ברכב שלכם ואינה מחליפה את שיקול הדעת שלכם.';

  @override
  String get onboardingSafety3 =>
      'זיהויים והערכות עלולים להיות לא מדויקים או להיפספס.';

  @override
  String get onboardingSafety4 =>
      'עיבוד המצלמה מתבצע ב-iPhone שלכם — הווידאו אינו מועלה.';

  @override
  String get onboardingSafety5 =>
      'מפות, חיפוש, מסלולים ומזג אוויר דורשים חיבור לאינטרנט.';

  @override
  String get onboardingSafety6 =>
      'קבעו את ה-iPhone בחוזקה כך שלא יחסום את שדה הראייה.';

  @override
  String get onboardingSafety7 => 'השלימו את ההגדרה לפני שאתם מתחילים לנהוג.';

  @override
  String get onboardingAcknowledge =>
      'אני מבין/ה ש-Corvista היא כלי עזר למודעות, ושהאחריות לנהיגה בטוחה נשארת שלי.';

  @override
  String get onboardingReadSafety => 'קריאת מידע הבטיחות המלא';

  @override
  String get onboardingNext => 'הבא';

  @override
  String get onboardingSkip => 'דילוג';

  @override
  String get onboardingAgree => 'המשך';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'עמוד $current מתוך $total';
  }

  @override
  String get permTitle => 'הרשאות';

  @override
  String get permIntro =>
      'Corvista מבקשת רק את מה שכל תכונה צריכה. אפשר לשנות זאת בכל עת בהגדרות.';

  @override
  String get permCameraTitle => 'מצלמה';

  @override
  String get permCameraBody =>
      'נדרשת לזיהוי, להקלטת מצלמת דרך ולתצוגת החניה. הווידאו מעובד ב-iPhone שלכם.';

  @override
  String get permLocationTitle => 'מיקום';

  @override
  String get permLocationBody =>
      'משמש למהירות GPS, למפה, למסלולים, למזג האוויר ולתיוג קטעים שנשמרו. רק בזמן שאתם משתמשים באפליקציה.';

  @override
  String get permMicTitle => 'מיקרופון';

  @override
  String get permSpeechNote =>
      'זיהוי דיבור מתבקש רק אם תפעילו ביטול בקול להתראות חירום.';

  @override
  String get permRequired => 'נדרש';

  @override
  String get permOptional => 'אופציונלי';

  @override
  String get permAllow => 'אישור';

  @override
  String get permGranted => 'מאושר';

  @override
  String get permDenied => 'נדחה';

  @override
  String get permLimited => 'מוגבל';

  @override
  String get permRestricted => 'מוגבל על ידי המערכת';

  @override
  String get permStart => 'התחלת נהיגה';

  @override
  String get permCameraNeeded =>
      'אפשר להמשיך ללא גישה למצלמה, אך הזיהוי וההקלטה לא יפעלו עד שתאשרו אותה בהגדרות.';

  @override
  String get permSetupIntro =>
      'Corvista זקוקה לאלה כדי לפעול במלואה. הקישו על ״אישור הכול״ ו-iOS תבקש כל אחת בתורה. אפשר לשנות אותן בכל עת בהגדרות.';

  @override
  String get permCameraLine =>
      'נדרשת לזיהוי, להקלטת מצלמת דרך ולתצוגת החניה. הווידאו מעובד ב-iPhone שלכם ולעולם אינו מועלה.';

  @override
  String get permLocationLine =>
      'מהירות GPS, מפה, מסלולים, מזג אוויר והמקום שבו נשמרו הקטעים. רק בזמן שאתם משתמשים באפליקציה.';

  @override
  String get permMicLine =>
      'שמע מתוך הרכב בקטעי אירועים, וכדי לשמוע את ביטוי הביטול שלכם במהלך התראת חירום.';

  @override
  String get permSpeechTitle => 'זיהוי דיבור';

  @override
  String get permSpeechLine =>
      'מזהה את ביטוי הביטול שלכם במהלך ספירה לאחור בחירום, ב-iPhone שלכם כשהדבר נתמך.';

  @override
  String get permAllowAll => 'אישור הכול';

  @override
  String permAsking(String permission) {
    return 'מבקש הרשאה: $permission…';
  }

  @override
  String get permSomeDenied =>
      'חלק מההרשאות כבויות. הפעילו אותן בהגדרות כדי להשתמש בתכונות אלה.';

  @override
  String get permNotNow => 'לא עכשיו';

  @override
  String get tourLabel => 'סיור במסך הנסיעה';

  @override
  String tourProgress(int current, int total) {
    return 'שלב $current מתוך $total';
  }

  @override
  String get tourNext => 'הבא';

  @override
  String get tourBack => 'הקודם';

  @override
  String get tourSkip => 'דילוג על הסיור';

  @override
  String get tourFinish => 'התחלת נהיגה';

  @override
  String get tourWelcomeTitle => 'הסיור המהיר שלכם';

  @override
  String get tourWelcomeBody =>
      'מבט של דקה על מה שחשוב במסך הנסיעה. מומלץ לעשות זאת כשהרכב חונה.';

  @override
  String get tourHudTitle => 'רצועת המחוונים';

  @override
  String get tourHudSpeed => 'המהירות מגיעה מ-GPS.';

  @override
  String get tourHudRec => 'REC מציג כמה שניות של צילום נצברו במאגר.';

  @override
  String get tourHudAi =>
      'שבב הבינה המלאכותית מציג את המודל, כמה עצמים הוא רואה, ונקודה: ירוק פועל, כתום מוגבל, אדום נעצר.';

  @override
  String get tourSaveTitle => 'שמירת אירוע';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista שומרת מאגר מתגלגל של $seconds השניות האחרונות של וידאו. הוא נדרס ברציפות, ולכן דבר אינו נשמר אלא אם תקישו על ״שמירה״. קטעים שמורים נשארים ב-iPhone זה, ב״קטעים״.';
  }

  @override
  String get tourRecordTitle => 'הקליטו את כל הנסיעה';

  @override
  String get tourRecordBody =>
      'הקישו על ״הקלטה״ כדי לצלם ברציפות עד שתעצרו. נסיעות ארוכות נשמרות ב״קטעים״ בחלקים של 5 דקות, ו״שמירת אירוע״ ממשיכה לפעול בזמן ההקלטה.';

  @override
  String get tourViewsTitle => 'חמש דרכים לראות את הכביש';

  @override
  String get tourViewDetection => 'מצלמה חיה עם מסגרות סביב עצמים נתמכים.';

  @override
  String get tourViewVirtual => 'סצנה תלת-ממדית פשוטה שנבנית מזיהויים.';

  @override
  String get tourViewMap => 'Apple Maps עם חיפוש והנחיות ניווט.';

  @override
  String get tourViewParking => 'מצלמה בתוספת תצוגת קרבה מלמעלה.';

  @override
  String get tourViewPerception => 'מסכות כביש ועצמים.';

  @override
  String get tourMapTitle => 'חיפוש וניווט';

  @override
  String get tourMapBody =>
      'פתחו את המפה, הקישו על סרגל החיפוש ובחרו יעד. בחרו מסלול והקישו על ״התחלה״ להנחיות ניווט. דורש חיבור לאינטרנט.';

  @override
  String get tourClipsTitle => 'קטעים';

  @override
  String get tourClipsBody =>
      'סקרו, שנו שם, שתפו או מחקו אירועים שמורים. הקטעים נשארים ב-iPhone שלכם אלא אם תשתפו אותם.';

  @override
  String get tourSettingsTitle => 'הגדרות';

  @override
  String get tourSettingsBody =>
      'כווננו את ההתראות הקוליות ורגישותן, איכות ההקלטה ואורך המאגר, והגדירו את מצב החירום: התראת פגיעה ניסיונית עם ספירה לאחור לביטול.';

  @override
  String get tourSafetyTitle => 'לפני הנהיגה';

  @override
  String get tourSafety1 =>
      'קבעו את ה-iPhone בחוזקה במקום שאינו חוסם את שדה הראייה.';

  @override
  String get tourSafety2 =>
      'אל תפעילו את האפליקציה בזמן נהיגה. הגדירו הכול כשהרכב חונה.';

  @override
  String get tourSafety3 =>
      'זיהויים ואזורים הם הערכות. הם עלולים להיות שגויים או להיפספס.';

  @override
  String get tourSafety4 => 'האחריות לנהיגה בטוחה נשארת שלכם.';

  @override
  String get helpTakeTour => 'לסיור';

  @override
  String get helpTakeTourSub => 'מבט מודרך של דקה על מסך הנסיעה.';

  @override
  String get tripsTitle => 'נסיעות';

  @override
  String get tripsOpen => 'יומן נסיעות';

  @override
  String get tripsEmptyTitle => 'אין נסיעות עדיין';

  @override
  String get tripsEmptyBody =>
      'נסיעות נרשמות אוטומטית בזמן שאתם נוהגים עם Corvista — מרחק, זמן, מהירות והמסלול שנסעתם.';

  @override
  String get tripsDisabledBody =>
      'יומן הנסיעות כבוי, ולכן נסיעות חדשות אינן נרשמות. הפעילו אותו כדי לשמור יומן פרטי של המסלולים שלכם ב-iPhone זה.';

  @override
  String get tripsEnable => 'הפעלת יומן נסיעות';

  @override
  String get tripsToday => 'היום';

  @override
  String get tripsYesterday => 'אתמול';

  @override
  String tripsRecordingNow(String distance) {
    return 'מתעד נסיעה · $distance';
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
      other: '$count אירועים',
      one: 'אירוע אחד',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count התראות',
      one: 'התראה אחת',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count נסיעות',
      one: 'נסיעה אחת',
      zero: 'אין נסיעות',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'מרחק';

  @override
  String get tripsStatDuration => 'משך';

  @override
  String get tripsStatMoving => 'זמן תנועה';

  @override
  String get tripsStatAvgSpeed => 'מהירות ממוצעת';

  @override
  String get tripsStatMaxSpeed => 'מהירות מרבית';

  @override
  String get tripsDetections => 'זיהויים';

  @override
  String get tripsNoDetections => 'לא נרשמו עצמי כביש בנסיעה זו.';

  @override
  String get tripsTimeline => 'ציר זמן';

  @override
  String get tripsEventStart => 'הנסיעה התחילה';

  @override
  String get tripsEventEnd => 'הנסיעה הסתיימה';

  @override
  String get tripsEventAlert => 'התראה קולית';

  @override
  String get tripsEventIncident => 'קטע אירוע נשמר';

  @override
  String get tripsEventEmergency => 'זוהתה תאונה אפשרית';

  @override
  String get tripsEventNavStart => 'הניווט התחיל';

  @override
  String get tripsEventArrive => 'הגעה ליעד';

  @override
  String get tripsEventReroute => 'המסלול חושב מחדש';

  @override
  String get tripsEventRecording => 'ההקלטה נשמרה';

  @override
  String get tripsOpenClip => 'פתיחת הקטע';

  @override
  String get tripsTrackPreview => 'מסלול GPS';

  @override
  String get tripsRenameTitle => 'שינוי שם הנסיעה';

  @override
  String get tripsRenameHint => 'שם הנסיעה';

  @override
  String get tripsFavorite => 'הוספה למועדפים';

  @override
  String get tripsUnfavorite => 'הסרה מהמועדפים';

  @override
  String get tripsShareGpx => 'שיתוף GPX';

  @override
  String get tripsShareFailed => 'לא ניתן לשתף את הנסיעה.';

  @override
  String get tripsDelete => 'מחיקת הנסיעה';

  @override
  String get tripsDeleteConfirmTitle => 'למחוק את הנסיעה?';

  @override
  String get tripsDeleteConfirmBody =>
      'המסלול והנתונים הסטטיסטיים יוסרו מה-iPhone הזה. קטעי אירועים מנסיעה זו יישמרו.';

  @override
  String get tripsDeleted => 'הנסיעה נמחקה';

  @override
  String get tripsNotFound => 'הנסיעה אינה זמינה עוד.';

  @override
  String get tripsPrivacyNote => 'נשמר ב-iPhone זה בלבד. דבר אינו מועלה.';

  @override
  String get settingsSectionTrips => 'יומן נסיעות';

  @override
  String get settingsTripLog => 'תיעוד נסיעות';

  @override
  String get settingsTripLogSubtitle =>
      'שומר את המסלול ונתוני הנסיעה ב-iPhone זה בלבד.';

  @override
  String get settingsTripRetention => 'שמירת נסיעות למשך';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ימים',
      one: 'יום אחד',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => 'שנה';

  @override
  String get settingsRetentionForever => 'ללא הגבלה';

  @override
  String get settingsTripRetentionFooter =>
      'נסיעות ישנות נמחקות אוטומטית כש-Corvista מופעלת.';

  @override
  String get settingsViewTrips => 'הצגת נסיעות';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours שע׳ $minutes דק׳';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes דק׳';
  }

  @override
  String tripsGpxName(String date) {
    return 'נסיעת Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'פינוי מקום';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'מסיר קבצים זמניים ומטמונים. קטעים ונסיעות שמורים נשארים.';

  @override
  String settingsFreedBytes(String size) {
    return 'פונו $size';
  }

  @override
  String get settingsNothingToFree => 'המטמונים נוקו — אין קבצים זמניים להסרה.';

  @override
  String get settingsSectionPrivacyData => 'פרטיות ונתונים';

  @override
  String get settingsPrivacyDataFooter =>
      'קטעים, נסיעות והגדרות נשמרים רק ב-iPhone הזה. הם יוצאים ממנו רק כשאתם בוחרים לשתף אותם.';

  @override
  String get settingsDeleteAllData => 'מחיקת כל הנתונים';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'מחיקת קטעים, נסיעות, אנשי קשר והגדרות מה-iPhone הזה';

  @override
  String get deleteAllTitle => 'למחוק את כל הנתונים?';

  @override
  String get deleteAllMessage =>
      'הפעולה תסיר לצמיתות מה-iPhone הזה:\n• קטעי אירועים ותמונות ממוזערות\n• יומן נסיעות ומסלולי GPS\n• אנשי קשר לחירום ואירועי חירום\n• יומני זיהוי ויומן האבחון\n• הגדרות ויעדים אחרונים\n• מאגר הקלטה זמני ומטמון\n\nלא ניתן לבטל פעולה זו. לאחר מכן Corvista תתחיל מחדש ממסכי הפתיחה.';

  @override
  String get deleteAllConfirm => 'מחיקת הכול';

  @override
  String get deleteAllInProgress => 'מוחק…';

  @override
  String get deleteAllDone => 'כל הנתונים נמחקו';

  @override
  String get deleteAllPartial =>
      'לא ניתן היה למחוק חלק מהפריטים. נסו שוב מההגדרות.';

  @override
  String get diagLogSection => 'יומן אבחון';

  @override
  String get diagLogFooter =>
      'שגיאות נרשמות רק ב-iPhone הזה, ללא מיקומים, שמות אנשי קשר או מספרי טלפון. דבר אינו נשלח אלא אם תשתפו את היומן בעצמכם.';

  @override
  String get diagLogShare => 'שיתוף יומן האבחון';

  @override
  String get diagLogEmpty => 'ריק';

  @override
  String get diagLogClear => 'ניקוי היומן';

  @override
  String get diagLogClearTitle => 'לנקות את יומן האבחון?';

  @override
  String get diagLogClearBody => 'רשומות השגיאות שנשמרו יימחקו מה-iPhone הזה.';

  @override
  String get diagLogCleared => 'יומן האבחון נוקה';

  @override
  String get diagLogShareFailed => 'לא ניתן היה לשתף את יומן האבחון.';

  @override
  String get privacyControls2 =>
      'הגדרות › פרטיות ונתונים › מחיקת כל הנתונים מוחקת כל קטע, נסיעה, איש קשר, יומן והגדרה ש-Corvista שמרה ב-iPhone הזה.';

  @override
  String get parkingZoneStop => 'עצור';

  @override
  String get parkingZoneVeryClose => 'קרוב מאוד';

  @override
  String get parkingZoneClose => 'קרוב';

  @override
  String get parkingZoneNothingClose => 'לא זוהה דבר קרוב';

  @override
  String get parkingNotDetected => 'קירות, עמודים, מוטות ומדרכות אינם מזוהים';

  @override
  String get parkingApprox => 'בק׳';

  @override
  String get parkingSideLeft => 'שמאל';

  @override
  String get parkingSideCenter => 'מרכז';

  @override
  String get parkingSideRight => 'ימין';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => 'תצוגת מצלמה קדמית בלבד — לא מערכת 360°';

  @override
  String get parkingMuteBeeps => 'השתקת הצפצופים';

  @override
  String get parkingUnmuteBeeps => 'הפעלת הצפצופים';

  @override
  String get parkingAbout => 'על תצוגת החנייה';

  @override
  String get parkingLimitationsDetail =>
      'רק האזור שלפני המצלמה מנוטר. הגלאי מזהה מכוניות, אוטובוסים ומשאיות, אנשים, אופניים ואופנועים. קירות, עמודים, מוטות, שפות מדרכה, בולארדים, מחסומים ומכשולים נמוכים אינם מזוהים, והמכסה הקדמי עלול להסתיר את הקרקע מיד לפני הרכב. המרחקים הם הערכות גסות ממצלמה אחת (לפי גודל ומיקום העצם) ועלולים להיות שגויים מאוד. שקט או ״לא זוהה דבר קרוב״ אינם אומרים שהדרך פנויה — הביטו תמיד סביבכם והשתמשו במראות.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'קרבה לפי צד: שמאל $left, מרכז $center, ימין $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'שגיאות נכתבות ליומן פרטי ב-iPhone הזה (ללא מיקומים, שמות אנשי קשר או מספרי טלפון). היומן לעולם אינו נשלח אוטומטית; אפשר לשתף או לנקות אותו בהגדרות › אבחון.';
}
