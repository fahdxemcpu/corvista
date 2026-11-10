// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Her yolculukta daha fazlasını görün.';

  @override
  String get commonCancel => 'Vazgeç';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonBack => 'Geri';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonRetry => 'Tekrar dene';

  @override
  String get commonOpenSettings => 'Ayarları Aç';

  @override
  String get commonLoading => 'Yükleniyor…';

  @override
  String get commonError => 'Bir sorun oluştu.';

  @override
  String commonErrorDetail(String message) {
    return 'Bir sorun oluştu: $message';
  }

  @override
  String get commonOn => 'Açık';

  @override
  String get commonOff => 'Kapalı';

  @override
  String get commonRename => 'Yeniden adlandır';

  @override
  String get commonShare => 'Paylaş';

  @override
  String get commonNotAvailable => 'Kullanılamıyor';

  @override
  String get commonTestFootage => 'TEST GÖRÜNTÜSÜ';

  @override
  String get zoneVeryClose => 'Çok yakın';

  @override
  String get zoneClose => 'Yakın';

  @override
  String get zoneMedium => 'Orta';

  @override
  String get zoneFar => 'Uzak';

  @override
  String get zoneUnknown => 'Bilinmiyor';

  @override
  String get classPerson => 'Kişi';

  @override
  String get classBicycle => 'Bisiklet';

  @override
  String get classMotorcycle => 'Motosiklet';

  @override
  String get classCar => 'Araç';

  @override
  String get classBus => 'Otobüs';

  @override
  String get classTrafficLight => 'Trafik ışığı';

  @override
  String get classStopSign => 'Dur işareti';

  @override
  String get viewDetection => 'Algılama';

  @override
  String get viewVirtual => 'Sanal';

  @override
  String get viewMap => 'Harita';

  @override
  String get viewParking => 'Park';

  @override
  String get viewPerception => 'Algı';

  @override
  String get unitKmh => 'km/sa';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Kırmızı';

  @override
  String get lightYellow => 'Sarı';

  @override
  String get lightGreen => 'Yeşil';

  @override
  String get lightUnknown => 'Bilinmiyor';

  @override
  String get clipsTitle => 'Klipler';

  @override
  String get clipsSelect => 'Seç';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seçili',
      one: '1 seçili',
      zero: 'Klip seçin',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Tümünü seç';

  @override
  String get clipsDeselectAll => 'Seçimi kaldır';

  @override
  String get clipsDeleteSelected => 'Seçilenleri sil';

  @override
  String get clipsGridView => 'Izgara görünümü';

  @override
  String get clipsListView => 'Liste görünümü';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip silinsin mi?',
      one: 'Bu klip silinsin mi?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bu videolar iPhone’unuzdan kalıcı olarak kaldırılır. Bu işlem geri alınamaz.',
      one: 'Video iPhone’unuzdan kalıcı olarak kaldırılır. Bu işlem geri alınamaz.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip silindi',
      one: 'Klip silindi',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Henüz klip yok';

  @override
  String get clipsEmptyBody =>
      'Sürüş sırasında Corvista kısa bir döngüsel arabellek tutar. Son saniyelerin görüntüsünü burada saklamak için Olayı Kaydet’e dokunun.';

  @override
  String get clipsLoadError => 'Klipleriniz yüklenemedi.';

  @override
  String get clipsStorageTitle => 'Depolama';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Klipler $clips · Arabellek $buffer · $free boş';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kayıtlı klip',
      one: '1 kayıtlı klip',
      zero: 'Kayıtlı klip yok',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'iPhone’unuzun depolama alanı azaldı. Yeni olaylar kaydedilemeyebilir.';

  @override
  String get clipsMissingFile => 'Dosya eksik';

  @override
  String get clipsEmergencyBadge => 'Çarpma';

  @override
  String clipsUntitled(String date) {
    return 'Olay · $date';
  }

  @override
  String get clipsAudio => 'Ses kaydedildi';

  @override
  String get clipsFavorite => 'Favori';

  @override
  String get clipsUnfavorite => 'Favorilerden kaldır';

  @override
  String get clipsLocation => 'Konum kaydedildi';

  @override
  String clipsOpenClip(String title) {
    return '$title klibini aç';
  }

  @override
  String get playerNotFoundTitle => 'Klip bulunamadı';

  @override
  String get playerNotFoundBody => 'Bu klip silinmiş olabilir.';

  @override
  String get playerMissingTitle => 'Video dosyası eksik';

  @override
  String get playerMissingBody =>
      'Bu klibin kaydı artık iPhone’unuzda değil. Girdiyi galerinizden kaldırabilirsiniz.';

  @override
  String get playerRemoveEntry => 'Girdiyi kaldır';

  @override
  String get playerLoadError => 'Bu video oynatılamıyor.';

  @override
  String get playerPlay => 'Oynat';

  @override
  String get playerPause => 'Duraklat';

  @override
  String get playerReplay => 'Yeniden oynat';

  @override
  String get playerRenameTitle => 'Klibi yeniden adlandır';

  @override
  String get playerRenameHint => 'Klip adı';

  @override
  String get playerRenamed => 'Klip yeniden adlandırıldı';

  @override
  String get playerFavorited => 'Favorilere eklendi';

  @override
  String get playerUnfavorited => 'Favorilerden kaldırıldı';

  @override
  String get playerShareFailed => 'Bu klip paylaşılamadı.';

  @override
  String get playerDetails => 'Ayrıntılar';

  @override
  String get playerDate => 'Kayıt tarihi';

  @override
  String get playerDuration => 'Süre';

  @override
  String get playerResolution => 'Çözünürlük';

  @override
  String get playerSize => 'Dosya boyutu';

  @override
  String get playerAudio => 'Ses';

  @override
  String get playerAudioYes => 'Kaydedildi';

  @override
  String get playerAudioNo => 'Kaydedilmedi';

  @override
  String get playerReason => 'Kaydeden';

  @override
  String get playerReasonManual => 'Olayı Kaydet düğmesi';

  @override
  String get playerReasonEmergency => 'Olası çarpma algılaması';

  @override
  String get playerReasonRecovered => 'Kesintiden sonra kurtarıldı';

  @override
  String get playerSpeed => 'Kayıt anındaki GPS hızı';

  @override
  String get playerLocation => 'Konum';

  @override
  String get playerOpenInMaps => 'Haritalar’da aç';

  @override
  String get playerBack => 'Geri';

  @override
  String get playerMore => 'Diğer eylemler';

  @override
  String get clipsFilterLabel => 'Göster';

  @override
  String get clipsFilterAll => 'Tümü';

  @override
  String get clipsFilterRecordings => 'Kayıtlar';

  @override
  String get clipsFilterIncidents => 'Olaylar';

  @override
  String get clipsFilterEmergency => 'Acil Durum';

  @override
  String get clipsFilterFavorites => 'Favoriler';

  @override
  String get clipsSort => 'Sırala';

  @override
  String get clipsSortNewest => 'Önce en yeni';

  @override
  String get clipsSortOldest => 'Önce en eski';

  @override
  String get clipsSortLongest => 'Önce en uzun';

  @override
  String get clipsSortLargest => 'Önce en büyük';

  @override
  String get clipsToday => 'Bugün';

  @override
  String get clipsYesterday => 'Dün';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip',
      one: '1 klip',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Bu kategoride henüz klip yok.';

  @override
  String get clipsFavoritesEmpty =>
      'Hızlı erişim için bir klibi yıldızlayın; burada kalsın.';

  @override
  String get clipsKindRecording => 'Kayıt';

  @override
  String get clipsKindIncident => 'Olay';

  @override
  String get clipsKindEmergency => 'Acil Durum';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Yolculuk · $time';
  }

  @override
  String get clipsOpenTrip => 'Bu klibin kaydedildiği yolculuğu aç';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used kullanılan · $free boş';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Klipler $size yer kaplıyor';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kayıt',
      one: '1 kayıt',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count olay',
      one: '1 olay',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count acil durum',
      one: '1 acil durum',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Yer aç';

  @override
  String get clipsStorageLowGentle =>
      '2 GB\'tan az boş yer var. Kaydı sorunsuz sürdürmek için yer açın veya artık ihtiyacınız olmayan klipleri silin.';

  @override
  String get clipsSaveToPhotos => 'Fotoğraflar\'a Kaydet';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip',
      one: '1 klip',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip ($size) silinsin mi?',
      one: 'Bu klip ($size) silinsin mi?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Fotoğraflar\'a kaydediliyor: $done/$total…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip Fotoğraflar\'a kaydedildi',
      one: 'Fotoğraflar\'a kaydedildi',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved Fotoğraflar\'a kaydedildi · $failed kaydedilemedi';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista\'nın Fotoğraflar\'a video eklemesine izin verilmiyor. Ayarlar\'dan izin verebilirsiniz.';

  @override
  String get clipsPhotosFailed => 'Fotoğraflar\'a kaydedilemedi.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip favorilere eklendi',
      one: 'Favorilere eklendi',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip favorilerden kaldırıldı',
      one: 'Favorilerden kaldırıldı',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (kırpıldı)';
  }

  @override
  String get playerTrim => 'Kırp';

  @override
  String get playerInfo => 'Bilgi';

  @override
  String get playerKind => 'Tür';

  @override
  String get playerReasonRecording => 'Kayıt düğmesi';

  @override
  String get trimTitle => 'Klibi kırp';

  @override
  String get trimHint =>
      'Tutulacak bölümü seçmek için tutamaçları sürükleyin. Özgün klip değişmez.';

  @override
  String get trimStartHandle => 'Kırpma başlangıcı';

  @override
  String get trimEndHandle => 'Kırpma bitişi';

  @override
  String trimSelection(String duration) {
    return '$duration seçildi';
  }

  @override
  String get trimSave => 'Yeni klip olarak kaydet';

  @override
  String get trimSaving => 'Kırpılan klip kaydediliyor…';

  @override
  String get trimSaved => 'Kırpılan klip kaydedildi';

  @override
  String get trimOpenNew => 'Aç';

  @override
  String get trimFailed => 'Bu klip kırpılamadı.';

  @override
  String get trimStorageFull =>
      'Kırpılan klibi kaydetmek için yeterli boş yer yok.';

  @override
  String get trimPreview => 'Seçimi oynat';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'Yapay Zeka';

  @override
  String get settingsSectionAlerts => 'Uyarılar';

  @override
  String get settingsSectionAlertCategories => 'Uyarı kategorileri';

  @override
  String get settingsSectionRecording => 'Kayıt';

  @override
  String get settingsSectionDriving => 'Sürüş';

  @override
  String get settingsSectionPower => 'Güç';

  @override
  String get settingsSectionEmergency => 'Acil Durum';

  @override
  String get settingsSectionAppearance => 'Görünüm';

  @override
  String get settingsSectionLanguage => 'Dil';

  @override
  String get settingsSectionInformation => 'Bilgi';

  @override
  String get settingsCameraLens => 'Kamera lensi';

  @override
  String get settingsLensWide => 'Geniş';

  @override
  String get settingsLensUltraWide => 'Ultra Geniş';

  @override
  String get settingsLensTelephoto => 'Telefoto';

  @override
  String get settingsLensUnavailable => 'Bu iPhone’da kullanılamıyor';

  @override
  String get settingsStabilization => 'Sabitleme';

  @override
  String get settingsStabAuto => 'Otomatik';

  @override
  String get settingsStabOff => 'Kapalı';

  @override
  String get settingsStabStandard => 'Standart';

  @override
  String get settingsStabCinematic => 'Sinematik';

  @override
  String get settingsOverlayOpacity => 'Katman opaklığı';

  @override
  String get settingsShowFps => 'Performans bilgilerini göster';

  @override
  String get settingsShowFpsSubtitle =>
      'Algılama görünümünde kare hızı ve çıkarım süresi';

  @override
  String get settingsCameraFooter =>
      'Lens ve sabitleme değişiklikleri kamera bir sonraki başlatıldığında uygulanır.';

  @override
  String get settingsAiModel => 'Yapay zeka modeli';

  @override
  String get settingsConfidence => 'Algılama güveni';

  @override
  String get settingsTracking => 'Nesne takibi';

  @override
  String get settingsTrackingSubtitle =>
      'Nesneleri kareler arasında kararlı tutar';

  @override
  String get settingsShowLabels => 'Etiketleri göster';

  @override
  String get settingsShowConfidence => 'Güveni göster';

  @override
  String get settingsSegmentationOpacity => 'Algı maskesi opaklığı';

  @override
  String get settingsAiFooter =>
      'Daha düşük güven daha fazla nesne gösterir, ancak daha fazla yanlış algılama da getirir. Algılamalar hatalı olabilir.';

  @override
  String get settingsVoiceAlerts => 'Sesli uyarılar';

  @override
  String get settingsVoiceLanguage => 'Ses dili';

  @override
  String get settingsVoiceLanguageAuto => 'Uygulama diliyle aynı';

  @override
  String get settingsVoice => 'Ses';

  @override
  String get settingsVoiceDefault => 'Sistem varsayılanı';

  @override
  String get settingsVoiceQualityEnhanced => 'Geliştirilmiş';

  @override
  String get settingsVoiceQualityPremium => 'Yüksek kalite';

  @override
  String get settingsNoVoices =>
      'Bu dil için yüklü ses yok. iOS Ayarlar › Erişilebilirlik › Seslendirilen İçerik bölümünden ekleyin.';

  @override
  String get settingsAlertPedestrian => 'Yayalar';

  @override
  String get settingsAlertCyclist => 'Bisikletliler';

  @override
  String get settingsAlertMotorcycle => 'Motosikletler';

  @override
  String get settingsAlertBus => 'Otobüsler';

  @override
  String get settingsAlertVehicleClose => 'Önde çok yakın araç';

  @override
  String get settingsAlertTrafficLight => 'Trafik ışığı değişimleri';

  @override
  String get settingsAlertTrafficMoving => 'Öndeki trafik hareketleniyor';

  @override
  String get settingsAlertStopSign => 'Dur işaretleri';

  @override
  String get settingsSensitivity => 'Hassasiyet';

  @override
  String get settingsSensitivityLow => 'Düşük';

  @override
  String get settingsSensitivityMedium => 'Orta';

  @override
  String get settingsSensitivityHigh => 'Yüksek';

  @override
  String get settingsCooldown => 'Tekrar aralığı';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds sn';
  }

  @override
  String get settingsVolume => 'Ses seviyesi';

  @override
  String get settingsQuietMode => 'Sessiz mod';

  @override
  String get settingsQuietModeSubtitle =>
      'Yalnızca en önemli uyarılar seslendirilir';

  @override
  String get settingsTestVoice => 'Sesi dene';

  @override
  String get settingsTestVoiceDone => 'Örnek uyarı oynatılıyor…';

  @override
  String get settingsParkingBeeps => 'Park sesleri';

  @override
  String get settingsBeepVolume => 'Bip ses seviyesi';

  @override
  String get settingsAlertsFooter =>
      'Uyarılar yalnızca bir yardımcıdır. Her zaman yolu izleyin; sessizlik yolun açık olduğu anlamına gelmez.';

  @override
  String get settingsRecordingProfile => 'Kayıt kalitesi';

  @override
  String get settingsProfileStandard => 'Standart · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Olay arabelleği';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds saniye';
  }

  @override
  String get settingsManualMaxLength => 'Manuel kaydın en uzun süresi';

  @override
  String get settingsManualMaxUnlimited => 'Sınırsız';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes dk';
  }

  @override
  String get settingsRecordAudio => 'Ses kaydet';

  @override
  String get settingsRecordAudioSubtitle =>
      'Kaydedilen olaylara araç içi sesi ekler';

  @override
  String get settingsMicDenied =>
      'Mikrofon erişimi kapalı. Ses kaydetmek için Ayarlar’dan izin verin.';

  @override
  String get settingsWatermark => 'Corvista filigranı';

  @override
  String get settingsTimestamp => 'Tarih ve saat damgası';

  @override
  String get settingsSaveLocation => 'Konumu kliplerle kaydet';

  @override
  String get settingsStorage => 'Depolama ve klipler';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip',
      one: '1 klip',
      zero: 'Klip yok',
    );
    return '$_temp0 · $used kullanılan · $free boş';
  }

  @override
  String get settingsRecordingFooter =>
      'Döngüsel arabellek iPhone’unuzda kalır ve sürekli üzerine yazılır. Arka planda hiçbir şey kaydedilmez.';

  @override
  String get settingsDefaultView => 'Varsayılan görünüm';

  @override
  String get settingsUnits => 'Birimler';

  @override
  String get settingsShowCompass => 'Pusulayı göster';

  @override
  String get settingsHudStyle => 'HUD stili';

  @override
  String get settingsHudCustomize => 'HUD’u özelleştir';

  @override
  String get settingsDrivingSide => 'Sürüş tarafı';

  @override
  String get settingsDrivingSideAuto => 'Otomatik';

  @override
  String get settingsDrivingSideRight => 'Sağ';

  @override
  String get settingsDrivingSideLeft => 'Sol';

  @override
  String get settingsVirtualStyle => 'Sanal görünüm stili';

  @override
  String get settingsVirtualMinimal => 'Minimal';

  @override
  String get settingsVirtualPerspective => 'Perspektif';

  @override
  String get settingsVirtualHighContrast => 'Yüksek kontrast';

  @override
  String get settingsKeepScreenOn => 'Sürüş sırasında ekranı açık tut';

  @override
  String get settingsLiveActivity => 'Canlı Etkinlik';

  @override
  String get settingsLiveActivityDesc =>
      'Adım adım yol tarifini Kilit Ekranı\'nda ve Dynamic Island\'da göster';

  @override
  String get driveRecordingPausedBackground =>
      'Corvista arka plandayken kayıt duraklatıldı';

  @override
  String get liveActivityRec => 'KAYIT';

  @override
  String get liveActivityPaused => 'Duraklatıldı';

  @override
  String get liveActivityDashcamOff => 'Kamera kapalı';

  @override
  String get liveActivityEnded => 'Navigasyon sona erdi';

  @override
  String get liveActivityEta => 'Varış';

  @override
  String get settingsAutoRecenter => 'Haritayı otomatik ortala';

  @override
  String get settingsHudStyleClassic => 'Klasik';

  @override
  String get settingsHudStyleGrid => 'Izgara';

  @override
  String get settingsHudStyleMinimal => 'Minimal';

  @override
  String get settingsHudStylePerformance => 'Performans';

  @override
  String get settingsHudStyleNavigation => 'Navigasyon';

  @override
  String get settingsHudStyleNight => 'Gece';

  @override
  String get settingsHudStyleHighContrast => 'Yüksek kontrast';

  @override
  String get settingsPowerMode => 'Güç modu';

  @override
  String get settingsPowerBalanced => 'Dengeli';

  @override
  String get settingsPowerPerformance => 'Performans';

  @override
  String get settingsPowerSaver => 'Güç tasarrufu';

  @override
  String get settingsPowerFooter =>
      'iPhone’unuz ısındığında veya pil azaldığında Corvista yapay zeka hızını ve görsel efektleri otomatik olarak düşürür.';

  @override
  String get settingsThermal => 'Isı durumu';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Ilık';

  @override
  String get settingsThermalSerious => 'Sıcak';

  @override
  String get settingsThermalCritical => 'Kritik';

  @override
  String get settingsBattery => 'Pil';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Şarj oluyor';
  }

  @override
  String get settingsLowPowerMode =>
      'Düşük Güç Modu açık: yapay zeka düşük hızda çalışıyor.';

  @override
  String get settingsAiRate => 'Güncel yapay zeka hızı';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Çarpma algılama';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Açık · $seconds sn geri sayım';
  }

  @override
  String get settingsEmergencyFooter =>
      'Deneyseldir. Acil servislerin yerini tutmaz.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeDark => 'Koyu';

  @override
  String get settingsThemeLight => 'Açık';

  @override
  String get settingsReduceMotion => 'Hareketi azalt';

  @override
  String get settingsReduceMotionSubtitle =>
      'Uygulama genelinde animasyonları en aza indirir';

  @override
  String get settingsAppLanguage => 'Uygulama dili';

  @override
  String get settingsPrivacyPolicy => 'Gizlilik Politikası';

  @override
  String get settingsTerms => 'Kullanım Koşulları';

  @override
  String get settingsHelp => 'Yardım';

  @override
  String get settingsSupport => 'Destekle iletişime geç';

  @override
  String get settingsLicenses => 'Açık kaynak lisansları';

  @override
  String get settingsSupportUnavailable =>
      'Mail açılamadı. support@corvista.app adresine yazın.';

  @override
  String get settingsSafety => 'Güvenlik bilgileri';

  @override
  String get settingsDiagnostics => 'Tanılama';

  @override
  String get settingsVersion => 'Sürüm';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'HUD’u özelleştir';

  @override
  String get hudCustomPreview => 'Önizleme · örnek değerler';

  @override
  String get hudCustomStyle => 'Stil';

  @override
  String get hudCustomElements => 'Öğeler';

  @override
  String get hudCustomSpeed => 'Hız';

  @override
  String get hudCustomHeading => 'Yön ve pusula';

  @override
  String get hudCustomClock => 'Saat';

  @override
  String get hudCustomBattery => 'Pil ve ısı';

  @override
  String get hudCustomDetections => 'Yapay zeka durumu ve algılamalar';

  @override
  String get hudCustomWeather => 'Hava durumu';

  @override
  String get hudCustomAppearance => 'Boyut ve opaklık';

  @override
  String get hudCustomSize => 'Boyut';

  @override
  String get hudCustomOpacity => 'Opaklık';

  @override
  String get hudCustomFooter =>
      'Aşırı ısınma gibi uyarılar, öğeler gizli olsa bile her zaman gösterilir.';

  @override
  String get hudCustomDescClassic => 'Dengeli gösterge paneli';

  @override
  String get hudCustomDescGrid => 'Yolun üzerinde perspektif ızgarası';

  @override
  String get hudCustomDescMinimal => 'Yalnızca hız, başka bir şey yok';

  @override
  String get hudCustomDescPerformance => 'Canlı verilerle hız yayı';

  @override
  String get hudCustomDescNavigation => 'Önce bir sonraki manevra';

  @override
  String get hudCustomDescNight =>
      'Gece sürüşü için kısık ve kırmızıya kaydırılmış';

  @override
  String get hudCustomDescHighContrast => 'Parlak güneşte azami okunabilirlik';

  @override
  String get languageTitle => 'Dil';

  @override
  String get languageSystem => 'Sistem varsayılanı';

  @override
  String get languageSystemSubtitle => 'iPhone’unuzun dilini kullan';

  @override
  String get languageFooter =>
      'Daha fazla dil geliyor. Sesli uyarı dili, Uyarılar bölümünden ayrıca ayarlanabilir.';

  @override
  String get diagTitle => 'Tanılama';

  @override
  String get diagPerformance => 'Performans';

  @override
  String get diagInference => 'Çıkarım süresi';

  @override
  String get diagDetectHz => 'Algılama hızı';

  @override
  String get diagCameraFps => 'Kamera kare hızı';

  @override
  String get diagMemory => 'Bellek';

  @override
  String get diagDropped => 'Düşen kareler';

  @override
  String get diagSegmentation => 'Segmentasyon süresi';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Durum';

  @override
  String get diagSource => 'Kaynak';

  @override
  String get diagSourceCamera => 'Canlı kamera';

  @override
  String get diagSourceFile => 'Test görüntüsü dosyası';

  @override
  String get diagResolution => 'Arabellek boyutu';

  @override
  String get diagLens => 'Lens';

  @override
  String get diagError => 'Son hata';

  @override
  String get diagModel => 'Yapay zeka modeli';

  @override
  String get diagModelLoad => 'Model yükleme süresi';

  @override
  String get diagPower => 'Güç';

  @override
  String get diagSegHz => 'Segmentasyon hızı';

  @override
  String get diagReduced => 'Azaltılmış efektler';

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
  String get diagCamIdle => 'Boşta';

  @override
  String get diagCamStarting => 'Başlıyor';

  @override
  String get diagCamRunning => 'Çalışıyor';

  @override
  String get diagCamInterrupted => 'Kesintiye uğradı';

  @override
  String get diagCamStopped => 'Durduruldu';

  @override
  String get diagCamUnavailable => 'Kullanılamıyor';

  @override
  String get diagCamPermissionDenied => 'İzin reddedildi';

  @override
  String get diagCamError => 'Hata';

  @override
  String get diagTestFootage => 'Test görüntüsü';

  @override
  String get diagTestFootageBody =>
      'Kamera yerine yerel bir video dosyası üzerinde cihazda gerçek algılama çalıştırın. Her görünüm bunu TEST GÖRÜNTÜSÜ olarak etiketler.';

  @override
  String get diagPathLabel => 'Video dosyası yolu';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Documents/test_drive.mp4 kullan';

  @override
  String get diagRun => 'Test görüntüsünü çalıştır';

  @override
  String get diagRunStarted =>
      'Test görüntüsü başladı. Görmek için sürüş görünümünü açın.';

  @override
  String get diagBackToCamera => 'Canlı kameraya dön';

  @override
  String get diagDebugOnly =>
      'Test görüntüsü yalnızca geliştirme sürümlerinde kullanılabilir.';

  @override
  String get diagFileMissing => 'Bu yolda dosya yok.';

  @override
  String get emergencySetupTitle => 'Çarpma algılama';

  @override
  String get emergencyExperimental => 'Deneysel';

  @override
  String get emergencyIntro =>
      'Sürüş sırasında Corvista, iPhone’unuzun hareket sensörlerini kullanarak olası şiddetli bir çarpmayı izleyebilir. Biri algılanırsa geri sayım başlar. İptal etmezseniz Corvista acil servisleri aramayı ve kişilerinize mesaj göndermeyi önerir.';

  @override
  String get emergencyDisclaimer1 =>
      'Acil servislerin veya aracınızın kendi kaza algılamasının yerini tutmaz.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS, arama yapılmadan veya mesaj gönderilmeden önce her zaman onayınızı ister.';

  @override
  String get emergencyDisclaimer3 =>
      'Çarpmalar gözden kaçabilir; sert frenleme veya tümsekler çarpma sanılabilir.';

  @override
  String get emergencyParkedWarning =>
      'Bu kurulumu aracınız park halindeyken tamamlayın. Araç hareket halindeyken ayarlar kilitlenir.';

  @override
  String get emergencyEnable => 'Çarpma algılamayı etkinleştir';

  @override
  String get emergencyEnableSubtitle =>
      'Yalnızca sürüş oturumu sırasında etkin';

  @override
  String get emergencyNeedNumber => 'Önce bir acil durum numarası ekleyin.';

  @override
  String get emergencyContacts => 'Acil durum kişileri';

  @override
  String get emergencyAddContact => 'Kişi ekle';

  @override
  String get emergencyNoContacts =>
      'Henüz kişi yok. Kişilere yalnızca siz onayladıktan sonra mesaj gönderilir.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '$name kaldırılsın mı?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Bu kişi, çarpmadan sonra alıcı olarak önerilmeyecek.';

  @override
  String get emergencyRemove => 'Kaldır';

  @override
  String get emergencyContactsError => 'Kişiler yüklenemedi.';

  @override
  String get emergencyNumber => 'Acil durum numarası';

  @override
  String get emergencyNumberHint => 'ör. 112 veya 911';

  @override
  String get emergencyMessage => 'Mesaj şablonu';

  @override
  String get emergencyMessageDefault =>
      'Bir araç kazası geçirmiş olabilirim. Bu mesaj Corvista tarafından hazırlandı ve varsa bilinen son konumumu içerir.';

  @override
  String get emergencyMessageHint =>
      'Varsayılan mesajı kullanmak için boş bırakın.';

  @override
  String get emergencyCountdown => 'Geri sayım süresi';

  @override
  String get emergencyVoiceCancel => 'Sesle iptal';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Geri sayım sırasında “İyiyim” veya “İptal” deyin. Mümkün olduğunda cihazdaki konuşma tanımayı kullanır.';

  @override
  String get emergencyVoicePermDenied =>
      'Sesle iptal için mikrofon ve konuşma tanıma erişimi gerekir.';

  @override
  String get emergencyAutoSave => 'Olay klibini otomatik kaydet';

  @override
  String get emergencyTest => 'Geri sayımı dene (arama yapılmaz)';

  @override
  String get emergencyTestBody =>
      'Geri sayımı görmeniz için simüle edilmiş bir çarpma çalıştırır. Test modunda hiçbir arama veya mesaj yapılmaz.';

  @override
  String get emergencyNotSet => 'Ayarlanmadı';

  @override
  String get emergencyAlertHeadline => 'Olası şiddetli çarpma algılandı.';

  @override
  String get emergencyAlertSubtitle => 'İyi misiniz?';

  @override
  String get emergencyAlertCancel => 'İyiyim — İptal';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds saniye kaldı',
      one: '1 saniye kaldı',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Dinleniyor — iptal etmek için “İyiyim” deyin';

  @override
  String emergencyAlertHeard(String text) {
    return 'Duyulan: “$text”';
  }

  @override
  String get emergencyAlertEscalated => 'Yanıt yok. Ne yapacağınızı seçin:';

  @override
  String get emergencyAlertCall => 'Acil servisleri ara';

  @override
  String emergencyAlertCallNumber(String number) {
    return '$number aranır. iOS onayınızı ister.';
  }

  @override
  String get emergencyAlertMessage => 'Kişilere mesaj gönder';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Hazır bir mesaj açar. Göndermeyi siz seçersiniz.';

  @override
  String get emergencyAlertTestMode => 'Test modu — arama yapılmayacak';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'İyiyim — Kapat';

  @override
  String get emergencyMsgSent => 'Mesaj gönderildi.';

  @override
  String get emergencyMsgCancelled => 'Mesaj gönderilmedi.';

  @override
  String get emergencyMsgFailed => 'Mesaj gönderilemedi.';

  @override
  String get emergencyMsgUnavailable => 'Bu cihazda mesajlaşma kullanılamıyor.';

  @override
  String emergencyCallFailed(String number) {
    return 'Arama başlatılamadı. $number numarasını kendiniz arayın.';
  }

  @override
  String get modelsTitle => 'Yapay Zeka Modelleri';

  @override
  String get modelsIntro =>
      'Tüm modeller uygulamayla birlikte gelir ve tamamen iPhone’unuzda çalışır. Kamera görüntünüz cihazdan asla ayrılmaz.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Canlı: kare başına $ms ms · $hz algılama/sn';
  }

  @override
  String modelsLastLoad(String ms) {
    return '$ms ms’de yüklendi';
  }

  @override
  String get modelsEfficientName => 'Verimli';

  @override
  String get modelsEfficientDesc =>
      'Düşük ısı ve pil kullanımıyla uzun sürüşler için ayarlanmış hızlı, kompakt algılayıcı.';

  @override
  String get modelsEnhancedName => 'Geliştirilmiş';

  @override
  String get modelsEnhancedDesc =>
      'Daha küçük ve uzaktaki nesneleri bulan, daha fazla güç tüketen daha büyük algılayıcı.';

  @override
  String get modelsSegmentationName => 'Segmentasyon';

  @override
  String get modelsSegmentationDesc =>
      'Hızlı algılamayı, Algı görünümü için yol yüzeyi ve nesne maskeleriyle birleştirir.';

  @override
  String get modelsNoneName => 'Yapay zeka duraklatıldı';

  @override
  String get modelsNoneDesc =>
      'Kamera ve kayıt, nesne algılama olmadan çalışmaya devam eder. En düşük güç kullanımı.';

  @override
  String get modelsGenericDesc => 'Cihazda çalışan nesne algılama modeli.';

  @override
  String get modelsFunctionDetection =>
      'Araçları, kişileri, bisikletleri, motosikletleri, otobüsleri, trafik ışıklarını ve dur işaretlerini algılar';

  @override
  String get modelsFunctionSegmentation =>
      'Yol yüzeyi ve nesne maskeleri ekler';

  @override
  String get modelsFunctionNone => 'Algılama yok; yalnızca araç kamerası kaydı';

  @override
  String get modelsSize => 'Boyut';

  @override
  String get modelsInput => 'Girdi';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Şunlarla çalışır';

  @override
  String get modelsStatusInstalled => 'Yüklü (uygulamayla birlikte)';

  @override
  String get modelsStatusNotInstalled => 'Yüklü değil';

  @override
  String get modelsSelected => 'Seçili';

  @override
  String get modelsUse => 'Bu modeli kullan';

  @override
  String get modelsSwitching => 'Model yükleniyor…';

  @override
  String modelsSwitched(String name) {
    return '$name artık etkin';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Bu cihazda ölçüldü: ortalama $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Bu cihazda ölçülmedi';

  @override
  String get modelsBenchmarkRun => 'Kıyaslamayı çalıştır';

  @override
  String get modelsBenchmarkRunning => 'Kıyaslama yapılıyor…';

  @override
  String get modelsBenchmarkSelectHint => 'Kıyaslamak için bu modeli seçin.';

  @override
  String get modelsBenchmarkDone => 'Kıyaslama tamamlandı';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Kıyaslama başarısız: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Son güncelleme: $date';
  }

  @override
  String get safetyTitle => 'Güvenlik bilgileri';

  @override
  String get safetyIntro =>
      'Corvista bir sürüş farkındalığı yardımcısıdır. Aracınızı kontrol etmez; kendi dikkatinizin, muhakemenizin veya aracın güvenlik sistemlerinin yerini tutamaz.';

  @override
  String get safetyBeforeTitle => 'Sürüşten önce';

  @override
  String get safetyBefore1 =>
      'iPhone’unuzu, görüşünüzü, hava yastıklarını veya kumandaları engellemeyen, yasal bir konuma sağlam şekilde sabitleyin.';

  @override
  String get safetyBefore2 =>
      'Kurulumu bitirin, bir görünüm seçin ve hedefinizi araç park halindeyken ayarlayın.';

  @override
  String get safetyBefore3 =>
      'Uzun sürüşlerde bir şarj cihazı bağlayın ve telefonu mümkünse doğrudan güneş ışığından uzak tutun.';

  @override
  String get safetyWhileTitle => 'Sürüş sırasında';

  @override
  String get safetyWhile1 =>
      'Gözlerinizi yolda tutun. Ekrandaki büyük kontrolleri yalnızca güvenli ve yasal olduğunda kullanın.';

  @override
  String get safetyWhile2 =>
      'Uyarılar yardımcıdır; güvenebileceğiniz uyarılar değildir. Sessizlik hiçbir zaman yolun açık olduğu anlamına gelmez.';

  @override
  String get safetyWhile3 =>
      'Çeliştiklerinde uygulamayı değil, trafik kurallarını, sinyalleri ve yol işaretlerini izleyin.';

  @override
  String get safetyLimitsTitle => 'Sınırlamalar';

  @override
  String get safetyLimits1 =>
      'Tek bir telefon kamerası yalnızca önündekini görür. Görüş alanı dışındaki, gizli veya çok yakın nesneler algılanmaz.';

  @override
  String get safetyLimits2 =>
      'Algılamalar kaçabilir, gecikebilir veya yanlış olabilir; özellikle gece, yağmurda, sisli havada, yansımada veya kirli ön camla.';

  @override
  String get safetyLimits3 =>
      'Yalnızca desteklenen kategoriler tanınır: araçlar, otobüsler, motosikletler, bisikletler, kişiler, trafik ışıkları ve dur işaretleri. Sanal görünümdeki şerit ipuçları stilize edilmiştir, algılanmış şeritler değildir.';

  @override
  String get safetyLimits4 =>
      'Yakınlık yaklaşık bölgeler olarak gösterilir (Çok yakın, Yakın, Orta, Uzak), asla ölçülmüş mesafe olarak değil. Park görünümü park sensörlerinin yerini tutmaz.';

  @override
  String get safetyHeatTitle => 'Isı ve pil';

  @override
  String get safetyHeat1 =>
      'Kamera ve yapay zekanın sürekli kullanımı iPhone’unuzu ısıtır. Cihaz ısındığında Corvista analiz hızını düşürür ve uyarı gösterir; iOS aşırı ısınırsa kamera durabilir.';

  @override
  String get safetyEmergencyTitle => 'Acil durum özelliği';

  @override
  String get safetyEmergency1 =>
      'Olası çarpma algılama deneyseldir. Gerçek kazaları kaçırabilir ve başka olaylarla tetiklenebilir.';

  @override
  String get safetyEmergency2 =>
      'Kimseyle sessizce iletişime geçmez: iOS arama veya mesaj için her zaman onayınızı ister. Acil servisleri kendiniz aramanın yerini tutmaz.';

  @override
  String get privacyTitle => 'Gizlilik';

  @override
  String get privacyIntro =>
      'Corvista, sürüş verilerinizi iPhone’unuzda tutacak şekilde tasarlanmıştır. Corvista hesabı yoktur ve Corvista kendi sunucularını işletmez.';

  @override
  String get privacyCameraTitle => 'Kamera ve yapay zeka';

  @override
  String get privacyCamera1 =>
      'Nesne algılama, takip ve segmentasyon tamamen iPhone’unuzda çalışır. Kamera kareleri asla yüklenmez.';

  @override
  String get privacyCamera2 =>
      'Kamera yalnızca Corvista ekranda açıkken çalışır. Uygulama arka plana geçtiğinde duraklar; gizli arka plan kaydı yoktur.';

  @override
  String get privacyRecordingsTitle => 'Kayıtlar';

  @override
  String get privacyRecordings1 =>
      'Döngüsel arabellek geçicidir ve sürekli üzerine yazılır. Görüntü yalnızca Olayı Kaydet’e dokunduğunuzda veya etkinleştirdiyseniz olası bir çarpmadan sonra saklanır.';

  @override
  String get privacyRecordings2 =>
      'Kayıtlı klipler iPhone’unuzda Corvista’nın özel depolama alanında kalır. Cihazdan yalnızca Paylaş’ı seçtiğinizde çıkarlar. Uygulamayı silmek onları da siler.';

  @override
  String get privacyRecordings3 =>
      'Ses yalnızca siz açarsanız ve mikrofon erişimi verirseniz kaydedilir.';

  @override
  String get privacyLocationTitle => 'Konum';

  @override
  String get privacyLocation1 =>
      'Konum, uygulama açıkken hızınız, harita, rotalar ve hava durumu için kullanılır. “Konumu kaydet” açıksa kayıt anındaki konum, klibin yanında cihazınızda saklanır.';

  @override
  String get privacyNetworkTitle => 'Ağ hizmetleri';

  @override
  String get privacyNetwork1 =>
      'Apple Maps: harita gösterimi, yer arama ve rotalar. Arama metniniz ve yaklaşık konumunuz Apple’a gönderilir.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit): konumunuz için güncel ve saatlik hava durumu.';

  @override
  String get privacyNetwork4 =>
      'Corvista reklam ve üçüncü taraf analiz veya izleme içermez.';

  @override
  String get privacyEmergencyTitle => 'Acil durum kişileri';

  @override
  String get privacyEmergency1 =>
      'Seçtiğiniz kişiler bu cihazdaki iOS Anahtar Zinciri’nde saklanır. Sesle iptal, mümkün olduğunda cihazdaki konuşma tanımayı kullanır. Aramalar ve mesajlar yalnızca iOS’ta onayladıktan sonra gönderilir.';

  @override
  String get privacyControlsTitle => 'Kontrol sizde';

  @override
  String get privacyControls1 =>
      'Klipleri istediğiniz zaman Klipler bölümünden silebilir; kamera, mikrofon, konum ve konuşma erişimini iOS Ayarlar’dan değiştirebilir veya geri alabilirsiniz.';

  @override
  String get termsTitle => 'Kullanım Koşulları';

  @override
  String get termsIntro =>
      'Corvista’yı kullanarak bu koşulları kabul etmiş olursunuz. Apple’ın standart Lisanslı Uygulama Son Kullanıcı Lisans Sözleşmesi de geçerlidir.';

  @override
  String get termsUseTitle => 'Corvista’yı kullanma';

  @override
  String get termsUse1 =>
      'Corvista bir sürüş farkındalığı ve araç kamerası yardımcısıdır. Güvenli ve yasalara uygun sürüşten her zaman tamamen siz sorumlusunuz.';

  @override
  String get termsUse2 =>
      'Uygulamayı sürüş sırasında dikkatinizi dağıtacak şekilde kullanmayın. Cihazı sağlam ve yasal biçimde sabitleyin.';

  @override
  String get termsAccuracyTitle => 'Doğruluk garantisi yoktur';

  @override
  String get termsAccuracy1 =>
      'Algılamalar, bölgeler, uyarılar, harita işaretleri, rotalar ve hava durumu eksik, gecikmeli veya yanlış olabilir. Corvista aracınızı kontrol etmez.';

  @override
  String get termsAccuracy2 =>
      'Acil durum özelliği deneyseldir; bir çarpmayı algılayamayabilir veya yanlışlıkla tetiklenebilir.';

  @override
  String get termsRecordingTitle => 'Kayıt yasaları';

  @override
  String get termsRecording1 =>
      'Araç kameraları, ses kaydı ve kişileri filme alma ile ilgili yasalar ülkeye ve bölgeye göre farklılık gösterir. Klip paylaşırken de dahil olmak üzere bunlara uymaktan siz sorumlusunuz.';

  @override
  String get termsLiabilityTitle => 'Sorumluluk';

  @override
  String get termsLiability1 =>
      'Uygulama “olduğu gibi” sunulur. Yasaların izin verdiği ölçüde geliştirici, uygulamanın kullanımından veya çıktılarına güvenilmesinden doğan kazalardan, kayıplardan, para cezalarından veya zararlardan sorumlu değildir.';

  @override
  String get termsChangesTitle => 'Değişiklikler';

  @override
  String get termsChanges1 =>
      'Bu koşullar uygulamanın yeni sürümleriyle güncellenebilir. Güncellemeden sonra kullanmaya devam etmeniz, revize edilmiş koşulları kabul ettiğiniz anlamına gelir.';

  @override
  String get helpTitle => 'Yardım';

  @override
  String get helpIntro =>
      'Sık sorulan soruların yanıtları. Güvenlik rehberliği için Güvenlik bilgileri’ne bakın.';

  @override
  String get helpQSave => 'Bir olayın görüntüsünü nasıl saklarım?';

  @override
  String get helpASaveBuffer =>
      'Sürüş görünümündeki büyük Olayı Kaydet düğmesine dokunun. Corvista, sürekli yenilenen arabelleğinin son 20 veya 30 saniyesini (Ayarlar › Kayıt\'taki seçiminize göre) Klipler\'e kaydeder.';

  @override
  String get helpQWhere => 'Kliplerim nerede saklanıyor?';

  @override
  String get helpAWhere =>
      'iPhone’unuzda Corvista’nın özel depolama alanında. Asla yüklenmezler. Bir klibi göndermek veya dışa aktarmak için oynatıcıdaki Paylaş’ı kullanın.';

  @override
  String get helpQZones => 'Yakınlık bölgeleri ne kadar doğru?';

  @override
  String get helpAZones =>
      'Bölgeler, tek bir kameradan tipik nesne boyutları kullanılarak yapılan kaba tahminlerdir. Bunları yaklaşık ipuçları olarak değerlendirin, asla mesafe olarak değil.';

  @override
  String get helpQSlow => 'Algılama neden yavaşlıyor?';

  @override
  String get helpASlow =>
      'iPhone’unuz ısındığında, pil azaldığında veya Düşük Güç Modu açıkken Corvista cihazı korumak için analiz hızını düşürür. Güç modunu Ayarlar’dan değiştirebilirsiniz.';

  @override
  String get helpQMap => 'Harita, arama veya hava durumu çalışmıyor.';

  @override
  String get helpAMap =>
      'Bu özellikler internet bağlantısı ve konum erişimi gerektirir. Bağlantınızı kontrol edin ve iOS Ayarlar’da Corvista için konuma izin verin.';

  @override
  String get helpQSimulator => 'Kamera kullanılamıyor görünüyor.';

  @override
  String get helpASimulator =>
      'iOS Ayarlar’da kamera erişimine izin verildiğinden ve kamerayı başka bir uygulamanın kullanmadığından emin olun. iOS Simulator’da kamera yoktur; bunun yerine yerel bir test videosu kullanılabilir.';

  @override
  String get emergencyMsgNoContacts => 'Önce bir acil durum kişisi ekleyin.';

  @override
  String get cameraStarting => 'Kamera başlatılıyor…';

  @override
  String get cameraInterrupted => 'Kamera duraklatıldı';

  @override
  String get cameraInterruptedBody =>
      'iOS kamerayı duraklattı; örneğin bir arama sırasında veya başka bir uygulama kullanırken. Otomatik olarak devam eder.';

  @override
  String get cameraUnavailable => 'Kamera kullanılamıyor';

  @override
  String get cameraUnavailableBody =>
      'Bu cihazda kamera yok. Algılama, kayıt ve park görünümleri arka kamerayı gerektirir.';

  @override
  String get cameraRunTestFootage => 'Test görüntüsünü çalıştır';

  @override
  String get cameraPermissionDenied => 'Kamera erişimi kapalı';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista; algılama, araç kamerası kaydı ve park görünümleri için kameraya ihtiyaç duyar. Ayarlar’da Kamera erişimini açın.';

  @override
  String get cameraError => 'Kamera hatası';

  @override
  String get cameraStopped => 'Kamera durduruldu';

  @override
  String get cameraStart => 'Kamerayı başlat';

  @override
  String get cameraFocusHint => 'Odaklamak için dokunun';

  @override
  String get cameraPreviewLabel => 'Algılanan nesnelerle canlı kamera görünümü';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · YZ $hz Hz · $ms ms · düşen $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Hız $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'GPS hızı yok';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Yön $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds sn';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Araç kamerası arabelleği kaydediyor, $target saniyenin $seconds saniyesi arabellekte';
  }

  @override
  String get hudRecIdle => 'REC kapalı';

  @override
  String get hudRecSaving => 'Kaydediliyor…';

  @override
  String get hudRecError => 'REC hatası';

  @override
  String get hudAiPaused => 'YZ duraklatıldı';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nesne',
      one: '1 nesne',
      zero: 'Nesne yok',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nesne algılandı',
      one: '1 nesne algılandı',
      zero: 'nesne algılanmadı',
    );
    return 'Yapay zeka modeli $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Sıcak — YZ yavaşlatıldı';

  @override
  String get hudThermalCritical => 'Çok sıcak — YZ duraklatıldı';

  @override
  String hudBatteryLow(String percent) {
    return 'Pil $percent';
  }

  @override
  String get hudLowPower => 'Düşük Güç Modu';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Hava durumu $temperature, $condition. Ayrıntılar için dokunun.';
  }

  @override
  String get hudNoGuidance =>
      'Adım adım yönlendirmeyi burada görmek için Harita görünümünde bir hedef arayın.';

  @override
  String get navArrived => 'Vardınız';

  @override
  String get navRerouting => 'Rota yeniden hesaplanıyor…';

  @override
  String get navSearchHint => 'Hedef ara';

  @override
  String get navSearchFieldHint => 'Adres, yer veya işletme';

  @override
  String get navNoResults => 'Eşleşen yer yok';

  @override
  String get navSearching => 'Aranıyor…';

  @override
  String get navSearchStartTyping =>
      'Bir adres veya yer adı yazın. Sonuçlar Apple Maps’ten gelir ve internet bağlantısı gerektirir.';

  @override
  String get navErrorUnavailable =>
      'Arama ve rotalar kullanılamıyor — internet bağlantınızı kontrol edin.';

  @override
  String get navErrorNoLocation => 'Rota planlamak için konumunuz bekleniyor.';

  @override
  String get navErrorPermission =>
      'Konum erişimi kapalı olduğundan rotalar bulunduğunuz konumdan başlatılamıyor.';

  @override
  String navErrorGeneric(String code) {
    return 'Rotalar yüklenemedi ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return '$place rotaları';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Varış $time';
  }

  @override
  String get navStart => 'Başla';

  @override
  String get navEnd => 'Bitir';

  @override
  String get navEndLabel => 'Navigasyonu bitir';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration kaldı';
  }

  @override
  String navAdvisory(String text) {
    return 'Uyarı: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes dk',
      one: '1 dk',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours sa $minutes dk';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Rota $index: $name';
  }

  @override
  String get weatherTitle => 'Hava durumu';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Hissedilen $temperature';
  }

  @override
  String get weatherPrecipitation => 'Yağış';

  @override
  String get weatherWind => 'Rüzgâr';

  @override
  String get weatherVisibility => 'Görüş mesafesi';

  @override
  String get weatherHumidity => 'Nem';

  @override
  String get weatherHourly => 'Sonraki saatler';

  @override
  String weatherAsOf(String time) {
    return 'Güncelleme: $time';
  }

  @override
  String get weatherRefresh => 'Hava durumunu yenile';

  @override
  String get weatherUnavailable => 'Hava durumu şu anda kullanılamıyor.';

  @override
  String get weatherNoLocation => 'Hava durumu için konumunuz gerekir.';

  @override
  String get weatherLegal => 'Veri kaynakları ve yasal bilgiler';

  @override
  String weatherProvidedBy(String service) {
    return 'Hava durumu verisi: $service';
  }

  @override
  String get weatherNow => 'Şimdi';

  @override
  String get virtualEmpty => 'Desteklenen nesne algılanmadı';

  @override
  String get virtualEmptyCameraOff =>
      'Sanal görünüm canlı kamerayı gerektirir.';

  @override
  String get virtualLaneDisclaimer =>
      'Şerit çizgileri açıklayıcıdır, algılanmış değildir.';

  @override
  String virtualNearest(String zone) {
    return 'En yakın: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Sanal yol sahnesi: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'YZ $status';
  }

  @override
  String get virtualStatusLive => 'canlı';

  @override
  String get virtualStatusPaused => 'duraklatıldı';

  @override
  String get virtualStatusCameraOff => 'Kamera kapalı';

  @override
  String get virtualStatusTestFootage => 'Test görüntüsü';

  @override
  String get virtualEmptyHint =>
      'Araçlar, insanlar, bisikletler, trafik ışıkları ve dur levhaları algılandığında burada görünür.';

  @override
  String get mapRecenter => 'Ortala';

  @override
  String get mapZoomIn => 'Yakınlaştır';

  @override
  String get mapZoomOut => 'Uzaklaştır';

  @override
  String get mapUnsupported => 'Etkileşimli harita iPhone’da kullanılabilir.';

  @override
  String get mapObjectsApprox => 'Nesne işaretleri yaklaşık konumlardır.';

  @override
  String get mapWeatherUnavailable => 'Hava durumu yok';

  @override
  String get navErrorNoRoute => 'Bu hedefe rota bulunamadı.';

  @override
  String get navDismiss => 'Kapat';

  @override
  String get navGo => 'Git';

  @override
  String get navFastest => 'En hızlı';

  @override
  String get navThen => 'Sonra';

  @override
  String get navRecents => 'Son aramalar';

  @override
  String get navClearRecents => 'Temizle';

  @override
  String get navSearchSubmitHint =>
      'Eşleşen tüm yerleri görmek için Ara tuşuna basın';

  @override
  String get navPlaces => 'Yerler';

  @override
  String get navEtaLabel => 'varış';

  @override
  String get navTimeLeftLabel => 'kaldı';

  @override
  String get navOverview => 'Genel bakış';

  @override
  String get navMute => 'Sesi kapat';

  @override
  String get navUnmute => 'Sesi aç';

  @override
  String get navEndConfirm => 'Navigasyon bitirilsin mi?';

  @override
  String navEndConfirmBody(String place) {
    return '$place yönlendirmesi durdurulacak.';
  }

  @override
  String navArrivedAt(String place) {
    return '$place konumuna vardınız';
  }

  @override
  String get navDone => 'Bitti';

  @override
  String get navWeakGps => 'Zayıf GPS sinyali';

  @override
  String get navLocationOff =>
      'Konum kapalı. Rota planlamak ve navigasyon kullanmak için açın.';

  @override
  String get navVoiceGuidance => 'Sesli yönlendirme';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance sonra, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, ardından $second';
  }

  @override
  String get navSpeakRerouting => 'Rota yeniden hesaplanıyor';

  @override
  String get navSpeakArrived => 'Vardınız';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metre',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilometre',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fit',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yarda',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return '$distance boyunca düz devam edin';
  }

  @override
  String get navErrorNoDirections =>
      'Bu bölgede bu yolculuk için yol tarifi kullanılamıyor. Başka bir hedef deneyin.';

  @override
  String navContinueFor(String distance) {
    return '$distance düz devam edin';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value mil',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'En yakın: $object · $zone';
  }

  @override
  String get parkingNothing => 'Görüntüde hiçbir şey algılanmadı';

  @override
  String get parkingBeeps => 'Yakınlık sesleri';

  @override
  String get parkingVolume => 'Bip ses seviyesi';

  @override
  String get parkingLimitations =>
      'Tek kamera, 360° değil. Kamera görüntüsü dışındaki nesneler algılanmaz. Park sensörlerinin yerini tutmaz; tahminler yanlış olabilir ve sessizlik alanın boş olduğu anlamına gelmez.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Yukarıdan yakınlık görünümü. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Orijinal';

  @override
  String get perceptionModeBoxes => 'Kutular';

  @override
  String get perceptionModeMasks => 'Nesne maskeleri';

  @override
  String get perceptionModeRoad => 'Yol yüzeyi';

  @override
  String get perceptionModeCombined => 'Birleşik';

  @override
  String get perceptionOpacity => 'Maske opaklığı';

  @override
  String get perceptionDisclaimer =>
      'Yol yüzeyi maskesi yaklaşık bir görsel katmandır. Sürülebilir alanı veya şeritleri göstermez.';

  @override
  String get perceptionNeedsModel =>
      'Maskeleri görmek için Segmentasyon modelini seçin.';

  @override
  String get perceptionChooseModel => 'Model seç';

  @override
  String get perceptionWaiting => 'İlk segmentasyon karesi bekleniyor…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Kutular';

  @override
  String get perceptionShortObjects => 'Nesneler';

  @override
  String get perceptionShortRoad => 'Yol';

  @override
  String get perceptionShortAll => 'Tümü';

  @override
  String get perceptionModesLabel => 'Algı katmanları';

  @override
  String get perceptionStatusWarmingUp => 'Hazırlanıyor…';

  @override
  String get perceptionStatusLoadingModel => 'Model yükleniyor…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Maskeler duraklatıldı';

  @override
  String get perceptionLegend => 'Maske göstergesi';

  @override
  String get perceptionUnavailable => 'Maskeler kullanılamıyor';

  @override
  String get driveSave => 'Kaydet';

  @override
  String get driveSaveIncident => 'Olayı kaydet';

  @override
  String driveSaveHint(int seconds) {
    return 'Araç kamerası görüntüsünün son $seconds saniyesini kaydeder';
  }

  @override
  String get driveSaving => 'Olay kaydediliyor…';

  @override
  String hudRecManualLabel(String time) {
    return 'Kaydediliyor, $time';
  }

  @override
  String get driveRecord => 'Kaydet';

  @override
  String get driveRecordStartA11y => 'Kaydı başlat';

  @override
  String driveRecordStopA11y(String time) {
    return 'Kaydı durdur, $time kaydedildi';
  }

  @override
  String get driveRecordHint =>
      'Siz durdurana kadar, son 5 saniye dahil, kesintisiz kaydeder';

  @override
  String get driveRecordFailed => 'Kayıt başlatılamadı';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kayıt kaydedildi · $count parça',
      one: 'Kayıt kaydedildi',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Kayıt durdu: depolama alanı neredeyse dolu',
      'max_duration': 'Kayıt durdu: en uzun süreye ulaşıldı',
      'camera_stopped': 'Kayıt kamerayla birlikte durdu',
      'background': 'Kayıt durdu: uygulama arka plana geçti',
      'thermal': 'Kayıt durdu: telefon çok ısındı',
      'other': 'Kayıt durdu',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Olay kaydedildi · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Görüntüle';

  @override
  String get driveSaveFailed => 'Olay kaydedilemedi.';

  @override
  String get driveSaveNotRunning =>
      'Kayıt henüz başlamadı — kameranın başlamasını bekleyip tekrar deneyin.';

  @override
  String get driveSaveTestFootage =>
      'Test görüntüsü kaydedilmez. Olay kaydetme canlı kamerayla çalışır.';

  @override
  String get driveSaveStorageFull =>
      'iPhone’unuzun depolama alanı doldu. Yer açın veya eski klipleri silin.';

  @override
  String get driveSaveIoError => 'Klip depolama alanına yazılamadı.';

  @override
  String get driveClips => 'Klipler';

  @override
  String get driveSettings => 'Ayarlar';

  @override
  String get driveViewSwitcher => 'Sürüş görünümleri';

  @override
  String get driveLocationDenied =>
      'Konum kapalı — hız, haritalar ve rotalar kullanılamıyor.';

  @override
  String get driveCameraDenied =>
      'Kamera erişimi kapalı — algılama ve kayıt kullanılamıyor.';

  @override
  String get driveRecorderFallback => 'Sessiz kayıt: mikrofon erişimi kapalı.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Kayıt ayarları düzenlendi: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhone’unuz sıcak. Soğuması için YZ daha yavaş çalışıyor — doğrudan güneşten uzak ve bir havalandırma yakınında tutun.';

  @override
  String get drivePowerThermalCritical =>
      'iPhone’unuz çok sıcak. YZ algılama soğuyana kadar duraklatıldı; mümkünse kayıt devam eder.';

  @override
  String get drivePowerLowPower =>
      'Düşük Güç Modu açık: yapay zeka düşük hızda çalışıyor.';

  @override
  String get drivePowerBatteryLow =>
      'Pil azaldı — sürüş sırasında iPhone’unuzu güce bağlayın.';

  @override
  String get onboardingTitle1 => 'Her yolculukta daha fazlasını görün.';

  @override
  String get onboardingBody1 =>
      'iPhone’unuzu akıllı bir araç kamerasına ve sürüş farkındalığı yol arkadaşına dönüştürün.';

  @override
  String get onboardingTitle2 => 'Her karede zekâ.';

  @override
  String get onboardingBody2 =>
      'Desteklenen araçları, kişileri, bisikletleri ve yol sinyallerini doğrudan iPhone’unuzda tanıyın.';

  @override
  String get onboardingTitle3 => 'Tek yol. Birden çok bakış açısı.';

  @override
  String get onboardingBody3 =>
      'Canlı algılama, sanal sürüş görünümleri, etkileşimli haritalar ve park görselleştirmesi arasında geçiş yapın.';

  @override
  String get onboardingTitle4 => 'Önemli anları saklayın.';

  @override
  String get onboardingBody4 =>
      'Son araç kamerası görüntülerini kaydedin, olayları inceleyin ve kayıtları paylaşın.';

  @override
  String get onboardingTitle5 => 'Güvenlik ve gizlilik';

  @override
  String get onboardingSafety1 =>
      'Corvista bir sürüş farkındalığı yardımcısıdır. Gözlerinizi yolda tutun.';

  @override
  String get onboardingSafety2 =>
      'Aracınızı kontrol etmez ve muhakemenizin yerini tutmaz.';

  @override
  String get onboardingSafety3 =>
      'Algılamalar ve tahminler hatalı olabilir veya kaçabilir.';

  @override
  String get onboardingSafety4 =>
      'Kamera işleme iPhone’unuzda yapılır — video yüklenmez.';

  @override
  String get onboardingSafety5 =>
      'Haritalar, arama, rotalar ve hava durumu internet bağlantısı gerektirir.';

  @override
  String get onboardingSafety6 =>
      'iPhone’unuzu görüşünüzü engellemeyecek şekilde sağlam sabitleyin.';

  @override
  String get onboardingSafety7 => 'Sürüşe başlamadan önce kurulumu tamamlayın.';

  @override
  String get onboardingAcknowledge =>
      'Corvista’nın bir farkındalık yardımcısı olduğunu ve güvenli sürüşten benim sorumlu olduğumu anlıyorum.';

  @override
  String get onboardingReadSafety => 'Tüm güvenlik bilgilerini oku';

  @override
  String get onboardingNext => 'İleri';

  @override
  String get onboardingSkip => 'Atla';

  @override
  String get onboardingAgree => 'Devam';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Sayfa $current / $total';
  }

  @override
  String get permTitle => 'İzinler';

  @override
  String get permIntro =>
      'Corvista yalnızca her özelliğin ihtiyaç duyduğunu ister. Bunları istediğiniz zaman Ayarlar’dan değiştirebilirsiniz.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Algılama, araç kamerası kaydı ve park görünümü için gereklidir. Video iPhone’unuzda işlenir.';

  @override
  String get permLocationTitle => 'Konum';

  @override
  String get permLocationBody =>
      'GPS hızı, harita, rotalar, hava durumu ve kayıtlı klipleri etiketleme için kullanılır. Yalnızca uygulamayı kullandığınız sürece.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'Konuşma tanıma yalnızca acil durum uyarıları için sesle iptali açarsanız istenir.';

  @override
  String get permRequired => 'Gerekli';

  @override
  String get permOptional => 'İsteğe bağlı';

  @override
  String get permAllow => 'İzin ver';

  @override
  String get permGranted => 'İzin verildi';

  @override
  String get permDenied => 'Reddedildi';

  @override
  String get permLimited => 'Sınırlı';

  @override
  String get permRestricted => 'Kısıtlı';

  @override
  String get permStart => 'Sürüşe başla';

  @override
  String get permCameraNeeded =>
      'Kamera erişimi olmadan devam edebilirsiniz, ancak Ayarlar’dan izin verene kadar algılama ve kayıt çalışmaz.';

  @override
  String get permSetupIntro =>
      'Corvista’nın tam çalışması için bunlara ihtiyacı var. Tümüne izin ver’e dokunun, iOS her biri için sırayla soracak. Bunları istediğiniz zaman Ayarlar’dan değiştirebilirsiniz.';

  @override
  String get permCameraLine =>
      'Algılama, araç kamerası kaydı ve park görünümü için gereklidir. Video iPhone’unuzda işlenir, asla yüklenmez.';

  @override
  String get permLocationLine =>
      'GPS hızı, harita, rotalar, hava durumu ve kliplerin kaydedildiği yer için. Yalnızca uygulamayı kullanırken.';

  @override
  String get permMicLine =>
      'Olay kliplerindeki araç içi ses ve acil durum uyarısı sırasında iptal ifadenizi duymak için.';

  @override
  String get permSpeechTitle => 'Konuşma tanıma';

  @override
  String get permSpeechLine =>
      'Acil durum geri sayımı sırasında iptal ifadenizi, desteklenen yerlerde iPhone’unuzda tanır.';

  @override
  String get permAllowAll => 'Tümüne izin ver';

  @override
  String permAsking(String permission) {
    return '$permission izni isteniyor…';
  }

  @override
  String get permSomeDenied =>
      'Bazı izinler kapalı. Bu özellikleri kullanmak için Ayarlar’dan açın.';

  @override
  String get permNotNow => 'Şimdi değil';

  @override
  String get tourLabel => 'Sürüş ekranı turu';

  @override
  String tourProgress(int current, int total) {
    return 'Adım $current/$total';
  }

  @override
  String get tourNext => 'İleri';

  @override
  String get tourBack => 'Geri';

  @override
  String get tourSkip => 'Turu atla';

  @override
  String get tourFinish => 'Sürüşe başla';

  @override
  String get tourWelcomeTitle => 'Hızlı turunuz';

  @override
  String get tourWelcomeBody =>
      'Sürüş ekranındaki önemli noktalara bir dakikalık bakış. Park halindeyken yapmanız en iyisidir.';

  @override
  String get tourHudTitle => 'Gösterge şeridi';

  @override
  String get tourHudSpeed => 'Hız, GPS’ten gelir.';

  @override
  String get tourHudRec =>
      'REC, arabellekte kaç saniyelik görüntü olduğunu gösterir.';

  @override
  String get tourHudAi =>
      'Yapay zeka çipi modeli, kaç nesne gördüğünü ve bir nokta gösterir: yeşil çalışıyor, sarı sınırlı, kırmızı durdu.';

  @override
  String get tourSaveTitle => 'Olayı Kaydet';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista, videonun son $seconds saniyesini kayan bir arabellekte tutar. Sürekli üzerine yazıldığı için Kaydet’e dokunmadıkça hiçbir şey saklanmaz. Kaydedilen klipler bu iPhone’da, Klipler’de kalır.';
  }

  @override
  String get tourRecordTitle => 'Tüm sürüşü kaydedin';

  @override
  String get tourRecordBody =>
      'Siz durdurana kadar kesintisiz çekim yapmak için Kaydet\'e dokunun. Uzun sürüşler Klipler\'e 5 dakikalık parçalar halinde kaydedilir; kayıt sırasında Olayı Kaydet de çalışmaya devam eder.';

  @override
  String get tourViewsTitle => 'Yolu görmenin beş yolu';

  @override
  String get tourViewDetection =>
      'Desteklenen nesnelerin çevresinde kutular bulunan canlı kamera.';

  @override
  String get tourViewVirtual =>
      'Algılamalardan oluşturulan sadeleştirilmiş 3B sahne.';

  @override
  String get tourViewMap =>
      'Arama ve adım adım yönlendirme içeren Apple Haritalar.';

  @override
  String get tourViewParking => 'Kamera ve yukarıdan yakınlık görünümü.';

  @override
  String get tourViewPerception => 'Yol ve nesne maskeleri.';

  @override
  String get tourMapTitle => 'Arama ve adım adım yönlendirme';

  @override
  String get tourMapBody =>
      'Harita’yı açın, arama çubuğuna dokunun ve bir hedef seçin. Bir rota seçin, ardından adım adım yönlendirme için Başlat’a dokunun. İnternet bağlantısı gerekir.';

  @override
  String get tourClipsTitle => 'Klipler';

  @override
  String get tourClipsBody =>
      'Kaydedilen olayları inceleyin, yeniden adlandırın, paylaşın veya silin. Siz paylaşmadıkça klipler iPhone’unuzda kalır.';

  @override
  String get tourSettingsTitle => 'Ayarlar';

  @override
  String get tourSettingsBody =>
      'Sesli uyarıları ve hassasiyetini, kayıt kalitesini ve arabellek uzunluğunu ayarlayın; iptal geri sayımlı deneysel bir çarpma uyarısı olan Acil Durum modunu kurun.';

  @override
  String get tourSafetyTitle => 'Sürüşten önce';

  @override
  String get tourSafety1 =>
      'iPhone’unuzu görüşünüzü engellemeyecek bir yere sağlam şekilde sabitleyin.';

  @override
  String get tourSafety2 =>
      'Araç kullanırken uygulamayla etkileşime girmeyin. Ayarları park halindeyken yapın.';

  @override
  String get tourSafety3 =>
      'Algılamalar ve bölgeler tahminidir. Hatalı olabilir veya gözden kaçabilir.';

  @override
  String get tourSafety4 => 'Güvenli sürüşten siz sorumlusunuz.';

  @override
  String get helpTakeTour => 'Turu başlat';

  @override
  String get helpTakeTourSub => 'Sürüş ekranına bir dakikalık rehberli bakış.';

  @override
  String get tripsTitle => 'Yolculuklar';

  @override
  String get tripsOpen => 'Yolculuk günlüğü';

  @override
  String get tripsEmptyTitle => 'Henüz yolculuk yok';

  @override
  String get tripsEmptyBody =>
      'Corvista ile sürüş yaparken yolculuklar otomatik kaydedilir: mesafe, süre, hız ve izlediğiniz rota.';

  @override
  String get tripsDisabledBody =>
      'Yolculuk günlüğü kapalı, bu yüzden yeni sürüşler kaydedilmiyor. Rotalarınızın özel bir günlüğünü bu iPhone’da tutmak için açın.';

  @override
  String get tripsEnable => 'Yolculuk günlüğünü aç';

  @override
  String get tripsToday => 'Bugün';

  @override
  String get tripsYesterday => 'Dün';

  @override
  String tripsRecordingNow(String distance) {
    return 'Yolculuk kaydediliyor · $distance';
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
      other: '$count olay',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uyarı',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yolculuk',
      zero: 'Yolculuk yok',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Mesafe';

  @override
  String get tripsStatDuration => 'Süre';

  @override
  String get tripsStatMoving => 'Hareket süresi';

  @override
  String get tripsStatAvgSpeed => 'Ort. hız';

  @override
  String get tripsStatMaxSpeed => 'En yüksek hız';

  @override
  String get tripsDetections => 'Algılamalar';

  @override
  String get tripsNoDetections => 'Bu yolculukta kaydedilen yol nesnesi yok.';

  @override
  String get tripsTimeline => 'Zaman çizelgesi';

  @override
  String get tripsEventStart => 'Yolculuk başladı';

  @override
  String get tripsEventEnd => 'Yolculuk bitti';

  @override
  String get tripsEventAlert => 'Sesli uyarı';

  @override
  String get tripsEventIncident => 'Olay klibi kaydedildi';

  @override
  String get tripsEventEmergency => 'Olası çarpma algılandı';

  @override
  String get tripsEventNavStart => 'Navigasyon başladı';

  @override
  String get tripsEventArrive => 'Hedefe varıldı';

  @override
  String get tripsEventReroute => 'Rota yeniden hesaplandı';

  @override
  String get tripsEventRecording => 'Kayıt kaydedildi';

  @override
  String get tripsOpenClip => 'Klibi aç';

  @override
  String get tripsTrackPreview => 'GPS izi';

  @override
  String get tripsRenameTitle => 'Yolculuğu yeniden adlandır';

  @override
  String get tripsRenameHint => 'Yolculuk adı';

  @override
  String get tripsFavorite => 'Favorilere ekle';

  @override
  String get tripsUnfavorite => 'Favorilerden kaldır';

  @override
  String get tripsShareGpx => 'GPX paylaş';

  @override
  String get tripsShareFailed => 'Bu yolculuk paylaşılamadı.';

  @override
  String get tripsDelete => 'Yolculuğu sil';

  @override
  String get tripsDeleteConfirmTitle => 'Bu yolculuk silinsin mi?';

  @override
  String get tripsDeleteConfirmBody =>
      'Rota ve istatistikler bu iPhone’dan kaldırılacak. Bu yolculuğa ait olay klipleri korunur.';

  @override
  String get tripsDeleted => 'Yolculuk silindi';

  @override
  String get tripsNotFound => 'Bu yolculuk artık mevcut değil.';

  @override
  String get tripsPrivacyNote =>
      'Yalnızca bu iPhone’da saklanır. Hiçbir şey yüklenmez.';

  @override
  String get settingsSectionTrips => 'Yolculuk günlüğü';

  @override
  String get settingsTripLog => 'Yolculukları kaydet';

  @override
  String get settingsTripLogSubtitle =>
      'Rotanızı ve sürüş istatistiklerinizi yalnızca bu iPhone’da tutar.';

  @override
  String get settingsTripRetention => 'Yolculukları sakla';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 yıl';

  @override
  String get settingsRetentionForever => 'Süresiz';

  @override
  String get settingsTripRetentionFooter =>
      'Eski yolculuklar Corvista başlatıldığında otomatik silinir.';

  @override
  String get settingsViewTrips => 'Yolculukları görüntüle';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours sa $minutes dk';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes dk';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista yolculuğu $date';
  }

  @override
  String get settingsFreeUpSpace => 'Yer aç';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Geçici dosyaları ve önbellekleri kaldırır. Kaydedilen klipler ve yolculuklar korunur.';

  @override
  String settingsFreedBytes(String size) {
    return '$size boşaltıldı';
  }

  @override
  String get settingsNothingToFree =>
      'Önbellekler temizlendi — kaldırılacak geçici dosya yok.';

  @override
  String get settingsSectionPrivacyData => 'Gizlilik ve veriler';

  @override
  String get settingsPrivacyDataFooter =>
      'Klipler, yolculuklar ve ayarlar yalnızca bu iPhone\'da saklanır. Yalnızca siz paylaşmayı seçtiğinizde cihazdan çıkar.';

  @override
  String get settingsDeleteAllData => 'Tüm verileri sil';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Klipleri, yolculukları, kişileri ve ayarları bu iPhone\'dan sil';

  @override
  String get deleteAllTitle => 'Tüm veriler silinsin mi?';

  @override
  String get deleteAllMessage =>
      'Bu işlem, bu iPhone\'dan şunları kalıcı olarak kaldırır:\n• Olay klipleri ve küçük resimler\n• Yolculuk günlüğü ve GPS izleri\n• Acil durum kişileri ve acil durum olayları\n• Algılama günlükleri ve tanılama günlüğü\n• Ayarlar ve son hedefler\n• Geçici kayıt arabelleği ve önbellek\n\nBu işlem geri alınamaz. Ardından Corvista karşılama ekranlarından yeniden başlar.';

  @override
  String get deleteAllConfirm => 'Her şeyi sil';

  @override
  String get deleteAllInProgress => 'Siliniyor…';

  @override
  String get deleteAllDone => 'Tüm veriler silindi';

  @override
  String get deleteAllPartial =>
      'Bazı öğeler silinemedi. Ayarlar\'dan tekrar deneyin.';

  @override
  String get diagLogSection => 'Tanılama günlüğü';

  @override
  String get diagLogFooter =>
      'Hatalar yalnızca bu iPhone\'a, konum, kişi adı veya telefon numarası olmadan kaydedilir. Günlüğü kendiniz paylaşmadıkça hiçbir şey gönderilmez.';

  @override
  String get diagLogShare => 'Tanılama günlüğünü paylaş';

  @override
  String get diagLogEmpty => 'Boş';

  @override
  String get diagLogClear => 'Günlüğü temizle';

  @override
  String get diagLogClearTitle => 'Tanılama günlüğü temizlensin mi?';

  @override
  String get diagLogClearBody =>
      'Kaydedilmiş hata girdileri bu iPhone\'dan silinecek.';

  @override
  String get diagLogCleared => 'Tanılama günlüğü temizlendi';

  @override
  String get diagLogShareFailed => 'Tanılama günlüğü paylaşılamadı.';

  @override
  String get privacyControls2 =>
      'Ayarlar › Gizlilik ve veriler › Tüm verileri sil, Corvista\'nın bu iPhone\'da sakladığı tüm klipleri, yolculukları, kişileri, günlükleri ve ayarları siler.';

  @override
  String get parkingZoneStop => 'Dur';

  @override
  String get parkingZoneVeryClose => 'Çok yakın';

  @override
  String get parkingZoneClose => 'Yakın';

  @override
  String get parkingZoneNothingClose => 'Yakında bir şey görülmedi';

  @override
  String get parkingNotDetected =>
      'Duvarlar, kolonlar, direkler ve kaldırım kenarları algılanmaz';

  @override
  String get parkingApprox => 'yakl.';

  @override
  String get parkingSideLeft => 'Sol';

  @override
  String get parkingSideCenter => 'Orta';

  @override
  String get parkingSideRight => 'Sağ';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Yalnızca ön kamera görüntüsü — 360° sistem değildir';

  @override
  String get parkingMuteBeeps => 'Sesleri kapat';

  @override
  String get parkingUnmuteBeeps => 'Sesleri aç';

  @override
  String get parkingAbout => 'Park görünümü hakkında';

  @override
  String get parkingLimitationsDetail =>
      'Yalnızca kameranın önündeki alan izlenir. Algılayıcı otomobilleri, otobüsleri ve kamyonları, insanları, bisikletleri ve motosikletleri tanır. Duvarlar, kolonlar, direkler, kaldırım kenarları, bariyerler, engeller ve alçak cisimler ALGILANMAZ; kaput da hemen önünüzdeki zemini gizleyebilir. Mesafeler tek bir kameradan (nesnenin boyutu ve konumu) yapılan kaba tahminlerdir ve ciddi ölçüde yanlış olabilir. Sessizlik ya da “Yakında bir şey görülmedi” ifadesi yolun açık olduğu anlamına gelmez — çevrenize daima bakın ve aynalarınızı kullanın.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Tarafa göre yakınlık: sol $left, orta $center, sağ $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Hatalar, bu iPhone\'daki özel bir günlüğe yazılır (konum, kişi adı veya telefon numarası içermez). Hiçbir zaman otomatik olarak gönderilmez; Ayarlar › Tanılama\'dan paylaşabilir veya temizleyebilirsiniz.';
}
