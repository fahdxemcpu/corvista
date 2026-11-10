// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'ஒவ்வொரு பயணத்திலும் இன்னும் அதிகம் காணுங்கள்.';

  @override
  String get commonCancel => 'ரத்துசெய்';

  @override
  String get commonDelete => 'நீக்கு';

  @override
  String get commonSave => 'சேமி';

  @override
  String get commonBack => 'பின்செல்';

  @override
  String get commonClose => 'மூடு';

  @override
  String get commonRetry => 'மீண்டும் முயல்';

  @override
  String get commonOpenSettings => 'அமைப்புகளைத் திற';

  @override
  String get commonLoading => 'ஏற்றுகிறது…';

  @override
  String get commonError => 'ஏதோ தவறு நேர்ந்தது.';

  @override
  String commonErrorDetail(String message) {
    return 'ஏதோ தவறு நேர்ந்தது: $message';
  }

  @override
  String get commonOn => 'இயக்கத்தில்';

  @override
  String get commonOff => 'நிறுத்தத்தில்';

  @override
  String get commonRename => 'மறுபெயரிடு';

  @override
  String get commonShare => 'பகிர்';

  @override
  String get commonNotAvailable => 'கிடைக்கவில்லை';

  @override
  String get commonTestFootage => 'சோதனைக் காட்சிப்பதிவு';

  @override
  String get zoneVeryClose => 'மிக அருகில்';

  @override
  String get zoneClose => 'அருகில்';

  @override
  String get zoneMedium => 'நடுத்தரம்';

  @override
  String get zoneFar => 'தொலைவில்';

  @override
  String get zoneUnknown => 'தெரியவில்லை';

  @override
  String get classPerson => 'நபர்';

  @override
  String get classBicycle => 'மிதிவண்டி';

  @override
  String get classMotorcycle => 'மோட்டார் சைக்கிள்';

  @override
  String get classCar => 'வாகனம்';

  @override
  String get classBus => 'பேருந்து';

  @override
  String get classTrafficLight => 'போக்குவரத்து விளக்கு';

  @override
  String get classStopSign => 'நிறுத்த அடையாளம்';

  @override
  String get viewDetection => 'கண்டறிதல்';

  @override
  String get viewVirtual => 'மெய்நிகர்';

  @override
  String get viewMap => 'வரைபடம்';

  @override
  String get viewParking => 'நிறுத்தம்';

  @override
  String get viewPerception => 'உணர்திறன்';

  @override
  String get unitKmh => 'கி.மீ/ம';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'சிவப்பு';

  @override
  String get lightYellow => 'மஞ்சள்';

  @override
  String get lightGreen => 'பச்சை';

  @override
  String get lightUnknown => 'தெரியவில்லை';

  @override
  String get clipsTitle => 'கிளிப்புகள்';

  @override
  String get clipsSelect => 'தேர்ந்தெடு';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count தேர்ந்தெடுக்கப்பட்டன',
      one: '1 தேர்ந்தெடுக்கப்பட்டது',
      zero: 'கிளிப்புகளைத் தேர்ந்தெடு',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'அனைத்தையும் தேர்ந்தெடு';

  @override
  String get clipsDeselectAll => 'தேர்வை நீக்கு';

  @override
  String get clipsDeleteSelected => 'தேர்ந்தவற்றை நீக்கு';

  @override
  String get clipsGridView => 'கட்டக் காட்சி';

  @override
  String get clipsListView => 'பட்டியல் காட்சி';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கிளிப்புகளை நீக்கவா?',
      one: 'இந்த கிளிப்பை நீக்கவா?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'இந்த வீடியோக்கள் உங்கள் iPhone-இலிருந்து நிரந்தரமாக நீக்கப்படும். இதைச் செயல்தவிர்க்க முடியாது.',
      one: 'இந்த வீடியோ உங்கள் iPhone-இலிருந்து நிரந்தரமாக நீக்கப்படும். இதைச் செயல்தவிர்க்க முடியாது.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கிளிப்புகள் நீக்கப்பட்டன',
      one: 'கிளிப் நீக்கப்பட்டது',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'இன்னும் கிளிப்புகள் இல்லை';

  @override
  String get clipsEmptyBody =>
      'நீங்கள் ஓட்டும்போது Corvista ஒரு குறுகிய சுழல் இடையகத்தை வைத்திருக்கும். சமீபத்திய சில வினாடி காட்சிப்பதிவை இங்கே வைத்திருக்க சம்பவத்தைச் சேமி என்பதைத் தட்டுங்கள்.';

  @override
  String get clipsLoadError => 'உங்கள் கிளிப்புகளை ஏற்ற முடியவில்லை.';

  @override
  String get clipsStorageTitle => 'சேமிப்பகம்';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'கிளிப்புகள் $clips · இடையகம் $buffer · $free காலி';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'சேமித்த $count கிளிப்புகள்',
      one: 'சேமித்த 1 கிளிப்',
      zero: 'சேமித்த கிளிப்புகள் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'உங்கள் iPhone-இல் சேமிப்பிடம் குறைவாக உள்ளது. புதிய சம்பவங்கள் சேமிக்கப்படாமல் போகலாம்.';

  @override
  String get clipsMissingFile => 'கோப்பு இல்லை';

  @override
  String get clipsEmergencyBadge => 'மோதல்';

  @override
  String clipsUntitled(String date) {
    return 'சம்பவம் · $date';
  }

  @override
  String get clipsAudio => 'ஒலி பதிவுசெய்யப்பட்டது';

  @override
  String get clipsFavorite => 'பிடித்தவை';

  @override
  String get clipsUnfavorite => 'பிடித்தவையிலிருந்து நீக்கு';

  @override
  String get clipsLocation => 'இடம் சேமிக்கப்பட்டது';

  @override
  String clipsOpenClip(String title) {
    return 'கிளிப் $title ஐத் திற';
  }

  @override
  String get playerNotFoundTitle => 'கிளிப் கிடைக்கவில்லை';

  @override
  String get playerNotFoundBody => 'இந்த கிளிப் நீக்கப்பட்டிருக்கலாம்.';

  @override
  String get playerMissingTitle => 'வீடியோ கோப்பு இல்லை';

  @override
  String get playerMissingBody =>
      'இந்த கிளிப்பின் பதிவு உங்கள் iPhone-இல் இல்லை. உங்கள் தொகுப்பிலிருந்து இந்தப் பதிவை நீக்கலாம்.';

  @override
  String get playerRemoveEntry => 'பதிவை நீக்கு';

  @override
  String get playerLoadError => 'இந்த வீடியோவை இயக்க முடியவில்லை.';

  @override
  String get playerPlay => 'இயக்கு';

  @override
  String get playerPause => 'இடைநிறுத்து';

  @override
  String get playerReplay => 'மீண்டும் இயக்கு';

  @override
  String get playerRenameTitle => 'கிளிப்பை மறுபெயரிடு';

  @override
  String get playerRenameHint => 'கிளிப் பெயர்';

  @override
  String get playerRenamed => 'கிளிப் மறுபெயரிடப்பட்டது';

  @override
  String get playerFavorited => 'பிடித்தவையில் சேர்க்கப்பட்டது';

  @override
  String get playerUnfavorited => 'பிடித்தவையிலிருந்து நீக்கப்பட்டது';

  @override
  String get playerShareFailed => 'இந்த கிளிப்பைப் பகிர முடியவில்லை.';

  @override
  String get playerDetails => 'விவரங்கள்';

  @override
  String get playerDate => 'பதிவான நேரம்';

  @override
  String get playerDuration => 'கால அளவு';

  @override
  String get playerResolution => 'தெளிவுத்திறன்';

  @override
  String get playerSize => 'கோப்பு அளவு';

  @override
  String get playerAudio => 'ஒலி';

  @override
  String get playerAudioYes => 'பதிவுசெய்யப்பட்டது';

  @override
  String get playerAudioNo => 'பதிவுசெய்யப்படவில்லை';

  @override
  String get playerReason => 'சேமித்த முறை';

  @override
  String get playerReasonManual => 'சம்பவத்தைச் சேமி பொத்தான்';

  @override
  String get playerReasonEmergency => 'சாத்தியமான மோதல் கண்டறிதல்';

  @override
  String get playerReasonRecovered => 'இடையூறுக்குப் பின் மீட்கப்பட்டது';

  @override
  String get playerSpeed => 'சேமித்தபோதைய GPS வேகம்';

  @override
  String get playerLocation => 'இடம்';

  @override
  String get playerOpenInMaps => 'Maps-இல் திற';

  @override
  String get playerBack => 'பின்செல்';

  @override
  String get playerMore => 'கூடுதல் செயல்கள்';

  @override
  String get clipsFilterLabel => 'காட்டு';

  @override
  String get clipsFilterAll => 'அனைத்தும்';

  @override
  String get clipsFilterRecordings => 'பதிவுகள்';

  @override
  String get clipsFilterIncidents => 'சம்பவங்கள்';

  @override
  String get clipsFilterEmergency => 'அவசரநிலை';

  @override
  String get clipsFilterFavorites => 'பிடித்தவை';

  @override
  String get clipsSort => 'வரிசைப்படுத்து';

  @override
  String get clipsSortNewest => 'புதியவை முதலில்';

  @override
  String get clipsSortOldest => 'பழையவை முதலில்';

  @override
  String get clipsSortLongest => 'நீளமானவை முதலில்';

  @override
  String get clipsSortLargest => 'பெரியவை முதலில்';

  @override
  String get clipsToday => 'இன்று';

  @override
  String get clipsYesterday => 'நேற்று';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கிளிப்புகள்',
      one: '1 கிளிப்',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'இந்த வகையில் இன்னும் கிளிப்புகள் இல்லை.';

  @override
  String get clipsFavoritesEmpty =>
      'விரைவாக அணுக, கிளிப்பில் நட்சத்திரமிடுங்கள்; அது இங்கே இருக்கும்.';

  @override
  String get clipsKindRecording => 'பதிவு';

  @override
  String get clipsKindIncident => 'சம்பவம்';

  @override
  String get clipsKindEmergency => 'அவசரநிலை';

  @override
  String get clipsKindTest => 'சோதனை';

  @override
  String clipsTripChip(String time) {
    return 'பயணம் · $time';
  }

  @override
  String get clipsOpenTrip => 'இந்த கிளிப் பதிவான பயணத்தைத் திற';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used பயன்பாட்டில் · $free காலி';
  }

  @override
  String clipsStorageClips(String size) {
    return 'கிளிப்புகள் $size பயன்படுத்துகின்றன';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count பதிவுகள்',
      one: '1 பதிவு',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count சம்பவங்கள்',
      one: '1 சம்பவம்',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count அவசரநிலைகள்',
      one: '1 அவசரநிலை',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'இடத்தை விடுவி';

  @override
  String get clipsStorageLowGentle =>
      '2 GB-க்கும் குறைவான இடமே காலியாக உள்ளது. பதிவு சீராகத் தொடர, இடத்தை விடுவிக்கவும் அல்லது தேவையில்லாத கிளிப்புகளை நீக்கவும்.';

  @override
  String get clipsSaveToPhotos => 'Photos-இல் சேமி';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கிளிப்புகள்',
      one: '1 கிளிப்',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கிளிப்புகளை ($size) நீக்கவா?',
      one: 'இந்த கிளிப்பை ($size) நீக்கவா?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return '$total-இல் $done Photos-இல் சேமிக்கப்படுகிறது…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கிளிப்புகள் Photos-இல் சேமிக்கப்பட்டன',
      one: 'Photos-இல் சேமிக்கப்பட்டது',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved Photos-இல் சேமிக்கப்பட்டன · $failed சேமிக்க முடியவில்லை';
  }

  @override
  String get clipsPhotosDenied =>
      'Photos-இல் வீடியோக்களைச் சேர்க்க Corvista-வுக்கு அனுமதி இல்லை. அமைப்புகளில் அனுமதிக்கலாம்.';

  @override
  String get clipsPhotosFailed => 'Photos-இல் சேமிக்க முடியவில்லை.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கிளிப்புகள் பிடித்தவையில் சேர்க்கப்பட்டன',
      one: 'பிடித்தவையில் சேர்க்கப்பட்டது',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கிளிப்புகள் பிடித்தவையிலிருந்து அகற்றப்பட்டன',
      one: 'பிடித்தவையிலிருந்து அகற்றப்பட்டது',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (வெட்டியது)';
  }

  @override
  String get playerTrim => 'வெட்டு';

  @override
  String get playerInfo => 'தகவல்';

  @override
  String get playerKind => 'வகை';

  @override
  String get playerReasonRecording => 'பதிவு பொத்தான்';

  @override
  String get trimTitle => 'கிளிப்பை வெட்டு';

  @override
  String get trimHint =>
      'வைத்திருக்க வேண்டிய பகுதியைத் தேர்ந்தெடுக்க கைப்பிடிகளை இழுக்கவும். அசல் கிளிப் மாறாமல் இருக்கும்.';

  @override
  String get trimStartHandle => 'வெட்டின் தொடக்கம்';

  @override
  String get trimEndHandle => 'வெட்டின் முடிவு';

  @override
  String trimSelection(String duration) {
    return '$duration தேர்ந்தெடுக்கப்பட்டது';
  }

  @override
  String get trimSave => 'புதிய கிளிப்பாகச் சேமி';

  @override
  String get trimSaving => 'வெட்டிய கிளிப் சேமிக்கப்படுகிறது…';

  @override
  String get trimSaved => 'வெட்டிய கிளிப் சேமிக்கப்பட்டது';

  @override
  String get trimOpenNew => 'திற';

  @override
  String get trimFailed => 'இந்த கிளிப்பை வெட்ட முடியவில்லை.';

  @override
  String get trimStorageFull =>
      'வெட்டிய கிளிப்பைச் சேமிக்கப் போதுமான காலி இடம் இல்லை.';

  @override
  String get trimPreview => 'தேர்வை இயக்கு';

  @override
  String get settingsTitle => 'அமைப்புகள்';

  @override
  String get settingsSectionCamera => 'கேமரா';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'எச்சரிக்கைகள்';

  @override
  String get settingsSectionAlertCategories => 'எச்சரிக்கை வகைகள்';

  @override
  String get settingsSectionRecording => 'பதிவு';

  @override
  String get settingsSectionDriving => 'ஓட்டுதல்';

  @override
  String get settingsSectionPower => 'ஆற்றல்';

  @override
  String get settingsSectionEmergency => 'அவசரநிலை';

  @override
  String get settingsSectionAppearance => 'தோற்றம்';

  @override
  String get settingsSectionLanguage => 'மொழி';

  @override
  String get settingsSectionInformation => 'தகவல்';

  @override
  String get settingsCameraLens => 'கேமரா லென்ஸ்';

  @override
  String get settingsLensWide => 'வைட்';

  @override
  String get settingsLensUltraWide => 'அல்ட்ரா வைட்';

  @override
  String get settingsLensTelephoto => 'டெலிஃபோட்டோ';

  @override
  String get settingsLensUnavailable => 'இந்த iPhone-இல் கிடைக்கவில்லை';

  @override
  String get settingsStabilization => 'நிலைப்படுத்தல்';

  @override
  String get settingsStabAuto => 'தானியங்கி';

  @override
  String get settingsStabOff => 'நிறுத்தம்';

  @override
  String get settingsStabStandard => 'நிலையானது';

  @override
  String get settingsStabCinematic => 'சினிமாட்டிக்';

  @override
  String get settingsOverlayOpacity => 'மேலடுக்கு ஒளிபுகாமை';

  @override
  String get settingsShowFps => 'செயல்திறன் புள்ளிவிவரங்களைக் காட்டு';

  @override
  String get settingsShowFpsSubtitle =>
      'கண்டறிதல் காட்சியில் பிரேம் வீதமும் அனுமான நேரமும்';

  @override
  String get settingsCameraFooter =>
      'லென்ஸ், நிலைப்படுத்தல் மாற்றங்கள் அடுத்த முறை கேமரா தொடங்கும்போது செயல்படும்.';

  @override
  String get settingsAiModel => 'AI மாதிரி';

  @override
  String get settingsConfidence => 'கண்டறிதல் நம்பகத்தன்மை';

  @override
  String get settingsTracking => 'பொருள் கண்காணிப்பு';

  @override
  String get settingsTrackingSubtitle =>
      'பிரேம்களுக்கு இடையே பொருட்களை நிலையாக வைக்கும்';

  @override
  String get settingsShowLabels => 'லேபிள்களைக் காட்டு';

  @override
  String get settingsShowConfidence => 'நம்பகத்தன்மையைக் காட்டு';

  @override
  String get settingsSegmentationOpacity => 'உணர்திறன் மாஸ்க் ஒளிபுகாமை';

  @override
  String get settingsAiFooter =>
      'குறைந்த நம்பகத்தன்மை அதிக பொருட்களைக் காட்டும்; ஆனால் தவறான கண்டறிதல்களும் அதிகரிக்கும். கண்டறிதல்கள் துல்லியமற்றதாக இருக்கலாம்.';

  @override
  String get settingsVoiceAlerts => 'குரல் எச்சரிக்கைகள்';

  @override
  String get settingsVoiceLanguage => 'குரல் மொழி';

  @override
  String get settingsVoiceLanguageAuto => 'ஆப் மொழியுடன் பொருத்து';

  @override
  String get settingsVoice => 'குரல்';

  @override
  String get settingsVoiceDefault => 'கணினி இயல்புநிலை';

  @override
  String get settingsVoiceQualityEnhanced => 'மேம்படுத்தப்பட்டது';

  @override
  String get settingsVoiceQualityPremium => 'உயர் தரம்';

  @override
  String get settingsNoVoices =>
      'இந்த மொழிக்கு குரல் நிறுவப்படவில்லை. iOS அமைப்புகள் › அணுகல்தன்மை › பேசும் உள்ளடக்கம் என்பதில் ஒன்றைச் சேர்க்கவும்.';

  @override
  String get settingsAlertPedestrian => 'பாதசாரிகள்';

  @override
  String get settingsAlertCyclist => 'மிதிவண்டி ஓட்டிகள்';

  @override
  String get settingsAlertMotorcycle => 'மோட்டார் சைக்கிள்கள்';

  @override
  String get settingsAlertBus => 'பேருந்துகள்';

  @override
  String get settingsAlertVehicleClose => 'முன்னால் வாகனம் மிக அருகில்';

  @override
  String get settingsAlertTrafficLight => 'போக்குவரத்து விளக்கு மாற்றங்கள்';

  @override
  String get settingsAlertTrafficMoving => 'முன்னால் போக்குவரத்து நகர்கிறது';

  @override
  String get settingsAlertStopSign => 'நிறுத்த அடையாளங்கள்';

  @override
  String get settingsSensitivity => 'உணர்திறன்';

  @override
  String get settingsSensitivityLow => 'குறைவு';

  @override
  String get settingsSensitivityMedium => 'நடுத்தரம்';

  @override
  String get settingsSensitivityHigh => 'அதிகம்';

  @override
  String get settingsCooldown => 'மீண்டும் வரும் இடைவெளி';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds வி';
  }

  @override
  String get settingsVolume => 'குரல் ஒலியளவு';

  @override
  String get settingsQuietMode => 'அமைதி முறை';

  @override
  String get settingsQuietModeSubtitle =>
      'மிக முக்கியமான எச்சரிக்கைகள் மட்டும் பேசப்படும்';

  @override
  String get settingsTestVoice => 'குரலைச் சோதி';

  @override
  String get settingsTestVoiceDone => 'மாதிரி எச்சரிக்கையை இயக்குகிறது…';

  @override
  String get settingsParkingBeeps => 'நிறுத்த பீப் ஒலிகள்';

  @override
  String get settingsBeepVolume => 'பீப் ஒலியளவு';

  @override
  String get settingsAlertsFooter =>
      'எச்சரிக்கைகள் ஒரு உதவி மட்டுமே. எப்போதும் சாலையைக் கவனியுங்கள் — அமைதி என்றால் வழி தெளிவாக உள்ளது என்று பொருளல்ல.';

  @override
  String get settingsRecordingProfile => 'பதிவு தரம்';

  @override
  String get settingsProfileStandard => 'நிலையானது · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'சம்பவ இடையகம்';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds வினாடிகள்';
  }

  @override
  String get settingsManualMaxLength => 'கைமுறை பதிவின் அதிகபட்ச நீளம்';

  @override
  String get settingsManualMaxUnlimited => 'வரம்பற்றது';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes நிமி';
  }

  @override
  String get settingsRecordAudio => 'ஒலியைப் பதிவுசெய்';

  @override
  String get settingsRecordAudioSubtitle =>
      'சேமிக்கப்படும் சம்பவங்களில் வாகனத்தின் உள் ஒலியும் அடங்கும்';

  @override
  String get settingsMicDenied =>
      'மைக்ரோஃபோன் அணுகல் நிறுத்தப்பட்டுள்ளது. ஒலியைப் பதிவுசெய்ய அமைப்புகளில் அனுமதியுங்கள்.';

  @override
  String get settingsWatermark => 'Corvista வாட்டர்மார்க்';

  @override
  String get settingsTimestamp => 'தேதி மற்றும் நேர முத்திரை';

  @override
  String get settingsSaveLocation => 'கிளிப்புகளுடன் இடத்தைச் சேமி';

  @override
  String get settingsStorage => 'சேமிப்பகம் மற்றும் கிளிப்புகள்';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கிளிப்புகள்',
      one: '1 கிளிப்',
      zero: 'கிளிப்புகள் இல்லை',
    );
    return '$_temp0 · $used பயன்பாடு · $free காலி';
  }

  @override
  String get settingsRecordingFooter =>
      'சுழல் இடையகம் உங்கள் iPhone-இலேயே இருக்கும்; தொடர்ந்து மேலெழுதப்படும். பின்னணியில் எதுவும் பதிவாகாது.';

  @override
  String get settingsDefaultView => 'இயல்புநிலை காட்சி';

  @override
  String get settingsUnits => 'அலகுகள்';

  @override
  String get settingsShowCompass => 'திசைகாட்டியைக் காட்டு';

  @override
  String get settingsHudStyle => 'HUD பாணி';

  @override
  String get settingsHudCustomize => 'HUD-ஐத் தனிப்பயனாக்கு';

  @override
  String get settingsDrivingSide => 'ஓட்டும் பக்கம்';

  @override
  String get settingsDrivingSideAuto => 'தானியங்கி';

  @override
  String get settingsDrivingSideRight => 'வலது';

  @override
  String get settingsDrivingSideLeft => 'இடது';

  @override
  String get settingsVirtualStyle => 'மெய்நிகர் காட்சி பாணி';

  @override
  String get settingsVirtualMinimal => 'எளிமையானது';

  @override
  String get settingsVirtualPerspective => 'முப்பரிமாணக் கோணம்';

  @override
  String get settingsVirtualHighContrast => 'அதிக மாறுபாடு';

  @override
  String get settingsKeepScreenOn => 'ஓட்டும்போது திரையை இயக்கத்திலேயே வை';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'பூட்டுத் திரையிலும் Dynamic Island-இலும் வளைவு வாரியான வழிகாட்டலைக் காட்டு';

  @override
  String get driveRecordingPausedBackground =>
      'Corvista பின்னணியில் இருந்தபோது பதிவு இடைநிறுத்தப்பட்டது';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'இடைநிறுத்தம்';

  @override
  String get liveActivityDashcamOff => 'கேமரா நிறுத்தம்';

  @override
  String get liveActivityEnded => 'வழிசெலுத்தல் முடிந்தது';

  @override
  String get liveActivityEta => 'சென்றடைவு';

  @override
  String get settingsAutoRecenter => 'வரைபடத்தை தானாக மையப்படுத்து';

  @override
  String get settingsHudStyleClassic => 'கிளாசிக்';

  @override
  String get settingsHudStyleGrid => 'கட்டம்';

  @override
  String get settingsHudStyleMinimal => 'எளிமையானது';

  @override
  String get settingsHudStylePerformance => 'செயல்திறன்';

  @override
  String get settingsHudStyleNavigation => 'வழிசெலுத்தல்';

  @override
  String get settingsHudStyleNight => 'இரவு';

  @override
  String get settingsHudStyleHighContrast => 'அதிக மாறுபாடு';

  @override
  String get settingsPowerMode => 'ஆற்றல் முறை';

  @override
  String get settingsPowerBalanced => 'சமநிலை';

  @override
  String get settingsPowerPerformance => 'செயல்திறன்';

  @override
  String get settingsPowerSaver => 'ஆற்றல் சேமிப்பு';

  @override
  String get settingsPowerFooter =>
      'உங்கள் iPhone சூடாகும்போதும் பேட்டரி குறையும்போதும் Corvista AI வீதத்தையும் காட்சி விளைவுகளையும் தானாகக் குறைக்கும்.';

  @override
  String get settingsThermal => 'வெப்ப நிலை';

  @override
  String get settingsThermalNominal => 'இயல்பு';

  @override
  String get settingsThermalFair => 'சூடு';

  @override
  String get settingsThermalSerious => 'அதிக சூடு';

  @override
  String get settingsThermalCritical => 'அபாயகரம்';

  @override
  String get settingsBattery => 'பேட்டரி';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · சார்ஜ் ஆகிறது';
  }

  @override
  String get settingsLowPowerMode =>
      'குறைந்த ஆற்றல் முறை இயக்கத்தில் உள்ளது — AI குறைந்த வீதத்தில் இயங்குகிறது.';

  @override
  String get settingsAiRate => 'தற்போதைய AI வீதம்';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'மோதல் கண்டறிதல்';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'இயக்கத்தில் · $seconds வி கவுண்ட்டவுன்';
  }

  @override
  String get settingsEmergencyFooter =>
      'சோதனை நிலை. அவசர சேவைகளுக்கு மாற்றாகாது.';

  @override
  String get settingsTheme => 'தீம்';

  @override
  String get settingsThemeSystem => 'கணினி';

  @override
  String get settingsThemeDark => 'அடர்';

  @override
  String get settingsThemeLight => 'வெளிர்';

  @override
  String get settingsReduceMotion => 'இயக்கத்தைக் குறை';

  @override
  String get settingsReduceMotionSubtitle =>
      'ஆப் முழுவதும் அனிமேஷன்களைக் குறைக்கும்';

  @override
  String get settingsAppLanguage => 'ஆப் மொழி';

  @override
  String get settingsPrivacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get settingsTerms => 'பயன்பாட்டு விதிமுறைகள்';

  @override
  String get settingsHelp => 'உதவி';

  @override
  String get settingsSupport => 'ஆதரவைத் தொடர்புகொள்';

  @override
  String get settingsLicenses => 'திறந்த மூல உரிமங்கள்';

  @override
  String get settingsSupportUnavailable =>
      'Mail-ஐத் திறக்க முடியவில்லை. support@corvista.app என்ற முகவரிக்கு எழுதுங்கள்.';

  @override
  String get settingsSafety => 'பாதுகாப்புத் தகவல்';

  @override
  String get settingsDiagnostics => 'பிழைகண்டறிதல்';

  @override
  String get settingsVersion => 'பதிப்பு';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'HUD-ஐத் தனிப்பயனாக்கு';

  @override
  String get hudCustomPreview => 'முன்னோட்டம் · மாதிரி மதிப்புகள்';

  @override
  String get hudCustomStyle => 'பாணி';

  @override
  String get hudCustomElements => 'கூறுகள்';

  @override
  String get hudCustomSpeed => 'வேகம்';

  @override
  String get hudCustomHeading => 'திசையும் திசைகாட்டியும்';

  @override
  String get hudCustomClock => 'கடிகாரம்';

  @override
  String get hudCustomBattery => 'பேட்டரியும் வெப்பமும்';

  @override
  String get hudCustomDetections => 'AI நிலையும் கண்டறிதல்களும்';

  @override
  String get hudCustomWeather => 'வானிலை';

  @override
  String get hudCustomAppearance => 'அளவும் ஒளிபுகாமையும்';

  @override
  String get hudCustomSize => 'அளவு';

  @override
  String get hudCustomOpacity => 'ஒளிபுகாமை';

  @override
  String get hudCustomFooter =>
      'அதிக வெப்பம் போன்ற எச்சரிக்கைகள், கூறுகள் மறைக்கப்பட்டிருந்தாலும் எப்போதும் காட்டப்படும்.';

  @override
  String get hudCustomDescClassic => 'சமநிலையான கருவிப் பலகை';

  @override
  String get hudCustomDescGrid => 'சாலைமீது முப்பரிமாணக் கட்டம்';

  @override
  String get hudCustomDescMinimal => 'வேகம் மட்டும், வேறெதுவும் இல்லை';

  @override
  String get hudCustomDescPerformance => 'நேரடி அளவீடுகளுடன் வேக வளைவு';

  @override
  String get hudCustomDescNavigation => 'அடுத்த திருப்பம் முதலில்';

  @override
  String get hudCustomDescNight => 'இரவு ஓட்டத்துக்கு மங்கலான, சிவப்புச் சாயல்';

  @override
  String get hudCustomDescHighContrast => 'பிரகாசமான வெயிலில் அதிகபட்ச தெளிவு';

  @override
  String get languageTitle => 'மொழி';

  @override
  String get languageSystem => 'கணினி இயல்புநிலை';

  @override
  String get languageSystemSubtitle => 'உங்கள் iPhone மொழியைப் பின்பற்று';

  @override
  String get languageFooter =>
      'மேலும் மொழிகள் வரவுள்ளன. குரல் எச்சரிக்கை மொழியை எச்சரிக்கைகள் பிரிவில் தனியாக அமைக்கலாம்.';

  @override
  String get diagTitle => 'பிழைகண்டறிதல்';

  @override
  String get diagPerformance => 'செயல்திறன்';

  @override
  String get diagInference => 'அனுமான நேரம்';

  @override
  String get diagDetectHz => 'கண்டறிதல் வீதம்';

  @override
  String get diagCameraFps => 'கேமரா பிரேம் வீதம்';

  @override
  String get diagMemory => 'நினைவகம்';

  @override
  String get diagDropped => 'தவறிய பிரேம்கள்';

  @override
  String get diagSegmentation => 'பிரிவாக்க நேரம்';

  @override
  String get diagCamera => 'கேமரா';

  @override
  String get diagStatus => 'நிலை';

  @override
  String get diagSource => 'மூலம்';

  @override
  String get diagSourceCamera => 'நேரடி கேமரா';

  @override
  String get diagSourceFile => 'சோதனைக் காட்சிப்பதிவு கோப்பு';

  @override
  String get diagResolution => 'இடையக அளவு';

  @override
  String get diagLens => 'லென்ஸ்';

  @override
  String get diagError => 'கடைசிப் பிழை';

  @override
  String get diagModel => 'AI மாதிரி';

  @override
  String get diagModelLoad => 'மாதிரி ஏற்ற நேரம்';

  @override
  String get diagPower => 'ஆற்றல்';

  @override
  String get diagSegHz => 'பிரிவாக்க வீதம்';

  @override
  String get diagReduced => 'குறைக்கப்பட்ட விளைவுகள்';

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
  String get diagCamIdle => 'செயலற்றது';

  @override
  String get diagCamStarting => 'தொடங்குகிறது';

  @override
  String get diagCamRunning => 'இயங்குகிறது';

  @override
  String get diagCamInterrupted => 'தடைபட்டது';

  @override
  String get diagCamStopped => 'நிறுத்தப்பட்டது';

  @override
  String get diagCamUnavailable => 'கிடைக்கவில்லை';

  @override
  String get diagCamPermissionDenied => 'அனுமதி மறுக்கப்பட்டது';

  @override
  String get diagCamError => 'பிழை';

  @override
  String get diagTestFootage => 'சோதனைக் காட்சிப்பதிவு';

  @override
  String get diagTestFootageBody =>
      'கேமராவுக்குப் பதிலாக உள்ளூர் வீடியோ கோப்பில் சாதனத்திலேயே உண்மையான கண்டறிதலை இயக்கு. ஒவ்வொரு காட்சியிலும் இது சோதனைக் காட்சிப்பதிவு என்று குறிக்கப்படும்.';

  @override
  String get diagPathLabel => 'வீடியோ கோப்புப் பாதை';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Documents/test_drive.mp4 ஐப் பயன்படுத்து';

  @override
  String get diagRun => 'சோதனைக் காட்சிப்பதிவை இயக்கு';

  @override
  String get diagRunStarted =>
      'சோதனைக் காட்சிப்பதிவு தொடங்கியது. பார்க்க ஓட்டும் காட்சியைத் திறக்கவும்.';

  @override
  String get diagBackToCamera => 'நேரடி கேமராவுக்குத் திரும்பு';

  @override
  String get diagDebugOnly =>
      'சோதனைக் காட்சிப்பதிவு உருவாக்கப் பதிப்புகளில் மட்டுமே கிடைக்கும்.';

  @override
  String get diagFileMissing => 'அந்தப் பாதையில் கோப்பு இல்லை.';

  @override
  String get emergencySetupTitle => 'மோதல் கண்டறிதல்';

  @override
  String get emergencyExperimental => 'சோதனை நிலை';

  @override
  String get emergencyIntro =>
      'ஓட்டும்போது, உங்கள் iPhone-இன் இயக்க உணரிகளைக் கொண்டு கடுமையான மோதல் ஏற்பட்டிருக்கலாமா என Corvista கண்காணிக்கும். அவ்வாறு கண்டறிந்தால் கவுண்ட்டவுன் தொடங்கும். நீங்கள் ரத்துசெய்யாவிட்டால், அவசர சேவைகளை அழைக்கவும் உங்கள் தொடர்புகளுக்குச் செய்தி அனுப்பவும் Corvista முன்வரும்.';

  @override
  String get emergencyDisclaimer1 =>
      'அவசர சேவைகளுக்கோ உங்கள் வாகனத்தின் சொந்த மோதல் கண்டறிதலுக்கோ மாற்றாகாது.';

  @override
  String get emergencyDisclaimer2 =>
      'அழைப்பு செய்யப்படும் முன்பும் செய்தி அனுப்பப்படும் முன்பும் iOS எப்போதும் உங்கள் உறுதிப்படுத்தலைக் கேட்கும்.';

  @override
  String get emergencyDisclaimer3 =>
      'மோதல்கள் தவறவிடப்படலாம்; அதிரடி பிரேக்கிங் அல்லது குலுக்கல்கள் மோதலாகத் தவறாகக் கருதப்படலாம்.';

  @override
  String get emergencyParkedWarning =>
      'வாகனத்தை நிறுத்திய நிலையில் இந்த அமைப்பை முடியுங்கள். வாகனம் நகரும்போது அமைப்புகள் பூட்டப்படும்.';

  @override
  String get emergencyEnable => 'மோதல் கண்டறிதலை இயக்கு';

  @override
  String get emergencyEnableSubtitle =>
      'ஓட்டும் அமர்வின்போது மட்டுமே செயலில் இருக்கும்';

  @override
  String get emergencyNeedNumber => 'முதலில் ஒரு அவசர எண்ணைச் சேர்க்கவும்.';

  @override
  String get emergencyContacts => 'அவசரத் தொடர்புகள்';

  @override
  String get emergencyAddContact => 'தொடர்பைச் சேர்';

  @override
  String get emergencyNoContacts =>
      'இன்னும் தொடர்புகள் இல்லை. நீங்கள் உறுதிப்படுத்திய பிறகே தொடர்புகளுக்குச் செய்தி செல்லும்.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '$name ஐ நீக்கவா?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'மோதலுக்குப் பிறகு இவர் பெறுநராக முன்மொழியப்படமாட்டார்.';

  @override
  String get emergencyRemove => 'நீக்கு';

  @override
  String get emergencyContactsError => 'தொடர்புகளை ஏற்ற முடியவில்லை.';

  @override
  String get emergencyNumber => 'அவசர எண்';

  @override
  String get emergencyNumberHint => 'எ.கா. 112 அல்லது 911';

  @override
  String get emergencyMessage => 'செய்தி வார்ப்புரு';

  @override
  String get emergencyMessageDefault =>
      'நான் ஒரு வாகன விபத்தில் சிக்கியிருக்கலாம். இந்தச் செய்தி Corvista மூலம் தயாரிக்கப்பட்டது; கிடைத்தால், எனது கடைசியாக அறியப்பட்ட இடமும் இதில் உள்ளது.';

  @override
  String get emergencyMessageHint =>
      'இயல்புநிலைச் செய்தியைப் பயன்படுத்த காலியாக விடுங்கள்.';

  @override
  String get emergencyCountdown => 'கவுண்ட்டவுன் நீளம்';

  @override
  String get emergencyVoiceCancel => 'குரல் மூலம் ரத்துசெய்';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'கவுண்ட்டவுனின்போது “நான் நலம்” அல்லது “ரத்துசெய்” எனச் சொல்லுங்கள். கிடைக்கும் இடங்களில் சாதனத்திலேயே பேச்சு அறிதலைப் பயன்படுத்தும்.';

  @override
  String get emergencyVoicePermDenied =>
      'குரல் மூலம் ரத்துசெய்ய மைக்ரோஃபோன் மற்றும் பேச்சு அறிதல் அணுகல் தேவை.';

  @override
  String get emergencyAutoSave => 'சம்பவ கிளிப்பைத் தானாகச் சேமி';

  @override
  String get emergencyTest => 'கவுண்ட்டவுன் சோதனை (அழைப்பு இல்லை)';

  @override
  String get emergencyTestBody =>
      'கவுண்ட்டவுனைப் பார்க்க ஒரு போலி மோதலை இயக்கும். சோதனை முறையில் அழைப்போ செய்தியோ ஒருபோதும் செல்லாது.';

  @override
  String get emergencyNotSet => 'அமைக்கவில்லை';

  @override
  String get emergencyAlertHeadline => 'கடுமையான மோதல் ஏற்பட்டிருக்கலாம்.';

  @override
  String get emergencyAlertSubtitle => 'நீங்கள் நலமா?';

  @override
  String get emergencyAlertCancel => 'நான் நலம் — ரத்துசெய்';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds வினாடிகள் உள்ளன',
      one: '1 வினாடி உள்ளது',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'கேட்கிறது — ரத்துசெய்ய “நான் நலம்” எனச் சொல்லுங்கள்';

  @override
  String emergencyAlertHeard(String text) {
    return 'கேட்டது: “$text”';
  }

  @override
  String get emergencyAlertEscalated =>
      'பதில் இல்லை. என்ன செய்வதெனத் தேர்ந்தெடுங்கள்:';

  @override
  String get emergencyAlertCall => 'அவசர சேவைகளை அழை';

  @override
  String emergencyAlertCallNumber(String number) {
    return '$number ஐ அழைக்கும். iOS உறுதிப்படுத்தல் கேட்கும்.';
  }

  @override
  String get emergencyAlertMessage => 'தொடர்புகளுக்குச் செய்தி அனுப்பு';

  @override
  String get emergencyAlertMessageSubtitle =>
      'தயாரிக்கப்பட்ட செய்தியைத் திறக்கும். அனுப்புவதா என்பதை நீங்களே தீர்மானிக்கிறீர்கள்.';

  @override
  String get emergencyAlertTestMode => 'சோதனை முறை — அழைப்பு செய்யப்படாது';

  @override
  String get emergencyAlertTestBadge => 'சோதனை';

  @override
  String get emergencyAlertClose => 'நான் நலம் — மூடு';

  @override
  String get emergencyMsgSent => 'செய்தி அனுப்பப்பட்டது.';

  @override
  String get emergencyMsgCancelled => 'செய்தி அனுப்பப்படவில்லை.';

  @override
  String get emergencyMsgFailed => 'செய்தியை அனுப்ப முடியவில்லை.';

  @override
  String get emergencyMsgUnavailable =>
      'இந்தச் சாதனத்தில் செய்தியனுப்புதல் கிடைக்கவில்லை.';

  @override
  String emergencyCallFailed(String number) {
    return 'அழைப்பைத் தொடங்க முடியவில்லை. $number ஐ நீங்களே அழையுங்கள்.';
  }

  @override
  String get modelsTitle => 'AI மாதிரிகள்';

  @override
  String get modelsIntro =>
      'எல்லா மாதிரிகளும் ஆப்புடன் இணைக்கப்பட்டு முழுவதுமாக உங்கள் iPhone-இலேயே இயங்கும். உங்கள் கேமரா காட்சி சாதனத்தை விட்டு வெளியேறாது.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'நேரடி: ஒரு பிரேமுக்கு $ms ms · வினாடிக்கு $hz கண்டறிதல்கள்';
  }

  @override
  String modelsLastLoad(String ms) {
    return '$ms ms-இல் ஏற்றப்பட்டது';
  }

  @override
  String get modelsEfficientName => 'திறன்மிகு';

  @override
  String get modelsEfficientDesc =>
      'குறைந்த வெப்பம் மற்றும் பேட்டரி பயன்பாட்டுடன் நீண்ட பயணங்களுக்கு ஏற்ற வேகமான, சிறிய கண்டறிவான்.';

  @override
  String get modelsEnhancedName => 'மேம்படுத்தப்பட்டது';

  @override
  String get modelsEnhancedDesc =>
      'சிறிய மற்றும் தொலைவிலுள்ள பொருட்களையும் கண்டறியும் பெரிய கண்டறிவான்; அதிக ஆற்றலைப் பயன்படுத்தும்.';

  @override
  String get modelsSegmentationName => 'பிரிவாக்கம்';

  @override
  String get modelsSegmentationDesc =>
      'உணர்திறன் காட்சிக்காக வேகமான கண்டறிதலுடன் சாலைப் பரப்பு மற்றும் பொருள் மாஸ்க்குகளை இணைக்கும்.';

  @override
  String get modelsNoneName => 'AI இடைநிறுத்தம்';

  @override
  String get modelsNoneDesc =>
      'பொருள் கண்டறிதல் இன்றி கேமராவும் பதிவும் தொடர்ந்து இயங்கும். மிகக் குறைந்த ஆற்றல் பயன்பாடு.';

  @override
  String get modelsGenericDesc =>
      'சாதனத்திலேயே இயங்கும் பொருள் கண்டறிதல் மாதிரி.';

  @override
  String get modelsFunctionDetection =>
      'வாகனங்கள், மனிதர்கள், மிதிவண்டிகள், மோட்டார் சைக்கிள்கள், பேருந்துகள், போக்குவரத்து விளக்குகள், நிறுத்த அடையாளங்களைக் கண்டறியும்';

  @override
  String get modelsFunctionSegmentation =>
      'சாலைப் பரப்பு மற்றும் பொருள் மாஸ்க்குகளைச் சேர்க்கும்';

  @override
  String get modelsFunctionNone => 'கண்டறிதல் இல்லை; டாஷ்கேம் பதிவு மட்டும்';

  @override
  String get modelsSize => 'அளவு';

  @override
  String get modelsInput => 'உள்ளீடு';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'இவற்றுடன் செயல்படும்';

  @override
  String get modelsStatusInstalled => 'நிறுவப்பட்டது (இணைக்கப்பட்டது)';

  @override
  String get modelsStatusNotInstalled => 'நிறுவப்படவில்லை';

  @override
  String get modelsSelected => 'தேர்ந்தெடுக்கப்பட்டது';

  @override
  String get modelsUse => 'இந்த மாதிரியைப் பயன்படுத்து';

  @override
  String get modelsSwitching => 'மாதிரியை ஏற்றுகிறது…';

  @override
  String modelsSwitched(String name) {
    return '$name இப்போது செயலில் உள்ளது';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'இந்தச் சாதனத்தில் அளவிடப்பட்டது: சராசரி $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'இந்தச் சாதனத்தில் அளவிடப்படவில்லை';

  @override
  String get modelsBenchmarkRun => 'செயல்திறன் சோதனையை இயக்கு';

  @override
  String get modelsBenchmarkRunning => 'செயல்திறன் சோதனை நடக்கிறது…';

  @override
  String get modelsBenchmarkSelectHint =>
      'சோதிக்க இந்த மாதிரியைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get modelsBenchmarkDone => 'செயல்திறன் சோதனை முடிந்தது';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'செயல்திறன் சோதனை தோல்வியடைந்தது: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'கடைசியாகப் புதுப்பிக்கப்பட்டது $date';
  }

  @override
  String get safetyTitle => 'பாதுகாப்புத் தகவல்';

  @override
  String get safetyIntro =>
      'Corvista என்பது ஓட்டும்போது விழிப்புணர்வுக்கு உதவும் கருவி. இது உங்கள் வாகனத்தைக் கட்டுப்படுத்தாது; உங்கள் கவனம், முடிவெடுக்கும் திறன் அல்லது வாகனத்தின் பாதுகாப்பு அமைப்புகளுக்கு மாற்றாகாது.';

  @override
  String get safetyBeforeTitle => 'ஓட்டுவதற்கு முன்';

  @override
  String get safetyBefore1 =>
      'உங்கள் பார்வை, ஏர்பேக்குகள் அல்லது கட்டுப்பாடுகளைத் தடுக்காத, சட்டப்படி அனுமதிக்கப்பட்ட இடத்தில் உங்கள் iPhone-ஐ உறுதியாகப் பொருத்துங்கள்.';

  @override
  String get safetyBefore2 =>
      'வாகனத்தை நிறுத்தியிருக்கும்போதே அமைப்பை முடித்து, காட்சியைத் தேர்ந்தெடுத்து, சேருமிடத்தை அமையுங்கள்.';

  @override
  String get safetyBefore3 =>
      'நீண்ட பயணங்களுக்கு சார்ஜரை இணைத்து, முடிந்தவரை நேரடி வெயிலில் இருந்து ஃபோனைத் தவிர்க்கவும்.';

  @override
  String get safetyWhileTitle => 'ஓட்டும்போது';

  @override
  String get safetyWhile1 =>
      'சாலையிலிருந்து கண்களை எடுக்காதீர்கள். பாதுகாப்பானதும் சட்டப்படி அனுமதிக்கப்பட்டதுமான போது மட்டுமே திரையிலுள்ள பெரிய கட்டுப்பாடுகளைப் பயன்படுத்துங்கள்.';

  @override
  String get safetyWhile2 =>
      'எச்சரிக்கைகள் உதவிகள் மட்டுமே; அவற்றை நம்பி இருக்க முடியாது. அமைதி என்றால் சாலை தெளிவாக உள்ளது என்று ஒருபோதும் பொருளல்ல.';

  @override
  String get safetyWhile3 =>
      'இரண்டும் முரண்படும்போது ஆப்பை அல்ல, போக்குவரத்து விதிகள், சமிக்ஞைகள் மற்றும் சாலை அடையாளங்களைப் பின்பற்றுங்கள்.';

  @override
  String get safetyLimitsTitle => 'வரம்புகள்';

  @override
  String get safetyLimits1 =>
      'ஒற்றை ஃபோன் கேமரா தனக்கு முன்னால் உள்ளதை மட்டுமே காணும். அதன் பார்வைக்கு வெளியே உள்ள, மறைந்துள்ள அல்லது மிக அருகிலுள்ள பொருட்கள் கண்டறியப்படாது.';

  @override
  String get safetyLimits2 =>
      'கண்டறிதல்கள் தவறவிடப்படலாம், தாமதமாகலாம் அல்லது தவறாக இருக்கலாம்; குறிப்பாக இரவில், மழை, மூடுபனி, கண்ணை உறுத்தும் ஒளி அல்லது அழுக்கான முன்கண்ணாடி இருக்கும்போது.';

  @override
  String get safetyLimits3 =>
      'ஆதரிக்கப்படும் வகைகள் மட்டுமே அறியப்படும்: வாகனங்கள், பேருந்துகள், மோட்டார் சைக்கிள்கள், மிதிவண்டிகள், மனிதர்கள், போக்குவரத்து விளக்குகள், நிறுத்த அடையாளங்கள். மெய்நிகர் காட்சியிலுள்ள பாதைக் குறிப்புகள் அலங்காரமானவை; கண்டறியப்பட்ட பாதைகள் அல்ல.';

  @override
  String get safetyLimits4 =>
      'அருகாமை தோராயமான மண்டலங்களாகக் (மிக அருகில், அருகில், நடுத்தரம், தொலைவில்) காட்டப்படுகிறது; அளவிடப்பட்ட தூரங்களாக ஒருபோதும் அல்ல. நிறுத்தக் காட்சி நிறுத்த உணரிகளுக்கு மாற்றல்ல.';

  @override
  String get safetyHeatTitle => 'வெப்பமும் பேட்டரியும்';

  @override
  String get safetyHeat1 =>
      'கேமராவையும் AI-ஐயும் தொடர்ந்து பயன்படுத்துவது உங்கள் iPhone-ஐ சூடாக்கும். சாதனம் சூடாகும்போது Corvista பகுப்பாய்வு வீதத்தைக் குறைத்து எச்சரிக்கையைக் காட்டும்; iOS அதிகமாகச் சூடானால் கேமரா நின்றுவிடலாம்.';

  @override
  String get safetyEmergencyTitle => 'அவசரநிலை வசதி';

  @override
  String get safetyEmergency1 =>
      'சாத்தியமான மோதல் கண்டறிதல் சோதனை நிலையில் உள்ளது. உண்மையான விபத்துகளைத் தவறவிடலாம்; பிற நிகழ்வுகளாலும் தூண்டப்படலாம்.';

  @override
  String get safetyEmergency2 =>
      'இது யாரையும் அமைதியாகத் தொடர்புகொள்ளாது: அழைப்பு அல்லது செய்திக்கு iOS எப்போதும் உங்கள் உறுதிப்படுத்தலைக் கேட்கும். அவசர சேவைகளை நீங்களே அழைப்பதற்கு இது மாற்றல்ல.';

  @override
  String get privacyTitle => 'தனியுரிமை';

  @override
  String get privacyIntro =>
      'உங்கள் ஓட்டுநர் தரவை உங்கள் iPhone-இலேயே வைத்திருக்கும்படி Corvista வடிவமைக்கப்பட்டுள்ளது. Corvista கணக்கு எதுவும் இல்லை; Corvista சொந்தச் சேவையகங்களையும் இயக்குவதில்லை.';

  @override
  String get privacyCameraTitle => 'கேமராவும் AI-உம்';

  @override
  String get privacyCamera1 =>
      'பொருள் கண்டறிதல், கண்காணிப்பு மற்றும் பிரிவாக்கம் முழுவதுமாக உங்கள் iPhone-இலேயே இயங்கும். கேமரா பிரேம்கள் ஒருபோதும் பதிவேற்றப்படாது.';

  @override
  String get privacyCamera2 =>
      'Corvista திரையில் திறந்திருக்கும்போது மட்டுமே கேமரா இயங்கும். ஆப் பின்னணிக்குச் சென்றால் அது இடைநிறுத்தப்படும் — மறைமுகப் பின்னணிப் பதிவு எதுவும் இல்லை.';

  @override
  String get privacyRecordingsTitle => 'பதிவுகள்';

  @override
  String get privacyRecordings1 =>
      'சுழல் இடையகம் தற்காலிகமானது; தொடர்ந்து மேலெழுதப்படும். நீங்கள் சம்பவத்தைச் சேமி என்பதைத் தட்டும்போது, அல்லது இயக்கியிருந்தால் சாத்தியமான மோதலுக்குப் பிறகு மட்டுமே காட்சிப்பதிவு வைத்திருக்கப்படும்.';

  @override
  String get privacyRecordings2 =>
      'சேமித்த கிளிப்புகள் உங்கள் iPhone-இல் Corvista-வின் தனிப்பட்ட சேமிப்பகத்தில் இருக்கும். நீங்கள் பகிர் என்பதைத் தேர்ந்தெடுத்தால் மட்டுமே அவை சாதனத்தை விட்டு வெளியேறும். ஆப்பை நீக்கினால் அவையும் நீக்கப்படும்.';

  @override
  String get privacyRecordings3 =>
      'நீங்கள் இயக்கி மைக்ரோஃபோன் அணுகலை வழங்கினால் மட்டுமே ஒலி பதிவுசெய்யப்படும்.';

  @override
  String get privacyLocationTitle => 'இடம்';

  @override
  String get privacyLocation1 =>
      'ஆப் திறந்திருக்கும்போது உங்கள் வேகம், வரைபடம், வழிகள் மற்றும் வானிலைக்காக இடம் பயன்படுத்தப்படும். “இடத்தைச் சேமி” இயக்கத்தில் இருந்தால், சேமிக்கும் நேரத்தின் இருப்பிடம் கிளிப்புடன் உங்கள் சாதனத்தில் சேமிக்கப்படும்.';

  @override
  String get privacyNetworkTitle => 'பிணையச் சேவைகள்';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — வரைபடக் காட்சி, இடத் தேடல் மற்றும் வழிகள். நீங்கள் தேடும் உரையும் தோராயமான இடமும் Apple-க்கு அனுப்பப்படும்.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — உங்கள் இடத்துக்கான தற்போதைய மற்றும் மணிநேர வானிலை.';

  @override
  String get privacyNetwork4 =>
      'Corvista-வில் விளம்பரங்களோ மூன்றாம் தரப்பு பகுப்பாய்வு அல்லது கண்காணிப்போ இல்லை.';

  @override
  String get privacyEmergencyTitle => 'அவசரத் தொடர்புகள்';

  @override
  String get privacyEmergency1 =>
      'நீங்கள் தேர்ந்தெடுக்கும் தொடர்புகள் இந்தச் சாதனத்தின் iOS Keychain-இல் சேமிக்கப்படும். கிடைக்கும் இடங்களில் குரல் மூலம் ரத்துசெய்வது சாதனத்திலேயே பேச்சு அறிதலைப் பயன்படுத்தும். iOS-இல் நீங்கள் உறுதிப்படுத்திய பிறகே அழைப்புகளும் செய்திகளும் அனுப்பப்படும்.';

  @override
  String get privacyControlsTitle => 'உங்கள் கட்டுப்பாடுகள்';

  @override
  String get privacyControls1 =>
      'கிளிப்புகள் பகுதியில் எப்போது வேண்டுமானாலும் கிளிப்புகளை நீக்கலாம்; iOS அமைப்புகளில் கேமரா, மைக்ரோஃபோன், இடம் மற்றும் பேச்சு அணுகலை மாற்றலாம் அல்லது திரும்பப் பெறலாம்.';

  @override
  String get termsTitle => 'பயன்பாட்டு விதிமுறைகள்';

  @override
  String get termsIntro =>
      'Corvista-ஐப் பயன்படுத்துவதன் மூலம் இந்த விதிமுறைகளை ஏற்கிறீர்கள். Apple-இன் நிலையான உரிமம் பெற்ற பயன்பாட்டு இறுதிப் பயனர் உரிம ஒப்பந்தமும் பொருந்தும்.';

  @override
  String get termsUseTitle => 'Corvista-ஐப் பயன்படுத்துதல்';

  @override
  String get termsUse1 =>
      'Corvista என்பது ஓட்டும்போது விழிப்புணர்வுக்கும் டாஷ்கேமுக்கும் உதவும் கருவி. எல்லா நேரத்திலும் பாதுகாப்பாகவும் சட்டப்படியும் ஓட்டுவதற்கு நீங்களே முழுப் பொறுப்பு.';

  @override
  String get termsUse2 =>
      'ஓட்டும்போது கவனத்தைச் சிதறடிக்கும் வகையில் ஆப்புடன் தொடர்புகொள்ளாதீர்கள். சாதனத்தை உறுதியாகவும் சட்டப்படியும் பொருத்துங்கள்.';

  @override
  String get termsAccuracyTitle => 'துல்லியத்துக்கு உத்தரவாதம் இல்லை';

  @override
  String get termsAccuracy1 =>
      'கண்டறிதல்கள், மண்டலங்கள், எச்சரிக்கைகள், வரைபடக் குறியீடுகள், வழிகள் மற்றும் வானிலை முழுமையற்றதாகவோ தாமதமாகவோ தவறாகவோ இருக்கலாம். Corvista உங்கள் வாகனத்தைக் கட்டுப்படுத்தாது.';

  @override
  String get termsAccuracy2 =>
      'அவசரநிலை வசதி சோதனை நிலையில் உள்ளது; மோதலைக் கண்டறியத் தவறலாம் அல்லது தவறாகத் தூண்டப்படலாம்.';

  @override
  String get termsRecordingTitle => 'பதிவுச் சட்டங்கள்';

  @override
  String get termsRecording1 =>
      'டாஷ்கேம்கள், ஒலிப் பதிவு மற்றும் மக்களைப் படம்பிடிப்பது தொடர்பான சட்டங்கள் நாடு மற்றும் பிராந்தியத்துக்கு ஏற்ப மாறுபடும். கிளிப்புகளைப் பகிரும்போது உட்பட, அவற்றைப் பின்பற்றுவது உங்கள் பொறுப்பு.';

  @override
  String get termsLiabilityTitle => 'பொறுப்பு';

  @override
  String get termsLiability1 =>
      'ஆப் “உள்ளது உள்ளபடி” வழங்கப்படுகிறது. சட்டம் அனுமதிக்கும் அளவுக்கு, இதன் பயன்பாட்டினாலோ இதன் வெளியீட்டை நம்பியதாலோ ஏற்படும் விபத்துகள், இழப்புகள், அபராதங்கள் அல்லது சேதங்களுக்கு உருவாக்குநர் பொறுப்பல்ல.';

  @override
  String get termsChangesTitle => 'மாற்றங்கள்';

  @override
  String get termsChanges1 =>
      'ஆப்பின் புதிய பதிப்புகளுடன் இந்த விதிமுறைகள் புதுப்பிக்கப்படலாம். புதுப்பிப்புக்குப் பிறகும் தொடர்ந்து பயன்படுத்தினால் திருத்தப்பட்ட விதிமுறைகளை ஏற்கிறீர்கள் என்று பொருள்.';

  @override
  String get helpTitle => 'உதவி';

  @override
  String get helpIntro =>
      'பொதுவான கேள்விகளுக்கான பதில்கள். பாதுகாப்பு வழிகாட்டலுக்கு, பாதுகாப்புத் தகவலைப் பாருங்கள்.';

  @override
  String get helpQSave => 'சம்பவத்தின் காட்சிப்பதிவை எவ்வாறு வைத்துக்கொள்வது?';

  @override
  String get helpASaveBuffer =>
      'ஓட்டுதல் காட்சியில் உள்ள பெரிய சம்பவத்தைச் சேமி பொத்தானைத் தட்டுங்கள். Corvista தன் சுழல் இடையகத்தின் கடைசி 20 அல்லது 30 விநாடிகளை (அமைப்புகள் › பதிவில் உங்கள் தேர்வு) கிளிப்புகளில் சேமிக்கும்.';

  @override
  String get helpQWhere => 'என் கிளிப்புகள் எங்கே சேமிக்கப்படுகின்றன?';

  @override
  String get helpAWhere =>
      'உங்கள் iPhone-இல் Corvista-வின் தனிப்பட்ட சேமிப்பகத்தில். அவை ஒருபோதும் பதிவேற்றப்படாது. கிளிப்பை அனுப்ப அல்லது ஏற்றுமதி செய்ய பிளேயரில் பகிர் என்பதைப் பயன்படுத்துங்கள்.';

  @override
  String get helpQZones => 'அருகாமை மண்டலங்கள் எவ்வளவு துல்லியமானவை?';

  @override
  String get helpAZones =>
      'மண்டலங்கள் என்பவை ஒற்றைக் கேமராவிலிருந்து, பொருட்களின் வழக்கமான அளவுகளைக் கொண்டு கணிக்கப்படும் தோராயமான மதிப்பீடுகள். அவற்றைத் தோராயமான குறிப்புகளாகக் கருதுங்கள்; தூரங்களாக ஒருபோதும் அல்ல.';

  @override
  String get helpQSlow => 'கண்டறிதல் ஏன் மெதுவாகிறது?';

  @override
  String get helpASlow =>
      'உங்கள் iPhone சூடாகும்போது, பேட்டரி குறையும்போது அல்லது குறைந்த ஆற்றல் முறை இயக்கத்தில் இருக்கும்போது, சாதனத்தைப் பாதுகாக்க Corvista பகுப்பாய்வு வீதத்தைக் குறைக்கும். ஆற்றல் முறையை அமைப்புகளில் மாற்றலாம்.';

  @override
  String get helpQMap => 'வரைபடம், தேடல் அல்லது வானிலை வேலை செய்யவில்லை.';

  @override
  String get helpAMap =>
      'இந்த வசதிகளுக்கு இணைய இணைப்பும் இட அணுகலும் தேவை. உங்கள் இணைப்பைச் சரிபார்த்து, iOS அமைப்புகளில் Corvista-க்கு இடத்தை அனுமதியுங்கள்.';

  @override
  String get helpQSimulator => 'கேமரா கிடைக்கவில்லை எனக் காட்டுகிறது.';

  @override
  String get helpASimulator =>
      'iOS அமைப்புகளில் கேமரா அணுகல் அனுமதிக்கப்பட்டுள்ளதா என்பதையும், வேறு எந்த ஆப்பும் கேமராவைப் பயன்படுத்தவில்லை என்பதையும் உறுதிசெய்யுங்கள். iOS Simulator-இல் கேமரா இல்லை; அதற்குப் பதிலாக உள்ளூர் சோதனை வீடியோவைப் பயன்படுத்தலாம்.';

  @override
  String get emergencyMsgNoContacts =>
      'முதலில் ஒரு அவசரத் தொடர்பைச் சேர்க்கவும்.';

  @override
  String get cameraStarting => 'கேமராவைத் தொடங்குகிறது…';

  @override
  String get cameraInterrupted => 'கேமரா இடைநிறுத்தப்பட்டது';

  @override
  String get cameraInterruptedBody =>
      'அழைப்பின்போது அல்லது வேறொரு ஆப் பயன்படுத்தும்போது போன்ற நேரங்களில் iOS கேமராவை இடைநிறுத்தியது. அது தானாகவே மீண்டும் தொடங்கும்.';

  @override
  String get cameraUnavailable => 'கேமரா கிடைக்கவில்லை';

  @override
  String get cameraUnavailableBody =>
      'இந்தச் சாதனத்தில் கேமரா எதுவும் கிடைக்கவில்லை. கண்டறிதல், பதிவு மற்றும் நிறுத்தக் காட்சிகளுக்குப் பின்புற கேமரா தேவை.';

  @override
  String get cameraRunTestFootage => 'சோதனைக் காட்சிப்பதிவை இயக்கு';

  @override
  String get cameraPermissionDenied => 'கேமரா அணுகல் நிறுத்தப்பட்டுள்ளது';

  @override
  String get cameraPermissionDeniedBody =>
      'கண்டறிதல், டாஷ்கேம் பதிவு மற்றும் நிறுத்தக் காட்சிகளுக்கு Corvista-வுக்குக் கேமரா தேவை. அமைப்புகளில் கேமரா அணுகலை இயக்குங்கள்.';

  @override
  String get cameraError => 'கேமரா பிழை';

  @override
  String get cameraStopped => 'கேமரா நிறுத்தப்பட்டது';

  @override
  String get cameraStart => 'கேமராவைத் தொடங்கு';

  @override
  String get cameraFocusHint => 'குவியம் செய்ய தட்டுங்கள்';

  @override
  String get cameraPreviewLabel =>
      'கண்டறியப்பட்ட பொருட்களுடன் நேரடி கேமரா காட்சி';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'கேமரா $fps fps · AI $hz Hz · $ms ms · தவறியவை $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'வேகம் $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'GPS வேகம் இல்லை';

  @override
  String hudHeading(String direction, String degrees) {
    return 'திசை $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $secondsவி';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'டாஷ்கேம் இடையகப் பதிவு, $target வினாடிகளில் $seconds வினாடிகள் இடையகத்தில் உள்ளன';
  }

  @override
  String get hudRecIdle => 'REC நிறுத்தம்';

  @override
  String get hudRecSaving => 'சேமிக்கிறது…';

  @override
  String get hudRecError => 'REC பிழை';

  @override
  String get hudAiPaused => 'AI இடைநிறுத்தம்';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count பொருட்கள்',
      one: '1 பொருள்',
      zero: 'பொருட்கள் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count பொருட்கள் கண்டறியப்பட்டன',
      one: '1 பொருள் கண்டறியப்பட்டது',
      zero: 'பொருட்கள் எதுவும் கண்டறியப்படவில்லை',
    );
    return 'AI மாதிரி $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'அதிக சூடு — AI மெதுவாகிறது';

  @override
  String get hudThermalCritical => 'மிகவும் சூடு — AI இடைநிறுத்தம்';

  @override
  String hudBatteryLow(String percent) {
    return 'பேட்டரி $percent';
  }

  @override
  String get hudLowPower => 'குறைந்த ஆற்றல் முறை';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'வானிலை $temperature, $condition. விவரங்களுக்குத் தட்டுங்கள்.';
  }

  @override
  String get hudNoGuidance =>
      'இங்கே வளைவு வாரியான வழிகாட்டலைக் காண, வரைபடக் காட்சியில் சேருமிடத்தைத் தேடுங்கள்.';

  @override
  String get navArrived => 'நீங்கள் சென்றடைந்துவிட்டீர்கள்';

  @override
  String get navRerouting => 'வழியை மீண்டும் கணக்கிடுகிறது…';

  @override
  String get navSearchHint => 'சேருமிடத்தைத் தேடு';

  @override
  String get navSearchFieldHint => 'முகவரி, இடம் அல்லது வணிகம்';

  @override
  String get navNoResults => 'பொருந்தும் இடங்கள் இல்லை';

  @override
  String get navSearching => 'தேடுகிறது…';

  @override
  String get navSearchStartTyping =>
      'முகவரி அல்லது இடப்பெயரை உள்ளிடுங்கள். முடிவுகள் Apple Maps-இலிருந்து வரும்; இணைய இணைப்பு தேவை.';

  @override
  String get navErrorUnavailable =>
      'தேடலும் வழிகளும் கிடைக்கவில்லை — உங்கள் இணைய இணைப்பைச் சரிபார்க்கவும்.';

  @override
  String get navErrorNoLocation =>
      'வழியைத் திட்டமிட உங்கள் இடத்துக்காகக் காத்திருக்கிறது.';

  @override
  String get navErrorPermission =>
      'இட அணுகல் நிறுத்தப்பட்டுள்ளதால், உங்கள் நிலையிலிருந்து வழிகளைத் தொடங்க முடியாது.';

  @override
  String navErrorGeneric(String code) {
    return 'வழிகளை ஏற்ற முடியவில்லை ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return '$place செல்லும் வழிகள்';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return '$time மணிக்கு சென்றடைவு';
  }

  @override
  String get navStart => 'தொடங்கு';

  @override
  String get navEnd => 'முடி';

  @override
  String get navEndLabel => 'வழிசெலுத்தலை முடி';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration மீதம்';
  }

  @override
  String navAdvisory(String text) {
    return 'அறிவுரை: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes நிமி',
      one: '1 நிமி',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours மணி $minutes நிமி';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'வழி $index: $name';
  }

  @override
  String get weatherTitle => 'வானிலை';

  @override
  String weatherFeelsLike(String temperature) {
    return 'உணர்வு வெப்பநிலை $temperature';
  }

  @override
  String get weatherPrecipitation => 'மழைப்பொழிவு';

  @override
  String get weatherWind => 'காற்று';

  @override
  String get weatherVisibility => 'பார்வைத் தெளிவு';

  @override
  String get weatherHumidity => 'ஈரப்பதம்';

  @override
  String get weatherHourly => 'அடுத்த மணிநேரங்கள்';

  @override
  String weatherAsOf(String time) {
    return 'புதுப்பிக்கப்பட்டது $time';
  }

  @override
  String get weatherRefresh => 'வானிலையைப் புதுப்பி';

  @override
  String get weatherUnavailable => 'வானிலை தற்போது கிடைக்கவில்லை.';

  @override
  String get weatherNoLocation => 'வானிலைக்கு உங்கள் இடம் தேவை.';

  @override
  String get weatherLegal => 'தரவு மூலங்களும் சட்டத் தகவலும்';

  @override
  String weatherProvidedBy(String service) {
    return 'வானிலைத் தரவு: $service';
  }

  @override
  String get weatherNow => 'இப்போது';

  @override
  String get virtualEmpty =>
      'ஆதரிக்கப்படும் பொருட்கள் எதுவும் கண்டறியப்படவில்லை';

  @override
  String get virtualEmptyCameraOff => 'மெய்நிகர் காட்சிக்கு நேரடி கேமரா தேவை.';

  @override
  String get virtualLaneDisclaimer =>
      'பாதைக் கோடுகள் விளக்கத்துக்கானவை; கண்டறியப்பட்டவை அல்ல.';

  @override
  String virtualNearest(String zone) {
    return 'அருகிலுள்ளது: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'மெய்நிகர் சாலைக் காட்சி: $summary';
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
  String get virtualStatusLive => 'நேரடி';

  @override
  String get virtualStatusPaused => 'இடைநிறுத்தம்';

  @override
  String get virtualStatusCameraOff => 'கேமரா நிறுத்தம்';

  @override
  String get virtualStatusTestFootage => 'சோதனைக் காட்சிப்பதிவு';

  @override
  String get virtualEmptyHint =>
      'வாகனங்கள், மனிதர்கள், மிதிவண்டிகள், விளக்குகள், நிறுத்த அடையாளங்கள் கண்டறியப்பட்டால் இங்கே தோன்றும்.';

  @override
  String get mapRecenter => 'மீண்டும் மையப்படுத்து';

  @override
  String get mapZoomIn => 'பெரிதாக்கு';

  @override
  String get mapZoomOut => 'சிறிதாக்கு';

  @override
  String get mapUnsupported => 'ஊடாடும் வரைபடம் iPhone-இல் கிடைக்கும்.';

  @override
  String get mapObjectsApprox => 'பொருள் குறியீடுகள் தோராயமான நிலைகளாகும்.';

  @override
  String get mapWeatherUnavailable => 'வானிலை கிடைக்கவில்லை';

  @override
  String get navErrorNoRoute => 'இந்தச் சேருமிடத்துக்கு வழி கிடைக்கவில்லை.';

  @override
  String get navDismiss => 'மூடு';

  @override
  String get navGo => 'செல்';

  @override
  String get navFastest => 'விரைவானது';

  @override
  String get navThen => 'பின்னர்';

  @override
  String get navRecents => 'சமீபத்தியவை';

  @override
  String get navClearRecents => 'அழி';

  @override
  String get navSearchSubmitHint =>
      'பொருந்தும் அனைத்து இடங்களையும் காண தேடு என்பதை அழுத்தவும்';

  @override
  String get navPlaces => 'இடங்கள்';

  @override
  String get navEtaLabel => 'சென்றடைவு';

  @override
  String get navTimeLeftLabel => 'மீதம்';

  @override
  String get navOverview => 'மேலோட்டம்';

  @override
  String get navMute => 'குரலை முடக்கு';

  @override
  String get navUnmute => 'குரலை இயக்கு';

  @override
  String get navEndConfirm => 'வழிசெலுத்தலை முடிக்கவா?';

  @override
  String navEndConfirmBody(String place) {
    return '$place செல்லும் வழிகாட்டல் நிறுத்தப்படும்.';
  }

  @override
  String navArrivedAt(String place) {
    return 'நீங்கள் $place வந்தடைந்துவிட்டீர்கள்';
  }

  @override
  String get navDone => 'முடிந்தது';

  @override
  String get navWeakGps => 'GPS சமிக்ஞை பலவீனமாக உள்ளது';

  @override
  String get navLocationOff =>
      'இடம் நிறுத்தப்பட்டுள்ளது. வழிகளைத் திட்டமிடவும் வழிசெலுத்தவும் அதை இயக்குங்கள்.';

  @override
  String get navVoiceGuidance => 'குரல் வழிகாட்டல்';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance தொலைவில், $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, பிறகு $second';
  }

  @override
  String get navSpeakRerouting => 'வழியை மீண்டும் கணக்கிடுகிறேன்';

  @override
  String get navSpeakArrived => 'நீங்கள் சென்றடைந்துவிட்டீர்கள்';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count மீட்டர்',
      one: '1 மீட்டர்',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value கிலோமீட்டர்',
      one: '1 கிலோமீட்டர்',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count அடி',
      one: '1 அடி',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கஜம்',
      one: '1 கஜம்',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return '$distance தொடர்ந்து செல்லுங்கள்';
  }

  @override
  String get navErrorNoDirections =>
      'இந்தப் பிராந்தியத்தில் இந்தப் பயணத்துக்கான வழிகாட்டல் கிடைக்கவில்லை. வேறொரு சேருமிடத்தை முயலுங்கள்.';

  @override
  String navContinueFor(String distance) {
    return '$distance தொடர்ந்து செல்லுங்கள்';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value மைல்',
      one: '1 மைல்',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'அருகிலுள்ளது: $object · $zone';
  }

  @override
  String get parkingNothing => 'காட்சியில் எதுவும் கண்டறியப்படவில்லை';

  @override
  String get parkingBeeps => 'அருகாமை பீப் ஒலிகள்';

  @override
  String get parkingVolume => 'பீப் ஒலியளவு';

  @override
  String get parkingLimitations =>
      'ஒற்றைக் கேமரா, 360° அல்ல. கேமரா பார்வைக்கு வெளியே உள்ள பொருட்கள் கண்டறியப்படாது. நிறுத்த உணரிகளுக்கு மாற்றல்ல; மதிப்பீடுகள் தவறாக இருக்கலாம்; அமைதி என்றால் அப்பகுதி தெளிவாக உள்ளது என்று பொருளல்ல.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'மேலிருந்து பார்க்கும் அருகாமைக் காட்சி. $summary';
  }

  @override
  String get perceptionModeOriginal => 'அசல்';

  @override
  String get perceptionModeBoxes => 'பெட்டிகள்';

  @override
  String get perceptionModeMasks => 'பொருள் மாஸ்க்குகள்';

  @override
  String get perceptionModeRoad => 'சாலைப் பரப்பு';

  @override
  String get perceptionModeCombined => 'இணைந்தது';

  @override
  String get perceptionOpacity => 'மாஸ்க் ஒளிபுகாமை';

  @override
  String get perceptionDisclaimer =>
      'சாலைப் பரப்பு மாஸ்க் ஒரு தோராயமான காட்சி அடுக்கு. இது ஓட்டக்கூடிய இடத்தையோ பாதைகளையோ காட்டாது.';

  @override
  String get perceptionNeedsModel =>
      'மாஸ்க்குகளைக் காண பிரிவாக்க மாதிரியைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get perceptionChooseModel => 'மாதிரியைத் தேர்ந்தெடு';

  @override
  String get perceptionWaiting =>
      'முதல் பிரிவாக்க பிரேமுக்காகக் காத்திருக்கிறது…';

  @override
  String get perceptionShortCamera => 'கேமரா';

  @override
  String get perceptionShortBoxes => 'பெட்டிகள்';

  @override
  String get perceptionShortObjects => 'பொருட்கள்';

  @override
  String get perceptionShortRoad => 'சாலை';

  @override
  String get perceptionShortAll => 'அனைத்தும்';

  @override
  String get perceptionModesLabel => 'உணர்திறன் அடுக்குகள்';

  @override
  String get perceptionStatusWarmingUp => 'தயாராகிறது…';

  @override
  String get perceptionStatusLoadingModel => 'மாடல் ஏற்றப்படுகிறது…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'மாஸ்க்குகள் இடைநிறுத்தம்';

  @override
  String get perceptionLegend => 'மாஸ்க் விளக்கம்';

  @override
  String get perceptionUnavailable => 'மாஸ்க்குகள் கிடைக்கவில்லை';

  @override
  String get driveSave => 'சேமி';

  @override
  String get driveSaveIncident => 'சம்பவத்தைச் சேமி';

  @override
  String driveSaveHint(int seconds) {
    return 'டாஷ்கேம் காட்சிப்பதிவின் கடைசி $seconds வினாடிகளைச் சேமிக்கும்';
  }

  @override
  String get driveSaving => 'சம்பவத்தைச் சேமிக்கிறது…';

  @override
  String hudRecManualLabel(String time) {
    return 'பதிவு நடக்கிறது, $time';
  }

  @override
  String get driveRecord => 'பதிவு';

  @override
  String get driveRecordStartA11y => 'பதிவைத் தொடங்கு';

  @override
  String driveRecordStopA11y(String time) {
    return 'பதிவை நிறுத்து, $time பதிவானது';
  }

  @override
  String get driveRecordHint =>
      'நீங்கள் நிறுத்தும்வரை, கடைசி 5 விநாடிகள் உட்பட, தொடர்ந்து பதிவுசெய்யும்';

  @override
  String get driveRecordFailed => 'பதிவைத் தொடங்க முடியவில்லை';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'பதிவு சேமிக்கப்பட்டது · $count பகுதிகள்',
      one: 'பதிவு சேமிக்கப்பட்டது',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'பதிவு நின்றது: சேமிப்பிடம் கிட்டத்தட்ட நிறைந்துவிட்டது',
      'max_duration': 'பதிவு நின்றது: அதிகபட்ச நீளத்தை அடைந்தது',
      'camera_stopped': 'கேமராவுடன் பதிவும் நின்றது',
      'background': 'பதிவு நின்றது: ஆப் பின்னணிக்குச் சென்றது',
      'thermal': 'பதிவு நின்றது: தொலைபேசி மிகவும் சூடாக உள்ளது',
      'other': 'பதிவு நின்றது',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'சம்பவம் சேமிக்கப்பட்டது · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'பார்';

  @override
  String get driveSaveFailed => 'சம்பவத்தைச் சேமிக்க முடியவில்லை.';

  @override
  String get driveSaveNotRunning =>
      'பதிவு இன்னும் தொடங்கவில்லை — கேமரா தொடங்கும்வரை காத்திருந்து மீண்டும் முயலுங்கள்.';

  @override
  String get driveSaveTestFootage =>
      'சோதனைக் காட்சிப்பதிவு பதிவுசெய்யப்படாது. சம்பவச் சேமிப்பு நேரடி கேமராவுடன் செயல்படும்.';

  @override
  String get driveSaveStorageFull =>
      'உங்கள் iPhone-இல் சேமிப்பிடம் நிரம்பிவிட்டது. இடத்தை விடுவிக்கவும் அல்லது பழைய கிளிப்புகளை நீக்கவும்.';

  @override
  String get driveSaveIoError => 'கிளிப்பைச் சேமிப்பகத்தில் எழுத முடியவில்லை.';

  @override
  String get driveClips => 'கிளிப்புகள்';

  @override
  String get driveSettings => 'அமைப்புகள்';

  @override
  String get driveViewSwitcher => 'ஓட்டும் காட்சிகள்';

  @override
  String get driveLocationDenied =>
      'இடம் நிறுத்தப்பட்டுள்ளது — வேகம், வரைபடங்கள் மற்றும் வழிகள் கிடைக்கவில்லை.';

  @override
  String get driveCameraDenied =>
      'கேமரா அணுகல் நிறுத்தப்பட்டுள்ளது — கண்டறிதலும் பதிவும் கிடைக்கவில்லை.';

  @override
  String get driveRecorderFallback =>
      'ஒலி இன்றி பதிவுசெய்கிறது: மைக்ரோஃபோன் அணுகல் நிறுத்தப்பட்டுள்ளது.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'பதிவு அமைப்புகள் சரிசெய்யப்பட்டன: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'உங்கள் iPhone சூடாக உள்ளது. குளிர்விக்க AI மெதுவாக இயங்குகிறது — நேரடி வெயிலிலிருந்து விலக்கி, காற்றோட்டத்துக்கு அருகில் வையுங்கள்.';

  @override
  String get drivePowerThermalCritical =>
      'உங்கள் iPhone மிகவும் சூடாக உள்ளது. குளிரும்வரை AI கண்டறிதல் இடைநிறுத்தப்படும்; முடிந்தால் பதிவு தொடரும்.';

  @override
  String get drivePowerLowPower =>
      'குறைந்த ஆற்றல் முறை இயக்கத்தில் உள்ளது — AI குறைந்த வீதத்தில் இயங்குகிறது.';

  @override
  String get drivePowerBatteryLow =>
      'பேட்டரி குறைவாக உள்ளது — ஓட்டும்போது உங்கள் iPhone-ஐ மின்சாரத்தில் இணையுங்கள்.';

  @override
  String get onboardingTitle1 =>
      'ஒவ்வொரு பயணத்திலும் இன்னும் அதிகம் காணுங்கள்.';

  @override
  String get onboardingBody1 =>
      'உங்கள் iPhone-ஐ ஒரு நுண்ணறிவு டாஷ்கேமாகவும் ஓட்டுநர் விழிப்புணர்வுத் துணையாகவும் மாற்றுங்கள்.';

  @override
  String get onboardingTitle2 => 'ஒவ்வொரு பிரேமிலும் நுண்ணறிவு.';

  @override
  String get onboardingBody2 =>
      'ஆதரிக்கப்படும் வாகனங்கள், மனிதர்கள், மிதிவண்டிகள் மற்றும் சாலை சமிக்ஞைகளை உங்கள் iPhone-இலேயே அறியுங்கள்.';

  @override
  String get onboardingTitle3 => 'ஒரே சாலை. பல கோணங்கள்.';

  @override
  String get onboardingBody3 =>
      'நேரடி கண்டறிதல், மெய்நிகர் ஓட்டுநர் காட்சிகள், ஊடாடும் வரைபடங்கள் மற்றும் நிறுத்தக் காட்சிக்கு இடையே மாறுங்கள்.';

  @override
  String get onboardingTitle4 => 'முக்கியமான தருணங்களை வைத்திருங்கள்.';

  @override
  String get onboardingBody4 =>
      'சமீபத்திய டாஷ்கேம் காட்சிப்பதிவைச் சேமித்து, சம்பவங்களை மீளாய்வுசெய்து, பதிவுகளைப் பகிருங்கள்.';

  @override
  String get onboardingTitle5 => 'பாதுகாப்பும் தனியுரிமையும்';

  @override
  String get onboardingSafety1 =>
      'Corvista ஓட்டும்போது விழிப்புணர்வுக்கு உதவும் கருவி. சாலையிலிருந்து கண்களை எடுக்காதீர்கள்.';

  @override
  String get onboardingSafety2 =>
      'இது உங்கள் வாகனத்தைக் கட்டுப்படுத்தாது; உங்கள் முடிவெடுக்கும் திறனுக்கும் மாற்றாகாது.';

  @override
  String get onboardingSafety3 =>
      'கண்டறிதல்களும் மதிப்பீடுகளும் துல்லியமற்றதாகவோ தவறவிடப்பட்டதாகவோ இருக்கலாம்.';

  @override
  String get onboardingSafety4 =>
      'கேமரா செயலாக்கம் உங்கள் iPhone-இலேயே நடக்கிறது — வீடியோ பதிவேற்றப்படாது.';

  @override
  String get onboardingSafety5 =>
      'வரைபடங்கள், தேடல், வழிகள் மற்றும் வானிலைக்கு இணைய இணைப்பு தேவை.';

  @override
  String get onboardingSafety6 =>
      'உங்கள் பார்வையைத் தடுக்காதவாறு iPhone-ஐ உறுதியாகப் பொருத்துங்கள்.';

  @override
  String get onboardingSafety7 => 'ஓட்டத் தொடங்கும் முன் அமைப்பை முடியுங்கள்.';

  @override
  String get onboardingAcknowledge =>
      'Corvista ஒரு விழிப்புணர்வு உதவி மட்டுமே என்பதையும், பாதுகாப்பாக ஓட்டுவதற்கு நானே பொறுப்பு என்பதையும் புரிந்துகொள்கிறேன்.';

  @override
  String get onboardingReadSafety => 'முழு பாதுகாப்புத் தகவலைப் படி';

  @override
  String get onboardingNext => 'அடுத்து';

  @override
  String get onboardingSkip => 'தவிர்';

  @override
  String get onboardingAgree => 'தொடரவும்';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'பக்கம் $current / $total';
  }

  @override
  String get permTitle => 'அனுமதிகள்';

  @override
  String get permIntro =>
      'ஒவ்வொரு வசதிக்கும் தேவையானதை மட்டுமே Corvista கேட்கிறது. இவற்றை எப்போது வேண்டுமானாலும் அமைப்புகளில் மாற்றலாம்.';

  @override
  String get permCameraTitle => 'கேமரா';

  @override
  String get permCameraBody =>
      'கண்டறிதல், டாஷ்கேம் பதிவு மற்றும் நிறுத்தக் காட்சிக்குத் தேவை. வீடியோ உங்கள் iPhone-இலேயே செயலாக்கப்படும்.';

  @override
  String get permLocationTitle => 'இடம்';

  @override
  String get permLocationBody =>
      'GPS வேகம், வரைபடம், வழிகள், வானிலை மற்றும் சேமித்த கிளிப்புகளுக்கு இடக்குறிப்பிட பயன்படும். ஆப்பைப் பயன்படுத்தும்போது மட்டும்.';

  @override
  String get permMicTitle => 'மைக்ரோஃபோன்';

  @override
  String get permSpeechNote =>
      'அவசர எச்சரிக்கைகளுக்குக் குரல் மூலம் ரத்துசெய்வதை இயக்கினால் மட்டுமே பேச்சு அறிதல் கோரப்படும்.';

  @override
  String get permRequired => 'தேவை';

  @override
  String get permOptional => 'விருப்பம்';

  @override
  String get permAllow => 'அனுமதி';

  @override
  String get permGranted => 'அனுமதிக்கப்பட்டது';

  @override
  String get permDenied => 'மறுக்கப்பட்டது';

  @override
  String get permLimited => 'வரம்புக்குட்பட்டது';

  @override
  String get permRestricted => 'கட்டுப்படுத்தப்பட்டது';

  @override
  String get permStart => 'ஓட்டத் தொடங்கு';

  @override
  String get permCameraNeeded =>
      'கேமரா அணுகல் இன்றி தொடரலாம்; ஆனால் அமைப்புகளில் அனுமதிக்கும்வரை கண்டறிதலும் பதிவும் செயல்படாது.';

  @override
  String get permSetupIntro =>
      'Corvista முழுமையாகச் செயல்பட இவை தேவை. அனைத்தையும் அனுமதி என்பதைத் தட்டினால் iOS ஒவ்வொன்றையும் வரிசையாகக் கேட்கும். இவற்றை எப்போது வேண்டுமானாலும் அமைப்புகளில் மாற்றலாம்.';

  @override
  String get permCameraLine =>
      'கண்டறிதல், டாஷ்கேம் பதிவு மற்றும் நிறுத்தக் காட்சிக்குத் தேவை. வீடியோ உங்கள் iPhone-இலேயே செயலாக்கப்படும்; ஒருபோதும் பதிவேற்றப்படாது.';

  @override
  String get permLocationLine =>
      'GPS வேகம், வரைபடம், வழிகள், வானிலை மற்றும் கிளிப்புகள் சேமிக்கப்பட்ட இடம். ஆப்பைப் பயன்படுத்தும்போது மட்டும்.';

  @override
  String get permMicLine =>
      'சம்பவ கிளிப்புகளில் வாகனத்தின் உள் ஒலி, மற்றும் அவசர எச்சரிக்கையின்போது உங்கள் ரத்துசெய்யும் சொல்லைக் கேட்க.';

  @override
  String get permSpeechTitle => 'பேச்சு அறிதல்';

  @override
  String get permSpeechLine =>
      'ஆதரிக்கப்படும் இடங்களில் உங்கள் iPhone-இலேயே, அவசரக் கவுண்ட்டவுனின்போது உங்கள் ரத்துசெய்யும் சொல்லை அறியும்.';

  @override
  String get permAllowAll => 'அனைத்தையும் அனுமதி';

  @override
  String permAsking(String permission) {
    return '$permission அனுமதியைக் கேட்கிறது…';
  }

  @override
  String get permSomeDenied =>
      'சில அனுமதிகள் நிறுத்தப்பட்டுள்ளன. அந்த வசதிகளைப் பயன்படுத்த அமைப்புகளில் இயக்குங்கள்.';

  @override
  String get permNotNow => 'இப்போது வேண்டாம்';

  @override
  String get tourLabel => 'ஓட்டும் திரை சுற்றுலா';

  @override
  String tourProgress(int current, int total) {
    return 'படி $current / $total';
  }

  @override
  String get tourNext => 'அடுத்து';

  @override
  String get tourBack => 'பின்செல்';

  @override
  String get tourSkip => 'சுற்றுலாவைத் தவிர்';

  @override
  String get tourFinish => 'ஓட்டத் தொடங்கு';

  @override
  String get tourWelcomeTitle => 'உங்கள் விரைவு சுற்றுலா';

  @override
  String get tourWelcomeBody =>
      'ஓட்டும் திரையில் முக்கியமானவற்றை ஒரு நிமிடத்தில் பாருங்கள். வாகனத்தை நிறுத்தியிருக்கும்போது செய்வது சிறந்தது.';

  @override
  String get tourHudTitle => 'உங்கள் கருவிப் பட்டை';

  @override
  String get tourHudSpeed => 'வேகம் GPS-இலிருந்து வருகிறது.';

  @override
  String get tourHudRec =>
      'REC எத்தனை வினாடிகள் காட்சிப்பதிவு இடையகத்தில் உள்ளது என்பதைக் காட்டும்.';

  @override
  String get tourHudAi =>
      'AI சிப் மாதிரி, அது காணும் பொருட்களின் எண்ணிக்கை, மற்றும் ஒரு புள்ளியைக் காட்டும்: பச்சை இயங்குகிறது, அம்பர் வரம்புடன், சிவப்பு நின்றுவிட்டது.';

  @override
  String get tourSaveTitle => 'சம்பவத்தைச் சேமி';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista கடைசி $seconds வினாடி வீடியோவின் சுழல் இடையகத்தை வைத்திருக்கும். அது தொடர்ந்து மேலெழுதப்படுவதால், நீங்கள் சேமி என்பதைத் தட்டினால் மட்டுமே எதுவும் வைக்கப்படும். சேமித்த கிளிப்புகள் இந்த iPhone-இல், கிளிப்புகள் பகுதியில் இருக்கும்.';
  }

  @override
  String get tourRecordTitle => 'முழு பயணத்தையும் பதிவுசெய்யுங்கள்';

  @override
  String get tourRecordBody =>
      'நீங்கள் நிறுத்தும்வரை தொடர்ந்து படமெடுக்க பதிவைத் தட்டுங்கள். நீண்ட பயணங்கள் 5 நிமிடப் பகுதிகளாக கிளிப்புகளில் சேமிக்கப்படும்; பதிவின்போதும் சம்பவத்தைச் சேமி தொடர்ந்து செயல்படும்.';

  @override
  String get tourViewsTitle => 'சாலையைக் காண ஐந்து வழிகள்';

  @override
  String get tourViewDetection =>
      'ஆதரிக்கப்படும் பொருட்களைச் சுற்றிப் பெட்டிகளுடன் நேரடி கேமரா.';

  @override
  String get tourViewVirtual =>
      'கண்டறிதல்களிலிருந்து உருவாக்கப்பட்ட எளிய 3D காட்சி.';

  @override
  String get tourViewMap =>
      'தேடல் மற்றும் வளைவு வாரியான வழிகாட்டலுடன் Apple Maps.';

  @override
  String get tourViewParking =>
      'கேமராவுடன் மேலிருந்து பார்க்கும் அருகாமைக் காட்சி.';

  @override
  String get tourViewPerception => 'சாலை மற்றும் பொருள் மாஸ்க்குகள்.';

  @override
  String get tourMapTitle => 'தேடலும் வளைவு வாரியான வழிகாட்டலும்';

  @override
  String get tourMapBody =>
      'வரைபடத்தைத் திறந்து, தேடல் பட்டியைத் தட்டி, சேருமிடத்தைத் தேர்ந்தெடுங்கள். ஒரு வழியைத் தேர்ந்தெடுத்து, வளைவு வாரியான வழிகாட்டலுக்குத் தொடங்கு என்பதைத் தட்டுங்கள். இணைய இணைப்பு தேவை.';

  @override
  String get tourClipsTitle => 'கிளிப்புகள்';

  @override
  String get tourClipsBody =>
      'சேமித்த சம்பவங்களை மீளாய்வு செய்யலாம், மறுபெயரிடலாம், பகிரலாம் அல்லது நீக்கலாம். நீங்கள் பகிராதவரை கிளிப்புகள் உங்கள் iPhone-இலேயே இருக்கும்.';

  @override
  String get tourSettingsTitle => 'அமைப்புகள்';

  @override
  String get tourSettingsBody =>
      'குரல் எச்சரிக்கைகளையும் அவற்றின் உணர்திறனையும், பதிவு தரத்தையும் இடையக நீளத்தையும் சரிசெய்யுங்கள்; அவசரநிலை முறையை அமையுங்கள்: ரத்துசெய்யும் கவுண்ட்டவுனுடன் கூடிய சோதனை நிலை மோதல் எச்சரிக்கை.';

  @override
  String get tourSafetyTitle => 'ஓட்டுவதற்கு முன்';

  @override
  String get tourSafety1 =>
      'உங்கள் பார்வையைத் தடுக்காத இடத்தில் iPhone-ஐ உறுதியாகப் பொருத்துங்கள்.';

  @override
  String get tourSafety2 =>
      'ஓட்டும்போது ஆப்புடன் தொடர்புகொள்ளாதீர்கள். வாகனத்தை நிறுத்தியிருக்கும்போது அமையுங்கள்.';

  @override
  String get tourSafety3 =>
      'கண்டறிதல்களும் மண்டலங்களும் மதிப்பீடுகளே. அவை தவறாகவோ தவறவிடப்பட்டதாகவோ இருக்கலாம்.';

  @override
  String get tourSafety4 => 'பாதுகாப்பாக ஓட்டுவதற்கு நீங்களே பொறுப்பு.';

  @override
  String get helpTakeTour => 'சுற்றுலா செல்';

  @override
  String get helpTakeTourSub =>
      'ஓட்டும் திரையின் ஒரு நிமிட வழிகாட்டிப் பார்வை.';

  @override
  String get tripsTitle => 'பயணங்கள்';

  @override
  String get tripsOpen => 'பயணப் பதிவு';

  @override
  String get tripsEmptyTitle => 'இன்னும் பயணங்கள் இல்லை';

  @override
  String get tripsEmptyBody =>
      'Corvista-வுடன் ஓட்டும்போது பயணங்கள் தானாகப் பதிவாகும் — தூரம், நேரம், வேகம் மற்றும் நீங்கள் சென்ற வழி.';

  @override
  String get tripsDisabledBody =>
      'பயணப் பதிவு நிறுத்தப்பட்டுள்ளதால் புதிய பயணங்கள் பதிவாகாது. இந்த iPhone-இல் உங்கள் வழிகளின் தனிப்பட்ட பதிவை வைத்திருக்க அதை இயக்குங்கள்.';

  @override
  String get tripsEnable => 'பயணப் பதிவை இயக்கு';

  @override
  String get tripsToday => 'இன்று';

  @override
  String get tripsYesterday => 'நேற்று';

  @override
  String tripsRecordingNow(String distance) {
    return 'பயணத்தைப் பதிவுசெய்கிறது · $distance';
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
      other: '$count சம்பவங்கள்',
      one: '1 சம்பவம்',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count எச்சரிக்கைகள்',
      one: '1 எச்சரிக்கை',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count பயணங்கள்',
      one: '1 பயணம்',
      zero: 'பயணங்கள் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'தூரம்';

  @override
  String get tripsStatDuration => 'கால அளவு';

  @override
  String get tripsStatMoving => 'நகர்ந்த நேரம்';

  @override
  String get tripsStatAvgSpeed => 'சராசரி வேகம்';

  @override
  String get tripsStatMaxSpeed => 'அதிகபட்ச வேகம்';

  @override
  String get tripsDetections => 'கண்டறிதல்கள்';

  @override
  String get tripsNoDetections =>
      'இந்தப் பயணத்தில் சாலைப் பொருட்கள் எதுவும் பதிவாகவில்லை.';

  @override
  String get tripsTimeline => 'காலவரிசை';

  @override
  String get tripsEventStart => 'பயணம் தொடங்கியது';

  @override
  String get tripsEventEnd => 'பயணம் முடிந்தது';

  @override
  String get tripsEventAlert => 'குரல் எச்சரிக்கை';

  @override
  String get tripsEventIncident => 'சம்பவ கிளிப் சேமிக்கப்பட்டது';

  @override
  String get tripsEventEmergency => 'சாத்தியமான மோதல் கண்டறியப்பட்டது';

  @override
  String get tripsEventNavStart => 'வழிசெலுத்தல் தொடங்கியது';

  @override
  String get tripsEventArrive => 'சேருமிடத்தைச் சென்றடைந்தது';

  @override
  String get tripsEventReroute => 'வழி மீண்டும் கணக்கிடப்பட்டது';

  @override
  String get tripsEventRecording => 'பதிவு சேமிக்கப்பட்டது';

  @override
  String get tripsOpenClip => 'கிளிப்பைத் திற';

  @override
  String get tripsTrackPreview => 'GPS தடம்';

  @override
  String get tripsRenameTitle => 'பயணத்தை மறுபெயரிடு';

  @override
  String get tripsRenameHint => 'பயணப் பெயர்';

  @override
  String get tripsFavorite => 'பிடித்தவையில் சேர்';

  @override
  String get tripsUnfavorite => 'பிடித்தவையிலிருந்து நீக்கு';

  @override
  String get tripsShareGpx => 'GPX-ஐப் பகிர்';

  @override
  String get tripsShareFailed => 'இந்தப் பயணத்தைப் பகிர முடியவில்லை.';

  @override
  String get tripsDelete => 'பயணத்தை நீக்கு';

  @override
  String get tripsDeleteConfirmTitle => 'இந்தப் பயணத்தை நீக்கவா?';

  @override
  String get tripsDeleteConfirmBody =>
      'வழியும் புள்ளிவிவரங்களும் இந்த iPhone-இலிருந்து நீக்கப்படும். இந்தப் பயணத்தின் சம்பவ கிளிப்புகள் வைத்திருக்கப்படும்.';

  @override
  String get tripsDeleted => 'பயணம் நீக்கப்பட்டது';

  @override
  String get tripsNotFound => 'இந்தப் பயணம் இனி கிடைக்காது.';

  @override
  String get tripsPrivacyNote =>
      'இந்த iPhone-இல் மட்டுமே சேமிக்கப்படும். எதுவும் பதிவேற்றப்படாது.';

  @override
  String get settingsSectionTrips => 'பயணப் பதிவு';

  @override
  String get settingsTripLog => 'பயணங்களைப் பதிவுசெய்';

  @override
  String get settingsTripLogSubtitle =>
      'உங்கள் வழியையும் ஓட்டப் புள்ளிவிவரங்களையும் இந்த iPhone-இல் மட்டுமே வைத்திருக்கும்.';

  @override
  String get settingsTripRetention => 'பயணங்களை வைத்திருக்கும் காலம்';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days நாட்கள்',
      one: '1 நாள்',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 ஆண்டு';

  @override
  String get settingsRetentionForever => 'எப்போதும்';

  @override
  String get settingsTripRetentionFooter =>
      'Corvista தொடங்கும்போது பழைய பயணங்கள் தானாக நீக்கப்படும்.';

  @override
  String get settingsViewTrips => 'பயணங்களைப் பார்';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours மணி $minutes நிமி';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes நிமி';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista பயணம் $date';
  }

  @override
  String get settingsFreeUpSpace => 'இடத்தை விடுவி';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'தற்காலிகக் கோப்புகளையும் கேச்களையும் நீக்கும். சேமித்த கிளிப்புகளும் பயணங்களும் வைத்திருக்கப்படும்.';

  @override
  String settingsFreedBytes(String size) {
    return '$size விடுவிக்கப்பட்டது';
  }

  @override
  String get settingsNothingToFree =>
      'கேச்கள் அழிக்கப்பட்டன — நீக்க தற்காலிகக் கோப்புகள் இல்லை.';

  @override
  String get settingsSectionPrivacyData => 'தனியுரிமையும் தரவும்';

  @override
  String get settingsPrivacyDataFooter =>
      'கிளிப்புகள், பயணங்கள், அமைப்புகள் இந்த iPhone-இல் மட்டுமே சேமிக்கப்படும். நீங்கள் பகிர்வதைத் தேர்ந்தெடுத்தால் மட்டுமே அவை வெளியே செல்லும்.';

  @override
  String get settingsDeleteAllData => 'அனைத்துத் தரவையும் நீக்கு';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'இந்த iPhone-இலிருந்து கிளிப்புகள், பயணங்கள், தொடர்புகள், அமைப்புகளை அழிக்கும்';

  @override
  String get deleteAllTitle => 'அனைத்துத் தரவையும் நீக்கவா?';

  @override
  String get deleteAllMessage =>
      'இது இந்த iPhone-இலிருந்து பின்வருவனவற்றை நிரந்தரமாக அகற்றும்:\n• சம்பவ கிளிப்புகளும் சிறுபடங்களும்\n• பயணப் பதிவும் GPS தடங்களும்\n• அவசரத் தொடர்புகளும் அவசரநிலை நிகழ்வுகளும்\n• கண்டறிதல் பதிவுகளும் பிழைகண்டறிதல் பதிவும்\n• அமைப்புகளும் சமீபத்திய இலக்குகளும்\n• தற்காலிகப் பதிவு இடையகமும் கேச்சும்\n\nஇதைச் செயல்தவிர்க்க முடியாது. அதன்பிறகு Corvista வரவேற்புத் திரைகளிலிருந்து மீண்டும் தொடங்கும்.';

  @override
  String get deleteAllConfirm => 'அனைத்தையும் நீக்கு';

  @override
  String get deleteAllInProgress => 'நீக்கப்படுகிறது…';

  @override
  String get deleteAllDone => 'அனைத்துத் தரவும் நீக்கப்பட்டது';

  @override
  String get deleteAllPartial =>
      'சில உருப்படிகளை நீக்க முடியவில்லை. அமைப்புகளிலிருந்து மீண்டும் முயலுங்கள்.';

  @override
  String get diagLogSection => 'பிழைகண்டறிதல் பதிவு';

  @override
  String get diagLogFooter =>
      'பிழைகள் இந்த iPhone-இல் மட்டுமே, இருப்பிடங்கள், தொடர்புப் பெயர்கள் அல்லது தொலைபேசி எண்கள் இன்றிப் பதிவாகும். நீங்களே பதிவைப் பகிர்ந்தால் தவிர எதுவும் அனுப்பப்படாது.';

  @override
  String get diagLogShare => 'பிழைகண்டறிதல் பதிவைப் பகிர்';

  @override
  String get diagLogEmpty => 'காலி';

  @override
  String get diagLogClear => 'பதிவை அழி';

  @override
  String get diagLogClearTitle => 'பிழைகண்டறிதல் பதிவை அழிக்கவா?';

  @override
  String get diagLogClearBody =>
      'சேமிக்கப்பட்ட பிழை உள்ளீடுகள் இந்த iPhone-இலிருந்து நீக்கப்படும்.';

  @override
  String get diagLogCleared => 'பிழைகண்டறிதல் பதிவு அழிக்கப்பட்டது';

  @override
  String get diagLogShareFailed => 'பிழைகண்டறிதல் பதிவைப் பகிர முடியவில்லை.';

  @override
  String get privacyControls2 =>
      'அமைப்புகள் › தனியுரிமையும் தரவும் › அனைத்துத் தரவையும் நீக்கு என்பது, இந்த iPhone-இல் Corvista சேமித்துள்ள ஒவ்வொரு கிளிப், பயணம், தொடர்பு, பதிவு, அமைப்பையும் அழிக்கும்.';

  @override
  String get parkingZoneStop => 'நிறுத்துங்கள்';

  @override
  String get parkingZoneVeryClose => 'மிக அருகில்';

  @override
  String get parkingZoneClose => 'அருகில்';

  @override
  String get parkingZoneNothingClose => 'அருகில் எதுவும் தென்படவில்லை';

  @override
  String get parkingNotDetected =>
      'சுவர்கள், தூண்கள், கம்பங்கள், சாலையோரக் கட்டைகள் கண்டறியப்படாது';

  @override
  String get parkingApprox => 'தோராயமாக';

  @override
  String get parkingSideLeft => 'இடது';

  @override
  String get parkingSideCenter => 'நடு';

  @override
  String get parkingSideRight => 'வலது';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'முன்பக்கக் கேமரா காட்சி மட்டும் — 360° அமைப்பு அல்ல';

  @override
  String get parkingMuteBeeps => 'பீப்களை முடக்கு';

  @override
  String get parkingUnmuteBeeps => 'பீப்களை இயக்கு';

  @override
  String get parkingAbout => 'நிறுத்தக் காட்சி பற்றி';

  @override
  String get parkingLimitationsDetail =>
      'கேமராவுக்கு முன்னால் உள்ள பகுதி மட்டுமே கண்காணிக்கப்படும். கண்டறிவி கார்கள், பேருந்துகள், லாரிகள், மனிதர்கள், மிதிவண்டிகள், மோட்டார் சைக்கிள்களை அடையாளம் காணும். சுவர்கள், தூண்கள், கம்பங்கள், சாலையோரக் கட்டைகள், தடுப்புகள், தாழ்வான தடைகள் கண்டறியப்பட மாட்டாது; பானெட் உங்களுக்கு நேர்முன் உள்ள தரையை மறைக்கவும் கூடும். தூரங்கள் ஒரே கேமராவிலிருந்து (பொருளின் அளவு, இடம் அடிப்படையில்) போடப்படும் தோராயமான மதிப்பீடுகள்; அவை மிகவும் தவறாக இருக்கலாம். ஒலியின்மை அல்லது “அருகில் எதுவும் தென்படவில்லை” என்பதற்கு வழி தெளிவாக உள்ளது என்று பொருளல்ல — எப்போதும் சுற்றிலும் பாருங்கள், கண்ணாடிகளைப் பயன்படுத்துங்கள்.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'பக்கவாரியாக அருகாமை: இடது $left, நடு $center, வலது $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'பிழைகள் இந்த iPhone-இல் உள்ள தனிப்பட்ட பதிவில் எழுதப்படும் (இருப்பிடங்கள், தொடர்புப் பெயர்கள், தொலைபேசி எண்கள் இல்லாமல்). அது தானாக ஒருபோதும் அனுப்பப்படாது; அமைப்புகள் › பிழைகண்டறிதலில் அதைப் பகிரலாம் அல்லது அழிக்கலாம்.';
}
