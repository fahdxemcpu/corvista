// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'มองเห็นได้มากขึ้นในทุกการเดินทาง';

  @override
  String get commonCancel => 'ยกเลิก';

  @override
  String get commonDelete => 'ลบ';

  @override
  String get commonSave => 'บันทึก';

  @override
  String get commonBack => 'กลับ';

  @override
  String get commonClose => 'ปิด';

  @override
  String get commonRetry => 'ลองอีกครั้ง';

  @override
  String get commonOpenSettings => 'เปิดการตั้งค่า';

  @override
  String get commonLoading => 'กำลังโหลด…';

  @override
  String get commonError => 'เกิดข้อผิดพลาดบางอย่าง';

  @override
  String commonErrorDetail(String message) {
    return 'เกิดข้อผิดพลาด: $message';
  }

  @override
  String get commonOn => 'เปิด';

  @override
  String get commonOff => 'ปิด';

  @override
  String get commonRename => 'เปลี่ยนชื่อ';

  @override
  String get commonShare => 'แชร์';

  @override
  String get commonNotAvailable => 'ไม่พร้อมใช้งาน';

  @override
  String get commonTestFootage => 'ภาพทดสอบ';

  @override
  String get zoneVeryClose => 'ใกล้มาก';

  @override
  String get zoneClose => 'ใกล้';

  @override
  String get zoneMedium => 'ปานกลาง';

  @override
  String get zoneFar => 'ไกล';

  @override
  String get zoneUnknown => 'ไม่ทราบ';

  @override
  String get classPerson => 'คน';

  @override
  String get classBicycle => 'จักรยาน';

  @override
  String get classMotorcycle => 'มอเตอร์ไซค์';

  @override
  String get classCar => 'ยานพาหนะ';

  @override
  String get classBus => 'รถบัส';

  @override
  String get classTrafficLight => 'สัญญาณไฟจราจร';

  @override
  String get classStopSign => 'ป้ายหยุด';

  @override
  String get viewDetection => 'ตรวจจับ';

  @override
  String get viewVirtual => 'เสมือน';

  @override
  String get viewMap => 'แผนที่';

  @override
  String get viewParking => 'จอดรถ';

  @override
  String get viewPerception => 'การรับรู้';

  @override
  String get unitKmh => 'กม./ชม.';

  @override
  String get unitMph => 'ไมล์/ชม.';

  @override
  String get lightRed => 'แดง';

  @override
  String get lightYellow => 'เหลือง';

  @override
  String get lightGreen => 'เขียว';

  @override
  String get lightUnknown => 'ไม่ทราบ';

  @override
  String get clipsTitle => 'คลิป';

  @override
  String get clipsSelect => 'เลือก';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เลือกแล้ว $count รายการ',
      zero: 'เลือกคลิป',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'เลือกทั้งหมด';

  @override
  String get clipsDeselectAll => 'ยกเลิกการเลือกทั้งหมด';

  @override
  String get clipsDeleteSelected => 'ลบที่เลือก';

  @override
  String get clipsGridView => 'มุมมองตาราง';

  @override
  String get clipsListView => 'มุมมองรายการ';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบ $count คลิปหรือไม่',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'วิดีโอจะถูกลบออกจาก iPhone ของคุณถาวร และไม่สามารถย้อนกลับได้',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบ $count คลิปแล้ว',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'ยังไม่มีคลิป';

  @override
  String get clipsEmptyBody =>
      'ขณะขับรถ Corvista จะเก็บบัฟเฟอร์ช่วงสั้นๆ ไว้ต่อเนื่อง แตะบันทึกเหตุการณ์เพื่อเก็บภาพช่วงวินาทีล่าสุดไว้ที่นี่';

  @override
  String get clipsLoadError => 'ไม่สามารถโหลดคลิปของคุณได้';

  @override
  String get clipsStorageTitle => 'พื้นที่จัดเก็บ';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'คลิป $clips · บัฟเฟอร์ $buffer · ว่าง $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'บันทึกไว้ $count คลิป',
      zero: 'ไม่มีคลิปที่บันทึก',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'พื้นที่จัดเก็บบน iPhone เหลือน้อย เหตุการณ์ใหม่อาจบันทึกไม่สำเร็จ';

  @override
  String get clipsMissingFile => 'ไม่พบไฟล์';

  @override
  String get clipsEmergencyBadge => 'การชน';

  @override
  String clipsUntitled(String date) {
    return 'เหตุการณ์ · $date';
  }

  @override
  String get clipsAudio => 'บันทึกเสียงแล้ว';

  @override
  String get clipsFavorite => 'รายการโปรด';

  @override
  String get clipsUnfavorite => 'นำออกจากรายการโปรด';

  @override
  String get clipsLocation => 'บันทึกตำแหน่งแล้ว';

  @override
  String clipsOpenClip(String title) {
    return 'เปิดคลิป $title';
  }

  @override
  String get playerNotFoundTitle => 'ไม่พบคลิป';

  @override
  String get playerNotFoundBody => 'คลิปนี้อาจถูกลบไปแล้ว';

  @override
  String get playerMissingTitle => 'ไม่พบไฟล์วิดีโอ';

  @override
  String get playerMissingBody =>
      'การบันทึกของคลิปนี้ไม่อยู่ใน iPhone ของคุณแล้ว คุณสามารถลบรายการนี้ออกจากแกลเลอรีได้';

  @override
  String get playerRemoveEntry => 'ลบรายการ';

  @override
  String get playerLoadError => 'ไม่สามารถเล่นวิดีโอนี้ได้';

  @override
  String get playerPlay => 'เล่น';

  @override
  String get playerPause => 'หยุดชั่วคราว';

  @override
  String get playerReplay => 'เล่นซ้ำ';

  @override
  String get playerRenameTitle => 'เปลี่ยนชื่อคลิป';

  @override
  String get playerRenameHint => 'ชื่อคลิป';

  @override
  String get playerRenamed => 'เปลี่ยนชื่อคลิปแล้ว';

  @override
  String get playerFavorited => 'เพิ่มในรายการโปรดแล้ว';

  @override
  String get playerUnfavorited => 'นำออกจากรายการโปรดแล้ว';

  @override
  String get playerShareFailed => 'ไม่สามารถแชร์คลิปนี้ได้';

  @override
  String get playerDetails => 'รายละเอียด';

  @override
  String get playerDate => 'บันทึกเมื่อ';

  @override
  String get playerDuration => 'ความยาว';

  @override
  String get playerResolution => 'ความละเอียด';

  @override
  String get playerSize => 'ขนาดไฟล์';

  @override
  String get playerAudio => 'เสียง';

  @override
  String get playerAudioYes => 'บันทึกแล้ว';

  @override
  String get playerAudioNo => 'ไม่ได้บันทึก';

  @override
  String get playerReason => 'บันทึกโดย';

  @override
  String get playerReasonManual => 'ปุ่มบันทึกเหตุการณ์';

  @override
  String get playerReasonEmergency => 'ตรวจพบการชนที่อาจเกิดขึ้น';

  @override
  String get playerReasonRecovered => 'กู้คืนหลังการหยุดชะงัก';

  @override
  String get playerSpeed => 'ความเร็ว GPS ขณะบันทึก';

  @override
  String get playerLocation => 'ตำแหน่ง';

  @override
  String get playerOpenInMaps => 'เปิดในแผนที่';

  @override
  String get playerBack => 'กลับ';

  @override
  String get playerMore => 'การดำเนินการเพิ่มเติม';

  @override
  String get clipsFilterLabel => 'แสดง';

  @override
  String get clipsFilterAll => 'ทั้งหมด';

  @override
  String get clipsFilterRecordings => 'การบันทึก';

  @override
  String get clipsFilterIncidents => 'เหตุการณ์';

  @override
  String get clipsFilterEmergency => 'ฉุกเฉิน';

  @override
  String get clipsFilterFavorites => 'รายการโปรด';

  @override
  String get clipsSort => 'เรียงลำดับ';

  @override
  String get clipsSortNewest => 'ใหม่สุดก่อน';

  @override
  String get clipsSortOldest => 'เก่าสุดก่อน';

  @override
  String get clipsSortLongest => 'ยาวสุดก่อน';

  @override
  String get clipsSortLargest => 'ใหญ่สุดก่อน';

  @override
  String get clipsToday => 'วันนี้';

  @override
  String get clipsYesterday => 'เมื่อวาน';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คลิป',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'ยังไม่มีคลิปในหมวดนี้';

  @override
  String get clipsFavoritesEmpty =>
      'ติดดาวคลิปเพื่อเก็บไว้ที่นี่และเข้าถึงได้อย่างรวดเร็ว';

  @override
  String get clipsKindRecording => 'การบันทึก';

  @override
  String get clipsKindIncident => 'เหตุการณ์';

  @override
  String get clipsKindEmergency => 'ฉุกเฉิน';

  @override
  String get clipsKindTest => 'ทดสอบ';

  @override
  String clipsTripChip(String time) {
    return 'ทริป · $time';
  }

  @override
  String get clipsOpenTrip => 'เปิดทริปที่บันทึกคลิปนี้';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return 'ใช้ไป $used · ว่าง $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'คลิปใช้พื้นที่ $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'บันทึก $count รายการ',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เหตุการณ์ $count รายการ',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เหตุฉุกเฉิน $count รายการ',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'เพิ่มพื้นที่ว่าง';

  @override
  String get clipsStorageLowGentle =>
      'เหลือพื้นที่ว่างน้อยกว่า 2 GB เพื่อให้บันทึกได้ต่อเนื่อง โปรดเพิ่มพื้นที่ว่างหรือลบคลิปที่ไม่ต้องการแล้ว';

  @override
  String get clipsSaveToPhotos => 'บันทึกลงรูปภาพ';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คลิป',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบ $count คลิป ($size) หรือไม่',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'กำลังบันทึก $done จาก $total ลงรูปภาพ…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'บันทึก $count คลิปลงรูปภาพแล้ว',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return 'บันทึกลงรูปภาพแล้ว $saved · บันทึกไม่ได้ $failed';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista ไม่ได้รับอนุญาตให้เพิ่มวิดีโอลงในรูปภาพ คุณสามารถอนุญาตได้ในการตั้งค่า';

  @override
  String get clipsPhotosFailed => 'บันทึกลงรูปภาพไม่ได้';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เพิ่ม $count คลิปในรายการโปรดแล้ว',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'นำ $count คลิปออกจากรายการโปรดแล้ว',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (ตัดต่อ)';
  }

  @override
  String get playerTrim => 'ตัด';

  @override
  String get playerInfo => 'ข้อมูล';

  @override
  String get playerKind => 'ประเภท';

  @override
  String get playerReasonRecording => 'ปุ่มบันทึก';

  @override
  String get trimTitle => 'ตัดคลิป';

  @override
  String get trimHint =>
      'ลากที่จับเพื่อเลือกช่วงที่ต้องการเก็บ คลิปต้นฉบับจะไม่เปลี่ยนแปลง';

  @override
  String get trimStartHandle => 'จุดเริ่มต้นการตัด';

  @override
  String get trimEndHandle => 'จุดสิ้นสุดการตัด';

  @override
  String trimSelection(String duration) {
    return 'เลือกไว้ $duration';
  }

  @override
  String get trimSave => 'บันทึกเป็นคลิปใหม่';

  @override
  String get trimSaving => 'กำลังบันทึกคลิปที่ตัด…';

  @override
  String get trimSaved => 'บันทึกคลิปที่ตัดแล้ว';

  @override
  String get trimOpenNew => 'เปิด';

  @override
  String get trimFailed => 'ตัดคลิปนี้ไม่ได้';

  @override
  String get trimStorageFull => 'พื้นที่ว่างไม่พอสำหรับบันทึกคลิปที่ตัด';

  @override
  String get trimPreview => 'เล่นช่วงที่เลือก';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get settingsSectionCamera => 'กล้อง';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'การแจ้งเตือน';

  @override
  String get settingsSectionAlertCategories => 'ประเภทการแจ้งเตือน';

  @override
  String get settingsSectionRecording => 'การบันทึก';

  @override
  String get settingsSectionDriving => 'การขับขี่';

  @override
  String get settingsSectionPower => 'พลังงาน';

  @override
  String get settingsSectionEmergency => 'เหตุฉุกเฉิน';

  @override
  String get settingsSectionAppearance => 'รูปลักษณ์';

  @override
  String get settingsSectionLanguage => 'ภาษา';

  @override
  String get settingsSectionInformation => 'ข้อมูล';

  @override
  String get settingsCameraLens => 'เลนส์กล้อง';

  @override
  String get settingsLensWide => 'มุมกว้าง';

  @override
  String get settingsLensUltraWide => 'อัลตร้าไวด์';

  @override
  String get settingsLensTelephoto => 'เทเลโฟโต้';

  @override
  String get settingsLensUnavailable => 'ไม่มีใน iPhone เครื่องนี้';

  @override
  String get settingsStabilization => 'ระบบกันสั่น';

  @override
  String get settingsStabAuto => 'อัตโนมัติ';

  @override
  String get settingsStabOff => 'ปิด';

  @override
  String get settingsStabStandard => 'มาตรฐาน';

  @override
  String get settingsStabCinematic => 'ภาพยนตร์';

  @override
  String get settingsOverlayOpacity => 'ความโปร่งใสของภาพซ้อน';

  @override
  String get settingsShowFps => 'แสดงสถิติประสิทธิภาพ';

  @override
  String get settingsShowFpsSubtitle =>
      'อัตราเฟรมและเวลาประมวลผลในมุมมองตรวจจับ';

  @override
  String get settingsCameraFooter =>
      'การเปลี่ยนเลนส์และระบบกันสั่นจะมีผลเมื่อเริ่มกล้องครั้งถัดไป';

  @override
  String get settingsAiModel => 'โมเดล AI';

  @override
  String get settingsConfidence => 'ความเชื่อมั่นในการตรวจจับ';

  @override
  String get settingsTracking => 'การติดตามวัตถุ';

  @override
  String get settingsTrackingSubtitle => 'ช่วยให้วัตถุเสถียรระหว่างเฟรม';

  @override
  String get settingsShowLabels => 'แสดงป้ายชื่อ';

  @override
  String get settingsShowConfidence => 'แสดงความเชื่อมั่น';

  @override
  String get settingsSegmentationOpacity => 'ความโปร่งใสของมาสก์การรับรู้';

  @override
  String get settingsAiFooter =>
      'ค่าความเชื่อมั่นที่ต่ำลงจะแสดงวัตถุมากขึ้น แต่การตรวจจับผิดพลาดก็มากขึ้นด้วย การตรวจจับอาจไม่แม่นยำ';

  @override
  String get settingsVoiceAlerts => 'การแจ้งเตือนด้วยเสียง';

  @override
  String get settingsVoiceLanguage => 'ภาษาของเสียง';

  @override
  String get settingsVoiceLanguageAuto => 'ตามภาษาของแอป';

  @override
  String get settingsVoice => 'เสียง';

  @override
  String get settingsVoiceDefault => 'ค่าเริ่มต้นของระบบ';

  @override
  String get settingsVoiceQualityEnhanced => 'ปรับปรุงแล้ว';

  @override
  String get settingsVoiceQualityPremium => 'คุณภาพสูง';

  @override
  String get settingsNoVoices =>
      'ยังไม่ได้ติดตั้งเสียงสำหรับภาษานี้ เพิ่มได้ที่การตั้งค่า iOS › การช่วยการเข้าถึง › เนื้อหาที่พูดได้';

  @override
  String get settingsAlertPedestrian => 'คนเดินเท้า';

  @override
  String get settingsAlertCyclist => 'นักปั่นจักรยาน';

  @override
  String get settingsAlertMotorcycle => 'มอเตอร์ไซค์';

  @override
  String get settingsAlertBus => 'รถบัส';

  @override
  String get settingsAlertVehicleClose => 'ยานพาหนะอยู่ใกล้มากด้านหน้า';

  @override
  String get settingsAlertTrafficLight => 'สัญญาณไฟจราจรเปลี่ยน';

  @override
  String get settingsAlertTrafficMoving => 'การจราจรข้างหน้าเริ่มเคลื่อนตัว';

  @override
  String get settingsAlertStopSign => 'ป้ายหยุด';

  @override
  String get settingsSensitivity => 'ความไว';

  @override
  String get settingsSensitivityLow => 'ต่ำ';

  @override
  String get settingsSensitivityMedium => 'ปานกลาง';

  @override
  String get settingsSensitivityHigh => 'สูง';

  @override
  String get settingsCooldown => 'ช่วงเวลาแจ้งซ้ำ';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds วิ';
  }

  @override
  String get settingsVolume => 'ระดับเสียงแจ้งเตือน';

  @override
  String get settingsQuietMode => 'โหมดเงียบ';

  @override
  String get settingsQuietModeSubtitle => 'พูดเฉพาะการแจ้งเตือนที่สำคัญที่สุด';

  @override
  String get settingsTestVoice => 'ทดสอบเสียง';

  @override
  String get settingsTestVoiceDone => 'กำลังเล่นตัวอย่างการแจ้งเตือน…';

  @override
  String get settingsParkingBeeps => 'เสียงบี๊บขณะจอดรถ';

  @override
  String get settingsBeepVolume => 'ระดับเสียงบี๊บ';

  @override
  String get settingsAlertsFooter =>
      'การแจ้งเตือนเป็นเพียงตัวช่วยเท่านั้น โปรดมองถนนอยู่เสมอ การไม่มีเสียงเตือนไม่ได้หมายความว่าทางโล่ง';

  @override
  String get settingsRecordingProfile => 'คุณภาพการบันทึก';

  @override
  String get settingsProfileStandard => 'มาตรฐาน · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'บัฟเฟอร์เหตุการณ์';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds วินาที';
  }

  @override
  String get settingsManualMaxLength => 'ความยาวสูงสุดของการบันทึกเอง';

  @override
  String get settingsManualMaxUnlimited => 'ไม่จำกัด';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes นาที';
  }

  @override
  String get settingsRecordAudio => 'บันทึกเสียง';

  @override
  String get settingsRecordAudioSubtitle =>
      'รวมเสียงในรถไว้ในเหตุการณ์ที่บันทึก';

  @override
  String get settingsMicDenied =>
      'การเข้าถึงไมโครโฟนปิดอยู่ อนุญาตได้ในการตั้งค่าเพื่อบันทึกเสียง';

  @override
  String get settingsWatermark => 'ลายน้ำ Corvista';

  @override
  String get settingsTimestamp => 'ประทับวันที่และเวลา';

  @override
  String get settingsSaveLocation => 'บันทึกตำแหน่งพร้อมคลิป';

  @override
  String get settingsStorage => 'พื้นที่จัดเก็บและคลิป';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คลิป',
      zero: 'ไม่มีคลิป',
    );
    return '$_temp0 · ใช้ไป $used · ว่าง $free';
  }

  @override
  String get settingsRecordingFooter =>
      'บัฟเฟอร์ต่อเนื่องจะอยู่บน iPhone ของคุณและถูกเขียนทับตลอดเวลา ไม่มีการบันทึกในเบื้องหลัง';

  @override
  String get settingsDefaultView => 'มุมมองเริ่มต้น';

  @override
  String get settingsUnits => 'หน่วย';

  @override
  String get settingsShowCompass => 'แสดงเข็มทิศ';

  @override
  String get settingsHudStyle => 'รูปแบบ HUD';

  @override
  String get settingsHudCustomize => 'ปรับแต่ง HUD';

  @override
  String get settingsDrivingSide => 'ฝั่งการขับขี่';

  @override
  String get settingsDrivingSideAuto => 'อัตโนมัติ';

  @override
  String get settingsDrivingSideRight => 'ขวา';

  @override
  String get settingsDrivingSideLeft => 'ซ้าย';

  @override
  String get settingsVirtualStyle => 'รูปแบบมุมมองเสมือน';

  @override
  String get settingsVirtualMinimal => 'เรียบง่าย';

  @override
  String get settingsVirtualPerspective => 'เปอร์สเปคทีฟ';

  @override
  String get settingsVirtualHighContrast => 'คอนทราสต์สูง';

  @override
  String get settingsKeepScreenOn => 'เปิดหน้าจอค้างไว้ขณะขับรถ';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'แสดงเส้นทางนำทางทีละช่วงบนหน้าจอล็อกและใน Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'หยุดบันทึกชั่วคราวขณะ Corvista อยู่เบื้องหลัง';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'หยุดชั่วคราว';

  @override
  String get liveActivityDashcamOff => 'กล้องปิด';

  @override
  String get liveActivityEnded => 'สิ้นสุดการนำทาง';

  @override
  String get liveActivityEta => 'ถึงเวลา';

  @override
  String get settingsAutoRecenter => 'จัดแผนที่กลับกึ่งกลางอัตโนมัติ';

  @override
  String get settingsHudStyleClassic => 'คลาสสิก';

  @override
  String get settingsHudStyleGrid => 'กริด';

  @override
  String get settingsHudStyleMinimal => 'เรียบง่าย';

  @override
  String get settingsHudStylePerformance => 'สมรรถนะ';

  @override
  String get settingsHudStyleNavigation => 'นำทาง';

  @override
  String get settingsHudStyleNight => 'กลางคืน';

  @override
  String get settingsHudStyleHighContrast => 'คอนทราสต์สูง';

  @override
  String get settingsPowerMode => 'โหมดพลังงาน';

  @override
  String get settingsPowerBalanced => 'สมดุล';

  @override
  String get settingsPowerPerformance => 'สมรรถนะ';

  @override
  String get settingsPowerSaver => 'ประหยัดพลังงาน';

  @override
  String get settingsPowerFooter =>
      'Corvista จะลดอัตราการทำงานของ AI และเอฟเฟกต์ภาพโดยอัตโนมัติเมื่อ iPhone ร้อนหรือแบตเตอรี่เหลือน้อย';

  @override
  String get settingsThermal => 'สถานะความร้อน';

  @override
  String get settingsThermalNominal => 'ปกติ';

  @override
  String get settingsThermalFair => 'อุ่น';

  @override
  String get settingsThermalSerious => 'ร้อน';

  @override
  String get settingsThermalCritical => 'วิกฤต';

  @override
  String get settingsBattery => 'แบตเตอรี่';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · กำลังชาร์จ';
  }

  @override
  String get settingsLowPowerMode =>
      'โหมดพลังงานต่ำเปิดอยู่ — AI ทำงานด้วยอัตราที่ลดลง';

  @override
  String get settingsAiRate => 'อัตราการทำงานของ AI ปัจจุบัน';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'การตรวจจับการชน';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'เปิด · นับถอยหลัง $seconds วินาที';
  }

  @override
  String get settingsEmergencyFooter =>
      'ฟีเจอร์ทดลอง ไม่สามารถใช้แทนบริการฉุกเฉินได้';

  @override
  String get settingsTheme => 'ธีม';

  @override
  String get settingsThemeSystem => 'ตามระบบ';

  @override
  String get settingsThemeDark => 'มืด';

  @override
  String get settingsThemeLight => 'สว่าง';

  @override
  String get settingsReduceMotion => 'ลดการเคลื่อนไหว';

  @override
  String get settingsReduceMotionSubtitle => 'ลดแอนิเมชันทั่วทั้งแอป';

  @override
  String get settingsAppLanguage => 'ภาษาของแอป';

  @override
  String get settingsPrivacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get settingsTerms => 'ข้อกำหนดการใช้งาน';

  @override
  String get settingsHelp => 'ความช่วยเหลือ';

  @override
  String get settingsSupport => 'ติดต่อฝ่ายสนับสนุน';

  @override
  String get settingsLicenses => 'ใบอนุญาตโอเพนซอร์ส';

  @override
  String get settingsSupportUnavailable =>
      'ไม่สามารถเปิดแอปเมลได้ โปรดเขียนถึง support@corvista.app';

  @override
  String get settingsSafety => 'ข้อมูลด้านความปลอดภัย';

  @override
  String get settingsDiagnostics => 'การวินิจฉัย';

  @override
  String get settingsVersion => 'เวอร์ชัน';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'ปรับแต่ง HUD';

  @override
  String get hudCustomPreview => 'ตัวอย่าง · ค่าตัวอย่าง';

  @override
  String get hudCustomStyle => 'รูปแบบ';

  @override
  String get hudCustomElements => 'องค์ประกอบ';

  @override
  String get hudCustomSpeed => 'ความเร็ว';

  @override
  String get hudCustomHeading => 'ทิศทางและเข็มทิศ';

  @override
  String get hudCustomClock => 'นาฬิกา';

  @override
  String get hudCustomBattery => 'แบตเตอรี่และความร้อน';

  @override
  String get hudCustomDetections => 'สถานะ AI และการตรวจจับ';

  @override
  String get hudCustomWeather => 'สภาพอากาศ';

  @override
  String get hudCustomAppearance => 'ขนาดและความโปร่งใส';

  @override
  String get hudCustomSize => 'ขนาด';

  @override
  String get hudCustomOpacity => 'ความโปร่งใส';

  @override
  String get hudCustomFooter =>
      'คำเตือน เช่น ความร้อนสูงเกินไป จะแสดงเสมอ แม้ซ่อนองค์ประกอบอื่นอยู่';

  @override
  String get hudCustomDescClassic => 'หน้าปัดแบบสมดุล';

  @override
  String get hudCustomDescGrid => 'กริดเปอร์สเปคทีฟบนถนน';

  @override
  String get hudCustomDescMinimal => 'แสดงเฉพาะความเร็ว';

  @override
  String get hudCustomDescPerformance => 'ส่วนโค้งความเร็วพร้อมค่าแบบเรียลไทม์';

  @override
  String get hudCustomDescNavigation => 'แสดงการเลี้ยวถัดไปก่อน';

  @override
  String get hudCustomDescNight => 'สลัวและโทนแดงสำหรับขับรถตอนกลางคืน';

  @override
  String get hudCustomDescHighContrast => 'อ่านง่ายที่สุดในแสงแดดจ้า';

  @override
  String get languageTitle => 'ภาษา';

  @override
  String get languageSystem => 'ค่าเริ่มต้นของระบบ';

  @override
  String get languageSystemSubtitle => 'ตามภาษาของ iPhone';

  @override
  String get languageFooter =>
      'จะมีภาษาเพิ่มเติมในอนาคต ภาษาของเสียงแจ้งเตือนตั้งค่าแยกได้ในส่วนการแจ้งเตือน';

  @override
  String get diagTitle => 'การวินิจฉัย';

  @override
  String get diagPerformance => 'ประสิทธิภาพ';

  @override
  String get diagInference => 'เวลาประมวลผล';

  @override
  String get diagDetectHz => 'อัตราการตรวจจับ';

  @override
  String get diagCameraFps => 'อัตราเฟรมของกล้อง';

  @override
  String get diagMemory => 'หน่วยความจำ';

  @override
  String get diagDropped => 'เฟรมที่ตกหล่น';

  @override
  String get diagSegmentation => 'เวลาการแบ่งส่วน';

  @override
  String get diagCamera => 'กล้อง';

  @override
  String get diagStatus => 'สถานะ';

  @override
  String get diagSource => 'แหล่งที่มา';

  @override
  String get diagSourceCamera => 'กล้องสด';

  @override
  String get diagSourceFile => 'ไฟล์ภาพทดสอบ';

  @override
  String get diagResolution => 'ขนาดบัฟเฟอร์';

  @override
  String get diagLens => 'เลนส์';

  @override
  String get diagError => 'ข้อผิดพลาดล่าสุด';

  @override
  String get diagModel => 'โมเดล AI';

  @override
  String get diagModelLoad => 'เวลาโหลดโมเดล';

  @override
  String get diagPower => 'พลังงาน';

  @override
  String get diagSegHz => 'อัตราการแบ่งส่วน';

  @override
  String get diagReduced => 'ลดเอฟเฟกต์';

  @override
  String diagMs(String value) {
    return '$value มิลลิวินาที';
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
  String get diagCamIdle => 'ว่าง';

  @override
  String get diagCamStarting => 'กำลังเริ่ม';

  @override
  String get diagCamRunning => 'กำลังทำงาน';

  @override
  String get diagCamInterrupted => 'ถูกขัดจังหวะ';

  @override
  String get diagCamStopped => 'หยุดแล้ว';

  @override
  String get diagCamUnavailable => 'ไม่พร้อมใช้งาน';

  @override
  String get diagCamPermissionDenied => 'ไม่ได้รับอนุญาต';

  @override
  String get diagCamError => 'ข้อผิดพลาด';

  @override
  String get diagTestFootage => 'ภาพทดสอบ';

  @override
  String get diagTestFootageBody =>
      'ทดสอบการตรวจจับจริงบนอุปกรณ์จากไฟล์วิดีโอในเครื่องแทนการใช้กล้อง ทุกมุมมองจะแสดงป้ายภาพทดสอบ';

  @override
  String get diagPathLabel => 'ที่อยู่ไฟล์วิดีโอ';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'ใช้ Documents/test_drive.mp4';

  @override
  String get diagRun => 'เริ่มภาพทดสอบ';

  @override
  String get diagRunStarted => 'เริ่มภาพทดสอบแล้ว เปิดมุมมองการขับขี่เพื่อดู';

  @override
  String get diagBackToCamera => 'กลับไปใช้กล้องสด';

  @override
  String get diagDebugOnly => 'ภาพทดสอบใช้ได้เฉพาะในบิลด์สำหรับนักพัฒนา';

  @override
  String get diagFileMissing => 'ไม่พบไฟล์ที่ที่อยู่นี้';

  @override
  String get emergencySetupTitle => 'การตรวจจับการชน';

  @override
  String get emergencyExperimental => 'ทดลอง';

  @override
  String get emergencyIntro =>
      'ระหว่างขับรถ Corvista สามารถเฝ้าระวังการชนรุนแรงที่อาจเกิดขึ้นโดยใช้เซนเซอร์การเคลื่อนไหวของ iPhone หากตรวจพบ จะเริ่มนับถอยหลัง หากคุณไม่ยกเลิก Corvista จะเสนอให้โทรหาบริการฉุกเฉินและส่งข้อความถึงผู้ติดต่อของคุณ';

  @override
  String get emergencyDisclaimer1 =>
      'ไม่สามารถใช้แทนบริการฉุกเฉินหรือระบบตรวจจับการชนของรถคุณได้';

  @override
  String get emergencyDisclaimer2 =>
      'iOS จะขอให้คุณยืนยันเสมอก่อนโทรออกหรือส่งข้อความ';

  @override
  String get emergencyDisclaimer3 =>
      'อาจตรวจไม่พบการชนบางครั้ง และการเบรกกะทันหันหรือการกระแทกอาจถูกเข้าใจผิดว่าเป็นการชน';

  @override
  String get emergencyParkedWarning =>
      'ตั้งค่าให้เสร็จขณะจอดรถ การตั้งค่าจะถูกล็อกเมื่อรถกำลังเคลื่อนที่';

  @override
  String get emergencyEnable => 'เปิดใช้การตรวจจับการชน';

  @override
  String get emergencyEnableSubtitle => 'ทำงานเฉพาะระหว่างการขับขี่';

  @override
  String get emergencyNeedNumber => 'โปรดเพิ่มหมายเลขฉุกเฉินก่อน';

  @override
  String get emergencyContacts => 'ผู้ติดต่อฉุกเฉิน';

  @override
  String get emergencyAddContact => 'เพิ่มผู้ติดต่อ';

  @override
  String get emergencyNoContacts =>
      'ยังไม่มีผู้ติดต่อ ผู้ติดต่อจะได้รับข้อความก็ต่อเมื่อคุณยืนยันแล้วเท่านั้น';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'ลบ $name หรือไม่';
  }

  @override
  String get emergencyRemoveContactBody =>
      'บุคคลนี้จะไม่ถูกเสนอเป็นผู้รับหลังเกิดการชน';

  @override
  String get emergencyRemove => 'ลบ';

  @override
  String get emergencyContactsError => 'ไม่สามารถโหลดผู้ติดต่อได้';

  @override
  String get emergencyNumber => 'หมายเลขฉุกเฉิน';

  @override
  String get emergencyNumberHint => 'เช่น 191 หรือ 1669';

  @override
  String get emergencyMessage => 'แม่แบบข้อความ';

  @override
  String get emergencyMessageDefault =>
      'ฉันอาจประสบอุบัติเหตุทางรถยนต์ ข้อความนี้เตรียมโดย Corvista และรวมตำแหน่งล่าสุดของฉันหากมี';

  @override
  String get emergencyMessageHint => 'เว้นว่างไว้เพื่อใช้ข้อความเริ่มต้น';

  @override
  String get emergencyCountdown => 'ระยะเวลานับถอยหลัง';

  @override
  String get emergencyVoiceCancel => 'ยกเลิกด้วยเสียง';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'พูดว่า “ฉันโอเค” หรือ “ยกเลิก” ระหว่างนับถอยหลัง ใช้การรู้จำเสียงพูดบนอุปกรณ์เมื่อรองรับ';

  @override
  String get emergencyVoicePermDenied =>
      'ต้องเปิดการเข้าถึงไมโครโฟนและการรู้จำเสียงพูดเพื่อยกเลิกด้วยเสียง';

  @override
  String get emergencyAutoSave => 'บันทึกคลิปเหตุการณ์อัตโนมัติ';

  @override
  String get emergencyTest => 'ทดสอบการนับถอยหลัง (ไม่โทรออก)';

  @override
  String get emergencyTestBody =>
      'จำลองการชนเพื่อให้คุณเห็นการนับถอยหลัง ในโหมดทดสอบจะไม่มีการโทรหรือส่งข้อความเกิดขึ้น';

  @override
  String get emergencyNotSet => 'ยังไม่ตั้งค่า';

  @override
  String get emergencyAlertHeadline => 'ตรวจพบการชนรุนแรงที่อาจเกิดขึ้น';

  @override
  String get emergencyAlertSubtitle => 'คุณปลอดภัยดีไหม';

  @override
  String get emergencyAlertCancel => 'ฉันโอเค — ยกเลิก';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'เหลืออีก $seconds วินาที',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'กำลังฟัง — พูดว่า “ฉันโอเค” เพื่อยกเลิก';

  @override
  String emergencyAlertHeard(String text) {
    return 'ได้ยินว่า: “$text”';
  }

  @override
  String get emergencyAlertEscalated =>
      'ไม่มีการตอบกลับ เลือกสิ่งที่ต้องการทำ:';

  @override
  String get emergencyAlertCall => 'โทรหาบริการฉุกเฉิน';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'โทรไปที่ $number iOS จะขอให้คุณยืนยัน';
  }

  @override
  String get emergencyAlertMessage => 'ส่งข้อความถึงผู้ติดต่อ';

  @override
  String get emergencyAlertMessageSubtitle =>
      'เปิดข้อความที่เตรียมไว้ คุณเป็นผู้เลือกว่าจะส่งหรือไม่';

  @override
  String get emergencyAlertTestMode => 'โหมดทดสอบ — จะไม่มีการโทรออก';

  @override
  String get emergencyAlertTestBadge => 'ทดสอบ';

  @override
  String get emergencyAlertClose => 'ฉันโอเค — ปิด';

  @override
  String get emergencyMsgSent => 'ส่งข้อความแล้ว';

  @override
  String get emergencyMsgCancelled => 'ไม่ได้ส่งข้อความ';

  @override
  String get emergencyMsgFailed => 'ไม่สามารถส่งข้อความได้';

  @override
  String get emergencyMsgUnavailable => 'อุปกรณ์นี้ไม่รองรับการส่งข้อความ';

  @override
  String emergencyCallFailed(String number) {
    return 'ไม่สามารถเริ่มการโทรได้ โปรดโทรไปที่ $number ด้วยตนเอง';
  }

  @override
  String get modelsTitle => 'โมเดล AI';

  @override
  String get modelsIntro =>
      'โมเดลทั้งหมดรวมอยู่ในแอปและทำงานบน iPhone ของคุณทั้งหมด ภาพจากกล้องจะไม่ออกจากอุปกรณ์';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'สด: $ms มิลลิวินาทีต่อเฟรม · ตรวจจับ $hz ครั้ง/วินาที';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'โหลดใน $ms มิลลิวินาที';
  }

  @override
  String get modelsEfficientName => 'ประหยัด';

  @override
  String get modelsEfficientDesc =>
      'ตัวตรวจจับขนาดกะทัดรัดที่ทำงานเร็ว เหมาะกับการขับทางไกล ร้อนน้อยและใช้แบตเตอรี่น้อย';

  @override
  String get modelsEnhancedName => 'ขั้นสูง';

  @override
  String get modelsEnhancedDesc =>
      'ตัวตรวจจับขนาดใหญ่ขึ้นที่พบวัตถุเล็กและอยู่ไกลกว่าได้ แต่ใช้พลังงานมากกว่า';

  @override
  String get modelsSegmentationName => 'การแบ่งส่วน';

  @override
  String get modelsSegmentationDesc =>
      'ผสานการตรวจจับที่รวดเร็วเข้ากับมาสก์พื้นผิวถนนและวัตถุสำหรับมุมมองการรับรู้';

  @override
  String get modelsNoneName => 'AI หยุดชั่วคราว';

  @override
  String get modelsNoneDesc =>
      'กล้องและการบันทึกยังทำงานต่อโดยไม่มีการตรวจจับวัตถุ ใช้พลังงานน้อยที่สุด';

  @override
  String get modelsGenericDesc => 'โมเดลตรวจจับวัตถุบนอุปกรณ์';

  @override
  String get modelsFunctionDetection =>
      'ตรวจจับยานพาหนะ คน จักรยาน มอเตอร์ไซค์ รถบัส สัญญาณไฟจราจร และป้ายหยุด';

  @override
  String get modelsFunctionSegmentation => 'เพิ่มมาสก์พื้นผิวถนนและวัตถุ';

  @override
  String get modelsFunctionNone => 'ไม่มีการตรวจจับ บันทึกกล้องหน้ารถเท่านั้น';

  @override
  String get modelsSize => 'ขนาด';

  @override
  String get modelsInput => 'อินพุต';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'ใช้งานร่วมกับ';

  @override
  String get modelsStatusInstalled => 'ติดตั้งแล้ว (มาพร้อมแอป)';

  @override
  String get modelsStatusNotInstalled => 'ไม่ได้ติดตั้ง';

  @override
  String get modelsSelected => 'เลือกแล้ว';

  @override
  String get modelsUse => 'ใช้โมเดลนี้';

  @override
  String get modelsSwitching => 'กำลังโหลดโมเดล…';

  @override
  String modelsSwitched(String name) {
    return '$name ใช้งานอยู่แล้ว';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'วัดบนอุปกรณ์นี้: เฉลี่ย $ms มิลลิวินาที';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'ยังไม่ได้วัดบนอุปกรณ์นี้';

  @override
  String get modelsBenchmarkRun => 'เรียกใช้เบนช์มาร์ก';

  @override
  String get modelsBenchmarkRunning => 'กำลังทดสอบเบนช์มาร์ก…';

  @override
  String get modelsBenchmarkSelectHint => 'เลือกโมเดลนี้เพื่อทดสอบเบนช์มาร์ก';

  @override
  String get modelsBenchmarkDone => 'เบนช์มาร์กเสร็จสมบูรณ์';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'เบนช์มาร์กล้มเหลว: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'อัปเดตล่าสุด $date';
  }

  @override
  String get safetyTitle => 'ข้อมูลด้านความปลอดภัย';

  @override
  String get safetyIntro =>
      'Corvista เป็นตัวช่วยเสริมการรับรู้ขณะขับรถ ไม่ได้ควบคุมรถของคุณ และไม่สามารถแทนที่ความระมัดระวัง วิจารณญาณ หรือระบบความปลอดภัยของรถได้';

  @override
  String get safetyBeforeTitle => 'ก่อนออกเดินทาง';

  @override
  String get safetyBefore1 =>
      'ติดตั้ง iPhone ให้มั่นคงในตำแหน่งที่ถูกกฎหมาย และไม่บดบังทัศนวิสัย ถุงลมนิรภัย หรือปุ่มควบคุม';

  @override
  String get safetyBefore2 =>
      'ตั้งค่าให้เสร็จ เลือกมุมมอง และกำหนดจุดหมายปลายทางขณะจอดรถ';

  @override
  String get safetyBefore3 =>
      'เชื่อมต่อที่ชาร์จเมื่อเดินทางไกล และหลีกเลี่ยงการให้โทรศัพท์โดนแสงแดดโดยตรงเท่าที่ทำได้';

  @override
  String get safetyWhileTitle => 'ขณะขับรถ';

  @override
  String get safetyWhile1 =>
      'มองถนนอยู่เสมอ ใช้ปุ่มขนาดใหญ่บนหน้าจอเมื่อปลอดภัยและถูกกฎหมายเท่านั้น';

  @override
  String get safetyWhile2 =>
      'การแจ้งเตือนเป็นเพียงตัวช่วย ไม่ใช่คำเตือนที่ไว้วางใจได้ การไม่มีเสียงเตือนไม่ได้หมายความว่าถนนโล่ง';

  @override
  String get safetyWhile3 =>
      'ปฏิบัติตามกฎจราจร สัญญาณ และป้ายจราจรเสมอ ไม่ใช่ตามแอป หากขัดแย้งกัน';

  @override
  String get safetyLimitsTitle => 'ข้อจำกัด';

  @override
  String get safetyLimits1 =>
      'กล้องโทรศัพท์ตัวเดียวมองเห็นได้เฉพาะสิ่งที่อยู่ด้านหน้า วัตถุที่อยู่นอกมุมมอง ถูกบดบัง หรืออยู่ใกล้มากจะไม่ถูกตรวจจับ';

  @override
  String get safetyLimits2 =>
      'การตรวจจับอาจพลาด ล่าช้า หรือผิดพลาด โดยเฉพาะตอนกลางคืน ฝนตก หมอก แสงสะท้อน หรือเมื่อกระจกหน้าสกปรก';

  @override
  String get safetyLimits3 =>
      'รู้จำเฉพาะประเภทที่รองรับ ได้แก่ ยานพาหนะ รถบัส มอเตอร์ไซค์ จักรยาน คน สัญญาณไฟจราจร และป้ายหยุด เส้นแบ่งเลนในมุมมองเสมือนเป็นภาพประกอบ ไม่ใช่เลนที่ตรวจจับได้';

  @override
  String get safetyLimits4 =>
      'ความใกล้ชิดแสดงเป็นโซนโดยประมาณ (ใกล้มาก ใกล้ ปานกลาง ไกล) ไม่ใช่ระยะทางที่วัดได้ มุมมองจอดรถไม่สามารถใช้แทนเซนเซอร์ช่วยจอดได้';

  @override
  String get safetyHeatTitle => 'ความร้อนและแบตเตอรี่';

  @override
  String get safetyHeat1 =>
      'การใช้กล้องและ AI ต่อเนื่องทำให้ iPhone ร้อนขึ้น Corvista จะลดอัตราการวิเคราะห์เมื่ออุปกรณ์ร้อนและแสดงคำเตือน หาก iOS ร้อนเกินไป กล้องอาจหยุดทำงาน';

  @override
  String get safetyEmergencyTitle => 'ฟีเจอร์ฉุกเฉิน';

  @override
  String get safetyEmergency1 =>
      'การตรวจจับการชนที่อาจเกิดขึ้นเป็นฟีเจอร์ทดลอง อาจตรวจไม่พบการชนจริง และอาจถูกกระตุ้นโดยเหตุการณ์อื่น';

  @override
  String get safetyEmergency2 =>
      'ไม่เคยติดต่อใครโดยไม่แจ้งให้ทราบ iOS จะขอให้คุณยืนยันการโทรหรือการส่งข้อความเสมอ ไม่สามารถใช้แทนการโทรหาบริการฉุกเฉินด้วยตนเองได้';

  @override
  String get privacyTitle => 'ความเป็นส่วนตัว';

  @override
  String get privacyIntro =>
      'Corvista ออกแบบมาเพื่อเก็บข้อมูลการขับขี่ของคุณไว้บน iPhone ไม่มีบัญชี Corvista และ Corvista ไม่มีเซิร์ฟเวอร์ของตนเอง';

  @override
  String get privacyCameraTitle => 'กล้องและ AI';

  @override
  String get privacyCamera1 =>
      'การตรวจจับ การติดตาม และการแบ่งส่วนวัตถุทำงานบน iPhone ของคุณทั้งหมด เฟรมภาพจากกล้องจะไม่ถูกอัปโหลด';

  @override
  String get privacyCamera2 =>
      'กล้องทำงานเฉพาะขณะที่ Corvista เปิดอยู่บนหน้าจอ และจะหยุดเมื่อแอปไปอยู่เบื้องหลัง ไม่มีการบันทึกซ่อนในเบื้องหลัง';

  @override
  String get privacyRecordingsTitle => 'การบันทึก';

  @override
  String get privacyRecordings1 =>
      'บัฟเฟอร์ต่อเนื่องเป็นข้อมูลชั่วคราวและถูกเขียนทับตลอดเวลา ภาพจะถูกเก็บไว้เมื่อคุณแตะบันทึกเหตุการณ์ หรือหลังเกิดการชนที่อาจเกิดขึ้นหากคุณเปิดใช้ตัวเลือกนี้';

  @override
  String get privacyRecordings2 =>
      'คลิปที่บันทึกจะอยู่ในพื้นที่จัดเก็บส่วนตัวของ Corvista บน iPhone ของคุณ และจะออกจากอุปกรณ์ก็ต่อเมื่อคุณเลือกแชร์ การลบแอปจะลบคลิปด้วย';

  @override
  String get privacyRecordings3 =>
      'บันทึกเสียงเฉพาะเมื่อคุณเปิดใช้ และอนุญาตการเข้าถึงไมโครโฟน';

  @override
  String get privacyLocationTitle => 'ตำแหน่ง';

  @override
  String get privacyLocation1 =>
      'ใช้ตำแหน่งขณะเปิดแอปสำหรับความเร็ว แผนที่ เส้นทาง และสภาพอากาศ หากเปิด “บันทึกตำแหน่งพร้อมคลิป” ตำแหน่งขณะบันทึกจะถูกเก็บไว้กับคลิปบนอุปกรณ์ของคุณ';

  @override
  String get privacyNetworkTitle => 'บริการเครือข่าย';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — การแสดงแผนที่ การค้นหาสถานที่ และเส้นทาง ข้อความที่คุณค้นหาและตำแหน่งโดยประมาณจะถูกส่งไปยัง Apple';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — สภาพอากาศปัจจุบันและรายชั่วโมงสำหรับตำแหน่งของคุณ';

  @override
  String get privacyNetwork4 =>
      'Corvista ไม่มีโฆษณา และไม่มีการวิเคราะห์หรือการติดตามจากบุคคลที่สาม';

  @override
  String get privacyEmergencyTitle => 'ผู้ติดต่อฉุกเฉิน';

  @override
  String get privacyEmergency1 =>
      'ผู้ติดต่อที่คุณเลือกจะถูกเก็บไว้ใน iOS Keychain บนอุปกรณ์นี้ การยกเลิกด้วยเสียงใช้การรู้จำเสียงพูดบนอุปกรณ์เมื่อรองรับ การโทรและข้อความจะถูกส่งหลังจากที่คุณยืนยันใน iOS เท่านั้น';

  @override
  String get privacyControlsTitle => 'การควบคุมของคุณ';

  @override
  String get privacyControls1 =>
      'คุณลบคลิปได้ทุกเมื่อในส่วนคลิป และเปลี่ยนหรือเพิกถอนการเข้าถึงกล้อง ไมโครโฟน ตำแหน่ง และเสียงพูดได้ในการตั้งค่า iOS';

  @override
  String get termsTitle => 'ข้อกำหนดการใช้งาน';

  @override
  String get termsIntro =>
      'การใช้ Corvista ถือว่าคุณยอมรับข้อกำหนดเหล่านี้ ข้อตกลงใบอนุญาตผู้ใช้ปลายทางสำหรับแอปพลิเคชันที่ได้รับอนุญาตมาตรฐานของ Apple ก็มีผลบังคับใช้เช่นกัน';

  @override
  String get termsUseTitle => 'การใช้ Corvista';

  @override
  String get termsUse1 =>
      'Corvista เป็นตัวช่วยเสริมการรับรู้ขณะขับรถและกล้องหน้ารถ คุณยังคงต้องรับผิดชอบในการขับขี่อย่างปลอดภัยและถูกกฎหมายตลอดเวลา';

  @override
  String get termsUse2 =>
      'ห้ามใช้งานแอปในลักษณะที่ทำให้เสียสมาธิขณะขับรถ ติดตั้งอุปกรณ์ให้มั่นคงและถูกต้องตามกฎหมาย';

  @override
  String get termsAccuracyTitle => 'ไม่รับประกันความแม่นยำ';

  @override
  String get termsAccuracy1 =>
      'การตรวจจับ โซน การแจ้งเตือน เครื่องหมายบนแผนที่ เส้นทาง และสภาพอากาศอาจไม่ครบถ้วน ล่าช้า หรือผิดพลาด Corvista ไม่ได้ควบคุมรถของคุณ';

  @override
  String get termsAccuracy2 =>
      'ฟีเจอร์ฉุกเฉินเป็นฟีเจอร์ทดลอง และอาจตรวจไม่พบการชนหรืออาจทำงานผิดพลาดได้';

  @override
  String get termsRecordingTitle => 'กฎหมายการบันทึก';

  @override
  String get termsRecording1 =>
      'กฎหมายเกี่ยวกับกล้องหน้ารถ การบันทึกเสียง และการถ่ายภาพบุคคลแตกต่างกันไปในแต่ละประเทศและภูมิภาค คุณมีหน้าที่ปฏิบัติตามกฎหมายเหล่านั้น รวมถึงเมื่อแชร์คลิป';

  @override
  String get termsLiabilityTitle => 'ความรับผิด';

  @override
  String get termsLiability1 =>
      'แอปนี้ให้บริการ “ตามสภาพ” ภายในขอบเขตที่กฎหมายอนุญาต ผู้พัฒนาไม่รับผิดต่ออุบัติเหตุ ความสูญเสีย ค่าปรับ หรือความเสียหายที่เกิดจากการใช้งานหรือการพึ่งพาผลลัพธ์ของแอป';

  @override
  String get termsChangesTitle => 'การเปลี่ยนแปลง';

  @override
  String get termsChanges1 =>
      'ข้อกำหนดเหล่านี้อาจได้รับการปรับปรุงพร้อมแอปเวอร์ชันใหม่ การใช้งานต่อหลังการปรับปรุงถือว่าคุณยอมรับข้อกำหนดที่แก้ไขแล้ว';

  @override
  String get helpTitle => 'ความช่วยเหลือ';

  @override
  String get helpIntro =>
      'คำตอบสำหรับคำถามที่พบบ่อย สำหรับคำแนะนำด้านความปลอดภัย ดูข้อมูลด้านความปลอดภัย';

  @override
  String get helpQSave => 'ฉันจะเก็บภาพเหตุการณ์ได้อย่างไร';

  @override
  String get helpASaveBuffer =>
      'แตะปุ่มบันทึกเหตุการณ์ขนาดใหญ่ในหน้าขับขี่ Corvista จะบันทึก 20 หรือ 30 วินาทีล่าสุดจากบัฟเฟอร์ต่อเนื่อง (เลือกได้ในการตั้งค่า › การบันทึก) ลงในคลิป';

  @override
  String get helpQWhere => 'คลิปของฉันเก็บไว้ที่ไหน';

  @override
  String get helpAWhere =>
      'ในพื้นที่จัดเก็บส่วนตัวของ Corvista บน iPhone ของคุณ ไม่มีการอัปโหลดเลย ใช้แชร์ในเครื่องเล่นเพื่อส่งหรือส่งออกคลิป';

  @override
  String get helpQZones => 'โซนความใกล้ชิดแม่นยำแค่ไหน';

  @override
  String get helpAZones =>
      'โซนเป็นการประมาณคร่าวๆ จากกล้องตัวเดียวโดยใช้ขนาดวัตถุโดยทั่วไป โปรดถือเป็นคำแนะนำโดยประมาณ ไม่ใช่ระยะทาง';

  @override
  String get helpQSlow => 'ทำไมการตรวจจับจึงช้าลง';

  @override
  String get helpASlow =>
      'เมื่อ iPhone ร้อน แบตเตอรี่เหลือน้อย หรือเปิดโหมดพลังงานต่ำ Corvista จะลดอัตราการวิเคราะห์เพื่อปกป้องอุปกรณ์ คุณเปลี่ยนโหมดพลังงานได้ในการตั้งค่า';

  @override
  String get helpQMap => 'แผนที่ การค้นหา หรือสภาพอากาศใช้งานไม่ได้';

  @override
  String get helpAMap =>
      'ฟีเจอร์เหล่านี้ต้องใช้อินเทอร์เน็ตและการเข้าถึงตำแหน่ง ตรวจสอบการเชื่อมต่อและอนุญาตตำแหน่งสำหรับ Corvista ในการตั้งค่า iOS';

  @override
  String get helpQSimulator => 'กล้องแสดงว่าไม่พร้อมใช้งาน';

  @override
  String get helpASimulator =>
      'ตรวจสอบว่าอนุญาตการเข้าถึงกล้องในการตั้งค่า iOS แล้ว และไม่มีแอปอื่นใช้กล้องอยู่ บน iOS Simulator ไม่มีกล้อง แต่ใช้วิดีโอทดสอบในเครื่องแทนได้';

  @override
  String get emergencyMsgNoContacts => 'โปรดเพิ่มผู้ติดต่อฉุกเฉินก่อน';

  @override
  String get cameraStarting => 'กำลังเริ่มกล้อง…';

  @override
  String get cameraInterrupted => 'กล้องหยุดชั่วคราว';

  @override
  String get cameraInterruptedBody =>
      'iOS หยุดกล้องชั่วคราว เช่น ระหว่างสนทนาโทรศัพท์หรือขณะที่แอปอื่นใช้กล้อง กล้องจะกลับมาทำงานเองโดยอัตโนมัติ';

  @override
  String get cameraUnavailable => 'กล้องไม่พร้อมใช้งาน';

  @override
  String get cameraUnavailableBody =>
      'อุปกรณ์นี้ไม่มีกล้องที่ใช้งานได้ มุมมองตรวจจับ การบันทึก และจอดรถต้องใช้กล้องหลัง';

  @override
  String get cameraRunTestFootage => 'เริ่มภาพทดสอบ';

  @override
  String get cameraPermissionDenied => 'การเข้าถึงกล้องปิดอยู่';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista ต้องใช้กล้องสำหรับการตรวจจับ การบันทึกกล้องหน้ารถ และมุมมองจอดรถ เปิดการเข้าถึงกล้องในการตั้งค่า';

  @override
  String get cameraError => 'ข้อผิดพลาดของกล้อง';

  @override
  String get cameraStopped => 'กล้องหยุดแล้ว';

  @override
  String get cameraStart => 'เริ่มกล้อง';

  @override
  String get cameraFocusHint => 'แตะเพื่อโฟกัส';

  @override
  String get cameraPreviewLabel => 'ภาพกล้องสดพร้อมวัตถุที่ตรวจจับได้';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'กล้อง $fps fps · AI $hz Hz · $ms มิลลิวินาที · ตกหล่น $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'ความเร็ว $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'ไม่มีความเร็ว GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'ทิศ $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds วิ';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'บัฟเฟอร์การบันทึกกล้องหน้ารถ บัฟเฟอร์แล้ว $seconds จาก $target วินาที';
  }

  @override
  String get hudRecIdle => 'REC ปิด';

  @override
  String get hudRecSaving => 'กำลังบันทึก…';

  @override
  String get hudRecError => 'REC ผิดพลาด';

  @override
  String get hudAiPaused => 'AI หยุดชั่วคราว';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count วัตถุ',
      zero: 'ไม่มีวัตถุ',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count วัตถุ',
      zero: 'ไม่มีวัตถุ',
    );
    return 'โมเดล AI $model ตรวจพบ $_temp0';
  }

  @override
  String get hudThermalSerious => 'ร้อน — AI ช้าลง';

  @override
  String get hudThermalCritical => 'ร้อนเกินไป — AI หยุดชั่วคราว';

  @override
  String hudBatteryLow(String percent) {
    return 'แบตเตอรี่ $percent';
  }

  @override
  String get hudLowPower => 'โหมดพลังงานต่ำ';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'สภาพอากาศ $temperature $condition แตะเพื่อดูรายละเอียด';
  }

  @override
  String get hudNoGuidance =>
      'ค้นหาจุดหมายปลายทางในมุมมองแผนที่เพื่อดูการนำทางทีละช่วงที่นี่';

  @override
  String get navArrived => 'คุณถึงที่หมายแล้ว';

  @override
  String get navRerouting => 'กำลังคำนวณเส้นทางใหม่…';

  @override
  String get navSearchHint => 'ค้นหาจุดหมายปลายทาง';

  @override
  String get navSearchFieldHint => 'ที่อยู่ สถานที่ หรือธุรกิจ';

  @override
  String get navNoResults => 'ไม่พบสถานที่ที่ตรงกัน';

  @override
  String get navSearching => 'กำลังค้นหา…';

  @override
  String get navSearchStartTyping =>
      'พิมพ์ที่อยู่หรือชื่อสถานที่ ผลลัพธ์มาจาก Apple Maps และต้องใช้อินเทอร์เน็ต';

  @override
  String get navErrorUnavailable =>
      'ไม่สามารถค้นหาและคำนวณเส้นทางได้ — ตรวจสอบการเชื่อมต่ออินเทอร์เน็ต';

  @override
  String get navErrorNoLocation => 'กำลังรอตำแหน่งของคุณเพื่อวางแผนเส้นทาง';

  @override
  String get navErrorPermission =>
      'การเข้าถึงตำแหน่งปิดอยู่ จึงเริ่มเส้นทางจากตำแหน่งของคุณไม่ได้';

  @override
  String navErrorGeneric(String code) {
    return 'ไม่สามารถโหลดเส้นทางได้ ($code)';
  }

  @override
  String navRoutesTitle(String place) {
    return 'เส้นทางไป $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'ถึง $time';
  }

  @override
  String get navStart => 'เริ่ม';

  @override
  String get navEnd => 'สิ้นสุด';

  @override
  String get navEndLabel => 'สิ้นสุดการนำทาง';

  @override
  String navRemaining(String distance, String duration) {
    return 'เหลือ $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'ประกาศ: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes นาที',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours ชม. $minutes นาที';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'เส้นทาง $index: $name';
  }

  @override
  String get weatherTitle => 'สภาพอากาศ';

  @override
  String weatherFeelsLike(String temperature) {
    return 'รู้สึกเหมือน $temperature';
  }

  @override
  String get weatherPrecipitation => 'ปริมาณน้ำฝน';

  @override
  String get weatherWind => 'ลม';

  @override
  String get weatherVisibility => 'ทัศนวิสัย';

  @override
  String get weatherHumidity => 'ความชื้น';

  @override
  String get weatherHourly => 'ชั่วโมงถัดไป';

  @override
  String weatherAsOf(String time) {
    return 'อัปเดต $time';
  }

  @override
  String get weatherRefresh => 'รีเฟรชสภาพอากาศ';

  @override
  String get weatherUnavailable => 'ขณะนี้ไม่มีข้อมูลสภาพอากาศ';

  @override
  String get weatherNoLocation => 'สภาพอากาศต้องใช้ตำแหน่งของคุณ';

  @override
  String get weatherLegal => 'แหล่งข้อมูลและข้อกฎหมาย';

  @override
  String weatherProvidedBy(String service) {
    return 'ข้อมูลสภาพอากาศ: $service';
  }

  @override
  String get weatherNow => 'ตอนนี้';

  @override
  String get virtualEmpty => 'ไม่พบวัตถุที่รองรับ';

  @override
  String get virtualEmptyCameraOff => 'มุมมองเสมือนต้องใช้กล้องสด';

  @override
  String get virtualLaneDisclaimer =>
      'เส้นแบ่งเลนเป็นภาพประกอบ ไม่ได้มาจากการตรวจจับ';

  @override
  String virtualNearest(String zone) {
    return 'ใกล้สุด: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'ฉากถนนเสมือน: $summary';
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
  String get virtualStatusLive => 'สด';

  @override
  String get virtualStatusPaused => 'หยุดชั่วคราว';

  @override
  String get virtualStatusCameraOff => 'กล้องปิด';

  @override
  String get virtualStatusTestFootage => 'ภาพทดสอบ';

  @override
  String get virtualEmptyHint =>
      'ยานพาหนะ คน จักรยาน สัญญาณไฟ และป้ายหยุดจะแสดงที่นี่เมื่อตรวจพบ';

  @override
  String get mapRecenter => 'กลับจุดกึ่งกลาง';

  @override
  String get mapZoomIn => 'ซูมเข้า';

  @override
  String get mapZoomOut => 'ซูมออก';

  @override
  String get mapUnsupported => 'แผนที่แบบโต้ตอบใช้ได้บน iPhone';

  @override
  String get mapObjectsApprox => 'เครื่องหมายวัตถุเป็นตำแหน่งโดยประมาณ';

  @override
  String get mapWeatherUnavailable => 'ไม่มีข้อมูลสภาพอากาศ';

  @override
  String get navErrorNoRoute => 'ไม่พบเส้นทางไปยังจุดหมายนี้';

  @override
  String get navDismiss => 'ปิด';

  @override
  String get navGo => 'ไป';

  @override
  String get navFastest => 'เร็วที่สุด';

  @override
  String get navThen => 'จากนั้น';

  @override
  String get navRecents => 'ล่าสุด';

  @override
  String get navClearRecents => 'ล้าง';

  @override
  String get navSearchSubmitHint => 'กดค้นหาเพื่อดูสถานที่ที่ตรงกันทั้งหมด';

  @override
  String get navPlaces => 'สถานที่';

  @override
  String get navEtaLabel => 'ถึง';

  @override
  String get navTimeLeftLabel => 'เหลือ';

  @override
  String get navOverview => 'ภาพรวม';

  @override
  String get navMute => 'ปิดเสียงนำทาง';

  @override
  String get navUnmute => 'เปิดเสียงนำทาง';

  @override
  String get navEndConfirm => 'สิ้นสุดการนำทางหรือไม่';

  @override
  String navEndConfirmBody(String place) {
    return 'การนำทางไป $place จะหยุดลง';
  }

  @override
  String navArrivedAt(String place) {
    return 'คุณถึง $place แล้ว';
  }

  @override
  String get navDone => 'เสร็จสิ้น';

  @override
  String get navWeakGps => 'สัญญาณ GPS อ่อน';

  @override
  String get navLocationOff => 'ตำแหน่งปิดอยู่ เปิดเพื่อวางแผนเส้นทางและนำทาง';

  @override
  String get navVoiceGuidance => 'เสียงนำทาง';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'อีก $distance $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first จากนั้น $second';
  }

  @override
  String get navSpeakRerouting => 'กำลังคำนวณเส้นทางใหม่';

  @override
  String get navSpeakArrived => 'คุณถึงที่หมายแล้ว';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count เมตร',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value กิโลเมตร',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ฟุต',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count หลา',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'ตรงต่อไป $distance';
  }

  @override
  String get navErrorNoDirections =>
      'ไม่มีเส้นทางสำหรับการเดินทางนี้ในภูมิภาคนี้ ลองจุดหมายอื่น';

  @override
  String navContinueFor(String distance) {
    return 'ตรงต่อไป $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value ไมล์',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'ใกล้สุด: $object · $zone';
  }

  @override
  String get parkingNothing => 'ไม่พบสิ่งใดในมุมมอง';

  @override
  String get parkingBeeps => 'เสียงบี๊บเตือนระยะ';

  @override
  String get parkingVolume => 'ระดับเสียงบี๊บ';

  @override
  String get parkingLimitations =>
      'กล้องตัวเดียว ไม่ใช่ 360° วัตถุนอกมุมมองกล้องจะไม่ถูกตรวจจับ ไม่สามารถใช้แทนเซนเซอร์ช่วยจอดได้ ค่าประมาณอาจผิดพลาด และการไม่มีเสียงเตือนไม่ได้หมายความว่าพื้นที่โล่ง';

  @override
  String parkingTopDownLabel(String summary) {
    return 'มุมมองระยะใกล้จากด้านบน $summary';
  }

  @override
  String get perceptionModeOriginal => 'ต้นฉบับ';

  @override
  String get perceptionModeBoxes => 'กรอบ';

  @override
  String get perceptionModeMasks => 'มาสก์วัตถุ';

  @override
  String get perceptionModeRoad => 'พื้นผิวถนน';

  @override
  String get perceptionModeCombined => 'รวม';

  @override
  String get perceptionOpacity => 'ความโปร่งใสของมาสก์';

  @override
  String get perceptionDisclaimer =>
      'มาสก์พื้นผิวถนนเป็นเลเยอร์ภาพโดยประมาณ ไม่ได้แสดงพื้นที่ที่ขับได้หรือเลน';

  @override
  String get perceptionNeedsModel => 'เลือกโมเดลการแบ่งส่วนเพื่อดูมาสก์';

  @override
  String get perceptionChooseModel => 'เลือกโมเดล';

  @override
  String get perceptionWaiting => 'กำลังรอเฟรมการแบ่งส่วนแรก…';

  @override
  String get perceptionShortCamera => 'กล้อง';

  @override
  String get perceptionShortBoxes => 'กรอบ';

  @override
  String get perceptionShortObjects => 'วัตถุ';

  @override
  String get perceptionShortRoad => 'ถนน';

  @override
  String get perceptionShortAll => 'ทั้งหมด';

  @override
  String get perceptionModesLabel => 'เลเยอร์การรับรู้';

  @override
  String get perceptionStatusWarmingUp => 'กำลังเตรียมพร้อม…';

  @override
  String get perceptionStatusLoadingModel => 'กำลังโหลดโมเดล…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'หยุดมาสก์ชั่วคราว';

  @override
  String get perceptionLegend => 'คำอธิบายมาสก์';

  @override
  String get perceptionUnavailable => 'ไม่มีมาสก์';

  @override
  String get driveSave => 'บันทึก';

  @override
  String get driveSaveIncident => 'บันทึกเหตุการณ์';

  @override
  String driveSaveHint(int seconds) {
    return 'บันทึกภาพกล้องหน้ารถ $seconds วินาทีล่าสุด';
  }

  @override
  String get driveSaving => 'กำลังบันทึกเหตุการณ์…';

  @override
  String hudRecManualLabel(String time) {
    return 'กำลังบันทึก $time';
  }

  @override
  String get driveRecord => 'บันทึก';

  @override
  String get driveRecordStartA11y => 'เริ่มบันทึก';

  @override
  String driveRecordStopA11y(String time) {
    return 'หยุดบันทึก บันทึกแล้ว $time';
  }

  @override
  String get driveRecordHint =>
      'บันทึกต่อเนื่องจนกว่าคุณจะหยุด รวมถึง 5 วินาทีก่อนหน้า';

  @override
  String get driveRecordFailed => 'เริ่มบันทึกไม่ได้';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'บันทึกแล้ว · $count ส่วน',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'หยุดบันทึก: พื้นที่เก็บข้อมูลใกล้เต็ม',
      'max_duration': 'หยุดบันทึก: ถึงความยาวสูงสุดแล้ว',
      'camera_stopped': 'หยุดบันทึกพร้อมกับกล้อง',
      'background': 'หยุดบันทึก: แอปทำงานอยู่เบื้องหลัง',
      'thermal': 'หยุดบันทึก: โทรศัพท์ร้อนเกินไป',
      'other': 'หยุดบันทึกแล้ว',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'บันทึกเหตุการณ์แล้ว · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'ดู';

  @override
  String get driveSaveFailed => 'ไม่สามารถบันทึกเหตุการณ์ได้';

  @override
  String get driveSaveNotRunning =>
      'การบันทึกยังไม่เริ่ม รอให้กล้องเริ่มทำงานแล้วลองอีกครั้ง';

  @override
  String get driveSaveTestFootage =>
      'ภาพทดสอบไม่ถูกบันทึก การบันทึกเหตุการณ์ใช้ได้กับกล้องสดเท่านั้น';

  @override
  String get driveSaveStorageFull =>
      'พื้นที่จัดเก็บบน iPhone เต็ม เพิ่มพื้นที่ว่างหรือลบคลิปเก่า';

  @override
  String get driveSaveIoError => 'ไม่สามารถเขียนคลิปลงพื้นที่จัดเก็บได้';

  @override
  String get driveClips => 'คลิป';

  @override
  String get driveSettings => 'การตั้งค่า';

  @override
  String get driveViewSwitcher => 'มุมมองการขับขี่';

  @override
  String get driveLocationDenied =>
      'ตำแหน่งปิดอยู่ — ไม่สามารถใช้ความเร็ว แผนที่ และเส้นทางได้';

  @override
  String get driveCameraDenied =>
      'การเข้าถึงกล้องปิดอยู่ — ไม่สามารถใช้การตรวจจับและการบันทึกได้';

  @override
  String get driveRecorderFallback =>
      'บันทึกโดยไม่มีเสียง: การเข้าถึงไมโครโฟนปิดอยู่';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'ปรับการตั้งค่าการบันทึกแล้ว: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhone ของคุณร้อน AI จะทำงานช้าลงเพื่อลดความร้อน — หลีกเลี่ยงแสงแดดโดยตรงและวางใกล้ช่องแอร์';

  @override
  String get drivePowerThermalCritical =>
      'iPhone ของคุณร้อนเกินไป การตรวจจับด้วย AI หยุดชั่วคราวจนกว่าจะเย็นลง การบันทึกจะดำเนินต่อไปหากเป็นไปได้';

  @override
  String get drivePowerLowPower =>
      'โหมดพลังงานต่ำเปิดอยู่ — AI ทำงานด้วยอัตราที่ลดลง';

  @override
  String get drivePowerBatteryLow =>
      'แบตเตอรี่เหลือน้อย — เชื่อมต่อ iPhone กับที่ชาร์จขณะขับรถ';

  @override
  String get onboardingTitle1 => 'มองเห็นได้มากขึ้นในทุกการเดินทาง';

  @override
  String get onboardingBody1 =>
      'เปลี่ยน iPhone ของคุณให้เป็นกล้องหน้ารถอัจฉริยะและผู้ช่วยเสริมการรับรู้ขณะขับรถ';

  @override
  String get onboardingTitle2 => 'ความอัจฉริยะในทุกเฟรม';

  @override
  String get onboardingBody2 =>
      'จดจำยานพาหนะ คน จักรยาน และสัญญาณบนถนนที่รองรับ ได้โดยตรงบน iPhone ของคุณ';

  @override
  String get onboardingTitle3 => 'ถนนเส้นเดียว หลายมุมมอง';

  @override
  String get onboardingBody3 =>
      'สลับระหว่างการตรวจจับสด มุมมองการขับขี่เสมือน แผนที่แบบโต้ตอบ และภาพการจอดรถ';

  @override
  String get onboardingTitle4 => 'เก็บช่วงเวลาที่สำคัญ';

  @override
  String get onboardingBody4 =>
      'บันทึกภาพกล้องหน้ารถล่าสุด ทบทวนเหตุการณ์ และแชร์การบันทึก';

  @override
  String get onboardingTitle5 => 'ความปลอดภัยและความเป็นส่วนตัว';

  @override
  String get onboardingSafety1 =>
      'Corvista เป็นตัวช่วยเสริมการรับรู้ขณะขับรถ โปรดมองถนนอยู่เสมอ';

  @override
  String get onboardingSafety2 =>
      'ไม่ได้ควบคุมรถของคุณ และไม่สามารถแทนที่วิจารณญาณของคุณ';

  @override
  String get onboardingSafety3 =>
      'การตรวจจับและค่าประมาณอาจไม่แม่นยำหรืออาจตรวจไม่พบ';

  @override
  String get onboardingSafety4 =>
      'การประมวลผลภาพจากกล้องเกิดขึ้นบน iPhone ของคุณ — ไม่มีการอัปโหลดวิดีโอ';

  @override
  String get onboardingSafety5 =>
      'แผนที่ การค้นหา เส้นทาง และสภาพอากาศต้องใช้อินเทอร์เน็ต';

  @override
  String get onboardingSafety6 =>
      'ติดตั้ง iPhone ให้มั่นคงโดยไม่บดบังทัศนวิสัย';

  @override
  String get onboardingSafety7 => 'ตั้งค่าให้เสร็จก่อนเริ่มขับรถ';

  @override
  String get onboardingAcknowledge =>
      'ฉันเข้าใจว่า Corvista เป็นเพียงตัวช่วยเสริมการรับรู้ และฉันยังคงต้องรับผิดชอบในการขับขี่อย่างปลอดภัย';

  @override
  String get onboardingReadSafety => 'อ่านข้อมูลด้านความปลอดภัยฉบับเต็ม';

  @override
  String get onboardingNext => 'ถัดไป';

  @override
  String get onboardingSkip => 'ข้าม';

  @override
  String get onboardingAgree => 'ดำเนินการต่อ';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'หน้า $current จาก $total';
  }

  @override
  String get permTitle => 'การอนุญาต';

  @override
  String get permIntro =>
      'Corvista ขอเฉพาะสิ่งที่แต่ละฟีเจอร์ต้องการ คุณเปลี่ยนได้ทุกเมื่อในการตั้งค่า';

  @override
  String get permCameraTitle => 'กล้อง';

  @override
  String get permCameraBody =>
      'จำเป็นสำหรับการตรวจจับ การบันทึกกล้องหน้ารถ และมุมมองจอดรถ วิดีโอถูกประมวลผลบน iPhone ของคุณ';

  @override
  String get permLocationTitle => 'ตำแหน่ง';

  @override
  String get permLocationBody =>
      'ใช้สำหรับความเร็ว GPS แผนที่ เส้นทาง สภาพอากาศ และการติดแท็กคลิปที่บันทึก เฉพาะขณะที่คุณใช้แอป';

  @override
  String get permMicTitle => 'ไมโครโฟน';

  @override
  String get permSpeechNote =>
      'จะขอการรู้จำเสียงพูดก็ต่อเมื่อคุณเปิดการยกเลิกด้วยเสียงสำหรับการแจ้งเตือนฉุกเฉิน';

  @override
  String get permRequired => 'จำเป็น';

  @override
  String get permOptional => 'ไม่บังคับ';

  @override
  String get permAllow => 'อนุญาต';

  @override
  String get permGranted => 'อนุญาตแล้ว';

  @override
  String get permDenied => 'ไม่อนุญาต';

  @override
  String get permLimited => 'จำกัด';

  @override
  String get permRestricted => 'ถูกจำกัด';

  @override
  String get permStart => 'เริ่มขับรถ';

  @override
  String get permCameraNeeded =>
      'คุณดำเนินการต่อได้โดยไม่ต้องอนุญาตกล้อง แต่การตรวจจับและการบันทึกจะใช้ไม่ได้จนกว่าคุณจะอนุญาตในการตั้งค่า';

  @override
  String get permSetupIntro =>
      'Corvista ต้องการสิ่งเหล่านี้เพื่อทำงานได้เต็มที่ แตะอนุญาตทั้งหมด แล้ว iOS จะถามทีละรายการ คุณเปลี่ยนได้ทุกเมื่อในการตั้งค่า';

  @override
  String get permCameraLine =>
      'จำเป็นสำหรับการตรวจจับ การบันทึกกล้องหน้ารถ และมุมมองจอดรถ วิดีโอถูกประมวลผลบน iPhone ของคุณและไม่เคยถูกอัปโหลด';

  @override
  String get permLocationLine =>
      'ความเร็ว GPS แผนที่ เส้นทาง สภาพอากาศ และตำแหน่งที่บันทึกคลิป เฉพาะขณะที่คุณใช้แอป';

  @override
  String get permMicLine =>
      'เสียงในรถในคลิปเหตุการณ์ และการได้ยินวลียกเลิกของคุณระหว่างการแจ้งเตือนฉุกเฉิน';

  @override
  String get permSpeechTitle => 'การรู้จำเสียงพูด';

  @override
  String get permSpeechLine =>
      'รู้จำวลียกเลิกของคุณระหว่างการนับถอยหลังฉุกเฉิน บน iPhone ของคุณเมื่อรองรับ';

  @override
  String get permAllowAll => 'อนุญาตทั้งหมด';

  @override
  String permAsking(String permission) {
    return 'กำลังขอ $permission…';
  }

  @override
  String get permSomeDenied =>
      'การอนุญาตบางรายการปิดอยู่ เปิดในการตั้งค่าเพื่อใช้ฟีเจอร์เหล่านั้น';

  @override
  String get permNotNow => 'ไว้ทีหลัง';

  @override
  String get tourLabel => 'ทัวร์หน้าจอการขับขี่';

  @override
  String tourProgress(int current, int total) {
    return 'ขั้นตอนที่ $current จาก $total';
  }

  @override
  String get tourNext => 'ถัดไป';

  @override
  String get tourBack => 'กลับ';

  @override
  String get tourSkip => 'ข้ามทัวร์';

  @override
  String get tourFinish => 'เริ่มขับรถ';

  @override
  String get tourWelcomeTitle => 'ทัวร์แบบสั้นของคุณ';

  @override
  String get tourWelcomeBody =>
      'ดูสิ่งสำคัญบนหน้าจอการขับขี่ภายในหนึ่งนาที เหมาะที่สุดเมื่อทำขณะจอดรถ';

  @override
  String get tourHudTitle => 'แถบมาตรวัดของคุณ';

  @override
  String get tourHudSpeed => 'ความเร็วมาจาก GPS';

  @override
  String get tourHudRec => 'REC แสดงจำนวนวินาทีของภาพที่อยู่ในบัฟเฟอร์';

  @override
  String get tourHudAi =>
      'ชิป AI แสดงโมเดล จำนวนวัตถุที่เห็น และจุดสี: เขียวคือกำลังทำงาน เหลืองคือทำงานจำกัด แดงคือหยุดทำงาน';

  @override
  String get tourSaveTitle => 'บันทึกเหตุการณ์';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista เก็บบัฟเฟอร์ต่อเนื่องของวิดีโอ $seconds วินาทีล่าสุด ซึ่งถูกเขียนทับตลอดเวลา จึงไม่มีสิ่งใดถูกเก็บไว้เว้นแต่คุณแตะบันทึก คลิปที่บันทึกจะอยู่บน iPhone เครื่องนี้ในส่วนคลิป';
  }

  @override
  String get tourRecordTitle => 'บันทึกตลอดการเดินทาง';

  @override
  String get tourRecordBody =>
      'แตะบันทึกเพื่อถ่ายต่อเนื่องจนกว่าคุณจะหยุด การเดินทางไกลจะถูกบันทึกเป็นส่วนละ 5 นาทีในคลิป และบันทึกเหตุการณ์ยังใช้งานได้ขณะที่คุณบันทึก';

  @override
  String get tourViewsTitle => 'ห้าวิธีในการมองถนน';

  @override
  String get tourViewDetection => 'กล้องสดพร้อมกรอบรอบวัตถุที่รองรับ';

  @override
  String get tourViewVirtual => 'ฉาก 3 มิติแบบง่ายที่สร้างจากการตรวจจับ';

  @override
  String get tourViewMap => 'Apple Maps พร้อมการค้นหาและการนำทางทีละช่วง';

  @override
  String get tourViewParking => 'กล้องพร้อมมุมมองระยะใกล้จากด้านบน';

  @override
  String get tourViewPerception => 'มาสก์ถนนและวัตถุ';

  @override
  String get tourMapTitle => 'ค้นหาและนำทางทีละช่วง';

  @override
  String get tourMapBody =>
      'เปิดแผนที่ แตะแถบค้นหา แล้วเลือกจุดหมายปลายทาง เลือกเส้นทาง จากนั้นแตะเริ่มเพื่อนำทางทีละช่วง ต้องใช้อินเทอร์เน็ต';

  @override
  String get tourClipsTitle => 'คลิป';

  @override
  String get tourClipsBody =>
      'ทบทวน เปลี่ยนชื่อ แชร์ หรือลบเหตุการณ์ที่บันทึก คลิปจะอยู่บน iPhone ของคุณเว้นแต่คุณจะแชร์';

  @override
  String get tourSettingsTitle => 'การตั้งค่า';

  @override
  String get tourSettingsBody =>
      'ปรับการแจ้งเตือนด้วยเสียงและความไว คุณภาพการบันทึกและความยาวบัฟเฟอร์ และตั้งค่าโหมดฉุกเฉิน: การแจ้งเตือนการชนแบบทดลองพร้อมการนับถอยหลังเพื่อยกเลิก';

  @override
  String get tourSafetyTitle => 'ก่อนออกเดินทาง';

  @override
  String get tourSafety1 => 'ติดตั้ง iPhone ให้มั่นคงโดยไม่บดบังทัศนวิสัย';

  @override
  String get tourSafety2 => 'อย่าใช้งานแอปขณะขับรถ ตั้งค่าขณะจอดรถ';

  @override
  String get tourSafety3 =>
      'การตรวจจับและโซนเป็นเพียงค่าประมาณ อาจผิดพลาดหรือตรวจไม่พบ';

  @override
  String get tourSafety4 => 'คุณยังคงต้องรับผิดชอบในการขับขี่อย่างปลอดภัย';

  @override
  String get helpTakeTour => 'ดูทัวร์';

  @override
  String get helpTakeTourSub => 'ทัวร์แนะนำหน้าจอการขับขี่แบบสั้นหนึ่งนาที';

  @override
  String get tripsTitle => 'ทริป';

  @override
  String get tripsOpen => 'บันทึกทริป';

  @override
  String get tripsEmptyTitle => 'ยังไม่มีทริป';

  @override
  String get tripsEmptyBody =>
      'ทริปจะถูกบันทึกอัตโนมัติขณะที่คุณขับรถกับ Corvista — ระยะทาง เวลา ความเร็ว และเส้นทางที่คุณใช้';

  @override
  String get tripsDisabledBody =>
      'บันทึกทริปปิดอยู่ จึงไม่มีการบันทึกการเดินทางใหม่ เปิดเพื่อเก็บบันทึกเส้นทางส่วนตัวไว้บน iPhone เครื่องนี้';

  @override
  String get tripsEnable => 'เปิดบันทึกทริป';

  @override
  String get tripsToday => 'วันนี้';

  @override
  String get tripsYesterday => 'เมื่อวาน';

  @override
  String tripsRecordingNow(String distance) {
    return 'กำลังบันทึกทริป · $distance';
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
      other: '$count เหตุการณ์',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count การแจ้งเตือน',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ทริป',
      zero: 'ไม่มีทริป',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'ระยะทาง';

  @override
  String get tripsStatDuration => 'ระยะเวลา';

  @override
  String get tripsStatMoving => 'เวลาเคลื่อนที่';

  @override
  String get tripsStatAvgSpeed => 'ความเร็วเฉลี่ย';

  @override
  String get tripsStatMaxSpeed => 'ความเร็วสูงสุด';

  @override
  String get tripsDetections => 'การตรวจจับ';

  @override
  String get tripsNoDetections => 'ไม่มีการบันทึกวัตถุบนถนนในทริปนี้';

  @override
  String get tripsTimeline => 'ไทม์ไลน์';

  @override
  String get tripsEventStart => 'เริ่มทริป';

  @override
  String get tripsEventEnd => 'สิ้นสุดทริป';

  @override
  String get tripsEventAlert => 'การแจ้งเตือนด้วยเสียง';

  @override
  String get tripsEventIncident => 'บันทึกคลิปเหตุการณ์แล้ว';

  @override
  String get tripsEventEmergency => 'ตรวจพบการชนที่อาจเกิดขึ้น';

  @override
  String get tripsEventNavStart => 'เริ่มการนำทาง';

  @override
  String get tripsEventArrive => 'ถึงจุดหมายปลายทาง';

  @override
  String get tripsEventReroute => 'คำนวณเส้นทางใหม่';

  @override
  String get tripsEventRecording => 'บันทึกแล้ว';

  @override
  String get tripsOpenClip => 'เปิดคลิป';

  @override
  String get tripsTrackPreview => 'เส้นทาง GPS';

  @override
  String get tripsRenameTitle => 'เปลี่ยนชื่อทริป';

  @override
  String get tripsRenameHint => 'ชื่อทริป';

  @override
  String get tripsFavorite => 'เพิ่มในรายการโปรด';

  @override
  String get tripsUnfavorite => 'นำออกจากรายการโปรด';

  @override
  String get tripsShareGpx => 'แชร์ GPX';

  @override
  String get tripsShareFailed => 'ไม่สามารถแชร์ทริปนี้ได้';

  @override
  String get tripsDelete => 'ลบทริป';

  @override
  String get tripsDeleteConfirmTitle => 'ลบทริปนี้หรือไม่';

  @override
  String get tripsDeleteConfirmBody =>
      'เส้นทางและสถิติจะถูกลบออกจาก iPhone เครื่องนี้ คลิปเหตุการณ์จากทริปนี้จะยังคงอยู่';

  @override
  String get tripsDeleted => 'ลบทริปแล้ว';

  @override
  String get tripsNotFound => 'ไม่มีทริปนี้อีกต่อไป';

  @override
  String get tripsPrivacyNote =>
      'เก็บไว้บน iPhone เครื่องนี้เท่านั้น ไม่มีการอัปโหลด';

  @override
  String get settingsSectionTrips => 'บันทึกทริป';

  @override
  String get settingsTripLog => 'บันทึกทริป';

  @override
  String get settingsTripLogSubtitle =>
      'เก็บเส้นทางและสถิติการขับขี่ไว้บน iPhone เครื่องนี้เท่านั้น';

  @override
  String get settingsTripRetention => 'เก็บทริปไว้';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 ปี';

  @override
  String get settingsRetentionForever => 'ตลอดไป';

  @override
  String get settingsTripRetentionFooter =>
      'ทริปที่เก่ากว่าจะถูกลบโดยอัตโนมัติเมื่อ Corvista เริ่มทำงาน';

  @override
  String get settingsViewTrips => 'ดูทริป';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours ชม. $minutes นาที';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes นาที';
  }

  @override
  String tripsGpxName(String date) {
    return 'ทริป Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'เพิ่มพื้นที่ว่าง';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'ลบไฟล์ชั่วคราวและแคช คลิปและทริปที่บันทึกไว้จะยังคงอยู่';

  @override
  String settingsFreedBytes(String size) {
    return 'เพิ่มพื้นที่ว่าง $size';
  }

  @override
  String get settingsNothingToFree => 'ล้างแคชแล้ว — ไม่มีไฟล์ชั่วคราวให้ลบ';

  @override
  String get settingsSectionPrivacyData => 'ความเป็นส่วนตัวและข้อมูล';

  @override
  String get settingsPrivacyDataFooter =>
      'คลิป ทริป และการตั้งค่าจะถูกเก็บไว้บน iPhone เครื่องนี้เท่านั้น และจะออกจากเครื่องก็ต่อเมื่อคุณเลือกแชร์';

  @override
  String get settingsDeleteAllData => 'ลบข้อมูลทั้งหมด';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'ลบคลิป ทริป ผู้ติดต่อ และการตั้งค่าออกจาก iPhone เครื่องนี้';

  @override
  String get deleteAllTitle => 'ลบข้อมูลทั้งหมดหรือไม่';

  @override
  String get deleteAllMessage =>
      'รายการต่อไปนี้จะถูกลบออกจาก iPhone เครื่องนี้อย่างถาวร:\n• คลิปเหตุการณ์และภาพขนาดย่อ\n• บันทึกทริปและเส้นทาง GPS\n• ผู้ติดต่อฉุกเฉินและเหตุการณ์ฉุกเฉิน\n• บันทึกการตรวจจับและบันทึกการวินิจฉัย\n• การตั้งค่าและจุดหมายล่าสุด\n• บัฟเฟอร์การบันทึกชั่วคราวและแคช\n\nไม่สามารถยกเลิกได้ จากนั้น Corvista จะเริ่มใหม่ตั้งแต่หน้าจอต้อนรับ';

  @override
  String get deleteAllConfirm => 'ลบทั้งหมด';

  @override
  String get deleteAllInProgress => 'กำลังลบ…';

  @override
  String get deleteAllDone => 'ลบข้อมูลทั้งหมดแล้ว';

  @override
  String get deleteAllPartial =>
      'ลบบางรายการไม่ได้ โปรดลองอีกครั้งจากการตั้งค่า';

  @override
  String get diagLogSection => 'บันทึกการวินิจฉัย';

  @override
  String get diagLogFooter =>
      'ข้อผิดพลาดจะถูกบันทึกไว้บน iPhone เครื่องนี้เท่านั้น โดยไม่มีตำแหน่ง ชื่อผู้ติดต่อ หรือหมายเลขโทรศัพท์ และจะไม่ถูกส่งออกไปเว้นแต่คุณจะแชร์บันทึกเอง';

  @override
  String get diagLogShare => 'แชร์บันทึกการวินิจฉัย';

  @override
  String get diagLogEmpty => 'ว่างเปล่า';

  @override
  String get diagLogClear => 'ล้างบันทึก';

  @override
  String get diagLogClearTitle => 'ล้างบันทึกการวินิจฉัยหรือไม่';

  @override
  String get diagLogClearBody =>
      'รายการข้อผิดพลาดที่บันทึกไว้จะถูกลบออกจาก iPhone เครื่องนี้';

  @override
  String get diagLogCleared => 'ล้างบันทึกการวินิจฉัยแล้ว';

  @override
  String get diagLogShareFailed => 'แชร์บันทึกการวินิจฉัยไม่ได้';

  @override
  String get privacyControls2 =>
      'การตั้งค่า › ความเป็นส่วนตัวและข้อมูล › ลบข้อมูลทั้งหมด จะลบคลิป ทริป ผู้ติดต่อ บันทึก และการตั้งค่าทั้งหมดที่ Corvista เก็บไว้บน iPhone เครื่องนี้';

  @override
  String get parkingZoneStop => 'หยุด';

  @override
  String get parkingZoneVeryClose => 'ใกล้มาก';

  @override
  String get parkingZoneClose => 'ใกล้';

  @override
  String get parkingZoneNothingClose => 'ไม่พบสิ่งใดใกล้';

  @override
  String get parkingNotDetected => 'ไม่ตรวจจับกำแพง เสา หลัก และขอบทาง';

  @override
  String get parkingApprox => 'โดยประมาณ';

  @override
  String get parkingSideLeft => 'ซ้าย';

  @override
  String get parkingSideCenter => 'กลาง';

  @override
  String get parkingSideRight => 'ขวา';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => 'แสดงเฉพาะกล้องหน้า — ไม่ใช่ระบบ 360°';

  @override
  String get parkingMuteBeeps => 'ปิดเสียงบี๊บ';

  @override
  String get parkingUnmuteBeeps => 'เปิดเสียงบี๊บ';

  @override
  String get parkingAbout => 'เกี่ยวกับมุมมองจอดรถ';

  @override
  String get parkingLimitationsDetail =>
      'ระบบเฝ้าดูเฉพาะพื้นที่ด้านหน้ากล้อง ตัวตรวจจับรู้จักรถยนต์ รถบัสและรถบรรทุก คน จักรยาน และมอเตอร์ไซค์ แต่จะไม่ตรวจจับกำแพง เสา หลัก ขอบทาง เสากั้น แผงกั้น และสิ่งกีดขวางเตี้ย ๆ และฝากระโปรงอาจบังพื้นที่ตรงหน้าไว้ ระยะทางเป็นเพียงการคาดเดาคร่าว ๆ จากกล้องตัวเดียว (ขนาดและตำแหน่งของวัตถุ) และอาจคลาดเคลื่อนมาก การไม่มีเสียงหรือข้อความ “ไม่พบสิ่งใดใกล้” ไม่ได้หมายความว่าทางโล่ง — โปรดมองรอบตัวและใช้กระจกเสมอ';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'ความใกล้แต่ละด้าน: ซ้าย $left กลาง $center ขวา $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'ข้อผิดพลาดจะถูกเขียนลงบันทึกส่วนตัวบน iPhone เครื่องนี้ (ไม่มีตำแหน่ง ชื่อผู้ติดต่อ หรือหมายเลขโทรศัพท์) และจะไม่ถูกส่งโดยอัตโนมัติ คุณสามารถแชร์หรือล้างได้ในการตั้งค่า › การวินิจฉัย';
}
