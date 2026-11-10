// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Lihat lebih banyak dalam setiap pemanduan.';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonDelete => 'Padam';

  @override
  String get commonSave => 'Simpan';

  @override
  String get commonBack => 'Kembali';

  @override
  String get commonClose => 'Tutup';

  @override
  String get commonRetry => 'Cuba lagi';

  @override
  String get commonOpenSettings => 'Buka Tetapan';

  @override
  String get commonLoading => 'Memuatkan…';

  @override
  String get commonError => 'Sesuatu tidak kena.';

  @override
  String commonErrorDetail(String message) {
    return 'Ralat berlaku: $message';
  }

  @override
  String get commonOn => 'Hidup';

  @override
  String get commonOff => 'Mati';

  @override
  String get commonRename => 'Namakan semula';

  @override
  String get commonShare => 'Kongsi';

  @override
  String get commonNotAvailable => 'Tidak tersedia';

  @override
  String get commonTestFootage => 'RAKAMAN UJIAN';

  @override
  String get zoneVeryClose => 'Sangat dekat';

  @override
  String get zoneClose => 'Dekat';

  @override
  String get zoneMedium => 'Sederhana';

  @override
  String get zoneFar => 'Jauh';

  @override
  String get zoneUnknown => 'Tidak diketahui';

  @override
  String get classPerson => 'Orang';

  @override
  String get classBicycle => 'Basikal';

  @override
  String get classMotorcycle => 'Motosikal';

  @override
  String get classCar => 'Kenderaan';

  @override
  String get classBus => 'Bas';

  @override
  String get classTrafficLight => 'Lampu isyarat';

  @override
  String get classStopSign => 'Papan tanda berhenti';

  @override
  String get viewDetection => 'Pengesanan';

  @override
  String get viewVirtual => 'Maya';

  @override
  String get viewMap => 'Peta';

  @override
  String get viewParking => 'Parkir';

  @override
  String get viewPerception => 'Persepsi';

  @override
  String get unitKmh => 'km/j';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Merah';

  @override
  String get lightYellow => 'Kuning';

  @override
  String get lightGreen => 'Hijau';

  @override
  String get lightUnknown => 'Tidak diketahui';

  @override
  String get clipsTitle => 'Klip';

  @override
  String get clipsSelect => 'Pilih';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dipilih',
      zero: 'Pilih klip',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Pilih semua';

  @override
  String get clipsDeselectAll => 'Nyahpilih semua';

  @override
  String get clipsDeleteSelected => 'Padam yang dipilih';

  @override
  String get clipsGridView => 'Paparan grid';

  @override
  String get clipsListView => 'Paparan senarai';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Padam $count klip?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Video akan dibuang secara kekal daripada iPhone anda. Tindakan ini tidak boleh dibuat asal.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip dipadam',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Belum ada klip';

  @override
  String get clipsEmptyBody =>
      'Semasa anda memandu, Corvista menyimpan penimbal bergolek yang pendek. Ketik Simpan Insiden untuk menyimpan beberapa saat terakhir rakaman di sini.';

  @override
  String get clipsLoadError => 'Klip anda tidak dapat dimuatkan.';

  @override
  String get clipsStorageTitle => 'Storan';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Klip $clips · Penimbal $buffer · $free kosong';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip disimpan',
      zero: 'Tiada klip disimpan',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Storan iPhone anda hampir penuh. Insiden baharu mungkin gagal disimpan.';

  @override
  String get clipsMissingFile => 'Fail tiada';

  @override
  String get clipsEmergencyBadge => 'Hentakan';

  @override
  String clipsUntitled(String date) {
    return 'Insiden · $date';
  }

  @override
  String get clipsAudio => 'Audio dirakam';

  @override
  String get clipsFavorite => 'Kegemaran';

  @override
  String get clipsUnfavorite => 'Alih keluar daripada kegemaran';

  @override
  String get clipsLocation => 'Lokasi disimpan';

  @override
  String clipsOpenClip(String title) {
    return 'Buka klip $title';
  }

  @override
  String get playerNotFoundTitle => 'Klip tidak ditemui';

  @override
  String get playerNotFoundBody => 'Klip ini mungkin telah dipadam.';

  @override
  String get playerMissingTitle => 'Fail video tiada';

  @override
  String get playerMissingBody =>
      'Rakaman untuk klip ini tidak lagi berada pada iPhone anda. Anda boleh mengalih keluar entri daripada galeri.';

  @override
  String get playerRemoveEntry => 'Alih keluar entri';

  @override
  String get playerLoadError => 'Video ini tidak dapat dimainkan.';

  @override
  String get playerPlay => 'Main';

  @override
  String get playerPause => 'Jeda';

  @override
  String get playerReplay => 'Main semula';

  @override
  String get playerRenameTitle => 'Namakan semula klip';

  @override
  String get playerRenameHint => 'Nama klip';

  @override
  String get playerRenamed => 'Klip dinamakan semula';

  @override
  String get playerFavorited => 'Ditambah pada kegemaran';

  @override
  String get playerUnfavorited => 'Dialih keluar daripada kegemaran';

  @override
  String get playerShareFailed => 'Klip ini tidak dapat dikongsi.';

  @override
  String get playerDetails => 'Butiran';

  @override
  String get playerDate => 'Dirakam';

  @override
  String get playerDuration => 'Tempoh';

  @override
  String get playerResolution => 'Resolusi';

  @override
  String get playerSize => 'Saiz fail';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerAudioYes => 'Dirakam';

  @override
  String get playerAudioNo => 'Tidak dirakam';

  @override
  String get playerReason => 'Disimpan oleh';

  @override
  String get playerReasonManual => 'Butang Simpan Insiden';

  @override
  String get playerReasonEmergency => 'Kemungkinan hentakan dikesan';

  @override
  String get playerReasonRecovered => 'Dipulihkan selepas gangguan';

  @override
  String get playerSpeed => 'Kelajuan GPS semasa disimpan';

  @override
  String get playerLocation => 'Lokasi';

  @override
  String get playerOpenInMaps => 'Buka dalam Peta';

  @override
  String get playerBack => 'Kembali';

  @override
  String get playerMore => 'Tindakan lain';

  @override
  String get clipsFilterLabel => 'Papar';

  @override
  String get clipsFilterAll => 'Semua';

  @override
  String get clipsFilterRecordings => 'Rakaman';

  @override
  String get clipsFilterIncidents => 'Insiden';

  @override
  String get clipsFilterEmergency => 'Kecemasan';

  @override
  String get clipsFilterFavorites => 'Kegemaran';

  @override
  String get clipsSort => 'Isih';

  @override
  String get clipsSortNewest => 'Terbaharu dahulu';

  @override
  String get clipsSortOldest => 'Terlama dahulu';

  @override
  String get clipsSortLongest => 'Terpanjang dahulu';

  @override
  String get clipsSortLargest => 'Terbesar dahulu';

  @override
  String get clipsToday => 'Hari ini';

  @override
  String get clipsYesterday => 'Semalam';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Belum ada klip dalam kategori ini.';

  @override
  String get clipsFavoritesEmpty =>
      'Bintangkan klip untuk menyimpannya di sini bagi capaian pantas.';

  @override
  String get clipsKindRecording => 'Rakaman';

  @override
  String get clipsKindIncident => 'Insiden';

  @override
  String get clipsKindEmergency => 'Kecemasan';

  @override
  String get clipsKindTest => 'Ujian';

  @override
  String clipsTripChip(String time) {
    return 'Perjalanan · $time';
  }

  @override
  String get clipsOpenTrip => 'Buka perjalanan tempat klip ini dirakam';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used digunakan · $free kosong';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Klip menggunakan $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rakaman',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count insiden',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kecemasan',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Kosongkan ruang';

  @override
  String get clipsStorageLowGentle =>
      'Ruang kosong kurang daripada 2 GB. Untuk memastikan rakaman lancar, kosongkan ruang atau alih keluar klip yang tidak diperlukan lagi.';

  @override
  String get clipsSaveToPhotos => 'Simpan ke Foto';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Padam $count klip ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Menyimpan $done daripada $total ke Foto…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip disimpan ke Foto',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved disimpan ke Foto · $failed tidak dapat disimpan';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista tidak dibenarkan menambah video ke Foto. Anda boleh membenarkannya dalam Tetapan.';

  @override
  String get clipsPhotosFailed => 'Tidak dapat menyimpan ke Foto.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip ditambah pada kegemaran',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip dialih keluar daripada kegemaran',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (dipotong)';
  }

  @override
  String get playerTrim => 'Potong';

  @override
  String get playerInfo => 'Maklumat';

  @override
  String get playerKind => 'Jenis';

  @override
  String get playerReasonRecording => 'Butang Rakam';

  @override
  String get trimTitle => 'Potong klip';

  @override
  String get trimHint =>
      'Seret pemegang untuk memilih bahagian yang ingin disimpan. Klip asal kekal tidak berubah.';

  @override
  String get trimStartHandle => 'Permulaan potongan';

  @override
  String get trimEndHandle => 'Penghujung potongan';

  @override
  String trimSelection(String duration) {
    return '$duration dipilih';
  }

  @override
  String get trimSave => 'Simpan sebagai klip baharu';

  @override
  String get trimSaving => 'Menyimpan klip yang dipotong…';

  @override
  String get trimSaved => 'Klip yang dipotong telah disimpan';

  @override
  String get trimOpenNew => 'Buka';

  @override
  String get trimFailed => 'Tidak dapat memotong klip ini.';

  @override
  String get trimStorageFull =>
      'Ruang kosong tidak mencukupi untuk menyimpan klip yang dipotong.';

  @override
  String get trimPreview => 'Main bahagian dipilih';

  @override
  String get settingsTitle => 'Tetapan';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Amaran';

  @override
  String get settingsSectionAlertCategories => 'Kategori amaran';

  @override
  String get settingsSectionRecording => 'Rakaman';

  @override
  String get settingsSectionDriving => 'Pemanduan';

  @override
  String get settingsSectionPower => 'Kuasa';

  @override
  String get settingsSectionEmergency => 'Kecemasan';

  @override
  String get settingsSectionAppearance => 'Penampilan';

  @override
  String get settingsSectionLanguage => 'Bahasa';

  @override
  String get settingsSectionInformation => 'Maklumat';

  @override
  String get settingsCameraLens => 'Kanta kamera';

  @override
  String get settingsLensWide => 'Lebar';

  @override
  String get settingsLensUltraWide => 'Ultra Lebar';

  @override
  String get settingsLensTelephoto => 'Telefoto';

  @override
  String get settingsLensUnavailable => 'Tidak tersedia pada iPhone ini';

  @override
  String get settingsStabilization => 'Penstabilan';

  @override
  String get settingsStabAuto => 'Automatik';

  @override
  String get settingsStabOff => 'Mati';

  @override
  String get settingsStabStandard => 'Standard';

  @override
  String get settingsStabCinematic => 'Sinematik';

  @override
  String get settingsOverlayOpacity => 'Kelegapan tindihan';

  @override
  String get settingsShowFps => 'Tunjukkan statistik prestasi';

  @override
  String get settingsShowFpsSubtitle =>
      'Kadar bingkai dan masa inferens pada paparan pengesanan';

  @override
  String get settingsCameraFooter =>
      'Perubahan kanta dan penstabilan berkuat kuasa apabila kamera dimulakan seterusnya.';

  @override
  String get settingsAiModel => 'Model AI';

  @override
  String get settingsConfidence => 'Keyakinan pengesanan';

  @override
  String get settingsTracking => 'Penjejakan objek';

  @override
  String get settingsTrackingSubtitle =>
      'Memastikan objek stabil antara bingkai';

  @override
  String get settingsShowLabels => 'Tunjukkan label';

  @override
  String get settingsShowConfidence => 'Tunjukkan keyakinan';

  @override
  String get settingsSegmentationOpacity => 'Kelegapan topeng persepsi';

  @override
  String get settingsAiFooter =>
      'Keyakinan yang lebih rendah menunjukkan lebih banyak objek tetapi juga lebih banyak pengesanan palsu. Pengesanan mungkin tidak tepat.';

  @override
  String get settingsVoiceAlerts => 'Amaran suara';

  @override
  String get settingsVoiceLanguage => 'Bahasa suara';

  @override
  String get settingsVoiceLanguageAuto => 'Ikut bahasa apl';

  @override
  String get settingsVoice => 'Suara';

  @override
  String get settingsVoiceDefault => 'Lalai sistem';

  @override
  String get settingsVoiceQualityEnhanced => 'Dipertingkat';

  @override
  String get settingsVoiceQualityPremium => 'Kualiti tinggi';

  @override
  String get settingsNoVoices =>
      'Tiada suara dipasang untuk bahasa ini. Tambah satu dalam Tetapan iOS › Kebolehcapaian › Kandungan Lisan.';

  @override
  String get settingsAlertPedestrian => 'Pejalan kaki';

  @override
  String get settingsAlertCyclist => 'Penunggang basikal';

  @override
  String get settingsAlertMotorcycle => 'Motosikal';

  @override
  String get settingsAlertBus => 'Bas';

  @override
  String get settingsAlertVehicleClose => 'Kenderaan sangat dekat di hadapan';

  @override
  String get settingsAlertTrafficLight => 'Perubahan lampu isyarat';

  @override
  String get settingsAlertTrafficMoving => 'Trafik di hadapan bergerak';

  @override
  String get settingsAlertStopSign => 'Papan tanda berhenti';

  @override
  String get settingsSensitivity => 'Kepekaan';

  @override
  String get settingsSensitivityLow => 'Rendah';

  @override
  String get settingsSensitivityMedium => 'Sederhana';

  @override
  String get settingsSensitivityHigh => 'Tinggi';

  @override
  String get settingsCooldown => 'Sela ulangan';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Kelantangan suara';

  @override
  String get settingsQuietMode => 'Mod senyap';

  @override
  String get settingsQuietModeSubtitle => 'Hanya amaran terpenting dituturkan';

  @override
  String get settingsTestVoice => 'Uji suara';

  @override
  String get settingsTestVoiceDone => 'Memainkan contoh amaran…';

  @override
  String get settingsParkingBeeps => 'Bip parkir';

  @override
  String get settingsBeepVolume => 'Kelantangan bip';

  @override
  String get settingsAlertsFooter =>
      'Amaran hanyalah bantuan. Sentiasa perhatikan jalan — senyap tidak bermakna jalan selamat.';

  @override
  String get settingsRecordingProfile => 'Kualiti rakaman';

  @override
  String get settingsProfileStandard => 'Standard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Penimbal insiden';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds saat';
  }

  @override
  String get settingsManualMaxLength => 'Panjang maksimum rakaman manual';

  @override
  String get settingsManualMaxUnlimited => 'Tanpa had';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Rakam audio';

  @override
  String get settingsRecordAudioSubtitle =>
      'Termasuk audio kabin dalam insiden yang disimpan';

  @override
  String get settingsMicDenied =>
      'Akses mikrofon dimatikan. Benarkan dalam Tetapan untuk merakam audio.';

  @override
  String get settingsWatermark => 'Tera air Corvista';

  @override
  String get settingsTimestamp => 'Cap tarikh & masa';

  @override
  String get settingsSaveLocation => 'Simpan lokasi bersama klip';

  @override
  String get settingsStorage => 'Storan & klip';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip',
      zero: 'Tiada klip',
    );
    return '$_temp0 · $used digunakan · $free kosong';
  }

  @override
  String get settingsRecordingFooter =>
      'Penimbal bergolek kekal pada iPhone anda dan ditulis ganti secara berterusan. Tiada apa-apa dirakam di latar belakang.';

  @override
  String get settingsDefaultView => 'Paparan lalai';

  @override
  String get settingsUnits => 'Unit';

  @override
  String get settingsShowCompass => 'Tunjukkan kompas';

  @override
  String get settingsHudStyle => 'Gaya HUD';

  @override
  String get settingsHudCustomize => 'Sesuaikan HUD';

  @override
  String get settingsDrivingSide => 'Sebelah pemanduan';

  @override
  String get settingsDrivingSideAuto => 'Automatik';

  @override
  String get settingsDrivingSideRight => 'Kanan';

  @override
  String get settingsDrivingSideLeft => 'Kiri';

  @override
  String get settingsVirtualStyle => 'Gaya paparan maya';

  @override
  String get settingsVirtualMinimal => 'Minimum';

  @override
  String get settingsVirtualPerspective => 'Perspektif';

  @override
  String get settingsVirtualHighContrast => 'Kontras tinggi';

  @override
  String get settingsKeepScreenOn => 'Pastikan skrin hidup semasa memandu';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Tunjukkan arah belokan demi belokan pada Skrin Kunci dan dalam Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Rakaman dijeda semasa Corvista berada di latar belakang';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Dijeda';

  @override
  String get liveActivityDashcamOff => 'Kamera mati';

  @override
  String get liveActivityEnded => 'Navigasi tamat';

  @override
  String get liveActivityEta => 'Ketibaan';

  @override
  String get settingsAutoRecenter => 'Pusatkan semula peta secara automatik';

  @override
  String get settingsHudStyleClassic => 'Klasik';

  @override
  String get settingsHudStyleGrid => 'Grid';

  @override
  String get settingsHudStyleMinimal => 'Minimum';

  @override
  String get settingsHudStylePerformance => 'Prestasi';

  @override
  String get settingsHudStyleNavigation => 'Navigasi';

  @override
  String get settingsHudStyleNight => 'Malam';

  @override
  String get settingsHudStyleHighContrast => 'Kontras tinggi';

  @override
  String get settingsPowerMode => 'Mod kuasa';

  @override
  String get settingsPowerBalanced => 'Seimbang';

  @override
  String get settingsPowerPerformance => 'Prestasi';

  @override
  String get settingsPowerSaver => 'Jimat kuasa';

  @override
  String get settingsPowerFooter =>
      'Corvista menurunkan kadar AI dan kesan visual secara automatik apabila iPhone anda menjadi panas atau bateri rendah.';

  @override
  String get settingsThermal => 'Keadaan terma';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Suam';

  @override
  String get settingsThermalSerious => 'Panas';

  @override
  String get settingsThermalCritical => 'Kritikal';

  @override
  String get settingsBattery => 'Bateri';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Mengecas';
  }

  @override
  String get settingsLowPowerMode =>
      'Mod Kuasa Rendah dihidupkan — AI berjalan pada kadar yang dikurangkan.';

  @override
  String get settingsAiRate => 'Kadar AI semasa';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Pengesanan hentakan';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Hidup · kira detik $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Eksperimen. Bukan pengganti perkhidmatan kecemasan.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeDark => 'Gelap';

  @override
  String get settingsThemeLight => 'Cerah';

  @override
  String get settingsReduceMotion => 'Kurangkan gerakan';

  @override
  String get settingsReduceMotionSubtitle =>
      'Meminimumkan animasi dalam seluruh apl';

  @override
  String get settingsAppLanguage => 'Bahasa apl';

  @override
  String get settingsPrivacyPolicy => 'Dasar Privasi';

  @override
  String get settingsTerms => 'Terma Penggunaan';

  @override
  String get settingsHelp => 'Bantuan';

  @override
  String get settingsSupport => 'Hubungi sokongan';

  @override
  String get settingsLicenses => 'Lesen sumber terbuka';

  @override
  String get settingsSupportUnavailable =>
      'Mail tidak dapat dibuka. Tulis kepada support@corvista.app.';

  @override
  String get settingsSafety => 'Maklumat keselamatan';

  @override
  String get settingsDiagnostics => 'Diagnostik';

  @override
  String get settingsVersion => 'Versi';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Sesuaikan HUD';

  @override
  String get hudCustomPreview => 'Pratonton · nilai contoh';

  @override
  String get hudCustomStyle => 'Gaya';

  @override
  String get hudCustomElements => 'Elemen';

  @override
  String get hudCustomSpeed => 'Kelajuan';

  @override
  String get hudCustomHeading => 'Arah & kompas';

  @override
  String get hudCustomClock => 'Jam';

  @override
  String get hudCustomBattery => 'Bateri & terma';

  @override
  String get hudCustomDetections => 'Status AI & pengesanan';

  @override
  String get hudCustomWeather => 'Cuaca';

  @override
  String get hudCustomAppearance => 'Saiz & kelegapan';

  @override
  String get hudCustomSize => 'Saiz';

  @override
  String get hudCustomOpacity => 'Kelegapan';

  @override
  String get hudCustomFooter =>
      'Amaran seperti terlalu panas sentiasa ditunjukkan, walaupun elemen disembunyikan.';

  @override
  String get hudCustomDescClassic => 'Kluster instrumen yang seimbang';

  @override
  String get hudCustomDescGrid => 'Grid perspektif di atas jalan';

  @override
  String get hudCustomDescMinimal => 'Kelajuan sahaja, tiada yang lain';

  @override
  String get hudCustomDescPerformance =>
      'Lengkok kelajuan dengan bacaan langsung';

  @override
  String get hudCustomDescNavigation => 'Manuver seterusnya dahulu';

  @override
  String get hudCustomDescNight =>
      'Malap dan beralih ke merah untuk pemanduan malam';

  @override
  String get hudCustomDescHighContrast =>
      'Kejelasan maksimum di bawah matahari terik';

  @override
  String get languageTitle => 'Bahasa';

  @override
  String get languageSystem => 'Lalai sistem';

  @override
  String get languageSystemSubtitle => 'Ikut bahasa iPhone anda';

  @override
  String get languageFooter =>
      'Lebih banyak bahasa akan datang. Bahasa amaran suara boleh ditetapkan secara berasingan di bawah Amaran.';

  @override
  String get diagTitle => 'Diagnostik';

  @override
  String get diagPerformance => 'Prestasi';

  @override
  String get diagInference => 'Masa inferens';

  @override
  String get diagDetectHz => 'Kadar pengesanan';

  @override
  String get diagCameraFps => 'Kadar bingkai kamera';

  @override
  String get diagMemory => 'Memori';

  @override
  String get diagDropped => 'Bingkai digugurkan';

  @override
  String get diagSegmentation => 'Masa segmentasi';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Status';

  @override
  String get diagSource => 'Sumber';

  @override
  String get diagSourceCamera => 'Kamera langsung';

  @override
  String get diagSourceFile => 'Fail rakaman ujian';

  @override
  String get diagResolution => 'Saiz penimbal';

  @override
  String get diagLens => 'Kanta';

  @override
  String get diagError => 'Ralat terakhir';

  @override
  String get diagModel => 'Model AI';

  @override
  String get diagModelLoad => 'Masa muat model';

  @override
  String get diagPower => 'Kuasa';

  @override
  String get diagSegHz => 'Kadar segmentasi';

  @override
  String get diagReduced => 'Kesan dikurangkan';

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
  String get diagCamIdle => 'Melahu';

  @override
  String get diagCamStarting => 'Memulakan';

  @override
  String get diagCamRunning => 'Berjalan';

  @override
  String get diagCamInterrupted => 'Terganggu';

  @override
  String get diagCamStopped => 'Dihentikan';

  @override
  String get diagCamUnavailable => 'Tidak tersedia';

  @override
  String get diagCamPermissionDenied => 'Kebenaran ditolak';

  @override
  String get diagCamError => 'Ralat';

  @override
  String get diagTestFootage => 'Rakaman ujian';

  @override
  String get diagTestFootageBody =>
      'Jalankan pengesanan sebenar pada peranti ke atas fail video setempat dan bukannya kamera. Setiap paparan melabelkannya RAKAMAN UJIAN.';

  @override
  String get diagPathLabel => 'Laluan fail video';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Gunakan Documents/test_drive.mp4';

  @override
  String get diagRun => 'Jalankan rakaman ujian';

  @override
  String get diagRunStarted =>
      'Rakaman ujian dimulakan. Buka paparan pemanduan untuk melihatnya.';

  @override
  String get diagBackToCamera => 'Kembali ke kamera langsung';

  @override
  String get diagDebugOnly =>
      'Rakaman ujian hanya tersedia dalam binaan pembangunan.';

  @override
  String get diagFileMissing => 'Tiada fail pada laluan itu.';

  @override
  String get emergencySetupTitle => 'Pengesanan hentakan';

  @override
  String get emergencyExperimental => 'Eksperimen';

  @override
  String get emergencyIntro =>
      'Semasa pemanduan, Corvista boleh memantau kemungkinan hentakan teruk menggunakan penderia gerakan iPhone anda. Jika dikesan, kira detik bermula. Jika anda tidak membatalkannya, Corvista menawarkan untuk menghubungi perkhidmatan kecemasan dan menghantar mesej kepada kenalan anda.';

  @override
  String get emergencyDisclaimer1 =>
      'Bukan pengganti perkhidmatan kecemasan atau pengesanan kemalangan terbina dalam kenderaan anda.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS sentiasa meminta anda mengesahkan sebelum panggilan dibuat atau mesej dihantar.';

  @override
  String get emergencyDisclaimer3 =>
      'Hentakan boleh terlepas pandang, dan brek mengejut atau jalan bergelombang boleh disalah anggap sebagai hentakan.';

  @override
  String get emergencyParkedWarning =>
      'Lengkapkan persediaan ini semasa berhenti. Tetapan dikunci semasa kenderaan bergerak.';

  @override
  String get emergencyEnable => 'Dayakan pengesanan hentakan';

  @override
  String get emergencyEnableSubtitle => 'Aktif hanya semasa sesi pemanduan';

  @override
  String get emergencyNeedNumber => 'Tambah nombor kecemasan dahulu.';

  @override
  String get emergencyContacts => 'Kenalan kecemasan';

  @override
  String get emergencyAddContact => 'Tambah kenalan';

  @override
  String get emergencyNoContacts =>
      'Belum ada kenalan. Kenalan hanya menerima mesej selepas anda mengesahkannya.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Alih keluar $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Mereka tidak akan ditawarkan sebagai penerima selepas hentakan.';

  @override
  String get emergencyRemove => 'Alih keluar';

  @override
  String get emergencyContactsError => 'Kenalan tidak dapat dimuatkan.';

  @override
  String get emergencyNumber => 'Nombor kecemasan';

  @override
  String get emergencyNumberHint => 'cth. 999 atau 112';

  @override
  String get emergencyMessage => 'Templat mesej';

  @override
  String get emergencyMessageDefault =>
      'Saya mungkin terlibat dalam kemalangan kenderaan. Mesej ini disediakan oleh Corvista dan menyertakan lokasi terakhir saya yang diketahui jika ada.';

  @override
  String get emergencyMessageHint =>
      'Biarkan kosong untuk menggunakan mesej lalai.';

  @override
  String get emergencyCountdown => 'Tempoh kira detik';

  @override
  String get emergencyVoiceCancel => 'Batal dengan suara';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Sebut “Saya OK” atau “Batal” semasa kira detik. Menggunakan pengecaman pertuturan pada peranti jika tersedia.';

  @override
  String get emergencyVoicePermDenied =>
      'Akses mikrofon dan pengecaman pertuturan diperlukan untuk pembatalan suara.';

  @override
  String get emergencyAutoSave => 'Simpan klip insiden secara automatik';

  @override
  String get emergencyTest => 'Uji kira detik (tanpa panggilan)';

  @override
  String get emergencyTestBody =>
      'Menjalankan simulasi hentakan supaya anda dapat melihat kira detik. Tiada panggilan atau mesej dibuat dalam mod ujian.';

  @override
  String get emergencyNotSet => 'Belum ditetapkan';

  @override
  String get emergencyAlertHeadline => 'Kemungkinan hentakan teruk dikesan.';

  @override
  String get emergencyAlertSubtitle => 'Adakah anda selamat?';

  @override
  String get emergencyAlertCancel => 'Saya OK — Batal';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds saat lagi',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Mendengar — sebut “Saya OK” untuk membatalkan';

  @override
  String emergencyAlertHeard(String text) {
    return 'Didengari: “$text”';
  }

  @override
  String get emergencyAlertEscalated => 'Tiada respons. Pilih tindakan:';

  @override
  String get emergencyAlertCall => 'Hubungi perkhidmatan kecemasan';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Memanggil $number. iOS meminta anda mengesahkan.';
  }

  @override
  String get emergencyAlertMessage => 'Mesej kenalan';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Membuka mesej yang telah disediakan. Anda yang memutuskan sama ada untuk menghantarnya.';

  @override
  String get emergencyAlertTestMode =>
      'Mod ujian — tiada panggilan akan dibuat';

  @override
  String get emergencyAlertTestBadge => 'UJIAN';

  @override
  String get emergencyAlertClose => 'Saya OK — Tutup';

  @override
  String get emergencyMsgSent => 'Mesej dihantar.';

  @override
  String get emergencyMsgCancelled => 'Mesej tidak dihantar.';

  @override
  String get emergencyMsgFailed => 'Mesej tidak dapat dihantar.';

  @override
  String get emergencyMsgUnavailable =>
      'Pemesejan tidak tersedia pada peranti ini.';

  @override
  String emergencyCallFailed(String number) {
    return 'Panggilan tidak dapat dimulakan. Dail $number sendiri.';
  }

  @override
  String get modelsTitle => 'Model AI';

  @override
  String get modelsIntro =>
      'Semua model disertakan dalam apl dan berjalan sepenuhnya pada iPhone anda. Suapan kamera anda tidak pernah meninggalkan peranti.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Langsung: $ms ms setiap bingkai · $hz pengesanan/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Dimuatkan dalam $ms ms';
  }

  @override
  String get modelsEfficientName => 'Cekap';

  @override
  String get modelsEfficientDesc =>
      'Pengesan pantas dan padat yang ditala untuk pemanduan jauh dengan haba dan penggunaan bateri yang rendah.';

  @override
  String get modelsEnhancedName => 'Dipertingkat';

  @override
  String get modelsEnhancedDesc =>
      'Pengesan lebih besar yang menemui objek lebih kecil dan lebih jauh, dengan kos kuasa lebih tinggi.';

  @override
  String get modelsSegmentationName => 'Segmentasi';

  @override
  String get modelsSegmentationDesc =>
      'Menggabungkan pengesanan pantas dengan topeng permukaan jalan dan objek untuk paparan Persepsi.';

  @override
  String get modelsNoneName => 'AI dijeda';

  @override
  String get modelsNoneDesc =>
      'Kamera dan rakaman terus berjalan tanpa pengesanan objek. Penggunaan kuasa terendah.';

  @override
  String get modelsGenericDesc => 'Model pengesanan objek pada peranti.';

  @override
  String get modelsFunctionDetection =>
      'Mengesan kenderaan, orang, basikal, motosikal, bas, lampu isyarat dan papan tanda berhenti';

  @override
  String get modelsFunctionSegmentation =>
      'Menambah topeng permukaan jalan dan objek';

  @override
  String get modelsFunctionNone => 'Tiada pengesanan; rakaman dashcam sahaja';

  @override
  String get modelsSize => 'Saiz';

  @override
  String get modelsInput => 'Input';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Berfungsi dengan';

  @override
  String get modelsStatusInstalled => 'Dipasang (terbina dalam)';

  @override
  String get modelsStatusNotInstalled => 'Tidak dipasang';

  @override
  String get modelsSelected => 'Dipilih';

  @override
  String get modelsUse => 'Gunakan model ini';

  @override
  String get modelsSwitching => 'Memuatkan model…';

  @override
  String modelsSwitched(String name) {
    return '$name kini aktif';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Diukur pada peranti ini: purata $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Belum diukur pada peranti ini';

  @override
  String get modelsBenchmarkRun => 'Jalankan penanda aras';

  @override
  String get modelsBenchmarkRunning => 'Menjalankan penanda aras…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Pilih model ini untuk menanda arasnya.';

  @override
  String get modelsBenchmarkDone => 'Penanda aras selesai';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Penanda aras gagal: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Dikemas kini kali terakhir $date';
  }

  @override
  String get safetyTitle => 'Maklumat keselamatan';

  @override
  String get safetyIntro =>
      'Corvista ialah alat bantu kesedaran pemanduan. Ia tidak mengawal kenderaan anda dan tidak dapat menggantikan perhatian, pertimbangan anda atau sistem keselamatan kenderaan.';

  @override
  String get safetyBeforeTitle => 'Sebelum memandu';

  @override
  String get safetyBefore1 =>
      'Pasang iPhone anda dengan selamat di kedudukan yang sah dan tidak menghalang pandangan, beg udara atau kawalan anda.';

  @override
  String get safetyBefore2 =>
      'Selesaikan persediaan, pilih paparan dan tetapkan destinasi semasa berhenti.';

  @override
  String get safetyBefore3 =>
      'Sambungkan pengecas untuk pemanduan yang lebih jauh dan jauhkan telefon daripada cahaya matahari langsung jika boleh.';

  @override
  String get safetyWhileTitle => 'Semasa memandu';

  @override
  String get safetyWhile1 =>
      'Pandang ke jalan. Gunakan kawalan skrin yang besar hanya apabila selamat dan sah di sisi undang-undang.';

  @override
  String get safetyWhile2 =>
      'Amaran ialah bantuan, bukan peringatan yang boleh anda harapkan sepenuhnya. Senyap tidak sekali-kali bermakna jalan selamat.';

  @override
  String get safetyWhile3 =>
      'Patuhi undang-undang lalu lintas, isyarat dan papan tanda jalan — bukan apl — apabila ia bercanggah.';

  @override
  String get safetyLimitsTitle => 'Batasan';

  @override
  String get safetyLimits1 =>
      'Satu kamera telefon hanya melihat apa yang ada di hadapannya. Objek di luar pandangannya, terlindung atau sangat dekat tidak dikesan.';

  @override
  String get safetyLimits2 =>
      'Pengesanan mungkin terlepas, lewat atau salah, terutamanya pada waktu malam, semasa hujan, kabus, silau atau cermin depan yang kotor.';

  @override
  String get safetyLimits3 =>
      'Hanya kategori yang disokong dikenali: kenderaan, bas, motosikal, basikal, orang, lampu isyarat dan papan tanda berhenti. Petunjuk lorong dalam paparan maya ialah ilustrasi, bukan lorong yang dikesan.';

  @override
  String get safetyLimits4 =>
      'Kedekatan ditunjukkan sebagai zon anggaran (Sangat dekat, Dekat, Sederhana, Jauh), bukan jarak yang diukur. Paparan parkir bukan pengganti penderia parkir.';

  @override
  String get safetyHeatTitle => 'Haba dan bateri';

  @override
  String get safetyHeat1 =>
      'Penggunaan kamera dan AI yang berterusan memanaskan iPhone anda. Corvista menurunkan kadar analisis apabila peranti menjadi panas dan menunjukkan amaran; jika iOS terlalu panas, kamera mungkin berhenti.';

  @override
  String get safetyEmergencyTitle => 'Ciri kecemasan';

  @override
  String get safetyEmergency1 =>
      'Pengesanan kemungkinan hentakan adalah eksperimen. Ia boleh terlepas kemalangan sebenar dan boleh dicetuskan oleh kejadian lain.';

  @override
  String get safetyEmergency2 =>
      'Ia tidak pernah menghubungi sesiapa secara senyap: iOS sentiasa meminta anda mengesahkan panggilan atau mesej. Ia bukan pengganti menghubungi perkhidmatan kecemasan sendiri.';

  @override
  String get privacyTitle => 'Privasi';

  @override
  String get privacyIntro =>
      'Corvista direka untuk memastikan data pemanduan anda kekal pada iPhone anda. Tiada akaun Corvista, dan Corvista tidak menjalankan pelayannya sendiri.';

  @override
  String get privacyCameraTitle => 'Kamera dan AI';

  @override
  String get privacyCamera1 =>
      'Pengesanan objek, penjejakan dan segmentasi berjalan sepenuhnya pada iPhone anda. Bingkai kamera tidak pernah dimuat naik.';

  @override
  String get privacyCamera2 =>
      'Kamera hanya berjalan semasa Corvista dibuka pada skrin. Ia dijeda apabila apl beralih ke latar belakang — tiada rakaman latar belakang tersembunyi.';

  @override
  String get privacyRecordingsTitle => 'Rakaman';

  @override
  String get privacyRecordings1 =>
      'Penimbal bergolek bersifat sementara dan ditulis ganti secara berterusan. Rakaman hanya disimpan apabila anda mengetik Simpan Insiden atau, jika anda mendayakannya, selepas kemungkinan hentakan.';

  @override
  String get privacyRecordings2 =>
      'Klip yang disimpan kekal dalam storan peribadi Corvista pada iPhone anda. Ia hanya meninggalkan peranti apabila anda memilih Kongsi. Memadam apl akan memadam klip tersebut.';

  @override
  String get privacyRecordings3 =>
      'Audio hanya dirakam jika anda menghidupkannya dan memberikan akses mikrofon.';

  @override
  String get privacyLocationTitle => 'Lokasi';

  @override
  String get privacyLocation1 =>
      'Lokasi digunakan semasa apl dibuka untuk kelajuan, peta, laluan dan cuaca anda. Jika “Simpan lokasi” dihidupkan, kedudukan semasa penyimpanan disimpan bersama klip pada peranti anda.';

  @override
  String get privacyNetworkTitle => 'Perkhidmatan rangkaian';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — paparan peta, carian tempat dan laluan. Teks carian dan lokasi anggaran anda dihantar kepada Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — cuaca semasa dan setiap jam untuk lokasi anda.';

  @override
  String get privacyNetwork4 =>
      'Corvista tidak mengandungi iklan dan tiada analitik atau penjejakan pihak ketiga.';

  @override
  String get privacyEmergencyTitle => 'Kenalan kecemasan';

  @override
  String get privacyEmergency1 =>
      'Kenalan yang anda pilih disimpan dalam Keychain iOS pada peranti ini. Pembatalan suara menggunakan pengecaman pertuturan pada peranti jika tersedia. Panggilan dan mesej hanya dihantar selepas anda mengesahkannya dalam iOS.';

  @override
  String get privacyControlsTitle => 'Kawalan anda';

  @override
  String get privacyControls1 =>
      'Anda boleh memadam klip pada bila-bila masa dalam Klip, dan menukar atau menarik balik akses kamera, mikrofon, lokasi dan pertuturan dalam Tetapan iOS.';

  @override
  String get termsTitle => 'Terma Penggunaan';

  @override
  String get termsIntro =>
      'Dengan menggunakan Corvista, anda bersetuju dengan terma ini. Perjanjian Lesen Pengguna Akhir Aplikasi Berlesen standard Apple juga terpakai.';

  @override
  String get termsUseTitle => 'Menggunakan Corvista';

  @override
  String get termsUse1 =>
      'Corvista ialah alat bantu kesedaran pemanduan dan dashcam. Anda kekal bertanggungjawab sepenuhnya untuk memandu dengan selamat dan mengikut undang-undang pada setiap masa.';

  @override
  String get termsUse2 =>
      'Jangan berinteraksi dengan apl dengan cara yang mengalihkan perhatian anda semasa memandu. Pasang peranti dengan selamat dan mengikut undang-undang.';

  @override
  String get termsAccuracyTitle => 'Tiada jaminan ketepatan';

  @override
  String get termsAccuracy1 =>
      'Pengesanan, zon, amaran, penanda peta, laluan dan cuaca boleh tidak lengkap, lewat atau salah. Corvista tidak mengawal kenderaan anda.';

  @override
  String get termsAccuracy2 =>
      'Ciri kecemasan adalah eksperimen dan mungkin gagal mengesan hentakan atau tercetus secara palsu.';

  @override
  String get termsRecordingTitle => 'Undang-undang rakaman';

  @override
  String get termsRecording1 =>
      'Undang-undang tentang dashcam, rakaman audio dan merakam orang berbeza mengikut negara dan wilayah. Anda bertanggungjawab mematuhinya, termasuk apabila anda berkongsi klip.';

  @override
  String get termsLiabilityTitle => 'Liabiliti';

  @override
  String get termsLiability1 =>
      'Apl ini disediakan “seperti sedia ada”. Setakat yang dibenarkan oleh undang-undang, pembangun tidak bertanggungjawab atas kemalangan, kerugian, denda atau kerosakan yang timbul daripada penggunaannya atau daripada pergantungan pada outputnya.';

  @override
  String get termsChangesTitle => 'Perubahan';

  @override
  String get termsChanges1 =>
      'Terma ini boleh dikemas kini bersama versi baharu apl. Penggunaan berterusan selepas kemas kini bermakna anda menerima terma yang disemak.';

  @override
  String get helpTitle => 'Bantuan';

  @override
  String get helpIntro =>
      'Jawapan kepada soalan lazim. Untuk panduan keselamatan, lihat Maklumat keselamatan.';

  @override
  String get helpQSave => 'Bagaimanakah cara menyimpan rakaman insiden?';

  @override
  String get helpASaveBuffer =>
      'Ketik butang besar Simpan Insiden dalam paparan pemanduan. Corvista menyimpan 20 atau 30 saat terakhir penimbal bergulingnya (pilihan anda dalam Tetapan › Rakaman) ke Klip.';

  @override
  String get helpQWhere => 'Di manakah klip saya disimpan?';

  @override
  String get helpAWhere =>
      'Dalam storan peribadi Corvista pada iPhone anda. Ia tidak pernah dimuat naik. Gunakan Kongsi dalam pemain untuk menghantar atau mengeksport klip.';

  @override
  String get helpQZones => 'Setepat manakah zon kedekatan?';

  @override
  String get helpAZones =>
      'Zon ialah anggaran kasar daripada satu kamera menggunakan saiz objek lazim. Anggap ia sebagai petunjuk anggaran, bukan jarak.';

  @override
  String get helpQSlow => 'Mengapa pengesanan menjadi perlahan?';

  @override
  String get helpASlow =>
      'Apabila iPhone anda menjadi panas, bateri rendah atau Mod Kuasa Rendah dihidupkan, Corvista mengurangkan kadar analisis untuk melindungi peranti. Anda boleh menukar mod kuasa dalam Tetapan.';

  @override
  String get helpQMap => 'Peta, carian atau cuaca tidak berfungsi.';

  @override
  String get helpAMap =>
      'Ciri ini memerlukan sambungan internet dan akses lokasi. Semak sambungan anda dan benarkan lokasi untuk Corvista dalam Tetapan iOS.';

  @override
  String get helpQSimulator => 'Kamera ditunjukkan sebagai tidak tersedia.';

  @override
  String get helpASimulator =>
      'Pastikan akses kamera dibenarkan dalam Tetapan iOS dan tiada apl lain menggunakan kamera. Pada Simulator iOS tiada kamera; video ujian setempat boleh digunakan sebagai ganti.';

  @override
  String get emergencyMsgNoContacts => 'Tambah kenalan kecemasan dahulu.';

  @override
  String get cameraStarting => 'Memulakan kamera…';

  @override
  String get cameraInterrupted => 'Kamera dijeda';

  @override
  String get cameraInterruptedBody =>
      'iOS menjeda kamera, contohnya semasa panggilan atau ketika apl lain menggunakannya. Ia disambung semula secara automatik.';

  @override
  String get cameraUnavailable => 'Kamera tidak tersedia';

  @override
  String get cameraUnavailableBody =>
      'Tiada kamera tersedia pada peranti ini. Paparan pengesanan, rakaman dan parkir memerlukan kamera belakang.';

  @override
  String get cameraRunTestFootage => 'Jalankan rakaman ujian';

  @override
  String get cameraPermissionDenied => 'Akses kamera dimatikan';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista memerlukan kamera untuk pengesanan, rakaman dashcam dan paparan parkir. Hidupkan akses Kamera dalam Tetapan.';

  @override
  String get cameraError => 'Ralat kamera';

  @override
  String get cameraStopped => 'Kamera dihentikan';

  @override
  String get cameraStart => 'Mulakan kamera';

  @override
  String get cameraFocusHint => 'Ketik untuk fokus';

  @override
  String get cameraPreviewLabel =>
      'Paparan kamera langsung dengan objek yang dikesan';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · AI $hz Hz · $ms ms · digugurkan $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Kelajuan $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Tiada kelajuan GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Arah $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Rakaman penimbal dashcam, $seconds daripada $target saat dalam penimbal';
  }

  @override
  String get hudRecIdle => 'REC mati';

  @override
  String get hudRecSaving => 'Menyimpan…';

  @override
  String get hudRecError => 'Ralat REC';

  @override
  String get hudAiPaused => 'AI dijeda';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objek',
      zero: 'Tiada objek',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objek',
      zero: 'tiada objek',
    );
    return 'Model AI $model, $_temp0 dikesan';
  }

  @override
  String get hudThermalSerious => 'Panas — AI diperlahankan';

  @override
  String get hudThermalCritical => 'Terlalu panas — AI dijeda';

  @override
  String hudBatteryLow(String percent) {
    return 'Bateri $percent';
  }

  @override
  String get hudLowPower => 'Mod Kuasa Rendah';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Cuaca $temperature, $condition. Ketik untuk butiran.';
  }

  @override
  String get hudNoGuidance =>
      'Cari destinasi pada paparan Peta untuk melihat panduan belokan demi belokan di sini.';

  @override
  String get navArrived => 'Anda telah tiba';

  @override
  String get navRerouting => 'Mengira semula laluan…';

  @override
  String get navSearchHint => 'Cari destinasi';

  @override
  String get navSearchFieldHint => 'Alamat, tempat atau perniagaan';

  @override
  String get navNoResults => 'Tiada tempat yang sepadan';

  @override
  String get navSearching => 'Mencari…';

  @override
  String get navSearchStartTyping =>
      'Taip alamat atau nama tempat. Hasil datang daripada Apple Maps dan memerlukan sambungan internet.';

  @override
  String get navErrorUnavailable =>
      'Carian dan laluan tidak tersedia — semak sambungan internet anda.';

  @override
  String get navErrorNoLocation =>
      'Menunggu lokasi anda untuk merancang laluan.';

  @override
  String get navErrorPermission =>
      'Akses lokasi dimatikan, jadi laluan tidak boleh bermula dari kedudukan anda.';

  @override
  String navErrorGeneric(String code) {
    return 'Laluan tidak dapat dimuatkan ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Laluan ke $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Tiba $time';
  }

  @override
  String get navStart => 'Mula';

  @override
  String get navEnd => 'Tamat';

  @override
  String get navEndLabel => 'Tamatkan navigasi';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration lagi';
  }

  @override
  String navAdvisory(String text) {
    return 'Nasihat: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours j $minutes min';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Laluan $index: $name';
  }

  @override
  String get weatherTitle => 'Cuaca';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Terasa seperti $temperature';
  }

  @override
  String get weatherPrecipitation => 'Hujan';

  @override
  String get weatherWind => 'Angin';

  @override
  String get weatherVisibility => 'Jarak penglihatan';

  @override
  String get weatherHumidity => 'Kelembapan';

  @override
  String get weatherHourly => 'Beberapa jam seterusnya';

  @override
  String weatherAsOf(String time) {
    return 'Dikemas kini $time';
  }

  @override
  String get weatherRefresh => 'Segarkan cuaca';

  @override
  String get weatherUnavailable => 'Cuaca tidak tersedia buat masa ini.';

  @override
  String get weatherNoLocation => 'Cuaca memerlukan lokasi anda.';

  @override
  String get weatherLegal => 'Sumber data & perkara undang-undang';

  @override
  String weatherProvidedBy(String service) {
    return 'Data cuaca: $service';
  }

  @override
  String get weatherNow => 'Kini';

  @override
  String get virtualEmpty => 'Tiada objek yang disokong dikesan';

  @override
  String get virtualEmptyCameraOff =>
      'Paparan maya memerlukan kamera langsung.';

  @override
  String get virtualLaneDisclaimer =>
      'Garisan lorong adalah ilustrasi, bukan hasil pengesanan.';

  @override
  String virtualNearest(String zone) {
    return 'Terdekat: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Pemandangan jalan maya: $summary';
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
  String get virtualStatusLive => 'aktif';

  @override
  String get virtualStatusPaused => 'dijeda';

  @override
  String get virtualStatusCameraOff => 'Kamera mati';

  @override
  String get virtualStatusTestFootage => 'Rakaman ujian';

  @override
  String get virtualEmptyHint =>
      'Kenderaan, orang, basikal, lampu dan papan tanda berhenti muncul di sini apabila dikesan.';

  @override
  String get mapRecenter => 'Pusatkan semula';

  @override
  String get mapZoomIn => 'Zum masuk';

  @override
  String get mapZoomOut => 'Zum keluar';

  @override
  String get mapUnsupported => 'Peta interaktif tersedia pada iPhone.';

  @override
  String get mapObjectsApprox => 'Penanda objek ialah kedudukan anggaran.';

  @override
  String get mapWeatherUnavailable => 'Cuaca tidak tersedia';

  @override
  String get navErrorNoRoute => 'Tiada laluan ditemui ke destinasi ini.';

  @override
  String get navDismiss => 'Tutup';

  @override
  String get navGo => 'Pergi';

  @override
  String get navFastest => 'Terpantas';

  @override
  String get navThen => 'Kemudian';

  @override
  String get navRecents => 'Terkini';

  @override
  String get navClearRecents => 'Kosongkan';

  @override
  String get navSearchSubmitHint =>
      'Tekan Cari untuk melihat semua tempat yang sepadan';

  @override
  String get navPlaces => 'Tempat';

  @override
  String get navEtaLabel => 'ketibaan';

  @override
  String get navTimeLeftLabel => 'lagi';

  @override
  String get navOverview => 'Gambaran keseluruhan';

  @override
  String get navMute => 'Bisukan suara';

  @override
  String get navUnmute => 'Nyahbisu suara';

  @override
  String get navEndConfirm => 'Tamatkan navigasi?';

  @override
  String navEndConfirmBody(String place) {
    return 'Panduan ke $place akan dihentikan.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Anda telah tiba di $place';
  }

  @override
  String get navDone => 'Selesai';

  @override
  String get navWeakGps => 'Isyarat GPS lemah';

  @override
  String get navLocationOff =>
      'Lokasi dimatikan. Hidupkannya untuk merancang laluan dan bernavigasi.';

  @override
  String get navVoiceGuidance => 'Panduan suara';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Dalam $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, kemudian $second';
  }

  @override
  String get navSpeakRerouting => 'Mengira semula laluan';

  @override
  String get navSpeakArrived => 'Anda telah tiba';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meter',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilometer',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kaki',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ela',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Teruskan sejauh $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Arah tidak tersedia untuk perjalanan ini di rantau ini. Cuba destinasi lain.';

  @override
  String navContinueFor(String distance) {
    return 'Teruskan sejauh $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value batu',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Terdekat: $object · $zone';
  }

  @override
  String get parkingNothing => 'Tiada apa-apa dikesan dalam pandangan';

  @override
  String get parkingBeeps => 'Bip kedekatan';

  @override
  String get parkingVolume => 'Kelantangan bip';

  @override
  String get parkingLimitations =>
      'Satu kamera, bukan 360°. Objek di luar pandangan kamera tidak dikesan. Bukan pengganti penderia parkir; anggaran boleh salah dan senyap tidak bermakna kawasan itu selamat.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Paparan kedekatan dari atas. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Asal';

  @override
  String get perceptionModeBoxes => 'Kotak';

  @override
  String get perceptionModeMasks => 'Topeng objek';

  @override
  String get perceptionModeRoad => 'Permukaan jalan';

  @override
  String get perceptionModeCombined => 'Gabungan';

  @override
  String get perceptionOpacity => 'Kelegapan topeng';

  @override
  String get perceptionDisclaimer =>
      'Topeng permukaan jalan ialah lapisan visual anggaran. Ia tidak menunjukkan ruang yang boleh dilalui atau lorong.';

  @override
  String get perceptionNeedsModel =>
      'Pilih model Segmentasi untuk melihat topeng.';

  @override
  String get perceptionChooseModel => 'Pilih model';

  @override
  String get perceptionWaiting => 'Menunggu bingkai segmentasi pertama…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Kotak';

  @override
  String get perceptionShortObjects => 'Objek';

  @override
  String get perceptionShortRoad => 'Jalan';

  @override
  String get perceptionShortAll => 'Semua';

  @override
  String get perceptionModesLabel => 'Lapisan persepsi';

  @override
  String get perceptionStatusWarmingUp => 'Memanaskan…';

  @override
  String get perceptionStatusLoadingModel => 'Memuatkan model…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Topeng dijeda';

  @override
  String get perceptionLegend => 'Legenda topeng';

  @override
  String get perceptionUnavailable => 'Topeng tidak tersedia';

  @override
  String get driveSave => 'Simpan';

  @override
  String get driveSaveIncident => 'Simpan insiden';

  @override
  String driveSaveHint(int seconds) {
    return 'Menyimpan $seconds saat terakhir rakaman dashcam';
  }

  @override
  String get driveSaving => 'Menyimpan insiden…';

  @override
  String hudRecManualLabel(String time) {
    return 'Merakam, $time';
  }

  @override
  String get driveRecord => 'Rakam';

  @override
  String get driveRecordStartA11y => 'Mula merakam';

  @override
  String driveRecordStopA11y(String time) {
    return 'Henti merakam, $time dirakam';
  }

  @override
  String get driveRecordHint =>
      'Merakam berterusan sehingga anda menghentikannya, termasuk 5 saat sebelumnya';

  @override
  String get driveRecordFailed => 'Tidak dapat memulakan rakaman';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rakaman disimpan · $count bahagian',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Rakaman dihentikan: storan hampir penuh',
      'max_duration': 'Rakaman dihentikan: panjang maksimum dicapai',
      'camera_stopped': 'Rakaman dihentikan bersama kamera',
      'background': 'Rakaman dihentikan: apl beralih ke latar belakang',
      'thermal': 'Rakaman dihentikan: telefon terlalu panas',
      'other': 'Rakaman dihentikan',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Insiden disimpan · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Lihat';

  @override
  String get driveSaveFailed => 'Insiden tidak dapat disimpan.';

  @override
  String get driveSaveNotRunning =>
      'Rakaman belum bermula — tunggu kamera bermula, kemudian cuba lagi.';

  @override
  String get driveSaveTestFootage =>
      'Rakaman ujian tidak dirakam. Penyimpanan insiden berfungsi dengan kamera langsung.';

  @override
  String get driveSaveStorageFull =>
      'Storan iPhone anda penuh. Kosongkan ruang atau padam klip yang lebih lama.';

  @override
  String get driveSaveIoError => 'Klip tidak dapat ditulis ke storan.';

  @override
  String get driveClips => 'Klip';

  @override
  String get driveSettings => 'Tetapan';

  @override
  String get driveViewSwitcher => 'Paparan pemanduan';

  @override
  String get driveLocationDenied =>
      'Lokasi dimatikan — kelajuan, peta dan laluan tidak tersedia.';

  @override
  String get driveCameraDenied =>
      'Akses kamera dimatikan — pengesanan dan rakaman tidak tersedia.';

  @override
  String get driveRecorderFallback =>
      'Merakam tanpa audio: akses mikrofon dimatikan.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Tetapan rakaman telah dilaraskan: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhone anda panas. AI berjalan lebih perlahan untuk menyejukkan — jauhkan daripada cahaya matahari langsung dan dekat bukaan penyaman udara.';

  @override
  String get drivePowerThermalCritical =>
      'iPhone anda terlalu panas. Pengesanan AI dijeda sehingga ia sejuk; rakaman diteruskan jika boleh.';

  @override
  String get drivePowerLowPower =>
      'Mod Kuasa Rendah dihidupkan — AI berjalan pada kadar yang dikurangkan.';

  @override
  String get drivePowerBatteryLow =>
      'Bateri rendah — sambungkan iPhone anda kepada kuasa semasa memandu.';

  @override
  String get onboardingTitle1 => 'Lihat lebih banyak dalam setiap pemanduan.';

  @override
  String get onboardingBody1 =>
      'Jadikan iPhone anda dashcam pintar dan teman kesedaran pemanduan.';

  @override
  String get onboardingTitle2 => 'Kecerdasan dalam setiap bingkai.';

  @override
  String get onboardingBody2 =>
      'Kenali kenderaan, orang, basikal dan isyarat jalan yang disokong terus pada iPhone anda.';

  @override
  String get onboardingTitle3 => 'Satu jalan. Pelbagai perspektif.';

  @override
  String get onboardingBody3 =>
      'Beralih antara pengesanan langsung, paparan pemanduan maya, peta interaktif dan visualisasi parkir.';

  @override
  String get onboardingTitle4 => 'Simpan detik yang penting.';

  @override
  String get onboardingBody4 =>
      'Simpan rakaman dashcam terkini, semak insiden dan kongsi rakaman.';

  @override
  String get onboardingTitle5 => 'Keselamatan & privasi';

  @override
  String get onboardingSafety1 =>
      'Corvista ialah alat bantu kesedaran pemanduan. Pandang ke jalan.';

  @override
  String get onboardingSafety2 =>
      'Ia tidak mengawal kenderaan anda atau menggantikan pertimbangan anda.';

  @override
  String get onboardingSafety3 =>
      'Pengesanan dan anggaran mungkin tidak tepat atau terlepas.';

  @override
  String get onboardingSafety4 =>
      'Pemprosesan kamera berlaku pada iPhone anda — video tidak dimuat naik.';

  @override
  String get onboardingSafety5 =>
      'Peta, carian, laluan dan cuaca memerlukan sambungan internet.';

  @override
  String get onboardingSafety6 =>
      'Pasang iPhone anda dengan selamat supaya tidak menghalang pandangan anda.';

  @override
  String get onboardingSafety7 =>
      'Lengkapkan persediaan sebelum anda mula memandu.';

  @override
  String get onboardingAcknowledge =>
      'Saya faham Corvista ialah alat bantu kesedaran dan saya kekal bertanggungjawab untuk memandu dengan selamat.';

  @override
  String get onboardingReadSafety => 'Baca maklumat keselamatan penuh';

  @override
  String get onboardingNext => 'Seterusnya';

  @override
  String get onboardingSkip => 'Langkau';

  @override
  String get onboardingAgree => 'Teruskan';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Halaman $current daripada $total';
  }

  @override
  String get permTitle => 'Kebenaran';

  @override
  String get permIntro =>
      'Corvista hanya meminta apa yang diperlukan oleh setiap ciri. Anda boleh menukarnya pada bila-bila masa dalam Tetapan.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Diperlukan untuk pengesanan, rakaman dashcam dan paparan parkir. Video diproses pada iPhone anda.';

  @override
  String get permLocationTitle => 'Lokasi';

  @override
  String get permLocationBody =>
      'Digunakan untuk kelajuan GPS, peta, laluan, cuaca dan menanda klip yang disimpan. Hanya semasa anda menggunakan apl.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'Pengecaman pertuturan hanya diminta jika anda menghidupkan pembatalan suara untuk amaran kecemasan.';

  @override
  String get permRequired => 'Diperlukan';

  @override
  String get permOptional => 'Pilihan';

  @override
  String get permAllow => 'Benarkan';

  @override
  String get permGranted => 'Dibenarkan';

  @override
  String get permDenied => 'Ditolak';

  @override
  String get permLimited => 'Terhad';

  @override
  String get permRestricted => 'Disekat';

  @override
  String get permStart => 'Mula memandu';

  @override
  String get permCameraNeeded =>
      'Anda boleh meneruskan tanpa akses kamera, tetapi pengesanan dan rakaman tidak akan berfungsi sehingga anda membenarkannya dalam Tetapan.';

  @override
  String get permSetupIntro =>
      'Corvista memerlukan kebenaran ini untuk berfungsi sepenuhnya. Ketik Benarkan semua dan iOS akan bertanya satu demi satu. Anda boleh menukarnya pada bila-bila masa dalam Tetapan.';

  @override
  String get permCameraLine =>
      'Diperlukan untuk pengesanan, rakaman dashcam dan paparan parkir. Video diproses pada iPhone anda, tidak pernah dimuat naik.';

  @override
  String get permLocationLine =>
      'Kelajuan GPS, peta, laluan, cuaca dan tempat klip disimpan. Hanya semasa anda menggunakan apl.';

  @override
  String get permMicLine =>
      'Audio kabin dalam klip insiden, dan mendengar frasa pembatalan anda semasa amaran kecemasan.';

  @override
  String get permSpeechTitle => 'Pengecaman pertuturan';

  @override
  String get permSpeechLine =>
      'Mengecam frasa pembatalan anda semasa kira detik kecemasan, pada iPhone anda jika disokong.';

  @override
  String get permAllowAll => 'Benarkan semua';

  @override
  String permAsking(String permission) {
    return 'Meminta $permission…';
  }

  @override
  String get permSomeDenied =>
      'Sesetengah kebenaran dimatikan. Hidupkannya dalam Tetapan untuk menggunakan ciri tersebut.';

  @override
  String get permNotNow => 'Bukan sekarang';

  @override
  String get tourLabel => 'Lawatan skrin pemanduan';

  @override
  String tourProgress(int current, int total) {
    return 'Langkah $current daripada $total';
  }

  @override
  String get tourNext => 'Seterusnya';

  @override
  String get tourBack => 'Kembali';

  @override
  String get tourSkip => 'Langkau lawatan';

  @override
  String get tourFinish => 'Mula memandu';

  @override
  String get tourWelcomeTitle => 'Lawatan ringkas anda';

  @override
  String get tourWelcomeBody =>
      'Pandangan seminit tentang perkara penting pada skrin Pemanduan. Paling baik dilakukan semasa berhenti.';

  @override
  String get tourHudTitle => 'Jalur instrumen anda';

  @override
  String get tourHudSpeed => 'Kelajuan datang daripada GPS.';

  @override
  String get tourHudRec =>
      'REC menunjukkan berapa saat rakaman berada dalam penimbal.';

  @override
  String get tourHudAi =>
      'Cip AI menunjukkan model, bilangan objek yang dilihatnya dan sebuah titik: hijau berjalan, ambar terhad, merah dihentikan.';

  @override
  String get tourSaveTitle => 'Simpan Insiden';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista menyimpan penimbal bergolek untuk $seconds saat video terakhir. Ia sentiasa ditulis ganti, jadi tiada apa-apa disimpan melainkan anda mengetik Simpan. Klip yang disimpan kekal pada iPhone ini, dalam Klip.';
  }

  @override
  String get tourRecordTitle => 'Rakam seluruh perjalanan';

  @override
  String get tourRecordBody =>
      'Ketik Rakam untuk merakam berterusan sehingga anda menghentikannya. Perjalanan panjang disimpan dalam bahagian 5 minit di Klip, dan Simpan Insiden terus berfungsi semasa anda merakam.';

  @override
  String get tourViewsTitle => 'Lima cara melihat jalan';

  @override
  String get tourViewDetection =>
      'Kamera langsung dengan kotak di sekeliling objek yang disokong.';

  @override
  String get tourViewVirtual =>
      'Pemandangan 3D ringkas yang dibina daripada pengesanan.';

  @override
  String get tourViewMap =>
      'Apple Maps dengan carian dan panduan belokan demi belokan.';

  @override
  String get tourViewParking => 'Kamera ditambah paparan kedekatan dari atas.';

  @override
  String get tourViewPerception => 'Topeng jalan dan objek.';

  @override
  String get tourMapTitle => 'Carian & belokan demi belokan';

  @override
  String get tourMapBody =>
      'Buka Peta, ketik bar carian dan pilih destinasi. Pilih laluan, kemudian ketik Mula untuk panduan belokan demi belokan. Memerlukan sambungan internet.';

  @override
  String get tourClipsTitle => 'Klip';

  @override
  String get tourClipsBody =>
      'Semak, namakan semula, kongsi atau padam insiden yang disimpan. Klip kekal pada iPhone anda melainkan anda berkongsinya.';

  @override
  String get tourSettingsTitle => 'Tetapan';

  @override
  String get tourSettingsBody =>
      'Laraskan amaran suara dan kepekaannya, kualiti rakaman dan panjang penimbal, serta sediakan mod Kecemasan: amaran hentakan eksperimen dengan kira detik pembatalan.';

  @override
  String get tourSafetyTitle => 'Sebelum memandu';

  @override
  String get tourSafety1 =>
      'Pasang iPhone anda dengan selamat supaya tidak menghalang pandangan anda.';

  @override
  String get tourSafety2 =>
      'Jangan berinteraksi dengan apl semasa memandu. Sediakan semuanya semasa berhenti.';

  @override
  String get tourSafety3 =>
      'Pengesanan dan zon ialah anggaran. Ia boleh salah atau terlepas.';

  @override
  String get tourSafety4 =>
      'Anda kekal bertanggungjawab untuk memandu dengan selamat.';

  @override
  String get helpTakeTour => 'Ikuti lawatan';

  @override
  String get helpTakeTourSub =>
      'Pandangan berpandu seminit tentang skrin Pemanduan.';

  @override
  String get tripsTitle => 'Perjalanan';

  @override
  String get tripsOpen => 'Log perjalanan';

  @override
  String get tripsEmptyTitle => 'Belum ada perjalanan';

  @override
  String get tripsEmptyBody =>
      'Perjalanan dirakam secara automatik semasa anda memandu dengan Corvista — jarak, masa, kelajuan dan laluan yang anda lalui.';

  @override
  String get tripsDisabledBody =>
      'Log perjalanan dimatikan, jadi pemanduan baharu tidak dirakam. Hidupkannya untuk menyimpan log peribadi laluan anda pada iPhone ini.';

  @override
  String get tripsEnable => 'Hidupkan log perjalanan';

  @override
  String get tripsToday => 'Hari ini';

  @override
  String get tripsYesterday => 'Semalam';

  @override
  String tripsRecordingNow(String distance) {
    return 'Merakam perjalanan · $distance';
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
      other: '$count insiden',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amaran',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perjalanan',
      zero: 'Tiada perjalanan',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Jarak';

  @override
  String get tripsStatDuration => 'Tempoh';

  @override
  String get tripsStatMoving => 'Masa bergerak';

  @override
  String get tripsStatAvgSpeed => 'Kelajuan purata';

  @override
  String get tripsStatMaxSpeed => 'Kelajuan maks.';

  @override
  String get tripsDetections => 'Pengesanan';

  @override
  String get tripsNoDetections =>
      'Tiada objek jalan direkodkan pada perjalanan ini.';

  @override
  String get tripsTimeline => 'Garis masa';

  @override
  String get tripsEventStart => 'Perjalanan bermula';

  @override
  String get tripsEventEnd => 'Perjalanan tamat';

  @override
  String get tripsEventAlert => 'Amaran suara';

  @override
  String get tripsEventIncident => 'Klip insiden disimpan';

  @override
  String get tripsEventEmergency => 'Kemungkinan kemalangan dikesan';

  @override
  String get tripsEventNavStart => 'Navigasi dimulakan';

  @override
  String get tripsEventArrive => 'Tiba di destinasi';

  @override
  String get tripsEventReroute => 'Laluan dikira semula';

  @override
  String get tripsEventRecording => 'Rakaman disimpan';

  @override
  String get tripsOpenClip => 'Buka klip';

  @override
  String get tripsTrackPreview => 'Jejak GPS';

  @override
  String get tripsRenameTitle => 'Namakan semula perjalanan';

  @override
  String get tripsRenameHint => 'Nama perjalanan';

  @override
  String get tripsFavorite => 'Tambah pada kegemaran';

  @override
  String get tripsUnfavorite => 'Alih keluar daripada kegemaran';

  @override
  String get tripsShareGpx => 'Kongsi GPX';

  @override
  String get tripsShareFailed => 'Perjalanan ini tidak dapat dikongsi.';

  @override
  String get tripsDelete => 'Padam perjalanan';

  @override
  String get tripsDeleteConfirmTitle => 'Padam perjalanan ini?';

  @override
  String get tripsDeleteConfirmBody =>
      'Laluan dan statistik akan dibuang daripada iPhone ini. Klip insiden daripada perjalanan ini disimpan.';

  @override
  String get tripsDeleted => 'Perjalanan dipadam';

  @override
  String get tripsNotFound => 'Perjalanan ini tidak lagi tersedia.';

  @override
  String get tripsPrivacyNote =>
      'Disimpan pada iPhone ini sahaja. Tiada apa-apa dimuat naik.';

  @override
  String get settingsSectionTrips => 'Log perjalanan';

  @override
  String get settingsTripLog => 'Rakam perjalanan';

  @override
  String get settingsTripLogSubtitle =>
      'Menyimpan laluan dan statistik pemanduan anda pada iPhone ini sahaja.';

  @override
  String get settingsTripRetention => 'Simpan perjalanan selama';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 tahun';

  @override
  String get settingsRetentionForever => 'Selama-lamanya';

  @override
  String get settingsTripRetentionFooter =>
      'Perjalanan lama dipadam secara automatik apabila Corvista bermula.';

  @override
  String get settingsViewTrips => 'Lihat perjalanan';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours j $minutes min';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes min';
  }

  @override
  String tripsGpxName(String date) {
    return 'Perjalanan Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Kosongkan ruang';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Membuang fail sementara dan cache. Klip dan perjalanan yang disimpan dikekalkan.';

  @override
  String settingsFreedBytes(String size) {
    return '$size dibebaskan';
  }

  @override
  String get settingsNothingToFree =>
      'Cache dikosongkan — tiada fail sementara untuk dibuang.';

  @override
  String get settingsSectionPrivacyData => 'Privasi & data';

  @override
  String get settingsPrivacyDataFooter =>
      'Klip, perjalanan dan tetapan disimpan pada iPhone ini sahaja. Ia hanya keluar daripadanya apabila anda memilih untuk berkongsi.';

  @override
  String get settingsDeleteAllData => 'Padam semua data';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Padam klip, perjalanan, kenalan dan tetapan daripada iPhone ini';

  @override
  String get deleteAllTitle => 'Padam semua data?';

  @override
  String get deleteAllMessage =>
      'Ini akan mengalih keluar secara kekal daripada iPhone ini:\n• Klip insiden dan imej kecil\n• Log perjalanan dan trek GPS\n• Kenalan kecemasan dan peristiwa kecemasan\n• Log pengesanan dan log diagnostik\n• Tetapan dan destinasi terkini\n• Penimbal rakaman sementara dan cache\n\nTindakan ini tidak boleh dibuat asal. Corvista kemudian akan bermula semula daripada skrin alu-aluan.';

  @override
  String get deleteAllConfirm => 'Padam semuanya';

  @override
  String get deleteAllInProgress => 'Memadam…';

  @override
  String get deleteAllDone => 'Semua data dipadam';

  @override
  String get deleteAllPartial =>
      'Sesetengah item tidak dapat dipadam. Cuba lagi daripada Tetapan.';

  @override
  String get diagLogSection => 'Log diagnostik';

  @override
  String get diagLogFooter =>
      'Ralat direkodkan pada iPhone ini sahaja, tanpa lokasi, nama kenalan atau nombor telefon. Tiada apa-apa dihantar melainkan anda sendiri berkongsi log.';

  @override
  String get diagLogShare => 'Kongsi log diagnostik';

  @override
  String get diagLogEmpty => 'Kosong';

  @override
  String get diagLogClear => 'Kosongkan log';

  @override
  String get diagLogClearTitle => 'Kosongkan log diagnostik?';

  @override
  String get diagLogClearBody =>
      'Entri ralat yang disimpan akan dipadam daripada iPhone ini.';

  @override
  String get diagLogCleared => 'Log diagnostik dikosongkan';

  @override
  String get diagLogShareFailed => 'Tidak dapat berkongsi log diagnostik.';

  @override
  String get privacyControls2 =>
      'Tetapan › Privasi & data › Padam semua data memadam setiap klip, perjalanan, kenalan, log dan tetapan yang disimpan oleh Corvista pada iPhone ini.';

  @override
  String get parkingZoneStop => 'Berhenti';

  @override
  String get parkingZoneVeryClose => 'Sangat dekat';

  @override
  String get parkingZoneClose => 'Dekat';

  @override
  String get parkingZoneNothingClose => 'Tiada yang dekat kelihatan';

  @override
  String get parkingNotDetected =>
      'Dinding, tiang, tiang lampu dan tepi jalan tidak dikesan';

  @override
  String get parkingApprox => 'anggaran';

  @override
  String get parkingSideLeft => 'Kiri';

  @override
  String get parkingSideCenter => 'Tengah';

  @override
  String get parkingSideRight => 'Kanan';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Paparan kamera hadapan sahaja — bukan sistem 360°';

  @override
  String get parkingMuteBeeps => 'Senyapkan bip';

  @override
  String get parkingUnmuteBeeps => 'Hidupkan bip';

  @override
  String get parkingAbout => 'Tentang paparan parkir';

  @override
  String get parkingLimitationsDetail =>
      'Hanya kawasan di hadapan kamera dipantau. Pengesan mengenali kereta, bas dan lori, orang, basikal serta motosikal. Dinding, tiang, tiang lampu, tepi jalan, bolard, penghadang dan halangan rendah TIDAK dikesan, dan bonet boleh melindungi permukaan tepat di hadapan. Jarak ialah anggaran kasar daripada satu kamera (saiz dan kedudukan objek) dan boleh tersasar jauh. Senyap atau “Tiada yang dekat kelihatan” tidak bermakna laluan selamat — sentiasa lihat sekeliling dan gunakan cermin anda.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Kedekatan mengikut sisi: kiri $left, tengah $center, kanan $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Ralat ditulis ke log peribadi pada iPhone ini (tanpa lokasi, nama kenalan atau nombor telefon). Log tidak pernah dihantar secara automatik; anda boleh berkongsi atau mengosongkannya dalam Tetapan › Diagnostik.';
}
