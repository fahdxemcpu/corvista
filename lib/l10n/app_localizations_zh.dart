// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => '看见每一程的更多。';

  @override
  String get commonCancel => '取消';

  @override
  String get commonDelete => '删除';

  @override
  String get commonSave => '保存';

  @override
  String get commonBack => '返回';

  @override
  String get commonClose => '关闭';

  @override
  String get commonRetry => '重试';

  @override
  String get commonOpenSettings => '打开“设置”';

  @override
  String get commonLoading => '正在载入…';

  @override
  String get commonError => '出了点问题。';

  @override
  String commonErrorDetail(String message) {
    return '出了点问题：$message';
  }

  @override
  String get commonOn => '开';

  @override
  String get commonOff => '关';

  @override
  String get commonRename => '重命名';

  @override
  String get commonShare => '共享';

  @override
  String get commonNotAvailable => '不可用';

  @override
  String get commonTestFootage => '测试视频';

  @override
  String get zoneVeryClose => '极近';

  @override
  String get zoneClose => '较近';

  @override
  String get zoneMedium => '中等';

  @override
  String get zoneFar => '较远';

  @override
  String get zoneUnknown => '未知';

  @override
  String get classPerson => '行人';

  @override
  String get classBicycle => '自行车';

  @override
  String get classMotorcycle => '摩托车';

  @override
  String get classCar => '车辆';

  @override
  String get classBus => '公交车';

  @override
  String get classTrafficLight => '红绿灯';

  @override
  String get classStopSign => '停车标志';

  @override
  String get viewDetection => '检测';

  @override
  String get viewVirtual => '虚拟';

  @override
  String get viewMap => '地图';

  @override
  String get viewParking => '泊车';

  @override
  String get viewPerception => '感知';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => '红灯';

  @override
  String get lightYellow => '黄灯';

  @override
  String get lightGreen => '绿灯';

  @override
  String get lightUnknown => '未知';

  @override
  String get clipsTitle => '片段';

  @override
  String get clipsSelect => '选择';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已选择 $count 个',
      one: '已选择 1 个',
      zero: '选择片段',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => '全选';

  @override
  String get clipsDeselectAll => '取消全选';

  @override
  String get clipsDeleteSelected => '删除所选';

  @override
  String get clipsGridView => '网格视图';

  @override
  String get clipsListView => '列表视图';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '删除 $count 个片段？',
      one: '删除此片段？',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '这些视频将从你的 iPhone 中永久移除，此操作无法撤销。',
      one: '该视频将从你的 iPhone 中永久移除，此操作无法撤销。',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已删除 $count 个片段',
      one: '已删除片段',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => '还没有片段';

  @override
  String get clipsEmptyBody =>
      '行车时，Corvista 会持续保留一段短暂的循环缓冲。轻点“保存事件”，即可将最近几秒的画面保存在此。';

  @override
  String get clipsLoadError => '无法载入你的片段。';

  @override
  String get clipsStorageTitle => '储存空间';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return '片段 $clips · 缓冲 $buffer · 可用 $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个已存片段',
      one: '1 个已存片段',
      zero: '没有已存片段',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow => '你的 iPhone 储存空间不足，新事件可能无法保存。';

  @override
  String get clipsMissingFile => '文件缺失';

  @override
  String get clipsEmergencyBadge => '碰撞';

  @override
  String clipsUntitled(String date) {
    return '事件 · $date';
  }

  @override
  String get clipsAudio => '已录制音频';

  @override
  String get clipsFavorite => '收藏';

  @override
  String get clipsUnfavorite => '取消收藏';

  @override
  String get clipsLocation => '已存位置';

  @override
  String clipsOpenClip(String title) {
    return '打开片段 $title';
  }

  @override
  String get playerNotFoundTitle => '找不到片段';

  @override
  String get playerNotFoundBody => '此片段可能已被删除。';

  @override
  String get playerMissingTitle => '视频文件缺失';

  @override
  String get playerMissingBody => '此片段的录像已不在你的 iPhone 上。你可以从图库中移除该条目。';

  @override
  String get playerRemoveEntry => '移除条目';

  @override
  String get playerLoadError => '无法播放此视频。';

  @override
  String get playerPlay => '播放';

  @override
  String get playerPause => '暂停';

  @override
  String get playerReplay => '重播';

  @override
  String get playerRenameTitle => '重命名片段';

  @override
  String get playerRenameHint => '片段名称';

  @override
  String get playerRenamed => '片段已重命名';

  @override
  String get playerFavorited => '已加入收藏';

  @override
  String get playerUnfavorited => '已取消收藏';

  @override
  String get playerShareFailed => '无法共享此片段。';

  @override
  String get playerDetails => '详细信息';

  @override
  String get playerDate => '录制时间';

  @override
  String get playerDuration => '时长';

  @override
  String get playerResolution => '分辨率';

  @override
  String get playerSize => '文件大小';

  @override
  String get playerAudio => '音频';

  @override
  String get playerAudioYes => '已录制';

  @override
  String get playerAudioNo => '未录制';

  @override
  String get playerReason => '保存方式';

  @override
  String get playerReasonManual => '“保存事件”按钮';

  @override
  String get playerReasonEmergency => '可能的碰撞检测';

  @override
  String get playerReasonRecovered => '中断后恢复';

  @override
  String get playerSpeed => '保存时的 GPS 速度';

  @override
  String get playerLocation => '位置';

  @override
  String get playerOpenInMaps => '在“地图”中打开';

  @override
  String get playerBack => '返回';

  @override
  String get playerMore => '更多操作';

  @override
  String get clipsFilterLabel => '显示';

  @override
  String get clipsFilterAll => '全部';

  @override
  String get clipsFilterRecordings => '录像';

  @override
  String get clipsFilterIncidents => '事件';

  @override
  String get clipsFilterEmergency => '紧急';

  @override
  String get clipsFilterFavorites => '收藏';

  @override
  String get clipsSort => '排序';

  @override
  String get clipsSortNewest => '最新优先';

  @override
  String get clipsSortOldest => '最早优先';

  @override
  String get clipsSortLongest => '最长优先';

  @override
  String get clipsSortLargest => '最大优先';

  @override
  String get clipsToday => '今天';

  @override
  String get clipsYesterday => '昨天';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个片段',
      one: '1 个片段',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => '此类别下暂无片段。';

  @override
  String get clipsFavoritesEmpty => '为片段加星标，即可在此快速查看。';

  @override
  String get clipsKindRecording => '录像';

  @override
  String get clipsKindIncident => '事件';

  @override
  String get clipsKindEmergency => '紧急';

  @override
  String get clipsKindTest => '测试';

  @override
  String clipsTripChip(String time) {
    return '行程 · $time';
  }

  @override
  String get clipsOpenTrip => '打开录制此片段时的行程';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '已用 $used · 可用 $free';
  }

  @override
  String clipsStorageClips(String size) {
    return '片段占用 $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 段录像',
      one: '1 段录像',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 起事件',
      one: '1 起事件',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 次紧急情况',
      one: '1 次紧急情况',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => '释放空间';

  @override
  String get clipsStorageLowGentle => '可用空间不足 2 GB。为保持流畅录制，请释放空间或删除不再需要的片段。';

  @override
  String get clipsSaveToPhotos => '存储到“照片”';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个片段',
      one: '1 个片段',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '删除 $count 个片段（$size）？',
      one: '删除此片段（$size）？',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return '正在存储到“照片”：$done/$total…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已将 $count 个片段存储到“照片”',
      one: '已存储到“照片”',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '已存储 $saved 个到“照片” · $failed 个无法存储';
  }

  @override
  String get clipsPhotosDenied => 'Corvista 无权向“照片”添加视频。你可以在“设置”中允许。';

  @override
  String get clipsPhotosFailed => '无法存储到“照片”。';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已将 $count 个片段添加到收藏',
      one: '已添加到收藏',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已从收藏中移除 $count 个片段',
      one: '已从收藏中移除',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title（已裁剪）';
  }

  @override
  String get playerTrim => '裁剪';

  @override
  String get playerInfo => '信息';

  @override
  String get playerKind => '类型';

  @override
  String get playerReasonRecording => '录制按钮';

  @override
  String get trimTitle => '裁剪片段';

  @override
  String get trimHint => '拖动两端的手柄，选择要保留的部分。原片段保持不变。';

  @override
  String get trimStartHandle => '裁剪起点';

  @override
  String get trimEndHandle => '裁剪终点';

  @override
  String trimSelection(String duration) {
    return '已选 $duration';
  }

  @override
  String get trimSave => '存储为新片段';

  @override
  String get trimSaving => '正在存储裁剪后的片段…';

  @override
  String get trimSaved => '裁剪后的片段已存储';

  @override
  String get trimOpenNew => '打开';

  @override
  String get trimFailed => '无法裁剪此片段。';

  @override
  String get trimStorageFull => '可用空间不足，无法存储裁剪后的片段。';

  @override
  String get trimPreview => '播放所选部分';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsSectionCamera => '相机';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => '提醒';

  @override
  String get settingsSectionAlertCategories => '提醒类别';

  @override
  String get settingsSectionRecording => '录制';

  @override
  String get settingsSectionDriving => '驾驶';

  @override
  String get settingsSectionPower => '电源';

  @override
  String get settingsSectionEmergency => '紧急情况';

  @override
  String get settingsSectionAppearance => '外观';

  @override
  String get settingsSectionLanguage => '语言';

  @override
  String get settingsSectionInformation => '信息';

  @override
  String get settingsCameraLens => '相机镜头';

  @override
  String get settingsLensWide => '广角';

  @override
  String get settingsLensUltraWide => '超广角';

  @override
  String get settingsLensTelephoto => '长焦';

  @override
  String get settingsLensUnavailable => '此 iPhone 不支持';

  @override
  String get settingsStabilization => '防抖';

  @override
  String get settingsStabAuto => '自动';

  @override
  String get settingsStabOff => '关闭';

  @override
  String get settingsStabStandard => '标准';

  @override
  String get settingsStabCinematic => '影院级';

  @override
  String get settingsOverlayOpacity => '叠加层不透明度';

  @override
  String get settingsShowFps => '显示性能数据';

  @override
  String get settingsShowFpsSubtitle => '在检测视图中显示帧率和推理时间';

  @override
  String get settingsCameraFooter => '镜头和防抖的更改将在下次启动相机时生效。';

  @override
  String get settingsAiModel => 'AI 模型';

  @override
  String get settingsConfidence => '检测置信度';

  @override
  String get settingsTracking => '物体追踪';

  @override
  String get settingsTrackingSubtitle => '让物体在帧与帧之间保持稳定';

  @override
  String get settingsShowLabels => '显示标签';

  @override
  String get settingsShowConfidence => '显示置信度';

  @override
  String get settingsSegmentationOpacity => '感知蒙版不透明度';

  @override
  String get settingsAiFooter => '置信度越低，显示的物体越多，误检也越多。检测结果可能不准确。';

  @override
  String get settingsVoiceAlerts => '语音提醒';

  @override
  String get settingsVoiceLanguage => '语音语言';

  @override
  String get settingsVoiceLanguageAuto => '跟随 App 语言';

  @override
  String get settingsVoice => '声音';

  @override
  String get settingsVoiceDefault => '系统默认';

  @override
  String get settingsVoiceQualityEnhanced => '增强';

  @override
  String get settingsVoiceQualityPremium => '高品质';

  @override
  String get settingsNoVoices => '此语言尚未安装任何声音。请前往“iOS 设置”›“辅助功能”›“朗读内容”添加。';

  @override
  String get settingsAlertPedestrian => '行人';

  @override
  String get settingsAlertCyclist => '骑行者';

  @override
  String get settingsAlertMotorcycle => '摩托车';

  @override
  String get settingsAlertBus => '公交车';

  @override
  String get settingsAlertVehicleClose => '前方车辆极近';

  @override
  String get settingsAlertTrafficLight => '红绿灯变化';

  @override
  String get settingsAlertTrafficMoving => '前方车流移动';

  @override
  String get settingsAlertStopSign => '停车标志';

  @override
  String get settingsSensitivity => '灵敏度';

  @override
  String get settingsSensitivityLow => '低';

  @override
  String get settingsSensitivityMedium => '中';

  @override
  String get settingsSensitivityHigh => '高';

  @override
  String get settingsCooldown => '重复间隔';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get settingsVolume => '语音音量';

  @override
  String get settingsQuietMode => '安静模式';

  @override
  String get settingsQuietModeSubtitle => '仅播报最重要的提醒';

  @override
  String get settingsTestVoice => '测试语音';

  @override
  String get settingsTestVoiceDone => '正在播放示例提醒…';

  @override
  String get settingsParkingBeeps => '泊车提示音';

  @override
  String get settingsBeepVolume => '提示音音量';

  @override
  String get settingsAlertsFooter => '提醒仅作辅助。请始终留意路况——没有提醒并不代表前方畅通。';

  @override
  String get settingsRecordingProfile => '录制画质';

  @override
  String get settingsProfileStandard => '标准 · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => '事件缓冲时长';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get settingsManualMaxLength => '手动录制最长时长';

  @override
  String get settingsManualMaxUnlimited => '不限';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String get settingsRecordAudio => '录制音频';

  @override
  String get settingsRecordAudioSubtitle => '在已存事件中包含车内声音';

  @override
  String get settingsMicDenied => '麦克风访问已关闭。请在“设置”中允许后再录制音频。';

  @override
  String get settingsWatermark => 'Corvista 水印';

  @override
  String get settingsTimestamp => '日期和时间戳';

  @override
  String get settingsSaveLocation => '随片段保存位置';

  @override
  String get settingsStorage => '储存空间与片段';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个片段',
      one: '1 个片段',
      zero: '无片段',
    );
    return '$_temp0 · 已用 $used · 可用 $free';
  }

  @override
  String get settingsRecordingFooter =>
      '循环缓冲保存在你的 iPhone 上，并会被持续覆盖。App 不会在后台录制。';

  @override
  String get settingsDefaultView => '默认视图';

  @override
  String get settingsUnits => '单位';

  @override
  String get settingsShowCompass => '显示指南针';

  @override
  String get settingsHudStyle => 'HUD 样式';

  @override
  String get settingsHudCustomize => '自定义 HUD';

  @override
  String get settingsDrivingSide => '行驶方向';

  @override
  String get settingsDrivingSideAuto => '自动';

  @override
  String get settingsDrivingSideRight => '右侧通行';

  @override
  String get settingsDrivingSideLeft => '左侧通行';

  @override
  String get settingsVirtualStyle => '虚拟视图样式';

  @override
  String get settingsVirtualMinimal => '极简';

  @override
  String get settingsVirtualPerspective => '透视';

  @override
  String get settingsVirtualHighContrast => '高对比度';

  @override
  String get settingsKeepScreenOn => '驾驶时保持屏幕常亮';

  @override
  String get settingsLiveActivity => '实时活动';

  @override
  String get settingsLiveActivityDesc => '在锁定屏幕和灵动岛上显示逐向导航';

  @override
  String get driveRecordingPausedBackground => 'Corvista 在后台期间录制已暂停';

  @override
  String get liveActivityRec => '录制中';

  @override
  String get liveActivityPaused => '已暂停';

  @override
  String get liveActivityDashcamOff => '摄像头关闭';

  @override
  String get liveActivityEnded => '导航已结束';

  @override
  String get liveActivityEta => '到达';

  @override
  String get settingsAutoRecenter => '自动回到当前位置';

  @override
  String get settingsHudStyleClassic => '经典';

  @override
  String get settingsHudStyleGrid => '网格';

  @override
  String get settingsHudStyleMinimal => '极简';

  @override
  String get settingsHudStylePerformance => '性能';

  @override
  String get settingsHudStyleNavigation => '导航';

  @override
  String get settingsHudStyleNight => '夜间';

  @override
  String get settingsHudStyleHighContrast => '高对比度';

  @override
  String get settingsPowerMode => '电源模式';

  @override
  String get settingsPowerBalanced => '均衡';

  @override
  String get settingsPowerPerformance => '性能';

  @override
  String get settingsPowerSaver => '省电';

  @override
  String get settingsPowerFooter =>
      '当 iPhone 发热或电量不足时，Corvista 会自动降低 AI 运行频率和视觉效果。';

  @override
  String get settingsThermal => '温度状态';

  @override
  String get settingsThermalNominal => '正常';

  @override
  String get settingsThermalFair => '偏热';

  @override
  String get settingsThermalSerious => '发烫';

  @override
  String get settingsThermalCritical => '严重过热';

  @override
  String get settingsBattery => '电池';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · 充电中';
  }

  @override
  String get settingsLowPowerMode => '已开启低电量模式——AI 将降频运行。';

  @override
  String get settingsAiRate => '当前 AI 频率';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => '碰撞检测';

  @override
  String settingsEmergencyOn(int seconds) {
    return '开 · 倒计时 $seconds 秒';
  }

  @override
  String get settingsEmergencyFooter => '实验性功能，不能替代紧急服务。';

  @override
  String get settingsTheme => '主题';

  @override
  String get settingsThemeSystem => '跟随系统';

  @override
  String get settingsThemeDark => '深色';

  @override
  String get settingsThemeLight => '浅色';

  @override
  String get settingsReduceMotion => '减少动态效果';

  @override
  String get settingsReduceMotionSubtitle => '减少整个 App 中的动画';

  @override
  String get settingsAppLanguage => 'App 语言';

  @override
  String get settingsPrivacyPolicy => '隐私政策';

  @override
  String get settingsTerms => '使用条款';

  @override
  String get settingsHelp => '帮助';

  @override
  String get settingsSupport => '联系支持';

  @override
  String get settingsLicenses => '开源许可';

  @override
  String get settingsSupportUnavailable =>
      '无法打开“邮件”。请发送邮件至 support@corvista.app。';

  @override
  String get settingsSafety => '安全信息';

  @override
  String get settingsDiagnostics => '诊断';

  @override
  String get settingsVersion => '版本';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => '自定义 HUD';

  @override
  String get hudCustomPreview => '预览 · 示例数值';

  @override
  String get hudCustomStyle => '样式';

  @override
  String get hudCustomElements => '元素';

  @override
  String get hudCustomSpeed => '速度';

  @override
  String get hudCustomHeading => '方位与指南针';

  @override
  String get hudCustomClock => '时钟';

  @override
  String get hudCustomBattery => '电池与温度';

  @override
  String get hudCustomDetections => 'AI 状态与检测';

  @override
  String get hudCustomWeather => '天气';

  @override
  String get hudCustomAppearance => '大小与不透明度';

  @override
  String get hudCustomSize => '大小';

  @override
  String get hudCustomOpacity => '不透明度';

  @override
  String get hudCustomFooter => '即使隐藏了部分元素，过热等警告也会始终显示。';

  @override
  String get hudCustomDescClassic => '均衡的仪表盘';

  @override
  String get hudCustomDescGrid => '叠加在道路上的透视网格';

  @override
  String get hudCustomDescMinimal => '仅显示速度';

  @override
  String get hudCustomDescPerformance => '速度弧线与实时读数';

  @override
  String get hudCustomDescNavigation => '优先显示下一个转向';

  @override
  String get hudCustomDescNight => '调暗并偏红，适合夜间驾驶';

  @override
  String get hudCustomDescHighContrast => '强光下也清晰易读';

  @override
  String get languageTitle => '语言';

  @override
  String get languageSystem => '系统默认';

  @override
  String get languageSystemSubtitle => '跟随 iPhone 的语言';

  @override
  String get languageFooter => '更多语言即将推出。语音提醒的语言可在“提醒”中单独设置。';

  @override
  String get diagTitle => '诊断';

  @override
  String get diagPerformance => '性能';

  @override
  String get diagInference => '推理时间';

  @override
  String get diagDetectHz => '检测频率';

  @override
  String get diagCameraFps => '相机帧率';

  @override
  String get diagMemory => '内存';

  @override
  String get diagDropped => '丢帧';

  @override
  String get diagSegmentation => '分割时间';

  @override
  String get diagCamera => '相机';

  @override
  String get diagStatus => '状态';

  @override
  String get diagSource => '来源';

  @override
  String get diagSourceCamera => '实时相机';

  @override
  String get diagSourceFile => '测试视频文件';

  @override
  String get diagResolution => '缓冲尺寸';

  @override
  String get diagLens => '镜头';

  @override
  String get diagError => '最近一次错误';

  @override
  String get diagModel => 'AI 模型';

  @override
  String get diagModelLoad => '模型载入时间';

  @override
  String get diagPower => '电源';

  @override
  String get diagSegHz => '分割频率';

  @override
  String get diagReduced => '已降低效果';

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
  String get diagCamIdle => '空闲';

  @override
  String get diagCamStarting => '正在启动';

  @override
  String get diagCamRunning => '运行中';

  @override
  String get diagCamInterrupted => '已中断';

  @override
  String get diagCamStopped => '已停止';

  @override
  String get diagCamUnavailable => '不可用';

  @override
  String get diagCamPermissionDenied => '权限被拒绝';

  @override
  String get diagCamError => '错误';

  @override
  String get diagTestFootage => '测试视频';

  @override
  String get diagTestFootageBody => '使用本地视频文件代替相机，运行真实的设备端检测。所有视图都会标注“测试视频”。';

  @override
  String get diagPathLabel => '视频文件路径';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => '使用 Documents/test_drive.mp4';

  @override
  String get diagRun => '运行测试视频';

  @override
  String get diagRunStarted => '测试视频已开始。打开驾驶视图即可查看。';

  @override
  String get diagBackToCamera => '返回实时相机';

  @override
  String get diagDebugOnly => '测试视频仅在开发版本中可用。';

  @override
  String get diagFileMissing => '该路径下没有文件。';

  @override
  String get emergencySetupTitle => '碰撞检测';

  @override
  String get emergencyExperimental => '实验性';

  @override
  String get emergencyIntro =>
      '驾驶期间，Corvista 可借助 iPhone 的运动传感器监测可能发生的严重碰撞。一旦检测到，将开始倒计时；如果你没有取消，Corvista 会提供拨打紧急服务电话并向联系人发送信息的选项。';

  @override
  String get emergencyDisclaimer1 => '不能替代紧急服务，也不能替代车辆自带的碰撞检测。';

  @override
  String get emergencyDisclaimer2 => '拨打电话或发送信息前，iOS 始终会请你确认。';

  @override
  String get emergencyDisclaimer3 => '碰撞可能漏检，急刹车或颠簸也可能被误判为碰撞。';

  @override
  String get emergencyParkedWarning => '请在停车时完成此设置。车辆行驶期间，设置将被锁定。';

  @override
  String get emergencyEnable => '启用碰撞检测';

  @override
  String get emergencyEnableSubtitle => '仅在驾驶过程中有效';

  @override
  String get emergencyNeedNumber => '请先添加紧急电话号码。';

  @override
  String get emergencyContacts => '紧急联系人';

  @override
  String get emergencyAddContact => '添加联系人';

  @override
  String get emergencyNoContacts => '还没有联系人。只有在你确认后，联系人才会收到信息。';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '移除$name？';
  }

  @override
  String get emergencyRemoveContactBody => '发生碰撞后，将不再提供该联系人作为收件人。';

  @override
  String get emergencyRemove => '移除';

  @override
  String get emergencyContactsError => '无法载入联系人。';

  @override
  String get emergencyNumber => '紧急电话号码';

  @override
  String get emergencyNumberHint => '例如 112 或 911';

  @override
  String get emergencyMessage => '信息模板';

  @override
  String get emergencyMessageDefault =>
      '我可能遇到了车祸。此信息由 Corvista 准备，如有可用，将包含我最后已知的位置。';

  @override
  String get emergencyMessageHint => '留空则使用默认信息。';

  @override
  String get emergencyCountdown => '倒计时时长';

  @override
  String get emergencyVoiceCancel => '语音取消';

  @override
  String get emergencyVoiceCancelSubtitle =>
      '倒计时期间说“我没事”或“取消”。在支持的情况下使用设备端语音识别。';

  @override
  String get emergencyVoicePermDenied => '语音取消需要麦克风和语音识别权限。';

  @override
  String get emergencyAutoSave => '自动保存事件片段';

  @override
  String get emergencyTest => '测试倒计时（不拨打电话）';

  @override
  String get emergencyTestBody => '运行一次模拟碰撞，让你查看倒计时。测试模式下不会拨打电话或发送信息。';

  @override
  String get emergencyNotSet => '未设置';

  @override
  String get emergencyAlertHeadline => '检测到可能的严重碰撞。';

  @override
  String get emergencyAlertSubtitle => '你还好吗？';

  @override
  String get emergencyAlertCancel => '我没事 — 取消';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '还剩 $seconds 秒',
      one: '还剩 1 秒',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => '正在聆听 — 说“我没事”即可取消';

  @override
  String emergencyAlertHeard(String text) {
    return '听到：“$text”';
  }

  @override
  String get emergencyAlertEscalated => '没有回应。请选择下一步操作：';

  @override
  String get emergencyAlertCall => '拨打紧急服务电话';

  @override
  String emergencyAlertCallNumber(String number) {
    return '将拨打 $number。iOS 会请你确认。';
  }

  @override
  String get emergencyAlertMessage => '给联系人发信息';

  @override
  String get emergencyAlertMessageSubtitle => '打开已准备好的信息，由你决定是否发送。';

  @override
  String get emergencyAlertTestMode => '测试模式 — 不会拨打电话';

  @override
  String get emergencyAlertTestBadge => '测试';

  @override
  String get emergencyAlertClose => '我没事 — 关闭';

  @override
  String get emergencyMsgSent => '信息已发送。';

  @override
  String get emergencyMsgCancelled => '信息未发送。';

  @override
  String get emergencyMsgFailed => '无法发送信息。';

  @override
  String get emergencyMsgUnavailable => '此设备无法使用信息功能。';

  @override
  String emergencyCallFailed(String number) {
    return '无法发起通话。请自行拨打 $number。';
  }

  @override
  String get modelsTitle => 'AI 模型';

  @override
  String get modelsIntro => '所有模型均内置于 App 中，完全在你的 iPhone 上运行。相机画面绝不会离开设备。';

  @override
  String modelsActiveStats(String ms, String hz) {
    return '实时：每帧 $ms ms · 每秒检测 $hz 次';
  }

  @override
  String modelsLastLoad(String ms) {
    return '载入用时 $ms ms';
  }

  @override
  String get modelsEfficientName => '高效';

  @override
  String get modelsEfficientDesc => '快速小巧的检测器，适合长途驾驶，发热和耗电都较低。';

  @override
  String get modelsEnhancedName => '增强';

  @override
  String get modelsEnhancedDesc => '更大的检测器，可识别更小、更远的物体，但功耗更高。';

  @override
  String get modelsSegmentationName => '分割';

  @override
  String get modelsSegmentationDesc => '将快速检测与路面和物体蒙版相结合，用于“感知”视图。';

  @override
  String get modelsNoneName => 'AI 已暂停';

  @override
  String get modelsNoneDesc => '相机和录制照常运行，但不进行物体检测。功耗最低。';

  @override
  String get modelsGenericDesc => '设备端物体检测模型。';

  @override
  String get modelsFunctionDetection => '检测车辆、行人、自行车、摩托车、公交车、红绿灯和停车标志';

  @override
  String get modelsFunctionSegmentation => '增加路面和物体蒙版';

  @override
  String get modelsFunctionNone => '不检测；仅行车记录';

  @override
  String get modelsSize => '大小';

  @override
  String get modelsInput => '输入';

  @override
  String modelsInputValue(String size) {
    return '$size × $size 像素';
  }

  @override
  String get modelsViews => '适用视图';

  @override
  String get modelsStatusInstalled => '已安装（内置）';

  @override
  String get modelsStatusNotInstalled => '未安装';

  @override
  String get modelsSelected => '已选择';

  @override
  String get modelsUse => '使用此模型';

  @override
  String get modelsSwitching => '正在载入模型…';

  @override
  String modelsSwitched(String name) {
    return '已切换为$name';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return '本机实测：平均 $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => '尚未在本机测量';

  @override
  String get modelsBenchmarkRun => '运行基准测试';

  @override
  String get modelsBenchmarkRunning => '正在测试…';

  @override
  String get modelsBenchmarkSelectHint => '请先选择此模型再进行测试。';

  @override
  String get modelsBenchmarkDone => '基准测试完成';

  @override
  String modelsBenchmarkFailed(String message) {
    return '基准测试失败：$message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return '最后更新：$date';
  }

  @override
  String get safetyTitle => '安全信息';

  @override
  String get safetyIntro =>
      'Corvista 是一款驾驶辅助认知工具，不会控制你的车辆，也无法取代你自己的注意力、判断力或车辆自身的安全系统。';

  @override
  String get safetyBeforeTitle => '驾驶前';

  @override
  String get safetyBefore1 => '将 iPhone 牢固安装在合法的位置，且不要遮挡视线、安全气囊或操控装置。';

  @override
  String get safetyBefore2 => '请在停车时完成设置、选择视图并设定目的地。';

  @override
  String get safetyBefore3 => '长途驾驶时请连接充电器，并尽量避免让手机受阳光直射。';

  @override
  String get safetyWhileTitle => '驾驶中';

  @override
  String get safetyWhile1 => '请始终注视路面。仅在安全且合法的情况下使用屏幕上的大型控件。';

  @override
  String get safetyWhile2 => '提醒只是辅助，不应作为可依赖的警告。没有提醒绝不代表道路畅通。';

  @override
  String get safetyWhile3 => '当与本 App 不一致时，请遵守交通法规、信号和道路标志，而不是本 App。';

  @override
  String get safetyLimitsTitle => '局限性';

  @override
  String get safetyLimits1 => '单个手机摄像头只能看到前方画面。视野之外、被遮挡或距离很近的物体不会被检测到。';

  @override
  String get safetyLimits2 => '检测可能漏检、延迟或有误，在夜间、雨天、雾天、强光眩目或挡风玻璃脏污时尤其如此。';

  @override
  String get safetyLimits3 =>
      '仅识别受支持的类别：车辆、公交车、摩托车、自行车、行人、红绿灯和停车标志。虚拟视图中的车道提示为示意图形，并非检测到的车道。';

  @override
  String get safetyLimits4 => '距离以大致区间显示（极近、较近、中等、较远），绝非实测距离。泊车视图不能替代泊车雷达。';

  @override
  String get safetyHeatTitle => '发热与电池';

  @override
  String get safetyHeat1 =>
      '持续使用相机和 AI 会使 iPhone 发热。设备过热时，Corvista 会降低分析频率并显示警告；如果 iOS 因过热而保护，相机可能会停止。';

  @override
  String get safetyEmergencyTitle => '紧急功能';

  @override
  String get safetyEmergency1 => '可能碰撞检测属于实验性功能，可能漏检真实碰撞，也可能被其他情况误触发。';

  @override
  String get safetyEmergency2 =>
      '它绝不会在你不知情时联系任何人：拨打电话或发送信息前，iOS 始终会请你确认。它不能替代你亲自拨打紧急服务电话。';

  @override
  String get privacyTitle => '隐私';

  @override
  String get privacyIntro =>
      'Corvista 的设计宗旨是将你的驾驶数据保留在 iPhone 上。Corvista 没有账户体系，也不运行自己的服务器。';

  @override
  String get privacyCameraTitle => '相机与 AI';

  @override
  String get privacyCamera1 => '物体检测、追踪和分割完全在你的 iPhone 上运行。相机画面绝不会被上传。';

  @override
  String get privacyCamera2 =>
      '相机仅在 Corvista 显示于屏幕上时运行；App 进入后台时会暂停——不存在隐藏的后台录制。';

  @override
  String get privacyRecordingsTitle => '录像';

  @override
  String get privacyRecordings1 =>
      '循环缓冲是临时的，并会被持续覆盖。只有在你轻点“保存事件”，或在你启用后发生可能的碰撞时，画面才会被保留。';

  @override
  String get privacyRecordings2 =>
      '已存片段保存在 iPhone 上 Corvista 的私有储存空间中。只有在你选择“共享”时，它们才会离开设备。删除 App 时，片段也会一并删除。';

  @override
  String get privacyRecordings3 => '仅当你开启音频录制并授予麦克风权限时，才会录制音频。';

  @override
  String get privacyLocationTitle => '位置';

  @override
  String get privacyLocation1 =>
      'App 打开期间，位置信息用于显示速度、地图、路线和天气。若开启“保存位置”，保存时的位置会随片段存储在你的设备上。';

  @override
  String get privacyNetworkTitle => '网络服务';

  @override
  String get privacyNetwork1 =>
      'Apple 地图 — 地图显示、地点搜索和路线。你的搜索文字和大致位置将发送给 Apple。';

  @override
  String get privacyNetwork2 => 'Apple 天气 (WeatherKit) — 你所在位置的当前和逐小时天气。';

  @override
  String get privacyNetwork4 => 'Corvista 不含广告，也没有第三方分析或追踪。';

  @override
  String get privacyEmergencyTitle => '紧急联系人';

  @override
  String get privacyEmergency1 =>
      '你选择的联系人存储在此设备的 iOS 钥匙串中。在支持的情况下，语音取消使用设备端语音识别。只有在你通过 iOS 确认后，才会拨打电话或发送信息。';

  @override
  String get privacyControlsTitle => '你的控制权';

  @override
  String get privacyControls1 =>
      '你可随时在“片段”中删除片段，也可在“iOS 设置”中更改或撤销相机、麦克风、位置和语音识别权限。';

  @override
  String get termsTitle => '使用条款';

  @override
  String get termsIntro =>
      '使用 Corvista 即表示你同意这些条款。Apple 的标准《许可应用程序最终用户许可协议》同样适用。';

  @override
  String get termsUseTitle => '使用 Corvista';

  @override
  String get termsUse1 => 'Corvista 是驾驶辅助认知和行车记录仪辅助工具。你始终须对安全、合法驾驶负全部责任。';

  @override
  String get termsUse2 => '请勿以分散驾驶注意力的方式操作本 App。请将设备牢固、合法地安装。';

  @override
  String get termsAccuracyTitle => '不保证准确性';

  @override
  String get termsAccuracy1 =>
      '检测结果、区间、提醒、地图标记、路线和天气可能不完整、延迟或有误。Corvista 不会控制你的车辆。';

  @override
  String get termsAccuracy2 => '紧急功能属于实验性功能，可能无法检测到碰撞，也可能误触发。';

  @override
  String get termsRecordingTitle => '录制相关法律';

  @override
  String get termsRecording1 =>
      '各国家和地区对行车记录仪、音频录制和拍摄他人的法律规定各不相同。你有责任遵守这些规定，包括共享片段时。';

  @override
  String get termsLiabilityTitle => '责任';

  @override
  String get termsLiability1 =>
      '本 App 按“现状”提供。在法律允许的范围内，开发者对因使用本 App 或依赖其输出而产生的事故、损失、罚款或损害不承担责任。';

  @override
  String get termsChangesTitle => '变更';

  @override
  String get termsChanges1 => '这些条款可能随 App 新版本更新。更新后继续使用即表示你接受修订后的条款。';

  @override
  String get helpTitle => '帮助';

  @override
  String get helpIntro => '常见问题解答。有关安全指引，请参阅“安全信息”。';

  @override
  String get helpQSave => '如何保留事件的录像？';

  @override
  String get helpASaveBuffer =>
      '在驾驶视图中点按大号的“保存事件”按钮。Corvista 会将滚动缓冲中最近 20 或 30 秒（可在“设置 › 录制”中选择）保存到“片段”。';

  @override
  String get helpQWhere => '我的片段存储在哪里？';

  @override
  String get helpAWhere =>
      '存储在 iPhone 上 Corvista 的私有储存空间中，绝不会上传。可通过播放器中的“共享”发送或导出片段。';

  @override
  String get helpQZones => '距离区间有多准确？';

  @override
  String get helpAZones => '区间是根据典型物体尺寸，由单个摄像头得出的粗略估计。请将其视为大致提示，而不是距离。';

  @override
  String get helpQSlow => '为什么检测会变慢？';

  @override
  String get helpASlow =>
      '当 iPhone 发热、电量不足或开启低电量模式时，Corvista 会降低分析频率以保护设备。你可以在“设置”中更改电源模式。';

  @override
  String get helpQMap => '地图、搜索或天气无法使用。';

  @override
  String get helpAMap => '这些功能需要网络连接和位置访问权限。请检查网络，并在“iOS 设置”中允许 Corvista 访问位置。';

  @override
  String get helpQSimulator => '相机显示为不可用。';

  @override
  String get helpASimulator =>
      '请确认已在“iOS 设置”中允许相机访问，且没有其他 App 正在使用相机。iOS 模拟器没有相机，可改用本地测试视频。';

  @override
  String get emergencyMsgNoContacts => '请先添加紧急联系人。';

  @override
  String get cameraStarting => '正在启动相机…';

  @override
  String get cameraInterrupted => '相机已暂停';

  @override
  String get cameraInterruptedBody =>
      'iOS 已暂停相机，例如在通话期间或其他 App 正在使用相机时。相机会自动恢复。';

  @override
  String get cameraUnavailable => '相机不可用';

  @override
  String get cameraUnavailableBody => '此设备没有可用的相机。检测、录制和泊车视图需要使用后置相机。';

  @override
  String get cameraRunTestFootage => '运行测试视频';

  @override
  String get cameraPermissionDenied => '相机访问已关闭';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista 需要使用相机来进行检测、行车记录和泊车视图。请在“设置”中开启相机访问。';

  @override
  String get cameraError => '相机错误';

  @override
  String get cameraStopped => '相机已停止';

  @override
  String get cameraStart => '启动相机';

  @override
  String get cameraFocusHint => '轻点以对焦';

  @override
  String get cameraPreviewLabel => '带有检测到的物体的实时相机画面';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return '相机 $fps fps · AI $hz Hz · $ms ms · 丢帧 $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return '速度 $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => '无 GPS 速度';

  @override
  String hudHeading(String direction, String degrees) {
    return '方位 $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return '行车记录缓冲录制中，已缓冲 $seconds 秒，目标 $target 秒';
  }

  @override
  String get hudRecIdle => 'REC 关';

  @override
  String get hudRecSaving => '正在保存…';

  @override
  String get hudRecError => 'REC 错误';

  @override
  String get hudAiPaused => 'AI 已暂停';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个物体',
      one: '1 个物体',
      zero: '无物体',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '检测到 $count 个物体',
      one: '检测到 1 个物体',
      zero: '未检测到物体',
    );
    return 'AI 模型 $model，$_temp0';
  }

  @override
  String get hudThermalSerious => '发烫 — AI 已降速';

  @override
  String get hudThermalCritical => '过热 — AI 已暂停';

  @override
  String hudBatteryLow(String percent) {
    return '电量 $percent';
  }

  @override
  String get hudLowPower => '低电量模式';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return '天气 $temperature，$condition。轻点查看详情。';
  }

  @override
  String get hudNoGuidance => '在“地图”视图中搜索目的地，即可在此查看逐向导航。';

  @override
  String get navArrived => '已到达目的地';

  @override
  String get navRerouting => '正在重新规划路线…';

  @override
  String get navSearchHint => '搜索目的地';

  @override
  String get navSearchFieldHint => '地址、地点或商家';

  @override
  String get navNoResults => '没有匹配的地点';

  @override
  String get navSearching => '正在搜索…';

  @override
  String get navSearchStartTyping => '输入地址或地点名称。结果来自 Apple 地图，需要联网。';

  @override
  String get navErrorUnavailable => '搜索和路线暂不可用 — 请检查网络连接。';

  @override
  String get navErrorNoLocation => '正在等待获取位置以规划路线。';

  @override
  String get navErrorPermission => '位置访问已关闭，因此无法从你的当前位置开始规划路线。';

  @override
  String navErrorGeneric(String code) {
    return '无法载入路线（$code）。';
  }

  @override
  String navRoutesTitle(String place) {
    return '前往$place的路线';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return '$time到达';
  }

  @override
  String get navStart => '开始';

  @override
  String get navEnd => '结束';

  @override
  String get navEndLabel => '结束导航';

  @override
  String navRemaining(String distance, String duration) {
    return '剩余 $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return '提示：$text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes 分钟',
      one: '1 分钟',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours 小时 $minutes 分钟';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return '路线 $index：$name';
  }

  @override
  String get weatherTitle => '天气';

  @override
  String weatherFeelsLike(String temperature) {
    return '体感 $temperature';
  }

  @override
  String get weatherPrecipitation => '降水';

  @override
  String get weatherWind => '风';

  @override
  String get weatherVisibility => '能见度';

  @override
  String get weatherHumidity => '湿度';

  @override
  String get weatherHourly => '未来几小时';

  @override
  String weatherAsOf(String time) {
    return '更新于 $time';
  }

  @override
  String get weatherRefresh => '刷新天气';

  @override
  String get weatherUnavailable => '天气暂不可用。';

  @override
  String get weatherNoLocation => '天气需要获取你的位置。';

  @override
  String get weatherLegal => '数据来源与法律信息';

  @override
  String weatherProvidedBy(String service) {
    return '天气数据：$service';
  }

  @override
  String get weatherNow => '现在';

  @override
  String get virtualEmpty => '未检测到受支持的物体';

  @override
  String get virtualEmptyCameraOff => '虚拟视图需要使用实时相机。';

  @override
  String get virtualLaneDisclaimer => '车道线仅为示意，并非检测所得。';

  @override
  String virtualNearest(String zone) {
    return '最近：$zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return '虚拟道路场景：$summary';
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
  String get virtualStatusLive => '运行中';

  @override
  String get virtualStatusPaused => '已暂停';

  @override
  String get virtualStatusCameraOff => '相机已关闭';

  @override
  String get virtualStatusTestFootage => '测试视频';

  @override
  String get virtualEmptyHint => '检测到车辆、行人、自行车、红绿灯和停车标志时会显示在这里。';

  @override
  String get mapRecenter => '回到当前位置';

  @override
  String get mapZoomIn => '放大';

  @override
  String get mapZoomOut => '缩小';

  @override
  String get mapUnsupported => '交互式地图仅在 iPhone 上可用。';

  @override
  String get mapObjectsApprox => '物体标记为大致位置。';

  @override
  String get mapWeatherUnavailable => '天气不可用';

  @override
  String get navErrorNoRoute => '未找到前往此目的地的路线。';

  @override
  String get navDismiss => '忽略';

  @override
  String get navGo => '出发';

  @override
  String get navFastest => '最快';

  @override
  String get navThen => '然后';

  @override
  String get navRecents => '最近';

  @override
  String get navClearRecents => '清除';

  @override
  String get navSearchSubmitHint => '按“搜索”查看所有匹配的地点';

  @override
  String get navPlaces => '地点';

  @override
  String get navEtaLabel => '到达';

  @override
  String get navTimeLeftLabel => '剩余';

  @override
  String get navOverview => '全程概览';

  @override
  String get navMute => '关闭语音播报';

  @override
  String get navUnmute => '开启语音播报';

  @override
  String get navEndConfirm => '结束导航？';

  @override
  String navEndConfirmBody(String place) {
    return '前往$place的导航将停止。';
  }

  @override
  String navArrivedAt(String place) {
    return '已到达$place';
  }

  @override
  String get navDone => '完成';

  @override
  String get navWeakGps => 'GPS 信号弱';

  @override
  String get navLocationOff => '定位已关闭。请开启定位以规划路线和导航。';

  @override
  String get navVoiceGuidance => '语音播报';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance后，$instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first，然后$second';
  }

  @override
  String get navSpeakRerouting => '正在重新规划路线';

  @override
  String get navSpeakArrived => '已到达目的地';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count米',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value公里',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count英尺',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count码',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return '继续行驶$distance';
  }

  @override
  String get navErrorNoDirections => '该地区暂不支持此行程的路线指引。请尝试其他目的地。';

  @override
  String navContinueFor(String distance) {
    return '继续行驶$distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value英里',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return '最近：$object · $zone';
  }

  @override
  String get parkingNothing => '视野内未检测到物体';

  @override
  String get parkingBeeps => '接近提示音';

  @override
  String get parkingVolume => '提示音音量';

  @override
  String get parkingLimitations =>
      '单个摄像头，非 360°。摄像头视野之外的物体不会被检测到。不能替代泊车雷达；估计可能有误，没有提示也不代表周围无障碍。';

  @override
  String parkingTopDownLabel(String summary) {
    return '俯视接近视图。$summary';
  }

  @override
  String get perceptionModeOriginal => '原图';

  @override
  String get perceptionModeBoxes => '边框';

  @override
  String get perceptionModeMasks => '物体蒙版';

  @override
  String get perceptionModeRoad => '路面';

  @override
  String get perceptionModeCombined => '组合';

  @override
  String get perceptionOpacity => '蒙版不透明度';

  @override
  String get perceptionDisclaimer => '路面蒙版只是大致的视觉图层，并不表示可行驶区域或车道。';

  @override
  String get perceptionNeedsModel => '请选择“分割”模型以查看蒙版。';

  @override
  String get perceptionChooseModel => '选择模型';

  @override
  String get perceptionWaiting => '正在等待第一帧分割画面…';

  @override
  String get perceptionShortCamera => '相机';

  @override
  String get perceptionShortBoxes => '框';

  @override
  String get perceptionShortObjects => '物体';

  @override
  String get perceptionShortRoad => '道路';

  @override
  String get perceptionShortAll => '全部';

  @override
  String get perceptionModesLabel => '感知图层';

  @override
  String get perceptionStatusWarmingUp => '正在预热…';

  @override
  String get perceptionStatusLoadingModel => '正在加载模型…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => '蒙版已暂停';

  @override
  String get perceptionLegend => '蒙版图例';

  @override
  String get perceptionUnavailable => '蒙版不可用';

  @override
  String get driveSave => '保存';

  @override
  String get driveSaveIncident => '保存事件';

  @override
  String driveSaveHint(int seconds) {
    return '保存最近 $seconds 秒的行车记录画面';
  }

  @override
  String get driveSaving => '正在保存事件…';

  @override
  String hudRecManualLabel(String time) {
    return '正在录制，$time';
  }

  @override
  String get driveRecord => '录制';

  @override
  String get driveRecordStartA11y => '开始录制';

  @override
  String driveRecordStopA11y(String time) {
    return '停止录制，已录制 $time';
  }

  @override
  String get driveRecordHint => '持续录制直到你停止，包含此前的 5 秒';

  @override
  String get driveRecordFailed => '无法开始录制';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '录制已保存 · 共 $count 段',
      one: '录制已保存',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': '录制已停止：存储空间即将用尽',
      'max_duration': '录制已停止：已达最长时长',
      'camera_stopped': '录制随相机停止而停止',
      'background': '录制已停止：App 已进入后台',
      'thermal': '录制已停止：手机过热',
      'other': '录制已停止',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return '事件已保存 · $duration · $resolution';
  }

  @override
  String get driveSavedView => '查看';

  @override
  String get driveSaveFailed => '无法保存事件。';

  @override
  String get driveSaveNotRunning => '录制尚未开始——请等待相机启动后再试。';

  @override
  String get driveSaveTestFootage => '不会录制测试视频。事件保存仅适用于实时相机。';

  @override
  String get driveSaveStorageFull => '你的 iPhone 储存空间已满。请释放空间或删除较早的片段。';

  @override
  String get driveSaveIoError => '无法将片段写入储存空间。';

  @override
  String get driveClips => '片段';

  @override
  String get driveSettings => '设置';

  @override
  String get driveViewSwitcher => '驾驶视图';

  @override
  String get driveLocationDenied => '位置访问已关闭 — 速度、地图和路线不可用。';

  @override
  String get driveCameraDenied => '相机访问已关闭 — 检测和录制不可用。';

  @override
  String get driveRecorderFallback => '正在无音频录制：麦克风访问已关闭。';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return '录制设置已调整：$reason';
  }

  @override
  String get drivePowerThermalSerious =>
      '你的 iPhone 发烫。AI 将放慢运行以降温——请避免阳光直射，并置于出风口附近。';

  @override
  String get drivePowerThermalCritical =>
      '你的 iPhone 过热。AI 检测将暂停，直到降温；如可能，录制将继续。';

  @override
  String get drivePowerLowPower => '已开启低电量模式——AI 将降频运行。';

  @override
  String get drivePowerBatteryLow => '电量不足——驾驶时请将 iPhone 连接电源。';

  @override
  String get onboardingTitle1 => '看见每一程的更多。';

  @override
  String get onboardingBody1 => '将你的 iPhone 变为智能行车记录仪和驾驶辅助认知伙伴。';

  @override
  String get onboardingTitle2 => '每一帧都有智能。';

  @override
  String get onboardingBody2 => '直接在你的 iPhone 上识别受支持的车辆、行人、自行车和道路信号。';

  @override
  String get onboardingTitle3 => '一条路，多种视角。';

  @override
  String get onboardingBody3 => '在实时检测、虚拟驾驶视图、交互式地图和泊车可视化之间轻松切换。';

  @override
  String get onboardingTitle4 => '留住重要时刻。';

  @override
  String get onboardingBody4 => '保存最近的行车记录画面，回看事件，并共享录像。';

  @override
  String get onboardingTitle5 => '安全与隐私';

  @override
  String get onboardingSafety1 => 'Corvista 是驾驶辅助认知工具。请始终注视路面。';

  @override
  String get onboardingSafety2 => '它不会控制你的车辆，也不能取代你的判断。';

  @override
  String get onboardingSafety3 => '检测和估计可能不准确或有遗漏。';

  @override
  String get onboardingSafety4 => '相机画面在你的 iPhone 上处理 — 视频不会上传。';

  @override
  String get onboardingSafety5 => '地图、搜索、路线和天气需要联网。';

  @override
  String get onboardingSafety6 => '请将 iPhone 牢固安装，避免遮挡视线。';

  @override
  String get onboardingSafety7 => '请在开始驾驶前完成设置。';

  @override
  String get onboardingAcknowledge => '我了解 Corvista 只是辅助认知工具，我仍须对安全驾驶负责。';

  @override
  String get onboardingReadSafety => '阅读完整的安全信息';

  @override
  String get onboardingNext => '下一步';

  @override
  String get onboardingSkip => '跳过';

  @override
  String get onboardingAgree => '继续';

  @override
  String onboardingPageLabel(int current, int total) {
    return '第 $current 页，共 $total 页';
  }

  @override
  String get permTitle => '权限';

  @override
  String get permIntro => 'Corvista 只会请求各项功能所需的权限。你可随时在“设置”中更改。';

  @override
  String get permCameraTitle => '相机';

  @override
  String get permCameraBody => '检测、行车记录和泊车视图所必需。视频在你的 iPhone 上处理。';

  @override
  String get permLocationTitle => '位置';

  @override
  String get permLocationBody =>
      '用于 GPS 速度、地图、路线、天气，以及为已存片段添加位置标记。仅在你使用 App 期间使用。';

  @override
  String get permMicTitle => '麦克风';

  @override
  String get permSpeechNote => '仅当你为紧急提醒开启语音取消时，才会请求语音识别权限。';

  @override
  String get permRequired => '必需';

  @override
  String get permOptional => '可选';

  @override
  String get permAllow => '允许';

  @override
  String get permGranted => '已允许';

  @override
  String get permDenied => '已拒绝';

  @override
  String get permLimited => '受限';

  @override
  String get permRestricted => '受到限制';

  @override
  String get permStart => '开始驾驶';

  @override
  String get permCameraNeeded => '你可以在不开启相机访问的情况下继续，但在“设置”中允许之前，检测和录制将无法使用。';

  @override
  String get permSetupIntro =>
      'Corvista 需要这些权限才能完整运行。点按“全部允许”，iOS 会依次询问每一项。你可以随时在“设置”中更改。';

  @override
  String get permCameraLine => '用于检测、行车记录和泊车视图。视频在你的 iPhone 上处理，绝不会上传。';

  @override
  String get permLocationLine => '用于 GPS 速度、地图、路线、天气以及片段的保存位置。仅在你使用 App 时。';

  @override
  String get permMicLine => '用于在事件片段中录入车内声音，并在紧急提醒期间识别你的取消口令。';

  @override
  String get permSpeechTitle => '语音识别';

  @override
  String get permSpeechLine => '在紧急倒计时期间识别你的取消口令，在支持的情况下于 iPhone 本机完成。';

  @override
  String get permAllowAll => '全部允许';

  @override
  String permAsking(String permission) {
    return '正在请求“$permission”权限…';
  }

  @override
  String get permSomeDenied => '部分权限未开启。请在“设置”中开启以使用相关功能。';

  @override
  String get permNotNow => '暂不';

  @override
  String get tourLabel => '驾驶屏幕导览';

  @override
  String tourProgress(int current, int total) {
    return '第 $current 步，共 $total 步';
  }

  @override
  String get tourNext => '下一步';

  @override
  String get tourBack => '返回';

  @override
  String get tourSkip => '跳过导览';

  @override
  String get tourFinish => '开始驾驶';

  @override
  String get tourWelcomeTitle => '快速导览';

  @override
  String get tourWelcomeBody => '用一分钟了解驾驶屏幕上的要点。建议在停车时进行。';

  @override
  String get tourHudTitle => '仪表条';

  @override
  String get tourHudSpeed => '速度来自 GPS。';

  @override
  String get tourHudRec => 'REC 显示已缓冲的录像秒数。';

  @override
  String get tourHudAi => 'AI 标识显示模型、识别到的物体数量和一个圆点：绿色表示运行中，琥珀色表示受限，红色表示已停止。';

  @override
  String get tourSaveTitle => '保存事件';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista 会持续缓冲最近 $seconds 秒的视频。缓冲内容不断被覆盖，因此除非你点按“保存”，否则不会保留任何内容。已存片段保存在此 iPhone 的“片段”中。';
  }

  @override
  String get tourRecordTitle => '录下整段行程';

  @override
  String get tourRecordBody =>
      '点按“录制”即可持续拍摄，直到你停止。长途行驶会以 5 分钟为一段保存到“片段”，录制期间“保存事件”仍可使用。';

  @override
  String get tourViewsTitle => '五种观察道路的方式';

  @override
  String get tourViewDetection => '实时相机画面，并用方框标出受支持的物体。';

  @override
  String get tourViewVirtual => '根据检测结果生成的简化 3D 场景。';

  @override
  String get tourViewMap => 'Apple 地图，支持搜索和逐向导航。';

  @override
  String get tourViewParking => '相机画面加俯视的近距离视图。';

  @override
  String get tourViewPerception => '道路和物体遮罩。';

  @override
  String get tourMapTitle => '搜索与逐向导航';

  @override
  String get tourMapBody => '打开地图，点按搜索栏并选择目的地。选择路线后，点按“开始”即可获得逐向导航。需要联网。';

  @override
  String get tourClipsTitle => '片段';

  @override
  String get tourClipsBody => '查看、重命名、共享或删除已存事件。除非你共享，否则片段只保存在你的 iPhone 上。';

  @override
  String get tourSettingsTitle => '设置';

  @override
  String get tourSettingsBody =>
      '调整语音提醒及其灵敏度、录制画质和缓冲时长，并设置紧急模式：一项带取消倒计时的实验性碰撞提醒。';

  @override
  String get tourSafetyTitle => '驾驶前须知';

  @override
  String get tourSafety1 => '请将 iPhone 牢固安装在不遮挡视线的位置。';

  @override
  String get tourSafety2 => '驾驶时请勿操作 App。请在停车时完成设置。';

  @override
  String get tourSafety3 => '检测结果和区域均为估算，可能有误或遗漏。';

  @override
  String get tourSafety4 => '安全驾驶的责任仍由你自己承担。';

  @override
  String get helpTakeTour => '查看导览';

  @override
  String get helpTakeTourSub => '一分钟了解驾驶屏幕的引导式导览。';

  @override
  String get tripsTitle => '行程';

  @override
  String get tripsOpen => '行程记录';

  @override
  String get tripsEmptyTitle => '暂无行程';

  @override
  String get tripsEmptyBody => '使用 Corvista 驾驶时会自动记录行程，包括距离、时间、速度和所走路线。';

  @override
  String get tripsDisabledBody =>
      '行程记录已关闭，因此不会记录新的行程。开启后，可在此 iPhone 上私密保存你的路线记录。';

  @override
  String get tripsEnable => '开启行程记录';

  @override
  String get tripsToday => '今天';

  @override
  String get tripsYesterday => '昨天';

  @override
  String tripsRecordingNow(String distance) {
    return '正在记录行程 · $distance';
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
      other: '$count 个事件',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 次提醒',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 次行程',
      zero: '暂无行程',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => '距离';

  @override
  String get tripsStatDuration => '时长';

  @override
  String get tripsStatMoving => '行驶时间';

  @override
  String get tripsStatAvgSpeed => '平均速度';

  @override
  String get tripsStatMaxSpeed => '最高速度';

  @override
  String get tripsDetections => '检测';

  @override
  String get tripsNoDetections => '此行程未记录任何道路物体。';

  @override
  String get tripsTimeline => '时间线';

  @override
  String get tripsEventStart => '行程开始';

  @override
  String get tripsEventEnd => '行程结束';

  @override
  String get tripsEventAlert => '语音提醒';

  @override
  String get tripsEventIncident => '已保存事件片段';

  @override
  String get tripsEventEmergency => '检测到可能的碰撞';

  @override
  String get tripsEventNavStart => '导航已开始';

  @override
  String get tripsEventArrive => '已到达目的地';

  @override
  String get tripsEventReroute => '已重新规划路线';

  @override
  String get tripsEventRecording => '录制已保存';

  @override
  String get tripsOpenClip => '打开片段';

  @override
  String get tripsTrackPreview => 'GPS 轨迹';

  @override
  String get tripsRenameTitle => '重命名行程';

  @override
  String get tripsRenameHint => '行程名称';

  @override
  String get tripsFavorite => '添加到收藏';

  @override
  String get tripsUnfavorite => '从收藏中移除';

  @override
  String get tripsShareGpx => '共享 GPX';

  @override
  String get tripsShareFailed => '无法共享此行程。';

  @override
  String get tripsDelete => '删除行程';

  @override
  String get tripsDeleteConfirmTitle => '删除此行程？';

  @override
  String get tripsDeleteConfirmBody => '路线和统计数据将从此 iPhone 中移除。此行程的事件片段会保留。';

  @override
  String get tripsDeleted => '行程已删除';

  @override
  String get tripsNotFound => '此行程已不存在。';

  @override
  String get tripsPrivacyNote => '仅储存在此 iPhone 上，不会上传任何内容。';

  @override
  String get settingsSectionTrips => '行程记录';

  @override
  String get settingsTripLog => '记录行程';

  @override
  String get settingsTripLogSubtitle => '仅在此 iPhone 上保存你的路线和驾驶统计数据。';

  @override
  String get settingsTripRetention => '行程保留时长';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 年';

  @override
  String get settingsRetentionForever => '永久';

  @override
  String get settingsTripRetentionFooter => '较早的行程会在 Corvista 启动时自动删除。';

  @override
  String get settingsViewTrips => '查看行程';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours 小时 $minutes 分钟';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista 行程 $date';
  }

  @override
  String get settingsFreeUpSpace => '释放空间';

  @override
  String get settingsFreeUpSpaceSubtitle => '移除临时文件和缓存。已存片段和行程会保留。';

  @override
  String settingsFreedBytes(String size) {
    return '已释放 $size';
  }

  @override
  String get settingsNothingToFree => '缓存已清除，没有需要移除的临时文件。';

  @override
  String get settingsSectionPrivacyData => '隐私与数据';

  @override
  String get settingsPrivacyDataFooter =>
      '片段、行程和设置仅存储在这部 iPhone 上，只有在你选择分享时才会离开。';

  @override
  String get settingsDeleteAllData => '删除所有数据';

  @override
  String get settingsDeleteAllDataSubtitle => '从这部 iPhone 中清除片段、行程、联系人和设置';

  @override
  String get deleteAllTitle => '删除所有数据？';

  @override
  String get deleteAllMessage =>
      '这将从这部 iPhone 上永久移除：\n• 事件片段和缩略图\n• 行程记录和 GPS 轨迹\n• 紧急联系人和紧急事件\n• 检测日志和诊断日志\n• 设置和最近的目的地\n• 临时录制缓冲和缓存\n\n此操作无法撤销。之后 Corvista 将从欢迎界面重新开始。';

  @override
  String get deleteAllConfirm => '全部删除';

  @override
  String get deleteAllInProgress => '正在删除…';

  @override
  String get deleteAllDone => '所有数据已删除';

  @override
  String get deleteAllPartial => '部分项目无法删除。请在“设置”中重试。';

  @override
  String get diagLogSection => '诊断日志';

  @override
  String get diagLogFooter =>
      '错误仅记录在这部 iPhone 上，不含位置、联系人姓名或电话号码。除非你自行分享日志，否则不会发送任何内容。';

  @override
  String get diagLogShare => '分享诊断日志';

  @override
  String get diagLogEmpty => '空';

  @override
  String get diagLogClear => '清除日志';

  @override
  String get diagLogClearTitle => '清除诊断日志？';

  @override
  String get diagLogClearBody => '已保存的错误条目将从这部 iPhone 中删除。';

  @override
  String get diagLogCleared => '诊断日志已清除';

  @override
  String get diagLogShareFailed => '无法分享诊断日志。';

  @override
  String get privacyControls2 =>
      '“设置 › 隐私与数据 › 删除所有数据”会清除 Corvista 存储在这部 iPhone 上的每一个片段、行程、联系人、日志和设置。';

  @override
  String get parkingZoneStop => '停车';

  @override
  String get parkingZoneVeryClose => '非常近';

  @override
  String get parkingZoneClose => '较近';

  @override
  String get parkingZoneNothingClose => '未发现近处物体';

  @override
  String get parkingNotDetected => '墙壁、立柱、杆子和路缘不在检测范围内';

  @override
  String get parkingApprox => '约';

  @override
  String get parkingSideLeft => '左';

  @override
  String get parkingSideCenter => '中';

  @override
  String get parkingSideRight => '右';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => '仅限前置相机视野——并非 360° 系统';

  @override
  String get parkingMuteBeeps => '静音提示音';

  @override
  String get parkingUnmuteBeeps => '开启提示音';

  @override
  String get parkingAbout => '关于泊车视图';

  @override
  String get parkingLimitationsDetail =>
      '仅监测相机前方的区域。检测器可识别轿车、公交车和卡车、行人、自行车和摩托车。墙壁、立柱、杆子、路缘、护柱、栏杆和低矮障碍物无法检测，且车头盖可能遮挡正前方的地面。距离是仅凭一台相机（根据物体大小和位置）做出的粗略估计，可能有很大误差。没有提示音或显示“未发现近处物体”，并不代表前方畅通——请务必环顾四周并使用后视镜。';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return '各侧接近程度：左 $left，中 $center，右 $right';
  }

  @override
  String get privacyDiagnostics1 =>
      '错误会写入这部 iPhone 上的私有日志（不含位置、联系人姓名或电话号码）。日志绝不会自动发送；你可以在“设置 › 诊断”中分享或清除。';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => '看見每段旅程的更多細節。';

  @override
  String get commonCancel => '取消';

  @override
  String get commonDelete => '刪除';

  @override
  String get commonSave => '儲存';

  @override
  String get commonBack => '返回';

  @override
  String get commonClose => '關閉';

  @override
  String get commonRetry => '再試一次';

  @override
  String get commonOpenSettings => '開啟設定';

  @override
  String get commonLoading => '載入中…';

  @override
  String get commonError => '發生錯誤。';

  @override
  String commonErrorDetail(String message) {
    return '發生錯誤：$message';
  }

  @override
  String get commonOn => '開啟';

  @override
  String get commonOff => '關閉';

  @override
  String get commonRename => '重新命名';

  @override
  String get commonShare => '分享';

  @override
  String get commonNotAvailable => '無法使用';

  @override
  String get commonTestFootage => '測試影像';

  @override
  String get zoneVeryClose => '非常近';

  @override
  String get zoneClose => '近';

  @override
  String get zoneMedium => '中等';

  @override
  String get zoneFar => '遠';

  @override
  String get zoneUnknown => '未知';

  @override
  String get classPerson => '行人';

  @override
  String get classBicycle => '自行車';

  @override
  String get classMotorcycle => '機車';

  @override
  String get classCar => '車輛';

  @override
  String get classBus => '公車';

  @override
  String get classTrafficLight => '紅綠燈';

  @override
  String get classStopSign => '停止標誌';

  @override
  String get viewDetection => '偵測';

  @override
  String get viewVirtual => '虛擬';

  @override
  String get viewMap => '地圖';

  @override
  String get viewParking => '停車';

  @override
  String get viewPerception => '感知';

  @override
  String get unitKmh => '公里/小時';

  @override
  String get unitMph => '英里/小時';

  @override
  String get lightRed => '紅燈';

  @override
  String get lightYellow => '黃燈';

  @override
  String get lightGreen => '綠燈';

  @override
  String get lightUnknown => '未知';

  @override
  String get clipsTitle => '片段';

  @override
  String get clipsSelect => '選取';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已選取 $count 個',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => '全選';

  @override
  String get clipsDeselectAll => '取消全選';

  @override
  String get clipsDeleteSelected => '刪除所選項目';

  @override
  String get clipsGridView => '格狀檢視';

  @override
  String get clipsListView => '列表檢視';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '要刪除 $count 個片段嗎？',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '影片將從你的 iPhone 永久移除，且無法復原。',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已刪除 $count 個片段',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => '尚無片段';

  @override
  String get clipsEmptyBody =>
      '行車時，Corvista 會持續保留一段短暫的循環緩衝。點一下「儲存事件」，即可將最後幾秒的影像保存在這裡。';

  @override
  String get clipsLoadError => '無法載入你的片段。';

  @override
  String get clipsStorageTitle => '儲存空間';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return '片段 $clips · 緩衝 $buffer · 可用 $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個已儲存的片段',
      zero: '沒有已儲存的片段',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow => '你的 iPhone 儲存空間不足，新的事件可能無法儲存。';

  @override
  String get clipsMissingFile => '找不到檔案';

  @override
  String get clipsEmergencyBadge => '撞擊';

  @override
  String clipsUntitled(String date) {
    return '事件 · $date';
  }

  @override
  String get clipsAudio => '已錄製音訊';

  @override
  String get clipsFavorite => '加入最愛';

  @override
  String get clipsUnfavorite => '從最愛中移除';

  @override
  String get clipsLocation => '已儲存位置';

  @override
  String clipsOpenClip(String title) {
    return '開啟片段 $title';
  }

  @override
  String get playerNotFoundTitle => '找不到片段';

  @override
  String get playerNotFoundBody => '此片段可能已被刪除。';

  @override
  String get playerMissingTitle => '影片檔案遺失';

  @override
  String get playerMissingBody => '此片段的錄影已不在你的 iPhone 上。你可以從圖庫中移除此項目。';

  @override
  String get playerRemoveEntry => '移除項目';

  @override
  String get playerLoadError => '無法播放此影片。';

  @override
  String get playerPlay => '播放';

  @override
  String get playerPause => '暫停';

  @override
  String get playerReplay => '重播';

  @override
  String get playerRenameTitle => '重新命名片段';

  @override
  String get playerRenameHint => '片段名稱';

  @override
  String get playerRenamed => '片段已重新命名';

  @override
  String get playerFavorited => '已加入最愛';

  @override
  String get playerUnfavorited => '已從最愛移除';

  @override
  String get playerShareFailed => '無法分享此片段。';

  @override
  String get playerDetails => '詳細資訊';

  @override
  String get playerDate => '錄製時間';

  @override
  String get playerDuration => '長度';

  @override
  String get playerResolution => '解析度';

  @override
  String get playerSize => '檔案大小';

  @override
  String get playerAudio => '音訊';

  @override
  String get playerAudioYes => '已錄製';

  @override
  String get playerAudioNo => '未錄製';

  @override
  String get playerReason => '儲存方式';

  @override
  String get playerReasonManual => '「儲存事件」按鈕';

  @override
  String get playerReasonEmergency => '可能的撞擊偵測';

  @override
  String get playerReasonRecovered => '中斷後復原';

  @override
  String get playerSpeed => '儲存時的 GPS 速度';

  @override
  String get playerLocation => '位置';

  @override
  String get playerOpenInMaps => '在「地圖」中開啟';

  @override
  String get playerBack => '返回';

  @override
  String get playerMore => '更多操作';

  @override
  String get clipsFilterLabel => '顯示';

  @override
  String get clipsFilterAll => '全部';

  @override
  String get clipsFilterRecordings => '錄影';

  @override
  String get clipsFilterIncidents => '事件';

  @override
  String get clipsFilterEmergency => '緊急';

  @override
  String get clipsFilterFavorites => '最愛';

  @override
  String get clipsSort => '排序';

  @override
  String get clipsSortNewest => '最新優先';

  @override
  String get clipsSortOldest => '最舊優先';

  @override
  String get clipsSortLongest => '最長優先';

  @override
  String get clipsSortLargest => '最大優先';

  @override
  String get clipsToday => '今天';

  @override
  String get clipsYesterday => '昨天';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個片段',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => '此類別尚無片段。';

  @override
  String get clipsFavoritesEmpty => '為片段加上星號，即可保留在這裡方便快速存取。';

  @override
  String get clipsKindRecording => '錄影';

  @override
  String get clipsKindIncident => '事件';

  @override
  String get clipsKindEmergency => '緊急';

  @override
  String get clipsKindTest => '測試';

  @override
  String clipsTripChip(String time) {
    return '行程 · $time';
  }

  @override
  String get clipsOpenTrip => '開啟錄製此片段的行程';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '已使用 $used · 可用 $free';
  }

  @override
  String clipsStorageClips(String size) {
    return '片段佔用 $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個錄影',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個事件',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個緊急事件',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => '釋出空間';

  @override
  String get clipsStorageLowGentle => '可用空間不足 2 GB。為確保錄影順暢，請釋出空間或移除不再需要的片段。';

  @override
  String get clipsSaveToPhotos => '儲存到照片';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個片段',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '要刪除 $count 個片段（$size）嗎？',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return '正在儲存到照片（$done/$total）…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已將 $count 個片段儲存到照片',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '已儲存 $saved 個到照片 · $failed 個無法儲存';
  }

  @override
  String get clipsPhotosDenied => 'Corvista 未獲准將影片加入照片。你可以在「設定」中允許。';

  @override
  String get clipsPhotosFailed => '無法儲存到照片。';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已將 $count 個片段加入最愛',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已將 $count 個片段從最愛移除',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title（已剪輯）';
  }

  @override
  String get playerTrim => '剪輯';

  @override
  String get playerInfo => '資訊';

  @override
  String get playerKind => '類型';

  @override
  String get playerReasonRecording => '「錄影」按鈕';

  @override
  String get trimTitle => '剪輯片段';

  @override
  String get trimHint => '拖曳控制點選擇要保留的部分。原始片段不會變動。';

  @override
  String get trimStartHandle => '剪輯起點';

  @override
  String get trimEndHandle => '剪輯終點';

  @override
  String trimSelection(String duration) {
    return '已選取 $duration';
  }

  @override
  String get trimSave => '儲存為新片段';

  @override
  String get trimSaving => '正在儲存剪輯後的片段…';

  @override
  String get trimSaved => '已儲存剪輯後的片段';

  @override
  String get trimOpenNew => '開啟';

  @override
  String get trimFailed => '無法剪輯此片段。';

  @override
  String get trimStorageFull => '可用空間不足，無法儲存剪輯後的片段。';

  @override
  String get trimPreview => '播放所選範圍';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsSectionCamera => '相機';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => '提醒';

  @override
  String get settingsSectionAlertCategories => '提醒類別';

  @override
  String get settingsSectionRecording => '錄影';

  @override
  String get settingsSectionDriving => '駕駛';

  @override
  String get settingsSectionPower => '電源';

  @override
  String get settingsSectionEmergency => '緊急';

  @override
  String get settingsSectionAppearance => '外觀';

  @override
  String get settingsSectionLanguage => '語言';

  @override
  String get settingsSectionInformation => '資訊';

  @override
  String get settingsCameraLens => '相機鏡頭';

  @override
  String get settingsLensWide => '廣角';

  @override
  String get settingsLensUltraWide => '超廣角';

  @override
  String get settingsLensTelephoto => '望遠';

  @override
  String get settingsLensUnavailable => '此 iPhone 不支援';

  @override
  String get settingsStabilization => '穩定功能';

  @override
  String get settingsStabAuto => '自動';

  @override
  String get settingsStabOff => '關閉';

  @override
  String get settingsStabStandard => '標準';

  @override
  String get settingsStabCinematic => '電影級';

  @override
  String get settingsOverlayOpacity => '疊層不透明度';

  @override
  String get settingsShowFps => '顯示效能統計';

  @override
  String get settingsShowFpsSubtitle => '在偵測檢視中顯示影格率與推論時間';

  @override
  String get settingsCameraFooter => '鏡頭與穩定功能的變更將於下次啟動相機時生效。';

  @override
  String get settingsAiModel => 'AI 模型';

  @override
  String get settingsConfidence => '偵測信心度';

  @override
  String get settingsTracking => '物件追蹤';

  @override
  String get settingsTrackingSubtitle => '讓物件在影格之間保持穩定';

  @override
  String get settingsShowLabels => '顯示標籤';

  @override
  String get settingsShowConfidence => '顯示信心度';

  @override
  String get settingsSegmentationOpacity => '感知遮罩不透明度';

  @override
  String get settingsAiFooter => '信心度較低時會顯示更多物件，但誤判也會增加。偵測結果可能不準確。';

  @override
  String get settingsVoiceAlerts => '語音提醒';

  @override
  String get settingsVoiceLanguage => '語音語言';

  @override
  String get settingsVoiceLanguageAuto => '與 App 語言相同';

  @override
  String get settingsVoice => '語音';

  @override
  String get settingsVoiceDefault => '系統預設';

  @override
  String get settingsVoiceQualityEnhanced => '強化';

  @override
  String get settingsVoiceQualityPremium => '高品質';

  @override
  String get settingsNoVoices => '尚未安裝此語言的語音。請前往 iOS「設定」›「輔助使用」›「朗讀內容」新增。';

  @override
  String get settingsAlertPedestrian => '行人';

  @override
  String get settingsAlertCyclist => '自行車騎士';

  @override
  String get settingsAlertMotorcycle => '機車';

  @override
  String get settingsAlertBus => '公車';

  @override
  String get settingsAlertVehicleClose => '前方車輛非常近';

  @override
  String get settingsAlertTrafficLight => '紅綠燈變換';

  @override
  String get settingsAlertTrafficMoving => '前方車流開始移動';

  @override
  String get settingsAlertStopSign => '停止標誌';

  @override
  String get settingsSensitivity => '靈敏度';

  @override
  String get settingsSensitivityLow => '低';

  @override
  String get settingsSensitivityMedium => '中';

  @override
  String get settingsSensitivityHigh => '高';

  @override
  String get settingsCooldown => '重複間隔';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get settingsVolume => '語音音量';

  @override
  String get settingsQuietMode => '安靜模式';

  @override
  String get settingsQuietModeSubtitle => '僅播報最重要的提醒';

  @override
  String get settingsTestVoice => '測試語音';

  @override
  String get settingsTestVoiceDone => '正在播放範例提醒…';

  @override
  String get settingsParkingBeeps => '停車提示音';

  @override
  String get settingsBeepVolume => '提示音音量';

  @override
  String get settingsAlertsFooter => '提醒僅供輔助。請隨時留意路況，沒有提醒並不代表前方道路暢通。';

  @override
  String get settingsRecordingProfile => '錄影品質';

  @override
  String get settingsProfileStandard => '標準 · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => '事件緩衝';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get settingsManualMaxLength => '手動錄影長度上限';

  @override
  String get settingsManualMaxUnlimited => '不限';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes 分鐘';
  }

  @override
  String get settingsRecordAudio => '錄製音訊';

  @override
  String get settingsRecordAudioSubtitle => '已儲存的事件會包含車內聲音';

  @override
  String get settingsMicDenied => '麥克風存取已關閉。請在「設定」中允許後才能錄製音訊。';

  @override
  String get settingsWatermark => 'Corvista 浮水印';

  @override
  String get settingsTimestamp => '日期與時間戳記';

  @override
  String get settingsSaveLocation => '隨片段儲存位置';

  @override
  String get settingsStorage => '儲存空間與片段';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個片段',
      zero: '沒有片段',
    );
    return '$_temp0 · 已用 $used · 可用 $free';
  }

  @override
  String get settingsRecordingFooter =>
      '循環緩衝僅儲存在你的 iPhone 上，並會持續被覆寫。App 不會在背景錄影。';

  @override
  String get settingsDefaultView => '預設檢視';

  @override
  String get settingsUnits => '單位';

  @override
  String get settingsShowCompass => '顯示羅盤';

  @override
  String get settingsHudStyle => 'HUD 樣式';

  @override
  String get settingsHudCustomize => '自訂 HUD';

  @override
  String get settingsDrivingSide => '行車方向';

  @override
  String get settingsDrivingSideAuto => '自動';

  @override
  String get settingsDrivingSideRight => '靠右';

  @override
  String get settingsDrivingSideLeft => '靠左';

  @override
  String get settingsVirtualStyle => '虛擬檢視樣式';

  @override
  String get settingsVirtualMinimal => '極簡';

  @override
  String get settingsVirtualPerspective => '透視';

  @override
  String get settingsVirtualHighContrast => '高對比';

  @override
  String get settingsKeepScreenOn => '行車時保持螢幕開啟';

  @override
  String get settingsLiveActivity => '即時動態';

  @override
  String get settingsLiveActivityDesc => '在鎖定畫面與動態島上顯示轉彎導航';

  @override
  String get driveRecordingPausedBackground => 'Corvista 在背景執行時，錄影已暫停';

  @override
  String get liveActivityRec => '錄影';

  @override
  String get liveActivityPaused => '已暫停';

  @override
  String get liveActivityDashcamOff => '相機關閉';

  @override
  String get liveActivityEnded => '導航已結束';

  @override
  String get liveActivityEta => '抵達';

  @override
  String get settingsAutoRecenter => '自動回到目前位置';

  @override
  String get settingsHudStyleClassic => '經典';

  @override
  String get settingsHudStyleGrid => '網格';

  @override
  String get settingsHudStyleMinimal => '極簡';

  @override
  String get settingsHudStylePerformance => '效能';

  @override
  String get settingsHudStyleNavigation => '導航';

  @override
  String get settingsHudStyleNight => '夜間';

  @override
  String get settingsHudStyleHighContrast => '高對比';

  @override
  String get settingsPowerMode => '電源模式';

  @override
  String get settingsPowerBalanced => '平衡';

  @override
  String get settingsPowerPerformance => '效能';

  @override
  String get settingsPowerSaver => '省電';

  @override
  String get settingsPowerFooter =>
      '當 iPhone 溫度升高或電量偏低時，Corvista 會自動降低 AI 頻率與視覺效果。';

  @override
  String get settingsThermal => '溫度狀態';

  @override
  String get settingsThermalNominal => '正常';

  @override
  String get settingsThermalFair => '偏熱';

  @override
  String get settingsThermalSerious => '過熱';

  @override
  String get settingsThermalCritical => '嚴重';

  @override
  String get settingsBattery => '電池';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · 充電中';
  }

  @override
  String get settingsLowPowerMode => '低電量模式已開啟，AI 將以較低頻率執行。';

  @override
  String get settingsAiRate => '目前 AI 頻率';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => '撞擊偵測';

  @override
  String settingsEmergencyOn(int seconds) {
    return '開啟 · 倒數 $seconds 秒';
  }

  @override
  String get settingsEmergencyFooter => '實驗性功能，無法取代緊急救援服務。';

  @override
  String get settingsTheme => '主題';

  @override
  String get settingsThemeSystem => '系統';

  @override
  String get settingsThemeDark => '深色';

  @override
  String get settingsThemeLight => '淺色';

  @override
  String get settingsReduceMotion => '減少動態效果';

  @override
  String get settingsReduceMotionSubtitle => '減少整個 App 中的動畫';

  @override
  String get settingsAppLanguage => 'App 語言';

  @override
  String get settingsPrivacyPolicy => '隱私權政策';

  @override
  String get settingsTerms => '使用條款';

  @override
  String get settingsHelp => '說明';

  @override
  String get settingsSupport => '聯絡支援';

  @override
  String get settingsLicenses => '開放原始碼授權';

  @override
  String get settingsSupportUnavailable =>
      '無法開啟「郵件」。請寄信至 support@corvista.app。';

  @override
  String get settingsSafety => '安全資訊';

  @override
  String get settingsDiagnostics => '診斷';

  @override
  String get settingsVersion => '版本';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => '自訂 HUD';

  @override
  String get hudCustomPreview => '預覽 · 範例數值';

  @override
  String get hudCustomStyle => '樣式';

  @override
  String get hudCustomElements => '元素';

  @override
  String get hudCustomSpeed => '速度';

  @override
  String get hudCustomHeading => '方向與羅盤';

  @override
  String get hudCustomClock => '時鐘';

  @override
  String get hudCustomBattery => '電池與溫度';

  @override
  String get hudCustomDetections => 'AI 狀態與偵測';

  @override
  String get hudCustomWeather => '天氣';

  @override
  String get hudCustomAppearance => '大小與不透明度';

  @override
  String get hudCustomSize => '大小';

  @override
  String get hudCustomOpacity => '不透明度';

  @override
  String get hudCustomFooter => '過熱等警告一律會顯示，即使已隱藏其他元素。';

  @override
  String get hudCustomDescClassic => '均衡的儀表板';

  @override
  String get hudCustomDescGrid => '路面上的透視網格';

  @override
  String get hudCustomDescMinimal => '只顯示速度，其他皆不顯示';

  @override
  String get hudCustomDescPerformance => '速度弧線搭配即時讀數';

  @override
  String get hudCustomDescNavigation => '優先顯示下一個動作';

  @override
  String get hudCustomDescNight => '調暗並偏紅，適合夜間行車';

  @override
  String get hudCustomDescHighContrast => '在強烈陽光下也清晰易讀';

  @override
  String get languageTitle => '語言';

  @override
  String get languageSystem => '系統預設';

  @override
  String get languageSystemSubtitle => '跟隨 iPhone 的語言';

  @override
  String get languageFooter => '即將支援更多語言。語音提醒的語言可在「提醒」中另行設定。';

  @override
  String get diagTitle => '診斷';

  @override
  String get diagPerformance => '效能';

  @override
  String get diagInference => '推論時間';

  @override
  String get diagDetectHz => '偵測頻率';

  @override
  String get diagCameraFps => '相機影格率';

  @override
  String get diagMemory => '記憶體';

  @override
  String get diagDropped => '遺失影格';

  @override
  String get diagSegmentation => '分割時間';

  @override
  String get diagCamera => '相機';

  @override
  String get diagStatus => '狀態';

  @override
  String get diagSource => '來源';

  @override
  String get diagSourceCamera => '即時相機';

  @override
  String get diagSourceFile => '測試影像檔案';

  @override
  String get diagResolution => '緩衝大小';

  @override
  String get diagLens => '鏡頭';

  @override
  String get diagError => '最近的錯誤';

  @override
  String get diagModel => 'AI 模型';

  @override
  String get diagModelLoad => '模型載入時間';

  @override
  String get diagPower => '電源';

  @override
  String get diagSegHz => '分割頻率';

  @override
  String get diagReduced => '已降低效果';

  @override
  String diagMs(String value) {
    return '$value 毫秒';
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
  String get diagCamIdle => '閒置';

  @override
  String get diagCamStarting => '啟動中';

  @override
  String get diagCamRunning => '執行中';

  @override
  String get diagCamInterrupted => '已中斷';

  @override
  String get diagCamStopped => '已停止';

  @override
  String get diagCamUnavailable => '無法使用';

  @override
  String get diagCamPermissionDenied => '權限遭拒';

  @override
  String get diagCamError => '錯誤';

  @override
  String get diagTestFootage => '測試影像';

  @override
  String get diagTestFootageBody => '以本機影片檔案取代相機，在裝置上執行真實偵測。每個檢視都會標示「測試影像」。';

  @override
  String get diagPathLabel => '影片檔案路徑';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => '使用 Documents/test_drive.mp4';

  @override
  String get diagRun => '執行測試影像';

  @override
  String get diagRunStarted => '測試影像已開始。請開啟行車檢視查看。';

  @override
  String get diagBackToCamera => '返回即時相機';

  @override
  String get diagDebugOnly => '測試影像僅適用於開發版本。';

  @override
  String get diagFileMissing => '該路徑沒有檔案。';

  @override
  String get emergencySetupTitle => '撞擊偵測';

  @override
  String get emergencyExperimental => '實驗性';

  @override
  String get emergencyIntro =>
      '行車期間，Corvista 可利用 iPhone 的動作感測器留意可能發生的嚴重撞擊。一旦偵測到，便會開始倒數。若你未取消，Corvista 會提供撥打緊急服務並傳訊給你的聯絡人的選項。';

  @override
  String get emergencyDisclaimer1 => '無法取代緊急服務或車輛本身的碰撞偵測功能。';

  @override
  String get emergencyDisclaimer2 => '在撥出電話或傳送訊息之前，iOS 一律會請你確認。';

  @override
  String get emergencyDisclaimer3 => '撞擊可能被漏掉，而急煞或顛簸也可能被誤判為撞擊。';

  @override
  String get emergencyParkedWarning => '請在停車時完成此設定。車輛行駛中，設定會被鎖定。';

  @override
  String get emergencyEnable => '啟用撞擊偵測';

  @override
  String get emergencyEnableSubtitle => '僅在行車期間啟用';

  @override
  String get emergencyNeedNumber => '請先新增緊急電話號碼。';

  @override
  String get emergencyContacts => '緊急聯絡人';

  @override
  String get emergencyAddContact => '新增聯絡人';

  @override
  String get emergencyNoContacts => '尚無聯絡人。只有在你確認後，才會傳訊給聯絡人。';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '要移除 $name 嗎？';
  }

  @override
  String get emergencyRemoveContactBody => '撞擊發生後，將不再提供此人作為收件人。';

  @override
  String get emergencyRemove => '移除';

  @override
  String get emergencyContactsError => '無法載入聯絡人。';

  @override
  String get emergencyNumber => '緊急電話號碼';

  @override
  String get emergencyNumberHint => '例如 110 或 119';

  @override
  String get emergencyMessage => '訊息範本';

  @override
  String get emergencyMessageDefault =>
      '我可能發生了車禍。此訊息由 Corvista 預先準備，並附上我最後已知的位置（若有）。';

  @override
  String get emergencyMessageHint => '留空即使用預設訊息。';

  @override
  String get emergencyCountdown => '倒數秒數';

  @override
  String get emergencyVoiceCancel => '語音取消';

  @override
  String get emergencyVoiceCancelSubtitle =>
      '倒數期間說「我沒事」或「取消」。在支援的情況下使用裝置端語音辨識。';

  @override
  String get emergencyVoicePermDenied => '語音取消需要麥克風與語音辨識的存取權限。';

  @override
  String get emergencyAutoSave => '自動儲存事件片段';

  @override
  String get emergencyTest => '測試倒數（不撥打電話）';

  @override
  String get emergencyTestBody => '執行模擬撞擊，讓你查看倒數畫面。測試模式下絕不會撥打電話或傳送訊息。';

  @override
  String get emergencyNotSet => '未設定';

  @override
  String get emergencyAlertHeadline => '偵測到可能的嚴重撞擊。';

  @override
  String get emergencyAlertSubtitle => '你還好嗎？';

  @override
  String get emergencyAlertCancel => '我沒事 — 取消';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '剩餘 $seconds 秒',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => '聆聽中 — 說「我沒事」即可取消';

  @override
  String emergencyAlertHeard(String text) {
    return '聽到：「$text」';
  }

  @override
  String get emergencyAlertEscalated => '沒有回應。請選擇接下來的做法：';

  @override
  String get emergencyAlertCall => '撥打緊急服務';

  @override
  String emergencyAlertCallNumber(String number) {
    return '撥打 $number。iOS 會請你確認。';
  }

  @override
  String get emergencyAlertMessage => '傳訊給聯絡人';

  @override
  String get emergencyAlertMessageSubtitle => '開啟預先準備的訊息，由你決定是否傳送。';

  @override
  String get emergencyAlertTestMode => '測試模式 — 不會撥打電話';

  @override
  String get emergencyAlertTestBadge => '測試';

  @override
  String get emergencyAlertClose => '我沒事 — 關閉';

  @override
  String get emergencyMsgSent => '訊息已傳送。';

  @override
  String get emergencyMsgCancelled => '訊息未傳送。';

  @override
  String get emergencyMsgFailed => '無法傳送訊息。';

  @override
  String get emergencyMsgUnavailable => '此裝置無法傳送訊息。';

  @override
  String emergencyCallFailed(String number) {
    return '無法發起通話。請自行撥打 $number。';
  }

  @override
  String get modelsTitle => 'AI 模型';

  @override
  String get modelsIntro => '所有模型皆內建於 App 中，並完全在你的 iPhone 上執行。你的相機影像絕不會離開裝置。';

  @override
  String modelsActiveStats(String ms, String hz) {
    return '即時：每影格 $ms 毫秒 · 每秒 $hz 次偵測';
  }

  @override
  String modelsLastLoad(String ms) {
    return '載入耗時 $ms 毫秒';
  }

  @override
  String get modelsEfficientName => '高效';

  @override
  String get modelsEfficientDesc => '快速精簡的偵測器，專為長途駕駛調校，發熱與耗電量低。';

  @override
  String get modelsEnhancedName => '增強';

  @override
  String get modelsEnhancedDesc => '較大的偵測器，可找出更小、更遠的物件，但耗電量較高。';

  @override
  String get modelsSegmentationName => '分割';

  @override
  String get modelsSegmentationDesc => '結合快速偵測與路面及物件遮罩，用於感知檢視。';

  @override
  String get modelsNoneName => 'AI 已暫停';

  @override
  String get modelsNoneDesc => '相機與錄影持續運作，但不進行物件偵測。耗電量最低。';

  @override
  String get modelsGenericDesc => '裝置端物件偵測模型。';

  @override
  String get modelsFunctionDetection => '偵測車輛、行人、自行車、機車、公車、紅綠燈與停止標誌';

  @override
  String get modelsFunctionSegmentation => '新增路面與物件遮罩';

  @override
  String get modelsFunctionNone => '不進行偵測；僅行車記錄';

  @override
  String get modelsSize => '大小';

  @override
  String get modelsInput => '輸入';

  @override
  String modelsInputValue(String size) {
    return '$size × $size 像素';
  }

  @override
  String get modelsViews => '適用檢視';

  @override
  String get modelsStatusInstalled => '已安裝（內建）';

  @override
  String get modelsStatusNotInstalled => '未安裝';

  @override
  String get modelsSelected => '已選取';

  @override
  String get modelsUse => '使用此模型';

  @override
  String get modelsSwitching => '正在載入模型…';

  @override
  String modelsSwitched(String name) {
    return '已啟用 $name';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return '於此裝置實測：平均 $ms 毫秒';
  }

  @override
  String get modelsBenchmarkNotMeasured => '尚未在此裝置上測量';

  @override
  String get modelsBenchmarkRun => '執行效能測試';

  @override
  String get modelsBenchmarkRunning => '正在進行效能測試…';

  @override
  String get modelsBenchmarkSelectHint => '請先選取此模型，才能進行效能測試。';

  @override
  String get modelsBenchmarkDone => '效能測試完成';

  @override
  String modelsBenchmarkFailed(String message) {
    return '效能測試失敗：$message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return '最後更新：$date';
  }

  @override
  String get safetyTitle => '安全資訊';

  @override
  String get safetyIntro =>
      'Corvista 是輔助駕駛人留意路況的工具。它不會控制你的車輛，也無法取代你自己的注意力、判斷力或車輛的安全系統。';

  @override
  String get safetyBeforeTitle => '出發前';

  @override
  String get safetyBefore1 => '將 iPhone 穩固固定在合法的位置，且不得遮擋視線、安全氣囊或操作裝置。';

  @override
  String get safetyBefore2 => '請在停車時完成設定、選擇檢視並設定目的地。';

  @override
  String get safetyBefore3 => '長途駕駛時請連接充電器，並盡可能避免讓手機受到陽光直射。';

  @override
  String get safetyWhileTitle => '行車時';

  @override
  String get safetyWhile1 => '視線請保持在道路上。僅在安全且合法的情況下，才使用螢幕上的大型控制項。';

  @override
  String get safetyWhile2 => '提醒僅為輔助，並非可完全依賴的警告。沒有提醒並不代表前方道路暢通。';

  @override
  String get safetyWhile3 => '若與 App 的提示不一致，請遵守交通法規、號誌與標誌，而非依據 App。';

  @override
  String get safetyLimitsTitle => '限制';

  @override
  String get safetyLimits1 => '單一手機鏡頭只能看到前方的景象。視野之外、被遮擋或距離過近的物件將無法偵測。';

  @override
  String get safetyLimits2 => '偵測可能漏掉、延遲或出錯，尤其是在夜間、下雨、起霧、眩光或擋風玻璃髒污時。';

  @override
  String get safetyLimits3 =>
      '僅能辨識支援的類別：車輛、公車、機車、自行車、行人、紅綠燈與停止標誌。虛擬檢視中的車道提示為風格化示意，並非偵測到的車道。';

  @override
  String get safetyLimits4 => '距離以大致區域顯示（非常近、近、中等、遠），絕非實測距離。停車檢視無法取代停車感應器。';

  @override
  String get safetyHeatTitle => '發熱與電池';

  @override
  String get safetyHeat1 =>
      '持續使用相機與 AI 會使 iPhone 發熱。裝置過熱時，Corvista 會降低分析頻率並顯示警告；若 iOS 過熱，相機可能會停止運作。';

  @override
  String get safetyEmergencyTitle => '緊急功能';

  @override
  String get safetyEmergency1 => '可能撞擊偵測屬於實驗性功能，可能漏掉真正的碰撞，也可能被其他事件誤觸發。';

  @override
  String get safetyEmergency2 =>
      '它絕不會悄悄聯絡任何人：iOS 一律會請你確認通話或訊息。它無法取代你自行撥打緊急服務電話。';

  @override
  String get privacyTitle => '隱私權';

  @override
  String get privacyIntro =>
      'Corvista 的設計宗旨是讓你的行車資料保留在 iPhone 上。沒有 Corvista 帳號，Corvista 也不運行自己的伺服器。';

  @override
  String get privacyCameraTitle => '相機與 AI';

  @override
  String get privacyCamera1 => '物件偵測、追蹤與分割皆完全在你的 iPhone 上執行。相機影格絕不會被上傳。';

  @override
  String get privacyCamera2 =>
      '相機僅在 Corvista 於螢幕上開啟時運作。App 進入背景時會暫停，不會有隱藏的背景錄影。';

  @override
  String get privacyRecordingsTitle => '錄影';

  @override
  String get privacyRecordings1 =>
      '循環緩衝為暫存性質，並持續被覆寫。只有在你點選「儲存事件」，或你啟用後發生可能的撞擊時，才會保留影像。';

  @override
  String get privacyRecordings2 =>
      '已儲存的片段保存在 iPhone 上 Corvista 的私有儲存空間中，僅在你選擇「分享」時才會離開裝置。刪除 App 時也會一併刪除。';

  @override
  String get privacyRecordings3 => '僅在你開啟並授予麥克風存取權限時，才會錄製音訊。';

  @override
  String get privacyLocationTitle => '位置';

  @override
  String get privacyLocation1 =>
      'App 開啟期間，位置資訊用於顯示車速、地圖、路線與天氣。若開啟「隨片段儲存位置」，儲存當下的位置會與片段一同存放在你的裝置上。';

  @override
  String get privacyNetworkTitle => '網路服務';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — 地圖顯示、地點搜尋與路線。你的搜尋文字與大致位置會傳送給 Apple。';

  @override
  String get privacyNetwork2 => 'Apple Weather (WeatherKit) — 你所在位置的目前與逐時天氣。';

  @override
  String get privacyNetwork4 => 'Corvista 不含廣告，也沒有第三方分析或追蹤。';

  @override
  String get privacyEmergencyTitle => '緊急聯絡人';

  @override
  String get privacyEmergency1 =>
      '你選擇的聯絡人會儲存在此裝置的 iOS 鑰匙圈中。在支援的情況下，語音取消使用裝置端語音辨識。只有在你於 iOS 中確認後，才會撥打電話或傳送訊息。';

  @override
  String get privacyControlsTitle => '你的控制權';

  @override
  String get privacyControls1 =>
      '你可隨時在「片段」中刪除片段，並在 iOS「設定」中變更或撤銷相機、麥克風、位置與語音的存取權限。';

  @override
  String get termsTitle => '使用條款';

  @override
  String get termsIntro =>
      '使用 Corvista 即表示你同意這些條款。Apple 標準的《授權應用程式使用者授權合約》亦適用。';

  @override
  String get termsUseTitle => '使用 Corvista';

  @override
  String get termsUse1 => 'Corvista 是輔助駕駛人留意路況與行車記錄的工具。你仍須隨時為安全且合法的駕駛負完全責任。';

  @override
  String get termsUse2 => '請勿在駕駛時以會讓你分心的方式操作 App。請將裝置穩固且合法地固定。';

  @override
  String get termsAccuracyTitle => '不保證準確性';

  @override
  String get termsAccuracy1 =>
      '偵測結果、區域、提醒、地圖標記、路線與天氣可能不完整、延遲或有誤。Corvista 不會控制你的車輛。';

  @override
  String get termsAccuracy2 => '緊急功能屬於實驗性質，可能無法偵測到撞擊，也可能誤觸發。';

  @override
  String get termsRecordingTitle => '錄影相關法規';

  @override
  String get termsRecording1 =>
      '各國家與地區對行車記錄器、錄音及拍攝他人的法律規定不同。你有責任遵守這些規定，包括分享片段時。';

  @override
  String get termsLiabilityTitle => '責任';

  @override
  String get termsLiability1 =>
      '本 App 依「現狀」提供。在法律允許的範圍內，開發者對因使用本 App 或依賴其輸出內容而產生的事故、損失、罰款或損害概不負責。';

  @override
  String get termsChangesTitle => '變更';

  @override
  String get termsChanges1 => '這些條款可能隨 App 新版本更新。更新後繼續使用，即表示你接受修訂後的條款。';

  @override
  String get helpTitle => '說明';

  @override
  String get helpIntro => '常見問題解答。安全相關指引請參閱「安全資訊」。';

  @override
  String get helpQSave => '如何保留事件的影像？';

  @override
  String get helpASaveBuffer =>
      '在行車畫面點一下大型「儲存事件」按鈕。Corvista 會將循環緩衝區中最近 20 或 30 秒（可在「設定 › 錄影」中選擇）儲存到「片段」。';

  @override
  String get helpQWhere => '我的片段儲存在哪裡？';

  @override
  String get helpAWhere =>
      '儲存在你 iPhone 上 Corvista 的私有儲存空間中，絕不會被上傳。可在播放器中使用「分享」傳送或匯出片段。';

  @override
  String get helpQZones => '距離區域有多準確？';

  @override
  String get helpAZones => '區域是根據單一鏡頭及常見物件尺寸所做的粗略估計。請將其視為大致提示，而非實際距離。';

  @override
  String get helpQSlow => '為什麼偵測變慢了？';

  @override
  String get helpASlow =>
      '當 iPhone 發熱、電量偏低或開啟低電量模式時，Corvista 會降低分析頻率以保護裝置。你可以在「設定」中變更電源模式。';

  @override
  String get helpQMap => '地圖、搜尋或天氣無法運作。';

  @override
  String get helpAMap =>
      '這些功能需要網際網路連線與位置存取權限。請檢查網路連線，並在 iOS「設定」中允許 Corvista 使用位置。';

  @override
  String get helpQSimulator => '相機顯示為無法使用。';

  @override
  String get helpASimulator =>
      '請確認已在 iOS「設定」中允許相機存取，且沒有其他 App 正在使用相機。iOS 模擬器沒有相機，可改用本機測試影片。';

  @override
  String get emergencyMsgNoContacts => '請先新增緊急聯絡人。';

  @override
  String get cameraStarting => '正在啟動相機…';

  @override
  String get cameraInterrupted => '相機已暫停';

  @override
  String get cameraInterruptedBody => 'iOS 已暫停相機，例如在通話期間或其他 App 使用相機時。相機會自動恢復。';

  @override
  String get cameraUnavailable => '相機無法使用';

  @override
  String get cameraUnavailableBody => '此裝置沒有可用的相機。偵測、錄影與停車檢視需要後置相機。';

  @override
  String get cameraRunTestFootage => '執行測試影像';

  @override
  String get cameraPermissionDenied => '相機存取已關閉';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista 需要使用相機來進行偵測、行車記錄與停車檢視。請在「設定」中開啟相機存取。';

  @override
  String get cameraError => '相機錯誤';

  @override
  String get cameraStopped => '相機已停止';

  @override
  String get cameraStart => '啟動相機';

  @override
  String get cameraFocusHint => '點一下以對焦';

  @override
  String get cameraPreviewLabel => '含偵測物件的即時相機檢視';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return '相機 $fps fps · AI $hz Hz · $ms 毫秒 · 遺失 $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return '速度 $speed $unit（GPS）';
  }

  @override
  String get hudSpeedUnavailable => '無 GPS 速度';

  @override
  String hudHeading(String direction, String degrees) {
    return '方向 $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return '錄影 $seconds 秒';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return '行車記錄緩衝錄影中，已緩衝 $seconds 秒，目標 $target 秒';
  }

  @override
  String get hudRecIdle => '錄影關閉';

  @override
  String get hudRecSaving => '儲存中…';

  @override
  String get hudRecError => '錄影錯誤';

  @override
  String get hudAiPaused => 'AI 已暫停';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個物件',
      zero: '無物件',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '偵測到 $count 個物件',
      zero: '未偵測到物件',
    );
    return 'AI 模型 $model，$_temp0';
  }

  @override
  String get hudThermalSerious => '過熱 — AI 已減速';

  @override
  String get hudThermalCritical => '溫度過高 — AI 已暫停';

  @override
  String hudBatteryLow(String percent) {
    return '電量 $percent';
  }

  @override
  String get hudLowPower => '低電量模式';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return '天氣 $temperature，$condition。點一下以查看詳細資訊。';
  }

  @override
  String get hudNoGuidance => '請在「地圖」檢視中搜尋目的地，即可在此查看逐向導航。';

  @override
  String get navArrived => '你已抵達';

  @override
  String get navRerouting => '重新規劃路線中…';

  @override
  String get navSearchHint => '搜尋目的地';

  @override
  String get navSearchFieldHint => '地址、地點或商家';

  @override
  String get navNoResults => '找不到符合的地點';

  @override
  String get navSearching => '搜尋中…';

  @override
  String get navSearchStartTyping => '輸入地址或地點名稱。結果來自 Apple Maps，需要網際網路連線。';

  @override
  String get navErrorUnavailable => '無法使用搜尋與路線 — 請檢查網路連線。';

  @override
  String get navErrorNoLocation => '正在等待定位以規劃路線。';

  @override
  String get navErrorPermission => '位置存取已關閉，因此無法從你的位置開始規劃路線。';

  @override
  String navErrorGeneric(String code) {
    return '無法載入路線（$code）。';
  }

  @override
  String navRoutesTitle(String place) {
    return '前往$place的路線';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return '$time 抵達';
  }

  @override
  String get navStart => '開始';

  @override
  String get navEnd => '結束';

  @override
  String get navEndLabel => '結束導航';

  @override
  String navRemaining(String distance, String duration) {
    return '剩餘 $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return '提示：$text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes 分鐘',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours 小時 $minutes 分鐘';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return '路線 $index：$name';
  }

  @override
  String get weatherTitle => '天氣';

  @override
  String weatherFeelsLike(String temperature) {
    return '體感溫度 $temperature';
  }

  @override
  String get weatherPrecipitation => '降水';

  @override
  String get weatherWind => '風';

  @override
  String get weatherVisibility => '能見度';

  @override
  String get weatherHumidity => '濕度';

  @override
  String get weatherHourly => '未來幾小時';

  @override
  String weatherAsOf(String time) {
    return '更新於 $time';
  }

  @override
  String get weatherRefresh => '重新整理天氣';

  @override
  String get weatherUnavailable => '目前無法取得天氣資訊。';

  @override
  String get weatherNoLocation => '天氣功能需要你的位置。';

  @override
  String get weatherLegal => '資料來源與法律聲明';

  @override
  String weatherProvidedBy(String service) {
    return '天氣資料：$service';
  }

  @override
  String get weatherNow => '現在';

  @override
  String get virtualEmpty => '未偵測到支援的物件';

  @override
  String get virtualEmptyCameraOff => '虛擬檢視需要即時相機。';

  @override
  String get virtualLaneDisclaimer => '車道線僅為示意，並非偵測結果。';

  @override
  String virtualNearest(String zone) {
    return '最近：$zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return '虛擬道路場景：$summary';
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
  String get virtualStatusLive => '執行中';

  @override
  String get virtualStatusPaused => '已暫停';

  @override
  String get virtualStatusCameraOff => '相機關閉';

  @override
  String get virtualStatusTestFootage => '測試影像';

  @override
  String get virtualEmptyHint => '偵測到車輛、行人、自行車、號誌燈與停止標誌時，會顯示在這裡。';

  @override
  String get mapRecenter => '回到目前位置';

  @override
  String get mapZoomIn => '放大';

  @override
  String get mapZoomOut => '縮小';

  @override
  String get mapUnsupported => '互動式地圖僅適用於 iPhone。';

  @override
  String get mapObjectsApprox => '物件標記僅為大致位置。';

  @override
  String get mapWeatherUnavailable => '無法取得天氣';

  @override
  String get navErrorNoRoute => '找不到前往此目的地的路線。';

  @override
  String get navDismiss => '關閉';

  @override
  String get navGo => '出發';

  @override
  String get navFastest => '最快';

  @override
  String get navThen => '接著';

  @override
  String get navRecents => '最近';

  @override
  String get navClearRecents => '清除';

  @override
  String get navSearchSubmitHint => '按下「搜尋」即可查看所有符合的地點';

  @override
  String get navPlaces => '地點';

  @override
  String get navEtaLabel => '抵達';

  @override
  String get navTimeLeftLabel => '剩餘';

  @override
  String get navOverview => '總覽';

  @override
  String get navMute => '關閉語音';

  @override
  String get navUnmute => '開啟語音';

  @override
  String get navEndConfirm => '要結束導航嗎？';

  @override
  String navEndConfirmBody(String place) {
    return '前往$place的導引將會停止。';
  }

  @override
  String navArrivedAt(String place) {
    return '你已抵達$place';
  }

  @override
  String get navDone => '完成';

  @override
  String get navWeakGps => 'GPS 訊號弱';

  @override
  String get navLocationOff => '定位服務已關閉。請開啟以規劃路線並導航。';

  @override
  String get navVoiceGuidance => '語音導引';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance後，$instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first，然後$second';
  }

  @override
  String get navSpeakRerouting => '正在重新規劃路線';

  @override
  String get navSpeakArrived => '你已抵達';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 公尺',
      one: '1 公尺',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 公里',
      one: '1 公里',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 英尺',
      one: '1 英尺',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 碼',
      one: '1 碼',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return '繼續直行 $distance';
  }

  @override
  String get navErrorNoDirections => '此地區無法提供這段行程的路線指引。請嘗試其他目的地。';

  @override
  String navContinueFor(String distance) {
    return '繼續行駛 $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 英里',
      one: '1 英里',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return '最近：$object · $zone';
  }

  @override
  String get parkingNothing => '畫面中未偵測到任何物件';

  @override
  String get parkingBeeps => '接近提示音';

  @override
  String get parkingVolume => '提示音音量';

  @override
  String get parkingLimitations =>
      '僅使用單一鏡頭，並非 360°。鏡頭視野以外的物件不會被偵測。無法取代停車感應器；估計可能有誤，沒有提示音並不代表周圍沒有障礙。';

  @override
  String parkingTopDownLabel(String summary) {
    return '俯視接近檢視。$summary';
  }

  @override
  String get perceptionModeOriginal => '原始';

  @override
  String get perceptionModeBoxes => '方框';

  @override
  String get perceptionModeMasks => '物件遮罩';

  @override
  String get perceptionModeRoad => '路面';

  @override
  String get perceptionModeCombined => '合併';

  @override
  String get perceptionOpacity => '遮罩不透明度';

  @override
  String get perceptionDisclaimer => '路面遮罩僅為大致的視覺圖層，不代表可行駛空間或車道。';

  @override
  String get perceptionNeedsModel => '請選取「分割」模型以查看遮罩。';

  @override
  String get perceptionChooseModel => '選擇模型';

  @override
  String get perceptionWaiting => '正在等待第一個分割影格…';

  @override
  String get perceptionShortCamera => '相機';

  @override
  String get perceptionShortBoxes => '方框';

  @override
  String get perceptionShortObjects => '物件';

  @override
  String get perceptionShortRoad => '道路';

  @override
  String get perceptionShortAll => '全部';

  @override
  String get perceptionModesLabel => '感知圖層';

  @override
  String get perceptionStatusWarmingUp => '準備中…';

  @override
  String get perceptionStatusLoadingModel => '正在載入模型…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => '遮罩已暫停';

  @override
  String get perceptionLegend => '遮罩圖例';

  @override
  String get perceptionUnavailable => '無法使用遮罩';

  @override
  String get driveSave => '儲存';

  @override
  String get driveSaveIncident => '儲存事件';

  @override
  String driveSaveHint(int seconds) {
    return '儲存最近 $seconds 秒的行車記錄影像';
  }

  @override
  String get driveSaving => '正在儲存事件…';

  @override
  String hudRecManualLabel(String time) {
    return '錄影中，$time';
  }

  @override
  String get driveRecord => '錄影';

  @override
  String get driveRecordStartA11y => '開始錄影';

  @override
  String driveRecordStopA11y(String time) {
    return '停止錄影，已錄製 $time';
  }

  @override
  String get driveRecordHint => '持續錄影直到你停止，並包含之前的 5 秒';

  @override
  String get driveRecordFailed => '無法開始錄影';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '錄影已儲存 · 共 $count 段',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': '錄影已停止：儲存空間即將用盡',
      'max_duration': '錄影已停止：已達長度上限',
      'camera_stopped': '錄影已隨相機停止',
      'background': '錄影已停止：App 已進入背景',
      'thermal': '錄影已停止：手機過熱',
      'other': '錄影已停止',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return '事件已儲存 · $duration · $resolution';
  }

  @override
  String get driveSavedView => '檢視';

  @override
  String get driveSaveFailed => '無法儲存事件。';

  @override
  String get driveSaveNotRunning => '錄影尚未開始 — 請等待相機啟動後再試一次。';

  @override
  String get driveSaveTestFootage => '測試影像不會被錄製。儲存事件僅適用於即時相機。';

  @override
  String get driveSaveStorageFull => '你的 iPhone 儲存空間已滿。請釋出空間或刪除較舊的片段。';

  @override
  String get driveSaveIoError => '無法將片段寫入儲存空間。';

  @override
  String get driveClips => '片段';

  @override
  String get driveSettings => '設定';

  @override
  String get driveViewSwitcher => '行車檢視';

  @override
  String get driveLocationDenied => '定位服務已關閉 — 無法使用車速、地圖與路線。';

  @override
  String get driveCameraDenied => '相機存取已關閉 — 無法使用偵測與錄影。';

  @override
  String get driveRecorderFallback => '無聲錄影：麥克風存取已關閉。';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return '錄影設定已調整：$reason';
  }

  @override
  String get drivePowerThermalSerious =>
      '你的 iPhone 過熱。AI 將降速運作以降溫 — 請避免陽光直射，並靠近出風口。';

  @override
  String get drivePowerThermalCritical =>
      '你的 iPhone 溫度過高。AI 偵測已暫停直到降溫；若可能，錄影將繼續。';

  @override
  String get drivePowerLowPower => '低電量模式已開啟 — AI 將以較低頻率執行。';

  @override
  String get drivePowerBatteryLow => '電量偏低 — 行車時請將 iPhone 接上電源。';

  @override
  String get onboardingTitle1 => '看見每段旅程的更多細節。';

  @override
  String get onboardingBody1 => '將你的 iPhone 變成智慧行車記錄器與行車輔助夥伴。';

  @override
  String get onboardingTitle2 => '每一格畫面都有智慧。';

  @override
  String get onboardingBody2 => '直接在 iPhone 上辨識支援的車輛、行人、自行車與道路號誌。';

  @override
  String get onboardingTitle3 => '一條路，多種視角。';

  @override
  String get onboardingBody3 => '在即時偵測、虛擬駕駛檢視、互動地圖與停車視覺化之間切換。';

  @override
  String get onboardingTitle4 => '留住重要的時刻。';

  @override
  String get onboardingBody4 => '儲存最近的行車記錄影像、檢視事件並分享錄影。';

  @override
  String get onboardingTitle5 => '安全與隱私';

  @override
  String get onboardingSafety1 => 'Corvista 是行車輔助工具。請隨時注意路況。';

  @override
  String get onboardingSafety2 => '它不會控制你的車輛，也無法取代你的判斷。';

  @override
  String get onboardingSafety3 => '偵測與估計可能不準確或有所遺漏。';

  @override
  String get onboardingSafety4 => '相機處理在你的 iPhone 上進行 — 影片不會上傳。';

  @override
  String get onboardingSafety5 => '地圖、搜尋、路線與天氣需要網際網路連線。';

  @override
  String get onboardingSafety6 => '請穩固固定你的 iPhone，以免遮擋視線。';

  @override
  String get onboardingSafety7 => '請在開始駕駛前完成設定。';

  @override
  String get onboardingAcknowledge => '我了解 Corvista 僅為輔助工具，我仍須為安全駕駛負責。';

  @override
  String get onboardingReadSafety => '閱讀完整安全資訊';

  @override
  String get onboardingNext => '下一步';

  @override
  String get onboardingSkip => '略過';

  @override
  String get onboardingAgree => '繼續';

  @override
  String onboardingPageLabel(int current, int total) {
    return '第 $current 頁，共 $total 頁';
  }

  @override
  String get permTitle => '權限';

  @override
  String get permIntro => 'Corvista 只會要求各項功能所需的權限。你隨時可以在「設定」中變更。';

  @override
  String get permCameraTitle => '相機';

  @override
  String get permCameraBody => '偵測、行車記錄與停車檢視皆需要。影片在你的 iPhone 上處理。';

  @override
  String get permLocationTitle => '位置';

  @override
  String get permLocationBody => '用於 GPS 車速、地圖、路線、天氣，以及標註已儲存的片段。僅在你使用 App 時。';

  @override
  String get permMicTitle => '麥克風';

  @override
  String get permSpeechNote => '只有在你為緊急提醒開啟語音取消時，才會要求語音辨識權限。';

  @override
  String get permRequired => '必要';

  @override
  String get permOptional => '選用';

  @override
  String get permAllow => '允許';

  @override
  String get permGranted => '已允許';

  @override
  String get permDenied => '已拒絕';

  @override
  String get permLimited => '受限';

  @override
  String get permRestricted => '受限制';

  @override
  String get permStart => '開始駕駛';

  @override
  String get permCameraNeeded => '你可以在沒有相機存取權限的情況下繼續，但在「設定」中允許之前，偵測與錄影將無法使用。';

  @override
  String get permSetupIntro =>
      'Corvista 需要這些權限才能完整運作。點一下「全部允許」，iOS 會依序詢問每一項。你隨時可以在「設定」中變更。';

  @override
  String get permCameraLine => '偵測、行車記錄與停車檢視皆需要。影片在你的 iPhone 上處理，絕不會上傳。';

  @override
  String get permLocationLine => 'GPS 車速、地圖、路線、天氣，以及片段儲存的位置。僅在你使用 App 時。';

  @override
  String get permMicLine => '事件片段中的車內聲音，以及在緊急提醒期間聆聽你的取消語句。';

  @override
  String get permSpeechTitle => '語音辨識';

  @override
  String get permSpeechLine => '在緊急倒數期間辨識你的取消語句；在支援的情況下於你的 iPhone 上處理。';

  @override
  String get permAllowAll => '全部允許';

  @override
  String permAsking(String permission) {
    return '正在要求$permission權限…';
  }

  @override
  String get permSomeDenied => '部分權限已關閉。請在「設定」中開啟，才能使用這些功能。';

  @override
  String get permNotNow => '稍後再說';

  @override
  String get tourLabel => '行車畫面導覽';

  @override
  String tourProgress(int current, int total) {
    return '第 $current 步，共 $total 步';
  }

  @override
  String get tourNext => '下一步';

  @override
  String get tourBack => '返回';

  @override
  String get tourSkip => '略過導覽';

  @override
  String get tourFinish => '開始駕駛';

  @override
  String get tourWelcomeTitle => '快速導覽';

  @override
  String get tourWelcomeBody => '用一分鐘了解行車畫面上的重點。建議在停車時進行。';

  @override
  String get tourHudTitle => '儀表列';

  @override
  String get tourHudSpeed => '車速來自 GPS。';

  @override
  String get tourHudRec => '「REC」顯示已緩衝的影像秒數。';

  @override
  String get tourHudAi => 'AI 標籤會顯示模型、偵測到的物件數量，以及一個圓點：綠色為執行中、琥珀色為受限、紅色為已停止。';

  @override
  String get tourSaveTitle => '儲存事件';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista 會保留最近 $seconds 秒影片的循環緩衝。它會持續被覆寫，因此除非你點選「儲存」，否則不會保留任何內容。已儲存的片段會留在這支 iPhone 的「片段」中。';
  }

  @override
  String get tourRecordTitle => '錄下整趟行程';

  @override
  String get tourRecordBody =>
      '點一下「錄影」即可持續錄製，直到你停止。長途行程會以每 5 分鐘一段儲存在「片段」中，錄影時「儲存事件」仍可使用。';

  @override
  String get tourViewsTitle => '五種觀察道路的方式';

  @override
  String get tourViewDetection => '即時相機畫面，並以方框標示支援的物件。';

  @override
  String get tourViewVirtual => '根據偵測結果建構的簡化 3D 場景。';

  @override
  String get tourViewMap => 'Apple Maps，提供搜尋與逐向導航。';

  @override
  String get tourViewParking => '相機畫面加上俯視接近檢視。';

  @override
  String get tourViewPerception => '路面與物件遮罩。';

  @override
  String get tourMapTitle => '搜尋與逐向導航';

  @override
  String get tourMapBody =>
      '開啟「地圖」，點一下搜尋列並選擇目的地。選擇路線後，點一下「開始」即可開始逐向導航。需要網際網路連線。';

  @override
  String get tourClipsTitle => '片段';

  @override
  String get tourClipsBody => '檢視、重新命名、分享或刪除已儲存的事件。除非你分享，否則片段會保留在你的 iPhone 上。';

  @override
  String get tourSettingsTitle => '設定';

  @override
  String get tourSettingsBody =>
      '調整語音提醒及其靈敏度、錄影品質與緩衝長度，並設定緊急模式：一項附有取消倒數的實驗性撞擊提醒。';

  @override
  String get tourSafetyTitle => '出發前';

  @override
  String get tourSafety1 => '請將 iPhone 穩固固定在不會遮擋視線的位置。';

  @override
  String get tourSafety2 => '駕駛時請勿操作 App。請在停車時完成設定。';

  @override
  String get tourSafety3 => '偵測與區域僅為估計，可能有誤或有所遺漏。';

  @override
  String get tourSafety4 => '你仍須為安全駕駛負責。';

  @override
  String get helpTakeTour => '開始導覽';

  @override
  String get helpTakeTourSub => '用一分鐘了解行車畫面。';

  @override
  String get tripsTitle => '行程';

  @override
  String get tripsOpen => '行程紀錄';

  @override
  String get tripsEmptyTitle => '尚無行程';

  @override
  String get tripsEmptyBody => '使用 Corvista 駕駛時會自動記錄行程，包括距離、時間、車速與你走過的路線。';

  @override
  String get tripsDisabledBody =>
      '行程紀錄已關閉，因此不會記錄新的行程。開啟後，即可在這支 iPhone 上保留私密的路線紀錄。';

  @override
  String get tripsEnable => '開啟行程紀錄';

  @override
  String get tripsToday => '今天';

  @override
  String get tripsYesterday => '昨天';

  @override
  String tripsRecordingNow(String distance) {
    return '正在記錄行程 · $distance';
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
      other: '$count 個事件',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則提醒',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個行程',
      zero: '沒有行程',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => '距離';

  @override
  String get tripsStatDuration => '時間長度';

  @override
  String get tripsStatMoving => '行駛時間';

  @override
  String get tripsStatAvgSpeed => '平均車速';

  @override
  String get tripsStatMaxSpeed => '最高車速';

  @override
  String get tripsDetections => '偵測';

  @override
  String get tripsNoDetections => '此行程未記錄任何道路物件。';

  @override
  String get tripsTimeline => '時間軸';

  @override
  String get tripsEventStart => '行程開始';

  @override
  String get tripsEventEnd => '行程結束';

  @override
  String get tripsEventAlert => '語音提醒';

  @override
  String get tripsEventIncident => '已儲存事件片段';

  @override
  String get tripsEventEmergency => '偵測到可能的碰撞';

  @override
  String get tripsEventNavStart => '導航已開始';

  @override
  String get tripsEventArrive => '已抵達目的地';

  @override
  String get tripsEventReroute => '已重新計算路線';

  @override
  String get tripsEventRecording => '錄影已儲存';

  @override
  String get tripsOpenClip => '開啟片段';

  @override
  String get tripsTrackPreview => 'GPS 軌跡';

  @override
  String get tripsRenameTitle => '重新命名行程';

  @override
  String get tripsRenameHint => '行程名稱';

  @override
  String get tripsFavorite => '加入最愛';

  @override
  String get tripsUnfavorite => '從最愛中移除';

  @override
  String get tripsShareGpx => '分享 GPX';

  @override
  String get tripsShareFailed => '無法分享此行程。';

  @override
  String get tripsDelete => '刪除行程';

  @override
  String get tripsDeleteConfirmTitle => '要刪除此行程嗎？';

  @override
  String get tripsDeleteConfirmBody => '路線與統計資料將從這支 iPhone 移除。此行程的事件片段會被保留。';

  @override
  String get tripsDeleted => '行程已刪除';

  @override
  String get tripsNotFound => '此行程已不存在。';

  @override
  String get tripsPrivacyNote => '僅儲存在這支 iPhone 上，不會上傳任何內容。';

  @override
  String get settingsSectionTrips => '行程紀錄';

  @override
  String get settingsTripLog => '記錄行程';

  @override
  String get settingsTripLogSubtitle => '僅在這支 iPhone 上保留你的路線與行車統計資料。';

  @override
  String get settingsTripRetention => '行程保留期限';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 年';

  @override
  String get settingsRetentionForever => '永久';

  @override
  String get settingsTripRetentionFooter => 'Corvista 啟動時，會自動刪除較舊的行程。';

  @override
  String get settingsViewTrips => '檢視行程';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours 小時 $minutes 分鐘';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes 分鐘';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista 行程 $date';
  }

  @override
  String get settingsFreeUpSpace => '釋出空間';

  @override
  String get settingsFreeUpSpaceSubtitle => '移除暫存檔案與快取。已儲存的片段與行程會保留。';

  @override
  String settingsFreedBytes(String size) {
    return '已釋出 $size';
  }

  @override
  String get settingsNothingToFree => '快取已清除 — 沒有需要移除的暫存檔案。';

  @override
  String get settingsSectionPrivacyData => '隱私權與資料';

  @override
  String get settingsPrivacyDataFooter =>
      '片段、行程與設定僅儲存在這支 iPhone 上，只有在你選擇分享時才會離開。';

  @override
  String get settingsDeleteAllData => '刪除所有資料';

  @override
  String get settingsDeleteAllDataSubtitle => '從這支 iPhone 清除片段、行程、聯絡人與設定';

  @override
  String get deleteAllTitle => '要刪除所有資料嗎？';

  @override
  String get deleteAllMessage =>
      '這會從這支 iPhone 永久移除：\n• 事件片段與縮圖\n• 行程記錄與 GPS 軌跡\n• 緊急聯絡人與緊急事件\n• 偵測記錄與診斷記錄\n• 設定與最近的目的地\n• 暫存錄影緩衝區與快取\n\n此操作無法復原。之後 Corvista 會從歡迎畫面重新開始。';

  @override
  String get deleteAllConfirm => '全部刪除';

  @override
  String get deleteAllInProgress => '正在刪除…';

  @override
  String get deleteAllDone => '已刪除所有資料';

  @override
  String get deleteAllPartial => '部分項目無法刪除。請從「設定」再試一次。';

  @override
  String get diagLogSection => '診斷記錄';

  @override
  String get diagLogFooter =>
      '錯誤僅記錄在這支 iPhone 上，不含位置、聯絡人姓名或電話號碼。除非你自行分享記錄，否則不會傳送任何內容。';

  @override
  String get diagLogShare => '分享診斷記錄';

  @override
  String get diagLogEmpty => '空白';

  @override
  String get diagLogClear => '清除記錄';

  @override
  String get diagLogClearTitle => '要清除診斷記錄嗎？';

  @override
  String get diagLogClearBody => '已儲存的錯誤項目將從這支 iPhone 刪除。';

  @override
  String get diagLogCleared => '已清除診斷記錄';

  @override
  String get diagLogShareFailed => '無法分享診斷記錄。';

  @override
  String get privacyControls2 =>
      '「設定 › 隱私權與資料 › 刪除所有資料」會清除 Corvista 儲存在這支 iPhone 上的所有片段、行程、聯絡人、記錄與設定。';

  @override
  String get parkingZoneStop => '停';

  @override
  String get parkingZoneVeryClose => '非常近';

  @override
  String get parkingZoneClose => '近';

  @override
  String get parkingZoneNothingClose => '未見近處物體';

  @override
  String get parkingNotDetected => '不會偵測牆壁、柱子、桿子與路緣';

  @override
  String get parkingApprox => '約略';

  @override
  String get parkingSideLeft => '左';

  @override
  String get parkingSideCenter => '中';

  @override
  String get parkingSideRight => '右';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => '僅顯示前鏡頭畫面，並非 360° 系統';

  @override
  String get parkingMuteBeeps => '關閉嗶聲';

  @override
  String get parkingUnmuteBeeps => '開啟嗶聲';

  @override
  String get parkingAbout => '關於停車檢視';

  @override
  String get parkingLimitationsDetail =>
      '僅監看相機前方的區域。偵測器可辨識汽車、巴士與卡車、行人、自行車和機車。牆壁、柱子、桿子、路緣、護柱、護欄及低矮障礙物「無法」偵測，引擎蓋也可能遮住正前方的地面。距離是依單一相機（物體大小與位置）粗略推測，可能有很大誤差。沒有聲音或顯示「未見近處物體」，並不代表前方暢通，請務必觀察四周並使用後照鏡。';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return '各側接近程度：左 $left，中 $center，右 $right';
  }

  @override
  String get privacyDiagnostics1 =>
      '錯誤會寫入這支 iPhone 上的私人記錄（不含位置、聯絡人姓名或電話號碼）。記錄絕不會自動傳送；你可以在「設定 › 診斷」中分享或清除。';
}
