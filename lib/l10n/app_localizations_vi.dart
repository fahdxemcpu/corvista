// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Nhìn xa hơn trên mỗi hành trình.';

  @override
  String get commonCancel => 'Hủy';

  @override
  String get commonDelete => 'Xóa';

  @override
  String get commonSave => 'Lưu';

  @override
  String get commonBack => 'Quay lại';

  @override
  String get commonClose => 'Đóng';

  @override
  String get commonRetry => 'Thử lại';

  @override
  String get commonOpenSettings => 'Mở Cài đặt';

  @override
  String get commonLoading => 'Đang tải…';

  @override
  String get commonError => 'Đã xảy ra lỗi.';

  @override
  String commonErrorDetail(String message) {
    return 'Đã xảy ra lỗi: $message';
  }

  @override
  String get commonOn => 'Bật';

  @override
  String get commonOff => 'Tắt';

  @override
  String get commonRename => 'Đổi tên';

  @override
  String get commonShare => 'Chia sẻ';

  @override
  String get commonNotAvailable => 'Không khả dụng';

  @override
  String get commonTestFootage => 'CẢNH QUAY THỬ';

  @override
  String get zoneVeryClose => 'Rất gần';

  @override
  String get zoneClose => 'Gần';

  @override
  String get zoneMedium => 'Trung bình';

  @override
  String get zoneFar => 'Xa';

  @override
  String get zoneUnknown => 'Không xác định';

  @override
  String get classPerson => 'Người';

  @override
  String get classBicycle => 'Xe đạp';

  @override
  String get classMotorcycle => 'Xe máy';

  @override
  String get classCar => 'Phương tiện';

  @override
  String get classBus => 'Xe buýt';

  @override
  String get classTrafficLight => 'Đèn giao thông';

  @override
  String get classStopSign => 'Biển báo dừng';

  @override
  String get viewDetection => 'Nhận diện';

  @override
  String get viewVirtual => 'Ảo';

  @override
  String get viewMap => 'Bản đồ';

  @override
  String get viewParking => 'Đỗ xe';

  @override
  String get viewPerception => 'Cảm nhận';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Đỏ';

  @override
  String get lightYellow => 'Vàng';

  @override
  String get lightGreen => 'Xanh lục';

  @override
  String get lightUnknown => 'Không xác định';

  @override
  String get clipsTitle => 'Clip';

  @override
  String get clipsSelect => 'Chọn';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã chọn $count',
      zero: 'Chọn clip',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Chọn tất cả';

  @override
  String get clipsDeselectAll => 'Bỏ chọn tất cả';

  @override
  String get clipsDeleteSelected => 'Xóa mục đã chọn';

  @override
  String get clipsGridView => 'Dạng lưới';

  @override
  String get clipsListView => 'Dạng danh sách';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Xóa $count clip?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Video sẽ bị xóa vĩnh viễn khỏi iPhone của bạn. Không thể hoàn tác thao tác này.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã xóa $count clip',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Chưa có clip nào';

  @override
  String get clipsEmptyBody =>
      'Khi bạn lái xe, Corvista giữ một bộ đệm cuốn chiếu ngắn. Nhấn Lưu sự cố để giữ lại những giây cuối của cảnh quay tại đây.';

  @override
  String get clipsLoadError => 'Không thể tải các clip của bạn.';

  @override
  String get clipsStorageTitle => 'Bộ nhớ';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Clip $clips · Bộ đệm $buffer · Còn trống $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã lưu $count clip',
      zero: 'Chưa lưu clip nào',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'iPhone của bạn sắp hết bộ nhớ. Các sự cố mới có thể không lưu được.';

  @override
  String get clipsMissingFile => 'Thiếu tệp';

  @override
  String get clipsEmergencyBadge => 'Va chạm';

  @override
  String clipsUntitled(String date) {
    return 'Sự cố · $date';
  }

  @override
  String get clipsAudio => 'Đã ghi âm';

  @override
  String get clipsFavorite => 'Yêu thích';

  @override
  String get clipsUnfavorite => 'Bỏ khỏi mục yêu thích';

  @override
  String get clipsLocation => 'Đã lưu vị trí';

  @override
  String clipsOpenClip(String title) {
    return 'Mở clip $title';
  }

  @override
  String get playerNotFoundTitle => 'Không tìm thấy clip';

  @override
  String get playerNotFoundBody => 'Clip này có thể đã bị xóa.';

  @override
  String get playerMissingTitle => 'Thiếu tệp video';

  @override
  String get playerMissingBody =>
      'Bản ghi của clip này không còn trên iPhone của bạn. Bạn có thể xóa mục này khỏi thư viện.';

  @override
  String get playerRemoveEntry => 'Xóa mục';

  @override
  String get playerLoadError => 'Không thể phát video này.';

  @override
  String get playerPlay => 'Phát';

  @override
  String get playerPause => 'Tạm dừng';

  @override
  String get playerReplay => 'Phát lại';

  @override
  String get playerRenameTitle => 'Đổi tên clip';

  @override
  String get playerRenameHint => 'Tên clip';

  @override
  String get playerRenamed => 'Đã đổi tên clip';

  @override
  String get playerFavorited => 'Đã thêm vào mục yêu thích';

  @override
  String get playerUnfavorited => 'Đã bỏ khỏi mục yêu thích';

  @override
  String get playerShareFailed => 'Không thể chia sẻ clip này.';

  @override
  String get playerDetails => 'Chi tiết';

  @override
  String get playerDate => 'Thời điểm ghi';

  @override
  String get playerDuration => 'Thời lượng';

  @override
  String get playerResolution => 'Độ phân giải';

  @override
  String get playerSize => 'Dung lượng tệp';

  @override
  String get playerAudio => 'Âm thanh';

  @override
  String get playerAudioYes => 'Đã ghi';

  @override
  String get playerAudioNo => 'Không ghi';

  @override
  String get playerReason => 'Lưu bởi';

  @override
  String get playerReasonManual => 'Nút Lưu sự cố';

  @override
  String get playerReasonEmergency => 'Phát hiện có thể có va chạm';

  @override
  String get playerReasonRecovered => 'Khôi phục sau gián đoạn';

  @override
  String get playerSpeed => 'Tốc độ GPS khi lưu';

  @override
  String get playerLocation => 'Vị trí';

  @override
  String get playerOpenInMaps => 'Mở trong Bản đồ';

  @override
  String get playerBack => 'Quay lại';

  @override
  String get playerMore => 'Thêm thao tác';

  @override
  String get clipsFilterLabel => 'Hiển thị';

  @override
  String get clipsFilterAll => 'Tất cả';

  @override
  String get clipsFilterRecordings => 'Bản ghi';

  @override
  String get clipsFilterIncidents => 'Sự cố';

  @override
  String get clipsFilterEmergency => 'Khẩn cấp';

  @override
  String get clipsFilterFavorites => 'Yêu thích';

  @override
  String get clipsSort => 'Sắp xếp';

  @override
  String get clipsSortNewest => 'Mới nhất trước';

  @override
  String get clipsSortOldest => 'Cũ nhất trước';

  @override
  String get clipsSortLongest => 'Dài nhất trước';

  @override
  String get clipsSortLargest => 'Lớn nhất trước';

  @override
  String get clipsToday => 'Hôm nay';

  @override
  String get clipsYesterday => 'Hôm qua';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Chưa có clip nào trong danh mục này.';

  @override
  String get clipsFavoritesEmpty =>
      'Gắn sao một clip để giữ nó ở đây và truy cập nhanh.';

  @override
  String get clipsKindRecording => 'Bản ghi';

  @override
  String get clipsKindIncident => 'Sự cố';

  @override
  String get clipsKindEmergency => 'Khẩn cấp';

  @override
  String get clipsKindTest => 'Thử nghiệm';

  @override
  String clipsTripChip(String time) {
    return 'Chuyến đi · $time';
  }

  @override
  String get clipsOpenTrip => 'Mở chuyến đi đã ghi clip này';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return 'Đã dùng $used · còn trống $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Clip chiếm $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bản ghi',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sự cố',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trường hợp khẩn cấp',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Giải phóng dung lượng';

  @override
  String get clipsStorageLowGentle =>
      'Còn trống dưới 2 GB. Để ghi hình mượt mà, hãy giải phóng dung lượng hoặc xóa các clip bạn không cần nữa.';

  @override
  String get clipsSaveToPhotos => 'Lưu vào Ảnh';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Xóa $count clip ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Đang lưu $done/$total vào Ảnh…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã lưu $count clip vào Ảnh',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return 'Đã lưu $saved vào Ảnh · không thể lưu $failed';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista không được phép thêm video vào Ảnh. Bạn có thể cho phép trong Cài đặt.';

  @override
  String get clipsPhotosFailed => 'Không thể lưu vào Ảnh.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã thêm $count clip vào mục yêu thích',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã xóa $count clip khỏi mục yêu thích',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (đã cắt)';
  }

  @override
  String get playerTrim => 'Cắt';

  @override
  String get playerInfo => 'Thông tin';

  @override
  String get playerKind => 'Loại';

  @override
  String get playerReasonRecording => 'Nút Ghi';

  @override
  String get trimTitle => 'Cắt clip';

  @override
  String get trimHint =>
      'Kéo các tay cầm để chọn phần cần giữ. Clip gốc không thay đổi.';

  @override
  String get trimStartHandle => 'Điểm bắt đầu cắt';

  @override
  String get trimEndHandle => 'Điểm kết thúc cắt';

  @override
  String trimSelection(String duration) {
    return 'Đã chọn $duration';
  }

  @override
  String get trimSave => 'Lưu thành clip mới';

  @override
  String get trimSaving => 'Đang lưu clip đã cắt…';

  @override
  String get trimSaved => 'Đã lưu clip đã cắt';

  @override
  String get trimOpenNew => 'Mở';

  @override
  String get trimFailed => 'Không thể cắt clip này.';

  @override
  String get trimStorageFull => 'Không đủ dung lượng trống để lưu clip đã cắt.';

  @override
  String get trimPreview => 'Phát phần đã chọn';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get settingsSectionCamera => 'Camera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Cảnh báo';

  @override
  String get settingsSectionAlertCategories => 'Loại cảnh báo';

  @override
  String get settingsSectionRecording => 'Ghi hình';

  @override
  String get settingsSectionDriving => 'Lái xe';

  @override
  String get settingsSectionPower => 'Nguồn điện';

  @override
  String get settingsSectionEmergency => 'Khẩn cấp';

  @override
  String get settingsSectionAppearance => 'Giao diện';

  @override
  String get settingsSectionLanguage => 'Ngôn ngữ';

  @override
  String get settingsSectionInformation => 'Thông tin';

  @override
  String get settingsCameraLens => 'Ống kính camera';

  @override
  String get settingsLensWide => 'Góc rộng';

  @override
  String get settingsLensUltraWide => 'Góc siêu rộng';

  @override
  String get settingsLensTelephoto => 'Tele';

  @override
  String get settingsLensUnavailable => 'Không khả dụng trên iPhone này';

  @override
  String get settingsStabilization => 'Chống rung';

  @override
  String get settingsStabAuto => 'Tự động';

  @override
  String get settingsStabOff => 'Tắt';

  @override
  String get settingsStabStandard => 'Tiêu chuẩn';

  @override
  String get settingsStabCinematic => 'Điện ảnh';

  @override
  String get settingsOverlayOpacity => 'Độ mờ lớp phủ';

  @override
  String get settingsShowFps => 'Hiển thị thông số hiệu năng';

  @override
  String get settingsShowFpsSubtitle =>
      'Tốc độ khung hình và thời gian suy luận trên chế độ nhận diện';

  @override
  String get settingsCameraFooter =>
      'Thay đổi ống kính và chống rung sẽ có hiệu lực khi camera khởi động lần sau.';

  @override
  String get settingsAiModel => 'Mô hình AI';

  @override
  String get settingsConfidence => 'Độ tin cậy nhận diện';

  @override
  String get settingsTracking => 'Theo dõi đối tượng';

  @override
  String get settingsTrackingSubtitle =>
      'Giữ đối tượng ổn định giữa các khung hình';

  @override
  String get settingsShowLabels => 'Hiển thị nhãn';

  @override
  String get settingsShowConfidence => 'Hiển thị độ tin cậy';

  @override
  String get settingsSegmentationOpacity => 'Độ mờ lớp phủ cảm nhận';

  @override
  String get settingsAiFooter =>
      'Độ tin cậy thấp hơn hiển thị nhiều đối tượng hơn nhưng cũng nhiều nhận diện sai hơn. Kết quả nhận diện có thể không chính xác.';

  @override
  String get settingsVoiceAlerts => 'Cảnh báo bằng giọng nói';

  @override
  String get settingsVoiceLanguage => 'Ngôn ngữ giọng nói';

  @override
  String get settingsVoiceLanguageAuto => 'Theo ngôn ngữ ứng dụng';

  @override
  String get settingsVoice => 'Giọng nói';

  @override
  String get settingsVoiceDefault => 'Mặc định hệ thống';

  @override
  String get settingsVoiceQualityEnhanced => 'Nâng cao';

  @override
  String get settingsVoiceQualityPremium => 'Chất lượng cao';

  @override
  String get settingsNoVoices =>
      'Chưa cài giọng nói nào cho ngôn ngữ này. Hãy thêm trong Cài đặt iOS › Trợ năng › Nội dung được đọc.';

  @override
  String get settingsAlertPedestrian => 'Người đi bộ';

  @override
  String get settingsAlertCyclist => 'Người đi xe đạp';

  @override
  String get settingsAlertMotorcycle => 'Xe máy';

  @override
  String get settingsAlertBus => 'Xe buýt';

  @override
  String get settingsAlertVehicleClose => 'Phương tiện rất gần phía trước';

  @override
  String get settingsAlertTrafficLight => 'Đèn giao thông đổi màu';

  @override
  String get settingsAlertTrafficMoving => 'Xe phía trước bắt đầu di chuyển';

  @override
  String get settingsAlertStopSign => 'Biển báo dừng';

  @override
  String get settingsSensitivity => 'Độ nhạy';

  @override
  String get settingsSensitivityLow => 'Thấp';

  @override
  String get settingsSensitivityMedium => 'Trung bình';

  @override
  String get settingsSensitivityHigh => 'Cao';

  @override
  String get settingsCooldown => 'Khoảng cách lặp lại';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds giây';
  }

  @override
  String get settingsVolume => 'Âm lượng giọng nói';

  @override
  String get settingsQuietMode => 'Chế độ yên lặng';

  @override
  String get settingsQuietModeSubtitle =>
      'Chỉ đọc các cảnh báo quan trọng nhất';

  @override
  String get settingsTestVoice => 'Thử giọng nói';

  @override
  String get settingsTestVoiceDone => 'Đang phát cảnh báo mẫu…';

  @override
  String get settingsParkingBeeps => 'Tiếng bíp đỗ xe';

  @override
  String get settingsBeepVolume => 'Âm lượng tiếng bíp';

  @override
  String get settingsAlertsFooter =>
      'Cảnh báo chỉ là công cụ hỗ trợ. Luôn quan sát đường — im lặng không có nghĩa là đường thông thoáng.';

  @override
  String get settingsRecordingProfile => 'Chất lượng ghi hình';

  @override
  String get settingsProfileStandard => 'Tiêu chuẩn · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Bộ đệm sự cố';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds giây';
  }

  @override
  String get settingsManualMaxLength => 'Thời lượng tối đa khi ghi thủ công';

  @override
  String get settingsManualMaxUnlimited => 'Không giới hạn';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes phút';
  }

  @override
  String get settingsRecordAudio => 'Ghi âm';

  @override
  String get settingsRecordAudioSubtitle =>
      'Bao gồm âm thanh trong xe ở các sự cố đã lưu';

  @override
  String get settingsMicDenied =>
      'Quyền truy cập micro đang tắt. Hãy cho phép trong Cài đặt để ghi âm.';

  @override
  String get settingsWatermark => 'Hình mờ Corvista';

  @override
  String get settingsTimestamp => 'Dấu ngày giờ';

  @override
  String get settingsSaveLocation => 'Lưu vị trí cùng clip';

  @override
  String get settingsStorage => 'Bộ nhớ & clip';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip',
      zero: 'Không có clip',
    );
    return '$_temp0 · Đã dùng $used · Còn trống $free';
  }

  @override
  String get settingsRecordingFooter =>
      'Bộ đệm cuốn chiếu nằm trên iPhone của bạn và liên tục bị ghi đè. Không có gì được ghi ở chế độ nền.';

  @override
  String get settingsDefaultView => 'Chế độ xem mặc định';

  @override
  String get settingsUnits => 'Đơn vị';

  @override
  String get settingsShowCompass => 'Hiển thị la bàn';

  @override
  String get settingsHudStyle => 'Kiểu HUD';

  @override
  String get settingsHudCustomize => 'Tùy chỉnh HUD';

  @override
  String get settingsDrivingSide => 'Làn lái xe';

  @override
  String get settingsDrivingSideAuto => 'Tự động';

  @override
  String get settingsDrivingSideRight => 'Phải';

  @override
  String get settingsDrivingSideLeft => 'Trái';

  @override
  String get settingsVirtualStyle => 'Kiểu chế độ ảo';

  @override
  String get settingsVirtualMinimal => 'Tối giản';

  @override
  String get settingsVirtualPerspective => 'Phối cảnh';

  @override
  String get settingsVirtualHighContrast => 'Độ tương phản cao';

  @override
  String get settingsKeepScreenOn => 'Giữ màn hình sáng khi lái xe';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Hiển thị chỉ đường từng chặng trên Màn hình khóa và Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Ghi hình bị tạm dừng khi Corvista chạy nền';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Tạm dừng';

  @override
  String get liveActivityDashcamOff => 'Tắt camera';

  @override
  String get liveActivityEnded => 'Đã kết thúc dẫn đường';

  @override
  String get liveActivityEta => 'Đến nơi';

  @override
  String get settingsAutoRecenter => 'Tự động căn giữa bản đồ';

  @override
  String get settingsHudStyleClassic => 'Cổ điển';

  @override
  String get settingsHudStyleGrid => 'Lưới';

  @override
  String get settingsHudStyleMinimal => 'Tối giản';

  @override
  String get settingsHudStylePerformance => 'Hiệu năng';

  @override
  String get settingsHudStyleNavigation => 'Dẫn đường';

  @override
  String get settingsHudStyleNight => 'Ban đêm';

  @override
  String get settingsHudStyleHighContrast => 'Độ tương phản cao';

  @override
  String get settingsPowerMode => 'Chế độ nguồn';

  @override
  String get settingsPowerBalanced => 'Cân bằng';

  @override
  String get settingsPowerPerformance => 'Hiệu năng';

  @override
  String get settingsPowerSaver => 'Tiết kiệm pin';

  @override
  String get settingsPowerFooter =>
      'Corvista tự động giảm tốc độ AI và hiệu ứng hình ảnh khi iPhone nóng lên hoặc pin yếu.';

  @override
  String get settingsThermal => 'Trạng thái nhiệt';

  @override
  String get settingsThermalNominal => 'Bình thường';

  @override
  String get settingsThermalFair => 'Ấm';

  @override
  String get settingsThermalSerious => 'Nóng';

  @override
  String get settingsThermalCritical => 'Nghiêm trọng';

  @override
  String get settingsBattery => 'Pin';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Đang sạc';
  }

  @override
  String get settingsLowPowerMode =>
      'Chế độ Nguồn điện thấp đang bật — AI chạy ở tốc độ giảm.';

  @override
  String get settingsAiRate => 'Tốc độ AI hiện tại';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Phát hiện va chạm';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Bật · đếm ngược $seconds giây';
  }

  @override
  String get settingsEmergencyFooter =>
      'Thử nghiệm. Không thay thế dịch vụ khẩn cấp.';

  @override
  String get settingsTheme => 'Giao diện';

  @override
  String get settingsThemeSystem => 'Hệ thống';

  @override
  String get settingsThemeDark => 'Tối';

  @override
  String get settingsThemeLight => 'Sáng';

  @override
  String get settingsReduceMotion => 'Giảm chuyển động';

  @override
  String get settingsReduceMotionSubtitle =>
      'Giảm thiểu hiệu ứng động trong toàn bộ ứng dụng';

  @override
  String get settingsAppLanguage => 'Ngôn ngữ ứng dụng';

  @override
  String get settingsPrivacyPolicy => 'Chính sách quyền riêng tư';

  @override
  String get settingsTerms => 'Điều khoản sử dụng';

  @override
  String get settingsHelp => 'Trợ giúp';

  @override
  String get settingsSupport => 'Liên hệ hỗ trợ';

  @override
  String get settingsLicenses => 'Giấy phép mã nguồn mở';

  @override
  String get settingsSupportUnavailable =>
      'Không thể mở Mail. Hãy viết thư tới support@corvista.app.';

  @override
  String get settingsSafety => 'Thông tin an toàn';

  @override
  String get settingsDiagnostics => 'Chẩn đoán';

  @override
  String get settingsVersion => 'Phiên bản';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Tùy chỉnh HUD';

  @override
  String get hudCustomPreview => 'Xem trước · giá trị mẫu';

  @override
  String get hudCustomStyle => 'Kiểu';

  @override
  String get hudCustomElements => 'Thành phần';

  @override
  String get hudCustomSpeed => 'Tốc độ';

  @override
  String get hudCustomHeading => 'Hướng & la bàn';

  @override
  String get hudCustomClock => 'Đồng hồ';

  @override
  String get hudCustomBattery => 'Pin & nhiệt độ';

  @override
  String get hudCustomDetections => 'Trạng thái AI & nhận diện';

  @override
  String get hudCustomWeather => 'Thời tiết';

  @override
  String get hudCustomAppearance => 'Kích thước & độ mờ';

  @override
  String get hudCustomSize => 'Kích thước';

  @override
  String get hudCustomOpacity => 'Độ mờ';

  @override
  String get hudCustomFooter =>
      'Các cảnh báo như quá nhiệt luôn được hiển thị, kể cả khi các thành phần bị ẩn.';

  @override
  String get hudCustomDescClassic => 'Bảng đồng hồ cân bằng';

  @override
  String get hudCustomDescGrid => 'Lưới phối cảnh phủ lên mặt đường';

  @override
  String get hudCustomDescMinimal => 'Chỉ hiển thị tốc độ';

  @override
  String get hudCustomDescPerformance => 'Cung tốc độ kèm thông số trực tiếp';

  @override
  String get hudCustomDescNavigation => 'Ưu tiên hiển thị lần rẽ tiếp theo';

  @override
  String get hudCustomDescNight => 'Mờ dịu, ngả đỏ để lái xe ban đêm';

  @override
  String get hudCustomDescHighContrast => 'Dễ đọc tối đa dưới nắng gắt';

  @override
  String get languageTitle => 'Ngôn ngữ';

  @override
  String get languageSystem => 'Mặc định hệ thống';

  @override
  String get languageSystemSubtitle => 'Theo ngôn ngữ của iPhone';

  @override
  String get languageFooter =>
      'Sẽ có thêm ngôn ngữ. Ngôn ngữ cảnh báo bằng giọng nói có thể đặt riêng trong mục Cảnh báo.';

  @override
  String get diagTitle => 'Chẩn đoán';

  @override
  String get diagPerformance => 'Hiệu năng';

  @override
  String get diagInference => 'Thời gian suy luận';

  @override
  String get diagDetectHz => 'Tần suất nhận diện';

  @override
  String get diagCameraFps => 'Tốc độ khung hình camera';

  @override
  String get diagMemory => 'Bộ nhớ';

  @override
  String get diagDropped => 'Khung hình bị bỏ';

  @override
  String get diagSegmentation => 'Thời gian phân đoạn';

  @override
  String get diagCamera => 'Camera';

  @override
  String get diagStatus => 'Trạng thái';

  @override
  String get diagSource => 'Nguồn';

  @override
  String get diagSourceCamera => 'Camera trực tiếp';

  @override
  String get diagSourceFile => 'Tệp cảnh quay thử';

  @override
  String get diagResolution => 'Kích thước bộ đệm';

  @override
  String get diagLens => 'Ống kính';

  @override
  String get diagError => 'Lỗi gần nhất';

  @override
  String get diagModel => 'Mô hình AI';

  @override
  String get diagModelLoad => 'Thời gian tải mô hình';

  @override
  String get diagPower => 'Nguồn điện';

  @override
  String get diagSegHz => 'Tần suất phân đoạn';

  @override
  String get diagReduced => 'Giảm hiệu ứng';

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
  String get diagCamIdle => 'Nhàn rỗi';

  @override
  String get diagCamStarting => 'Đang khởi động';

  @override
  String get diagCamRunning => 'Đang chạy';

  @override
  String get diagCamInterrupted => 'Bị gián đoạn';

  @override
  String get diagCamStopped => 'Đã dừng';

  @override
  String get diagCamUnavailable => 'Không khả dụng';

  @override
  String get diagCamPermissionDenied => 'Bị từ chối quyền';

  @override
  String get diagCamError => 'Lỗi';

  @override
  String get diagTestFootage => 'Cảnh quay thử';

  @override
  String get diagTestFootageBody =>
      'Chạy nhận diện thực ngay trên thiết bị với một tệp video cục bộ thay cho camera. Mọi chế độ xem đều gắn nhãn CẢNH QUAY THỬ.';

  @override
  String get diagPathLabel => 'Đường dẫn tệp video';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Dùng Documents/test_drive.mp4';

  @override
  String get diagRun => 'Chạy cảnh quay thử';

  @override
  String get diagRunStarted =>
      'Đã bắt đầu cảnh quay thử. Mở chế độ lái xe để xem.';

  @override
  String get diagBackToCamera => 'Quay lại camera trực tiếp';

  @override
  String get diagDebugOnly => 'Cảnh quay thử chỉ có trong bản dựng phát triển.';

  @override
  String get diagFileMissing => 'Không có tệp nào tại đường dẫn đó.';

  @override
  String get emergencySetupTitle => 'Phát hiện va chạm';

  @override
  String get emergencyExperimental => 'Thử nghiệm';

  @override
  String get emergencyIntro =>
      'Khi lái xe, Corvista có thể theo dõi khả năng xảy ra va chạm mạnh bằng cảm biến chuyển động của iPhone. Nếu phát hiện, một bộ đếm ngược sẽ bắt đầu. Nếu bạn không hủy, Corvista sẽ đề nghị gọi dịch vụ khẩn cấp và nhắn tin cho các liên hệ của bạn.';

  @override
  String get emergencyDisclaimer1 =>
      'Không thay thế dịch vụ khẩn cấp hay tính năng phát hiện va chạm tích hợp của xe.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS luôn yêu cầu bạn xác nhận trước khi thực hiện cuộc gọi hoặc gửi tin nhắn.';

  @override
  String get emergencyDisclaimer3 =>
      'Va chạm có thể bị bỏ sót, và phanh gấp hoặc đường xóc có thể bị nhầm là va chạm.';

  @override
  String get emergencyParkedWarning =>
      'Hãy hoàn tất thiết lập này khi đã đỗ xe. Cài đặt bị khóa khi xe đang di chuyển.';

  @override
  String get emergencyEnable => 'Bật phát hiện va chạm';

  @override
  String get emergencyEnableSubtitle => 'Chỉ hoạt động trong phiên lái xe';

  @override
  String get emergencyNeedNumber => 'Hãy thêm số khẩn cấp trước.';

  @override
  String get emergencyContacts => 'Liên hệ khẩn cấp';

  @override
  String get emergencyAddContact => 'Thêm liên hệ';

  @override
  String get emergencyNoContacts =>
      'Chưa có liên hệ nào. Liên hệ chỉ nhận được tin nhắn sau khi bạn xác nhận.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Xóa $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Họ sẽ không được đề xuất làm người nhận sau va chạm.';

  @override
  String get emergencyRemove => 'Xóa';

  @override
  String get emergencyContactsError => 'Không thể tải danh bạ.';

  @override
  String get emergencyNumber => 'Số khẩn cấp';

  @override
  String get emergencyNumberHint => 'vd. 112 hoặc 911';

  @override
  String get emergencyMessage => 'Mẫu tin nhắn';

  @override
  String get emergencyMessageDefault =>
      'Tôi có thể vừa gặp tai nạn xe. Tin nhắn này do Corvista soạn sẵn và kèm vị trí gần nhất của tôi nếu có.';

  @override
  String get emergencyMessageHint => 'Để trống để dùng tin nhắn mặc định.';

  @override
  String get emergencyCountdown => 'Thời gian đếm ngược';

  @override
  String get emergencyVoiceCancel => 'Hủy bằng giọng nói';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Nói “Tôi ổn” hoặc “Hủy” trong lúc đếm ngược. Dùng nhận dạng giọng nói trên thiết bị nếu có.';

  @override
  String get emergencyVoicePermDenied =>
      'Cần quyền truy cập micro và nhận dạng giọng nói để hủy bằng giọng nói.';

  @override
  String get emergencyAutoSave => 'Tự động lưu clip sự cố';

  @override
  String get emergencyTest => 'Thử đếm ngược (không gọi)';

  @override
  String get emergencyTestBody =>
      'Chạy mô phỏng va chạm để bạn xem bộ đếm ngược. Chế độ thử không bao giờ thực hiện cuộc gọi hay gửi tin nhắn.';

  @override
  String get emergencyNotSet => 'Chưa đặt';

  @override
  String get emergencyAlertHeadline => 'Phát hiện có thể có va chạm mạnh.';

  @override
  String get emergencyAlertSubtitle => 'Bạn có ổn không?';

  @override
  String get emergencyAlertCancel => 'Tôi ổn — Hủy';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Còn $seconds giây',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => 'Đang nghe — nói “Tôi ổn” để hủy';

  @override
  String emergencyAlertHeard(String text) {
    return 'Đã nghe: “$text”';
  }

  @override
  String get emergencyAlertEscalated =>
      'Không có phản hồi. Hãy chọn việc cần làm:';

  @override
  String get emergencyAlertCall => 'Gọi dịch vụ khẩn cấp';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Gọi $number. iOS sẽ yêu cầu bạn xác nhận.';
  }

  @override
  String get emergencyAlertMessage => 'Nhắn tin cho liên hệ';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Mở sẵn một tin nhắn đã soạn. Bạn quyết định có gửi hay không.';

  @override
  String get emergencyAlertTestMode =>
      'Chế độ thử — sẽ không có cuộc gọi nào được thực hiện';

  @override
  String get emergencyAlertTestBadge => 'THỬ';

  @override
  String get emergencyAlertClose => 'Tôi ổn — Đóng';

  @override
  String get emergencyMsgSent => 'Đã gửi tin nhắn.';

  @override
  String get emergencyMsgCancelled => 'Tin nhắn chưa được gửi.';

  @override
  String get emergencyMsgFailed => 'Không thể gửi tin nhắn.';

  @override
  String get emergencyMsgUnavailable => 'Thiết bị này không hỗ trợ nhắn tin.';

  @override
  String emergencyCallFailed(String number) {
    return 'Không thể bắt đầu cuộc gọi. Hãy tự gọi $number.';
  }

  @override
  String get modelsTitle => 'Mô hình AI';

  @override
  String get modelsIntro =>
      'Tất cả mô hình được tích hợp sẵn trong ứng dụng và chạy hoàn toàn trên iPhone của bạn. Hình ảnh từ camera không bao giờ rời khỏi thiết bị.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Trực tiếp: $ms ms mỗi khung hình · $hz lần nhận diện/giây';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Đã tải trong $ms ms';
  }

  @override
  String get modelsEfficientName => 'Tiết kiệm';

  @override
  String get modelsEfficientDesc =>
      'Bộ nhận diện nhanh, gọn, được tinh chỉnh cho hành trình dài với mức nóng máy và hao pin thấp.';

  @override
  String get modelsEnhancedName => 'Nâng cao';

  @override
  String get modelsEnhancedDesc =>
      'Bộ nhận diện lớn hơn, phát hiện được đối tượng nhỏ và xa hơn, với mức tiêu thụ điện cao hơn.';

  @override
  String get modelsSegmentationName => 'Phân đoạn';

  @override
  String get modelsSegmentationDesc =>
      'Kết hợp nhận diện nhanh với lớp phủ mặt đường và đối tượng cho chế độ Cảm nhận.';

  @override
  String get modelsNoneName => 'AI tạm dừng';

  @override
  String get modelsNoneDesc =>
      'Camera và ghi hình vẫn chạy mà không nhận diện đối tượng. Tiêu thụ điện thấp nhất.';

  @override
  String get modelsGenericDesc => 'Mô hình nhận diện đối tượng trên thiết bị.';

  @override
  String get modelsFunctionDetection =>
      'Nhận diện phương tiện, người, xe đạp, xe máy, xe buýt, đèn giao thông và biển báo dừng';

  @override
  String get modelsFunctionSegmentation =>
      'Thêm lớp phủ mặt đường và đối tượng';

  @override
  String get modelsFunctionNone => 'Không nhận diện; chỉ ghi hình hành trình';

  @override
  String get modelsSize => 'Dung lượng';

  @override
  String get modelsInput => 'Đầu vào';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Dùng được với';

  @override
  String get modelsStatusInstalled => 'Đã cài đặt (tích hợp sẵn)';

  @override
  String get modelsStatusNotInstalled => 'Chưa cài đặt';

  @override
  String get modelsSelected => 'Đã chọn';

  @override
  String get modelsUse => 'Dùng mô hình này';

  @override
  String get modelsSwitching => 'Đang tải mô hình…';

  @override
  String modelsSwitched(String name) {
    return '$name hiện đang hoạt động';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Đo trên thiết bị này: trung bình $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Chưa đo trên thiết bị này';

  @override
  String get modelsBenchmarkRun => 'Chạy đo hiệu năng';

  @override
  String get modelsBenchmarkRunning => 'Đang đo hiệu năng…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Hãy chọn mô hình này để đo hiệu năng.';

  @override
  String get modelsBenchmarkDone => 'Đã đo hiệu năng xong';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Đo hiệu năng thất bại: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Cập nhật lần cuối $date';
  }

  @override
  String get safetyTitle => 'Thông tin an toàn';

  @override
  String get safetyIntro =>
      'Corvista là công cụ hỗ trợ nhận biết khi lái xe. Ứng dụng không điều khiển xe của bạn và không thể thay thế sự chú ý, phán đoán của bạn hay các hệ thống an toàn của xe.';

  @override
  String get safetyBeforeTitle => 'Trước khi lái xe';

  @override
  String get safetyBefore1 =>
      'Gắn iPhone chắc chắn ở vị trí hợp pháp, không che tầm nhìn, túi khí hay các bộ phận điều khiển.';

  @override
  String get safetyBefore2 =>
      'Hoàn tất thiết lập, chọn chế độ xem và đặt điểm đến khi đã đỗ xe.';

  @override
  String get safetyBefore3 =>
      'Cắm sạc cho các chuyến đi dài và tránh để điện thoại dưới ánh nắng trực tiếp nếu có thể.';

  @override
  String get safetyWhileTitle => 'Khi đang lái xe';

  @override
  String get safetyWhile1 =>
      'Luôn nhìn đường. Chỉ dùng các nút lớn trên màn hình khi an toàn và được pháp luật cho phép.';

  @override
  String get safetyWhile2 =>
      'Cảnh báo chỉ là công cụ hỗ trợ, không phải thông báo bạn có thể hoàn toàn dựa vào. Im lặng không bao giờ có nghĩa là đường thông thoáng.';

  @override
  String get safetyWhile3 =>
      'Hãy tuân thủ luật giao thông, tín hiệu và biển báo — chứ không phải ứng dụng — khi có sự khác biệt.';

  @override
  String get safetyLimitsTitle => 'Giới hạn';

  @override
  String get safetyLimits1 =>
      'Một camera điện thoại chỉ thấy những gì ở phía trước. Đối tượng ngoài tầm nhìn, bị che khuất hoặc quá gần sẽ không được nhận diện.';

  @override
  String get safetyLimits2 =>
      'Nhận diện có thể bị bỏ sót, chậm hoặc sai, đặc biệt vào ban đêm, khi mưa, sương mù, chói sáng hoặc kính chắn gió bẩn.';

  @override
  String get safetyLimits3 =>
      'Chỉ nhận biết các loại được hỗ trợ: phương tiện, xe buýt, xe máy, xe đạp, người, đèn giao thông và biển báo dừng. Gợi ý làn đường trong chế độ ảo chỉ mang tính minh họa, không phải làn đường được nhận diện.';

  @override
  String get safetyLimits4 =>
      'Khoảng cách được hiển thị theo các vùng gần đúng (Rất gần, Gần, Trung bình, Xa), không bao giờ là khoảng cách đo được. Chế độ đỗ xe không thay thế cảm biến đỗ xe.';

  @override
  String get safetyHeatTitle => 'Nhiệt và pin';

  @override
  String get safetyHeat1 =>
      'Việc dùng camera và AI liên tục làm iPhone nóng lên. Corvista giảm tần suất phân tích khi thiết bị nóng và hiển thị cảnh báo; nếu iOS quá nhiệt, camera có thể dừng.';

  @override
  String get safetyEmergencyTitle => 'Tính năng khẩn cấp';

  @override
  String get safetyEmergency1 =>
      'Phát hiện va chạm là tính năng thử nghiệm. Tính năng có thể bỏ sót va chạm thật và có thể bị kích hoạt bởi các sự kiện khác.';

  @override
  String get safetyEmergency2 =>
      'Tính năng không bao giờ liên hệ ai một cách âm thầm: iOS luôn yêu cầu bạn xác nhận cuộc gọi hoặc tin nhắn. Tính năng không thay thế việc tự gọi dịch vụ khẩn cấp.';

  @override
  String get privacyTitle => 'Quyền riêng tư';

  @override
  String get privacyIntro =>
      'Corvista được thiết kế để giữ dữ liệu lái xe của bạn trên iPhone. Không có tài khoản Corvista, và Corvista không vận hành máy chủ riêng.';

  @override
  String get privacyCameraTitle => 'Camera và AI';

  @override
  String get privacyCamera1 =>
      'Nhận diện đối tượng, theo dõi và phân đoạn chạy hoàn toàn trên iPhone của bạn. Khung hình camera không bao giờ được tải lên.';

  @override
  String get privacyCamera2 =>
      'Camera chỉ chạy khi Corvista đang mở trên màn hình. Camera tạm dừng khi ứng dụng chuyển sang nền — không có việc ghi hình ngầm ở chế độ nền.';

  @override
  String get privacyRecordingsTitle => 'Bản ghi';

  @override
  String get privacyRecordings1 =>
      'Bộ đệm cuốn chiếu chỉ là tạm thời và liên tục bị ghi đè. Cảnh quay chỉ được giữ khi bạn nhấn Lưu sự cố hoặc, nếu bạn bật, sau một va chạm có thể xảy ra.';

  @override
  String get privacyRecordings2 =>
      'Clip đã lưu nằm trong bộ nhớ riêng của Corvista trên iPhone của bạn. Chúng chỉ rời thiết bị khi bạn chọn Chia sẻ. Xóa ứng dụng sẽ xóa các clip này.';

  @override
  String get privacyRecordings3 =>
      'Âm thanh chỉ được ghi nếu bạn bật tính năng này và cấp quyền truy cập micro.';

  @override
  String get privacyLocationTitle => 'Vị trí';

  @override
  String get privacyLocation1 =>
      'Vị trí được dùng khi ứng dụng đang mở để hiển thị tốc độ, bản đồ, tuyến đường và thời tiết. Nếu “Lưu vị trí” được bật, vị trí tại thời điểm lưu sẽ được lưu cùng clip trên thiết bị của bạn.';

  @override
  String get privacyNetworkTitle => 'Dịch vụ mạng';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — hiển thị bản đồ, tìm kiếm địa điểm và tuyến đường. Nội dung tìm kiếm và vị trí gần đúng của bạn được gửi tới Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — thời tiết hiện tại và theo giờ tại vị trí của bạn.';

  @override
  String get privacyNetwork4 =>
      'Corvista không có quảng cáo, không có công cụ phân tích hay theo dõi của bên thứ ba.';

  @override
  String get privacyEmergencyTitle => 'Liên hệ khẩn cấp';

  @override
  String get privacyEmergency1 =>
      'Các liên hệ bạn chọn được lưu trong Chuỗi khóa iOS trên thiết bị này. Hủy bằng giọng nói dùng nhận dạng giọng nói trên thiết bị nếu có. Cuộc gọi và tin nhắn chỉ được gửi sau khi bạn xác nhận trong iOS.';

  @override
  String get privacyControlsTitle => 'Quyền kiểm soát của bạn';

  @override
  String get privacyControls1 =>
      'Bạn có thể xóa clip bất cứ lúc nào trong Clip, và thay đổi hoặc thu hồi quyền truy cập camera, micro, vị trí và giọng nói trong Cài đặt iOS.';

  @override
  String get termsTitle => 'Điều khoản sử dụng';

  @override
  String get termsIntro =>
      'Khi sử dụng Corvista, bạn đồng ý với các điều khoản này. Thỏa thuận cấp phép người dùng cuối ứng dụng tiêu chuẩn của Apple cũng được áp dụng.';

  @override
  String get termsUseTitle => 'Sử dụng Corvista';

  @override
  String get termsUse1 =>
      'Corvista là công cụ hỗ trợ nhận biết khi lái xe và camera hành trình. Bạn luôn hoàn toàn chịu trách nhiệm lái xe an toàn và đúng luật.';

  @override
  String get termsUse2 =>
      'Đừng thao tác với ứng dụng theo cách làm bạn mất tập trung khi lái xe. Hãy gắn thiết bị chắc chắn và đúng luật.';

  @override
  String get termsAccuracyTitle => 'Không đảm bảo độ chính xác';

  @override
  String get termsAccuracy1 =>
      'Kết quả nhận diện, vùng khoảng cách, cảnh báo, điểm đánh dấu trên bản đồ, tuyến đường và thời tiết có thể thiếu, chậm hoặc sai. Corvista không điều khiển xe của bạn.';

  @override
  String get termsAccuracy2 =>
      'Tính năng khẩn cấp là thử nghiệm và có thể không phát hiện được va chạm hoặc kích hoạt nhầm.';

  @override
  String get termsRecordingTitle => 'Luật về ghi hình';

  @override
  String get termsRecording1 =>
      'Luật về camera hành trình, ghi âm và quay phim người khác khác nhau tùy quốc gia và khu vực. Bạn chịu trách nhiệm tuân thủ, kể cả khi chia sẻ clip.';

  @override
  String get termsLiabilityTitle => 'Trách nhiệm pháp lý';

  @override
  String get termsLiability1 =>
      'Ứng dụng được cung cấp “nguyên trạng”. Trong phạm vi pháp luật cho phép, nhà phát triển không chịu trách nhiệm về tai nạn, tổn thất, tiền phạt hoặc thiệt hại phát sinh từ việc sử dụng ứng dụng hay dựa vào kết quả của ứng dụng.';

  @override
  String get termsChangesTitle => 'Thay đổi';

  @override
  String get termsChanges1 =>
      'Các điều khoản này có thể được cập nhật cùng phiên bản ứng dụng mới. Việc tiếp tục sử dụng sau khi cập nhật nghĩa là bạn chấp nhận các điều khoản đã sửa đổi.';

  @override
  String get helpTitle => 'Trợ giúp';

  @override
  String get helpIntro =>
      'Giải đáp các câu hỏi thường gặp. Về hướng dẫn an toàn, xem Thông tin an toàn.';

  @override
  String get helpQSave => 'Làm sao để giữ lại cảnh quay một sự cố?';

  @override
  String get helpASaveBuffer =>
      'Chạm nút Lưu sự cố lớn trong màn hình lái xe. Corvista lưu 20 hoặc 30 giây gần nhất của bộ đệm liên tục (bạn chọn trong Cài đặt › Ghi hình) vào Clip.';

  @override
  String get helpQWhere => 'Clip của tôi được lưu ở đâu?';

  @override
  String get helpAWhere =>
      'Trong bộ nhớ riêng của Corvista trên iPhone của bạn. Chúng không bao giờ được tải lên. Dùng Chia sẻ trong trình phát để gửi hoặc xuất clip.';

  @override
  String get helpQZones => 'Các vùng khoảng cách chính xác đến mức nào?';

  @override
  String get helpAZones =>
      'Các vùng chỉ là ước tính sơ bộ từ một camera dựa trên kích thước đối tượng thông thường. Hãy coi đó là gợi ý gần đúng, không bao giờ là khoảng cách.';

  @override
  String get helpQSlow => 'Vì sao nhận diện chậm lại?';

  @override
  String get helpASlow =>
      'Khi iPhone nóng lên, pin yếu hoặc chế độ Nguồn điện thấp đang bật, Corvista giảm tần suất phân tích để bảo vệ thiết bị. Bạn có thể đổi chế độ nguồn trong Cài đặt.';

  @override
  String get helpQMap => 'Bản đồ, tìm kiếm hoặc thời tiết không hoạt động.';

  @override
  String get helpAMap =>
      'Các tính năng này cần kết nối internet và quyền truy cập vị trí. Hãy kiểm tra kết nối và cho phép vị trí cho Corvista trong Cài đặt iOS.';

  @override
  String get helpQSimulator => 'Camera hiển thị là không khả dụng.';

  @override
  String get helpASimulator =>
      'Hãy chắc chắn đã cho phép truy cập camera trong Cài đặt iOS và không có ứng dụng nào khác đang dùng camera. Trình mô phỏng iOS không có camera; bạn có thể dùng video thử cục bộ thay thế.';

  @override
  String get emergencyMsgNoContacts => 'Hãy thêm liên hệ khẩn cấp trước.';

  @override
  String get cameraStarting => 'Đang khởi động camera…';

  @override
  String get cameraInterrupted => 'Camera tạm dừng';

  @override
  String get cameraInterruptedBody =>
      'iOS đã tạm dừng camera, ví dụ khi có cuộc gọi hoặc khi ứng dụng khác đang dùng. Camera sẽ tự động tiếp tục.';

  @override
  String get cameraUnavailable => 'Camera không khả dụng';

  @override
  String get cameraUnavailableBody =>
      'Thiết bị này không có camera khả dụng. Các chế độ nhận diện, ghi hình và đỗ xe cần camera sau.';

  @override
  String get cameraRunTestFootage => 'Chạy cảnh quay thử';

  @override
  String get cameraPermissionDenied => 'Quyền truy cập camera đang tắt';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista cần camera để nhận diện, ghi hình hành trình và chế độ đỗ xe. Hãy bật quyền truy cập Camera trong Cài đặt.';

  @override
  String get cameraError => 'Lỗi camera';

  @override
  String get cameraStopped => 'Camera đã dừng';

  @override
  String get cameraStart => 'Bật camera';

  @override
  String get cameraFocusHint => 'Chạm để lấy nét';

  @override
  String get cameraPreviewLabel =>
      'Chế độ xem camera trực tiếp với các đối tượng được nhận diện';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Camera $fps fps · AI $hz Hz · $ms ms · bỏ $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Tốc độ $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Không có tốc độ GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Hướng $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds giây';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Bộ đệm ghi hình hành trình, đã đệm $seconds trên $target giây';
  }

  @override
  String get hudRecIdle => 'REC tắt';

  @override
  String get hudRecSaving => 'Đang lưu…';

  @override
  String get hudRecError => 'Lỗi REC';

  @override
  String get hudAiPaused => 'AI tạm dừng';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count đối tượng',
      zero: 'Không có đối tượng',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'phát hiện $count đối tượng',
      zero: 'không có đối tượng',
    );
    return 'Mô hình AI $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Nóng — AI chậm lại';

  @override
  String get hudThermalCritical => 'Quá nóng — AI tạm dừng';

  @override
  String hudBatteryLow(String percent) {
    return 'Pin $percent';
  }

  @override
  String get hudLowPower => 'Chế độ Nguồn điện thấp';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Thời tiết $temperature, $condition. Chạm để xem chi tiết.';
  }

  @override
  String get hudNoGuidance =>
      'Hãy tìm điểm đến trong chế độ Bản đồ để xem chỉ đường từng chặng tại đây.';

  @override
  String get navArrived => 'Bạn đã đến nơi';

  @override
  String get navRerouting => 'Đang tìm lại đường…';

  @override
  String get navSearchHint => 'Tìm điểm đến';

  @override
  String get navSearchFieldHint => 'Địa chỉ, địa điểm hoặc doanh nghiệp';

  @override
  String get navNoResults => 'Không có địa điểm phù hợp';

  @override
  String get navSearching => 'Đang tìm kiếm…';

  @override
  String get navSearchStartTyping =>
      'Nhập địa chỉ hoặc tên địa điểm. Kết quả đến từ Apple Maps và cần kết nối internet.';

  @override
  String get navErrorUnavailable =>
      'Không thể tìm kiếm và chỉ đường — hãy kiểm tra kết nối internet.';

  @override
  String get navErrorNoLocation => 'Đang chờ vị trí của bạn để lập lộ trình.';

  @override
  String get navErrorPermission =>
      'Quyền truy cập vị trí đang tắt, nên lộ trình không thể bắt đầu từ vị trí của bạn.';

  @override
  String navErrorGeneric(String code) {
    return 'Không thể tải lộ trình ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Lộ trình đến $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Đến lúc $time';
  }

  @override
  String get navStart => 'Bắt đầu';

  @override
  String get navEnd => 'Kết thúc';

  @override
  String get navEndLabel => 'Kết thúc dẫn đường';

  @override
  String navRemaining(String distance, String duration) {
    return 'Còn $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Lưu ý: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes phút',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours giờ $minutes phút';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Lộ trình $index: $name';
  }

  @override
  String get weatherTitle => 'Thời tiết';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Cảm giác như $temperature';
  }

  @override
  String get weatherPrecipitation => 'Lượng mưa';

  @override
  String get weatherWind => 'Gió';

  @override
  String get weatherVisibility => 'Tầm nhìn';

  @override
  String get weatherHumidity => 'Độ ẩm';

  @override
  String get weatherHourly => 'Những giờ tới';

  @override
  String weatherAsOf(String time) {
    return 'Cập nhật $time';
  }

  @override
  String get weatherRefresh => 'Làm mới thời tiết';

  @override
  String get weatherUnavailable => 'Hiện chưa có dữ liệu thời tiết.';

  @override
  String get weatherNoLocation => 'Thời tiết cần vị trí của bạn.';

  @override
  String get weatherLegal => 'Nguồn dữ liệu & pháp lý';

  @override
  String weatherProvidedBy(String service) {
    return 'Dữ liệu thời tiết: $service';
  }

  @override
  String get weatherNow => 'Bây giờ';

  @override
  String get virtualEmpty => 'Không phát hiện đối tượng được hỗ trợ';

  @override
  String get virtualEmptyCameraOff => 'Chế độ ảo cần camera trực tiếp.';

  @override
  String get virtualLaneDisclaimer =>
      'Vạch kẻ làn chỉ mang tính minh họa, không phải được nhận diện.';

  @override
  String virtualNearest(String zone) {
    return 'Gần nhất: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Cảnh đường ảo: $summary';
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
  String get virtualStatusLive => 'đang chạy';

  @override
  String get virtualStatusPaused => 'tạm dừng';

  @override
  String get virtualStatusCameraOff => 'Tắt camera';

  @override
  String get virtualStatusTestFootage => 'Cảnh quay thử';

  @override
  String get virtualEmptyHint =>
      'Phương tiện, người, xe đạp, đèn và biển báo dừng sẽ xuất hiện tại đây khi được phát hiện.';

  @override
  String get mapRecenter => 'Căn giữa lại';

  @override
  String get mapZoomIn => 'Phóng to';

  @override
  String get mapZoomOut => 'Thu nhỏ';

  @override
  String get mapUnsupported => 'Bản đồ tương tác có trên iPhone.';

  @override
  String get mapObjectsApprox =>
      'Các điểm đánh dấu đối tượng là vị trí gần đúng.';

  @override
  String get mapWeatherUnavailable => 'Không có dữ liệu thời tiết';

  @override
  String get navErrorNoRoute => 'Không tìm thấy lộ trình đến điểm đến này.';

  @override
  String get navDismiss => 'Bỏ qua';

  @override
  String get navGo => 'Đi';

  @override
  String get navFastest => 'Nhanh nhất';

  @override
  String get navThen => 'Sau đó';

  @override
  String get navRecents => 'Gần đây';

  @override
  String get navClearRecents => 'Xóa';

  @override
  String get navSearchSubmitHint =>
      'Nhấn Tìm kiếm để xem tất cả địa điểm phù hợp';

  @override
  String get navPlaces => 'Địa điểm';

  @override
  String get navEtaLabel => 'đến nơi';

  @override
  String get navTimeLeftLabel => 'còn lại';

  @override
  String get navOverview => 'Tổng quan';

  @override
  String get navMute => 'Tắt giọng nói';

  @override
  String get navUnmute => 'Bật giọng nói';

  @override
  String get navEndConfirm => 'Kết thúc dẫn đường?';

  @override
  String navEndConfirmBody(String place) {
    return 'Chỉ đường đến $place sẽ dừng lại.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Bạn đã đến $place';
  }

  @override
  String get navDone => 'Xong';

  @override
  String get navWeakGps => 'Tín hiệu GPS yếu';

  @override
  String get navLocationOff =>
      'Vị trí đang tắt. Hãy bật để lập lộ trình và dẫn đường.';

  @override
  String get navVoiceGuidance => 'Chỉ đường bằng giọng nói';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Sau $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, sau đó $second';
  }

  @override
  String get navSpeakRerouting => 'Đang tìm lại đường';

  @override
  String get navSpeakArrived => 'Bạn đã đến nơi';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mét',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value ki-lô-mét',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count feet',
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
    return 'Tiếp tục đi $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Không có chỉ đường cho chuyến đi này ở khu vực này. Hãy thử điểm đến khác.';

  @override
  String navContinueFor(String distance) {
    return 'Tiếp tục đi $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dặm',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Gần nhất: $object · $zone';
  }

  @override
  String get parkingNothing => 'Không phát hiện gì trong tầm nhìn';

  @override
  String get parkingBeeps => 'Tiếng bíp khoảng cách';

  @override
  String get parkingVolume => 'Âm lượng tiếng bíp';

  @override
  String get parkingLimitations =>
      'Chỉ một camera, không phải 360°. Đối tượng ngoài tầm nhìn camera sẽ không được nhận diện. Không thay thế cảm biến đỗ xe; ước tính có thể sai và im lặng không có nghĩa là khu vực thông thoáng.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Chế độ xem khoảng cách từ trên xuống. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Gốc';

  @override
  String get perceptionModeBoxes => 'Khung';

  @override
  String get perceptionModeMasks => 'Lớp phủ đối tượng';

  @override
  String get perceptionModeRoad => 'Mặt đường';

  @override
  String get perceptionModeCombined => 'Kết hợp';

  @override
  String get perceptionOpacity => 'Độ mờ lớp phủ';

  @override
  String get perceptionDisclaimer =>
      'Lớp phủ mặt đường là lớp hình ảnh gần đúng. Nó không cho biết không gian có thể di chuyển hay làn đường.';

  @override
  String get perceptionNeedsModel =>
      'Hãy chọn mô hình Phân đoạn để xem lớp phủ.';

  @override
  String get perceptionChooseModel => 'Chọn mô hình';

  @override
  String get perceptionWaiting => 'Đang chờ khung hình phân đoạn đầu tiên…';

  @override
  String get perceptionShortCamera => 'Camera';

  @override
  String get perceptionShortBoxes => 'Khung';

  @override
  String get perceptionShortObjects => 'Vật thể';

  @override
  String get perceptionShortRoad => 'Đường';

  @override
  String get perceptionShortAll => 'Tất cả';

  @override
  String get perceptionModesLabel => 'Lớp nhận diện';

  @override
  String get perceptionStatusWarmingUp => 'Đang khởi động…';

  @override
  String get perceptionStatusLoadingModel => 'Đang tải mô hình…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Đã tạm dừng lớp phủ';

  @override
  String get perceptionLegend => 'Chú giải lớp phủ';

  @override
  String get perceptionUnavailable => 'Không có lớp phủ';

  @override
  String get driveSave => 'Lưu';

  @override
  String get driveSaveIncident => 'Lưu sự cố';

  @override
  String driveSaveHint(int seconds) {
    return 'Lưu $seconds giây gần nhất của cảnh quay hành trình';
  }

  @override
  String get driveSaving => 'Đang lưu sự cố…';

  @override
  String hudRecManualLabel(String time) {
    return 'Đang ghi, $time';
  }

  @override
  String get driveRecord => 'Ghi';

  @override
  String get driveRecordStartA11y => 'Bắt đầu ghi';

  @override
  String driveRecordStopA11y(String time) {
    return 'Dừng ghi, đã ghi $time';
  }

  @override
  String get driveRecordHint =>
      'Ghi liên tục cho đến khi bạn dừng, bao gồm cả 5 giây trước đó';

  @override
  String get driveRecordFailed => 'Không thể bắt đầu ghi';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã lưu bản ghi · $count phần',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Đã dừng ghi: bộ nhớ gần đầy',
      'max_duration': 'Đã dừng ghi: đã đạt thời lượng tối đa',
      'camera_stopped': 'Đã dừng ghi cùng với camera',
      'background': 'Đã dừng ghi: ứng dụng chuyển sang nền',
      'thermal': 'Đã dừng ghi: điện thoại quá nóng',
      'other': 'Đã dừng ghi',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Đã lưu sự cố · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Xem';

  @override
  String get driveSaveFailed => 'Không thể lưu sự cố.';

  @override
  String get driveSaveNotRunning =>
      'Chưa bắt đầu ghi hình — hãy chờ camera khởi động rồi thử lại.';

  @override
  String get driveSaveTestFootage =>
      'Cảnh quay thử không được ghi. Lưu sự cố hoạt động với camera trực tiếp.';

  @override
  String get driveSaveStorageFull =>
      'iPhone của bạn đã hết bộ nhớ. Hãy giải phóng dung lượng hoặc xóa các clip cũ.';

  @override
  String get driveSaveIoError => 'Không thể ghi clip vào bộ nhớ.';

  @override
  String get driveClips => 'Clip';

  @override
  String get driveSettings => 'Cài đặt';

  @override
  String get driveViewSwitcher => 'Chế độ lái xe';

  @override
  String get driveLocationDenied =>
      'Vị trí đang tắt — không có tốc độ, bản đồ và lộ trình.';

  @override
  String get driveCameraDenied =>
      'Quyền truy cập camera đang tắt — không thể nhận diện và ghi hình.';

  @override
  String get driveRecorderFallback =>
      'Ghi hình không có âm thanh: quyền truy cập micro đang tắt.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Cài đặt ghi hình đã được điều chỉnh: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhone của bạn đang nóng. AI chạy chậm lại để hạ nhiệt — hãy tránh ánh nắng trực tiếp và để gần cửa gió.';

  @override
  String get drivePowerThermalCritical =>
      'iPhone của bạn quá nóng. Nhận diện AI tạm dừng cho đến khi nguội; ghi hình vẫn tiếp tục nếu có thể.';

  @override
  String get drivePowerLowPower =>
      'Chế độ Nguồn điện thấp đang bật — AI chạy ở tốc độ giảm.';

  @override
  String get drivePowerBatteryLow => 'Pin yếu — hãy cắm sạc iPhone khi lái xe.';

  @override
  String get onboardingTitle1 => 'Nhìn xa hơn trên mỗi hành trình.';

  @override
  String get onboardingBody1 =>
      'Biến iPhone thành camera hành trình thông minh và người bạn đồng hành giúp nhận biết khi lái xe.';

  @override
  String get onboardingTitle2 => 'Thông minh trong từng khung hình.';

  @override
  String get onboardingBody2 =>
      'Nhận biết các phương tiện, người, xe đạp và tín hiệu đường được hỗ trợ ngay trên iPhone của bạn.';

  @override
  String get onboardingTitle3 => 'Một con đường. Nhiều góc nhìn.';

  @override
  String get onboardingBody3 =>
      'Chuyển đổi giữa nhận diện trực tiếp, chế độ lái xe ảo, bản đồ tương tác và hiển thị đỗ xe.';

  @override
  String get onboardingTitle4 => 'Giữ lại những khoảnh khắc quan trọng.';

  @override
  String get onboardingBody4 =>
      'Lưu cảnh quay hành trình gần đây, xem lại sự cố và chia sẻ bản ghi.';

  @override
  String get onboardingTitle5 => 'An toàn & quyền riêng tư';

  @override
  String get onboardingSafety1 =>
      'Corvista là công cụ hỗ trợ nhận biết khi lái xe. Hãy luôn nhìn đường.';

  @override
  String get onboardingSafety2 =>
      'Ứng dụng không điều khiển xe của bạn hay thay thế phán đoán của bạn.';

  @override
  String get onboardingSafety3 =>
      'Kết quả nhận diện và ước tính có thể không chính xác hoặc bị bỏ sót.';

  @override
  String get onboardingSafety4 =>
      'Camera được xử lý ngay trên iPhone của bạn — video không được tải lên.';

  @override
  String get onboardingSafety5 =>
      'Bản đồ, tìm kiếm, lộ trình và thời tiết cần kết nối internet.';

  @override
  String get onboardingSafety6 =>
      'Gắn iPhone chắc chắn để không che tầm nhìn của bạn.';

  @override
  String get onboardingSafety7 =>
      'Hoàn tất thiết lập trước khi bắt đầu lái xe.';

  @override
  String get onboardingAcknowledge =>
      'Tôi hiểu Corvista là công cụ hỗ trợ nhận biết và tôi vẫn chịu trách nhiệm lái xe an toàn.';

  @override
  String get onboardingReadSafety => 'Đọc đầy đủ thông tin an toàn';

  @override
  String get onboardingNext => 'Tiếp';

  @override
  String get onboardingSkip => 'Bỏ qua';

  @override
  String get onboardingAgree => 'Tiếp tục';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Trang $current trên $total';
  }

  @override
  String get permTitle => 'Quyền truy cập';

  @override
  String get permIntro =>
      'Corvista chỉ yêu cầu những gì mỗi tính năng cần. Bạn có thể thay đổi bất cứ lúc nào trong Cài đặt.';

  @override
  String get permCameraTitle => 'Camera';

  @override
  String get permCameraBody =>
      'Cần cho nhận diện, ghi hình hành trình và chế độ đỗ xe. Video được xử lý trên iPhone của bạn.';

  @override
  String get permLocationTitle => 'Vị trí';

  @override
  String get permLocationBody =>
      'Dùng cho tốc độ GPS, bản đồ, lộ trình, thời tiết và gắn vị trí cho clip đã lưu. Chỉ khi bạn đang dùng ứng dụng.';

  @override
  String get permMicTitle => 'Micro';

  @override
  String get permSpeechNote =>
      'Nhận dạng giọng nói chỉ được yêu cầu nếu bạn bật hủy bằng giọng nói cho cảnh báo khẩn cấp.';

  @override
  String get permRequired => 'Bắt buộc';

  @override
  String get permOptional => 'Tùy chọn';

  @override
  String get permAllow => 'Cho phép';

  @override
  String get permGranted => 'Đã cho phép';

  @override
  String get permDenied => 'Đã từ chối';

  @override
  String get permLimited => 'Giới hạn';

  @override
  String get permRestricted => 'Bị hạn chế';

  @override
  String get permStart => 'Bắt đầu lái xe';

  @override
  String get permCameraNeeded =>
      'Bạn có thể tiếp tục mà không cấp quyền camera, nhưng nhận diện và ghi hình sẽ không hoạt động cho đến khi bạn cho phép trong Cài đặt.';

  @override
  String get permSetupIntro =>
      'Corvista cần các quyền này để hoạt động đầy đủ. Nhấn Cho phép tất cả và iOS sẽ lần lượt hỏi từng quyền. Bạn có thể thay đổi bất cứ lúc nào trong Cài đặt.';

  @override
  String get permCameraLine =>
      'Cần cho nhận diện, ghi hình hành trình và chế độ đỗ xe. Video được xử lý trên iPhone của bạn, không bao giờ được tải lên.';

  @override
  String get permLocationLine =>
      'Tốc độ GPS, bản đồ, lộ trình, thời tiết và nơi clip được lưu. Chỉ khi bạn đang dùng ứng dụng.';

  @override
  String get permMicLine =>
      'Âm thanh trong xe ở clip sự cố, và nghe cụm từ hủy của bạn trong cảnh báo khẩn cấp.';

  @override
  String get permSpeechTitle => 'Nhận dạng giọng nói';

  @override
  String get permSpeechLine =>
      'Nhận dạng cụm từ hủy của bạn trong lúc đếm ngược khẩn cấp, ngay trên iPhone nếu được hỗ trợ.';

  @override
  String get permAllowAll => 'Cho phép tất cả';

  @override
  String permAsking(String permission) {
    return 'Đang yêu cầu quyền $permission…';
  }

  @override
  String get permSomeDenied =>
      'Một số quyền đang tắt. Hãy bật trong Cài đặt để dùng các tính năng đó.';

  @override
  String get permNotNow => 'Để sau';

  @override
  String get tourLabel => 'Hướng dẫn màn hình lái xe';

  @override
  String tourProgress(int current, int total) {
    return 'Bước $current/$total';
  }

  @override
  String get tourNext => 'Tiếp';

  @override
  String get tourBack => 'Quay lại';

  @override
  String get tourSkip => 'Bỏ qua hướng dẫn';

  @override
  String get tourFinish => 'Bắt đầu lái xe';

  @override
  String get tourWelcomeTitle => 'Hướng dẫn nhanh';

  @override
  String get tourWelcomeBody =>
      'Một phút điểm qua những điều quan trọng trên màn hình Lái xe. Tốt nhất nên làm khi đã đỗ xe.';

  @override
  String get tourHudTitle => 'Thanh thông số của bạn';

  @override
  String get tourHudSpeed => 'Tốc độ lấy từ GPS.';

  @override
  String get tourHudRec => 'REC cho biết số giây cảnh quay đang được đệm.';

  @override
  String get tourHudAi =>
      'Chip AI hiển thị mô hình, số đối tượng nhìn thấy và một chấm: xanh là đang chạy, vàng là bị hạn chế, đỏ là đã dừng.';

  @override
  String get tourSaveTitle => 'Lưu sự cố';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista giữ bộ đệm cuốn chiếu $seconds giây video gần nhất. Bộ đệm liên tục bị ghi đè nên không có gì được giữ lại trừ khi bạn nhấn Lưu. Clip đã lưu nằm trên iPhone này, trong Clip.';
  }

  @override
  String get tourRecordTitle => 'Ghi lại cả chuyến đi';

  @override
  String get tourRecordBody =>
      'Chạm Ghi để quay liên tục cho đến khi bạn dừng. Chuyến đi dài được lưu thành các phần 5 phút trong Clip, và Lưu sự cố vẫn hoạt động khi bạn đang ghi.';

  @override
  String get tourViewsTitle => 'Năm cách nhìn con đường';

  @override
  String get tourViewDetection =>
      'Camera trực tiếp với khung quanh các đối tượng được hỗ trợ.';

  @override
  String get tourViewVirtual =>
      'Cảnh 3D đơn giản hóa được dựng từ kết quả nhận diện.';

  @override
  String get tourViewMap => 'Apple Maps với tìm kiếm và chỉ đường từng chặng.';

  @override
  String get tourViewParking =>
      'Camera kèm chế độ xem khoảng cách từ trên xuống.';

  @override
  String get tourViewPerception => 'Lớp phủ mặt đường và đối tượng.';

  @override
  String get tourMapTitle => 'Tìm kiếm & chỉ đường từng chặng';

  @override
  String get tourMapBody =>
      'Mở Bản đồ, chạm vào thanh tìm kiếm và chọn điểm đến. Chọn lộ trình, rồi nhấn Bắt đầu để được chỉ đường từng chặng. Cần kết nối internet.';

  @override
  String get tourClipsTitle => 'Clip';

  @override
  String get tourClipsBody =>
      'Xem lại, đổi tên, chia sẻ hoặc xóa các sự cố đã lưu. Clip ở lại trên iPhone của bạn trừ khi bạn chia sẻ.';

  @override
  String get tourSettingsTitle => 'Cài đặt';

  @override
  String get tourSettingsBody =>
      'Tinh chỉnh cảnh báo bằng giọng nói và độ nhạy, chất lượng ghi hình và độ dài bộ đệm, đồng thời thiết lập chế độ Khẩn cấp: cảnh báo va chạm thử nghiệm với đếm ngược hủy.';

  @override
  String get tourSafetyTitle => 'Trước khi lái xe';

  @override
  String get tourSafety1 =>
      'Gắn iPhone chắc chắn ở nơi không che tầm nhìn của bạn.';

  @override
  String get tourSafety2 =>
      'Đừng thao tác với ứng dụng khi đang lái xe. Hãy thiết lập khi đã đỗ xe.';

  @override
  String get tourSafety3 =>
      'Kết quả nhận diện và vùng khoảng cách chỉ là ước tính. Chúng có thể sai hoặc bị bỏ sót.';

  @override
  String get tourSafety4 => 'Bạn vẫn chịu trách nhiệm lái xe an toàn.';

  @override
  String get helpTakeTour => 'Xem hướng dẫn';

  @override
  String get helpTakeTourSub => 'Một phút làm quen với màn hình Lái xe.';

  @override
  String get tripsTitle => 'Chuyến đi';

  @override
  String get tripsOpen => 'Nhật ký chuyến đi';

  @override
  String get tripsEmptyTitle => 'Chưa có chuyến đi nào';

  @override
  String get tripsEmptyBody =>
      'Chuyến đi được ghi tự động khi bạn lái xe cùng Corvista — quãng đường, thời gian, tốc độ và lộ trình bạn đã đi.';

  @override
  String get tripsDisabledBody =>
      'Nhật ký chuyến đi đang tắt nên các chuyến đi mới không được ghi lại. Hãy bật để lưu riêng nhật ký lộ trình trên iPhone này.';

  @override
  String get tripsEnable => 'Bật nhật ký chuyến đi';

  @override
  String get tripsToday => 'Hôm nay';

  @override
  String get tripsYesterday => 'Hôm qua';

  @override
  String tripsRecordingNow(String distance) {
    return 'Đang ghi chuyến đi · $distance';
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
      other: '$count sự cố',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cảnh báo',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chuyến đi',
      zero: 'Chưa có chuyến đi',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Quãng đường';

  @override
  String get tripsStatDuration => 'Thời lượng';

  @override
  String get tripsStatMoving => 'Thời gian di chuyển';

  @override
  String get tripsStatAvgSpeed => 'Tốc độ TB';

  @override
  String get tripsStatMaxSpeed => 'Tốc độ tối đa';

  @override
  String get tripsDetections => 'Nhận diện';

  @override
  String get tripsNoDetections =>
      'Không có đối tượng đường nào được ghi lại trong chuyến đi này.';

  @override
  String get tripsTimeline => 'Dòng thời gian';

  @override
  String get tripsEventStart => 'Chuyến đi bắt đầu';

  @override
  String get tripsEventEnd => 'Chuyến đi kết thúc';

  @override
  String get tripsEventAlert => 'Cảnh báo bằng giọng nói';

  @override
  String get tripsEventIncident => 'Đã lưu clip sự cố';

  @override
  String get tripsEventEmergency => 'Phát hiện có thể có va chạm';

  @override
  String get tripsEventNavStart => 'Đã bắt đầu dẫn đường';

  @override
  String get tripsEventArrive => 'Đã đến điểm đến';

  @override
  String get tripsEventReroute => 'Đã tính lại lộ trình';

  @override
  String get tripsEventRecording => 'Đã lưu bản ghi';

  @override
  String get tripsOpenClip => 'Mở clip';

  @override
  String get tripsTrackPreview => 'Đường đi GPS';

  @override
  String get tripsRenameTitle => 'Đổi tên chuyến đi';

  @override
  String get tripsRenameHint => 'Tên chuyến đi';

  @override
  String get tripsFavorite => 'Thêm vào mục yêu thích';

  @override
  String get tripsUnfavorite => 'Bỏ khỏi mục yêu thích';

  @override
  String get tripsShareGpx => 'Chia sẻ GPX';

  @override
  String get tripsShareFailed => 'Không thể chia sẻ chuyến đi này.';

  @override
  String get tripsDelete => 'Xóa chuyến đi';

  @override
  String get tripsDeleteConfirmTitle => 'Xóa chuyến đi này?';

  @override
  String get tripsDeleteConfirmBody =>
      'Lộ trình và số liệu thống kê sẽ bị xóa khỏi iPhone này. Các clip sự cố của chuyến đi này vẫn được giữ.';

  @override
  String get tripsDeleted => 'Đã xóa chuyến đi';

  @override
  String get tripsNotFound => 'Chuyến đi này không còn khả dụng.';

  @override
  String get tripsPrivacyNote =>
      'Chỉ lưu trên iPhone này. Không có gì được tải lên.';

  @override
  String get settingsSectionTrips => 'Nhật ký chuyến đi';

  @override
  String get settingsTripLog => 'Ghi lại chuyến đi';

  @override
  String get settingsTripLogSubtitle =>
      'Chỉ lưu lộ trình và số liệu lái xe của bạn trên iPhone này.';

  @override
  String get settingsTripRetention => 'Giữ chuyến đi trong';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 năm';

  @override
  String get settingsRetentionForever => 'Mãi mãi';

  @override
  String get settingsTripRetentionFooter =>
      'Các chuyến đi cũ hơn sẽ tự động bị xóa khi Corvista khởi động.';

  @override
  String get settingsViewTrips => 'Xem chuyến đi';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours giờ $minutes phút';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes phút';
  }

  @override
  String tripsGpxName(String date) {
    return 'Chuyến đi Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Giải phóng dung lượng';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Xóa tệp tạm và bộ nhớ đệm. Clip và chuyến đi đã lưu vẫn được giữ.';

  @override
  String settingsFreedBytes(String size) {
    return 'Đã giải phóng $size';
  }

  @override
  String get settingsNothingToFree =>
      'Đã xóa bộ nhớ đệm — không có tệp tạm nào cần xóa.';

  @override
  String get settingsSectionPrivacyData => 'Quyền riêng tư & dữ liệu';

  @override
  String get settingsPrivacyDataFooter =>
      'Clip, chuyến đi và cài đặt chỉ được lưu trên iPhone này. Chúng chỉ rời khỏi máy khi bạn chọn chia sẻ.';

  @override
  String get settingsDeleteAllData => 'Xóa tất cả dữ liệu';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Xóa clip, chuyến đi, liên hệ và cài đặt khỏi iPhone này';

  @override
  String get deleteAllTitle => 'Xóa tất cả dữ liệu?';

  @override
  String get deleteAllMessage =>
      'Thao tác này sẽ xóa vĩnh viễn khỏi iPhone này:\n• Clip sự cố và ảnh thu nhỏ\n• Nhật ký chuyến đi và lộ trình GPS\n• Liên hệ khẩn cấp và sự kiện khẩn cấp\n• Nhật ký phát hiện và nhật ký chẩn đoán\n• Cài đặt và các điểm đến gần đây\n• Bộ đệm ghi hình tạm thời và bộ nhớ đệm\n\nKhông thể hoàn tác. Sau đó Corvista sẽ bắt đầu lại từ các màn hình chào mừng.';

  @override
  String get deleteAllConfirm => 'Xóa tất cả';

  @override
  String get deleteAllInProgress => 'Đang xóa…';

  @override
  String get deleteAllDone => 'Đã xóa tất cả dữ liệu';

  @override
  String get deleteAllPartial =>
      'Không thể xóa một số mục. Hãy thử lại từ Cài đặt.';

  @override
  String get diagLogSection => 'Nhật ký chẩn đoán';

  @override
  String get diagLogFooter =>
      'Lỗi chỉ được ghi trên iPhone này, không kèm vị trí, tên liên hệ hay số điện thoại. Không có gì được gửi đi trừ khi bạn tự chia sẻ nhật ký.';

  @override
  String get diagLogShare => 'Chia sẻ nhật ký chẩn đoán';

  @override
  String get diagLogEmpty => 'Trống';

  @override
  String get diagLogClear => 'Xóa nhật ký';

  @override
  String get diagLogClearTitle => 'Xóa nhật ký chẩn đoán?';

  @override
  String get diagLogClearBody =>
      'Các mục lỗi đã lưu sẽ bị xóa khỏi iPhone này.';

  @override
  String get diagLogCleared => 'Đã xóa nhật ký chẩn đoán';

  @override
  String get diagLogShareFailed => 'Không thể chia sẻ nhật ký chẩn đoán.';

  @override
  String get privacyControls2 =>
      'Cài đặt › Quyền riêng tư & dữ liệu › Xóa tất cả dữ liệu sẽ xóa mọi clip, chuyến đi, liên hệ, nhật ký và cài đặt mà Corvista đã lưu trên iPhone này.';

  @override
  String get parkingZoneStop => 'Dừng';

  @override
  String get parkingZoneVeryClose => 'Rất gần';

  @override
  String get parkingZoneClose => 'Gần';

  @override
  String get parkingZoneNothingClose => 'Không thấy vật nào gần';

  @override
  String get parkingNotDetected =>
      'Không phát hiện tường, cột, trụ và lề đường';

  @override
  String get parkingApprox => 'ước tính';

  @override
  String get parkingSideLeft => 'Trái';

  @override
  String get parkingSideCenter => 'Giữa';

  @override
  String get parkingSideRight => 'Phải';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Chỉ hiển thị camera phía trước — không phải hệ thống 360°';

  @override
  String get parkingMuteBeeps => 'Tắt tiếng bíp';

  @override
  String get parkingUnmuteBeeps => 'Bật tiếng bíp';

  @override
  String get parkingAbout => 'Giới thiệu chế độ đỗ xe';

  @override
  String get parkingLimitationsDetail =>
      'Chỉ khu vực phía trước camera được theo dõi. Bộ phát hiện nhận biết ô tô, xe buýt, xe tải, người, xe đạp và xe máy. Tường, cột, trụ, lề đường, cọc chắn, rào chắn và chướng ngại vật thấp KHÔNG được phát hiện, và nắp capo có thể che mặt đất ngay phía trước. Khoảng cách chỉ là ước lượng thô từ một camera (dựa trên kích thước và vị trí vật thể) và có thể sai lệch rất nhiều. Im lặng hoặc “Không thấy vật nào gần” không có nghĩa là đường thông thoáng — hãy luôn quan sát xung quanh và dùng gương.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Mức độ gần theo bên: trái $left, giữa $center, phải $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Lỗi được ghi vào nhật ký riêng trên iPhone này (không có vị trí, tên liên hệ hay số điện thoại). Nhật ký không bao giờ được gửi tự động; bạn có thể chia sẻ hoặc xóa trong Cài đặt › Chẩn đoán.';
}
