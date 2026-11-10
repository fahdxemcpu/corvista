// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Lihat lebih banyak di setiap perjalanan.';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonDelete => 'Hapus';

  @override
  String get commonSave => 'Simpan';

  @override
  String get commonBack => 'Kembali';

  @override
  String get commonClose => 'Tutup';

  @override
  String get commonRetry => 'Coba lagi';

  @override
  String get commonOpenSettings => 'Buka Pengaturan';

  @override
  String get commonLoading => 'Memuat…';

  @override
  String get commonError => 'Terjadi kesalahan.';

  @override
  String commonErrorDetail(String message) {
    return 'Terjadi kesalahan: $message';
  }

  @override
  String get commonOn => 'Aktif';

  @override
  String get commonOff => 'Nonaktif';

  @override
  String get commonRename => 'Ubah nama';

  @override
  String get commonShare => 'Bagikan';

  @override
  String get commonNotAvailable => 'Tidak tersedia';

  @override
  String get commonTestFootage => 'REKAMAN UJI';

  @override
  String get zoneVeryClose => 'Sangat dekat';

  @override
  String get zoneClose => 'Dekat';

  @override
  String get zoneMedium => 'Sedang';

  @override
  String get zoneFar => 'Jauh';

  @override
  String get zoneUnknown => 'Tidak diketahui';

  @override
  String get classPerson => 'Orang';

  @override
  String get classBicycle => 'Sepeda';

  @override
  String get classMotorcycle => 'Sepeda motor';

  @override
  String get classCar => 'Kendaraan';

  @override
  String get classBus => 'Bus';

  @override
  String get classTrafficLight => 'Lampu lalu lintas';

  @override
  String get classStopSign => 'Rambu berhenti';

  @override
  String get viewDetection => 'Deteksi';

  @override
  String get viewVirtual => 'Virtual';

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
  String get clipsDeselectAll => 'Batalkan semua pilihan';

  @override
  String get clipsDeleteSelected => 'Hapus yang dipilih';

  @override
  String get clipsGridView => 'Tampilan kisi';

  @override
  String get clipsListView => 'Tampilan daftar';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hapus $count klip?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Video akan dihapus secara permanen dari iPhone Anda. Tindakan ini tidak dapat dibatalkan.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip dihapus',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Belum ada klip';

  @override
  String get clipsEmptyBody =>
      'Saat Anda berkendara, Corvista menyimpan buffer bergulir singkat. Ketuk Simpan Insiden untuk menyimpan beberapa detik terakhir rekaman di sini.';

  @override
  String get clipsLoadError => 'Klip Anda tidak dapat dimuat.';

  @override
  String get clipsStorageTitle => 'Penyimpanan';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Klip $clips · Buffer $buffer · $free tersedia';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip tersimpan',
      zero: 'Tidak ada klip tersimpan',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Penyimpanan iPhone Anda hampir penuh. Insiden baru mungkin gagal disimpan.';

  @override
  String get clipsMissingFile => 'File hilang';

  @override
  String get clipsEmergencyBadge => 'Benturan';

  @override
  String clipsUntitled(String date) {
    return 'Insiden · $date';
  }

  @override
  String get clipsAudio => 'Audio direkam';

  @override
  String get clipsFavorite => 'Favorit';

  @override
  String get clipsUnfavorite => 'Hapus dari favorit';

  @override
  String get clipsLocation => 'Lokasi disimpan';

  @override
  String clipsOpenClip(String title) {
    return 'Buka klip $title';
  }

  @override
  String get playerNotFoundTitle => 'Klip tidak ditemukan';

  @override
  String get playerNotFoundBody => 'Klip ini mungkin telah dihapus.';

  @override
  String get playerMissingTitle => 'File video hilang';

  @override
  String get playerMissingBody =>
      'Rekaman untuk klip ini tidak lagi ada di iPhone Anda. Anda dapat menghapus entrinya dari galeri.';

  @override
  String get playerRemoveEntry => 'Hapus entri';

  @override
  String get playerLoadError => 'Video ini tidak dapat diputar.';

  @override
  String get playerPlay => 'Putar';

  @override
  String get playerPause => 'Jeda';

  @override
  String get playerReplay => 'Putar ulang';

  @override
  String get playerRenameTitle => 'Ubah nama klip';

  @override
  String get playerRenameHint => 'Nama klip';

  @override
  String get playerRenamed => 'Nama klip diubah';

  @override
  String get playerFavorited => 'Ditambahkan ke favorit';

  @override
  String get playerUnfavorited => 'Dihapus dari favorit';

  @override
  String get playerShareFailed => 'Klip ini tidak dapat dibagikan.';

  @override
  String get playerDetails => 'Detail';

  @override
  String get playerDate => 'Direkam';

  @override
  String get playerDuration => 'Durasi';

  @override
  String get playerResolution => 'Resolusi';

  @override
  String get playerSize => 'Ukuran file';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerAudioYes => 'Direkam';

  @override
  String get playerAudioNo => 'Tidak direkam';

  @override
  String get playerReason => 'Disimpan oleh';

  @override
  String get playerReasonManual => 'Tombol Simpan Insiden';

  @override
  String get playerReasonEmergency => 'Kemungkinan benturan terdeteksi';

  @override
  String get playerReasonRecovered => 'Dipulihkan setelah gangguan';

  @override
  String get playerSpeed => 'Kecepatan GPS saat disimpan';

  @override
  String get playerLocation => 'Lokasi';

  @override
  String get playerOpenInMaps => 'Buka di Peta';

  @override
  String get playerBack => 'Kembali';

  @override
  String get playerMore => 'Tindakan lainnya';

  @override
  String get clipsFilterLabel => 'Tampilkan';

  @override
  String get clipsFilterAll => 'Semua';

  @override
  String get clipsFilterRecordings => 'Rekaman';

  @override
  String get clipsFilterIncidents => 'Insiden';

  @override
  String get clipsFilterEmergency => 'Darurat';

  @override
  String get clipsFilterFavorites => 'Favorit';

  @override
  String get clipsSort => 'Urutkan';

  @override
  String get clipsSortNewest => 'Terbaru dulu';

  @override
  String get clipsSortOldest => 'Terlama dulu';

  @override
  String get clipsSortLongest => 'Terpanjang dulu';

  @override
  String get clipsSortLargest => 'Terbesar dulu';

  @override
  String get clipsToday => 'Hari ini';

  @override
  String get clipsYesterday => 'Kemarin';

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
  String get clipsFilterEmpty => 'Belum ada klip di kategori ini.';

  @override
  String get clipsFavoritesEmpty =>
      'Beri bintang pada klip untuk menyimpannya di sini agar mudah diakses.';

  @override
  String get clipsKindRecording => 'Rekaman';

  @override
  String get clipsKindIncident => 'Insiden';

  @override
  String get clipsKindEmergency => 'Darurat';

  @override
  String get clipsKindTest => 'Uji';

  @override
  String clipsTripChip(String time) {
    return 'Perjalanan · $time';
  }

  @override
  String get clipsOpenTrip => 'Buka perjalanan tempat klip ini direkam';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used terpakai · $free tersisa';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Klip memakai $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rekaman',
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
      other: '$count kejadian darurat',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Kosongkan ruang';

  @override
  String get clipsStorageLowGentle =>
      'Ruang kosong kurang dari 2 GB. Agar perekaman tetap lancar, kosongkan ruang atau hapus klip yang tidak lagi Anda perlukan.';

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
      other: 'Hapus $count klip ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Menyimpan $done dari $total ke Foto…';
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
      'Corvista tidak diizinkan menambahkan video ke Foto. Anda dapat mengizinkannya di Pengaturan.';

  @override
  String get clipsPhotosFailed => 'Tidak dapat menyimpan ke Foto.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip ditambahkan ke favorit',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip dihapus dari favorit',
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
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Jenis';

  @override
  String get playerReasonRecording => 'Tombol Rekam';

  @override
  String get trimTitle => 'Potong klip';

  @override
  String get trimHint =>
      'Seret pegangan untuk memilih bagian yang disimpan. Klip asli tidak berubah.';

  @override
  String get trimStartHandle => 'Awal potongan';

  @override
  String get trimEndHandle => 'Akhir potongan';

  @override
  String trimSelection(String duration) {
    return '$duration dipilih';
  }

  @override
  String get trimSave => 'Simpan sebagai klip baru';

  @override
  String get trimSaving => 'Menyimpan klip hasil potongan…';

  @override
  String get trimSaved => 'Klip hasil potongan disimpan';

  @override
  String get trimOpenNew => 'Buka';

  @override
  String get trimFailed => 'Tidak dapat memotong klip ini.';

  @override
  String get trimStorageFull =>
      'Ruang kosong tidak cukup untuk menyimpan klip hasil potongan.';

  @override
  String get trimPreview => 'Putar bagian terpilih';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Peringatan';

  @override
  String get settingsSectionAlertCategories => 'Kategori peringatan';

  @override
  String get settingsSectionRecording => 'Perekaman';

  @override
  String get settingsSectionDriving => 'Berkendara';

  @override
  String get settingsSectionPower => 'Daya';

  @override
  String get settingsSectionEmergency => 'Darurat';

  @override
  String get settingsSectionAppearance => 'Tampilan';

  @override
  String get settingsSectionLanguage => 'Bahasa';

  @override
  String get settingsSectionInformation => 'Informasi';

  @override
  String get settingsCameraLens => 'Lensa kamera';

  @override
  String get settingsLensWide => 'Lebar';

  @override
  String get settingsLensUltraWide => 'Ultra Lebar';

  @override
  String get settingsLensTelephoto => 'Telefoto';

  @override
  String get settingsLensUnavailable => 'Tidak tersedia di iPhone ini';

  @override
  String get settingsStabilization => 'Stabilisasi';

  @override
  String get settingsStabAuto => 'Otomatis';

  @override
  String get settingsStabOff => 'Nonaktif';

  @override
  String get settingsStabStandard => 'Standar';

  @override
  String get settingsStabCinematic => 'Sinematik';

  @override
  String get settingsOverlayOpacity => 'Opasitas overlay';

  @override
  String get settingsShowFps => 'Tampilkan statistik performa';

  @override
  String get settingsShowFpsSubtitle =>
      'Frame rate dan waktu inferensi di tampilan deteksi';

  @override
  String get settingsCameraFooter =>
      'Perubahan lensa dan stabilisasi berlaku saat kamera dimulai berikutnya.';

  @override
  String get settingsAiModel => 'Model AI';

  @override
  String get settingsConfidence => 'Tingkat keyakinan deteksi';

  @override
  String get settingsTracking => 'Pelacakan objek';

  @override
  String get settingsTrackingSubtitle =>
      'Menjaga objek tetap stabil antar-frame';

  @override
  String get settingsShowLabels => 'Tampilkan label';

  @override
  String get settingsShowConfidence => 'Tampilkan tingkat keyakinan';

  @override
  String get settingsSegmentationOpacity => 'Opasitas masker persepsi';

  @override
  String get settingsAiFooter =>
      'Tingkat keyakinan yang lebih rendah menampilkan lebih banyak objek, tetapi juga lebih banyak deteksi keliru. Deteksi bisa tidak akurat.';

  @override
  String get settingsVoiceAlerts => 'Peringatan suara';

  @override
  String get settingsVoiceLanguage => 'Bahasa suara';

  @override
  String get settingsVoiceLanguageAuto => 'Sesuaikan dengan bahasa aplikasi';

  @override
  String get settingsVoice => 'Suara';

  @override
  String get settingsVoiceDefault => 'Default sistem';

  @override
  String get settingsVoiceQualityEnhanced => 'Ditingkatkan';

  @override
  String get settingsVoiceQualityPremium => 'Kualitas tinggi';

  @override
  String get settingsNoVoices =>
      'Tidak ada suara yang terpasang untuk bahasa ini. Tambahkan di Pengaturan iOS › Aksesibilitas › Konten yang Diucapkan.';

  @override
  String get settingsAlertPedestrian => 'Pejalan kaki';

  @override
  String get settingsAlertCyclist => 'Pesepeda';

  @override
  String get settingsAlertMotorcycle => 'Sepeda motor';

  @override
  String get settingsAlertBus => 'Bus';

  @override
  String get settingsAlertVehicleClose => 'Kendaraan sangat dekat di depan';

  @override
  String get settingsAlertTrafficLight => 'Perubahan lampu lalu lintas';

  @override
  String get settingsAlertTrafficMoving =>
      'Lalu lintas di depan mulai bergerak';

  @override
  String get settingsAlertStopSign => 'Rambu berhenti';

  @override
  String get settingsSensitivity => 'Sensitivitas';

  @override
  String get settingsSensitivityLow => 'Rendah';

  @override
  String get settingsSensitivityMedium => 'Sedang';

  @override
  String get settingsSensitivityHigh => 'Tinggi';

  @override
  String get settingsCooldown => 'Interval pengulangan';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds dtk';
  }

  @override
  String get settingsVolume => 'Volume suara';

  @override
  String get settingsQuietMode => 'Mode senyap';

  @override
  String get settingsQuietModeSubtitle =>
      'Hanya peringatan terpenting yang diucapkan';

  @override
  String get settingsTestVoice => 'Uji suara';

  @override
  String get settingsTestVoiceDone => 'Memutar contoh peringatan…';

  @override
  String get settingsParkingBeeps => 'Bip parkir';

  @override
  String get settingsBeepVolume => 'Volume bip';

  @override
  String get settingsAlertsFooter =>
      'Peringatan hanyalah alat bantu. Selalu perhatikan jalan — tanpa suara bukan berarti jalan aman.';

  @override
  String get settingsRecordingProfile => 'Kualitas perekaman';

  @override
  String get settingsProfileStandard => 'Standar · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Buffer insiden';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds detik';
  }

  @override
  String get settingsManualMaxLength => 'Durasi maksimum rekaman manual';

  @override
  String get settingsManualMaxUnlimited => 'Tanpa batas';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes mnt';
  }

  @override
  String get settingsRecordAudio => 'Rekam audio';

  @override
  String get settingsRecordAudioSubtitle =>
      'Menyertakan audio kabin dalam insiden yang disimpan';

  @override
  String get settingsMicDenied =>
      'Akses mikrofon nonaktif. Izinkan di Pengaturan untuk merekam audio.';

  @override
  String get settingsWatermark => 'Watermark Corvista';

  @override
  String get settingsTimestamp => 'Cap tanggal & waktu';

  @override
  String get settingsSaveLocation => 'Simpan lokasi bersama klip';

  @override
  String get settingsStorage => 'Penyimpanan & klip';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count klip',
      zero: 'Tidak ada klip',
    );
    return '$_temp0 · $used terpakai · $free tersedia';
  }

  @override
  String get settingsRecordingFooter =>
      'Buffer bergulir tetap berada di iPhone Anda dan terus ditimpa. Tidak ada yang direkam di latar belakang.';

  @override
  String get settingsDefaultView => 'Tampilan default';

  @override
  String get settingsUnits => 'Satuan';

  @override
  String get settingsShowCompass => 'Tampilkan kompas';

  @override
  String get settingsHudStyle => 'Gaya HUD';

  @override
  String get settingsHudCustomize => 'Sesuaikan HUD';

  @override
  String get settingsDrivingSide => 'Sisi berkendara';

  @override
  String get settingsDrivingSideAuto => 'Otomatis';

  @override
  String get settingsDrivingSideRight => 'Kanan';

  @override
  String get settingsDrivingSideLeft => 'Kiri';

  @override
  String get settingsVirtualStyle => 'Gaya tampilan virtual';

  @override
  String get settingsVirtualMinimal => 'Minimal';

  @override
  String get settingsVirtualPerspective => 'Perspektif';

  @override
  String get settingsVirtualHighContrast => 'Kontras tinggi';

  @override
  String get settingsKeepScreenOn => 'Jaga layar tetap menyala saat berkendara';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Tampilkan petunjuk arah belokan demi belokan di Layar Kunci dan Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Perekaman dijeda saat Corvista berada di latar belakang';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Dijeda';

  @override
  String get liveActivityDashcamOff => 'Kamera mati';

  @override
  String get liveActivityEnded => 'Navigasi berakhir';

  @override
  String get liveActivityEta => 'Tiba';

  @override
  String get settingsAutoRecenter => 'Pusatkan ulang peta otomatis';

  @override
  String get settingsHudStyleClassic => 'Klasik';

  @override
  String get settingsHudStyleGrid => 'Kisi';

  @override
  String get settingsHudStyleMinimal => 'Minimal';

  @override
  String get settingsHudStylePerformance => 'Performa';

  @override
  String get settingsHudStyleNavigation => 'Navigasi';

  @override
  String get settingsHudStyleNight => 'Malam';

  @override
  String get settingsHudStyleHighContrast => 'Kontras tinggi';

  @override
  String get settingsPowerMode => 'Mode daya';

  @override
  String get settingsPowerBalanced => 'Seimbang';

  @override
  String get settingsPowerPerformance => 'Performa';

  @override
  String get settingsPowerSaver => 'Hemat daya';

  @override
  String get settingsPowerFooter =>
      'Corvista menurunkan laju AI dan efek visual secara otomatis saat iPhone Anda menghangat atau baterai lemah.';

  @override
  String get settingsThermal => 'Status termal';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Hangat';

  @override
  String get settingsThermalSerious => 'Panas';

  @override
  String get settingsThermalCritical => 'Kritis';

  @override
  String get settingsBattery => 'Baterai';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Mengisi daya';
  }

  @override
  String get settingsLowPowerMode =>
      'Mode Daya Rendah aktif — AI berjalan dengan laju yang dikurangi.';

  @override
  String get settingsAiRate => 'Laju AI saat ini';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Deteksi benturan';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Aktif · hitung mundur $seconds dtk';
  }

  @override
  String get settingsEmergencyFooter =>
      'Eksperimental. Bukan pengganti layanan darurat.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeDark => 'Gelap';

  @override
  String get settingsThemeLight => 'Terang';

  @override
  String get settingsReduceMotion => 'Kurangi gerakan';

  @override
  String get settingsReduceMotionSubtitle =>
      'Meminimalkan animasi di seluruh aplikasi';

  @override
  String get settingsAppLanguage => 'Bahasa aplikasi';

  @override
  String get settingsPrivacyPolicy => 'Kebijakan Privasi';

  @override
  String get settingsTerms => 'Ketentuan Penggunaan';

  @override
  String get settingsHelp => 'Bantuan';

  @override
  String get settingsSupport => 'Hubungi dukungan';

  @override
  String get settingsLicenses => 'Lisensi sumber terbuka';

  @override
  String get settingsSupportUnavailable =>
      'Mail tidak dapat dibuka. Tulis ke support@corvista.app.';

  @override
  String get settingsSafety => 'Informasi keselamatan';

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
  String get hudCustomPreview => 'Pratinjau · nilai contoh';

  @override
  String get hudCustomStyle => 'Gaya';

  @override
  String get hudCustomElements => 'Elemen';

  @override
  String get hudCustomSpeed => 'Kecepatan';

  @override
  String get hudCustomHeading => 'Arah & kompas';

  @override
  String get hudCustomClock => 'Jam';

  @override
  String get hudCustomBattery => 'Baterai & termal';

  @override
  String get hudCustomDetections => 'Status AI & deteksi';

  @override
  String get hudCustomWeather => 'Cuaca';

  @override
  String get hudCustomAppearance => 'Ukuran & opasitas';

  @override
  String get hudCustomSize => 'Ukuran';

  @override
  String get hudCustomOpacity => 'Opasitas';

  @override
  String get hudCustomFooter =>
      'Peringatan seperti panas berlebih selalu ditampilkan, meskipun elemen disembunyikan.';

  @override
  String get hudCustomDescClassic => 'Panel instrumen yang seimbang';

  @override
  String get hudCustomDescGrid => 'Kisi perspektif di atas jalan';

  @override
  String get hudCustomDescMinimal => 'Hanya kecepatan, tidak ada yang lain';

  @override
  String get hudCustomDescPerformance => 'Busur kecepatan dengan data langsung';

  @override
  String get hudCustomDescNavigation => 'Manuver berikutnya lebih dulu';

  @override
  String get hudCustomDescNight =>
      'Redup dan bernuansa merah untuk berkendara malam';

  @override
  String get hudCustomDescHighContrast =>
      'Keterbacaan maksimal di bawah terik matahari';

  @override
  String get languageTitle => 'Bahasa';

  @override
  String get languageSystem => 'Default sistem';

  @override
  String get languageSystemSubtitle => 'Ikuti bahasa iPhone Anda';

  @override
  String get languageFooter =>
      'Bahasa lainnya segera hadir. Bahasa peringatan suara dapat diatur terpisah di bagian Peringatan.';

  @override
  String get diagTitle => 'Diagnostik';

  @override
  String get diagPerformance => 'Performa';

  @override
  String get diagInference => 'Waktu inferensi';

  @override
  String get diagDetectHz => 'Laju deteksi';

  @override
  String get diagCameraFps => 'Frame rate kamera';

  @override
  String get diagMemory => 'Memori';

  @override
  String get diagDropped => 'Frame terlewat';

  @override
  String get diagSegmentation => 'Waktu segmentasi';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Status';

  @override
  String get diagSource => 'Sumber';

  @override
  String get diagSourceCamera => 'Kamera langsung';

  @override
  String get diagSourceFile => 'File rekaman uji';

  @override
  String get diagResolution => 'Ukuran buffer';

  @override
  String get diagLens => 'Lensa';

  @override
  String get diagError => 'Kesalahan terakhir';

  @override
  String get diagModel => 'Model AI';

  @override
  String get diagModelLoad => 'Waktu pemuatan model';

  @override
  String get diagPower => 'Daya';

  @override
  String get diagSegHz => 'Laju segmentasi';

  @override
  String get diagReduced => 'Efek dikurangi';

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
  String get diagCamIdle => 'Siaga';

  @override
  String get diagCamStarting => 'Memulai';

  @override
  String get diagCamRunning => 'Berjalan';

  @override
  String get diagCamInterrupted => 'Terganggu';

  @override
  String get diagCamStopped => 'Berhenti';

  @override
  String get diagCamUnavailable => 'Tidak tersedia';

  @override
  String get diagCamPermissionDenied => 'Izin ditolak';

  @override
  String get diagCamError => 'Kesalahan';

  @override
  String get diagTestFootage => 'Rekaman uji';

  @override
  String get diagTestFootageBody =>
      'Jalankan deteksi sungguhan di perangkat pada file video lokal, bukan dari kamera. Setiap tampilan menandainya sebagai REKAMAN UJI.';

  @override
  String get diagPathLabel => 'Jalur file video';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Gunakan Documents/test_drive.mp4';

  @override
  String get diagRun => 'Jalankan rekaman uji';

  @override
  String get diagRunStarted =>
      'Rekaman uji dimulai. Buka tampilan berkendara untuk melihatnya.';

  @override
  String get diagBackToCamera => 'Kembali ke kamera langsung';

  @override
  String get diagDebugOnly =>
      'Rekaman uji hanya tersedia di build pengembangan.';

  @override
  String get diagFileMissing => 'Tidak ada file di jalur tersebut.';

  @override
  String get emergencySetupTitle => 'Deteksi benturan';

  @override
  String get emergencyExperimental => 'Eksperimental';

  @override
  String get emergencyIntro =>
      'Saat berkendara, Corvista dapat memantau kemungkinan benturan hebat menggunakan sensor gerak iPhone Anda. Jika terdeteksi, hitung mundur dimulai. Jika Anda tidak membatalkannya, Corvista menawarkan untuk menghubungi layanan darurat dan mengirim pesan ke kontak Anda.';

  @override
  String get emergencyDisclaimer1 =>
      'Bukan pengganti layanan darurat atau deteksi tabrakan bawaan kendaraan Anda.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS selalu meminta Anda mengonfirmasi sebelum panggilan dilakukan atau pesan dikirim.';

  @override
  String get emergencyDisclaimer3 =>
      'Benturan bisa terlewat, dan pengereman keras atau jalan bergelombang bisa salah dikira benturan.';

  @override
  String get emergencyParkedWarning =>
      'Selesaikan pengaturan ini saat berhenti. Pengaturan terkunci saat kendaraan bergerak.';

  @override
  String get emergencyEnable => 'Aktifkan deteksi benturan';

  @override
  String get emergencyEnableSubtitle => 'Aktif hanya selama sesi berkendara';

  @override
  String get emergencyNeedNumber => 'Tambahkan nomor darurat terlebih dahulu.';

  @override
  String get emergencyContacts => 'Kontak darurat';

  @override
  String get emergencyAddContact => 'Tambah kontak';

  @override
  String get emergencyNoContacts =>
      'Belum ada kontak. Kontak hanya menerima pesan setelah Anda mengonfirmasinya.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Hapus $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Kontak ini tidak akan ditawarkan sebagai penerima setelah terjadi benturan.';

  @override
  String get emergencyRemove => 'Hapus';

  @override
  String get emergencyContactsError => 'Kontak tidak dapat dimuat.';

  @override
  String get emergencyNumber => 'Nomor darurat';

  @override
  String get emergencyNumberHint => 'mis. 112 atau 911';

  @override
  String get emergencyMessage => 'Templat pesan';

  @override
  String get emergencyMessageDefault =>
      'Saya mungkin mengalami kecelakaan kendaraan. Pesan ini disiapkan oleh Corvista dan menyertakan lokasi terakhir saya yang diketahui jika tersedia.';

  @override
  String get emergencyMessageHint =>
      'Kosongkan untuk menggunakan pesan default.';

  @override
  String get emergencyCountdown => 'Lama hitung mundur';

  @override
  String get emergencyVoiceCancel => 'Batalkan dengan suara';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Ucapkan “Saya baik-baik saja” atau “Batal” selama hitung mundur. Menggunakan pengenalan ucapan di perangkat jika tersedia.';

  @override
  String get emergencyVoicePermDenied =>
      'Akses mikrofon dan pengenalan ucapan diperlukan untuk pembatalan dengan suara.';

  @override
  String get emergencyAutoSave => 'Simpan klip insiden secara otomatis';

  @override
  String get emergencyTest => 'Uji hitung mundur (tanpa panggilan)';

  @override
  String get emergencyTestBody =>
      'Menjalankan simulasi benturan agar Anda dapat melihat hitung mundur. Tidak ada panggilan atau pesan yang dikirim dalam mode uji.';

  @override
  String get emergencyNotSet => 'Belum diatur';

  @override
  String get emergencyAlertHeadline => 'Kemungkinan benturan hebat terdeteksi.';

  @override
  String get emergencyAlertSubtitle => 'Apakah Anda baik-baik saja?';

  @override
  String get emergencyAlertCancel => 'Saya baik-baik saja — Batalkan';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds detik lagi',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Mendengarkan — ucapkan “Saya baik-baik saja” untuk membatalkan';

  @override
  String emergencyAlertHeard(String text) {
    return 'Terdengar: “$text”';
  }

  @override
  String get emergencyAlertEscalated => 'Tidak ada respons. Pilih tindakan:';

  @override
  String get emergencyAlertCall => 'Hubungi layanan darurat';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Menghubungi $number. iOS meminta Anda mengonfirmasi.';
  }

  @override
  String get emergencyAlertMessage => 'Kirim pesan ke kontak';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Membuka pesan yang sudah disiapkan. Anda yang memutuskan apakah akan mengirimnya.';

  @override
  String get emergencyAlertTestMode =>
      'Mode uji — tidak ada panggilan yang akan dilakukan';

  @override
  String get emergencyAlertTestBadge => 'UJI';

  @override
  String get emergencyAlertClose => 'Saya baik-baik saja — Tutup';

  @override
  String get emergencyMsgSent => 'Pesan terkirim.';

  @override
  String get emergencyMsgCancelled => 'Pesan tidak dikirim.';

  @override
  String get emergencyMsgFailed => 'Pesan tidak dapat dikirim.';

  @override
  String get emergencyMsgUnavailable =>
      'Pengiriman pesan tidak tersedia di perangkat ini.';

  @override
  String emergencyCallFailed(String number) {
    return 'Panggilan tidak dapat dimulai. Hubungi $number secara manual.';
  }

  @override
  String get modelsTitle => 'Model AI';

  @override
  String get modelsIntro =>
      'Semua model sudah disertakan dalam aplikasi dan berjalan sepenuhnya di iPhone Anda. Umpan kamera Anda tidak pernah meninggalkan perangkat.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Langsung: $ms ms per frame · $hz deteksi/dtk';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Dimuat dalam $ms ms';
  }

  @override
  String get modelsEfficientName => 'Efisien';

  @override
  String get modelsEfficientDesc =>
      'Detektor cepat dan ringkas yang disetel untuk perjalanan jauh dengan panas dan penggunaan baterai rendah.';

  @override
  String get modelsEnhancedName => 'Ditingkatkan';

  @override
  String get modelsEnhancedDesc =>
      'Detektor lebih besar yang menemukan objek lebih kecil dan lebih jauh, dengan konsumsi daya lebih tinggi.';

  @override
  String get modelsSegmentationName => 'Segmentasi';

  @override
  String get modelsSegmentationDesc =>
      'Menggabungkan deteksi cepat dengan masker permukaan jalan dan objek untuk tampilan Persepsi.';

  @override
  String get modelsNoneName => 'AI dijeda';

  @override
  String get modelsNoneDesc =>
      'Kamera dan perekaman tetap berjalan tanpa deteksi objek. Konsumsi daya terendah.';

  @override
  String get modelsGenericDesc => 'Model deteksi objek di perangkat.';

  @override
  String get modelsFunctionDetection =>
      'Mendeteksi kendaraan, orang, sepeda, sepeda motor, bus, lampu lalu lintas, dan rambu berhenti';

  @override
  String get modelsFunctionSegmentation =>
      'Menambahkan masker permukaan jalan dan objek';

  @override
  String get modelsFunctionNone => 'Tanpa deteksi; hanya perekaman dashcam';

  @override
  String get modelsSize => 'Ukuran';

  @override
  String get modelsInput => 'Input';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Berfungsi dengan';

  @override
  String get modelsStatusInstalled => 'Terpasang (bawaan)';

  @override
  String get modelsStatusNotInstalled => 'Tidak terpasang';

  @override
  String get modelsSelected => 'Dipilih';

  @override
  String get modelsUse => 'Gunakan model ini';

  @override
  String get modelsSwitching => 'Memuat model…';

  @override
  String modelsSwitched(String name) {
    return '$name kini aktif';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Diukur di perangkat ini: rata-rata $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Belum diukur di perangkat ini';

  @override
  String get modelsBenchmarkRun => 'Jalankan benchmark';

  @override
  String get modelsBenchmarkRunning => 'Menjalankan benchmark…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Pilih model ini untuk menjalankan benchmark.';

  @override
  String get modelsBenchmarkDone => 'Benchmark selesai';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Benchmark gagal: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Terakhir diperbarui $date';
  }

  @override
  String get safetyTitle => 'Informasi keselamatan';

  @override
  String get safetyIntro =>
      'Corvista adalah alat bantu kewaspadaan berkendara. Aplikasi ini tidak mengendalikan kendaraan Anda dan tidak dapat menggantikan perhatian, penilaian Anda, atau sistem keselamatan kendaraan.';

  @override
  String get safetyBeforeTitle => 'Sebelum berkendara';

  @override
  String get safetyBefore1 =>
      'Pasang iPhone Anda dengan aman di posisi yang sah dan tidak menghalangi pandangan, airbag, atau kontrol Anda.';

  @override
  String get safetyBefore2 =>
      'Selesaikan pengaturan, pilih tampilan, dan tetapkan tujuan saat kendaraan berhenti.';

  @override
  String get safetyBefore3 =>
      'Sambungkan pengisi daya untuk perjalanan jauh dan jauhkan ponsel dari sinar matahari langsung bila memungkinkan.';

  @override
  String get safetyWhileTitle => 'Saat berkendara';

  @override
  String get safetyWhile1 =>
      'Tetap fokus pada jalan. Gunakan kontrol layar yang besar hanya saat aman dan diizinkan hukum.';

  @override
  String get safetyWhile2 =>
      'Peringatan hanyalah alat bantu, bukan peringatan yang dapat diandalkan sepenuhnya. Tanpa suara tidak pernah berarti jalan aman.';

  @override
  String get safetyWhile3 =>
      'Patuhi hukum lalu lintas, sinyal, dan rambu jalan — bukan aplikasi — jika berbeda.';

  @override
  String get safetyLimitsTitle => 'Keterbatasan';

  @override
  String get safetyLimits1 =>
      'Satu kamera ponsel hanya melihat apa yang ada di depannya. Objek di luar jangkauan pandangnya, tersembunyi, atau sangat dekat tidak terdeteksi.';

  @override
  String get safetyLimits2 =>
      'Deteksi bisa terlewat, terlambat, atau salah, terutama pada malam hari, saat hujan, kabut, silau, atau kaca depan kotor.';

  @override
  String get safetyLimits3 =>
      'Hanya kategori yang didukung yang dikenali: kendaraan, bus, sepeda motor, sepeda, orang, lampu lalu lintas, dan rambu berhenti. Petunjuk lajur di tampilan virtual hanyalah ilustrasi, bukan lajur yang terdeteksi.';

  @override
  String get safetyLimits4 =>
      'Kedekatan ditampilkan sebagai zona perkiraan (Sangat dekat, Dekat, Sedang, Jauh), bukan jarak terukur. Tampilan parkir bukan pengganti sensor parkir.';

  @override
  String get safetyHeatTitle => 'Panas dan baterai';

  @override
  String get safetyHeat1 =>
      'Penggunaan kamera dan AI secara terus-menerus membuat iPhone Anda menghangat. Corvista menurunkan laju analisis saat perangkat panas dan menampilkan peringatan; jika iOS terlalu panas, kamera dapat berhenti.';

  @override
  String get safetyEmergencyTitle => 'Fitur darurat';

  @override
  String get safetyEmergency1 =>
      'Deteksi kemungkinan benturan bersifat eksperimental. Fitur ini bisa melewatkan tabrakan sungguhan dan bisa terpicu oleh kejadian lain.';

  @override
  String get safetyEmergency2 =>
      'Fitur ini tidak pernah menghubungi siapa pun secara diam-diam: iOS selalu meminta Anda mengonfirmasi panggilan atau pesan. Fitur ini bukan pengganti menghubungi layanan darurat sendiri.';

  @override
  String get privacyTitle => 'Privasi';

  @override
  String get privacyIntro =>
      'Corvista dirancang agar data berkendara Anda tetap berada di iPhone Anda. Tidak ada akun Corvista, dan Corvista tidak menjalankan server sendiri.';

  @override
  String get privacyCameraTitle => 'Kamera dan AI';

  @override
  String get privacyCamera1 =>
      'Deteksi objek, pelacakan, dan segmentasi berjalan sepenuhnya di iPhone Anda. Frame kamera tidak pernah diunggah.';

  @override
  String get privacyCamera2 =>
      'Kamera hanya berjalan saat Corvista terbuka di layar. Kamera berhenti saat aplikasi masuk ke latar belakang — tidak ada perekaman tersembunyi di latar belakang.';

  @override
  String get privacyRecordingsTitle => 'Rekaman';

  @override
  String get privacyRecordings1 =>
      'Buffer bergulir bersifat sementara dan terus ditimpa. Rekaman hanya disimpan saat Anda mengetuk Simpan Insiden atau, jika Anda mengaktifkannya, setelah kemungkinan benturan.';

  @override
  String get privacyRecordings2 =>
      'Klip yang disimpan tetap berada di penyimpanan pribadi Corvista di iPhone Anda. Klip hanya keluar dari perangkat saat Anda memilih Bagikan. Menghapus aplikasi akan menghapus klip tersebut.';

  @override
  String get privacyRecordings3 =>
      'Audio hanya direkam jika Anda mengaktifkannya dan memberikan akses mikrofon.';

  @override
  String get privacyLocationTitle => 'Lokasi';

  @override
  String get privacyLocation1 =>
      'Lokasi digunakan saat aplikasi terbuka untuk kecepatan, peta, rute, dan cuaca Anda. Jika “Simpan lokasi” aktif, posisi saat penyimpanan disimpan bersama klip di perangkat Anda.';

  @override
  String get privacyNetworkTitle => 'Layanan jaringan';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — tampilan peta, pencarian tempat, dan rute. Teks pencarian dan perkiraan lokasi Anda dikirim ke Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — cuaca saat ini dan per jam untuk lokasi Anda.';

  @override
  String get privacyNetwork4 =>
      'Corvista tidak menyertakan iklan, analitik pihak ketiga, maupun pelacakan.';

  @override
  String get privacyEmergencyTitle => 'Kontak darurat';

  @override
  String get privacyEmergency1 =>
      'Kontak yang Anda pilih disimpan di Keychain iOS pada perangkat ini. Pembatalan dengan suara menggunakan pengenalan ucapan di perangkat jika tersedia. Panggilan dan pesan hanya dikirim setelah Anda mengonfirmasinya di iOS.';

  @override
  String get privacyControlsTitle => 'Kendali Anda';

  @override
  String get privacyControls1 =>
      'Anda dapat menghapus klip kapan saja di Klip, serta mengubah atau mencabut akses kamera, mikrofon, lokasi, dan ucapan di Pengaturan iOS.';

  @override
  String get termsTitle => 'Ketentuan Penggunaan';

  @override
  String get termsIntro =>
      'Dengan menggunakan Corvista, Anda menyetujui ketentuan ini. Perjanjian Lisensi Pengguna Akhir Aplikasi Berlisensi standar dari Apple juga berlaku.';

  @override
  String get termsUseTitle => 'Menggunakan Corvista';

  @override
  String get termsUse1 =>
      'Corvista adalah alat bantu kewaspadaan berkendara dan dashcam. Anda tetap bertanggung jawab penuh untuk berkendara dengan aman dan sesuai hukum setiap saat.';

  @override
  String get termsUse2 =>
      'Jangan berinteraksi dengan aplikasi dengan cara yang mengalihkan perhatian Anda saat berkendara. Pasang perangkat dengan aman dan sesuai hukum.';

  @override
  String get termsAccuracyTitle => 'Tidak ada jaminan akurasi';

  @override
  String get termsAccuracy1 =>
      'Deteksi, zona, peringatan, penanda peta, rute, dan cuaca bisa tidak lengkap, tertunda, atau salah. Corvista tidak mengendalikan kendaraan Anda.';

  @override
  String get termsAccuracy2 =>
      'Fitur darurat bersifat eksperimental dan bisa gagal mendeteksi benturan atau terpicu secara keliru.';

  @override
  String get termsRecordingTitle => 'Hukum perekaman';

  @override
  String get termsRecording1 =>
      'Hukum tentang dashcam, perekaman audio, dan pengambilan gambar orang berbeda di setiap negara dan wilayah. Anda bertanggung jawab untuk mematuhinya, termasuk saat membagikan klip.';

  @override
  String get termsLiabilityTitle => 'Tanggung jawab hukum';

  @override
  String get termsLiability1 =>
      'Aplikasi ini disediakan “sebagaimana adanya”. Sejauh diizinkan oleh hukum, pengembang tidak bertanggung jawab atas kecelakaan, kerugian, denda, atau kerusakan yang timbul dari penggunaannya atau dari mengandalkan keluarannya.';

  @override
  String get termsChangesTitle => 'Perubahan';

  @override
  String get termsChanges1 =>
      'Ketentuan ini dapat diperbarui bersama versi baru aplikasi. Melanjutkan penggunaan setelah pembaruan berarti Anda menerima ketentuan yang direvisi.';

  @override
  String get helpTitle => 'Bantuan';

  @override
  String get helpIntro =>
      'Jawaban untuk pertanyaan umum. Untuk panduan keselamatan, lihat Informasi keselamatan.';

  @override
  String get helpQSave => 'Bagaimana cara menyimpan rekaman insiden?';

  @override
  String get helpASaveBuffer =>
      'Ketuk tombol besar Simpan Insiden di tampilan berkendara. Corvista menyimpan 20 atau 30 detik terakhir dari buffer berjalannya (pilihan Anda di Pengaturan › Perekaman) ke Klip.';

  @override
  String get helpQWhere => 'Di mana klip saya disimpan?';

  @override
  String get helpAWhere =>
      'Di penyimpanan pribadi Corvista di iPhone Anda. Klip tidak pernah diunggah. Gunakan Bagikan di pemutar untuk mengirim atau mengekspor klip.';

  @override
  String get helpQZones => 'Seberapa akurat zona kedekatan?';

  @override
  String get helpAZones =>
      'Zona adalah perkiraan kasar dari satu kamera berdasarkan ukuran objek yang umum. Anggap sebagai petunjuk perkiraan, bukan jarak.';

  @override
  String get helpQSlow => 'Mengapa deteksi melambat?';

  @override
  String get helpASlow =>
      'Saat iPhone Anda menghangat, baterai lemah, atau Mode Daya Rendah aktif, Corvista menurunkan laju analisis untuk melindungi perangkat. Anda dapat mengubah mode daya di Pengaturan.';

  @override
  String get helpQMap => 'Peta, pencarian, atau cuaca tidak berfungsi.';

  @override
  String get helpAMap =>
      'Fitur ini memerlukan koneksi internet dan akses lokasi. Periksa koneksi Anda dan izinkan lokasi untuk Corvista di Pengaturan iOS.';

  @override
  String get helpQSimulator => 'Kamera ditampilkan tidak tersedia.';

  @override
  String get helpASimulator =>
      'Pastikan akses kamera diizinkan di Pengaturan iOS dan tidak ada aplikasi lain yang menggunakan kamera. Di Simulator iOS tidak ada kamera; video uji lokal dapat digunakan sebagai gantinya.';

  @override
  String get emergencyMsgNoContacts =>
      'Tambahkan kontak darurat terlebih dahulu.';

  @override
  String get cameraStarting => 'Memulai kamera…';

  @override
  String get cameraInterrupted => 'Kamera dijeda';

  @override
  String get cameraInterruptedBody =>
      'iOS menjeda kamera, misalnya saat ada panggilan atau saat aplikasi lain menggunakannya. Kamera akan berlanjut otomatis.';

  @override
  String get cameraUnavailable => 'Kamera tidak tersedia';

  @override
  String get cameraUnavailableBody =>
      'Tidak ada kamera yang tersedia di perangkat ini. Tampilan deteksi, perekaman, dan parkir memerlukan kamera belakang.';

  @override
  String get cameraRunTestFootage => 'Jalankan rekaman uji';

  @override
  String get cameraPermissionDenied => 'Akses kamera nonaktif';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista memerlukan kamera untuk deteksi, perekaman dashcam, dan tampilan parkir. Aktifkan akses Kamera di Pengaturan.';

  @override
  String get cameraError => 'Kesalahan kamera';

  @override
  String get cameraStopped => 'Kamera berhenti';

  @override
  String get cameraStart => 'Mulai kamera';

  @override
  String get cameraFocusHint => 'Ketuk untuk fokus';

  @override
  String get cameraPreviewLabel =>
      'Tampilan kamera langsung dengan objek yang terdeteksi';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · AI $hz Hz · $ms ms · terlewat $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Kecepatan $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Tidak ada kecepatan GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Arah $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds dtk';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Perekaman buffer dashcam, $seconds dari $target detik ter-buffer';
  }

  @override
  String get hudRecIdle => 'REC mati';

  @override
  String get hudRecSaving => 'Menyimpan…';

  @override
  String get hudRecError => 'Kesalahan REC';

  @override
  String get hudAiPaused => 'AI dijeda';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objek',
      zero: 'Tidak ada objek',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objek',
      zero: 'tidak ada objek',
    );
    return 'Model AI $model, $_temp0 terdeteksi';
  }

  @override
  String get hudThermalSerious => 'Panas — AI diperlambat';

  @override
  String get hudThermalCritical => 'Terlalu panas — AI dijeda';

  @override
  String hudBatteryLow(String percent) {
    return 'Baterai $percent';
  }

  @override
  String get hudLowPower => 'Mode Daya Rendah';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Cuaca $temperature, $condition. Ketuk untuk detail.';
  }

  @override
  String get hudNoGuidance =>
      'Cari tujuan di tampilan Peta untuk melihat petunjuk arah belokan demi belokan di sini.';

  @override
  String get navArrived => 'Anda telah tiba';

  @override
  String get navRerouting => 'Menghitung ulang rute…';

  @override
  String get navSearchHint => 'Cari tujuan';

  @override
  String get navSearchFieldHint => 'Alamat, tempat, atau bisnis';

  @override
  String get navNoResults => 'Tidak ada tempat yang cocok';

  @override
  String get navSearching => 'Mencari…';

  @override
  String get navSearchStartTyping =>
      'Ketik alamat atau nama tempat. Hasil berasal dari Apple Maps dan memerlukan koneksi internet.';

  @override
  String get navErrorUnavailable =>
      'Pencarian dan rute tidak tersedia — periksa koneksi internet Anda.';

  @override
  String get navErrorNoLocation =>
      'Menunggu lokasi Anda untuk merencanakan rute.';

  @override
  String get navErrorPermission =>
      'Akses lokasi nonaktif, sehingga rute tidak dapat dimulai dari posisi Anda.';

  @override
  String navErrorGeneric(String code) {
    return 'Rute tidak dapat dimuat ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Rute ke $place';
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
  String get navStart => 'Mulai';

  @override
  String get navEnd => 'Akhiri';

  @override
  String get navEndLabel => 'Akhiri navigasi';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration lagi';
  }

  @override
  String navAdvisory(String text) {
    return 'Pemberitahuan: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes mnt',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours j $minutes mnt';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Rute $index: $name';
  }

  @override
  String get weatherTitle => 'Cuaca';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Terasa seperti $temperature';
  }

  @override
  String get weatherPrecipitation => 'Curah hujan';

  @override
  String get weatherWind => 'Angin';

  @override
  String get weatherVisibility => 'Jarak pandang';

  @override
  String get weatherHumidity => 'Kelembapan';

  @override
  String get weatherHourly => 'Jam-jam berikutnya';

  @override
  String weatherAsOf(String time) {
    return 'Diperbarui $time';
  }

  @override
  String get weatherRefresh => 'Segarkan cuaca';

  @override
  String get weatherUnavailable => 'Cuaca tidak tersedia saat ini.';

  @override
  String get weatherNoLocation => 'Cuaca memerlukan lokasi Anda.';

  @override
  String get weatherLegal => 'Sumber data & hukum';

  @override
  String weatherProvidedBy(String service) {
    return 'Data cuaca: $service';
  }

  @override
  String get weatherNow => 'Sekarang';

  @override
  String get virtualEmpty => 'Tidak ada objek yang didukung terdeteksi';

  @override
  String get virtualEmptyCameraOff =>
      'Tampilan virtual memerlukan kamera langsung.';

  @override
  String get virtualLaneDisclaimer =>
      'Garis lajur hanya ilustrasi, bukan hasil deteksi.';

  @override
  String virtualNearest(String zone) {
    return 'Terdekat: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Pemandangan jalan virtual: $summary';
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
  String get virtualStatusTestFootage => 'Rekaman uji';

  @override
  String get virtualEmptyHint =>
      'Kendaraan, orang, sepeda, lampu, dan rambu berhenti muncul di sini saat terdeteksi.';

  @override
  String get mapRecenter => 'Pusatkan ulang';

  @override
  String get mapZoomIn => 'Perbesar';

  @override
  String get mapZoomOut => 'Perkecil';

  @override
  String get mapUnsupported => 'Peta interaktif tersedia di iPhone.';

  @override
  String get mapObjectsApprox => 'Penanda objek adalah posisi perkiraan.';

  @override
  String get mapWeatherUnavailable => 'Cuaca tidak tersedia';

  @override
  String get navErrorNoRoute => 'Tidak ditemukan rute ke tujuan ini.';

  @override
  String get navDismiss => 'Tutup';

  @override
  String get navGo => 'Mulai';

  @override
  String get navFastest => 'Tercepat';

  @override
  String get navThen => 'Lalu';

  @override
  String get navRecents => 'Terbaru';

  @override
  String get navClearRecents => 'Hapus';

  @override
  String get navSearchSubmitHint =>
      'Tekan Cari untuk melihat semua tempat yang cocok';

  @override
  String get navPlaces => 'Tempat';

  @override
  String get navEtaLabel => 'tiba';

  @override
  String get navTimeLeftLabel => 'lagi';

  @override
  String get navOverview => 'Ringkasan';

  @override
  String get navMute => 'Matikan suara';

  @override
  String get navUnmute => 'Nyalakan suara';

  @override
  String get navEndConfirm => 'Akhiri navigasi?';

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
  String get navWeakGps => 'Sinyal GPS lemah';

  @override
  String get navLocationOff =>
      'Lokasi nonaktif. Aktifkan untuk merencanakan rute dan bernavigasi.';

  @override
  String get navVoiceGuidance => 'Panduan suara';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Dalam $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, lalu $second';
  }

  @override
  String get navSpeakRerouting => 'Menghitung ulang rute';

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
      other: '$count yard',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Lanjutkan sejauh $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Petunjuk arah tidak tersedia untuk perjalanan ini di wilayah ini. Coba tujuan lain.';

  @override
  String navContinueFor(String distance) {
    return 'Lanjutkan sejauh $distance';
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
    return 'Terdekat: $object · $zone';
  }

  @override
  String get parkingNothing => 'Tidak ada yang terdeteksi dalam tampilan';

  @override
  String get parkingBeeps => 'Bip kedekatan';

  @override
  String get parkingVolume => 'Volume bip';

  @override
  String get parkingLimitations =>
      'Satu kamera, bukan 360°. Objek di luar jangkauan kamera tidak terdeteksi. Bukan pengganti sensor parkir; perkiraan bisa salah dan tanpa suara tidak berarti area aman.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Tampilan kedekatan dari atas. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Asli';

  @override
  String get perceptionModeBoxes => 'Kotak';

  @override
  String get perceptionModeMasks => 'Masker objek';

  @override
  String get perceptionModeRoad => 'Permukaan jalan';

  @override
  String get perceptionModeCombined => 'Gabungan';

  @override
  String get perceptionOpacity => 'Opasitas masker';

  @override
  String get perceptionDisclaimer =>
      'Masker permukaan jalan adalah lapisan visual perkiraan. Masker ini tidak menunjukkan ruang yang dapat dilalui atau lajur.';

  @override
  String get perceptionNeedsModel =>
      'Pilih model Segmentasi untuk melihat masker.';

  @override
  String get perceptionChooseModel => 'Pilih model';

  @override
  String get perceptionWaiting => 'Menunggu frame segmentasi pertama…';

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
  String get perceptionStatusWarmingUp => 'Menyiapkan…';

  @override
  String get perceptionStatusLoadingModel => 'Memuat model…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Masker dijeda';

  @override
  String get perceptionLegend => 'Legenda masker';

  @override
  String get perceptionUnavailable => 'Masker tidak tersedia';

  @override
  String get driveSave => 'Simpan';

  @override
  String get driveSaveIncident => 'Simpan insiden';

  @override
  String driveSaveHint(int seconds) {
    return 'Menyimpan $seconds detik terakhir rekaman dashcam';
  }

  @override
  String get driveSaving => 'Menyimpan insiden…';

  @override
  String hudRecManualLabel(String time) {
    return 'Merekam, $time';
  }

  @override
  String get driveRecord => 'Rekam';

  @override
  String get driveRecordStartA11y => 'Mulai merekam';

  @override
  String driveRecordStopA11y(String time) {
    return 'Hentikan rekaman, $time terekam';
  }

  @override
  String get driveRecordHint =>
      'Merekam terus-menerus sampai Anda menghentikannya, termasuk 5 detik sebelumnya';

  @override
  String get driveRecordFailed => 'Tidak dapat memulai rekaman';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rekaman disimpan · $count bagian',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Rekaman dihentikan: penyimpanan hampir penuh',
      'max_duration': 'Rekaman dihentikan: durasi maksimum tercapai',
      'camera_stopped': 'Rekaman dihentikan bersama kamera',
      'background': 'Rekaman dihentikan: aplikasi masuk ke latar belakang',
      'thermal': 'Rekaman dihentikan: ponsel terlalu panas',
      'other': 'Rekaman dihentikan',
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
      'Perekaman belum dimulai — tunggu kamera mulai, lalu coba lagi.';

  @override
  String get driveSaveTestFootage =>
      'Rekaman uji tidak direkam. Penyimpanan insiden berfungsi dengan kamera langsung.';

  @override
  String get driveSaveStorageFull =>
      'Penyimpanan iPhone Anda penuh. Kosongkan ruang atau hapus klip lama.';

  @override
  String get driveSaveIoError => 'Klip tidak dapat ditulis ke penyimpanan.';

  @override
  String get driveClips => 'Klip';

  @override
  String get driveSettings => 'Pengaturan';

  @override
  String get driveViewSwitcher => 'Tampilan berkendara';

  @override
  String get driveLocationDenied =>
      'Lokasi nonaktif — kecepatan, peta, dan rute tidak tersedia.';

  @override
  String get driveCameraDenied =>
      'Akses kamera nonaktif — deteksi dan perekaman tidak tersedia.';

  @override
  String get driveRecorderFallback =>
      'Merekam tanpa audio: akses mikrofon nonaktif.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Pengaturan perekaman disesuaikan: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhone Anda panas. AI berjalan lebih lambat agar mendingin — jauhkan dari sinar matahari langsung dan letakkan dekat ventilasi.';

  @override
  String get drivePowerThermalCritical =>
      'iPhone Anda terlalu panas. Deteksi AI dijeda hingga suhu turun; perekaman berlanjut jika memungkinkan.';

  @override
  String get drivePowerLowPower =>
      'Mode Daya Rendah aktif — AI berjalan dengan laju yang dikurangi.';

  @override
  String get drivePowerBatteryLow =>
      'Baterai lemah — sambungkan iPhone Anda ke daya saat berkendara.';

  @override
  String get onboardingTitle1 => 'Lihat lebih banyak di setiap perjalanan.';

  @override
  String get onboardingBody1 =>
      'Ubah iPhone Anda menjadi dashcam cerdas dan pendamping kewaspadaan berkendara.';

  @override
  String get onboardingTitle2 => 'Kecerdasan di setiap frame.';

  @override
  String get onboardingBody2 =>
      'Kenali kendaraan, orang, sepeda, dan sinyal jalan yang didukung langsung di iPhone Anda.';

  @override
  String get onboardingTitle3 => 'Satu jalan. Berbagai perspektif.';

  @override
  String get onboardingBody3 =>
      'Beralih antara deteksi langsung, tampilan berkendara virtual, peta interaktif, dan visualisasi parkir.';

  @override
  String get onboardingTitle4 => 'Simpan momen yang penting.';

  @override
  String get onboardingBody4 =>
      'Simpan rekaman dashcam terbaru, tinjau insiden, dan bagikan rekaman.';

  @override
  String get onboardingTitle5 => 'Keselamatan & privasi';

  @override
  String get onboardingSafety1 =>
      'Corvista adalah alat bantu kewaspadaan berkendara. Tetap fokus pada jalan.';

  @override
  String get onboardingSafety2 =>
      'Aplikasi ini tidak mengendalikan kendaraan Anda atau menggantikan penilaian Anda.';

  @override
  String get onboardingSafety3 =>
      'Deteksi dan perkiraan bisa tidak akurat atau terlewat.';

  @override
  String get onboardingSafety4 =>
      'Pemrosesan kamera terjadi di iPhone Anda — video tidak diunggah.';

  @override
  String get onboardingSafety5 =>
      'Peta, pencarian, rute, dan cuaca memerlukan koneksi internet.';

  @override
  String get onboardingSafety6 =>
      'Pasang iPhone Anda dengan aman agar tidak menghalangi pandangan.';

  @override
  String get onboardingSafety7 =>
      'Selesaikan pengaturan sebelum mulai berkendara.';

  @override
  String get onboardingAcknowledge =>
      'Saya memahami bahwa Corvista adalah alat bantu kewaspadaan dan saya tetap bertanggung jawab untuk berkendara dengan aman.';

  @override
  String get onboardingReadSafety => 'Baca informasi keselamatan lengkap';

  @override
  String get onboardingNext => 'Berikutnya';

  @override
  String get onboardingSkip => 'Lewati';

  @override
  String get onboardingAgree => 'Lanjutkan';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Halaman $current dari $total';
  }

  @override
  String get permTitle => 'Izin';

  @override
  String get permIntro =>
      'Corvista hanya meminta apa yang dibutuhkan setiap fitur. Anda dapat mengubahnya kapan saja di Pengaturan.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Diperlukan untuk deteksi, perekaman dashcam, dan tampilan parkir. Video diproses di iPhone Anda.';

  @override
  String get permLocationTitle => 'Lokasi';

  @override
  String get permLocationBody =>
      'Digunakan untuk kecepatan GPS, peta, rute, cuaca, dan penandaan klip yang disimpan. Hanya saat Anda menggunakan aplikasi.';

  @override
  String get permMicTitle => 'Mikrofon';

  @override
  String get permSpeechNote =>
      'Pengenalan ucapan hanya diminta jika Anda mengaktifkan pembatalan dengan suara untuk peringatan darurat.';

  @override
  String get permRequired => 'Diperlukan';

  @override
  String get permOptional => 'Opsional';

  @override
  String get permAllow => 'Izinkan';

  @override
  String get permGranted => 'Diizinkan';

  @override
  String get permDenied => 'Ditolak';

  @override
  String get permLimited => 'Terbatas';

  @override
  String get permRestricted => 'Dibatasi';

  @override
  String get permStart => 'Mulai berkendara';

  @override
  String get permCameraNeeded =>
      'Anda dapat melanjutkan tanpa akses kamera, tetapi deteksi dan perekaman tidak akan berfungsi sampai Anda mengizinkannya di Pengaturan.';

  @override
  String get permSetupIntro =>
      'Corvista memerlukan semua ini agar berfungsi penuh. Ketuk Izinkan semua dan iOS akan menanyakan satu per satu. Anda dapat mengubahnya kapan saja di Pengaturan.';

  @override
  String get permCameraLine =>
      'Diperlukan untuk deteksi, perekaman dashcam, dan tampilan parkir. Video diproses di iPhone Anda, tidak pernah diunggah.';

  @override
  String get permLocationLine =>
      'Kecepatan GPS, peta, rute, cuaca, dan lokasi penyimpanan klip. Hanya saat Anda menggunakan aplikasi.';

  @override
  String get permMicLine =>
      'Audio kabin dalam klip insiden, dan mendengar frasa pembatalan Anda saat peringatan darurat.';

  @override
  String get permSpeechTitle => 'Pengenalan ucapan';

  @override
  String get permSpeechLine =>
      'Mengenali frasa pembatalan Anda selama hitung mundur darurat, di iPhone Anda jika didukung.';

  @override
  String get permAllowAll => 'Izinkan semua';

  @override
  String permAsking(String permission) {
    return 'Meminta $permission…';
  }

  @override
  String get permSomeDenied =>
      'Beberapa izin nonaktif. Aktifkan di Pengaturan untuk menggunakan fitur tersebut.';

  @override
  String get permNotNow => 'Nanti saja';

  @override
  String get tourLabel => 'Tur layar berkendara';

  @override
  String tourProgress(int current, int total) {
    return 'Langkah $current dari $total';
  }

  @override
  String get tourNext => 'Berikutnya';

  @override
  String get tourBack => 'Kembali';

  @override
  String get tourSkip => 'Lewati tur';

  @override
  String get tourFinish => 'Mulai berkendara';

  @override
  String get tourWelcomeTitle => 'Tur singkat Anda';

  @override
  String get tourWelcomeBody =>
      'Sekilas satu menit tentang hal-hal penting di layar Berkendara. Paling baik dilakukan saat berhenti.';

  @override
  String get tourHudTitle => 'Strip instrumen Anda';

  @override
  String get tourHudSpeed => 'Kecepatan berasal dari GPS.';

  @override
  String get tourHudRec =>
      'REC menunjukkan berapa detik rekaman yang ada di buffer.';

  @override
  String get tourHudAi =>
      'Chip AI menunjukkan model, jumlah objek yang terlihat, dan sebuah titik: hijau berjalan, kuning terbatas, merah berhenti.';

  @override
  String get tourSaveTitle => 'Simpan Insiden';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista menyimpan buffer bergulir berisi $seconds detik video terakhir. Buffer terus ditimpa, jadi tidak ada yang disimpan kecuali Anda mengetuk Simpan. Klip yang disimpan tetap di iPhone ini, di Klip.';
  }

  @override
  String get tourRecordTitle => 'Rekam seluruh perjalanan';

  @override
  String get tourRecordBody =>
      'Ketuk Rekam untuk merekam terus-menerus sampai Anda menghentikannya. Perjalanan panjang disimpan dalam bagian 5 menit di Klip, dan Simpan Insiden tetap berfungsi saat Anda merekam.';

  @override
  String get tourViewsTitle => 'Lima cara melihat jalan';

  @override
  String get tourViewDetection =>
      'Kamera langsung dengan kotak di sekitar objek yang didukung.';

  @override
  String get tourViewVirtual =>
      'Pemandangan 3D sederhana yang dibuat dari hasil deteksi.';

  @override
  String get tourViewMap =>
      'Apple Maps dengan pencarian dan petunjuk arah belokan demi belokan.';

  @override
  String get tourViewParking => 'Kamera ditambah tampilan kedekatan dari atas.';

  @override
  String get tourViewPerception => 'Masker jalan dan objek.';

  @override
  String get tourMapTitle => 'Pencarian & belokan demi belokan';

  @override
  String get tourMapBody =>
      'Buka Peta, ketuk bilah pencarian, lalu pilih tujuan. Pilih rute, lalu ketuk Mulai untuk panduan belokan demi belokan. Memerlukan koneksi internet.';

  @override
  String get tourClipsTitle => 'Klip';

  @override
  String get tourClipsBody =>
      'Tinjau, ubah nama, bagikan, atau hapus insiden yang disimpan. Klip tetap di iPhone Anda kecuali Anda membagikannya.';

  @override
  String get tourSettingsTitle => 'Pengaturan';

  @override
  String get tourSettingsBody =>
      'Atur peringatan suara dan sensitivitasnya, kualitas perekaman dan panjang buffer, serta siapkan mode Darurat: peringatan benturan eksperimental dengan hitung mundur pembatalan.';

  @override
  String get tourSafetyTitle => 'Sebelum berkendara';

  @override
  String get tourSafety1 =>
      'Pasang iPhone Anda dengan aman agar tidak menghalangi pandangan.';

  @override
  String get tourSafety2 =>
      'Jangan berinteraksi dengan aplikasi saat berkendara. Atur semuanya saat berhenti.';

  @override
  String get tourSafety3 =>
      'Deteksi dan zona adalah perkiraan. Bisa salah atau terlewat.';

  @override
  String get tourSafety4 =>
      'Anda tetap bertanggung jawab untuk berkendara dengan aman.';

  @override
  String get helpTakeTour => 'Ikuti tur';

  @override
  String get helpTakeTourSub =>
      'Sekilas panduan satu menit tentang layar Berkendara.';

  @override
  String get tripsTitle => 'Perjalanan';

  @override
  String get tripsOpen => 'Catatan perjalanan';

  @override
  String get tripsEmptyTitle => 'Belum ada perjalanan';

  @override
  String get tripsEmptyBody =>
      'Perjalanan direkam otomatis saat Anda berkendara dengan Corvista — jarak, waktu, kecepatan, dan rute yang Anda tempuh.';

  @override
  String get tripsDisabledBody =>
      'Catatan perjalanan nonaktif, sehingga perjalanan baru tidak direkam. Aktifkan untuk menyimpan catatan pribadi rute Anda di iPhone ini.';

  @override
  String get tripsEnable => 'Aktifkan catatan perjalanan';

  @override
  String get tripsToday => 'Hari ini';

  @override
  String get tripsYesterday => 'Kemarin';

  @override
  String tripsRecordingNow(String distance) {
    return 'Merekam perjalanan · $distance';
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
      other: '$count peringatan',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perjalanan',
      zero: 'Tidak ada perjalanan',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Jarak';

  @override
  String get tripsStatDuration => 'Durasi';

  @override
  String get tripsStatMoving => 'Waktu bergerak';

  @override
  String get tripsStatAvgSpeed => 'Kecepatan rata-rata';

  @override
  String get tripsStatMaxSpeed => 'Kecepatan maks.';

  @override
  String get tripsDetections => 'Deteksi';

  @override
  String get tripsNoDetections =>
      'Tidak ada objek jalan yang dicatat pada perjalanan ini.';

  @override
  String get tripsTimeline => 'Linimasa';

  @override
  String get tripsEventStart => 'Perjalanan dimulai';

  @override
  String get tripsEventEnd => 'Perjalanan berakhir';

  @override
  String get tripsEventAlert => 'Peringatan suara';

  @override
  String get tripsEventIncident => 'Klip insiden disimpan';

  @override
  String get tripsEventEmergency => 'Kemungkinan tabrakan terdeteksi';

  @override
  String get tripsEventNavStart => 'Navigasi dimulai';

  @override
  String get tripsEventArrive => 'Tiba di tujuan';

  @override
  String get tripsEventReroute => 'Rute dihitung ulang';

  @override
  String get tripsEventRecording => 'Rekaman disimpan';

  @override
  String get tripsOpenClip => 'Buka klip';

  @override
  String get tripsTrackPreview => 'Jejak GPS';

  @override
  String get tripsRenameTitle => 'Ubah nama perjalanan';

  @override
  String get tripsRenameHint => 'Nama perjalanan';

  @override
  String get tripsFavorite => 'Tambahkan ke favorit';

  @override
  String get tripsUnfavorite => 'Hapus dari favorit';

  @override
  String get tripsShareGpx => 'Bagikan GPX';

  @override
  String get tripsShareFailed => 'Perjalanan ini tidak dapat dibagikan.';

  @override
  String get tripsDelete => 'Hapus perjalanan';

  @override
  String get tripsDeleteConfirmTitle => 'Hapus perjalanan ini?';

  @override
  String get tripsDeleteConfirmBody =>
      'Rute dan statistik akan dihapus dari iPhone ini. Klip insiden dari perjalanan ini tetap disimpan.';

  @override
  String get tripsDeleted => 'Perjalanan dihapus';

  @override
  String get tripsNotFound => 'Perjalanan ini tidak lagi tersedia.';

  @override
  String get tripsPrivacyNote =>
      'Hanya disimpan di iPhone ini. Tidak ada yang diunggah.';

  @override
  String get settingsSectionTrips => 'Catatan perjalanan';

  @override
  String get settingsTripLog => 'Rekam perjalanan';

  @override
  String get settingsTripLogSubtitle =>
      'Menyimpan rute dan statistik berkendara Anda hanya di iPhone ini.';

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
  String get settingsRetentionForever => 'Selamanya';

  @override
  String get settingsTripRetentionFooter =>
      'Perjalanan lama dihapus otomatis saat Corvista dimulai.';

  @override
  String get settingsViewTrips => 'Lihat perjalanan';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours j $minutes mnt';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes mnt';
  }

  @override
  String tripsGpxName(String date) {
    return 'Perjalanan Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Kosongkan ruang';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Menghapus file sementara dan cache. Klip dan perjalanan yang disimpan tetap ada.';

  @override
  String settingsFreedBytes(String size) {
    return '$size dibebaskan';
  }

  @override
  String get settingsNothingToFree =>
      'Cache dibersihkan — tidak ada file sementara untuk dihapus.';

  @override
  String get settingsSectionPrivacyData => 'Privasi & data';

  @override
  String get settingsPrivacyDataFooter =>
      'Klip, perjalanan, dan pengaturan hanya disimpan di iPhone ini. Semuanya hanya keluar dari iPhone saat Anda memilih untuk membagikannya.';

  @override
  String get settingsDeleteAllData => 'Hapus semua data';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Hapus klip, perjalanan, kontak, dan pengaturan dari iPhone ini';

  @override
  String get deleteAllTitle => 'Hapus semua data?';

  @override
  String get deleteAllMessage =>
      'Ini akan menghapus secara permanen dari iPhone ini:\n• Klip insiden dan thumbnail\n• Catatan perjalanan dan jejak GPS\n• Kontak darurat dan kejadian darurat\n• Log deteksi dan log diagnostik\n• Pengaturan dan tujuan terbaru\n• Buffer rekaman sementara dan cache\n\nTindakan ini tidak dapat dibatalkan. Setelah itu, Corvista akan mulai lagi dari layar sambutan.';

  @override
  String get deleteAllConfirm => 'Hapus semuanya';

  @override
  String get deleteAllInProgress => 'Menghapus…';

  @override
  String get deleteAllDone => 'Semua data dihapus';

  @override
  String get deleteAllPartial =>
      'Beberapa item tidak dapat dihapus. Coba lagi dari Pengaturan.';

  @override
  String get diagLogSection => 'Log diagnostik';

  @override
  String get diagLogFooter =>
      'Kesalahan hanya dicatat di iPhone ini, tanpa lokasi, nama kontak, atau nomor telepon. Tidak ada yang dikirim kecuali Anda membagikan log sendiri.';

  @override
  String get diagLogShare => 'Bagikan log diagnostik';

  @override
  String get diagLogEmpty => 'Kosong';

  @override
  String get diagLogClear => 'Hapus log';

  @override
  String get diagLogClearTitle => 'Hapus log diagnostik?';

  @override
  String get diagLogClearBody =>
      'Entri kesalahan yang tersimpan akan dihapus dari iPhone ini.';

  @override
  String get diagLogCleared => 'Log diagnostik dihapus';

  @override
  String get diagLogShareFailed => 'Tidak dapat membagikan log diagnostik.';

  @override
  String get privacyControls2 =>
      'Pengaturan › Privasi & data › Hapus semua data akan menghapus setiap klip, perjalanan, kontak, log, dan pengaturan yang disimpan Corvista di iPhone ini.';

  @override
  String get parkingZoneStop => 'Berhenti';

  @override
  String get parkingZoneVeryClose => 'Sangat dekat';

  @override
  String get parkingZoneClose => 'Dekat';

  @override
  String get parkingZoneNothingClose => 'Tidak terlihat yang dekat';

  @override
  String get parkingNotDetected =>
      'Dinding, pilar, tiang, dan trotoar tidak terdeteksi';

  @override
  String get parkingApprox => 'perkiraan';

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
      'Hanya tampilan kamera depan — bukan sistem 360°';

  @override
  String get parkingMuteBeeps => 'Bisukan bip';

  @override
  String get parkingUnmuteBeeps => 'Nyalakan bip';

  @override
  String get parkingAbout => 'Tentang tampilan parkir';

  @override
  String get parkingLimitationsDetail =>
      'Hanya area di depan kamera yang dipantau. Detektor mengenali mobil, bus dan truk, orang, sepeda, serta sepeda motor. Dinding, pilar, tiang, trotoar, bollard, pembatas, dan rintangan rendah TIDAK terdeteksi, dan kap mesin dapat menutupi permukaan tepat di depan. Jarak hanyalah perkiraan kasar dari satu kamera (ukuran dan posisi objek) dan bisa sangat meleset. Tanpa bunyi atau “Tidak terlihat yang dekat” bukan berarti jalan aman — selalu perhatikan sekeliling dan gunakan spion.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Kedekatan per sisi: kiri $left, tengah $center, kanan $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Kesalahan ditulis ke log pribadi di iPhone ini (tanpa lokasi, nama kontak, atau nomor telepon). Log tidak pernah dikirim otomatis; Anda dapat membagikan atau menghapusnya di Pengaturan › Diagnostik.';
}
