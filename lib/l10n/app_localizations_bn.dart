// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'প্রতিটি যাত্রায় আরও বেশি দেখুন।';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get commonDelete => 'মুছুন';

  @override
  String get commonSave => 'সংরক্ষণ';

  @override
  String get commonBack => 'পিছনে';

  @override
  String get commonClose => 'বন্ধ করুন';

  @override
  String get commonRetry => 'আবার চেষ্টা করুন';

  @override
  String get commonOpenSettings => 'সেটিংস খুলুন';

  @override
  String get commonLoading => 'লোড হচ্ছে…';

  @override
  String get commonError => 'কিছু ভুল হয়েছে।';

  @override
  String commonErrorDetail(String message) {
    return 'কিছু ভুল হয়েছে: $message';
  }

  @override
  String get commonOn => 'চালু';

  @override
  String get commonOff => 'বন্ধ';

  @override
  String get commonRename => 'নাম পরিবর্তন';

  @override
  String get commonShare => 'শেয়ার';

  @override
  String get commonNotAvailable => 'উপলব্ধ নয়';

  @override
  String get commonTestFootage => 'টেস্ট ফুটেজ';

  @override
  String get zoneVeryClose => 'খুব কাছে';

  @override
  String get zoneClose => 'কাছে';

  @override
  String get zoneMedium => 'মাঝারি';

  @override
  String get zoneFar => 'দূরে';

  @override
  String get zoneUnknown => 'অজানা';

  @override
  String get classPerson => 'ব্যক্তি';

  @override
  String get classBicycle => 'সাইকেল';

  @override
  String get classMotorcycle => 'মোটরসাইকেল';

  @override
  String get classCar => 'যানবাহন';

  @override
  String get classBus => 'বাস';

  @override
  String get classTrafficLight => 'ট্রাফিক লাইট';

  @override
  String get classStopSign => 'স্টপ সাইন';

  @override
  String get viewDetection => 'শনাক্তকরণ';

  @override
  String get viewVirtual => 'ভার্চুয়াল';

  @override
  String get viewMap => 'মানচিত্র';

  @override
  String get viewParking => 'পার্কিং';

  @override
  String get viewPerception => 'পারসেপশন';

  @override
  String get unitKmh => 'কিমি/ঘণ্টা';

  @override
  String get unitMph => 'মাইল/ঘণ্টা';

  @override
  String get lightRed => 'লাল';

  @override
  String get lightYellow => 'হলুদ';

  @override
  String get lightGreen => 'সবুজ';

  @override
  String get lightUnknown => 'অজানা';

  @override
  String get clipsTitle => 'ক্লিপ';

  @override
  String get clipsSelect => 'নির্বাচন';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি নির্বাচিত',
      zero: 'ক্লিপ নির্বাচন করুন',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'সব নির্বাচন করুন';

  @override
  String get clipsDeselectAll => 'সব নির্বাচন বাতিল করুন';

  @override
  String get clipsDeleteSelected => 'নির্বাচিত মুছুন';

  @override
  String get clipsGridView => 'গ্রিড ভিউ';

  @override
  String get clipsListView => 'তালিকা ভিউ';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্লিপ মুছবেন?',
      one: 'এই ক্লিপটি মুছবেন?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ভিডিওগুলো আপনার iPhone থেকে স্থায়ীভাবে মুছে যাবে। এটি আর ফেরানো যাবে না।',
      one: 'ভিডিওটি আপনার iPhone থেকে স্থায়ীভাবে মুছে যাবে। এটি আর ফেরানো যাবে না।',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্লিপ মোছা হয়েছে',
      one: 'ক্লিপ মোছা হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'এখনও কোনো ক্লিপ নেই';

  @override
  String get clipsEmptyBody =>
      'গাড়ি চালানোর সময় Corvista একটি ছোট রোলিং বাফার ধরে রাখে। শেষ কয়েক সেকেন্ডের ফুটেজ এখানে রাখতে ঘটনা সংরক্ষণ-এ ট্যাপ করুন।';

  @override
  String get clipsLoadError => 'আপনার ক্লিপ লোড করা যায়নি।';

  @override
  String get clipsStorageTitle => 'স্টোরেজ';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'ক্লিপ $clips · বাফার $buffer · ফাঁকা $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি সংরক্ষিত ক্লিপ',
      zero: 'কোনো সংরক্ষিত ক্লিপ নেই',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'আপনার iPhone-এ স্টোরেজ কম। নতুন ঘটনা সংরক্ষণ নাও হতে পারে।';

  @override
  String get clipsMissingFile => 'ফাইল নেই';

  @override
  String get clipsEmergencyBadge => 'সংঘর্ষ';

  @override
  String clipsUntitled(String date) {
    return 'ঘটনা · $date';
  }

  @override
  String get clipsAudio => 'অডিও রেকর্ড হয়েছে';

  @override
  String get clipsFavorite => 'প্রিয়';

  @override
  String get clipsUnfavorite => 'প্রিয় থেকে সরান';

  @override
  String get clipsLocation => 'লোকেশন সংরক্ষিত';

  @override
  String clipsOpenClip(String title) {
    return 'ক্লিপ $title খুলুন';
  }

  @override
  String get playerNotFoundTitle => 'ক্লিপ পাওয়া যায়নি';

  @override
  String get playerNotFoundBody => 'এই ক্লিপটি হয়তো মুছে ফেলা হয়েছে।';

  @override
  String get playerMissingTitle => 'ভিডিও ফাইল নেই';

  @override
  String get playerMissingBody =>
      'এই ক্লিপের রেকর্ডিং আর আপনার iPhone-এ নেই। আপনি গ্যালারি থেকে এন্ট্রিটি সরিয়ে দিতে পারেন।';

  @override
  String get playerRemoveEntry => 'এন্ট্রি সরান';

  @override
  String get playerLoadError => 'এই ভিডিওটি চালানো যাচ্ছে না।';

  @override
  String get playerPlay => 'চালান';

  @override
  String get playerPause => 'বিরতি';

  @override
  String get playerReplay => 'আবার চালান';

  @override
  String get playerRenameTitle => 'ক্লিপের নাম পরিবর্তন';

  @override
  String get playerRenameHint => 'ক্লিপের নাম';

  @override
  String get playerRenamed => 'ক্লিপের নাম পরিবর্তিত হয়েছে';

  @override
  String get playerFavorited => 'প্রিয়তে যোগ করা হয়েছে';

  @override
  String get playerUnfavorited => 'প্রিয় থেকে সরানো হয়েছে';

  @override
  String get playerShareFailed => 'এই ক্লিপটি শেয়ার করা যায়নি।';

  @override
  String get playerDetails => 'বিবরণ';

  @override
  String get playerDate => 'রেকর্ড করা হয়েছে';

  @override
  String get playerDuration => 'সময়কাল';

  @override
  String get playerResolution => 'রেজোলিউশন';

  @override
  String get playerSize => 'ফাইলের আকার';

  @override
  String get playerAudio => 'অডিও';

  @override
  String get playerAudioYes => 'রেকর্ড হয়েছে';

  @override
  String get playerAudioNo => 'রেকর্ড হয়নি';

  @override
  String get playerReason => 'সংরক্ষণের কারণ';

  @override
  String get playerReasonManual => 'ঘটনা সংরক্ষণ বোতাম';

  @override
  String get playerReasonEmergency => 'সম্ভাব্য সংঘর্ষ শনাক্তকরণ';

  @override
  String get playerReasonRecovered => 'বিঘ্নের পরে পুনরুদ্ধার করা হয়েছে';

  @override
  String get playerSpeed => 'সংরক্ষণের সময় GPS গতি';

  @override
  String get playerLocation => 'লোকেশন';

  @override
  String get playerOpenInMaps => 'মানচিত্রে খুলুন';

  @override
  String get playerBack => 'পিছনে';

  @override
  String get playerMore => 'আরও অ্যাকশন';

  @override
  String get clipsFilterLabel => 'দেখান';

  @override
  String get clipsFilterAll => 'সব';

  @override
  String get clipsFilterRecordings => 'রেকর্ডিং';

  @override
  String get clipsFilterIncidents => 'ঘটনা';

  @override
  String get clipsFilterEmergency => 'জরুরি';

  @override
  String get clipsFilterFavorites => 'প্রিয়';

  @override
  String get clipsSort => 'সাজান';

  @override
  String get clipsSortNewest => 'নতুন আগে';

  @override
  String get clipsSortOldest => 'পুরনো আগে';

  @override
  String get clipsSortLongest => 'দীর্ঘতম আগে';

  @override
  String get clipsSortLargest => 'বড় আগে';

  @override
  String get clipsToday => 'আজ';

  @override
  String get clipsYesterday => 'গতকাল';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্লিপ',
      one: '১টি ক্লিপ',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'এই বিভাগে এখনও কোনো ক্লিপ নেই।';

  @override
  String get clipsFavoritesEmpty =>
      'দ্রুত পেতে কোনো ক্লিপে তারা দিন, সেটি এখানে থাকবে।';

  @override
  String get clipsKindRecording => 'রেকর্ডিং';

  @override
  String get clipsKindIncident => 'ঘটনা';

  @override
  String get clipsKindEmergency => 'জরুরি';

  @override
  String get clipsKindTest => 'পরীক্ষা';

  @override
  String clipsTripChip(String time) {
    return 'ট্রিপ · $time';
  }

  @override
  String get clipsOpenTrip => 'যে ট্রিপে এই ক্লিপ রেকর্ড হয়েছে তা খুলুন';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used ব্যবহৃত · $free খালি';
  }

  @override
  String clipsStorageClips(String size) {
    return 'ক্লিপ নিয়েছে $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি রেকর্ডিং',
      one: '১টি রেকর্ডিং',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ঘটনা',
      one: '১টি ঘটনা',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি জরুরি',
      one: '১টি জরুরি',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'জায়গা খালি করুন';

  @override
  String get clipsStorageLowGentle =>
      '২ জিবির কম জায়গা খালি আছে। রেকর্ডিং সচল রাখতে জায়গা খালি করুন বা অপ্রয়োজনীয় ক্লিপ সরিয়ে ফেলুন।';

  @override
  String get clipsSaveToPhotos => 'ফটোতে সংরক্ষণ';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্লিপ',
      one: '১টি ক্লিপ',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্লিপ ($size) মুছবেন?',
      one: 'এই ক্লিপটি ($size) মুছবেন?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return '$totalটির মধ্যে $doneটি ফটোতে সংরক্ষণ হচ্ছে…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্লিপ ফটোতে সংরক্ষিত',
      one: 'ফটোতে সংরক্ষিত',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$savedটি ফটোতে সংরক্ষিত · $failedটি সংরক্ষণ করা যায়নি';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista-কে ফটোতে ভিডিও যোগ করার অনুমতি দেওয়া হয়নি। সেটিংসে অনুমতি দিতে পারেন।';

  @override
  String get clipsPhotosFailed => 'ফটোতে সংরক্ষণ করা যায়নি।';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্লিপ প্রিয়তে যোগ করা হয়েছে',
      one: 'প্রিয়তে যোগ করা হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্লিপ প্রিয় থেকে সরানো হয়েছে',
      one: 'প্রিয় থেকে সরানো হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (ছাঁটা)';
  }

  @override
  String get playerTrim => 'ছাঁটুন';

  @override
  String get playerInfo => 'তথ্য';

  @override
  String get playerKind => 'ধরন';

  @override
  String get playerReasonRecording => 'রেকর্ড বোতাম';

  @override
  String get trimTitle => 'ক্লিপ ছাঁটুন';

  @override
  String get trimHint =>
      'যে অংশ রাখতে চান তা বেছে নিতে হ্যান্ডেল টানুন। মূল ক্লিপ অপরিবর্তিত থাকবে।';

  @override
  String get trimStartHandle => 'ছাঁটার শুরু';

  @override
  String get trimEndHandle => 'ছাঁটার শেষ';

  @override
  String trimSelection(String duration) {
    return '$duration নির্বাচিত';
  }

  @override
  String get trimSave => 'নতুন ক্লিপ হিসেবে সংরক্ষণ';

  @override
  String get trimSaving => 'ছাঁটা ক্লিপ সংরক্ষণ হচ্ছে…';

  @override
  String get trimSaved => 'ছাঁটা ক্লিপ সংরক্ষিত';

  @override
  String get trimOpenNew => 'খুলুন';

  @override
  String get trimFailed => 'এই ক্লিপ ছাঁটা যায়নি।';

  @override
  String get trimStorageFull =>
      'ছাঁটা ক্লিপ সংরক্ষণের জন্য পর্যাপ্ত খালি জায়গা নেই।';

  @override
  String get trimPreview => 'নির্বাচিত অংশ চালান';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get settingsSectionCamera => 'ক্যামেরা';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'সতর্কতা';

  @override
  String get settingsSectionAlertCategories => 'সতর্কতার ধরন';

  @override
  String get settingsSectionRecording => 'রেকর্ডিং';

  @override
  String get settingsSectionDriving => 'ড্রাইভিং';

  @override
  String get settingsSectionPower => 'পাওয়ার';

  @override
  String get settingsSectionEmergency => 'জরুরি অবস্থা';

  @override
  String get settingsSectionAppearance => 'চেহারা';

  @override
  String get settingsSectionLanguage => 'ভাষা';

  @override
  String get settingsSectionInformation => 'তথ্য';

  @override
  String get settingsCameraLens => 'ক্যামেরা লেন্স';

  @override
  String get settingsLensWide => 'ওয়াইড';

  @override
  String get settingsLensUltraWide => 'আল্ট্রা ওয়াইড';

  @override
  String get settingsLensTelephoto => 'টেলিফটো';

  @override
  String get settingsLensUnavailable => 'এই iPhone-এ উপলব্ধ নয়';

  @override
  String get settingsStabilization => 'স্ট্যাবিলাইজেশন';

  @override
  String get settingsStabAuto => 'স্বয়ংক্রিয়';

  @override
  String get settingsStabOff => 'বন্ধ';

  @override
  String get settingsStabStandard => 'স্ট্যান্ডার্ড';

  @override
  String get settingsStabCinematic => 'সিনেমাটিক';

  @override
  String get settingsOverlayOpacity => 'ওভারলে স্বচ্ছতা';

  @override
  String get settingsShowFps => 'পারফরম্যান্স পরিসংখ্যান দেখান';

  @override
  String get settingsShowFpsSubtitle =>
      'শনাক্তকরণ ভিউতে ফ্রেম রেট ও ইনফারেন্স সময়';

  @override
  String get settingsCameraFooter =>
      'লেন্স ও স্ট্যাবিলাইজেশনের পরিবর্তন পরের বার ক্যামেরা চালু হলে কার্যকর হবে।';

  @override
  String get settingsAiModel => 'AI মডেল';

  @override
  String get settingsConfidence => 'শনাক্তকরণের নির্ভরযোগ্যতা';

  @override
  String get settingsTracking => 'অবজেক্ট ট্র্যাকিং';

  @override
  String get settingsTrackingSubtitle => 'ফ্রেমের মধ্যে অবজেক্ট স্থির রাখে';

  @override
  String get settingsShowLabels => 'লেবেল দেখান';

  @override
  String get settingsShowConfidence => 'নির্ভরযোগ্যতা দেখান';

  @override
  String get settingsSegmentationOpacity => 'পারসেপশন মাস্কের স্বচ্ছতা';

  @override
  String get settingsAiFooter =>
      'কম নির্ভরযোগ্যতায় বেশি অবজেক্ট দেখা যায়, তবে ভুল শনাক্তকরণও বাড়ে। শনাক্তকরণ ভুল হতে পারে।';

  @override
  String get settingsVoiceAlerts => 'ভয়েস সতর্কতা';

  @override
  String get settingsVoiceLanguage => 'ভয়েসের ভাষা';

  @override
  String get settingsVoiceLanguageAuto => 'অ্যাপের ভাষার সাথে মিলান';

  @override
  String get settingsVoice => 'ভয়েস';

  @override
  String get settingsVoiceDefault => 'সিস্টেম ডিফল্ট';

  @override
  String get settingsVoiceQualityEnhanced => 'উন্নত';

  @override
  String get settingsVoiceQualityPremium => 'উচ্চ মান';

  @override
  String get settingsNoVoices =>
      'এই ভাষার জন্য কোনো ভয়েস ইনস্টল করা নেই। iOS সেটিংস › অ্যাক্সেসিবিলিটি › Spoken Content-এ গিয়ে যোগ করুন।';

  @override
  String get settingsAlertPedestrian => 'পথচারী';

  @override
  String get settingsAlertCyclist => 'সাইকেল আরোহী';

  @override
  String get settingsAlertMotorcycle => 'মোটরসাইকেল';

  @override
  String get settingsAlertBus => 'বাস';

  @override
  String get settingsAlertVehicleClose => 'সামনে যানবাহন খুব কাছে';

  @override
  String get settingsAlertTrafficLight => 'ট্রাফিক লাইট বদলালে';

  @override
  String get settingsAlertTrafficMoving => 'সামনের ট্রাফিক চলতে শুরু করলে';

  @override
  String get settingsAlertStopSign => 'স্টপ সাইন';

  @override
  String get settingsSensitivity => 'সংবেদনশীলতা';

  @override
  String get settingsSensitivityLow => 'কম';

  @override
  String get settingsSensitivityMedium => 'মাঝারি';

  @override
  String get settingsSensitivityHigh => 'বেশি';

  @override
  String get settingsCooldown => 'পুনরাবৃত্তির ব্যবধান';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds সে.';
  }

  @override
  String get settingsVolume => 'ভয়েসের ভলিউম';

  @override
  String get settingsQuietMode => 'শান্ত মোড';

  @override
  String get settingsQuietModeSubtitle =>
      'শুধু সবচেয়ে গুরুত্বপূর্ণ সতর্কতা বলা হবে';

  @override
  String get settingsTestVoice => 'ভয়েস পরীক্ষা';

  @override
  String get settingsTestVoiceDone => 'নমুনা সতর্কতা চলছে…';

  @override
  String get settingsParkingBeeps => 'পার্কিং বিপ';

  @override
  String get settingsBeepVolume => 'বিপের ভলিউম';

  @override
  String get settingsAlertsFooter =>
      'সতর্কতা শুধু সহায়ক। সবসময় রাস্তার দিকে নজর রাখুন — নীরবতার অর্থ এই নয় যে পথ পরিষ্কার।';

  @override
  String get settingsRecordingProfile => 'রেকর্ডিংয়ের মান';

  @override
  String get settingsProfileStandard => 'স্ট্যান্ডার্ড · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'ঘটনা বাফার';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds সেকেন্ড';
  }

  @override
  String get settingsManualMaxLength =>
      'ম্যানুয়াল রেকর্ডিংয়ের সর্বোচ্চ দৈর্ঘ্য';

  @override
  String get settingsManualMaxUnlimited => 'সীমাহীন';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes মিনিট';
  }

  @override
  String get settingsRecordAudio => 'অডিও রেকর্ড করুন';

  @override
  String get settingsRecordAudioSubtitle =>
      'সংরক্ষিত ঘটনায় গাড়ির ভেতরের অডিও অন্তর্ভুক্ত করে';

  @override
  String get settingsMicDenied =>
      'মাইক্রোফোন অ্যাক্সেস বন্ধ আছে। অডিও রেকর্ড করতে সেটিংসে অনুমতি দিন।';

  @override
  String get settingsWatermark => 'Corvista ওয়াটারমার্ক';

  @override
  String get settingsTimestamp => 'তারিখ ও সময়ের স্ট্যাম্প';

  @override
  String get settingsSaveLocation => 'ক্লিপের সাথে লোকেশন সংরক্ষণ করুন';

  @override
  String get settingsStorage => 'স্টোরেজ ও ক্লিপ';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ক্লিপ',
      zero: 'কোনো ক্লিপ নেই',
    );
    return '$_temp0 · ব্যবহৃত $used · ফাঁকা $free';
  }

  @override
  String get settingsRecordingFooter =>
      'রোলিং বাফার আপনার iPhone-এই থাকে এবং ক্রমাগত ওভাররাইট হয়। ব্যাকগ্রাউন্ডে কিছুই রেকর্ড হয় না।';

  @override
  String get settingsDefaultView => 'ডিফল্ট ভিউ';

  @override
  String get settingsUnits => 'একক';

  @override
  String get settingsShowCompass => 'কম্পাস দেখান';

  @override
  String get settingsHudStyle => 'HUD স্টাইল';

  @override
  String get settingsHudCustomize => 'HUD কাস্টমাইজ করুন';

  @override
  String get settingsDrivingSide => 'ড্রাইভিংয়ের পাশ';

  @override
  String get settingsDrivingSideAuto => 'স্বয়ংক্রিয়';

  @override
  String get settingsDrivingSideRight => 'ডান';

  @override
  String get settingsDrivingSideLeft => 'বাম';

  @override
  String get settingsVirtualStyle => 'ভার্চুয়াল ভিউ স্টাইল';

  @override
  String get settingsVirtualMinimal => 'মিনিমাল';

  @override
  String get settingsVirtualPerspective => 'পারস্পেক্টিভ';

  @override
  String get settingsVirtualHighContrast => 'হাই কনট্রাস্ট';

  @override
  String get settingsKeepScreenOn => 'গাড়ি চালানোর সময় স্ক্রিন চালু রাখুন';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'লক স্ক্রিন ও Dynamic Island-এ টার্ন-বাই-টার্ন নির্দেশনা দেখান';

  @override
  String get driveRecordingPausedBackground =>
      'Corvista ব্যাকগ্রাউন্ডে থাকায় রেকর্ডিং বিরতিতে আছে';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'বিরতি';

  @override
  String get liveActivityDashcamOff => 'ক্যাম বন্ধ';

  @override
  String get liveActivityEnded => 'নেভিগেশন শেষ';

  @override
  String get liveActivityEta => 'পৌঁছানো';

  @override
  String get settingsAutoRecenter => 'মানচিত্র স্বয়ংক্রিয়ভাবে কেন্দ্রে আনুন';

  @override
  String get settingsHudStyleClassic => 'ক্লাসিক';

  @override
  String get settingsHudStyleGrid => 'গ্রিড';

  @override
  String get settingsHudStyleMinimal => 'মিনিমাল';

  @override
  String get settingsHudStylePerformance => 'পারফরম্যান্স';

  @override
  String get settingsHudStyleNavigation => 'নেভিগেশন';

  @override
  String get settingsHudStyleNight => 'রাত';

  @override
  String get settingsHudStyleHighContrast => 'হাই কনট্রাস্ট';

  @override
  String get settingsPowerMode => 'পাওয়ার মোড';

  @override
  String get settingsPowerBalanced => 'ভারসাম্যপূর্ণ';

  @override
  String get settingsPowerPerformance => 'পারফরম্যান্স';

  @override
  String get settingsPowerSaver => 'পাওয়ার সেভার';

  @override
  String get settingsPowerFooter =>
      'আপনার iPhone গরম হলে বা ব্যাটারি কম থাকলে Corvista স্বয়ংক্রিয়ভাবে AI-এর গতি ও ভিজ্যুয়াল ইফেক্ট কমিয়ে দেয়।';

  @override
  String get settingsThermal => 'তাপের অবস্থা';

  @override
  String get settingsThermalNominal => 'স্বাভাবিক';

  @override
  String get settingsThermalFair => 'উষ্ণ';

  @override
  String get settingsThermalSerious => 'গরম';

  @override
  String get settingsThermalCritical => 'সংকটজনক';

  @override
  String get settingsBattery => 'ব্যাটারি';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · চার্জ হচ্ছে';
  }

  @override
  String get settingsLowPowerMode => 'লো পাওয়ার মোড চালু — AI কম গতিতে চলছে।';

  @override
  String get settingsAiRate => 'বর্তমান AI গতি';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'সংঘর্ষ শনাক্তকরণ';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'চালু · $seconds সে. কাউন্টডাউন';
  }

  @override
  String get settingsEmergencyFooter =>
      'পরীক্ষামূলক। জরুরি পরিষেবার বিকল্প নয়।';

  @override
  String get settingsTheme => 'থিম';

  @override
  String get settingsThemeSystem => 'সিস্টেম';

  @override
  String get settingsThemeDark => 'ডার্ক';

  @override
  String get settingsThemeLight => 'লাইট';

  @override
  String get settingsReduceMotion => 'মোশন কমান';

  @override
  String get settingsReduceMotionSubtitle => 'পুরো অ্যাপে অ্যানিমেশন কমায়';

  @override
  String get settingsAppLanguage => 'অ্যাপের ভাষা';

  @override
  String get settingsPrivacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get settingsTerms => 'ব্যবহারের শর্তাবলী';

  @override
  String get settingsHelp => 'সহায়তা';

  @override
  String get settingsSupport => 'সাপোর্টের সাথে যোগাযোগ করুন';

  @override
  String get settingsLicenses => 'ওপেন-সোর্স লাইসেন্স';

  @override
  String get settingsSupportUnavailable =>
      'Mail খোলা যায়নি। support@corvista.app-এ লিখুন।';

  @override
  String get settingsSafety => 'নিরাপত্তা তথ্য';

  @override
  String get settingsDiagnostics => 'ডায়াগনস্টিক্স';

  @override
  String get settingsVersion => 'সংস্করণ';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'HUD কাস্টমাইজ করুন';

  @override
  String get hudCustomPreview => 'প্রিভিউ · নমুনা মান';

  @override
  String get hudCustomStyle => 'স্টাইল';

  @override
  String get hudCustomElements => 'উপাদান';

  @override
  String get hudCustomSpeed => 'গতি';

  @override
  String get hudCustomHeading => 'দিক ও কম্পাস';

  @override
  String get hudCustomClock => 'ঘড়ি';

  @override
  String get hudCustomBattery => 'ব্যাটারি ও তাপমাত্রা';

  @override
  String get hudCustomDetections => 'AI অবস্থা ও শনাক্তকরণ';

  @override
  String get hudCustomWeather => 'আবহাওয়া';

  @override
  String get hudCustomAppearance => 'আকার ও স্বচ্ছতা';

  @override
  String get hudCustomSize => 'আকার';

  @override
  String get hudCustomOpacity => 'স্বচ্ছতা';

  @override
  String get hudCustomFooter =>
      'অতিরিক্ত গরমের মতো সতর্কতা সবসময় দেখানো হয়, এমনকি উপাদান লুকানো থাকলেও।';

  @override
  String get hudCustomDescClassic => 'ভারসাম্যপূর্ণ ইনস্ট্রুমেন্ট ক্লাস্টার';

  @override
  String get hudCustomDescGrid => 'রাস্তার ওপর পারস্পেক্টিভ গ্রিড';

  @override
  String get hudCustomDescMinimal => 'শুধু গতি, আর কিছু নয়';

  @override
  String get hudCustomDescPerformance => 'লাইভ রিডআউটসহ গতির আর্ক';

  @override
  String get hudCustomDescNavigation => 'পরের বাঁক আগে';

  @override
  String get hudCustomDescNight => 'রাতে গাড়ি চালানোর জন্য ম্লান ও লালচে রং';

  @override
  String get hudCustomDescHighContrast => 'উজ্জ্বল রোদে সর্বোচ্চ স্পষ্টতা';

  @override
  String get languageTitle => 'ভাষা';

  @override
  String get languageSystem => 'সিস্টেম ডিফল্ট';

  @override
  String get languageSystemSubtitle => 'আপনার iPhone-এর ভাষা অনুসরণ করুন';

  @override
  String get languageFooter =>
      'আরও ভাষা আসছে। ভয়েস সতর্কতার ভাষা সতর্কতা বিভাগে আলাদাভাবে সেট করা যায়।';

  @override
  String get diagTitle => 'ডায়াগনস্টিক্স';

  @override
  String get diagPerformance => 'পারফরম্যান্স';

  @override
  String get diagInference => 'ইনফারেন্স সময়';

  @override
  String get diagDetectHz => 'শনাক্তকরণের হার';

  @override
  String get diagCameraFps => 'ক্যামেরা ফ্রেম রেট';

  @override
  String get diagMemory => 'মেমরি';

  @override
  String get diagDropped => 'বাদ পড়া ফ্রেম';

  @override
  String get diagSegmentation => 'সেগমেন্টেশন সময়';

  @override
  String get diagCamera => 'ক্যামেরা';

  @override
  String get diagStatus => 'অবস্থা';

  @override
  String get diagSource => 'উৎস';

  @override
  String get diagSourceCamera => 'লাইভ ক্যামেরা';

  @override
  String get diagSourceFile => 'টেস্ট ফুটেজ ফাইল';

  @override
  String get diagResolution => 'বাফারের আকার';

  @override
  String get diagLens => 'লেন্স';

  @override
  String get diagError => 'সর্বশেষ ত্রুটি';

  @override
  String get diagModel => 'AI মডেল';

  @override
  String get diagModelLoad => 'মডেল লোডের সময়';

  @override
  String get diagPower => 'পাওয়ার';

  @override
  String get diagSegHz => 'সেগমেন্টেশনের হার';

  @override
  String get diagReduced => 'কমানো ইফেক্ট';

  @override
  String diagMs(String value) {
    return '$value মি.সে.';
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
  String get diagCamIdle => 'নিষ্ক্রিয়';

  @override
  String get diagCamStarting => 'শুরু হচ্ছে';

  @override
  String get diagCamRunning => 'চলছে';

  @override
  String get diagCamInterrupted => 'বাধাপ্রাপ্ত';

  @override
  String get diagCamStopped => 'বন্ধ';

  @override
  String get diagCamUnavailable => 'অনুপলব্ধ';

  @override
  String get diagCamPermissionDenied => 'অনুমতি দেওয়া হয়নি';

  @override
  String get diagCamError => 'ত্রুটি';

  @override
  String get diagTestFootage => 'টেস্ট ফুটেজ';

  @override
  String get diagTestFootageBody =>
      'ক্যামেরার বদলে একটি লোকাল ভিডিও ফাইলে ডিভাইসেই প্রকৃত শনাক্তকরণ চালান। প্রতিটি ভিউ এটিকে টেস্ট ফুটেজ হিসেবে চিহ্নিত করে।';

  @override
  String get diagPathLabel => 'ভিডিও ফাইলের পাথ';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Documents/test_drive.mp4 ব্যবহার করুন';

  @override
  String get diagRun => 'টেস্ট ফুটেজ চালান';

  @override
  String get diagRunStarted =>
      'টেস্ট ফুটেজ শুরু হয়েছে। দেখতে ড্রাইভ ভিউ খুলুন।';

  @override
  String get diagBackToCamera => 'লাইভ ক্যামেরায় ফিরুন';

  @override
  String get diagDebugOnly =>
      'টেস্ট ফুটেজ শুধু ডেভেলপমেন্ট বিল্ডে পাওয়া যায়।';

  @override
  String get diagFileMissing => 'ওই পাথে কোনো ফাইল নেই।';

  @override
  String get emergencySetupTitle => 'সংঘর্ষ শনাক্তকরণ';

  @override
  String get emergencyExperimental => 'পরীক্ষামূলক';

  @override
  String get emergencyIntro =>
      'গাড়ি চালানোর সময় Corvista আপনার iPhone-এর মোশন সেন্সর ব্যবহার করে সম্ভাব্য গুরুতর সংঘর্ষের ওপর নজর রাখতে পারে। শনাক্ত হলে একটি কাউন্টডাউন শুরু হয়। আপনি বাতিল না করলে Corvista জরুরি পরিষেবায় কল করার এবং আপনার পরিচিতদের বার্তা পাঠানোর প্রস্তাব দেয়।';

  @override
  String get emergencyDisclaimer1 =>
      'জরুরি পরিষেবা বা আপনার গাড়ির নিজস্ব সংঘর্ষ শনাক্তকরণের বিকল্প নয়।';

  @override
  String get emergencyDisclaimer2 =>
      'কল করার বা বার্তা পাঠানোর আগে iOS সবসময় আপনার নিশ্চিতকরণ চায়।';

  @override
  String get emergencyDisclaimer3 =>
      'সংঘর্ষ শনাক্ত নাও হতে পারে, আবার জোরে ব্রেক বা ঝাঁকুনিকেও ভুলবশত সংঘর্ষ ধরা হতে পারে।';

  @override
  String get emergencyParkedWarning =>
      'গাড়ি দাঁড় করিয়ে এই সেটআপ সম্পন্ন করুন। গাড়ি চলাকালীন সেটিংস লক থাকে।';

  @override
  String get emergencyEnable => 'সংঘর্ষ শনাক্তকরণ চালু করুন';

  @override
  String get emergencyEnableSubtitle => 'শুধু ড্রাইভ সেশনের সময় সক্রিয়';

  @override
  String get emergencyNeedNumber => 'আগে একটি জরুরি নম্বর যোগ করুন।';

  @override
  String get emergencyContacts => 'জরুরি যোগাযোগ';

  @override
  String get emergencyAddContact => 'যোগাযোগ যোগ করুন';

  @override
  String get emergencyNoContacts =>
      'এখনও কোনো যোগাযোগ নেই। আপনি নিশ্চিত করার পরেই যোগাযোগকারীরা বার্তা পাবেন।';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '$name-কে সরাবেন?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'সংঘর্ষের পরে এঁকে প্রাপক হিসেবে প্রস্তাব করা হবে না।';

  @override
  String get emergencyRemove => 'সরান';

  @override
  String get emergencyContactsError => 'যোগাযোগ লোড করা যায়নি।';

  @override
  String get emergencyNumber => 'জরুরি নম্বর';

  @override
  String get emergencyNumberHint => 'যেমন 999 বা 112';

  @override
  String get emergencyMessage => 'বার্তার টেমপ্লেট';

  @override
  String get emergencyMessageDefault =>
      'আমি হয়তো একটি যানবাহন দুর্ঘটনায় পড়েছি। এই বার্তাটি Corvista প্রস্তুত করেছে এবং পাওয়া গেলে আমার সর্বশেষ জানা লোকেশন এতে রয়েছে।';

  @override
  String get emergencyMessageHint => 'ডিফল্ট বার্তা ব্যবহার করতে খালি রাখুন।';

  @override
  String get emergencyCountdown => 'কাউন্টডাউনের সময়';

  @override
  String get emergencyVoiceCancel => 'ভয়েসে বাতিল';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'কাউন্টডাউনের সময় “আমি ঠিক আছি” বা “বাতিল” বলুন। সম্ভব হলে ডিভাইসেই স্পিচ রিকগনিশন ব্যবহার হয়।';

  @override
  String get emergencyVoicePermDenied =>
      'ভয়েসে বাতিল করতে মাইক্রোফোন ও স্পিচ রিকগনিশনের অ্যাক্সেস প্রয়োজন।';

  @override
  String get emergencyAutoSave => 'ঘটনার ক্লিপ স্বয়ংক্রিয়ভাবে সংরক্ষণ করুন';

  @override
  String get emergencyTest => 'কাউন্টডাউন পরীক্ষা (কল হবে না)';

  @override
  String get emergencyTestBody =>
      'কাউন্টডাউন দেখার জন্য একটি কাল্পনিক সংঘর্ষ চালায়। টেস্ট মোডে কখনও কল বা বার্তা পাঠানো হয় না।';

  @override
  String get emergencyNotSet => 'সেট করা নেই';

  @override
  String get emergencyAlertHeadline => 'সম্ভাব্য গুরুতর সংঘর্ষ শনাক্ত হয়েছে।';

  @override
  String get emergencyAlertSubtitle => 'আপনি কি ঠিক আছেন?';

  @override
  String get emergencyAlertCancel => 'আমি ঠিক আছি — বাতিল';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds সেকেন্ড বাকি',
      one: '1 সেকেন্ড বাকি',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => 'শুনছি — বাতিল করতে “আমি ঠিক আছি” বলুন';

  @override
  String emergencyAlertHeard(String text) {
    return 'শোনা গেছে: “$text”';
  }

  @override
  String get emergencyAlertEscalated => 'কোনো সাড়া নেই। কী করবেন বেছে নিন:';

  @override
  String get emergencyAlertCall => 'জরুরি পরিষেবায় কল করুন';

  @override
  String emergencyAlertCallNumber(String number) {
    return '$number-এ কল করে। iOS আপনার নিশ্চিতকরণ চাইবে।';
  }

  @override
  String get emergencyAlertMessage => 'যোগাযোগকারীদের বার্তা পাঠান';

  @override
  String get emergencyAlertMessageSubtitle =>
      'একটি তৈরি বার্তা খোলে। পাঠাবেন কি না আপনি ঠিক করবেন।';

  @override
  String get emergencyAlertTestMode => 'টেস্ট মোড — কোনো কল করা হবে না';

  @override
  String get emergencyAlertTestBadge => 'টেস্ট';

  @override
  String get emergencyAlertClose => 'আমি ঠিক আছি — বন্ধ করুন';

  @override
  String get emergencyMsgSent => 'বার্তা পাঠানো হয়েছে।';

  @override
  String get emergencyMsgCancelled => 'বার্তা পাঠানো হয়নি।';

  @override
  String get emergencyMsgFailed => 'বার্তা পাঠানো যায়নি।';

  @override
  String get emergencyMsgUnavailable => 'এই ডিভাইসে বার্তা পাঠানোর সুবিধা নেই।';

  @override
  String emergencyCallFailed(String number) {
    return 'কল শুরু করা যায়নি। নিজেই $number-এ কল করুন।';
  }

  @override
  String get modelsTitle => 'AI মডেল';

  @override
  String get modelsIntro =>
      'সব মডেল অ্যাপের সাথেই আছে এবং সম্পূর্ণভাবে আপনার iPhone-এ চলে। আপনার ক্যামেরার ফিড কখনও ডিভাইস ছেড়ে যায় না।';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'লাইভ: প্রতি ফ্রেমে $ms মি.সে. · $hz শনাক্তকরণ/সে.';
  }

  @override
  String modelsLastLoad(String ms) {
    return '$ms মি.সে.-এ লোড হয়েছে';
  }

  @override
  String get modelsEfficientName => 'কার্যকর';

  @override
  String get modelsEfficientDesc =>
      'দ্রুত ও কমপ্যাক্ট ডিটেক্টর, কম তাপ ও ব্যাটারি খরচে দীর্ঘ যাত্রার জন্য উপযুক্ত।';

  @override
  String get modelsEnhancedName => 'উন্নত';

  @override
  String get modelsEnhancedDesc =>
      'বড় ডিটেক্টর, যা ছোট ও আরও দূরের অবজেক্ট শনাক্ত করে, তবে বেশি পাওয়ার খরচ হয়।';

  @override
  String get modelsSegmentationName => 'সেগমেন্টেশন';

  @override
  String get modelsSegmentationDesc =>
      'পারসেপশন ভিউয়ের জন্য দ্রুত শনাক্তকরণের সাথে রাস্তার পৃষ্ঠ ও অবজেক্ট মাস্ক যুক্ত করে।';

  @override
  String get modelsNoneName => 'AI বিরতিতে';

  @override
  String get modelsNoneDesc =>
      'অবজেক্ট শনাক্তকরণ ছাড়াই ক্যামেরা ও রেকর্ডিং চলতে থাকে। সর্বনিম্ন পাওয়ার ব্যবহার।';

  @override
  String get modelsGenericDesc => 'ডিভাইসে চলা অবজেক্ট শনাক্তকরণ মডেল।';

  @override
  String get modelsFunctionDetection =>
      'যানবাহন, মানুষ, সাইকেল, মোটরসাইকেল, বাস, ট্রাফিক লাইট ও স্টপ সাইন শনাক্ত করে';

  @override
  String get modelsFunctionSegmentation =>
      'রাস্তার পৃষ্ঠ ও অবজেক্ট মাস্ক যোগ করে';

  @override
  String get modelsFunctionNone =>
      'কোনো শনাক্তকরণ নেই; শুধু ড্যাশক্যাম রেকর্ডিং';

  @override
  String get modelsSize => 'আকার';

  @override
  String get modelsInput => 'ইনপুট';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'যেসব ভিউয়ের সাথে কাজ করে';

  @override
  String get modelsStatusInstalled => 'ইনস্টল করা (অ্যাপের সাথে)';

  @override
  String get modelsStatusNotInstalled => 'ইনস্টল করা নেই';

  @override
  String get modelsSelected => 'নির্বাচিত';

  @override
  String get modelsUse => 'এই মডেল ব্যবহার করুন';

  @override
  String get modelsSwitching => 'মডেল লোড হচ্ছে…';

  @override
  String modelsSwitched(String name) {
    return '$name এখন সক্রিয়';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'এই ডিভাইসে মাপা হয়েছে: গড়ে $ms মি.সে.';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'এই ডিভাইসে মাপা হয়নি';

  @override
  String get modelsBenchmarkRun => 'বেঞ্চমার্ক চালান';

  @override
  String get modelsBenchmarkRunning => 'বেঞ্চমার্ক চলছে…';

  @override
  String get modelsBenchmarkSelectHint =>
      'বেঞ্চমার্ক করতে এই মডেলটি নির্বাচন করুন।';

  @override
  String get modelsBenchmarkDone => 'বেঞ্চমার্ক সম্পন্ন';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'বেঞ্চমার্ক ব্যর্থ হয়েছে: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'সর্বশেষ আপডেট $date';
  }

  @override
  String get safetyTitle => 'নিরাপত্তা তথ্য';

  @override
  String get safetyIntro =>
      'Corvista একটি ড্রাইভিং-সচেতনতা সহায়ক। এটি আপনার গাড়ি নিয়ন্ত্রণ করে না এবং আপনার নিজের মনোযোগ, বিচারবুদ্ধি বা গাড়ির নিরাপত্তা ব্যবস্থার বিকল্প হতে পারে না।';

  @override
  String get safetyBeforeTitle => 'গাড়ি চালানোর আগে';

  @override
  String get safetyBefore1 =>
      'আপনার iPhone আইনসম্মত অবস্থানে নিরাপদে মাউন্ট করুন, যাতে সামনের দৃষ্টি, এয়ারব্যাগ বা কন্ট্রোল বাধাগ্রস্ত না হয়।';

  @override
  String get safetyBefore2 =>
      'গাড়ি দাঁড় করিয়ে সেটআপ শেষ করুন, ভিউ বেছে নিন এবং গন্তব্য ঠিক করুন।';

  @override
  String get safetyBefore3 =>
      'দীর্ঘ যাত্রায় চার্জার লাগান এবং সম্ভব হলে ফোনকে সরাসরি রোদ থেকে দূরে রাখুন।';

  @override
  String get safetyWhileTitle => 'গাড়ি চালানোর সময়';

  @override
  String get safetyWhile1 =>
      'রাস্তার দিকে নজর রাখুন। নিরাপদ ও আইনসম্মত হলেই কেবল স্ক্রিনের বড় কন্ট্রোল ব্যবহার করুন।';

  @override
  String get safetyWhile2 =>
      'সতর্কতা শুধু সহায়ক, নির্ভর করার মতো সতর্কবার্তা নয়। নীরবতার অর্থ কখনও এই নয় যে রাস্তা পরিষ্কার।';

  @override
  String get safetyWhile3 =>
      'অ্যাপের সাথে মতভেদ হলে অ্যাপ নয়, ট্রাফিক আইন, সংকেত ও রাস্তার চিহ্ন অনুসরণ করুন।';

  @override
  String get safetyLimitsTitle => 'সীমাবদ্ধতা';

  @override
  String get safetyLimits1 =>
      'একটি ফোন ক্যামেরা শুধু সামনের জিনিস দেখে। ক্যামেরার দৃষ্টির বাইরের, আড়ালে থাকা বা খুব কাছের অবজেক্ট শনাক্ত হয় না।';

  @override
  String get safetyLimits2 =>
      'শনাক্তকরণ বাদ পড়তে, দেরিতে হতে বা ভুল হতে পারে, বিশেষ করে রাতে, বৃষ্টি, কুয়াশা বা ঝলকানিতে, কিংবা উইন্ডশিল্ড নোংরা থাকলে।';

  @override
  String get safetyLimits3 =>
      'শুধু সমর্থিত ধরনগুলো চেনা যায়: যানবাহন, বাস, মোটরসাইকেল, সাইকেল, মানুষ, ট্রাফিক লাইট ও স্টপ সাইন। ভার্চুয়াল ভিউয়ের লেন ইঙ্গিত শৈলীকৃত, শনাক্ত করা লেন নয়।';

  @override
  String get safetyLimits4 =>
      'নৈকট্য আনুমানিক জোন (খুব কাছে, কাছে, মাঝারি, দূরে) হিসেবে দেখানো হয়, কখনও মাপা দূরত্ব হিসেবে নয়। পার্কিং ভিউ পার্কিং সেন্সরের বিকল্প নয়।';

  @override
  String get safetyHeatTitle => 'তাপ ও ব্যাটারি';

  @override
  String get safetyHeat1 =>
      'ক্যামেরা ও AI একটানা চললে আপনার iPhone গরম হয়। ডিভাইস গরম হলে Corvista বিশ্লেষণের গতি কমায় ও সতর্কবার্তা দেখায়; iOS অতিরিক্ত গরম হলে ক্যামেরা বন্ধ হয়ে যেতে পারে।';

  @override
  String get safetyEmergencyTitle => 'জরুরি ফিচার';

  @override
  String get safetyEmergency1 =>
      'সম্ভাব্য সংঘর্ষ শনাক্তকরণ পরীক্ষামূলক। এটি প্রকৃত দুর্ঘটনা শনাক্ত নাও করতে পারে এবং অন্য ঘটনায় সক্রিয় হতে পারে।';

  @override
  String get safetyEmergency2 =>
      'এটি কখনও চুপিসারে কাউকে যোগাযোগ করে না: কল বা বার্তার জন্য iOS সবসময় আপনার নিশ্চিতকরণ চায়। নিজে জরুরি পরিষেবায় কল করার বিকল্প নয়।';

  @override
  String get privacyTitle => 'গোপনীয়তা';

  @override
  String get privacyIntro =>
      'Corvista এমনভাবে তৈরি, যাতে আপনার ড্রাইভিং ডেটা আপনার iPhone-এই থাকে। কোনো Corvista অ্যাকাউন্ট নেই, এবং Corvista নিজস্ব কোনো সার্ভার চালায় না।';

  @override
  String get privacyCameraTitle => 'ক্যামেরা ও AI';

  @override
  String get privacyCamera1 =>
      'অবজেক্ট শনাক্তকরণ, ট্র্যাকিং ও সেগমেন্টেশন সম্পূর্ণভাবে আপনার iPhone-এ চলে। ক্যামেরার ফ্রেম কখনও আপলোড হয় না।';

  @override
  String get privacyCamera2 =>
      'ক্যামেরা শুধু তখনই চলে যখন Corvista স্ক্রিনে খোলা থাকে। অ্যাপ ব্যাকগ্রাউন্ডে গেলে এটি থেমে যায় — কোনো গোপন ব্যাকগ্রাউন্ড রেকর্ডিং নেই।';

  @override
  String get privacyRecordingsTitle => 'রেকর্ডিং';

  @override
  String get privacyRecordings1 =>
      'রোলিং বাফার অস্থায়ী এবং ক্রমাগত ওভাররাইট হয়। ফুটেজ শুধু তখনই রাখা হয় যখন আপনি ঘটনা সংরক্ষণ-এ ট্যাপ করেন, অথবা চালু করা থাকলে সম্ভাব্য সংঘর্ষের পরে।';

  @override
  String get privacyRecordings2 =>
      'সংরক্ষিত ক্লিপ আপনার iPhone-এ Corvista-র ব্যক্তিগত স্টোরেজে থাকে। আপনি শেয়ার বেছে নিলেই কেবল সেগুলো ডিভাইস ছাড়ে। অ্যাপ মুছলে ক্লিপও মুছে যায়।';

  @override
  String get privacyRecordings3 =>
      'অডিও শুধু তখনই রেকর্ড হয় যখন আপনি তা চালু করেন এবং মাইক্রোফোনের অ্যাক্সেস দেন।';

  @override
  String get privacyLocationTitle => 'লোকেশন';

  @override
  String get privacyLocation1 =>
      'অ্যাপ খোলা থাকলে আপনার গতি, মানচিত্র, রুট ও আবহাওয়ার জন্য লোকেশন ব্যবহার হয়। “লোকেশন সংরক্ষণ” চালু থাকলে সংরক্ষণের সময়ের অবস্থান আপনার ডিভাইসে ক্লিপের সাথে রাখা হয়।';

  @override
  String get privacyNetworkTitle => 'নেটওয়ার্ক পরিষেবা';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — মানচিত্র প্রদর্শন, স্থান অনুসন্ধান ও রুট। আপনার অনুসন্ধানের লেখা ও আনুমানিক লোকেশন Apple-কে পাঠানো হয়।';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — আপনার লোকেশনের বর্তমান ও ঘণ্টাভিত্তিক আবহাওয়া।';

  @override
  String get privacyNetwork4 =>
      'Corvista-তে কোনো বিজ্ঞাপন এবং কোনো তৃতীয় পক্ষের অ্যানালিটিক্স বা ট্র্যাকিং নেই।';

  @override
  String get privacyEmergencyTitle => 'জরুরি যোগাযোগ';

  @override
  String get privacyEmergency1 =>
      'আপনার বেছে নেওয়া যোগাযোগগুলো এই ডিভাইসের iOS Keychain-এ সংরক্ষিত থাকে। সম্ভব হলে ভয়েসে বাতিলের জন্য ডিভাইসেই স্পিচ রিকগনিশন ব্যবহার হয়। কল ও বার্তা iOS-এ আপনি নিশ্চিত করার পরেই কেবল পাঠানো হয়।';

  @override
  String get privacyControlsTitle => 'আপনার নিয়ন্ত্রণ';

  @override
  String get privacyControls1 =>
      'আপনি যেকোনো সময় ক্লিপ বিভাগে ক্লিপ মুছতে পারেন, এবং iOS সেটিংসে ক্যামেরা, মাইক্রোফোন, লোকেশন ও স্পিচের অ্যাক্সেস পরিবর্তন বা প্রত্যাহার করতে পারেন।';

  @override
  String get termsTitle => 'ব্যবহারের শর্তাবলী';

  @override
  String get termsIntro =>
      'Corvista ব্যবহার করে আপনি এই শর্তাবলীতে সম্মত হচ্ছেন। Apple-এর স্ট্যান্ডার্ড Licensed Application End User License Agreement-ও প্রযোজ্য।';

  @override
  String get termsUseTitle => 'Corvista ব্যবহার';

  @override
  String get termsUse1 =>
      'Corvista একটি ড্রাইভিং-সচেতনতা ও ড্যাশক্যাম সহায়ক। নিরাপদে ও আইন মেনে গাড়ি চালানোর সম্পূর্ণ দায়িত্ব সবসময় আপনার।';

  @override
  String get termsUse2 =>
      'গাড়ি চালানোর সময় মনোযোগ বিচ্ছিন্ন করে এমনভাবে অ্যাপ ব্যবহার করবেন না। ডিভাইসটি নিরাপদে ও আইনসম্মতভাবে মাউন্ট করুন।';

  @override
  String get termsAccuracyTitle => 'নির্ভুলতার কোনো নিশ্চয়তা নেই';

  @override
  String get termsAccuracy1 =>
      'শনাক্তকরণ, জোন, সতর্কতা, মানচিত্রের মার্কার, রুট ও আবহাওয়া অসম্পূর্ণ, বিলম্বিত বা ভুল হতে পারে। Corvista আপনার গাড়ি নিয়ন্ত্রণ করে না।';

  @override
  String get termsAccuracy2 =>
      'জরুরি ফিচারটি পরীক্ষামূলক এবং সংঘর্ষ শনাক্ত করতে ব্যর্থ হতে পারে বা ভুলবশত সক্রিয় হতে পারে।';

  @override
  String get termsRecordingTitle => 'রেকর্ডিং আইন';

  @override
  String get termsRecording1 =>
      'ড্যাশক্যাম, অডিও রেকর্ডিং এবং মানুষের ছবি তোলা বা ভিডিও করার আইন দেশ ও অঞ্চলভেদে ভিন্ন। ক্লিপ শেয়ার করার সময়সহ এসব আইন মেনে চলার দায়িত্ব আপনার।';

  @override
  String get termsLiabilityTitle => 'দায়';

  @override
  String get termsLiability1 =>
      'অ্যাপটি “যেমন আছে” ভিত্তিতে সরবরাহ করা হয়। আইন যতটা অনুমতি দেয়, এর ব্যবহার বা এর ফলাফলের ওপর নির্ভরতা থেকে ঘটা দুর্ঘটনা, ক্ষতি, জরিমানা বা অন্য ক্ষয়ক্ষতির জন্য ডেভেলপার দায়ী নন।';

  @override
  String get termsChangesTitle => 'পরিবর্তন';

  @override
  String get termsChanges1 =>
      'অ্যাপের নতুন সংস্করণের সাথে এই শর্তাবলী হালনাগাদ হতে পারে। হালনাগাদের পরেও ব্যবহার চালিয়ে গেলে আপনি সংশোধিত শর্তাবলী মেনে নিচ্ছেন বলে গণ্য হবে।';

  @override
  String get helpTitle => 'সহায়তা';

  @override
  String get helpIntro =>
      'সাধারণ প্রশ্নের উত্তর। নিরাপত্তা নির্দেশনার জন্য নিরাপত্তা তথ্য দেখুন।';

  @override
  String get helpQSave => 'কোনো ঘটনার ফুটেজ কীভাবে রাখব?';

  @override
  String get helpASaveBuffer =>
      'ড্রাইভ ভিউয়ে বড় ঘটনা সংরক্ষণ বোতামে ট্যাপ করুন। Corvista তার চলমান বাফারের শেষ ২০ বা ৩০ সেকেন্ড (সেটিংস › রেকর্ডিংয়ে আপনার পছন্দ অনুযায়ী) ক্লিপে সংরক্ষণ করে।';

  @override
  String get helpQWhere => 'আমার ক্লিপ কোথায় সংরক্ষিত থাকে?';

  @override
  String get helpAWhere =>
      'আপনার iPhone-এ Corvista-র ব্যক্তিগত স্টোরেজে। এগুলো কখনও আপলোড হয় না। ক্লিপ পাঠাতে বা এক্সপোর্ট করতে প্লেয়ারে শেয়ার ব্যবহার করুন।';

  @override
  String get helpQZones => 'নৈকট্য জোন কতটা নির্ভুল?';

  @override
  String get helpAZones =>
      'জোনগুলো একটি ক্যামেরা থেকে সাধারণ অবজেক্টের আকারের ভিত্তিতে মোটামুটি অনুমান। এগুলোকে আনুমানিক ইঙ্গিত হিসেবে দেখুন, কখনও দূরত্ব হিসেবে নয়।';

  @override
  String get helpQSlow => 'কেন শনাক্তকরণ ধীর হয়ে যায়?';

  @override
  String get helpASlow =>
      'আপনার iPhone গরম হলে, ব্যাটারি কম থাকলে বা লো পাওয়ার মোড চালু থাকলে Corvista ডিভাইস রক্ষার জন্য বিশ্লেষণের গতি কমায়। সেটিংসে পাওয়ার মোড পরিবর্তন করতে পারেন।';

  @override
  String get helpQMap => 'মানচিত্র, অনুসন্ধান বা আবহাওয়া কাজ করছে না।';

  @override
  String get helpAMap =>
      'এই ফিচারগুলোর জন্য ইন্টারনেট সংযোগ ও লোকেশন অ্যাক্সেস লাগে। সংযোগ পরীক্ষা করুন এবং iOS সেটিংসে Corvista-কে লোকেশনের অনুমতি দিন।';

  @override
  String get helpQSimulator => 'ক্যামেরা অনুপলব্ধ দেখাচ্ছে।';

  @override
  String get helpASimulator =>
      'iOS সেটিংসে ক্যামেরার অনুমতি দেওয়া আছে এবং অন্য কোনো অ্যাপ ক্যামেরা ব্যবহার করছে না তা নিশ্চিত করুন। iOS Simulator-এ কোনো ক্যামেরা নেই; তার বদলে একটি লোকাল টেস্ট ভিডিও ব্যবহার করা যায়।';

  @override
  String get emergencyMsgNoContacts => 'আগে একটি জরুরি যোগাযোগ যোগ করুন।';

  @override
  String get cameraStarting => 'ক্যামেরা চালু হচ্ছে…';

  @override
  String get cameraInterrupted => 'ক্যামেরা বিরতিতে';

  @override
  String get cameraInterruptedBody =>
      'যেমন কল চলাকালীন বা অন্য অ্যাপ ক্যামেরা ব্যবহার করলে iOS ক্যামেরা থামিয়ে দেয়। এটি স্বয়ংক্রিয়ভাবে আবার চালু হবে।';

  @override
  String get cameraUnavailable => 'ক্যামেরা অনুপলব্ধ';

  @override
  String get cameraUnavailableBody =>
      'এই ডিভাইসে কোনো ক্যামেরা পাওয়া যাচ্ছে না। শনাক্তকরণ, রেকর্ডিং ও পার্কিং ভিউয়ের জন্য পেছনের ক্যামেরা লাগে।';

  @override
  String get cameraRunTestFootage => 'টেস্ট ফুটেজ চালান';

  @override
  String get cameraPermissionDenied => 'ক্যামেরা অ্যাক্সেস বন্ধ';

  @override
  String get cameraPermissionDeniedBody =>
      'শনাক্তকরণ, ড্যাশক্যাম রেকর্ডিং ও পার্কিং ভিউয়ের জন্য Corvista-র ক্যামেরা প্রয়োজন। সেটিংসে ক্যামেরা অ্যাক্সেস চালু করুন।';

  @override
  String get cameraError => 'ক্যামেরা ত্রুটি';

  @override
  String get cameraStopped => 'ক্যামেরা বন্ধ';

  @override
  String get cameraStart => 'ক্যামেরা চালু করুন';

  @override
  String get cameraFocusHint => 'ফোকাস করতে ট্যাপ করুন';

  @override
  String get cameraPreviewLabel => 'শনাক্ত করা অবজেক্টসহ লাইভ ক্যামেরা ভিউ';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'ক্যামেরা $fps fps · AI $hz Hz · $ms মি.সে. · বাদ পড়েছে $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'গতি $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'GPS গতি নেই';

  @override
  String hudHeading(String direction, String degrees) {
    return 'দিক $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds সে.';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'ড্যাশক্যাম বাফার রেকর্ডিং, $target সেকেন্ডের মধ্যে $seconds সেকেন্ড বাফার হয়েছে';
  }

  @override
  String get hudRecIdle => 'REC বন্ধ';

  @override
  String get hudRecSaving => 'সংরক্ষণ হচ্ছে…';

  @override
  String get hudRecError => 'REC ত্রুটি';

  @override
  String get hudAiPaused => 'AI বিরতিতে';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি অবজেক্ট',
      zero: 'কোনো অবজেক্ট নেই',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি অবজেক্ট',
      zero: 'কোনো অবজেক্ট',
    );
    return 'AI মডেল $model, $_temp0 শনাক্ত হয়েছে';
  }

  @override
  String get hudThermalSerious => 'গরম — AI ধীর';

  @override
  String get hudThermalCritical => 'অতিরিক্ত গরম — AI বিরতিতে';

  @override
  String hudBatteryLow(String percent) {
    return 'ব্যাটারি $percent';
  }

  @override
  String get hudLowPower => 'লো পাওয়ার মোড';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'আবহাওয়া $temperature, $condition। বিস্তারিত দেখতে ট্যাপ করুন।';
  }

  @override
  String get hudNoGuidance =>
      'এখানে টার্ন-বাই-টার্ন নির্দেশনা দেখতে মানচিত্র ভিউয়ে গন্তব্য খুঁজুন।';

  @override
  String get navArrived => 'আপনি পৌঁছে গেছেন';

  @override
  String get navRerouting => 'নতুন রুট খোঁজা হচ্ছে…';

  @override
  String get navSearchHint => 'গন্তব্য খুঁজুন';

  @override
  String get navSearchFieldHint => 'ঠিকানা, স্থান বা প্রতিষ্ঠান';

  @override
  String get navNoResults => 'মিলে যাওয়া কোনো স্থান নেই';

  @override
  String get navSearching => 'খোঁজা হচ্ছে…';

  @override
  String get navSearchStartTyping =>
      'একটি ঠিকানা বা স্থানের নাম লিখুন। ফলাফল Apple Maps থেকে আসে এবং ইন্টারনেট সংযোগ প্রয়োজন।';

  @override
  String get navErrorUnavailable =>
      'অনুসন্ধান ও রুট অনুপলব্ধ — আপনার ইন্টারনেট সংযোগ পরীক্ষা করুন।';

  @override
  String get navErrorNoLocation =>
      'রুট পরিকল্পনার জন্য আপনার লোকেশনের অপেক্ষা করা হচ্ছে।';

  @override
  String get navErrorPermission =>
      'লোকেশন অ্যাক্সেস বন্ধ, তাই আপনার অবস্থান থেকে রুট শুরু করা যাচ্ছে না।';

  @override
  String navErrorGeneric(String code) {
    return 'রুট লোড করা যায়নি ($code)।';
  }

  @override
  String navRoutesTitle(String place) {
    return '$place-এর রুট';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'পৌঁছাবেন $time';
  }

  @override
  String get navStart => 'শুরু';

  @override
  String get navEnd => 'শেষ';

  @override
  String get navEndLabel => 'নেভিগেশন শেষ করুন';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration বাকি';
  }

  @override
  String navAdvisory(String text) {
    return 'পরামর্শ: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes মিনিট',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours ঘণ্টা $minutes মিনিট';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'রুট $index: $name';
  }

  @override
  String get weatherTitle => 'আবহাওয়া';

  @override
  String weatherFeelsLike(String temperature) {
    return 'অনুভূত হচ্ছে $temperature';
  }

  @override
  String get weatherPrecipitation => 'বৃষ্টিপাত';

  @override
  String get weatherWind => 'বাতাস';

  @override
  String get weatherVisibility => 'দৃশ্যমানতা';

  @override
  String get weatherHumidity => 'আর্দ্রতা';

  @override
  String get weatherHourly => 'পরের ঘণ্টাগুলো';

  @override
  String weatherAsOf(String time) {
    return 'আপডেট $time';
  }

  @override
  String get weatherRefresh => 'আবহাওয়া রিফ্রেশ করুন';

  @override
  String get weatherUnavailable => 'এই মুহূর্তে আবহাওয়া উপলব্ধ নেই।';

  @override
  String get weatherNoLocation => 'আবহাওয়ার জন্য আপনার লোকেশন প্রয়োজন।';

  @override
  String get weatherLegal => 'ডেটার উৎস ও আইনি তথ্য';

  @override
  String weatherProvidedBy(String service) {
    return 'আবহাওয়ার ডেটা: $service';
  }

  @override
  String get weatherNow => 'এখন';

  @override
  String get virtualEmpty => 'কোনো সমর্থিত অবজেক্ট শনাক্ত হয়নি';

  @override
  String get virtualEmptyCameraOff =>
      'ভার্চুয়াল ভিউয়ের জন্য লাইভ ক্যামেরা প্রয়োজন।';

  @override
  String get virtualLaneDisclaimer =>
      'লেন রেখাগুলো চিত্রণমাত্র, শনাক্ত করা নয়।';

  @override
  String virtualNearest(String zone) {
    return 'সবচেয়ে কাছে: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'ভার্চুয়াল রাস্তার দৃশ্য: $summary';
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
  String get virtualStatusLive => 'লাইভ';

  @override
  String get virtualStatusPaused => 'বিরতিতে';

  @override
  String get virtualStatusCameraOff => 'ক্যামেরা বন্ধ';

  @override
  String get virtualStatusTestFootage => 'টেস্ট ফুটেজ';

  @override
  String get virtualEmptyHint =>
      'যানবাহন, মানুষ, সাইকেল, লাইট ও স্টপ সাইন শনাক্ত হলে এখানে দেখা যাবে।';

  @override
  String get mapRecenter => 'কেন্দ্রে আনুন';

  @override
  String get mapZoomIn => 'জুম ইন';

  @override
  String get mapZoomOut => 'জুম আউট';

  @override
  String get mapUnsupported => 'ইন্টারঅ্যাক্টিভ মানচিত্র iPhone-এ পাওয়া যায়।';

  @override
  String get mapObjectsApprox => 'অবজেক্ট মার্কারগুলো আনুমানিক অবস্থান।';

  @override
  String get mapWeatherUnavailable => 'আবহাওয়া অনুপলব্ধ';

  @override
  String get navErrorNoRoute => 'এই গন্তব্যে কোনো রুট পাওয়া যায়নি।';

  @override
  String get navDismiss => 'বন্ধ করুন';

  @override
  String get navGo => 'চলুন';

  @override
  String get navFastest => 'দ্রুততম';

  @override
  String get navThen => 'তারপর';

  @override
  String get navRecents => 'সাম্প্রতিক';

  @override
  String get navClearRecents => 'মুছুন';

  @override
  String get navSearchSubmitHint =>
      'মিলে যাওয়া সব স্থান দেখতে অনুসন্ধান চাপুন';

  @override
  String get navPlaces => 'স্থান';

  @override
  String get navEtaLabel => 'পৌঁছানো';

  @override
  String get navTimeLeftLabel => 'বাকি';

  @override
  String get navOverview => 'সারসংক্ষেপ';

  @override
  String get navMute => 'ভয়েস বন্ধ করুন';

  @override
  String get navUnmute => 'ভয়েস চালু করুন';

  @override
  String get navEndConfirm => 'নেভিগেশন শেষ করবেন?';

  @override
  String navEndConfirmBody(String place) {
    return '$place-এর নির্দেশনা বন্ধ হয়ে যাবে।';
  }

  @override
  String navArrivedAt(String place) {
    return 'আপনি $place-এ পৌঁছে গেছেন';
  }

  @override
  String get navDone => 'সম্পন্ন';

  @override
  String get navWeakGps => 'GPS সংকেত দুর্বল';

  @override
  String get navLocationOff =>
      'লোকেশন বন্ধ। রুট পরিকল্পনা ও নেভিগেশনের জন্য এটি চালু করুন।';

  @override
  String get navVoiceGuidance => 'ভয়েস নির্দেশনা';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance পরে, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, তারপর $second';
  }

  @override
  String get navSpeakRerouting => 'নতুন রুট খোঁজা হচ্ছে';

  @override
  String get navSpeakArrived => 'আপনি পৌঁছে গেছেন';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count মিটার',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value কিলোমিটার',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ফুট',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count গজ',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return '$distance সোজা চলুন';
  }

  @override
  String get navErrorNoDirections =>
      'এই অঞ্চলে এই যাত্রার জন্য নির্দেশনা পাওয়া যাচ্ছে না। অন্য গন্তব্য চেষ্টা করুন।';

  @override
  String navContinueFor(String distance) {
    return '$distance সোজা চলুন';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value মাইল',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'সবচেয়ে কাছে: $object · $zone';
  }

  @override
  String get parkingNothing => 'ভিউয়ে কিছু শনাক্ত হয়নি';

  @override
  String get parkingBeeps => 'নৈকট্য বিপ';

  @override
  String get parkingVolume => 'বিপের ভলিউম';

  @override
  String get parkingLimitations =>
      'একটি মাত্র ক্যামেরা, 360° নয়। ক্যামেরার দৃষ্টির বাইরের অবজেক্ট শনাক্ত হয় না। পার্কিং সেন্সরের বিকল্প নয়; অনুমান ভুল হতে পারে এবং নীরবতার অর্থ এই নয় যে এলাকা পরিষ্কার।';

  @override
  String parkingTopDownLabel(String summary) {
    return 'উপর থেকে নৈকট্য ভিউ। $summary';
  }

  @override
  String get perceptionModeOriginal => 'আসল';

  @override
  String get perceptionModeBoxes => 'বক্স';

  @override
  String get perceptionModeMasks => 'অবজেক্ট মাস্ক';

  @override
  String get perceptionModeRoad => 'রাস্তার পৃষ্ঠ';

  @override
  String get perceptionModeCombined => 'সম্মিলিত';

  @override
  String get perceptionOpacity => 'মাস্কের স্বচ্ছতা';

  @override
  String get perceptionDisclaimer =>
      'রাস্তার পৃষ্ঠের মাস্ক একটি আনুমানিক ভিজ্যুয়াল স্তর। এটি চালানোর উপযোগী জায়গা বা লেন দেখায় না।';

  @override
  String get perceptionNeedsModel =>
      'মাস্ক দেখতে সেগমেন্টেশন মডেল নির্বাচন করুন।';

  @override
  String get perceptionChooseModel => 'মডেল বাছুন';

  @override
  String get perceptionWaiting => 'প্রথম সেগমেন্টেশন ফ্রেমের অপেক্ষা…';

  @override
  String get perceptionShortCamera => 'ক্যামেরা';

  @override
  String get perceptionShortBoxes => 'বক্স';

  @override
  String get perceptionShortObjects => 'বস্তু';

  @override
  String get perceptionShortRoad => 'রাস্তা';

  @override
  String get perceptionShortAll => 'সব';

  @override
  String get perceptionModesLabel => 'পারসেপশন স্তর';

  @override
  String get perceptionStatusWarmingUp => 'প্রস্তুত হচ্ছে…';

  @override
  String get perceptionStatusLoadingModel => 'মডেল লোড হচ্ছে…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'মাস্ক বিরতিতে';

  @override
  String get perceptionLegend => 'মাস্কের সূচি';

  @override
  String get perceptionUnavailable => 'মাস্ক উপলব্ধ নয়';

  @override
  String get driveSave => 'সংরক্ষণ';

  @override
  String get driveSaveIncident => 'ঘটনা সংরক্ষণ';

  @override
  String driveSaveHint(int seconds) {
    return 'ড্যাশক্যামের শেষ $seconds সেকেন্ডের ফুটেজ সংরক্ষণ করে';
  }

  @override
  String get driveSaving => 'ঘটনা সংরক্ষণ হচ্ছে…';

  @override
  String hudRecManualLabel(String time) {
    return 'রেকর্ড হচ্ছে, $time';
  }

  @override
  String get driveRecord => 'রেকর্ড';

  @override
  String get driveRecordStartA11y => 'রেকর্ডিং শুরু করুন';

  @override
  String driveRecordStopA11y(String time) {
    return 'রেকর্ডিং বন্ধ করুন, $time রেকর্ড হয়েছে';
  }

  @override
  String get driveRecordHint =>
      'আপনি বন্ধ না করা পর্যন্ত একটানা রেকর্ড করে, আগের ৫ সেকেন্ডসহ';

  @override
  String get driveRecordFailed => 'রেকর্ডিং শুরু করা যায়নি';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'রেকর্ডিং সংরক্ষিত · $countটি অংশ',
      one: 'রেকর্ডিং সংরক্ষিত',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'রেকর্ডিং বন্ধ: স্টোরেজ প্রায় পূর্ণ',
      'max_duration': 'রেকর্ডিং বন্ধ: সর্বোচ্চ দৈর্ঘ্যে পৌঁছেছে',
      'camera_stopped': 'ক্যামেরার সঙ্গে রেকর্ডিং বন্ধ হয়েছে',
      'background': 'রেকর্ডিং বন্ধ: অ্যাপ ব্যাকগ্রাউন্ডে গেছে',
      'thermal': 'রেকর্ডিং বন্ধ: ফোন অতিরিক্ত গরম',
      'other': 'রেকর্ডিং বন্ধ হয়েছে',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'ঘটনা সংরক্ষিত · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'দেখুন';

  @override
  String get driveSaveFailed => 'ঘটনা সংরক্ষণ করা যায়নি।';

  @override
  String get driveSaveNotRunning =>
      'রেকর্ডিং এখনও শুরু হয়নি — ক্যামেরা চালু হওয়া পর্যন্ত অপেক্ষা করে আবার চেষ্টা করুন।';

  @override
  String get driveSaveTestFootage =>
      'টেস্ট ফুটেজ রেকর্ড হয় না। ঘটনা সংরক্ষণ লাইভ ক্যামেরায় কাজ করে।';

  @override
  String get driveSaveStorageFull =>
      'আপনার iPhone-এর স্টোরেজ ভরে গেছে। জায়গা খালি করুন বা পুরনো ক্লিপ মুছুন।';

  @override
  String get driveSaveIoError => 'ক্লিপটি স্টোরেজে লেখা যায়নি।';

  @override
  String get driveClips => 'ক্লিপ';

  @override
  String get driveSettings => 'সেটিংস';

  @override
  String get driveViewSwitcher => 'ড্রাইভ ভিউ';

  @override
  String get driveLocationDenied =>
      'লোকেশন বন্ধ — গতি, মানচিত্র ও রুট অনুপলব্ধ।';

  @override
  String get driveCameraDenied =>
      'ক্যামেরা অ্যাক্সেস বন্ধ — শনাক্তকরণ ও রেকর্ডিং অনুপলব্ধ।';

  @override
  String get driveRecorderFallback =>
      'অডিও ছাড়া রেকর্ড হচ্ছে: মাইক্রোফোন অ্যাক্সেস বন্ধ।';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'রেকর্ডিং সেটিংস সমন্বয় করা হয়েছে: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'আপনার iPhone গরম। ঠান্ডা হতে AI ধীরে চলছে — এটিকে সরাসরি রোদ থেকে দূরে এবং ভেন্টের কাছে রাখুন।';

  @override
  String get drivePowerThermalCritical =>
      'আপনার iPhone অতিরিক্ত গরম। ঠান্ডা না হওয়া পর্যন্ত AI শনাক্তকরণ বিরতিতে থাকবে; সম্ভব হলে রেকর্ডিং চলবে।';

  @override
  String get drivePowerLowPower => 'লো পাওয়ার মোড চালু — AI কম গতিতে চলছে।';

  @override
  String get drivePowerBatteryLow =>
      'ব্যাটারি কম — গাড়ি চালানোর সময় আপনার iPhone পাওয়ারে সংযুক্ত করুন।';

  @override
  String get onboardingTitle1 => 'প্রতিটি যাত্রায় আরও বেশি দেখুন।';

  @override
  String get onboardingBody1 =>
      'আপনার iPhone-কে একটি বুদ্ধিমান ড্যাশক্যাম ও ড্রাইভিং-সচেতনতা সঙ্গীতে পরিণত করুন।';

  @override
  String get onboardingTitle2 => 'প্রতিটি ফ্রেমে বুদ্ধিমত্তা।';

  @override
  String get onboardingBody2 =>
      'সমর্থিত যানবাহন, মানুষ, সাইকেল ও রাস্তার সংকেত সরাসরি আপনার iPhone-এ চিনুন।';

  @override
  String get onboardingTitle3 => 'একটি রাস্তা। একাধিক দৃষ্টিভঙ্গি।';

  @override
  String get onboardingBody3 =>
      'লাইভ শনাক্তকরণ, ভার্চুয়াল ড্রাইভিং ভিউ, ইন্টারঅ্যাক্টিভ মানচিত্র ও পার্কিং ভিজ্যুয়ালাইজেশনের মধ্যে বদলান।';

  @override
  String get onboardingTitle4 => 'গুরুত্বপূর্ণ মুহূর্তগুলো ধরে রাখুন।';

  @override
  String get onboardingBody4 =>
      'সাম্প্রতিক ড্যাশক্যাম ফুটেজ সংরক্ষণ করুন, ঘটনা পর্যালোচনা করুন এবং রেকর্ডিং শেয়ার করুন।';

  @override
  String get onboardingTitle5 => 'নিরাপত্তা ও গোপনীয়তা';

  @override
  String get onboardingSafety1 =>
      'Corvista একটি ড্রাইভিং-সচেতনতা সহায়ক। রাস্তার দিকে নজর রাখুন।';

  @override
  String get onboardingSafety2 =>
      'এটি আপনার গাড়ি নিয়ন্ত্রণ করে না এবং আপনার বিচারবুদ্ধির বিকল্প নয়।';

  @override
  String get onboardingSafety3 =>
      'শনাক্তকরণ ও অনুমান ভুল হতে পারে বা বাদ পড়তে পারে।';

  @override
  String get onboardingSafety4 =>
      'ক্যামেরার প্রসেসিং আপনার iPhone-এই হয় — ভিডিও আপলোড হয় না।';

  @override
  String get onboardingSafety5 =>
      'মানচিত্র, অনুসন্ধান, রুট ও আবহাওয়ার জন্য ইন্টারনেট সংযোগ প্রয়োজন।';

  @override
  String get onboardingSafety6 =>
      'আপনার iPhone নিরাপদে মাউন্ট করুন, যাতে সামনের দৃষ্টি বাধাগ্রস্ত না হয়।';

  @override
  String get onboardingSafety7 => 'গাড়ি চালানো শুরুর আগে সেটআপ শেষ করুন।';

  @override
  String get onboardingAcknowledge =>
      'আমি বুঝি যে Corvista একটি সচেতনতা সহায়ক এবং নিরাপদে গাড়ি চালানোর দায়িত্ব আমারই।';

  @override
  String get onboardingReadSafety => 'সম্পূর্ণ নিরাপত্তা তথ্য পড়ুন';

  @override
  String get onboardingNext => 'পরবর্তী';

  @override
  String get onboardingSkip => 'এড়িয়ে যান';

  @override
  String get onboardingAgree => 'চালিয়ে যান';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'পৃষ্ঠা $current/$total';
  }

  @override
  String get permTitle => 'অনুমতি';

  @override
  String get permIntro =>
      'প্রতিটি ফিচারের জন্য যা দরকার, Corvista শুধু তা-ই চায়। আপনি যেকোনো সময় সেটিংসে এগুলো বদলাতে পারেন।';

  @override
  String get permCameraTitle => 'ক্যামেরা';

  @override
  String get permCameraBody =>
      'শনাক্তকরণ, ড্যাশক্যাম রেকর্ডিং ও পার্কিং ভিউয়ের জন্য আবশ্যক। ভিডিও আপনার iPhone-এ প্রসেস হয়।';

  @override
  String get permLocationTitle => 'লোকেশন';

  @override
  String get permLocationBody =>
      'GPS গতি, মানচিত্র, রুট, আবহাওয়া এবং সংরক্ষিত ক্লিপে ট্যাগ দেওয়ার জন্য ব্যবহৃত হয়। শুধু আপনি অ্যাপ ব্যবহার করার সময়।';

  @override
  String get permMicTitle => 'মাইক্রোফোন';

  @override
  String get permSpeechNote =>
      'স্পিচ রিকগনিশন কেবল তখনই চাওয়া হয় যখন আপনি জরুরি সতর্কতার জন্য ভয়েসে বাতিল চালু করেন।';

  @override
  String get permRequired => 'আবশ্যক';

  @override
  String get permOptional => 'ঐচ্ছিক';

  @override
  String get permAllow => 'অনুমতি দিন';

  @override
  String get permGranted => 'অনুমোদিত';

  @override
  String get permDenied => 'প্রত্যাখ্যাত';

  @override
  String get permLimited => 'সীমিত';

  @override
  String get permRestricted => 'নিষিদ্ধ';

  @override
  String get permStart => 'গাড়ি চালানো শুরু করুন';

  @override
  String get permCameraNeeded =>
      'ক্যামেরা অ্যাক্সেস ছাড়াই চালিয়ে যেতে পারেন, কিন্তু সেটিংসে অনুমতি না দেওয়া পর্যন্ত শনাক্তকরণ ও রেকর্ডিং কাজ করবে না।';

  @override
  String get permSetupIntro =>
      'পুরোপুরি কাজ করতে Corvista-র এগুলো দরকার। সব অনুমতি দিন-এ ট্যাপ করলে iOS একে একে প্রতিটি জানতে চাইবে। আপনি যেকোনো সময় সেটিংসে এগুলো বদলাতে পারেন।';

  @override
  String get permCameraLine =>
      'শনাক্তকরণ, ড্যাশক্যাম রেকর্ডিং ও পার্কিং ভিউয়ের জন্য আবশ্যক। ভিডিও আপনার iPhone-এ প্রসেস হয়, কখনও আপলোড হয় না।';

  @override
  String get permLocationLine =>
      'GPS গতি, মানচিত্র, রুট, আবহাওয়া এবং ক্লিপ কোথায় সংরক্ষিত হয়েছে। শুধু আপনি অ্যাপ ব্যবহার করার সময়।';

  @override
  String get permMicLine =>
      'ঘটনার ক্লিপে গাড়ির ভেতরের অডিও এবং জরুরি সতর্কতার সময় আপনার বাতিলের বাক্য শোনা।';

  @override
  String get permSpeechTitle => 'স্পিচ রিকগনিশন';

  @override
  String get permSpeechLine =>
      'সমর্থিত হলে আপনার iPhone-এই জরুরি কাউন্টডাউনের সময় আপনার বাতিলের বাক্য শনাক্ত করে।';

  @override
  String get permAllowAll => 'সব অনুমতি দিন';

  @override
  String permAsking(String permission) {
    return '$permission-এর জন্য জিজ্ঞাসা করা হচ্ছে…';
  }

  @override
  String get permSomeDenied =>
      'কিছু অনুমতি বন্ধ আছে। সেই ফিচারগুলো ব্যবহার করতে সেটিংসে চালু করুন।';

  @override
  String get permNotNow => 'এখন নয়';

  @override
  String get tourLabel => 'ড্রাইভ স্ক্রিন ট্যুর';

  @override
  String tourProgress(int current, int total) {
    return 'ধাপ $current/$total';
  }

  @override
  String get tourNext => 'পরবর্তী';

  @override
  String get tourBack => 'পিছনে';

  @override
  String get tourSkip => 'ট্যুর এড়িয়ে যান';

  @override
  String get tourFinish => 'গাড়ি চালানো শুরু করুন';

  @override
  String get tourWelcomeTitle => 'আপনার দ্রুত ট্যুর';

  @override
  String get tourWelcomeBody =>
      'ড্রাইভ স্ক্রিনের গুরুত্বপূর্ণ বিষয়গুলোর এক মিনিটের পরিচিতি। গাড়ি দাঁড় করিয়ে দেখাই ভালো।';

  @override
  String get tourHudTitle => 'আপনার ইনস্ট্রুমেন্ট স্ট্রিপ';

  @override
  String get tourHudSpeed => 'গতি GPS থেকে আসে।';

  @override
  String get tourHudRec => 'REC দেখায় কত সেকেন্ডের ফুটেজ বাফারে আছে।';

  @override
  String get tourHudAi =>
      'AI চিপে মডেল, কয়টি অবজেক্ট দেখা যাচ্ছে এবং একটি ডট দেখায়: সবুজ মানে চলছে, হলুদ মানে সীমিত, লাল মানে বন্ধ।';

  @override
  String get tourSaveTitle => 'ঘটনা সংরক্ষণ';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista শেষ $seconds সেকেন্ডের ভিডিওর একটি রোলিং বাফার রাখে। এটি ক্রমাগত ওভাররাইট হয়, তাই আপনি সংরক্ষণে ট্যাপ না করলে কিছুই রাখা হয় না। সংরক্ষিত ক্লিপ এই iPhone-এ ক্লিপ বিভাগে থাকে।';
  }

  @override
  String get tourRecordTitle => 'পুরো যাত্রা রেকর্ড করুন';

  @override
  String get tourRecordBody =>
      'আপনি বন্ধ না করা পর্যন্ত একটানা ভিডিও করতে রেকর্ডে ট্যাপ করুন। দীর্ঘ যাত্রা ক্লিপে ৫ মিনিটের অংশে সংরক্ষিত হয়, আর রেকর্ড করার সময়ও ঘটনা সংরক্ষণ কাজ করে।';

  @override
  String get tourViewsTitle => 'রাস্তা দেখার পাঁচটি উপায়';

  @override
  String get tourViewDetection =>
      'সমর্থিত অবজেক্টের চারপাশে বক্সসহ লাইভ ক্যামেরা।';

  @override
  String get tourViewVirtual => 'শনাক্তকরণ থেকে তৈরি একটি সরলীকৃত 3D দৃশ্য।';

  @override
  String get tourViewMap =>
      'অনুসন্ধান ও টার্ন-বাই-টার্ন নির্দেশনাসহ Apple Maps।';

  @override
  String get tourViewParking => 'ক্যামেরার সাথে উপর থেকে নৈকট্য ভিউ।';

  @override
  String get tourViewPerception => 'রাস্তা ও অবজেক্ট মাস্ক।';

  @override
  String get tourMapTitle => 'অনুসন্ধান ও টার্ন-বাই-টার্ন';

  @override
  String get tourMapBody =>
      'মানচিত্র খুলুন, অনুসন্ধান বারে ট্যাপ করুন এবং গন্তব্য বেছে নিন। একটি রুট নির্বাচন করে টার্ন-বাই-টার্ন নির্দেশনার জন্য শুরু-তে ট্যাপ করুন। ইন্টারনেট সংযোগ প্রয়োজন।';

  @override
  String get tourClipsTitle => 'ক্লিপ';

  @override
  String get tourClipsBody =>
      'সংরক্ষিত ঘটনা দেখুন, নাম বদলান, শেয়ার করুন বা মুছুন। আপনি শেয়ার না করলে ক্লিপ আপনার iPhone-এই থাকে।';

  @override
  String get tourSettingsTitle => 'সেটিংস';

  @override
  String get tourSettingsBody =>
      'ভয়েস সতর্কতা ও তার সংবেদনশীলতা, রেকর্ডিংয়ের মান ও বাফারের দৈর্ঘ্য ঠিক করুন এবং জরুরি মোড সেট করুন: বাতিলের কাউন্টডাউনসহ একটি পরীক্ষামূলক সংঘর্ষ সতর্কতা।';

  @override
  String get tourSafetyTitle => 'গাড়ি চালানোর আগে';

  @override
  String get tourSafety1 =>
      'আপনার iPhone এমনভাবে নিরাপদে মাউন্ট করুন যাতে সামনের দৃষ্টি বাধাগ্রস্ত না হয়।';

  @override
  String get tourSafety2 =>
      'গাড়ি চালানোর সময় অ্যাপ ব্যবহার করবেন না। গাড়ি দাঁড় করিয়ে সব সেট করুন।';

  @override
  String get tourSafety3 =>
      'শনাক্তকরণ ও জোন অনুমানমাত্র। এগুলো ভুল হতে পারে বা বাদ পড়তে পারে।';

  @override
  String get tourSafety4 => 'নিরাপদে গাড়ি চালানোর দায়িত্ব আপনার।';

  @override
  String get helpTakeTour => 'ট্যুর নিন';

  @override
  String get helpTakeTourSub => 'ড্রাইভ স্ক্রিনের এক মিনিটের গাইডেড পরিচিতি।';

  @override
  String get tripsTitle => 'ট্রিপ';

  @override
  String get tripsOpen => 'ট্রিপ লগ';

  @override
  String get tripsEmptyTitle => 'এখনও কোনো ট্রিপ নেই';

  @override
  String get tripsEmptyBody =>
      'Corvista নিয়ে গাড়ি চালালে ট্রিপ স্বয়ংক্রিয়ভাবে রেকর্ড হয় — দূরত্ব, সময়, গতি এবং আপনার নেওয়া রুট।';

  @override
  String get tripsDisabledBody =>
      'ট্রিপ লগ বন্ধ, তাই নতুন যাত্রা রেকর্ড হচ্ছে না। এই iPhone-এ আপনার রুটের একটি ব্যক্তিগত লগ রাখতে এটি চালু করুন।';

  @override
  String get tripsEnable => 'ট্রিপ লগ চালু করুন';

  @override
  String get tripsToday => 'আজ';

  @override
  String get tripsYesterday => 'গতকাল';

  @override
  String tripsRecordingNow(String distance) {
    return 'ট্রিপ রেকর্ড হচ্ছে · $distance';
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
      other: '$countটি ঘটনা',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি সতর্কতা',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ট্রিপ',
      zero: 'কোনো ট্রিপ নেই',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'দূরত্ব';

  @override
  String get tripsStatDuration => 'সময়কাল';

  @override
  String get tripsStatMoving => 'চলার সময়';

  @override
  String get tripsStatAvgSpeed => 'গড় গতি';

  @override
  String get tripsStatMaxSpeed => 'সর্বোচ্চ গতি';

  @override
  String get tripsDetections => 'শনাক্তকরণ';

  @override
  String get tripsNoDetections => 'এই ট্রিপে রাস্তার কোনো অবজেক্ট লগ হয়নি।';

  @override
  String get tripsTimeline => 'টাইমলাইন';

  @override
  String get tripsEventStart => 'ট্রিপ শুরু হয়েছে';

  @override
  String get tripsEventEnd => 'ট্রিপ শেষ হয়েছে';

  @override
  String get tripsEventAlert => 'ভয়েস সতর্কতা';

  @override
  String get tripsEventIncident => 'ঘটনার ক্লিপ সংরক্ষিত';

  @override
  String get tripsEventEmergency => 'সম্ভাব্য সংঘর্ষ শনাক্ত হয়েছে';

  @override
  String get tripsEventNavStart => 'নেভিগেশন শুরু হয়েছে';

  @override
  String get tripsEventArrive => 'গন্তব্যে পৌঁছেছেন';

  @override
  String get tripsEventReroute => 'রুট নতুন করে গণনা করা হয়েছে';

  @override
  String get tripsEventRecording => 'রেকর্ডিং সংরক্ষিত';

  @override
  String get tripsOpenClip => 'ক্লিপ খুলুন';

  @override
  String get tripsTrackPreview => 'GPS ট্র্যাক';

  @override
  String get tripsRenameTitle => 'ট্রিপের নাম পরিবর্তন';

  @override
  String get tripsRenameHint => 'ট্রিপের নাম';

  @override
  String get tripsFavorite => 'প্রিয়তে যোগ করুন';

  @override
  String get tripsUnfavorite => 'প্রিয় থেকে সরান';

  @override
  String get tripsShareGpx => 'GPX শেয়ার করুন';

  @override
  String get tripsShareFailed => 'এই ট্রিপ শেয়ার করা যায়নি।';

  @override
  String get tripsDelete => 'ট্রিপ মুছুন';

  @override
  String get tripsDeleteConfirmTitle => 'এই ট্রিপ মুছবেন?';

  @override
  String get tripsDeleteConfirmBody =>
      'রুট ও পরিসংখ্যান এই iPhone থেকে সরিয়ে ফেলা হবে। এই ট্রিপের ঘটনার ক্লিপগুলো থেকে যাবে।';

  @override
  String get tripsDeleted => 'ট্রিপ মোছা হয়েছে';

  @override
  String get tripsNotFound => 'এই ট্রিপ আর উপলব্ধ নেই।';

  @override
  String get tripsPrivacyNote =>
      'শুধু এই iPhone-এ সংরক্ষিত। কিছুই আপলোড হয় না।';

  @override
  String get settingsSectionTrips => 'ট্রিপ লগ';

  @override
  String get settingsTripLog => 'ট্রিপ রেকর্ড করুন';

  @override
  String get settingsTripLogSubtitle =>
      'আপনার রুট ও ড্রাইভের পরিসংখ্যান শুধু এই iPhone-এ রাখে।';

  @override
  String get settingsTripRetention => 'ট্রিপ রাখুন';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days দিন',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 বছর';

  @override
  String get settingsRetentionForever => 'চিরকাল';

  @override
  String get settingsTripRetentionFooter =>
      'Corvista চালু হলে পুরনো ট্রিপ স্বয়ংক্রিয়ভাবে মুছে ফেলা হয়।';

  @override
  String get settingsViewTrips => 'ট্রিপ দেখুন';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours ঘণ্টা $minutes মিনিট';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes মিনিট';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista ট্রিপ $date';
  }

  @override
  String get settingsFreeUpSpace => 'জায়গা খালি করুন';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'অস্থায়ী ফাইল ও ক্যাশ সরায়। সংরক্ষিত ক্লিপ ও ট্রিপ থেকে যায়।';

  @override
  String settingsFreedBytes(String size) {
    return '$size খালি হয়েছে';
  }

  @override
  String get settingsNothingToFree =>
      'ক্যাশ পরিষ্কার হয়েছে — সরানোর মতো কোনো অস্থায়ী ফাইল নেই।';

  @override
  String get settingsSectionPrivacyData => 'গোপনীয়তা ও ডেটা';

  @override
  String get settingsPrivacyDataFooter =>
      'ক্লিপ, ট্রিপ ও সেটিংস শুধু এই iPhone-এ থাকে। আপনি শেয়ার করা বেছে নিলেই কেবল সেগুলো এখান থেকে বাইরে যায়।';

  @override
  String get settingsDeleteAllData => 'সব ডেটা মুছুন';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'এই iPhone থেকে ক্লিপ, ট্রিপ, যোগাযোগ ও সেটিংস মুছে ফেলুন';

  @override
  String get deleteAllTitle => 'সব ডেটা মুছবেন?';

  @override
  String get deleteAllMessage =>
      'এটি এই iPhone থেকে স্থায়ীভাবে মুছে ফেলবে:\n• ঘটনার ক্লিপ ও থাম্বনেইল\n• ট্রিপ লগ ও GPS ট্র্যাক\n• জরুরি যোগাযোগ ও জরুরি ঘটনা\n• শনাক্তকরণ লগ ও ডায়াগনস্টিক লগ\n• সেটিংস ও সাম্প্রতিক গন্তব্য\n• অস্থায়ী রেকর্ডিং বাফার ও ক্যাশ\n\nএটি ফেরানো যাবে না। এরপর Corvista স্বাগত স্ক্রিন থেকে নতুন করে শুরু হবে।';

  @override
  String get deleteAllConfirm => 'সব মুছুন';

  @override
  String get deleteAllInProgress => 'মোছা হচ্ছে…';

  @override
  String get deleteAllDone => 'সব ডেটা মোছা হয়েছে';

  @override
  String get deleteAllPartial =>
      'কিছু আইটেম মোছা যায়নি। সেটিংস থেকে আবার চেষ্টা করুন।';

  @override
  String get diagLogSection => 'ডায়াগনস্টিক লগ';

  @override
  String get diagLogFooter =>
      'ত্রুটি শুধু এই iPhone-এ রেকর্ড হয়, লোকেশন, যোগাযোগের নাম বা ফোন নম্বর ছাড়া। আপনি নিজে লগ শেয়ার না করলে কিছুই পাঠানো হয় না।';

  @override
  String get diagLogShare => 'ডায়াগনস্টিক লগ শেয়ার করুন';

  @override
  String get diagLogEmpty => 'খালি';

  @override
  String get diagLogClear => 'লগ মুছুন';

  @override
  String get diagLogClearTitle => 'ডায়াগনস্টিক লগ মুছবেন?';

  @override
  String get diagLogClearBody =>
      'সংরক্ষিত ত্রুটির এন্ট্রি এই iPhone থেকে মুছে যাবে।';

  @override
  String get diagLogCleared => 'ডায়াগনস্টিক লগ মোছা হয়েছে';

  @override
  String get diagLogShareFailed => 'ডায়াগনস্টিক লগ শেয়ার করা যায়নি।';

  @override
  String get privacyControls2 =>
      'সেটিংস › গোপনীয়তা ও ডেটা › সব ডেটা মুছুন এই iPhone-এ Corvista-র সংরক্ষিত প্রতিটি ক্লিপ, ট্রিপ, যোগাযোগ, লগ ও সেটিং মুছে দেয়।';

  @override
  String get parkingZoneStop => 'থামুন';

  @override
  String get parkingZoneVeryClose => 'খুব কাছে';

  @override
  String get parkingZoneClose => 'কাছে';

  @override
  String get parkingZoneNothingClose => 'কাছে কিছু দেখা যায়নি';

  @override
  String get parkingNotDetected =>
      'দেয়াল, খুঁটি, পোল ও রাস্তার কিনারা শনাক্ত হয় না';

  @override
  String get parkingApprox => 'আনুমানিক';

  @override
  String get parkingSideLeft => 'বাম';

  @override
  String get parkingSideCenter => 'মাঝ';

  @override
  String get parkingSideRight => 'ডান';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => 'শুধু সামনের ক্যামেরার ভিউ — ৩৬০° সিস্টেম নয়';

  @override
  String get parkingMuteBeeps => 'বিপ বন্ধ করুন';

  @override
  String get parkingUnmuteBeeps => 'বিপ চালু করুন';

  @override
  String get parkingAbout => 'পার্কিং ভিউ সম্পর্কে';

  @override
  String get parkingLimitationsDetail =>
      'শুধু ক্যামেরার সামনের এলাকা পর্যবেক্ষণ করা হয়। ডিটেক্টর গাড়ি, বাস ও ট্রাক, মানুষ, সাইকেল এবং মোটরসাইকেল চিনতে পারে। দেয়াল, খুঁটি, পোল, রাস্তার কিনারা, বোলার্ড, বেষ্টনী ও নিচু বাধা শনাক্ত হয় না, এবং বনেট ঠিক সামনের মাটি আড়াল করতে পারে। দূরত্ব একটি ক্যামেরা থেকে (বস্তুর আকার ও অবস্থান দেখে) মোটামুটি অনুমান মাত্র, এবং অনেক ভুল হতে পারে। শব্দ না থাকা বা “কাছে কিছু দেখা যায়নি” মানে পথ পরিষ্কার নয় — সবসময় চারপাশ দেখুন এবং আয়না ব্যবহার করুন।';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'পাশ অনুযায়ী নৈকট্য: বাম $left, মাঝ $center, ডান $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'ত্রুটি এই iPhone-এর একটি ব্যক্তিগত লগে লেখা হয় (লোকেশন, যোগাযোগের নাম বা ফোন নম্বর ছাড়া)। এটি কখনও নিজে থেকে পাঠানো হয় না; সেটিংস › ডায়াগনস্টিক্সে গিয়ে শেয়ার বা মুছতে পারেন।';
}
