// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'हर सफ़र में और बहुत कुछ देखें।';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonDelete => 'हटाएँ';

  @override
  String get commonSave => 'सहेजें';

  @override
  String get commonBack => 'वापस';

  @override
  String get commonClose => 'बंद करें';

  @override
  String get commonRetry => 'फिर कोशिश करें';

  @override
  String get commonOpenSettings => 'सेटिंग्स खोलें';

  @override
  String get commonLoading => 'लोड हो रहा है…';

  @override
  String get commonError => 'कुछ गड़बड़ हो गई।';

  @override
  String commonErrorDetail(String message) {
    return 'कुछ गड़बड़ हो गई: $message';
  }

  @override
  String get commonOn => 'चालू';

  @override
  String get commonOff => 'बंद';

  @override
  String get commonRename => 'नाम बदलें';

  @override
  String get commonShare => 'शेयर करें';

  @override
  String get commonNotAvailable => 'उपलब्ध नहीं';

  @override
  String get commonTestFootage => 'टेस्ट फ़ुटेज';

  @override
  String get zoneVeryClose => 'बहुत पास';

  @override
  String get zoneClose => 'पास';

  @override
  String get zoneMedium => 'मध्यम';

  @override
  String get zoneFar => 'दूर';

  @override
  String get zoneUnknown => 'अज्ञात';

  @override
  String get classPerson => 'व्यक्ति';

  @override
  String get classBicycle => 'साइकिल';

  @override
  String get classMotorcycle => 'मोटरसाइकिल';

  @override
  String get classCar => 'वाहन';

  @override
  String get classBus => 'बस';

  @override
  String get classTrafficLight => 'ट्रैफ़िक लाइट';

  @override
  String get classStopSign => 'स्टॉप साइन';

  @override
  String get viewDetection => 'डिटेक्शन';

  @override
  String get viewVirtual => 'वर्चुअल';

  @override
  String get viewMap => 'मैप';

  @override
  String get viewParking => 'पार्किंग';

  @override
  String get viewPerception => 'परसेप्शन';

  @override
  String get unitKmh => 'किमी/घं';

  @override
  String get unitMph => 'मील/घं';

  @override
  String get lightRed => 'लाल';

  @override
  String get lightYellow => 'पीली';

  @override
  String get lightGreen => 'हरी';

  @override
  String get lightUnknown => 'अज्ञात';

  @override
  String get clipsTitle => 'क्लिप';

  @override
  String get clipsSelect => 'चुनें';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count चुनी गईं',
      one: '1 चुनी गई',
      zero: 'क्लिप चुनें',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'सभी चुनें';

  @override
  String get clipsDeselectAll => 'सभी का चयन हटाएँ';

  @override
  String get clipsDeleteSelected => 'चुनी हुई हटाएँ';

  @override
  String get clipsGridView => 'ग्रिड व्यू';

  @override
  String get clipsListView => 'लिस्ट व्यू';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्लिप हटाएँ?',
      one: 'यह क्लिप हटाएँ?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ये वीडियो आपके iPhone से हमेशा के लिए हट जाएँगे। इन्हें वापस नहीं लाया जा सकता।',
      one: 'यह वीडियो आपके iPhone से हमेशा के लिए हट जाएगा। इसे वापस नहीं लाया जा सकता।',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्लिप हटाई गईं',
      one: 'क्लिप हटाई गई',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'अभी कोई क्लिप नहीं';

  @override
  String get clipsEmptyBody =>
      'ड्राइव के दौरान Corvista एक छोटा रोलिंग बफ़र रखता है। पिछले कुछ सेकंड की फ़ुटेज यहाँ रखने के लिए “घटना सहेजें” पर टैप करें।';

  @override
  String get clipsLoadError => 'आपकी क्लिप लोड नहीं हो सकीं।';

  @override
  String get clipsStorageTitle => 'स्टोरेज';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'क्लिप $clips · बफ़र $buffer · $free खाली';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सहेजी गई क्लिप',
      one: '1 सहेजी गई क्लिप',
      zero: 'कोई सहेजी क्लिप नहीं',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'आपके iPhone में स्टोरेज कम है। नई घटनाएँ सहेजी नहीं जा सकेंगी।';

  @override
  String get clipsMissingFile => 'फ़ाइल नहीं मिली';

  @override
  String get clipsEmergencyBadge => 'टक्कर';

  @override
  String clipsUntitled(String date) {
    return 'घटना · $date';
  }

  @override
  String get clipsAudio => 'ऑडियो रिकॉर्ड हुआ';

  @override
  String get clipsFavorite => 'पसंदीदा';

  @override
  String get clipsUnfavorite => 'पसंदीदा से हटाएँ';

  @override
  String get clipsLocation => 'लोकेशन सहेजी गई';

  @override
  String clipsOpenClip(String title) {
    return 'क्लिप $title खोलें';
  }

  @override
  String get playerNotFoundTitle => 'क्लिप नहीं मिली';

  @override
  String get playerNotFoundBody => 'हो सकता है यह क्लिप हटा दी गई हो।';

  @override
  String get playerMissingTitle => 'वीडियो फ़ाइल नहीं मिली';

  @override
  String get playerMissingBody =>
      'इस क्लिप की रिकॉर्डिंग अब आपके iPhone पर नहीं है। आप गैलरी से यह प्रविष्टि हटा सकते हैं।';

  @override
  String get playerRemoveEntry => 'प्रविष्टि हटाएँ';

  @override
  String get playerLoadError => 'यह वीडियो चलाया नहीं जा सकता।';

  @override
  String get playerPlay => 'चलाएँ';

  @override
  String get playerPause => 'रोकें';

  @override
  String get playerReplay => 'फिर चलाएँ';

  @override
  String get playerRenameTitle => 'क्लिप का नाम बदलें';

  @override
  String get playerRenameHint => 'क्लिप का नाम';

  @override
  String get playerRenamed => 'क्लिप का नाम बदला गया';

  @override
  String get playerFavorited => 'पसंदीदा में जोड़ी गई';

  @override
  String get playerUnfavorited => 'पसंदीदा से हटाई गई';

  @override
  String get playerShareFailed => 'यह क्लिप शेयर नहीं हो सकी।';

  @override
  String get playerDetails => 'विवरण';

  @override
  String get playerDate => 'रिकॉर्ड किया गया';

  @override
  String get playerDuration => 'अवधि';

  @override
  String get playerResolution => 'रेज़ोल्यूशन';

  @override
  String get playerSize => 'फ़ाइल का आकार';

  @override
  String get playerAudio => 'ऑडियो';

  @override
  String get playerAudioYes => 'रिकॉर्ड हुआ';

  @override
  String get playerAudioNo => 'रिकॉर्ड नहीं हुआ';

  @override
  String get playerReason => 'सहेजने का कारण';

  @override
  String get playerReasonManual => 'घटना सहेजें बटन';

  @override
  String get playerReasonEmergency => 'संभावित टक्कर का पता चलना';

  @override
  String get playerReasonRecovered => 'रुकावट के बाद वापस पाई गई';

  @override
  String get playerSpeed => 'सहेजते समय GPS गति';

  @override
  String get playerLocation => 'लोकेशन';

  @override
  String get playerOpenInMaps => 'मैप में खोलें';

  @override
  String get playerBack => 'वापस';

  @override
  String get playerMore => 'और विकल्प';

  @override
  String get clipsFilterLabel => 'दिखाएँ';

  @override
  String get clipsFilterAll => 'सभी';

  @override
  String get clipsFilterRecordings => 'रिकॉर्डिंग';

  @override
  String get clipsFilterIncidents => 'घटनाएँ';

  @override
  String get clipsFilterEmergency => 'आपातकाल';

  @override
  String get clipsFilterFavorites => 'पसंदीदा';

  @override
  String get clipsSort => 'क्रम';

  @override
  String get clipsSortNewest => 'सबसे नए पहले';

  @override
  String get clipsSortOldest => 'सबसे पुराने पहले';

  @override
  String get clipsSortLongest => 'सबसे लंबे पहले';

  @override
  String get clipsSortLargest => 'सबसे बड़े पहले';

  @override
  String get clipsToday => 'आज';

  @override
  String get clipsYesterday => 'कल';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्लिप',
      one: '1 क्लिप',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'इस श्रेणी में अभी कोई क्लिप नहीं है।';

  @override
  String get clipsFavoritesEmpty =>
      'किसी क्लिप पर स्टार लगाएँ, ताकि वह जल्दी पहुँच के लिए यहाँ रहे।';

  @override
  String get clipsKindRecording => 'रिकॉर्डिंग';

  @override
  String get clipsKindIncident => 'घटना';

  @override
  String get clipsKindEmergency => 'आपातकाल';

  @override
  String get clipsKindTest => 'टेस्ट';

  @override
  String clipsTripChip(String time) {
    return 'यात्रा · $time';
  }

  @override
  String get clipsOpenTrip => 'वह यात्रा खोलें जिसमें यह क्लिप रिकॉर्ड हुई थी';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used उपयोग में · $free खाली';
  }

  @override
  String clipsStorageClips(String size) {
    return 'क्लिप $size जगह लेती हैं';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count रिकॉर्डिंग',
      one: '1 रिकॉर्डिंग',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count घटनाएँ',
      one: '1 घटना',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count आपातकाल',
      one: '1 आपातकाल',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'जगह खाली करें';

  @override
  String get clipsStorageLowGentle =>
      '2 GB से कम जगह खाली है। रिकॉर्डिंग सुचारु रखने के लिए जगह खाली करें या ऐसी क्लिप हटा दें जिनकी आपको ज़रूरत नहीं।';

  @override
  String get clipsSaveToPhotos => 'Photos में सहेजें';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्लिप',
      one: '1 क्लिप',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्लिप ($size) हटाएँ?',
      one: 'यह क्लिप ($size) हटाएँ?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return '$total में से $done Photos में सहेजी जा रही हैं…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्लिप Photos में सहेजी गईं',
      one: 'Photos में सहेजी गई',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved Photos में सहेजी गईं · $failed नहीं सहेजी जा सकीं';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista को Photos में वीडियो जोड़ने की अनुमति नहीं है। आप इसे सेटिंग्स में अनुमति दे सकते हैं।';

  @override
  String get clipsPhotosFailed => 'Photos में सहेजा नहीं जा सका।';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्लिप पसंदीदा में जोड़ी गईं',
      one: 'पसंदीदा में जोड़ी गई',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्लिप पसंदीदा से हटाई गईं',
      one: 'पसंदीदा से हटाई गई',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (ट्रिम की गई)';
  }

  @override
  String get playerTrim => 'ट्रिम करें';

  @override
  String get playerInfo => 'जानकारी';

  @override
  String get playerKind => 'प्रकार';

  @override
  String get playerReasonRecording => 'रिकॉर्ड बटन';

  @override
  String get trimTitle => 'क्लिप ट्रिम करें';

  @override
  String get trimHint =>
      'रखने वाला हिस्सा चुनने के लिए हैंडल खींचें। मूल क्लिप में कोई बदलाव नहीं होता।';

  @override
  String get trimStartHandle => 'ट्रिम की शुरुआत';

  @override
  String get trimEndHandle => 'ट्रिम का अंत';

  @override
  String trimSelection(String duration) {
    return '$duration चुना गया';
  }

  @override
  String get trimSave => 'नई क्लिप के रूप में सहेजें';

  @override
  String get trimSaving => 'ट्रिम की गई क्लिप सहेजी जा रही है…';

  @override
  String get trimSaved => 'ट्रिम की गई क्लिप सहेजी गई';

  @override
  String get trimOpenNew => 'खोलें';

  @override
  String get trimFailed => 'यह क्लिप ट्रिम नहीं की जा सकी।';

  @override
  String get trimStorageFull =>
      'ट्रिम की गई क्लिप सहेजने के लिए पर्याप्त जगह नहीं है।';

  @override
  String get trimPreview => 'चयन चलाएँ';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsSectionCamera => 'कैमरा';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'अलर्ट';

  @override
  String get settingsSectionAlertCategories => 'अलर्ट श्रेणियाँ';

  @override
  String get settingsSectionRecording => 'रिकॉर्डिंग';

  @override
  String get settingsSectionDriving => 'ड्राइविंग';

  @override
  String get settingsSectionPower => 'पावर';

  @override
  String get settingsSectionEmergency => 'आपातकाल';

  @override
  String get settingsSectionAppearance => 'दिखावट';

  @override
  String get settingsSectionLanguage => 'भाषा';

  @override
  String get settingsSectionInformation => 'जानकारी';

  @override
  String get settingsCameraLens => 'कैमरा लेंस';

  @override
  String get settingsLensWide => 'वाइड';

  @override
  String get settingsLensUltraWide => 'अल्ट्रा वाइड';

  @override
  String get settingsLensTelephoto => 'टेलीफ़ोटो';

  @override
  String get settingsLensUnavailable => 'इस iPhone पर उपलब्ध नहीं';

  @override
  String get settingsStabilization => 'स्टेबलाइज़ेशन';

  @override
  String get settingsStabAuto => 'ऑटोमैटिक';

  @override
  String get settingsStabOff => 'बंद';

  @override
  String get settingsStabStandard => 'स्टैंडर्ड';

  @override
  String get settingsStabCinematic => 'सिनेमैटिक';

  @override
  String get settingsOverlayOpacity => 'ओवरले की पारदर्शिता';

  @override
  String get settingsShowFps => 'परफ़ॉर्मेंस आँकड़े दिखाएँ';

  @override
  String get settingsShowFpsSubtitle =>
      'डिटेक्शन व्यू पर फ़्रेम रेट और इन्फ़रेंस समय';

  @override
  String get settingsCameraFooter =>
      'लेंस और स्टेबलाइज़ेशन के बदलाव कैमरा अगली बार शुरू होने पर लागू होंगे।';

  @override
  String get settingsAiModel => 'AI मॉडल';

  @override
  String get settingsConfidence => 'डिटेक्शन कॉन्फ़िडेंस';

  @override
  String get settingsTracking => 'ऑब्जेक्ट ट्रैकिंग';

  @override
  String get settingsTrackingSubtitle =>
      'फ़्रेमों के बीच ऑब्जेक्ट को स्थिर रखता है';

  @override
  String get settingsShowLabels => 'लेबल दिखाएँ';

  @override
  String get settingsShowConfidence => 'कॉन्फ़िडेंस दिखाएँ';

  @override
  String get settingsSegmentationOpacity => 'परसेप्शन मास्क की पारदर्शिता';

  @override
  String get settingsAiFooter =>
      'कम कॉन्फ़िडेंस पर ज़्यादा ऑब्जेक्ट दिखते हैं, पर गलत डिटेक्शन भी बढ़ते हैं। डिटेक्शन गलत हो सकते हैं।';

  @override
  String get settingsVoiceAlerts => 'वॉइस अलर्ट';

  @override
  String get settingsVoiceLanguage => 'वॉइस की भाषा';

  @override
  String get settingsVoiceLanguageAuto => 'ऐप की भाषा के अनुसार';

  @override
  String get settingsVoice => 'आवाज़';

  @override
  String get settingsVoiceDefault => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get settingsVoiceQualityEnhanced => 'एन्हांस्ड';

  @override
  String get settingsVoiceQualityPremium => 'उच्च गुणवत्ता';

  @override
  String get settingsNoVoices =>
      'इस भाषा के लिए कोई आवाज़ इंस्टॉल नहीं है। iOS सेटिंग्स › एक्सेसिबिलिटी › स्पोकन कंटेंट में जोड़ें।';

  @override
  String get settingsAlertPedestrian => 'पैदल यात्री';

  @override
  String get settingsAlertCyclist => 'साइकिल सवार';

  @override
  String get settingsAlertMotorcycle => 'मोटरसाइकिलें';

  @override
  String get settingsAlertBus => 'बसें';

  @override
  String get settingsAlertVehicleClose => 'आगे वाहन बहुत पास';

  @override
  String get settingsAlertTrafficLight => 'ट्रैफ़िक लाइट बदलना';

  @override
  String get settingsAlertTrafficMoving => 'आगे ट्रैफ़िक का चलना';

  @override
  String get settingsAlertStopSign => 'स्टॉप साइन';

  @override
  String get settingsSensitivity => 'संवेदनशीलता';

  @override
  String get settingsSensitivityLow => 'कम';

  @override
  String get settingsSensitivityMedium => 'मध्यम';

  @override
  String get settingsSensitivityHigh => 'ज़्यादा';

  @override
  String get settingsCooldown => 'दोहराने का अंतराल';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds से.';
  }

  @override
  String get settingsVolume => 'वॉइस वॉल्यूम';

  @override
  String get settingsQuietMode => 'शांत मोड';

  @override
  String get settingsQuietModeSubtitle =>
      'केवल सबसे ज़रूरी अलर्ट बोले जाते हैं';

  @override
  String get settingsTestVoice => 'आवाज़ टेस्ट करें';

  @override
  String get settingsTestVoiceDone => 'नमूना अलर्ट चल रहा है…';

  @override
  String get settingsParkingBeeps => 'पार्किंग बीप';

  @override
  String get settingsBeepVolume => 'बीप वॉल्यूम';

  @override
  String get settingsAlertsFooter =>
      'अलर्ट सिर्फ़ एक सहायता हैं। हमेशा सड़क पर नज़र रखें — चुप्पी का मतलब यह नहीं कि रास्ता साफ़ है।';

  @override
  String get settingsRecordingProfile => 'रिकॉर्डिंग गुणवत्ता';

  @override
  String get settingsProfileStandard => 'स्टैंडर्ड · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'घटना बफ़र';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds सेकंड';
  }

  @override
  String get settingsManualMaxLength => 'मैन्युअल रिकॉर्डिंग की अधिकतम अवधि';

  @override
  String get settingsManualMaxUnlimited => 'असीमित';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes मिनट';
  }

  @override
  String get settingsRecordAudio => 'ऑडियो रिकॉर्ड करें';

  @override
  String get settingsRecordAudioSubtitle =>
      'सहेजी गई घटनाओं में केबिन का ऑडियो शामिल होता है';

  @override
  String get settingsMicDenied =>
      'माइक्रोफ़ोन की अनुमति बंद है। ऑडियो रिकॉर्ड करने के लिए इसे सेटिंग्स में चालू करें।';

  @override
  String get settingsWatermark => 'Corvista वॉटरमार्क';

  @override
  String get settingsTimestamp => 'तारीख़ और समय की मुहर';

  @override
  String get settingsSaveLocation => 'क्लिप के साथ लोकेशन सहेजें';

  @override
  String get settingsStorage => 'स्टोरेज और क्लिप';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count क्लिप',
      one: '1 क्लिप',
      zero: 'कोई क्लिप नहीं',
    );
    return '$_temp0 · $used उपयोग में · $free खाली';
  }

  @override
  String get settingsRecordingFooter =>
      'रोलिंग बफ़र आपके iPhone पर ही रहता है और लगातार ओवरराइट होता रहता है। बैकग्राउंड में कुछ भी रिकॉर्ड नहीं होता।';

  @override
  String get settingsDefaultView => 'डिफ़ॉल्ट व्यू';

  @override
  String get settingsUnits => 'इकाइयाँ';

  @override
  String get settingsShowCompass => 'कंपास दिखाएँ';

  @override
  String get settingsHudStyle => 'HUD शैली';

  @override
  String get settingsHudCustomize => 'HUD अनुकूलित करें';

  @override
  String get settingsDrivingSide => 'ड्राइविंग की दिशा';

  @override
  String get settingsDrivingSideAuto => 'ऑटोमैटिक';

  @override
  String get settingsDrivingSideRight => 'दाएँ';

  @override
  String get settingsDrivingSideLeft => 'बाएँ';

  @override
  String get settingsVirtualStyle => 'वर्चुअल व्यू शैली';

  @override
  String get settingsVirtualMinimal => 'मिनिमल';

  @override
  String get settingsVirtualPerspective => 'पर्सपेक्टिव';

  @override
  String get settingsVirtualHighContrast => 'हाई कंट्रास्ट';

  @override
  String get settingsKeepScreenOn => 'ड्राइविंग के दौरान स्क्रीन चालू रखें';

  @override
  String get settingsLiveActivity => 'लाइव ऐक्टिविटी';

  @override
  String get settingsLiveActivityDesc =>
      'लॉक स्क्रीन और Dynamic Island पर मोड़-दर-मोड़ दिशा-निर्देश दिखाएँ';

  @override
  String get driveRecordingPausedBackground =>
      'Corvista बैकग्राउंड में रहने के दौरान रिकॉर्डिंग रोकी गई';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'रुका हुआ';

  @override
  String get liveActivityDashcamOff => 'कैमरा बंद';

  @override
  String get liveActivityEnded => 'नेविगेशन समाप्त';

  @override
  String get liveActivityEta => 'आगमन';

  @override
  String get settingsAutoRecenter => 'मैप अपने-आप केंद्र में लाएँ';

  @override
  String get settingsHudStyleClassic => 'क्लासिक';

  @override
  String get settingsHudStyleGrid => 'ग्रिड';

  @override
  String get settingsHudStyleMinimal => 'मिनिमल';

  @override
  String get settingsHudStylePerformance => 'परफ़ॉर्मेंस';

  @override
  String get settingsHudStyleNavigation => 'नेविगेशन';

  @override
  String get settingsHudStyleNight => 'नाइट';

  @override
  String get settingsHudStyleHighContrast => 'हाई कंट्रास्ट';

  @override
  String get settingsPowerMode => 'पावर मोड';

  @override
  String get settingsPowerBalanced => 'संतुलित';

  @override
  String get settingsPowerPerformance => 'परफ़ॉर्मेंस';

  @override
  String get settingsPowerSaver => 'पावर सेवर';

  @override
  String get settingsPowerFooter =>
      'आपका iPhone गर्म होने या बैटरी कम होने पर Corvista अपने-आप AI की गति और विज़ुअल इफ़ेक्ट घटा देता है।';

  @override
  String get settingsThermal => 'तापमान स्थिति';

  @override
  String get settingsThermalNominal => 'सामान्य';

  @override
  String get settingsThermalFair => 'गर्म';

  @override
  String get settingsThermalSerious => 'बहुत गर्म';

  @override
  String get settingsThermalCritical => 'गंभीर';

  @override
  String get settingsBattery => 'बैटरी';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · चार्ज हो रही है';
  }

  @override
  String get settingsLowPowerMode =>
      'लो पावर मोड चालू है — AI कम गति से चल रहा है।';

  @override
  String get settingsAiRate => 'AI की मौजूदा गति';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'टक्कर की पहचान';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'चालू · $seconds से. की उलटी गिनती';
  }

  @override
  String get settingsEmergencyFooter =>
      'प्रायोगिक। आपातकालीन सेवाओं का विकल्प नहीं।';

  @override
  String get settingsTheme => 'थीम';

  @override
  String get settingsThemeSystem => 'सिस्टम';

  @override
  String get settingsThemeDark => 'डार्क';

  @override
  String get settingsThemeLight => 'लाइट';

  @override
  String get settingsReduceMotion => 'गति कम करें';

  @override
  String get settingsReduceMotionSubtitle => 'पूरे ऐप में एनिमेशन कम करता है';

  @override
  String get settingsAppLanguage => 'ऐप की भाषा';

  @override
  String get settingsPrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get settingsTerms => 'उपयोग की शर्तें';

  @override
  String get settingsHelp => 'सहायता';

  @override
  String get settingsSupport => 'सपोर्ट से संपर्क करें';

  @override
  String get settingsLicenses => 'ओपन-सोर्स लाइसेंस';

  @override
  String get settingsSupportUnavailable =>
      'Mail नहीं खुल सका। support@corvista.app पर लिखें।';

  @override
  String get settingsSafety => 'सुरक्षा जानकारी';

  @override
  String get settingsDiagnostics => 'डायग्नोस्टिक्स';

  @override
  String get settingsVersion => 'वर्शन';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'HUD अनुकूलित करें';

  @override
  String get hudCustomPreview => 'पूर्वावलोकन · नमूना मान';

  @override
  String get hudCustomStyle => 'शैली';

  @override
  String get hudCustomElements => 'तत्व';

  @override
  String get hudCustomSpeed => 'गति';

  @override
  String get hudCustomHeading => 'दिशा और कंपास';

  @override
  String get hudCustomClock => 'घड़ी';

  @override
  String get hudCustomBattery => 'बैटरी और तापमान';

  @override
  String get hudCustomDetections => 'AI स्थिति और डिटेक्शन';

  @override
  String get hudCustomWeather => 'मौसम';

  @override
  String get hudCustomAppearance => 'आकार और पारदर्शिता';

  @override
  String get hudCustomSize => 'आकार';

  @override
  String get hudCustomOpacity => 'पारदर्शिता';

  @override
  String get hudCustomFooter =>
      'ज़्यादा गर्म होने जैसी चेतावनियाँ हमेशा दिखती हैं, भले ही तत्व छिपे हों।';

  @override
  String get hudCustomDescClassic => 'संतुलित इंस्ट्रूमेंट क्लस्टर';

  @override
  String get hudCustomDescGrid => 'सड़क पर पर्सपेक्टिव ग्रिड';

  @override
  String get hudCustomDescMinimal => 'सिर्फ़ गति, और कुछ नहीं';

  @override
  String get hudCustomDescPerformance => 'लाइव रीडआउट के साथ गति आर्क';

  @override
  String get hudCustomDescNavigation => 'अगला मोड़ सबसे पहले';

  @override
  String get hudCustomDescNight => 'रात की ड्राइविंग के लिए धीमा और लालिमा लिए';

  @override
  String get hudCustomDescHighContrast => 'तेज़ धूप में अधिकतम स्पष्टता';

  @override
  String get languageTitle => 'भाषा';

  @override
  String get languageSystem => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get languageSystemSubtitle => 'अपने iPhone की भाषा के अनुसार';

  @override
  String get languageFooter =>
      'और भाषाएँ जल्द आ रही हैं। वॉइस अलर्ट की भाषा अलर्ट में अलग से चुनी जा सकती है।';

  @override
  String get diagTitle => 'डायग्नोस्टिक्स';

  @override
  String get diagPerformance => 'परफ़ॉर्मेंस';

  @override
  String get diagInference => 'इन्फ़रेंस समय';

  @override
  String get diagDetectHz => 'डिटेक्शन दर';

  @override
  String get diagCameraFps => 'कैमरा फ़्रेम रेट';

  @override
  String get diagMemory => 'मेमोरी';

  @override
  String get diagDropped => 'छूटे फ़्रेम';

  @override
  String get diagSegmentation => 'सेगमेंटेशन समय';

  @override
  String get diagCamera => 'कैमरा';

  @override
  String get diagStatus => 'स्थिति';

  @override
  String get diagSource => 'स्रोत';

  @override
  String get diagSourceCamera => 'लाइव कैमरा';

  @override
  String get diagSourceFile => 'टेस्ट फ़ुटेज फ़ाइल';

  @override
  String get diagResolution => 'बफ़र आकार';

  @override
  String get diagLens => 'लेंस';

  @override
  String get diagError => 'आखिरी त्रुटि';

  @override
  String get diagModel => 'AI मॉडल';

  @override
  String get diagModelLoad => 'मॉडल लोड होने का समय';

  @override
  String get diagPower => 'पावर';

  @override
  String get diagSegHz => 'सेगमेंटेशन दर';

  @override
  String get diagReduced => 'घटे हुए इफ़ेक्ट';

  @override
  String diagMs(String value) {
    return '$value मि.से.';
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
  String get diagCamIdle => 'निष्क्रिय';

  @override
  String get diagCamStarting => 'शुरू हो रहा है';

  @override
  String get diagCamRunning => 'चल रहा है';

  @override
  String get diagCamInterrupted => 'बाधित';

  @override
  String get diagCamStopped => 'रुका हुआ';

  @override
  String get diagCamUnavailable => 'अनुपलब्ध';

  @override
  String get diagCamPermissionDenied => 'अनुमति नहीं मिली';

  @override
  String get diagCamError => 'त्रुटि';

  @override
  String get diagTestFootage => 'टेस्ट फ़ुटेज';

  @override
  String get diagTestFootageBody =>
      'कैमरे की जगह लोकल वीडियो फ़ाइल पर असली ऑन-डिवाइस डिटेक्शन चलाएँ। हर व्यू पर इसे “टेस्ट फ़ुटेज” लिखा दिखता है।';

  @override
  String get diagPathLabel => 'वीडियो फ़ाइल का पाथ';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Documents/test_drive.mp4 इस्तेमाल करें';

  @override
  String get diagRun => 'टेस्ट फ़ुटेज चलाएँ';

  @override
  String get diagRunStarted =>
      'टेस्ट फ़ुटेज शुरू हो गई। देखने के लिए ड्राइव व्यू खोलें।';

  @override
  String get diagBackToCamera => 'लाइव कैमरा पर लौटें';

  @override
  String get diagDebugOnly =>
      'टेस्ट फ़ुटेज केवल डेवलपमेंट बिल्ड में उपलब्ध है।';

  @override
  String get diagFileMissing => 'इस पाथ पर कोई फ़ाइल नहीं है।';

  @override
  String get emergencySetupTitle => 'टक्कर की पहचान';

  @override
  String get emergencyExperimental => 'प्रायोगिक';

  @override
  String get emergencyIntro =>
      'ड्राइव के दौरान Corvista आपके iPhone के मोशन सेंसर से किसी संभावित गंभीर टक्कर पर नज़र रख सकता है। टक्कर का पता चलने पर उलटी गिनती शुरू होती है। अगर आप इसे रद्द नहीं करते, तो Corvista आपातकालीन सेवाओं को कॉल करने और आपके संपर्कों को संदेश भेजने का विकल्प देता है।';

  @override
  String get emergencyDisclaimer1 =>
      'यह आपातकालीन सेवाओं या आपके वाहन की अपनी क्रैश डिटेक्शन का विकल्प नहीं है।';

  @override
  String get emergencyDisclaimer2 =>
      'कॉल करने या संदेश भेजने से पहले iOS हमेशा आपसे पुष्टि माँगता है।';

  @override
  String get emergencyDisclaimer3 =>
      'टक्कर छूट सकती है, और तेज़ ब्रेक या झटकों को टक्कर समझा जा सकता है।';

  @override
  String get emergencyParkedWarning =>
      'यह सेटअप गाड़ी खड़ी करके पूरा करें। वाहन चलते समय सेटिंग्स लॉक रहती हैं।';

  @override
  String get emergencyEnable => 'टक्कर की पहचान चालू करें';

  @override
  String get emergencyEnableSubtitle => 'केवल ड्राइव सत्र के दौरान सक्रिय';

  @override
  String get emergencyNeedNumber => 'पहले आपातकालीन नंबर जोड़ें।';

  @override
  String get emergencyContacts => 'आपातकालीन संपर्क';

  @override
  String get emergencyAddContact => 'संपर्क जोड़ें';

  @override
  String get emergencyNoContacts =>
      'अभी कोई संपर्क नहीं। संपर्कों को संदेश तभी जाता है जब आप पुष्टि करते हैं।';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '$name को हटाएँ?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'टक्कर के बाद उन्हें प्राप्तकर्ता के रूप में नहीं दिखाया जाएगा।';

  @override
  String get emergencyRemove => 'हटाएँ';

  @override
  String get emergencyContactsError => 'संपर्क लोड नहीं हो सके।';

  @override
  String get emergencyNumber => 'आपातकालीन नंबर';

  @override
  String get emergencyNumberHint => 'जैसे 112 या 911';

  @override
  String get emergencyMessage => 'संदेश का टेम्पलेट';

  @override
  String get emergencyMessageDefault =>
      'हो सकता है मैं किसी वाहन दुर्घटना में फँसा/फँसी हूँ। यह संदेश Corvista ने तैयार किया है और इसमें, यदि उपलब्ध हो, मेरी आखिरी ज्ञात लोकेशन शामिल है।';

  @override
  String get emergencyMessageHint => 'डिफ़ॉल्ट संदेश के लिए खाली छोड़ें।';

  @override
  String get emergencyCountdown => 'उलटी गिनती की अवधि';

  @override
  String get emergencyVoiceCancel => 'आवाज़ से रद्द करें';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'उलटी गिनती के दौरान “मैं ठीक हूँ” या “रद्द करें” कहें। जहाँ उपलब्ध हो, ऑन-डिवाइस स्पीच रिकग्निशन का उपयोग होता है।';

  @override
  String get emergencyVoicePermDenied =>
      'आवाज़ से रद्द करने के लिए माइक्रोफ़ोन और स्पीच रिकग्निशन की अनुमति चाहिए।';

  @override
  String get emergencyAutoSave => 'घटना की क्लिप अपने-आप सहेजें';

  @override
  String get emergencyTest => 'उलटी गिनती टेस्ट करें (कॉल नहीं)';

  @override
  String get emergencyTestBody =>
      'एक नकली टक्कर चलाता है ताकि आप उलटी गिनती देख सकें। टेस्ट मोड में कोई कॉल या संदेश नहीं भेजा जाता।';

  @override
  String get emergencyNotSet => 'सेट नहीं है';

  @override
  String get emergencyAlertHeadline => 'संभावित गंभीर टक्कर का पता चला।';

  @override
  String get emergencyAlertSubtitle => 'क्या आप ठीक हैं?';

  @override
  String get emergencyAlertCancel => 'मैं ठीक हूँ — रद्द करें';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds सेकंड बाकी',
      one: '1 सेकंड बाकी',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'सुन रहा है — रद्द करने के लिए “मैं ठीक हूँ” कहें';

  @override
  String emergencyAlertHeard(String text) {
    return 'सुना गया: “$text”';
  }

  @override
  String get emergencyAlertEscalated =>
      'कोई जवाब नहीं मिला। चुनें क्या करना है:';

  @override
  String get emergencyAlertCall => 'आपातकालीन सेवाओं को कॉल करें';

  @override
  String emergencyAlertCallNumber(String number) {
    return '$number पर कॉल करता है। iOS आपसे पुष्टि माँगेगा।';
  }

  @override
  String get emergencyAlertMessage => 'संपर्कों को संदेश भेजें';

  @override
  String get emergencyAlertMessageSubtitle =>
      'तैयार संदेश खुलता है। भेजना है या नहीं, यह आप तय करते हैं।';

  @override
  String get emergencyAlertTestMode => 'टेस्ट मोड — कोई कॉल नहीं किया जाएगा';

  @override
  String get emergencyAlertTestBadge => 'टेस्ट';

  @override
  String get emergencyAlertClose => 'मैं ठीक हूँ — बंद करें';

  @override
  String get emergencyMsgSent => 'संदेश भेज दिया गया।';

  @override
  String get emergencyMsgCancelled => 'संदेश नहीं भेजा गया।';

  @override
  String get emergencyMsgFailed => 'संदेश भेजा नहीं जा सका।';

  @override
  String get emergencyMsgUnavailable => 'इस डिवाइस पर मैसेजिंग उपलब्ध नहीं है।';

  @override
  String emergencyCallFailed(String number) {
    return 'कॉल शुरू नहीं हो सकी। $number पर खुद कॉल करें।';
  }

  @override
  String get modelsTitle => 'AI मॉडल';

  @override
  String get modelsIntro =>
      'सभी मॉडल ऐप के साथ आते हैं और पूरी तरह आपके iPhone पर चलते हैं। आपका कैमरा फ़ीड डिवाइस से बाहर कभी नहीं जाता।';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'लाइव: $ms मि.से. प्रति फ़्रेम · $hz डिटेक्शन/से.';
  }

  @override
  String modelsLastLoad(String ms) {
    return '$ms मि.से. में लोड हुआ';
  }

  @override
  String get modelsEfficientName => 'एफ़िशिएंट';

  @override
  String get modelsEfficientDesc =>
      'तेज़ और कॉम्पैक्ट डिटेक्टर, कम गर्मी और कम बैटरी खपत के साथ लंबी ड्राइव के लिए तैयार।';

  @override
  String get modelsEnhancedName => 'एन्हांस्ड';

  @override
  String get modelsEnhancedDesc =>
      'बड़ा डिटेक्टर जो छोटे और दूर के ऑब्जेक्ट पहचानता है, पर ज़्यादा बिजली खर्च करता है।';

  @override
  String get modelsSegmentationName => 'सेगमेंटेशन';

  @override
  String get modelsSegmentationDesc =>
      'परसेप्शन व्यू के लिए तेज़ डिटेक्शन के साथ सड़क की सतह और ऑब्जेक्ट के मास्क जोड़ता है।';

  @override
  String get modelsNoneName => 'AI रुका हुआ';

  @override
  String get modelsNoneDesc =>
      'कैमरा और रिकॉर्डिंग ऑब्जेक्ट डिटेक्शन के बिना चलते रहते हैं। सबसे कम बिजली खपत।';

  @override
  String get modelsGenericDesc => 'ऑन-डिवाइस ऑब्जेक्ट डिटेक्शन मॉडल।';

  @override
  String get modelsFunctionDetection =>
      'वाहन, लोग, साइकिल, मोटरसाइकिल, बस, ट्रैफ़िक लाइट और स्टॉप साइन पहचानता है';

  @override
  String get modelsFunctionSegmentation =>
      'सड़क की सतह और ऑब्जेक्ट के मास्क जोड़ता है';

  @override
  String get modelsFunctionNone => 'कोई डिटेक्शन नहीं; केवल डैशकैम रिकॉर्डिंग';

  @override
  String get modelsSize => 'आकार';

  @override
  String get modelsInput => 'इनपुट';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'इनके साथ काम करता है';

  @override
  String get modelsStatusInstalled => 'इंस्टॉल है (बंडल्ड)';

  @override
  String get modelsStatusNotInstalled => 'इंस्टॉल नहीं है';

  @override
  String get modelsSelected => 'चुना गया';

  @override
  String get modelsUse => 'यह मॉडल इस्तेमाल करें';

  @override
  String get modelsSwitching => 'मॉडल लोड हो रहा है…';

  @override
  String modelsSwitched(String name) {
    return '$name अब सक्रिय है';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'इस डिवाइस पर मापा गया: औसत $ms मि.से.';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'इस डिवाइस पर मापा नहीं गया';

  @override
  String get modelsBenchmarkRun => 'बेंचमार्क चलाएँ';

  @override
  String get modelsBenchmarkRunning => 'बेंचमार्क चल रहा है…';

  @override
  String get modelsBenchmarkSelectHint => 'बेंचमार्क के लिए यह मॉडल चुनें।';

  @override
  String get modelsBenchmarkDone => 'बेंचमार्क पूरा हुआ';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'बेंचमार्क विफल रहा: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'आखिरी अपडेट $date';
  }

  @override
  String get safetyTitle => 'सुरक्षा जानकारी';

  @override
  String get safetyIntro =>
      'Corvista ड्राइविंग में सजगता बढ़ाने वाला एक सहायक है। यह आपके वाहन को नियंत्रित नहीं करता और आपके अपने ध्यान, विवेक या वाहन की सुरक्षा प्रणालियों की जगह नहीं ले सकता।';

  @override
  String get safetyBeforeTitle => 'ड्राइव से पहले';

  @override
  String get safetyBefore1 =>
      'अपने iPhone को ऐसी वैध जगह पर मज़बूती से लगाएँ जो आपकी नज़र, एयरबैग या कंट्रोल को न रोके।';

  @override
  String get safetyBefore2 =>
      'सेटअप पूरा करें, व्यू चुनें और गंतव्य तय करें — यह सब गाड़ी खड़ी करके करें।';

  @override
  String get safetyBefore3 =>
      'लंबी ड्राइव के लिए चार्जर लगाएँ और जहाँ तक हो सके फ़ोन को सीधी धूप से दूर रखें।';

  @override
  String get safetyWhileTitle => 'ड्राइविंग के दौरान';

  @override
  String get safetyWhile1 =>
      'नज़र सड़क पर रखें। स्क्रीन के बड़े कंट्रोल तभी इस्तेमाल करें जब ऐसा करना सुरक्षित और वैध हो।';

  @override
  String get safetyWhile2 =>
      'अलर्ट सहायता हैं, भरोसेमंद चेतावनियाँ नहीं। चुप्पी का मतलब कभी यह नहीं कि सड़क साफ़ है।';

  @override
  String get safetyWhile3 =>
      'जब ऐप और ट्रैफ़िक नियमों, सिग्नल या सड़क के संकेतों में अंतर हो, तो ऐप नहीं, नियमों और संकेतों का पालन करें।';

  @override
  String get safetyLimitsTitle => 'सीमाएँ';

  @override
  String get safetyLimits1 =>
      'फ़ोन का एक कैमरा केवल अपने सामने का दृश्य देखता है। उसके दायरे से बाहर, छिपे हुए या बहुत पास के ऑब्जेक्ट नहीं पहचाने जाते।';

  @override
  String get safetyLimits2 =>
      'डिटेक्शन छूट सकते हैं, देर से आ सकते हैं या गलत हो सकते हैं — खासकर रात में, बारिश, कोहरे या चकाचौंध में, या गंदे विंडशील्ड के साथ।';

  @override
  String get safetyLimits3 =>
      'केवल समर्थित श्रेणियाँ पहचानी जाती हैं: वाहन, बसें, मोटरसाइकिलें, साइकिलें, लोग, ट्रैफ़िक लाइट और स्टॉप साइन। वर्चुअल व्यू में लेन के संकेत चित्रात्मक हैं, पहचानी गई लेन नहीं।';

  @override
  String get safetyLimits4 =>
      'दूरी अनुमानित ज़ोन (बहुत पास, पास, मध्यम, दूर) के रूप में दिखती है, नापी गई दूरी के रूप में कभी नहीं। पार्किंग व्यू पार्किंग सेंसर का विकल्प नहीं है।';

  @override
  String get safetyHeatTitle => 'गर्मी और बैटरी';

  @override
  String get safetyHeat1 =>
      'कैमरा और AI का लगातार उपयोग आपके iPhone को गर्म करता है। डिवाइस गर्म होने पर Corvista विश्लेषण की गति घटाता है और चेतावनी दिखाता है; अगर iOS बहुत गर्म हो जाए तो कैमरा बंद हो सकता है।';

  @override
  String get safetyEmergencyTitle => 'आपातकालीन सुविधा';

  @override
  String get safetyEmergency1 =>
      'संभावित टक्कर की पहचान प्रायोगिक है। यह असली दुर्घटनाओं को चूक सकती है और अन्य घटनाओं से भी चालू हो सकती है।';

  @override
  String get safetyEmergency2 =>
      'यह कभी चुपचाप किसी से संपर्क नहीं करती: iOS कॉल या संदेश से पहले हमेशा पुष्टि माँगता है। यह खुद आपातकालीन सेवाओं को कॉल करने का विकल्प नहीं है।';

  @override
  String get privacyTitle => 'गोपनीयता';

  @override
  String get privacyIntro =>
      'Corvista इस तरह बनाया गया है कि आपका ड्राइविंग डेटा आपके iPhone पर ही रहे। कोई Corvista खाता नहीं है, और Corvista अपने सर्वर नहीं चलाता।';

  @override
  String get privacyCameraTitle => 'कैमरा और AI';

  @override
  String get privacyCamera1 =>
      'ऑब्जेक्ट डिटेक्शन, ट्रैकिंग और सेगमेंटेशन पूरी तरह आपके iPhone पर चलते हैं। कैमरा फ़्रेम कभी अपलोड नहीं किए जाते।';

  @override
  String get privacyCamera2 =>
      'कैमरा केवल तब चलता है जब Corvista स्क्रीन पर खुला हो। ऐप बैकग्राउंड में जाते ही यह रुक जाता है — कोई छिपी हुई बैकग्राउंड रिकॉर्डिंग नहीं होती।';

  @override
  String get privacyRecordingsTitle => 'रिकॉर्डिंग';

  @override
  String get privacyRecordings1 =>
      'रोलिंग बफ़र अस्थायी है और लगातार ओवरराइट होता रहता है। फ़ुटेज तभी रखी जाती है जब आप “घटना सहेजें” पर टैप करें या, यदि आपने चालू किया हो, संभावित टक्कर के बाद।';

  @override
  String get privacyRecordings2 =>
      'सहेजी गई क्लिप आपके iPhone पर Corvista के निजी स्टोरेज में रहती हैं। वे डिवाइस से तभी बाहर जाती हैं जब आप शेयर चुनते हैं। ऐप हटाने पर वे भी हट जाती हैं।';

  @override
  String get privacyRecordings3 =>
      'ऑडियो तभी रिकॉर्ड होता है जब आप इसे चालू करें और माइक्रोफ़ोन की अनुमति दें।';

  @override
  String get privacyLocationTitle => 'लोकेशन';

  @override
  String get privacyLocation1 =>
      'ऐप खुला होने पर लोकेशन का उपयोग आपकी गति, मैप, रूट और मौसम के लिए होता है। अगर “लोकेशन सहेजें” चालू है, तो सहेजते समय की स्थिति क्लिप के साथ आपके डिवाइस पर रखी जाती है।';

  @override
  String get privacyNetworkTitle => 'नेटवर्क सेवाएँ';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — मैप दिखाना, जगह खोजना और रूट। आपका खोज टेक्स्ट और अनुमानित लोकेशन Apple को भेजे जाते हैं।';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — आपकी लोकेशन का मौजूदा और घंटेवार मौसम।';

  @override
  String get privacyNetwork4 =>
      'Corvista में कोई विज्ञापन और कोई थर्ड-पार्टी एनालिटिक्स या ट्रैकिंग नहीं है।';

  @override
  String get privacyEmergencyTitle => 'आपातकालीन संपर्क';

  @override
  String get privacyEmergency1 =>
      'आपके चुने हुए संपर्क इस डिवाइस के iOS कीचेन में रखे जाते हैं। आवाज़ से रद्द करने में, जहाँ उपलब्ध हो, ऑन-डिवाइस स्पीच रिकग्निशन का उपयोग होता है। कॉल और संदेश तभी भेजे जाते हैं जब आप iOS में उनकी पुष्टि करें।';

  @override
  String get privacyControlsTitle => 'आपके नियंत्रण';

  @override
  String get privacyControls1 =>
      'आप क्लिप में कभी भी क्लिप हटा सकते हैं, और iOS सेटिंग्स में कैमरा, माइक्रोफ़ोन, लोकेशन और स्पीच की अनुमति बदल या वापस ले सकते हैं।';

  @override
  String get termsTitle => 'उपयोग की शर्तें';

  @override
  String get termsIntro =>
      'Corvista का उपयोग करके आप इन शर्तों से सहमत होते हैं। Apple का मानक Licensed Application End User License Agreement भी लागू होता है।';

  @override
  String get termsUseTitle => 'Corvista का उपयोग';

  @override
  String get termsUse1 =>
      'Corvista ड्राइविंग में सजगता और डैशकैम के लिए एक सहायक है। हर समय सुरक्षित और वैध तरीके से ड्राइव करने की पूरी ज़िम्मेदारी आपकी ही रहती है।';

  @override
  String get termsUse2 =>
      'ड्राइविंग के दौरान ऐप से ऐसे तरीके से इंटरैक्ट न करें जिससे आपका ध्यान भटके। डिवाइस को मज़बूती से और वैध तरीके से लगाएँ।';

  @override
  String get termsAccuracyTitle => 'सटीकता की कोई गारंटी नहीं';

  @override
  String get termsAccuracy1 =>
      'डिटेक्शन, ज़ोन, अलर्ट, मैप मार्कर, रूट और मौसम अधूरे, देर से या गलत हो सकते हैं। Corvista आपके वाहन को नियंत्रित नहीं करता।';

  @override
  String get termsAccuracy2 =>
      'आपातकालीन सुविधा प्रायोगिक है और टक्कर का पता लगाने में विफल हो सकती है या गलती से चालू हो सकती है।';

  @override
  String get termsRecordingTitle => 'रिकॉर्डिंग कानून';

  @override
  String get termsRecording1 =>
      'डैशकैम, ऑडियो रिकॉर्डिंग और लोगों की फ़िल्म बनाने से जुड़े कानून हर देश और क्षेत्र में अलग हैं। उनका पालन करना आपकी ज़िम्मेदारी है, क्लिप शेयर करते समय भी।';

  @override
  String get termsLiabilityTitle => 'दायित्व';

  @override
  String get termsLiability1 =>
      'ऐप “जैसा है” के आधार पर दिया गया है। कानून जितनी अनुमति दे, उस सीमा तक डेवलपर इसके उपयोग या इसके नतीजों पर भरोसा करने से होने वाली दुर्घटनाओं, नुकसान, जुर्माने या क्षति के लिए उत्तरदायी नहीं है।';

  @override
  String get termsChangesTitle => 'बदलाव';

  @override
  String get termsChanges1 =>
      'ऐप के नए वर्शन के साथ ये शर्तें अपडेट हो सकती हैं। अपडेट के बाद ऐप का उपयोग जारी रखने का मतलब है कि आप संशोधित शर्तें स्वीकार करते हैं।';

  @override
  String get helpTitle => 'सहायता';

  @override
  String get helpIntro =>
      'आम सवालों के जवाब। सुरक्षा मार्गदर्शन के लिए सुरक्षा जानकारी देखें।';

  @override
  String get helpQSave => 'किसी घटना की फ़ुटेज कैसे रखूँ?';

  @override
  String get helpASaveBuffer =>
      'ड्राइव व्यू में बड़े “घटना सहेजें” बटन पर टैप करें। Corvista अपने रोलिंग बफ़र के आख़िरी 20 या 30 सेकंड (आपकी पसंद, सेटिंग्स › रिकॉर्डिंग में) क्लिप में सहेज देता है।';

  @override
  String get helpQWhere => 'मेरी क्लिप कहाँ रखी जाती हैं?';

  @override
  String get helpAWhere =>
      'आपके iPhone पर Corvista के निजी स्टोरेज में। वे कभी अपलोड नहीं होतीं। क्लिप भेजने या एक्सपोर्ट करने के लिए प्लेयर में शेयर का उपयोग करें।';

  @override
  String get helpQZones => 'नज़दीकी ज़ोन कितने सटीक हैं?';

  @override
  String get helpAZones =>
      'ज़ोन एक कैमरे से, ऑब्जेक्ट के सामान्य आकार के आधार पर लगाए गए मोटे अनुमान हैं। इन्हें अनुमानित संकेत मानें, दूरी नहीं।';

  @override
  String get helpQSlow => 'डिटेक्शन धीमा क्यों हो जाता है?';

  @override
  String get helpASlow =>
      'जब आपका iPhone गर्म हो, बैटरी कम हो या लो पावर मोड चालू हो, तो Corvista डिवाइस की सुरक्षा के लिए विश्लेषण की गति घटा देता है। आप सेटिंग्स में पावर मोड बदल सकते हैं।';

  @override
  String get helpQMap => 'मैप, खोज या मौसम काम नहीं कर रहा।';

  @override
  String get helpAMap =>
      'इन सुविधाओं के लिए इंटरनेट कनेक्शन और लोकेशन की अनुमति चाहिए। अपना कनेक्शन जाँचें और iOS सेटिंग्स में Corvista को लोकेशन की अनुमति दें।';

  @override
  String get helpQSimulator => 'कैमरा अनुपलब्ध दिख रहा है।';

  @override
  String get helpASimulator =>
      'सुनिश्चित करें कि iOS सेटिंग्स में कैमरे की अनुमति दी गई है और कोई अन्य ऐप कैमरे का उपयोग नहीं कर रहा। iOS Simulator में कैमरा नहीं होता; उसकी जगह लोकल टेस्ट वीडियो इस्तेमाल किया जा सकता है।';

  @override
  String get emergencyMsgNoContacts => 'पहले आपातकालीन संपर्क जोड़ें।';

  @override
  String get cameraStarting => 'कैमरा शुरू हो रहा है…';

  @override
  String get cameraInterrupted => 'कैमरा रुका हुआ है';

  @override
  String get cameraInterruptedBody =>
      'iOS ने कैमरा रोक दिया है, जैसे कॉल के दौरान या जब कोई अन्य ऐप उसे इस्तेमाल कर रहा हो। यह अपने-आप फिर शुरू हो जाएगा।';

  @override
  String get cameraUnavailable => 'कैमरा अनुपलब्ध';

  @override
  String get cameraUnavailableBody =>
      'इस डिवाइस पर कोई कैमरा उपलब्ध नहीं है। डिटेक्शन, रिकॉर्डिंग और पार्किंग व्यू को पिछला कैमरा चाहिए।';

  @override
  String get cameraRunTestFootage => 'टेस्ट फ़ुटेज चलाएँ';

  @override
  String get cameraPermissionDenied => 'कैमरे की अनुमति बंद है';

  @override
  String get cameraPermissionDeniedBody =>
      'डिटेक्शन, डैशकैम रिकॉर्डिंग और पार्किंग व्यू के लिए Corvista को कैमरा चाहिए। सेटिंग्स में कैमरे की अनुमति चालू करें।';

  @override
  String get cameraError => 'कैमरा त्रुटि';

  @override
  String get cameraStopped => 'कैमरा बंद हो गया';

  @override
  String get cameraStart => 'कैमरा शुरू करें';

  @override
  String get cameraFocusHint => 'फ़ोकस के लिए टैप करें';

  @override
  String get cameraPreviewLabel => 'पहचाने गए ऑब्जेक्ट के साथ लाइव कैमरा व्यू';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'कैमरा $fps fps · AI $hz Hz · $ms मि.से. · छूटे $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'गति $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'GPS गति उपलब्ध नहीं';

  @override
  String hudHeading(String direction, String degrees) {
    return 'दिशा $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $secondsसे.';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'डैशकैम बफ़र रिकॉर्डिंग, $target में से $seconds सेकंड बफ़र हुए';
  }

  @override
  String get hudRecIdle => 'REC बंद';

  @override
  String get hudRecSaving => 'सहेजा जा रहा है…';

  @override
  String get hudRecError => 'REC त्रुटि';

  @override
  String get hudAiPaused => 'AI रुका हुआ';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ऑब्जेक्ट',
      one: '1 ऑब्जेक्ट',
      zero: 'कोई ऑब्जेक्ट नहीं',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ऑब्जेक्ट मिले',
      one: '1 ऑब्जेक्ट मिला',
      zero: 'कोई ऑब्जेक्ट नहीं मिला',
    );
    return 'AI मॉडल $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'बहुत गर्म — AI धीमा';

  @override
  String get hudThermalCritical => 'अत्यधिक गर्म — AI रुका हुआ';

  @override
  String hudBatteryLow(String percent) {
    return 'बैटरी $percent';
  }

  @override
  String get hudLowPower => 'लो पावर मोड';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'मौसम $temperature, $condition। विवरण के लिए टैप करें।';
  }

  @override
  String get hudNoGuidance =>
      'यहाँ टर्न-बाय-टर्न मार्गदर्शन देखने के लिए मैप व्यू में गंतव्य खोजें।';

  @override
  String get navArrived => 'आप पहुँच गए हैं';

  @override
  String get navRerouting => 'नया रूट बन रहा है…';

  @override
  String get navSearchHint => 'गंतव्य खोजें';

  @override
  String get navSearchFieldHint => 'पता, जगह या व्यवसाय';

  @override
  String get navNoResults => 'कोई मिलती-जुलती जगह नहीं';

  @override
  String get navSearching => 'खोज रहा है…';

  @override
  String get navSearchStartTyping =>
      'पता या जगह का नाम लिखें। नतीजे Apple Maps से आते हैं और इंटरनेट कनेक्शन चाहिए।';

  @override
  String get navErrorUnavailable =>
      'खोज और रूट उपलब्ध नहीं हैं — अपना इंटरनेट कनेक्शन जाँचें।';

  @override
  String get navErrorNoLocation =>
      'रूट बनाने के लिए आपकी लोकेशन का इंतज़ार है।';

  @override
  String get navErrorPermission =>
      'लोकेशन की अनुमति बंद है, इसलिए रूट आपकी स्थिति से शुरू नहीं हो सकते।';

  @override
  String navErrorGeneric(String code) {
    return 'रूट लोड नहीं हो सके ($code)।';
  }

  @override
  String navRoutesTitle(String place) {
    return '$place के रूट';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return '$time पर पहुँचें';
  }

  @override
  String get navStart => 'शुरू करें';

  @override
  String get navEnd => 'समाप्त करें';

  @override
  String get navEndLabel => 'नेविगेशन समाप्त करें';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration बाकी';
  }

  @override
  String navAdvisory(String text) {
    return 'सलाह: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes मिनट',
      one: '1 मिनट',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours घं $minutes मि.';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'रूट $index: $name';
  }

  @override
  String get weatherTitle => 'मौसम';

  @override
  String weatherFeelsLike(String temperature) {
    return 'महसूस होता है $temperature';
  }

  @override
  String get weatherPrecipitation => 'वर्षा';

  @override
  String get weatherWind => 'हवा';

  @override
  String get weatherVisibility => 'दृश्यता';

  @override
  String get weatherHumidity => 'नमी';

  @override
  String get weatherHourly => 'अगले घंटे';

  @override
  String weatherAsOf(String time) {
    return 'अपडेट $time';
  }

  @override
  String get weatherRefresh => 'मौसम रीफ़्रेश करें';

  @override
  String get weatherUnavailable => 'मौसम अभी उपलब्ध नहीं है।';

  @override
  String get weatherNoLocation => 'मौसम के लिए आपकी लोकेशन चाहिए।';

  @override
  String get weatherLegal => 'डेटा स्रोत और कानूनी जानकारी';

  @override
  String weatherProvidedBy(String service) {
    return 'मौसम डेटा: $service';
  }

  @override
  String get weatherNow => 'अभी';

  @override
  String get virtualEmpty => 'कोई समर्थित ऑब्जेक्ट नहीं मिला';

  @override
  String get virtualEmptyCameraOff => 'वर्चुअल व्यू के लिए लाइव कैमरा चाहिए।';

  @override
  String get virtualLaneDisclaimer =>
      'लेन की रेखाएँ चित्रात्मक हैं, पहचानी हुई नहीं।';

  @override
  String virtualNearest(String zone) {
    return 'सबसे पास: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'वर्चुअल सड़क दृश्य: $summary';
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
  String get virtualStatusLive => 'चालू';

  @override
  String get virtualStatusPaused => 'रुका हुआ';

  @override
  String get virtualStatusCameraOff => 'कैमरा बंद';

  @override
  String get virtualStatusTestFootage => 'टेस्ट फ़ुटेज';

  @override
  String get virtualEmptyHint =>
      'वाहन, लोग, साइकिलें, ट्रैफ़िक लाइटें और स्टॉप साइन पहचाने जाने पर यहाँ दिखते हैं।';

  @override
  String get mapRecenter => 'केंद्र में लाएँ';

  @override
  String get mapZoomIn => 'ज़ूम इन';

  @override
  String get mapZoomOut => 'ज़ूम आउट';

  @override
  String get mapUnsupported => 'इंटरैक्टिव मैप iPhone पर उपलब्ध है।';

  @override
  String get mapObjectsApprox => 'ऑब्जेक्ट मार्कर अनुमानित स्थितियाँ हैं।';

  @override
  String get mapWeatherUnavailable => 'मौसम उपलब्ध नहीं';

  @override
  String get navErrorNoRoute => 'इस गंतव्य का कोई रूट नहीं मिला।';

  @override
  String get navDismiss => 'हटाएँ';

  @override
  String get navGo => 'चलें';

  @override
  String get navFastest => 'सबसे तेज़';

  @override
  String get navThen => 'फिर';

  @override
  String get navRecents => 'हाल के';

  @override
  String get navClearRecents => 'साफ़ करें';

  @override
  String get navSearchSubmitHint =>
      'सभी मिलते-जुलते स्थान देखने के लिए खोजें दबाएँ';

  @override
  String get navPlaces => 'स्थान';

  @override
  String get navEtaLabel => 'आगमन';

  @override
  String get navTimeLeftLabel => 'बाकी';

  @override
  String get navOverview => 'पूरा रूट';

  @override
  String get navMute => 'आवाज़ म्यूट करें';

  @override
  String get navUnmute => 'आवाज़ अनम्यूट करें';

  @override
  String get navEndConfirm => 'नेविगेशन समाप्त करें?';

  @override
  String navEndConfirmBody(String place) {
    return '$place के लिए मार्गदर्शन बंद हो जाएगा।';
  }

  @override
  String navArrivedAt(String place) {
    return 'आप $place पहुँच गए हैं';
  }

  @override
  String get navDone => 'हो गया';

  @override
  String get navWeakGps => 'GPS सिग्नल कमज़ोर है';

  @override
  String get navLocationOff =>
      'लोकेशन बंद है। रूट बनाने और नेविगेट करने के लिए इसे चालू करें।';

  @override
  String get navVoiceGuidance => 'वॉइस गाइडेंस';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance बाद, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, फिर $second';
  }

  @override
  String get navSpeakRerouting => 'नया रूट बन रहा है';

  @override
  String get navSpeakArrived => 'आप पहुँच गए हैं';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मीटर',
      one: '1 मीटर',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value किलोमीटर',
      one: '1 किलोमीटर',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ुट',
      one: '1 फ़ुट',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count यार्ड',
      one: '1 यार्ड',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return '$distance तक सीधे चलते रहिए';
  }

  @override
  String get navErrorNoDirections =>
      'इस क्षेत्र में इस यात्रा के लिए दिशा-निर्देश उपलब्ध नहीं हैं। कोई दूसरा गंतव्य आज़माएँ।';

  @override
  String navContinueFor(String distance) {
    return '$distance तक सीधे चलें';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value मील',
      one: '1 मील',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'सबसे पास: $object · $zone';
  }

  @override
  String get parkingNothing => 'दृश्य में कुछ नहीं मिला';

  @override
  String get parkingBeeps => 'नज़दीकी बीप';

  @override
  String get parkingVolume => 'बीप वॉल्यूम';

  @override
  String get parkingLimitations =>
      'एक कैमरा, 360° नहीं। कैमरे के दायरे से बाहर के ऑब्जेक्ट नहीं पहचाने जाते। यह पार्किंग सेंसर का विकल्प नहीं है; अनुमान गलत हो सकते हैं और चुप्पी का मतलब यह नहीं कि जगह खाली है।';

  @override
  String parkingTopDownLabel(String summary) {
    return 'ऊपर से नज़दीकी व्यू। $summary';
  }

  @override
  String get perceptionModeOriginal => 'ओरिजिनल';

  @override
  String get perceptionModeBoxes => 'बॉक्स';

  @override
  String get perceptionModeMasks => 'ऑब्जेक्ट मास्क';

  @override
  String get perceptionModeRoad => 'सड़क की सतह';

  @override
  String get perceptionModeCombined => 'संयुक्त';

  @override
  String get perceptionOpacity => 'मास्क की पारदर्शिता';

  @override
  String get perceptionDisclaimer =>
      'सड़क की सतह का मास्क एक अनुमानित विज़ुअल परत है। यह चलने योग्य जगह या लेन नहीं दिखाता।';

  @override
  String get perceptionNeedsModel =>
      'मास्क देखने के लिए सेगमेंटेशन मॉडल चुनें।';

  @override
  String get perceptionChooseModel => 'मॉडल चुनें';

  @override
  String get perceptionWaiting => 'पहले सेगमेंटेशन फ़्रेम का इंतज़ार है…';

  @override
  String get perceptionShortCamera => 'कैमरा';

  @override
  String get perceptionShortBoxes => 'बॉक्स';

  @override
  String get perceptionShortObjects => 'ऑब्जेक्ट';

  @override
  String get perceptionShortRoad => 'सड़क';

  @override
  String get perceptionShortAll => 'सभी';

  @override
  String get perceptionModesLabel => 'परसेप्शन लेयर';

  @override
  String get perceptionStatusWarmingUp => 'तैयार हो रहा है…';

  @override
  String get perceptionStatusLoadingModel => 'मॉडल लोड हो रहा है…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'मास्क रुके हैं';

  @override
  String get perceptionLegend => 'मास्क संकेत-सूची';

  @override
  String get perceptionUnavailable => 'मास्क उपलब्ध नहीं';

  @override
  String get driveSave => 'सहेजें';

  @override
  String get driveSaveIncident => 'घटना सहेजें';

  @override
  String driveSaveHint(int seconds) {
    return 'डैशकैम की आखिरी $seconds सेकंड की फ़ुटेज सहेजता है';
  }

  @override
  String get driveSaving => 'घटना सहेजी जा रही है…';

  @override
  String hudRecManualLabel(String time) {
    return 'रिकॉर्डिंग जारी, $time';
  }

  @override
  String get driveRecord => 'रिकॉर्ड';

  @override
  String get driveRecordStartA11y => 'रिकॉर्डिंग शुरू करें';

  @override
  String driveRecordStopA11y(String time) {
    return 'रिकॉर्डिंग रोकें, $time रिकॉर्ड हुई';
  }

  @override
  String get driveRecordHint =>
      'आपके रोकने तक लगातार रिकॉर्ड करता है, पिछले 5 सेकंड सहित';

  @override
  String get driveRecordFailed => 'रिकॉर्डिंग शुरू नहीं हो सकी';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'रिकॉर्डिंग सहेजी गई · $count भाग',
      one: 'रिकॉर्डिंग सहेजी गई',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'रिकॉर्डिंग रुकी: जगह लगभग भर चुकी है',
      'max_duration': 'रिकॉर्डिंग रुकी: अधिकतम अवधि पूरी हो गई',
      'camera_stopped': 'कैमरे के साथ रिकॉर्डिंग रुक गई',
      'background': 'रिकॉर्डिंग रुकी: ऐप बैकग्राउंड में चला गया',
      'thermal': 'रिकॉर्डिंग रुकी: फ़ोन बहुत गर्म है',
      'other': 'रिकॉर्डिंग रुकी',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'घटना सहेजी गई · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'देखें';

  @override
  String get driveSaveFailed => 'घटना सहेजी नहीं जा सकी।';

  @override
  String get driveSaveNotRunning =>
      'रिकॉर्डिंग अभी शुरू नहीं हुई है — कैमरा शुरू होने तक रुकें, फिर कोशिश करें।';

  @override
  String get driveSaveTestFootage =>
      'टेस्ट फ़ुटेज रिकॉर्ड नहीं की जाती। इंसिडेंट सेव करना लाइव कैमरे के साथ काम करता है।';

  @override
  String get driveSaveStorageFull =>
      'आपके iPhone का स्टोरेज भर गया है। जगह खाली करें या पुरानी क्लिप हटाएँ।';

  @override
  String get driveSaveIoError => 'क्लिप स्टोरेज में लिखी नहीं जा सकी।';

  @override
  String get driveClips => 'क्लिप';

  @override
  String get driveSettings => 'सेटिंग्स';

  @override
  String get driveViewSwitcher => 'ड्राइव व्यू';

  @override
  String get driveLocationDenied =>
      'लोकेशन बंद है — गति, मैप और रूट उपलब्ध नहीं हैं।';

  @override
  String get driveCameraDenied =>
      'कैमरे की अनुमति बंद है — डिटेक्शन और रिकॉर्डिंग उपलब्ध नहीं हैं।';

  @override
  String get driveRecorderFallback =>
      'बिना ऑडियो के रिकॉर्डिंग: माइक्रोफ़ोन की अनुमति बंद है।';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'रिकॉर्डिंग सेटिंग्स बदली गईं: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'आपका iPhone गर्म है। ठंडा होने के लिए AI धीमा चल रहा है — उसे सीधी धूप से दूर और वेंट के पास रखें।';

  @override
  String get drivePowerThermalCritical =>
      'आपका iPhone बहुत ज़्यादा गर्म है। ठंडा होने तक AI डिटेक्शन रुका है; संभव हो तो रिकॉर्डिंग जारी रहती है।';

  @override
  String get drivePowerLowPower =>
      'लो पावर मोड चालू है — AI कम गति से चल रहा है।';

  @override
  String get drivePowerBatteryLow =>
      'बैटरी कम है — ड्राइव के दौरान अपने iPhone को पावर से जोड़ें।';

  @override
  String get onboardingTitle1 => 'हर सफ़र में और बहुत कुछ देखें।';

  @override
  String get onboardingBody1 =>
      'अपने iPhone को एक समझदार डैशकैम और ड्राइविंग-सजगता साथी बनाएँ।';

  @override
  String get onboardingTitle2 => 'हर फ़्रेम में समझ।';

  @override
  String get onboardingBody2 =>
      'समर्थित वाहन, लोग, साइकिल और सड़क के संकेत सीधे अपने iPhone पर पहचानें।';

  @override
  String get onboardingTitle3 => 'एक सड़क। कई नज़रिए।';

  @override
  String get onboardingBody3 =>
      'लाइव डिटेक्शन, वर्चुअल ड्राइविंग व्यू, इंटरैक्टिव मैप और पार्किंग विज़ुअलाइज़ेशन के बीच बदलें।';

  @override
  String get onboardingTitle4 => 'ज़रूरी पलों को सहेजें।';

  @override
  String get onboardingBody4 =>
      'हाल की डैशकैम फ़ुटेज सहेजें, घटनाएँ देखें और रिकॉर्डिंग शेयर करें।';

  @override
  String get onboardingTitle5 => 'सुरक्षा और गोपनीयता';

  @override
  String get onboardingSafety1 =>
      'Corvista ड्राइविंग में सजगता बढ़ाने वाला सहायक है। नज़र सड़क पर रखें।';

  @override
  String get onboardingSafety2 =>
      'यह आपके वाहन को नियंत्रित नहीं करता और आपके विवेक की जगह नहीं लेता।';

  @override
  String get onboardingSafety3 =>
      'डिटेक्शन और अनुमान गलत हो सकते हैं या छूट सकते हैं।';

  @override
  String get onboardingSafety4 =>
      'कैमरे की प्रोसेसिंग आपके iPhone पर होती है — वीडियो अपलोड नहीं होता।';

  @override
  String get onboardingSafety5 =>
      'मैप, खोज, रूट और मौसम के लिए इंटरनेट कनेक्शन चाहिए।';

  @override
  String get onboardingSafety6 =>
      'अपने iPhone को मज़बूती से लगाएँ ताकि वह आपकी नज़र न रोके।';

  @override
  String get onboardingSafety7 => 'ड्राइव शुरू करने से पहले सेटअप पूरा करें।';

  @override
  String get onboardingAcknowledge =>
      'मैं समझता/समझती हूँ कि Corvista सजगता बढ़ाने वाला सहायक है और सुरक्षित ड्राइविंग की ज़िम्मेदारी मेरी ही रहती है।';

  @override
  String get onboardingReadSafety => 'पूरी सुरक्षा जानकारी पढ़ें';

  @override
  String get onboardingNext => 'आगे';

  @override
  String get onboardingSkip => 'छोड़ें';

  @override
  String get onboardingAgree => 'जारी रखें';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'पृष्ठ $current / $total';
  }

  @override
  String get permTitle => 'अनुमतियाँ';

  @override
  String get permIntro =>
      'Corvista केवल वही माँगता है जो हर सुविधा के लिए ज़रूरी है। आप इन्हें कभी भी सेटिंग्स में बदल सकते हैं।';

  @override
  String get permCameraTitle => 'कैमरा';

  @override
  String get permCameraBody =>
      'डिटेक्शन, डैशकैम रिकॉर्डिंग और पार्किंग व्यू के लिए ज़रूरी। वीडियो आपके iPhone पर प्रोसेस होता है।';

  @override
  String get permLocationTitle => 'लोकेशन';

  @override
  String get permLocationBody =>
      'GPS गति, मैप, रूट, मौसम और सहेजी क्लिप को टैग करने के लिए। केवल ऐप इस्तेमाल करते समय।';

  @override
  String get permMicTitle => 'माइक्रोफ़ोन';

  @override
  String get permSpeechNote =>
      'स्पीच रिकग्निशन की अनुमति केवल तब माँगी जाती है जब आप आपातकालीन अलर्ट के लिए आवाज़ से रद्द करना चालू करें।';

  @override
  String get permRequired => 'ज़रूरी';

  @override
  String get permOptional => 'वैकल्पिक';

  @override
  String get permAllow => 'अनुमति दें';

  @override
  String get permGranted => 'अनुमति मिली';

  @override
  String get permDenied => 'अस्वीकृत';

  @override
  String get permLimited => 'सीमित';

  @override
  String get permRestricted => 'प्रतिबंधित';

  @override
  String get permStart => 'ड्राइविंग शुरू करें';

  @override
  String get permCameraNeeded =>
      'आप कैमरे की अनुमति के बिना जारी रख सकते हैं, पर जब तक आप सेटिंग्स में अनुमति नहीं देते, डिटेक्शन और रिकॉर्डिंग काम नहीं करेंगे।';

  @override
  String get permSetupIntro =>
      'Corvista को पूरी तरह काम करने के लिए इनकी ज़रूरत है। सभी की अनुमति दें पर टैप करें और iOS एक-एक करके हर अनुमति माँगेगा। इन्हें आप कभी भी सेटिंग्स में बदल सकते हैं।';

  @override
  String get permCameraLine =>
      'डिटेक्शन, डैशकैम रिकॉर्डिंग और पार्किंग व्यू के लिए ज़रूरी। वीडियो आपके iPhone पर ही प्रोसेस होता है, कभी अपलोड नहीं होता।';

  @override
  String get permLocationLine =>
      'GPS स्पीड, मैप, रूट, मौसम और क्लिप कहाँ सहेजी गईं। केवल ऐप इस्तेमाल करते समय।';

  @override
  String get permMicLine =>
      'घटना की क्लिप में केबिन का ऑडियो, और आपातकालीन अलर्ट के दौरान आपका रद्द करने का वाक्यांश सुनने के लिए।';

  @override
  String get permSpeechTitle => 'स्पीच रिकग्निशन';

  @override
  String get permSpeechLine =>
      'आपातकालीन काउंटडाउन के दौरान आपका रद्द करने का वाक्यांश पहचानता है, जहाँ समर्थित हो वहाँ आपके iPhone पर ही।';

  @override
  String get permAllowAll => 'सभी की अनुमति दें';

  @override
  String permAsking(String permission) {
    return '$permission की अनुमति माँगी जा रही है…';
  }

  @override
  String get permSomeDenied =>
      'कुछ अनुमतियाँ बंद हैं। उन सुविधाओं के लिए उन्हें सेटिंग्स में चालू करें।';

  @override
  String get permNotNow => 'अभी नहीं';

  @override
  String get tourLabel => 'ड्राइव स्क्रीन टूर';

  @override
  String tourProgress(int current, int total) {
    return 'चरण $current / $total';
  }

  @override
  String get tourNext => 'आगे';

  @override
  String get tourBack => 'वापस';

  @override
  String get tourSkip => 'टूर छोड़ें';

  @override
  String get tourFinish => 'ड्राइविंग शुरू करें';

  @override
  String get tourWelcomeTitle => 'आपका त्वरित टूर';

  @override
  String get tourWelcomeBody =>
      'ड्राइव स्क्रीन की ज़रूरी बातों पर एक मिनट की नज़र। बेहतर होगा कि यह गाड़ी खड़ी करके देखें।';

  @override
  String get tourHudTitle => 'आपकी इंस्ट्रूमेंट पट्टी';

  @override
  String get tourHudSpeed => 'स्पीड GPS से आती है।';

  @override
  String get tourHudRec =>
      'REC दिखाता है कि फ़ुटेज के कितने सेकंड बफ़र में हैं।';

  @override
  String get tourHudAi =>
      'AI चिप मॉडल, दिख रहे ऑब्जेक्ट की संख्या और एक बिंदु दिखाती है: हरा यानी चल रहा है, एम्बर यानी सीमित, लाल यानी बंद।';

  @override
  String get tourSaveTitle => 'घटना सहेजें';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista वीडियो के पिछले $seconds सेकंड का रोलिंग बफ़र रखता है। यह लगातार ओवरराइट होता रहता है, इसलिए जब तक आप सहेजें पर टैप नहीं करते, कुछ भी नहीं रखा जाता। सहेजी गई क्लिप इसी iPhone में, क्लिप में रहती हैं।';
  }

  @override
  String get tourRecordTitle => 'पूरी ड्राइव रिकॉर्ड करें';

  @override
  String get tourRecordBody =>
      'जब तक आप रोकें नहीं, लगातार फ़िल्माने के लिए रिकॉर्ड पर टैप करें। लंबी ड्राइव क्लिप में 5-मिनट के भागों में सहेजी जाती हैं, और रिकॉर्डिंग के दौरान भी “घटना सहेजें” काम करता रहता है।';

  @override
  String get tourViewsTitle => 'सड़क देखने के पाँच तरीके';

  @override
  String get tourViewDetection =>
      'लाइव कैमरा, समर्थित ऑब्जेक्ट के चारों ओर बॉक्स के साथ।';

  @override
  String get tourViewVirtual => 'डिटेक्शन से बना एक सरल 3D दृश्य।';

  @override
  String get tourViewMap => 'Apple Maps, खोज और टर्न-बाई-टर्न गाइडेंस के साथ।';

  @override
  String get tourViewParking => 'कैमरा और ऊपर से दिखने वाला नज़दीकी व्यू।';

  @override
  String get tourViewPerception => 'सड़क और ऑब्जेक्ट मास्क।';

  @override
  String get tourMapTitle => 'खोज और टर्न-बाई-टर्न';

  @override
  String get tourMapBody =>
      'मैप खोलें, सर्च बार पर टैप करें और गंतव्य चुनें। कोई रूट चुनें, फिर टर्न-बाई-टर्न गाइडेंस के लिए शुरू करें पर टैप करें। इंटरनेट कनेक्शन ज़रूरी है।';

  @override
  String get tourClipsTitle => 'क्लिप';

  @override
  String get tourClipsBody =>
      'सहेजी गई घटनाओं को देखें, उनका नाम बदलें, शेयर करें या हटाएँ। जब तक आप शेयर नहीं करते, क्लिप आपके iPhone पर ही रहती हैं।';

  @override
  String get tourSettingsTitle => 'सेटिंग्स';

  @override
  String get tourSettingsBody =>
      'वॉइस अलर्ट और उनकी संवेदनशीलता, रिकॉर्डिंग गुणवत्ता और बफ़र की लंबाई ट्यून करें, और आपातकालीन मोड सेट करें: रद्द करने के काउंटडाउन के साथ एक प्रायोगिक टक्कर अलर्ट।';

  @override
  String get tourSafetyTitle => 'गाड़ी चलाने से पहले';

  @override
  String get tourSafety1 =>
      'अपने iPhone को मज़बूती से ऐसी जगह लगाएँ जहाँ वह आपके सामने का दृश्य न रोके।';

  @override
  String get tourSafety2 =>
      'गाड़ी चलाते समय ऐप से इंटरैक्ट न करें। सब कुछ गाड़ी खड़ी करके सेट करें।';

  @override
  String get tourSafety3 =>
      'डिटेक्शन और ज़ोन अनुमान हैं। वे गलत हो सकते हैं या छूट सकते हैं।';

  @override
  String get tourSafety4 =>
      'सुरक्षित ड्राइविंग की ज़िम्मेदारी आपकी ही रहती है।';

  @override
  String get helpTakeTour => 'टूर देखें';

  @override
  String get helpTakeTourSub => 'ड्राइव स्क्रीन पर एक मिनट का गाइडेड टूर।';

  @override
  String get tripsTitle => 'यात्राएँ';

  @override
  String get tripsOpen => 'यात्रा लॉग';

  @override
  String get tripsEmptyTitle => 'अभी तक कोई यात्रा नहीं';

  @override
  String get tripsEmptyBody =>
      'Corvista के साथ गाड़ी चलाते समय यात्राएँ अपने-आप रिकॉर्ड होती हैं: दूरी, समय, स्पीड और आपका लिया हुआ रूट।';

  @override
  String get tripsDisabledBody =>
      'यात्रा लॉग बंद है, इसलिए नई यात्राएँ रिकॉर्ड नहीं होंगी। इस iPhone पर अपने रूट का निजी लॉग रखने के लिए इसे चालू करें।';

  @override
  String get tripsEnable => 'यात्रा लॉग चालू करें';

  @override
  String get tripsToday => 'आज';

  @override
  String get tripsYesterday => 'कल';

  @override
  String tripsRecordingNow(String distance) {
    return 'यात्रा रिकॉर्ड हो रही है · $distance';
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
      other: '$count घटनाएँ',
      one: '1 घटना',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count अलर्ट',
      one: '1 अलर्ट',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count यात्राएँ',
      one: '1 यात्रा',
      zero: 'कोई यात्रा नहीं',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'दूरी';

  @override
  String get tripsStatDuration => 'अवधि';

  @override
  String get tripsStatMoving => 'चलने का समय';

  @override
  String get tripsStatAvgSpeed => 'औसत स्पीड';

  @override
  String get tripsStatMaxSpeed => 'अधिकतम स्पीड';

  @override
  String get tripsDetections => 'डिटेक्शन';

  @override
  String get tripsNoDetections =>
      'इस यात्रा में सड़क का कोई ऑब्जेक्ट दर्ज नहीं हुआ।';

  @override
  String get tripsTimeline => 'टाइमलाइन';

  @override
  String get tripsEventStart => 'यात्रा शुरू हुई';

  @override
  String get tripsEventEnd => 'यात्रा समाप्त हुई';

  @override
  String get tripsEventAlert => 'वॉइस अलर्ट';

  @override
  String get tripsEventIncident => 'घटना की क्लिप सहेजी गई';

  @override
  String get tripsEventEmergency => 'संभावित टक्कर का पता चला';

  @override
  String get tripsEventNavStart => 'नेविगेशन शुरू हुआ';

  @override
  String get tripsEventArrive => 'गंतव्य पर पहुँच गए';

  @override
  String get tripsEventReroute => 'रूट दोबारा बनाया गया';

  @override
  String get tripsEventRecording => 'रिकॉर्डिंग सहेजी गई';

  @override
  String get tripsOpenClip => 'क्लिप खोलें';

  @override
  String get tripsTrackPreview => 'GPS ट्रैक';

  @override
  String get tripsRenameTitle => 'यात्रा का नाम बदलें';

  @override
  String get tripsRenameHint => 'यात्रा का नाम';

  @override
  String get tripsFavorite => 'पसंदीदा में जोड़ें';

  @override
  String get tripsUnfavorite => 'पसंदीदा से हटाएँ';

  @override
  String get tripsShareGpx => 'GPX शेयर करें';

  @override
  String get tripsShareFailed => 'यह यात्रा शेयर नहीं की जा सकी।';

  @override
  String get tripsDelete => 'यात्रा हटाएँ';

  @override
  String get tripsDeleteConfirmTitle => 'यह यात्रा हटाएँ?';

  @override
  String get tripsDeleteConfirmBody =>
      'रूट और आँकड़े इस iPhone से हटा दिए जाएँगे। इस यात्रा की घटना क्लिप रखी जाएँगी।';

  @override
  String get tripsDeleted => 'यात्रा हटाई गई';

  @override
  String get tripsNotFound => 'यह यात्रा अब उपलब्ध नहीं है।';

  @override
  String get tripsPrivacyNote =>
      'केवल इसी iPhone पर संग्रहीत। कुछ भी अपलोड नहीं होता।';

  @override
  String get settingsSectionTrips => 'यात्रा लॉग';

  @override
  String get settingsTripLog => 'यात्राएँ रिकॉर्ड करें';

  @override
  String get settingsTripLogSubtitle =>
      'आपका रूट और ड्राइव के आँकड़े केवल इसी iPhone पर रखता है।';

  @override
  String get settingsTripRetention => 'यात्राएँ रखें';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिन',
      one: '1 दिन',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 वर्ष';

  @override
  String get settingsRetentionForever => 'हमेशा';

  @override
  String get settingsTripRetentionFooter =>
      'Corvista शुरू होने पर पुरानी यात्राएँ अपने-आप हटा दी जाती हैं।';

  @override
  String get settingsViewTrips => 'यात्राएँ देखें';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours घं $minutes मि';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes मि';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista यात्रा $date';
  }

  @override
  String get settingsFreeUpSpace => 'जगह खाली करें';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'अस्थायी फ़ाइलें और कैश हटाता है। सहेजी गई क्लिप और यात्राएँ रखी जाती हैं।';

  @override
  String settingsFreedBytes(String size) {
    return '$size खाली हुआ';
  }

  @override
  String get settingsNothingToFree =>
      'कैश साफ़ हो गया — हटाने के लिए कोई अस्थायी फ़ाइल नहीं।';

  @override
  String get settingsSectionPrivacyData => 'गोपनीयता और डेटा';

  @override
  String get settingsPrivacyDataFooter =>
      'क्लिप, यात्राएँ और सेटिंग्स केवल इसी iPhone में रहती हैं। वे तभी बाहर जाती हैं जब आप उन्हें साझा करना चुनते हैं।';

  @override
  String get settingsDeleteAllData => 'सारा डेटा हटाएँ';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'इस iPhone से क्लिप, यात्राएँ, संपर्क और सेटिंग्स मिटाएँ';

  @override
  String get deleteAllTitle => 'सारा डेटा हटाएँ?';

  @override
  String get deleteAllMessage =>
      'यह इस iPhone से स्थायी रूप से हटा देगा:\n• घटना की क्लिप और थंबनेल\n• यात्रा लॉग और GPS ट्रैक\n• आपातकालीन संपर्क और आपातकालीन घटनाएँ\n• डिटेक्शन लॉग और डायग्नोस्टिक लॉग\n• सेटिंग्स और हाल के गंतव्य\n• अस्थायी रिकॉर्डिंग बफ़र और कैश\n\nइसे पूर्ववत नहीं किया जा सकता। इसके बाद Corvista स्वागत स्क्रीन से फिर शुरू होगा।';

  @override
  String get deleteAllConfirm => 'सब कुछ हटाएँ';

  @override
  String get deleteAllInProgress => 'हटाया जा रहा है…';

  @override
  String get deleteAllDone => 'सारा डेटा हटा दिया गया';

  @override
  String get deleteAllPartial =>
      'कुछ आइटम हटाए नहीं जा सके। सेटिंग्स से फिर कोशिश करें।';

  @override
  String get diagLogSection => 'डायग्नोस्टिक लॉग';

  @override
  String get diagLogFooter =>
      'त्रुटियाँ केवल इसी iPhone पर दर्ज होती हैं, बिना स्थान, संपर्कों के नाम या फ़ोन नंबर के। जब तक आप स्वयं लॉग साझा न करें, कुछ नहीं भेजा जाता।';

  @override
  String get diagLogShare => 'डायग्नोस्टिक लॉग साझा करें';

  @override
  String get diagLogEmpty => 'खाली';

  @override
  String get diagLogClear => 'लॉग साफ़ करें';

  @override
  String get diagLogClearTitle => 'डायग्नोस्टिक लॉग साफ़ करें?';

  @override
  String get diagLogClearBody =>
      'सहेजी गई त्रुटि प्रविष्टियाँ इस iPhone से हटा दी जाएँगी।';

  @override
  String get diagLogCleared => 'डायग्नोस्टिक लॉग साफ़ किया गया';

  @override
  String get diagLogShareFailed => 'डायग्नोस्टिक लॉग साझा नहीं किया जा सका।';

  @override
  String get privacyControls2 =>
      'सेटिंग्स › गोपनीयता और डेटा › सारा डेटा हटाएँ, Corvista द्वारा इस iPhone पर सहेजी गई हर क्लिप, यात्रा, संपर्क, लॉग और सेटिंग मिटा देता है।';

  @override
  String get parkingZoneStop => 'रुकें';

  @override
  String get parkingZoneVeryClose => 'बहुत पास';

  @override
  String get parkingZoneClose => 'पास';

  @override
  String get parkingZoneNothingClose => 'पास में कुछ नहीं दिखा';

  @override
  String get parkingNotDetected =>
      'दीवारें, खंभे, पोल और कर्ब पहचाने नहीं जाते';

  @override
  String get parkingApprox => 'लगभग';

  @override
  String get parkingSideLeft => 'बाएँ';

  @override
  String get parkingSideCenter => 'बीच में';

  @override
  String get parkingSideRight => 'दाएँ';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'केवल आगे के कैमरे का दृश्य — 360° सिस्टम नहीं';

  @override
  String get parkingMuteBeeps => 'बीप म्यूट करें';

  @override
  String get parkingUnmuteBeeps => 'बीप चालू करें';

  @override
  String get parkingAbout => 'पार्किंग व्यू के बारे में';

  @override
  String get parkingLimitationsDetail =>
      'केवल कैमरे के सामने का क्षेत्र देखा जाता है। डिटेक्टर कार, बस और ट्रक, लोगों, साइकिलों और मोटरसाइकिलों को पहचानता है। दीवारें, खंभे, पोल, कर्ब, बोलार्ड, बैरियर और नीची बाधाएँ पहचानी नहीं जातीं, और बोनट ठीक आगे की ज़मीन को ढक सकता है। दूरियाँ एक कैमरे से (वस्तु के आकार और स्थिति के आधार पर) लगाए गए मोटे अनुमान हैं और काफ़ी गलत हो सकते हैं। शांति या “पास में कुछ नहीं दिखा” का मतलब यह नहीं कि रास्ता साफ़ है — हमेशा चारों ओर देखें और अपने शीशों का उपयोग करें।';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'तरफ़ के अनुसार नज़दीकी: बाएँ $left, बीच में $center, दाएँ $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'त्रुटियाँ इस iPhone पर एक निजी लॉग में लिखी जाती हैं (स्थान, संपर्कों के नाम या फ़ोन नंबर के बिना)। यह कभी अपने आप नहीं भेजा जाता; आप इसे सेटिंग्स › डायग्नोस्टिक्स में साझा या साफ़ कर सकते हैं।';
}
