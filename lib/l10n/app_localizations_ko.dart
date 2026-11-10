// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => '모든 주행을 더 멀리 내다보세요.';

  @override
  String get commonCancel => '취소';

  @override
  String get commonDelete => '삭제';

  @override
  String get commonSave => '저장';

  @override
  String get commonBack => '뒤로';

  @override
  String get commonClose => '닫기';

  @override
  String get commonRetry => '다시 시도';

  @override
  String get commonOpenSettings => '설정 열기';

  @override
  String get commonLoading => '불러오는 중…';

  @override
  String get commonError => '문제가 발생했어요.';

  @override
  String commonErrorDetail(String message) {
    return '문제가 발생했어요: $message';
  }

  @override
  String get commonOn => '켜짐';

  @override
  String get commonOff => '꺼짐';

  @override
  String get commonRename => '이름 변경';

  @override
  String get commonShare => '공유';

  @override
  String get commonNotAvailable => '사용할 수 없음';

  @override
  String get commonTestFootage => '테스트 영상';

  @override
  String get zoneVeryClose => '매우 가까움';

  @override
  String get zoneClose => '가까움';

  @override
  String get zoneMedium => '보통';

  @override
  String get zoneFar => '멀음';

  @override
  String get zoneUnknown => '알 수 없음';

  @override
  String get classPerson => '사람';

  @override
  String get classBicycle => '자전거';

  @override
  String get classMotorcycle => '오토바이';

  @override
  String get classCar => '차량';

  @override
  String get classBus => '버스';

  @override
  String get classTrafficLight => '신호등';

  @override
  String get classStopSign => '정지 표지판';

  @override
  String get viewDetection => '감지';

  @override
  String get viewVirtual => '가상';

  @override
  String get viewMap => '지도';

  @override
  String get viewParking => '주차';

  @override
  String get viewPerception => '인식';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => '빨강';

  @override
  String get lightYellow => '노랑';

  @override
  String get lightGreen => '초록';

  @override
  String get lightUnknown => '알 수 없음';

  @override
  String get clipsTitle => '클립';

  @override
  String get clipsSelect => '선택';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 선택됨',
      zero: '클립 선택',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => '모두 선택';

  @override
  String get clipsDeselectAll => '모두 선택 해제';

  @override
  String get clipsDeleteSelected => '선택 항목 삭제';

  @override
  String get clipsGridView => '격자 보기';

  @override
  String get clipsListView => '목록 보기';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클립 $count개를 삭제할까요?',
      one: '이 클립을 삭제할까요?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '이 영상들은 iPhone에서 영구적으로 삭제됩니다. 되돌릴 수 없습니다.',
      one: '이 영상은 iPhone에서 영구적으로 삭제됩니다. 되돌릴 수 없습니다.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클립 $count개를 삭제했어요',
      one: '클립을 삭제했어요',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => '아직 클립이 없어요';

  @override
  String get clipsEmptyBody =>
      '주행 중 Corvista는 짧은 영상을 계속 버퍼에 담아 둡니다. ‘사고 저장’을 누르면 직전 몇 초의 영상이 이곳에 보관됩니다.';

  @override
  String get clipsLoadError => '클립을 불러오지 못했어요.';

  @override
  String get clipsStorageTitle => '저장 공간';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return '클립 $clips · 버퍼 $buffer · 여유 $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '저장된 클립 $count개',
      zero: '저장된 클립 없음',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow => 'iPhone 저장 공간이 부족해요. 새 사고 영상이 저장되지 않을 수 있습니다.';

  @override
  String get clipsMissingFile => '파일 없음';

  @override
  String get clipsEmergencyBadge => '충격';

  @override
  String clipsUntitled(String date) {
    return '사고 · $date';
  }

  @override
  String get clipsAudio => '오디오 녹음됨';

  @override
  String get clipsFavorite => '즐겨찾기';

  @override
  String get clipsUnfavorite => '즐겨찾기에서 제거';

  @override
  String get clipsLocation => '위치 저장됨';

  @override
  String clipsOpenClip(String title) {
    return '클립 $title 열기';
  }

  @override
  String get playerNotFoundTitle => '클립을 찾을 수 없어요';

  @override
  String get playerNotFoundBody => '이 클립이 삭제되었을 수 있어요.';

  @override
  String get playerMissingTitle => '영상 파일 없음';

  @override
  String get playerMissingBody =>
      '이 클립의 녹화 파일이 더 이상 iPhone에 없어요. 갤러리에서 항목을 제거할 수 있습니다.';

  @override
  String get playerRemoveEntry => '항목 제거';

  @override
  String get playerLoadError => '이 영상을 재생할 수 없어요.';

  @override
  String get playerPlay => '재생';

  @override
  String get playerPause => '일시정지';

  @override
  String get playerReplay => '다시 재생';

  @override
  String get playerRenameTitle => '클립 이름 변경';

  @override
  String get playerRenameHint => '클립 이름';

  @override
  String get playerRenamed => '클립 이름을 변경했어요';

  @override
  String get playerFavorited => '즐겨찾기에 추가했어요';

  @override
  String get playerUnfavorited => '즐겨찾기에서 제거했어요';

  @override
  String get playerShareFailed => '이 클립을 공유하지 못했어요.';

  @override
  String get playerDetails => '세부 정보';

  @override
  String get playerDate => '녹화 시각';

  @override
  String get playerDuration => '길이';

  @override
  String get playerResolution => '해상도';

  @override
  String get playerSize => '파일 크기';

  @override
  String get playerAudio => '오디오';

  @override
  String get playerAudioYes => '녹음됨';

  @override
  String get playerAudioNo => '녹음 안 됨';

  @override
  String get playerReason => '저장 방법';

  @override
  String get playerReasonManual => '사고 저장 버튼';

  @override
  String get playerReasonEmergency => '충격 가능성 감지';

  @override
  String get playerReasonRecovered => '중단 후 복구됨';

  @override
  String get playerSpeed => '저장 시점 GPS 속도';

  @override
  String get playerLocation => '위치';

  @override
  String get playerOpenInMaps => '지도에서 열기';

  @override
  String get playerBack => '뒤로';

  @override
  String get playerMore => '더 보기';

  @override
  String get clipsFilterLabel => '표시';

  @override
  String get clipsFilterAll => '전체';

  @override
  String get clipsFilterRecordings => '녹화';

  @override
  String get clipsFilterIncidents => '사고';

  @override
  String get clipsFilterEmergency => '긴급';

  @override
  String get clipsFilterFavorites => '즐겨찾기';

  @override
  String get clipsSort => '정렬';

  @override
  String get clipsSortNewest => '최신순';

  @override
  String get clipsSortOldest => '오래된 순';

  @override
  String get clipsSortLongest => '긴 순';

  @override
  String get clipsSortLargest => '큰 순';

  @override
  String get clipsToday => '오늘';

  @override
  String get clipsYesterday => '어제';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클립 $count개',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => '이 카테고리에는 아직 클립이 없어요.';

  @override
  String get clipsFavoritesEmpty => '클립에 별표를 표시하면 이곳에서 빠르게 볼 수 있어요.';

  @override
  String get clipsKindRecording => '녹화';

  @override
  String get clipsKindIncident => '사고';

  @override
  String get clipsKindEmergency => '긴급';

  @override
  String get clipsKindTest => '테스트';

  @override
  String clipsTripChip(String time) {
    return '주행 · $time';
  }

  @override
  String get clipsOpenTrip => '이 클립이 녹화된 주행 열기';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used 사용 · $free 여유';
  }

  @override
  String clipsStorageClips(String size) {
    return '클립 $size 사용 중';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '녹화 $count개',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사고 $count건',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '긴급 $count건',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => '공간 확보';

  @override
  String get clipsStorageLowGentle =>
      '여유 공간이 2GB 미만이에요. 원활하게 녹화하려면 공간을 확보하거나 필요 없는 클립을 삭제하세요.';

  @override
  String get clipsSaveToPhotos => '사진에 저장';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클립 $count개',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클립 $count개를 삭제할까요 ($size)?',
      one: '이 클립을 삭제할까요 ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return '$total개 중 $done개를 사진에 저장하는 중…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클립 $count개를 사진에 저장했어요',
      one: '사진에 저장했어요',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved개를 사진에 저장했고 $failed개는 저장하지 못했어요';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista가 사진에 동영상을 추가할 수 없어요. 설정에서 허용할 수 있어요.';

  @override
  String get clipsPhotosFailed => '사진에 저장하지 못했어요.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클립 $count개를 즐겨찾기에 추가했어요',
      one: '즐겨찾기에 추가했어요',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클립 $count개를 즐겨찾기에서 제거했어요',
      one: '즐겨찾기에서 제거했어요',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (잘라냄)';
  }

  @override
  String get playerTrim => '자르기';

  @override
  String get playerInfo => '정보';

  @override
  String get playerKind => '유형';

  @override
  String get playerReasonRecording => '녹화 버튼';

  @override
  String get trimTitle => '클립 자르기';

  @override
  String get trimHint => '핸들을 드래그해 남길 부분을 선택하세요. 원본 클립은 그대로 유지됩니다.';

  @override
  String get trimStartHandle => '시작 지점 자르기';

  @override
  String get trimEndHandle => '끝 지점 자르기';

  @override
  String trimSelection(String duration) {
    return '$duration 선택됨';
  }

  @override
  String get trimSave => '새 클립으로 저장';

  @override
  String get trimSaving => '잘라낸 클립을 저장하는 중…';

  @override
  String get trimSaved => '잘라낸 클립을 저장했어요';

  @override
  String get trimOpenNew => '열기';

  @override
  String get trimFailed => '이 클립을 자르지 못했어요.';

  @override
  String get trimStorageFull => '잘라낸 클립을 저장할 여유 공간이 부족해요.';

  @override
  String get trimPreview => '선택 구간 재생';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsSectionCamera => '카메라';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => '알림';

  @override
  String get settingsSectionAlertCategories => '알림 대상';

  @override
  String get settingsSectionRecording => '녹화';

  @override
  String get settingsSectionDriving => '주행';

  @override
  String get settingsSectionPower => '전원';

  @override
  String get settingsSectionEmergency => '긴급';

  @override
  String get settingsSectionAppearance => '화면 모드';

  @override
  String get settingsSectionLanguage => '언어';

  @override
  String get settingsSectionInformation => '정보';

  @override
  String get settingsCameraLens => '카메라 렌즈';

  @override
  String get settingsLensWide => '광각';

  @override
  String get settingsLensUltraWide => '초광각';

  @override
  String get settingsLensTelephoto => '망원';

  @override
  String get settingsLensUnavailable => '이 iPhone에서는 사용할 수 없음';

  @override
  String get settingsStabilization => '손떨림 보정';

  @override
  String get settingsStabAuto => '자동';

  @override
  String get settingsStabOff => '끔';

  @override
  String get settingsStabStandard => '표준';

  @override
  String get settingsStabCinematic => '시네마틱';

  @override
  String get settingsOverlayOpacity => '오버레이 불투명도';

  @override
  String get settingsShowFps => '성능 정보 표시';

  @override
  String get settingsShowFpsSubtitle => '감지 화면에 프레임 속도와 추론 시간을 표시합니다';

  @override
  String get settingsCameraFooter => '렌즈와 손떨림 보정 변경은 다음에 카메라가 시작될 때 적용됩니다.';

  @override
  String get settingsAiModel => 'AI 모델';

  @override
  String get settingsConfidence => '감지 신뢰도';

  @override
  String get settingsTracking => '객체 추적';

  @override
  String get settingsTrackingSubtitle => '프레임 간 객체 표시를 안정적으로 유지합니다';

  @override
  String get settingsShowLabels => '라벨 표시';

  @override
  String get settingsShowConfidence => '신뢰도 표시';

  @override
  String get settingsSegmentationOpacity => '인식 마스크 불투명도';

  @override
  String get settingsAiFooter =>
      '신뢰도를 낮추면 더 많은 객체가 표시되지만 오감지도 늘어납니다. 감지 결과는 부정확할 수 있습니다.';

  @override
  String get settingsVoiceAlerts => '음성 알림';

  @override
  String get settingsVoiceLanguage => '음성 언어';

  @override
  String get settingsVoiceLanguageAuto => '앱 언어와 동일';

  @override
  String get settingsVoice => '음성';

  @override
  String get settingsVoiceDefault => '시스템 기본값';

  @override
  String get settingsVoiceQualityEnhanced => '향상됨';

  @override
  String get settingsVoiceQualityPremium => '고품질';

  @override
  String get settingsNoVoices =>
      '이 언어에 설치된 음성이 없어요. iOS 설정 › 손쉬운 사용 › 말하기 콘텐츠에서 추가하세요.';

  @override
  String get settingsAlertPedestrian => '보행자';

  @override
  String get settingsAlertCyclist => '자전거 이용자';

  @override
  String get settingsAlertMotorcycle => '오토바이';

  @override
  String get settingsAlertBus => '버스';

  @override
  String get settingsAlertVehicleClose => '바로 앞 차량이 매우 가까움';

  @override
  String get settingsAlertTrafficLight => '신호등 변경';

  @override
  String get settingsAlertTrafficMoving => '앞 차량 출발';

  @override
  String get settingsAlertStopSign => '정지 표지판';

  @override
  String get settingsSensitivity => '민감도';

  @override
  String get settingsSensitivityLow => '낮음';

  @override
  String get settingsSensitivityMedium => '보통';

  @override
  String get settingsSensitivityHigh => '높음';

  @override
  String get settingsCooldown => '반복 간격';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds초';
  }

  @override
  String get settingsVolume => '음성 볼륨';

  @override
  String get settingsQuietMode => '조용한 모드';

  @override
  String get settingsQuietModeSubtitle => '가장 중요한 알림만 음성으로 안내합니다';

  @override
  String get settingsTestVoice => '음성 테스트';

  @override
  String get settingsTestVoiceDone => '샘플 알림을 재생하는 중…';

  @override
  String get settingsParkingBeeps => '주차 경고음';

  @override
  String get settingsBeepVolume => '경고음 볼륨';

  @override
  String get settingsAlertsFooter =>
      '알림은 보조 수단일 뿐입니다. 항상 도로를 주시하세요. 알림이 없다고 해서 안전하다는 뜻은 아닙니다.';

  @override
  String get settingsRecordingProfile => '녹화 화질';

  @override
  String get settingsProfileStandard => '표준 · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => '사고 버퍼';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds초';
  }

  @override
  String get settingsManualMaxLength => '수동 녹화 최대 길이';

  @override
  String get settingsManualMaxUnlimited => '제한 없음';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes분';
  }

  @override
  String get settingsRecordAudio => '오디오 녹음';

  @override
  String get settingsRecordAudioSubtitle => '저장되는 사고 영상에 차내 소리를 포함합니다';

  @override
  String get settingsMicDenied => '마이크 접근이 꺼져 있어요. 오디오를 녹음하려면 설정에서 허용하세요.';

  @override
  String get settingsWatermark => 'Corvista 워터마크';

  @override
  String get settingsTimestamp => '날짜 및 시간 표시';

  @override
  String get settingsSaveLocation => '클립과 함께 위치 저장';

  @override
  String get settingsStorage => '저장 공간 및 클립';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클립 $count개',
      zero: '클립 없음',
    );
    return '$_temp0 · $used 사용 · $free 여유';
  }

  @override
  String get settingsRecordingFooter =>
      '순환 버퍼는 iPhone에만 보관되며 계속 덮어쓰입니다. 백그라운드에서는 아무것도 녹화되지 않습니다.';

  @override
  String get settingsDefaultView => '기본 화면';

  @override
  String get settingsUnits => '단위';

  @override
  String get settingsShowCompass => '나침반 표시';

  @override
  String get settingsHudStyle => 'HUD 스타일';

  @override
  String get settingsHudCustomize => 'HUD 사용자화';

  @override
  String get settingsDrivingSide => '통행 방향';

  @override
  String get settingsDrivingSideAuto => '자동';

  @override
  String get settingsDrivingSideRight => '우측통행';

  @override
  String get settingsDrivingSideLeft => '좌측통행';

  @override
  String get settingsVirtualStyle => '가상 화면 스타일';

  @override
  String get settingsVirtualMinimal => '미니멀';

  @override
  String get settingsVirtualPerspective => '원근';

  @override
  String get settingsVirtualHighContrast => '고대비';

  @override
  String get settingsKeepScreenOn => '주행 중 화면 켜 두기';

  @override
  String get settingsLiveActivity => '실시간 현황';

  @override
  String get settingsLiveActivityDesc =>
      '잠금 화면과 Dynamic Island에 턴 바이 턴 안내를 표시합니다';

  @override
  String get driveRecordingPausedBackground =>
      'Corvista가 백그라운드에 있는 동안 녹화가 일시정지되었어요';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => '일시정지';

  @override
  String get liveActivityDashcamOff => '캠 꺼짐';

  @override
  String get liveActivityEnded => '길 안내 종료';

  @override
  String get liveActivityEta => '도착';

  @override
  String get settingsAutoRecenter => '지도 자동 중앙 정렬';

  @override
  String get settingsHudStyleClassic => '클래식';

  @override
  String get settingsHudStyleGrid => '격자';

  @override
  String get settingsHudStyleMinimal => '미니멀';

  @override
  String get settingsHudStylePerformance => '퍼포먼스';

  @override
  String get settingsHudStyleNavigation => '내비게이션';

  @override
  String get settingsHudStyleNight => '야간';

  @override
  String get settingsHudStyleHighContrast => '고대비';

  @override
  String get settingsPowerMode => '전원 모드';

  @override
  String get settingsPowerBalanced => '균형';

  @override
  String get settingsPowerPerformance => '성능';

  @override
  String get settingsPowerSaver => '절전';

  @override
  String get settingsPowerFooter =>
      'iPhone이 뜨거워지거나 배터리가 부족하면 Corvista가 AI 처리 빈도와 시각 효과를 자동으로 낮춥니다.';

  @override
  String get settingsThermal => '온도 상태';

  @override
  String get settingsThermalNominal => '정상';

  @override
  String get settingsThermalFair => '따뜻함';

  @override
  String get settingsThermalSerious => '뜨거움';

  @override
  String get settingsThermalCritical => '위험';

  @override
  String get settingsBattery => '배터리';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · 충전 중';
  }

  @override
  String get settingsLowPowerMode => '저전력 모드가 켜져 있어요. AI가 낮은 빈도로 실행됩니다.';

  @override
  String get settingsAiRate => '현재 AI 처리 빈도';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => '충격 감지';

  @override
  String settingsEmergencyOn(int seconds) {
    return '켜짐 · $seconds초 카운트다운';
  }

  @override
  String get settingsEmergencyFooter => '실험적 기능입니다. 긴급 구조 서비스를 대신할 수 없습니다.';

  @override
  String get settingsTheme => '테마';

  @override
  String get settingsThemeSystem => '시스템';

  @override
  String get settingsThemeDark => '다크';

  @override
  String get settingsThemeLight => '라이트';

  @override
  String get settingsReduceMotion => '동작 줄이기';

  @override
  String get settingsReduceMotionSubtitle => '앱 전체의 애니메이션을 최소화합니다';

  @override
  String get settingsAppLanguage => '앱 언어';

  @override
  String get settingsPrivacyPolicy => '개인정보 처리방침';

  @override
  String get settingsTerms => '이용약관';

  @override
  String get settingsHelp => '도움말';

  @override
  String get settingsSupport => '지원팀에 문의';

  @override
  String get settingsLicenses => '오픈소스 라이선스';

  @override
  String get settingsSupportUnavailable =>
      '메일을 열 수 없어요. support@corvista.app으로 문의해 주세요.';

  @override
  String get settingsSafety => '안전 정보';

  @override
  String get settingsDiagnostics => '진단';

  @override
  String get settingsVersion => '버전';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'HUD 사용자화';

  @override
  String get hudCustomPreview => '미리보기 · 샘플 값';

  @override
  String get hudCustomStyle => '스타일';

  @override
  String get hudCustomElements => '요소';

  @override
  String get hudCustomSpeed => '속도';

  @override
  String get hudCustomHeading => '방향 및 나침반';

  @override
  String get hudCustomClock => '시계';

  @override
  String get hudCustomBattery => '배터리 및 온도';

  @override
  String get hudCustomDetections => 'AI 상태 및 감지';

  @override
  String get hudCustomWeather => '날씨';

  @override
  String get hudCustomAppearance => '크기 및 불투명도';

  @override
  String get hudCustomSize => '크기';

  @override
  String get hudCustomOpacity => '불투명도';

  @override
  String get hudCustomFooter => '과열 같은 경고는 요소를 숨겨도 항상 표시됩니다.';

  @override
  String get hudCustomDescClassic => '균형 잡힌 계기판';

  @override
  String get hudCustomDescGrid => '도로 위에 원근 격자 표시';

  @override
  String get hudCustomDescMinimal => '속도만 표시';

  @override
  String get hudCustomDescPerformance => '실시간 수치가 있는 속도 아크';

  @override
  String get hudCustomDescNavigation => '다음 기동을 가장 먼저 표시';

  @override
  String get hudCustomDescNight => '야간 주행용으로 어둡고 붉은 톤';

  @override
  String get hudCustomDescHighContrast => '밝은 햇빛에서도 최대한 잘 보이게';

  @override
  String get languageTitle => '언어';

  @override
  String get languageSystem => '시스템 기본값';

  @override
  String get languageSystemSubtitle => 'iPhone 언어를 따릅니다';

  @override
  String get languageFooter =>
      '더 많은 언어가 추가될 예정이에요. 음성 알림 언어는 알림 설정에서 따로 지정할 수 있습니다.';

  @override
  String get diagTitle => '진단';

  @override
  String get diagPerformance => '성능';

  @override
  String get diagInference => '추론 시간';

  @override
  String get diagDetectHz => '감지 빈도';

  @override
  String get diagCameraFps => '카메라 프레임 속도';

  @override
  String get diagMemory => '메모리';

  @override
  String get diagDropped => '누락된 프레임';

  @override
  String get diagSegmentation => '분할 처리 시간';

  @override
  String get diagCamera => '카메라';

  @override
  String get diagStatus => '상태';

  @override
  String get diagSource => '소스';

  @override
  String get diagSourceCamera => '실시간 카메라';

  @override
  String get diagSourceFile => '테스트 영상 파일';

  @override
  String get diagResolution => '버퍼 크기';

  @override
  String get diagLens => '렌즈';

  @override
  String get diagError => '마지막 오류';

  @override
  String get diagModel => 'AI 모델';

  @override
  String get diagModelLoad => '모델 로드 시간';

  @override
  String get diagPower => '전원';

  @override
  String get diagSegHz => '분할 처리 빈도';

  @override
  String get diagReduced => '효과 축소';

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
  String get diagCamIdle => '대기 중';

  @override
  String get diagCamStarting => '시작 중';

  @override
  String get diagCamRunning => '실행 중';

  @override
  String get diagCamInterrupted => '중단됨';

  @override
  String get diagCamStopped => '정지됨';

  @override
  String get diagCamUnavailable => '사용할 수 없음';

  @override
  String get diagCamPermissionDenied => '권한 거부됨';

  @override
  String get diagCamError => '오류';

  @override
  String get diagTestFootage => '테스트 영상';

  @override
  String get diagTestFootageBody =>
      '카메라 대신 로컬 영상 파일로 실제 기기 내 감지를 실행합니다. 모든 화면에 ‘테스트 영상’ 표시가 나타납니다.';

  @override
  String get diagPathLabel => '영상 파일 경로';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Documents/test_drive.mp4 사용';

  @override
  String get diagRun => '테스트 영상 실행';

  @override
  String get diagRunStarted => '테스트 영상을 시작했어요. 주행 화면에서 확인하세요.';

  @override
  String get diagBackToCamera => '실시간 카메라로 돌아가기';

  @override
  String get diagDebugOnly => '테스트 영상은 개발 빌드에서만 사용할 수 있어요.';

  @override
  String get diagFileMissing => '해당 경로에 파일이 없어요.';

  @override
  String get emergencySetupTitle => '충격 감지';

  @override
  String get emergencyExperimental => '실험적';

  @override
  String get emergencyIntro =>
      '주행 중 Corvista는 iPhone의 모션 센서로 심각한 충격 가능성을 감지할 수 있어요. 충격이 감지되면 카운트다운이 시작됩니다. 취소하지 않으면 Corvista가 긴급 구조 서비스 전화와 연락처 메시지 전송을 제안합니다.';

  @override
  String get emergencyDisclaimer1 => '긴급 구조 서비스나 차량 자체의 충돌 감지 기능을 대신할 수 없습니다.';

  @override
  String get emergencyDisclaimer2 => '전화를 걸거나 메시지를 보내기 전에 iOS가 항상 확인을 요청합니다.';

  @override
  String get emergencyDisclaimer3 => '충격을 놓칠 수 있으며, 급제동이나 요철이 충격으로 오인될 수 있습니다.';

  @override
  String get emergencyParkedWarning =>
      '주차한 상태에서 설정을 완료하세요. 차량이 움직이는 동안에는 설정이 잠깁니다.';

  @override
  String get emergencyEnable => '충격 감지 켜기';

  @override
  String get emergencyEnableSubtitle => '주행 세션 중에만 작동합니다';

  @override
  String get emergencyNeedNumber => '먼저 긴급 전화번호를 추가하세요.';

  @override
  String get emergencyContacts => '긴급 연락처';

  @override
  String get emergencyAddContact => '연락처 추가';

  @override
  String get emergencyNoContacts =>
      '아직 연락처가 없어요. 연락처에는 사용자가 확인한 후에만 메시지가 전송됩니다.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '$name을(를) 제거할까요?';
  }

  @override
  String get emergencyRemoveContactBody => '충격 발생 후 수신자로 제안되지 않습니다.';

  @override
  String get emergencyRemove => '제거';

  @override
  String get emergencyContactsError => '연락처를 불러오지 못했어요.';

  @override
  String get emergencyNumber => '긴급 전화번호';

  @override
  String get emergencyNumberHint => '예: 112 또는 911';

  @override
  String get emergencyMessage => '메시지 템플릿';

  @override
  String get emergencyMessageDefault =>
      '차량 사고가 났을 수 있습니다. 이 메시지는 Corvista가 작성했으며, 가능한 경우 마지막으로 확인된 제 위치가 포함되어 있습니다.';

  @override
  String get emergencyMessageHint => '비워 두면 기본 메시지를 사용합니다.';

  @override
  String get emergencyCountdown => '카운트다운 길이';

  @override
  String get emergencyVoiceCancel => '음성으로 취소';

  @override
  String get emergencyVoiceCancelSubtitle =>
      '카운트다운 중에 “괜찮아요” 또는 “취소”라고 말하세요. 가능한 경우 기기 내 음성 인식을 사용합니다.';

  @override
  String get emergencyVoicePermDenied => '음성으로 취소하려면 마이크와 음성 인식 접근 권한이 필요해요.';

  @override
  String get emergencyAutoSave => '사고 클립 자동 저장';

  @override
  String get emergencyTest => '카운트다운 테스트 (전화 안 함)';

  @override
  String get emergencyTestBody =>
      '충격 상황을 시뮬레이션하여 카운트다운을 확인할 수 있어요. 테스트 모드에서는 전화나 메시지가 전송되지 않습니다.';

  @override
  String get emergencyNotSet => '설정 안 됨';

  @override
  String get emergencyAlertHeadline => '심각한 충격이 감지되었을 수 있습니다.';

  @override
  String get emergencyAlertSubtitle => '괜찮으세요?';

  @override
  String get emergencyAlertCancel => '괜찮아요 — 취소';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds초 남음',
      one: '1초 남음',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => '듣는 중 — 취소하려면 “괜찮아요”라고 말하세요';

  @override
  String emergencyAlertHeard(String text) {
    return '인식됨: “$text”';
  }

  @override
  String get emergencyAlertEscalated => '응답이 없습니다. 원하는 조치를 선택하세요:';

  @override
  String get emergencyAlertCall => '긴급 구조 서비스에 전화';

  @override
  String emergencyAlertCallNumber(String number) {
    return '$number로 전화합니다. iOS가 확인을 요청합니다.';
  }

  @override
  String get emergencyAlertMessage => '연락처에 메시지';

  @override
  String get emergencyAlertMessageSubtitle => '작성된 메시지가 열립니다. 전송 여부는 직접 선택합니다.';

  @override
  String get emergencyAlertTestMode => '테스트 모드 — 전화가 걸리지 않습니다';

  @override
  String get emergencyAlertTestBadge => '테스트';

  @override
  String get emergencyAlertClose => '괜찮아요 — 닫기';

  @override
  String get emergencyMsgSent => '메시지를 보냈어요.';

  @override
  String get emergencyMsgCancelled => '메시지를 보내지 않았어요.';

  @override
  String get emergencyMsgFailed => '메시지를 보내지 못했어요.';

  @override
  String get emergencyMsgUnavailable => '이 기기에서는 메시지를 사용할 수 없어요.';

  @override
  String emergencyCallFailed(String number) {
    return '전화를 걸지 못했어요. $number로 직접 전화하세요.';
  }

  @override
  String get modelsTitle => 'AI 모델';

  @override
  String get modelsIntro =>
      '모든 모델은 앱에 포함되어 있으며 iPhone에서만 실행됩니다. 카메라 영상은 기기 밖으로 나가지 않습니다.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return '실시간: 프레임당 $ms ms · 초당 $hz회 감지';
  }

  @override
  String modelsLastLoad(String ms) {
    return '$ms ms 만에 로드됨';
  }

  @override
  String get modelsEfficientName => '효율형';

  @override
  String get modelsEfficientDesc =>
      '장거리 주행에 맞춰 발열과 배터리 사용을 줄인 빠르고 가벼운 감지 모델입니다.';

  @override
  String get modelsEnhancedName => '향상형';

  @override
  String get modelsEnhancedDesc => '더 작고 먼 객체까지 찾는 대형 감지 모델로, 전력 소모가 더 큽니다.';

  @override
  String get modelsSegmentationName => '분할';

  @override
  String get modelsSegmentationDesc => '빠른 감지에 노면 및 객체 마스크를 결합해 인식 화면에 사용합니다.';

  @override
  String get modelsNoneName => 'AI 일시정지';

  @override
  String get modelsNoneDesc => '객체 감지 없이 카메라와 녹화는 계속 실행됩니다. 전력 사용이 가장 적습니다.';

  @override
  String get modelsGenericDesc => '기기 내 객체 감지 모델입니다.';

  @override
  String get modelsFunctionDetection =>
      '차량, 사람, 자전거, 오토바이, 버스, 신호등, 정지 표지판을 감지합니다';

  @override
  String get modelsFunctionSegmentation => '노면 및 객체 마스크를 추가합니다';

  @override
  String get modelsFunctionNone => '감지 없음, 블랙박스 녹화만 작동';

  @override
  String get modelsSize => '크기';

  @override
  String get modelsInput => '입력';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => '지원 화면';

  @override
  String get modelsStatusInstalled => '설치됨 (앱 포함)';

  @override
  String get modelsStatusNotInstalled => '설치되지 않음';

  @override
  String get modelsSelected => '선택됨';

  @override
  String get modelsUse => '이 모델 사용';

  @override
  String get modelsSwitching => '모델 불러오는 중…';

  @override
  String modelsSwitched(String name) {
    return '$name 모델이 활성화되었어요';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return '이 기기에서 측정: 평균 $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => '이 기기에서 측정되지 않음';

  @override
  String get modelsBenchmarkRun => '벤치마크 실행';

  @override
  String get modelsBenchmarkRunning => '벤치마크 진행 중…';

  @override
  String get modelsBenchmarkSelectHint => '벤치마크하려면 이 모델을 선택하세요.';

  @override
  String get modelsBenchmarkDone => '벤치마크 완료';

  @override
  String modelsBenchmarkFailed(String message) {
    return '벤치마크 실패: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return '최종 업데이트: $date';
  }

  @override
  String get safetyTitle => '안전 정보';

  @override
  String get safetyIntro =>
      'Corvista는 운전 인지를 돕는 보조 도구입니다. 차량을 제어하지 않으며, 운전자의 주의력, 판단력 또는 차량의 안전 시스템을 대신할 수 없습니다.';

  @override
  String get safetyBeforeTitle => '운전 전에';

  @override
  String get safetyBefore1 =>
      '시야, 에어백, 조작 장치를 가리지 않는 합법적인 위치에 iPhone을 단단히 거치하세요.';

  @override
  String get safetyBefore2 => '설정을 마치고, 화면을 선택하고, 목적지를 정하는 일은 주차한 상태에서 하세요.';

  @override
  String get safetyBefore3 => '장거리 주행에는 충전기를 연결하고, 가능하면 직사광선을 피해 주세요.';

  @override
  String get safetyWhileTitle => '운전 중에';

  @override
  String get safetyWhile1 => '항상 도로를 주시하세요. 화면의 큰 조작 버튼은 안전하고 합법적인 경우에만 사용하세요.';

  @override
  String get safetyWhile2 =>
      '알림은 보조 수단이며 신뢰할 수 있는 경고가 아닙니다. 알림이 없다고 해서 도로가 안전하다는 뜻은 아닙니다.';

  @override
  String get safetyWhile3 =>
      '앱과 교통 법규, 신호, 표지판이 다를 때는 앱이 아닌 교통 법규, 신호, 표지판을 따르세요.';

  @override
  String get safetyLimitsTitle => '한계';

  @override
  String get safetyLimits1 =>
      '휴대폰 카메라 한 대는 정면에 있는 것만 볼 수 있습니다. 시야 밖에 있거나 가려져 있거나 매우 가까운 객체는 감지되지 않습니다.';

  @override
  String get safetyLimits2 =>
      '특히 야간, 비, 안개, 눈부심이 있거나 앞유리가 더러울 때는 감지가 누락되거나 늦거나 잘못될 수 있습니다.';

  @override
  String get safetyLimits3 =>
      '지원되는 범주만 인식합니다: 차량, 버스, 오토바이, 자전거, 사람, 신호등, 정지 표지판. 가상 화면의 차선 표시는 양식화된 것이며 감지된 차선이 아닙니다.';

  @override
  String get safetyLimits4 =>
      '근접도는 대략적인 구간(매우 가까움, 가까움, 보통, 멀음)으로 표시되며 측정된 거리가 아닙니다. 주차 화면은 주차 센서를 대신할 수 없습니다.';

  @override
  String get safetyHeatTitle => '발열 및 배터리';

  @override
  String get safetyHeat1 =>
      '카메라와 AI를 계속 사용하면 iPhone이 뜨거워집니다. 기기가 뜨거워지면 Corvista가 분석 빈도를 낮추고 경고를 표시하며, iOS가 과열되면 카메라가 중지될 수 있습니다.';

  @override
  String get safetyEmergencyTitle => '긴급 기능';

  @override
  String get safetyEmergency1 =>
      '충격 가능성 감지는 실험적 기능입니다. 실제 충돌을 놓칠 수 있으며 다른 상황에서 작동할 수도 있습니다.';

  @override
  String get safetyEmergency2 =>
      '누구에게도 몰래 연락하지 않으며, iOS가 항상 전화나 메시지 전송 전에 확인을 요청합니다. 직접 긴급 구조 서비스에 전화하는 것을 대신할 수 없습니다.';

  @override
  String get privacyTitle => '개인정보';

  @override
  String get privacyIntro =>
      'Corvista는 주행 데이터를 iPhone 안에만 보관하도록 설계되었습니다. Corvista 계정은 없으며, Corvista는 자체 서버를 운영하지 않습니다.';

  @override
  String get privacyCameraTitle => '카메라 및 AI';

  @override
  String get privacyCamera1 =>
      '객체 감지, 추적, 분할은 모두 iPhone에서 실행됩니다. 카메라 프레임은 업로드되지 않습니다.';

  @override
  String get privacyCamera2 =>
      '카메라는 Corvista가 화면에 열려 있는 동안에만 작동하며, 앱이 백그라운드로 가면 멈춥니다. 숨겨진 백그라운드 녹화는 없습니다.';

  @override
  String get privacyRecordingsTitle => '녹화';

  @override
  String get privacyRecordings1 =>
      '순환 버퍼는 임시이며 계속 덮어쓰입니다. 영상은 ‘사고 저장’을 누르거나, 사용을 설정한 경우 충격 가능성이 감지된 후에만 보관됩니다.';

  @override
  String get privacyRecordings2 =>
      '저장된 클립은 iPhone의 Corvista 전용 저장 공간에 보관됩니다. 공유를 선택할 때만 기기 밖으로 나갑니다. 앱을 삭제하면 클립도 삭제됩니다.';

  @override
  String get privacyRecordings3 => '오디오는 사용자가 켜고 마이크 접근을 허용한 경우에만 녹음됩니다.';

  @override
  String get privacyLocationTitle => '위치';

  @override
  String get privacyLocation1 =>
      '앱이 열려 있는 동안 속도, 지도, 경로, 날씨를 위해 위치를 사용합니다. “위치 저장”이 켜져 있으면 저장 시점의 위치가 기기의 클립과 함께 보관됩니다.';

  @override
  String get privacyNetworkTitle => '네트워크 서비스';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — 지도 표시, 장소 검색, 경로. 검색어와 대략적인 위치가 Apple에 전송됩니다.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather(WeatherKit) — 현재 위치의 현재 및 시간별 날씨.';

  @override
  String get privacyNetwork4 => 'Corvista에는 광고가 없으며 제3자 분석이나 추적도 없습니다.';

  @override
  String get privacyEmergencyTitle => '긴급 연락처';

  @override
  String get privacyEmergency1 =>
      '선택한 연락처는 이 기기의 iOS 키체인에 저장됩니다. 음성 취소는 가능한 경우 기기 내 음성 인식을 사용합니다. 전화와 메시지는 iOS에서 확인한 후에만 전송됩니다.';

  @override
  String get privacyControlsTitle => '사용자 제어';

  @override
  String get privacyControls1 =>
      '클립은 언제든지 클립 화면에서 삭제할 수 있으며, 카메라, 마이크, 위치, 음성 인식 접근 권한은 iOS 설정에서 변경하거나 해제할 수 있습니다.';

  @override
  String get termsTitle => '이용약관';

  @override
  String get termsIntro =>
      'Corvista를 사용하면 이 약관에 동의하는 것으로 간주됩니다. Apple의 표준 Licensed Application End User License Agreement도 적용됩니다.';

  @override
  String get termsUseTitle => 'Corvista 사용';

  @override
  String get termsUse1 =>
      'Corvista는 운전 인지와 블랙박스를 돕는 보조 도구입니다. 안전하고 합법적으로 운전할 책임은 항상 전적으로 사용자에게 있습니다.';

  @override
  String get termsUse2 =>
      '운전 중 주의를 분산시키는 방식으로 앱을 조작하지 마세요. 기기는 안전하고 합법적으로 거치하세요.';

  @override
  String get termsAccuracyTitle => '정확성 보증 없음';

  @override
  String get termsAccuracy1 =>
      '감지, 구간, 알림, 지도 표시, 경로, 날씨는 불완전하거나 지연되거나 잘못될 수 있습니다. Corvista는 차량을 제어하지 않습니다.';

  @override
  String get termsAccuracy2 => '긴급 기능은 실험적이며 충격을 감지하지 못하거나 잘못 작동할 수 있습니다.';

  @override
  String get termsRecordingTitle => '녹화 관련 법규';

  @override
  String get termsRecording1 =>
      '블랙박스, 음성 녹음, 사람 촬영에 관한 법규는 국가와 지역에 따라 다릅니다. 클립을 공유할 때를 포함하여 이를 준수할 책임은 사용자에게 있습니다.';

  @override
  String get termsLiabilityTitle => '책임';

  @override
  String get termsLiability1 =>
      '앱은 “있는 그대로” 제공됩니다. 법이 허용하는 범위에서 개발자는 앱의 사용이나 출력 결과에 대한 의존으로 인한 사고, 손실, 벌금 또는 손해에 대해 책임지지 않습니다.';

  @override
  String get termsChangesTitle => '변경';

  @override
  String get termsChanges1 =>
      '이 약관은 앱의 새 버전과 함께 업데이트될 수 있습니다. 업데이트 후에도 계속 사용하면 변경된 약관에 동의한 것으로 간주됩니다.';

  @override
  String get helpTitle => '도움말';

  @override
  String get helpIntro => '자주 묻는 질문에 대한 답변입니다. 안전 지침은 안전 정보를 참조하세요.';

  @override
  String get helpQSave => '사고 영상은 어떻게 보관하나요?';

  @override
  String get helpASaveBuffer =>
      '드라이브 화면의 큰 ‘사고 저장’ 버튼을 누르세요. Corvista가 순환 버퍼의 직전 20초 또는 30초(설정 › 녹화에서 선택)를 클립에 저장합니다.';

  @override
  String get helpQWhere => '클립은 어디에 저장되나요?';

  @override
  String get helpAWhere =>
      'iPhone의 Corvista 전용 저장 공간에 저장되며 업로드되지 않습니다. 클립을 보내거나 내보내려면 플레이어에서 공유를 사용하세요.';

  @override
  String get helpQZones => '근접 구간은 얼마나 정확한가요?';

  @override
  String get helpAZones =>
      '구간은 일반적인 객체 크기를 바탕으로 카메라 한 대로 추정한 대략적인 값입니다. 거리가 아닌 대략적인 참고용으로만 활용하세요.';

  @override
  String get helpQSlow => '감지가 느려지는 이유는 무엇인가요?';

  @override
  String get helpASlow =>
      'iPhone이 뜨거워지거나 배터리가 부족하거나 저전력 모드가 켜져 있으면 Corvista가 기기를 보호하기 위해 분석 빈도를 낮춥니다. 전원 모드는 설정에서 변경할 수 있습니다.';

  @override
  String get helpQMap => '지도, 검색, 날씨가 작동하지 않아요.';

  @override
  String get helpAMap =>
      '이 기능들은 인터넷 연결과 위치 접근이 필요합니다. 연결 상태를 확인하고 iOS 설정에서 Corvista의 위치 접근을 허용하세요.';

  @override
  String get helpQSimulator => '카메라를 사용할 수 없다고 나와요.';

  @override
  String get helpASimulator =>
      'iOS 설정에서 카메라 접근이 허용되어 있고 다른 앱이 카메라를 사용하고 있지 않은지 확인하세요. iOS 시뮬레이터에는 카메라가 없으므로 로컬 테스트 영상을 대신 사용할 수 있습니다.';

  @override
  String get emergencyMsgNoContacts => '먼저 긴급 연락처를 추가하세요.';

  @override
  String get cameraStarting => '카메라 시작 중…';

  @override
  String get cameraInterrupted => '카메라 일시정지됨';

  @override
  String get cameraInterruptedBody =>
      '통화 중이거나 다른 앱이 카메라를 사용하는 등의 이유로 iOS가 카메라를 일시정지했어요. 자동으로 다시 시작됩니다.';

  @override
  String get cameraUnavailable => '카메라를 사용할 수 없음';

  @override
  String get cameraUnavailableBody =>
      '이 기기에서 사용할 수 있는 카메라가 없어요. 감지, 녹화, 주차 화면에는 후면 카메라가 필요합니다.';

  @override
  String get cameraRunTestFootage => '테스트 영상 실행';

  @override
  String get cameraPermissionDenied => '카메라 접근이 꺼져 있음';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista는 감지, 블랙박스 녹화, 주차 화면을 위해 카메라가 필요해요. 설정에서 카메라 접근을 켜세요.';

  @override
  String get cameraError => '카메라 오류';

  @override
  String get cameraStopped => '카메라 정지됨';

  @override
  String get cameraStart => '카메라 시작';

  @override
  String get cameraFocusHint => '탭하여 초점 맞추기';

  @override
  String get cameraPreviewLabel => '감지된 객체가 표시된 실시간 카메라 화면';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return '카메라 $fps fps · AI $hz Hz · $ms ms · 누락 $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return '속도 $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'GPS 속도 없음';

  @override
  String hudHeading(String direction, String degrees) {
    return '방향 $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds초';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return '블랙박스 버퍼 녹화 중, $target초 중 $seconds초 저장됨';
  }

  @override
  String get hudRecIdle => 'REC 꺼짐';

  @override
  String get hudRecSaving => '저장 중…';

  @override
  String get hudRecError => 'REC 오류';

  @override
  String get hudAiPaused => 'AI 일시정지';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '객체 $count개',
      zero: '객체 없음',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '객체 $count개 감지됨',
      zero: '감지된 객체 없음',
    );
    return 'AI 모델 $model, $_temp0';
  }

  @override
  String get hudThermalSerious => '뜨거움 — AI 속도 낮춤';

  @override
  String get hudThermalCritical => '너무 뜨거움 — AI 일시정지';

  @override
  String hudBatteryLow(String percent) {
    return '배터리 $percent';
  }

  @override
  String get hudLowPower => '저전력 모드';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return '날씨 $temperature, $condition. 탭하면 자세히 볼 수 있어요.';
  }

  @override
  String get hudNoGuidance => '지도 화면에서 목적지를 검색하면 여기에 턴 바이 턴 안내가 표시됩니다.';

  @override
  String get navArrived => '목적지에 도착했습니다';

  @override
  String get navRerouting => '경로 재탐색 중…';

  @override
  String get navSearchHint => '목적지 검색';

  @override
  String get navSearchFieldHint => '주소, 장소 또는 업체';

  @override
  String get navNoResults => '일치하는 장소 없음';

  @override
  String get navSearching => '검색 중…';

  @override
  String get navSearchStartTyping =>
      '주소나 장소 이름을 입력하세요. 결과는 Apple Maps에서 제공되며 인터넷 연결이 필요합니다.';

  @override
  String get navErrorUnavailable => '검색과 경로를 사용할 수 없어요. 인터넷 연결을 확인하세요.';

  @override
  String get navErrorNoLocation => '경로를 계획하기 위해 위치를 기다리는 중이에요.';

  @override
  String get navErrorPermission => '위치 접근이 꺼져 있어 현재 위치에서 경로를 시작할 수 없어요.';

  @override
  String navErrorGeneric(String code) {
    return '경로를 불러오지 못했어요 ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return '$place까지의 경로';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return '$time 도착';
  }

  @override
  String get navStart => '시작';

  @override
  String get navEnd => '종료';

  @override
  String get navEndLabel => '길 안내 종료';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration 남음';
  }

  @override
  String navAdvisory(String text) {
    return '안내: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes분',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours시간 $minutes분';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return '경로 $index: $name';
  }

  @override
  String get weatherTitle => '날씨';

  @override
  String weatherFeelsLike(String temperature) {
    return '체감 온도 $temperature';
  }

  @override
  String get weatherPrecipitation => '강수';

  @override
  String get weatherWind => '바람';

  @override
  String get weatherVisibility => '가시거리';

  @override
  String get weatherHumidity => '습도';

  @override
  String get weatherHourly => '향후 시간대';

  @override
  String weatherAsOf(String time) {
    return '$time 업데이트';
  }

  @override
  String get weatherRefresh => '날씨 새로고침';

  @override
  String get weatherUnavailable => '지금은 날씨를 이용할 수 없어요.';

  @override
  String get weatherNoLocation => '날씨를 보려면 위치가 필요해요.';

  @override
  String get weatherLegal => '데이터 출처 및 법적 고지';

  @override
  String weatherProvidedBy(String service) {
    return '날씨 데이터: $service';
  }

  @override
  String get weatherNow => '지금';

  @override
  String get virtualEmpty => '지원되는 객체가 감지되지 않음';

  @override
  String get virtualEmptyCameraOff => '가상 화면에는 실시간 카메라가 필요해요.';

  @override
  String get virtualLaneDisclaimer => '차선은 예시이며 감지된 것이 아닙니다.';

  @override
  String virtualNearest(String zone) {
    return '가장 가까움: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return '가상 도로 장면: $summary';
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
  String get virtualStatusLive => '작동 중';

  @override
  String get virtualStatusPaused => '일시정지';

  @override
  String get virtualStatusCameraOff => '카메라 꺼짐';

  @override
  String get virtualStatusTestFootage => '테스트 영상';

  @override
  String get virtualEmptyHint => '차량, 사람, 자전거, 신호등, 정지 표지판이 감지되면 여기에 표시됩니다.';

  @override
  String get mapRecenter => '중앙으로';

  @override
  String get mapZoomIn => '확대';

  @override
  String get mapZoomOut => '축소';

  @override
  String get mapUnsupported => '대화형 지도는 iPhone에서 사용할 수 있어요.';

  @override
  String get mapObjectsApprox => '객체 표시는 대략적인 위치입니다.';

  @override
  String get mapWeatherUnavailable => '날씨 없음';

  @override
  String get navErrorNoRoute => '이 목적지까지의 경로를 찾을 수 없어요.';

  @override
  String get navDismiss => '닫기';

  @override
  String get navGo => '출발';

  @override
  String get navFastest => '최단 시간';

  @override
  String get navThen => '이후';

  @override
  String get navRecents => '최근';

  @override
  String get navClearRecents => '지우기';

  @override
  String get navSearchSubmitHint => '검색을 눌러 일치하는 모든 장소 보기';

  @override
  String get navPlaces => '장소';

  @override
  String get navEtaLabel => '도착';

  @override
  String get navTimeLeftLabel => '남음';

  @override
  String get navOverview => '전체 보기';

  @override
  String get navMute => '음성 끄기';

  @override
  String get navUnmute => '음성 켜기';

  @override
  String get navEndConfirm => '길 안내를 종료할까요?';

  @override
  String navEndConfirmBody(String place) {
    return '$place까지의 안내가 중단됩니다.';
  }

  @override
  String navArrivedAt(String place) {
    return '$place에 도착했습니다';
  }

  @override
  String get navDone => '완료';

  @override
  String get navWeakGps => 'GPS 신호 약함';

  @override
  String get navLocationOff => '위치가 꺼져 있어요. 경로 계획과 길 안내를 하려면 켜세요.';

  @override
  String get navVoiceGuidance => '음성 안내';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance 앞에서 $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, 이어서 $second';
  }

  @override
  String get navSpeakRerouting => '경로를 다시 탐색합니다';

  @override
  String get navSpeakArrived => '목적지에 도착했습니다';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count미터',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value킬로미터',
      one: '1킬로미터',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count피트',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count야드',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return '$distance 직진입니다';
  }

  @override
  String get navErrorNoDirections =>
      '이 지역에서는 해당 여정의 길 안내를 제공하지 않아요. 다른 목적지를 선택해 보세요.';

  @override
  String navContinueFor(String distance) {
    return '$distance 직진';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value마일',
      one: '1마일',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return '가장 가까움: $object · $zone';
  }

  @override
  String get parkingNothing => '화면에 감지된 것이 없음';

  @override
  String get parkingBeeps => '근접 경고음';

  @override
  String get parkingVolume => '경고음 볼륨';

  @override
  String get parkingLimitations =>
      '카메라 한 대 방식이며 360°가 아닙니다. 카메라 시야 밖의 객체는 감지되지 않습니다. 주차 센서를 대신할 수 없으며, 추정이 틀릴 수 있고 경고음이 없다고 해서 주변이 안전하다는 뜻은 아닙니다.';

  @override
  String parkingTopDownLabel(String summary) {
    return '위에서 본 근접 화면. $summary';
  }

  @override
  String get perceptionModeOriginal => '원본';

  @override
  String get perceptionModeBoxes => '박스';

  @override
  String get perceptionModeMasks => '객체 마스크';

  @override
  String get perceptionModeRoad => '노면';

  @override
  String get perceptionModeCombined => '통합';

  @override
  String get perceptionOpacity => '마스크 불투명도';

  @override
  String get perceptionDisclaimer =>
      '노면 마스크는 대략적인 시각적 레이어입니다. 주행 가능 공간이나 차선을 나타내지 않습니다.';

  @override
  String get perceptionNeedsModel => '마스크를 보려면 분할 모델을 선택하세요.';

  @override
  String get perceptionChooseModel => '모델 선택';

  @override
  String get perceptionWaiting => '첫 분할 프레임을 기다리는 중…';

  @override
  String get perceptionShortCamera => '카메라';

  @override
  String get perceptionShortBoxes => '박스';

  @override
  String get perceptionShortObjects => '객체';

  @override
  String get perceptionShortRoad => '도로';

  @override
  String get perceptionShortAll => '전체';

  @override
  String get perceptionModesLabel => '인식 레이어';

  @override
  String get perceptionStatusWarmingUp => '준비 중…';

  @override
  String get perceptionStatusLoadingModel => '모델 불러오는 중…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => '마스크 일시 중지됨';

  @override
  String get perceptionLegend => '마스크 범례';

  @override
  String get perceptionUnavailable => '마스크를 사용할 수 없음';

  @override
  String get driveSave => '저장';

  @override
  String get driveSaveIncident => '사고 저장';

  @override
  String driveSaveHint(int seconds) {
    return '직전 $seconds초 분량의 블랙박스 영상을 저장합니다';
  }

  @override
  String get driveSaving => '사고 저장 중…';

  @override
  String hudRecManualLabel(String time) {
    return '녹화 중, $time';
  }

  @override
  String get driveRecord => '녹화';

  @override
  String get driveRecordStartA11y => '녹화 시작';

  @override
  String driveRecordStopA11y(String time) {
    return '녹화 중지, $time 녹화됨';
  }

  @override
  String get driveRecordHint => '중지할 때까지 직전 5초를 포함해 계속 녹화합니다';

  @override
  String get driveRecordFailed => '녹화를 시작하지 못했어요';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '녹화를 저장했어요 · $count개 파트',
      one: '녹화를 저장했어요',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': '녹화 중지됨: 저장 공간이 거의 가득 찼어요',
      'max_duration': '녹화 중지됨: 최대 길이에 도달했어요',
      'camera_stopped': '카메라와 함께 녹화가 중지됐어요',
      'background': '녹화 중지됨: 앱이 백그라운드로 전환됐어요',
      'thermal': '녹화 중지됨: 휴대전화가 너무 뜨거워요',
      'other': '녹화가 중지됐어요',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return '사고를 저장했어요 · $duration · $resolution';
  }

  @override
  String get driveSavedView => '보기';

  @override
  String get driveSaveFailed => '사고를 저장하지 못했어요.';

  @override
  String get driveSaveNotRunning =>
      '아직 녹화가 시작되지 않았어요. 카메라가 시작될 때까지 기다린 후 다시 시도하세요.';

  @override
  String get driveSaveTestFootage =>
      '테스트 영상은 녹화되지 않아요. 사고 저장은 실시간 카메라에서 작동합니다.';

  @override
  String get driveSaveStorageFull =>
      'iPhone 저장 공간이 가득 찼어요. 공간을 확보하거나 이전 클립을 삭제하세요.';

  @override
  String get driveSaveIoError => '클립을 저장 공간에 쓰지 못했어요.';

  @override
  String get driveClips => '클립';

  @override
  String get driveSettings => '설정';

  @override
  String get driveViewSwitcher => '주행 화면';

  @override
  String get driveLocationDenied => '위치가 꺼져 있어요. 속도, 지도, 경로를 사용할 수 없습니다.';

  @override
  String get driveCameraDenied => '카메라 접근이 꺼져 있어요. 감지와 녹화를 사용할 수 없습니다.';

  @override
  String get driveRecorderFallback => '오디오 없이 녹화 중: 마이크 접근이 꺼져 있어요.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return '녹화 설정이 조정되었어요: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhone이 뜨거워요. 열을 식히기 위해 AI가 느리게 실행됩니다. 직사광선을 피하고 송풍구 근처에 두세요.';

  @override
  String get drivePowerThermalCritical =>
      'iPhone이 너무 뜨거워요. 식을 때까지 AI 감지가 일시정지되며, 가능하면 녹화는 계속됩니다.';

  @override
  String get drivePowerLowPower => '저전력 모드가 켜져 있어요. AI가 낮은 빈도로 실행됩니다.';

  @override
  String get drivePowerBatteryLow => '배터리가 부족해요. 주행 중에는 iPhone을 전원에 연결하세요.';

  @override
  String get onboardingTitle1 => '모든 주행을 더 멀리 내다보세요.';

  @override
  String get onboardingBody1 => 'iPhone을 지능형 블랙박스이자 운전 인지 도우미로 바꿔 보세요.';

  @override
  String get onboardingTitle2 => '모든 프레임에 담긴 지능.';

  @override
  String get onboardingBody2 => '지원되는 차량, 사람, 자전거, 도로 신호를 iPhone에서 바로 인식합니다.';

  @override
  String get onboardingTitle3 => '하나의 도로, 여러 시점.';

  @override
  String get onboardingBody3 => '실시간 감지, 가상 주행 화면, 대화형 지도, 주차 시각화를 자유롭게 전환하세요.';

  @override
  String get onboardingTitle4 => '소중한 순간을 간직하세요.';

  @override
  String get onboardingBody4 => '최근 블랙박스 영상을 저장하고, 사고를 확인하고, 녹화본을 공유하세요.';

  @override
  String get onboardingTitle5 => '안전 및 개인정보';

  @override
  String get onboardingSafety1 => 'Corvista는 운전 인지를 돕는 보조 도구입니다. 항상 도로를 주시하세요.';

  @override
  String get onboardingSafety2 => '차량을 제어하지 않으며 운전자의 판단을 대신하지 않습니다.';

  @override
  String get onboardingSafety3 => '감지와 추정은 부정확하거나 누락될 수 있습니다.';

  @override
  String get onboardingSafety4 => '카메라 처리는 iPhone에서 이루어지며 영상은 업로드되지 않습니다.';

  @override
  String get onboardingSafety5 => '지도, 검색, 경로, 날씨에는 인터넷 연결이 필요합니다.';

  @override
  String get onboardingSafety6 => '시야를 가리지 않도록 iPhone을 단단히 거치하세요.';

  @override
  String get onboardingSafety7 => '운전을 시작하기 전에 설정을 마치세요.';

  @override
  String get onboardingAcknowledge =>
      'Corvista는 인지 보조 도구이며, 안전한 운전에 대한 책임은 제게 있음을 이해합니다.';

  @override
  String get onboardingReadSafety => '전체 안전 정보 읽기';

  @override
  String get onboardingNext => '다음';

  @override
  String get onboardingSkip => '건너뛰기';

  @override
  String get onboardingAgree => '계속';

  @override
  String onboardingPageLabel(int current, int total) {
    return '$total페이지 중 $current페이지';
  }

  @override
  String get permTitle => '권한';

  @override
  String get permIntro => 'Corvista는 각 기능에 필요한 권한만 요청합니다. 언제든지 설정에서 변경할 수 있어요.';

  @override
  String get permCameraTitle => '카메라';

  @override
  String get permCameraBody => '감지, 블랙박스 녹화, 주차 화면에 필요합니다. 영상은 iPhone에서 처리됩니다.';

  @override
  String get permLocationTitle => '위치';

  @override
  String get permLocationBody =>
      'GPS 속도, 지도, 경로, 날씨, 저장된 클립 위치 기록에 사용됩니다. 앱을 사용하는 동안에만 사용합니다.';

  @override
  String get permMicTitle => '마이크';

  @override
  String get permSpeechNote => '음성 인식은 긴급 알림에서 음성 취소를 켠 경우에만 요청됩니다.';

  @override
  String get permRequired => '필수';

  @override
  String get permOptional => '선택';

  @override
  String get permAllow => '허용';

  @override
  String get permGranted => '허용됨';

  @override
  String get permDenied => '거부됨';

  @override
  String get permLimited => '제한됨';

  @override
  String get permRestricted => '제한됨(관리)';

  @override
  String get permStart => '주행 시작';

  @override
  String get permCameraNeeded =>
      '카메라 접근 없이도 계속할 수 있지만, 설정에서 허용하기 전까지 감지와 녹화는 작동하지 않아요.';

  @override
  String get permSetupIntro =>
      'Corvista가 제대로 작동하려면 이 권한들이 필요해요. ‘모두 허용’을 누르면 iOS가 하나씩 차례로 요청합니다. 언제든지 설정에서 변경할 수 있어요.';

  @override
  String get permCameraLine =>
      '감지, 블랙박스 녹화, 주차 화면에 필요합니다. 영상은 iPhone에서 처리되며 업로드되지 않습니다.';

  @override
  String get permLocationLine =>
      'GPS 속도, 지도, 경로, 날씨, 클립이 저장된 위치. 앱을 사용하는 동안에만 사용합니다.';

  @override
  String get permMicLine => '사고 클립의 차내 소리와 긴급 알림 중 취소 문구 인식에 사용됩니다.';

  @override
  String get permSpeechTitle => '음성 인식';

  @override
  String get permSpeechLine =>
      '긴급 카운트다운 중 취소 문구를 인식합니다. 지원되는 경우 iPhone에서 처리됩니다.';

  @override
  String get permAllowAll => '모두 허용';

  @override
  String permAsking(String permission) {
    return '$permission 권한을 요청하는 중…';
  }

  @override
  String get permSomeDenied => '일부 권한이 꺼져 있어요. 해당 기능을 사용하려면 설정에서 켜세요.';

  @override
  String get permNotNow => '나중에';

  @override
  String get tourLabel => '주행 화면 둘러보기';

  @override
  String tourProgress(int current, int total) {
    return '$total단계 중 $current단계';
  }

  @override
  String get tourNext => '다음';

  @override
  String get tourBack => '뒤로';

  @override
  String get tourSkip => '둘러보기 건너뛰기';

  @override
  String get tourFinish => '주행 시작';

  @override
  String get tourWelcomeTitle => '빠른 둘러보기';

  @override
  String get tourWelcomeBody => '주행 화면의 핵심만 1분 만에 살펴봅니다. 주차한 상태에서 하는 것이 좋아요.';

  @override
  String get tourHudTitle => '계기 영역';

  @override
  String get tourHudSpeed => '속도는 GPS에서 가져옵니다.';

  @override
  String get tourHudRec => 'REC는 버퍼에 저장된 영상의 초 단위 길이를 보여줍니다.';

  @override
  String get tourHudAi =>
      'AI 칩은 모델, 인식한 객체 수, 상태 표시등을 보여줍니다. 초록은 실행 중, 주황은 제한됨, 빨강은 정지입니다.';

  @override
  String get tourSaveTitle => '사고 저장';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista는 직전 $seconds초 분량의 영상을 순환 버퍼에 담아 둡니다. 계속 덮어쓰이므로 저장을 누르지 않으면 아무것도 보관되지 않습니다. 저장된 클립은 이 iPhone의 클립에 남습니다.';
  }

  @override
  String get tourRecordTitle => '주행 전체를 녹화하세요';

  @override
  String get tourRecordBody =>
      '녹화를 누르면 중지할 때까지 계속 촬영합니다. 긴 주행은 5분 단위로 클립에 저장되며, 녹화 중에도 ‘사고 저장’이 계속 작동합니다.';

  @override
  String get tourViewsTitle => '도로를 보는 다섯 가지 방법';

  @override
  String get tourViewDetection => '지원되는 객체 주위에 박스가 표시되는 실시간 카메라.';

  @override
  String get tourViewVirtual => '감지 결과로 만든 단순화된 3D 장면.';

  @override
  String get tourViewMap => '검색과 턴 바이 턴 안내가 있는 Apple Maps.';

  @override
  String get tourViewParking => '카메라와 위에서 본 근접 화면.';

  @override
  String get tourViewPerception => '도로 및 객체 마스크.';

  @override
  String get tourMapTitle => '검색 및 턴 바이 턴';

  @override
  String get tourMapBody =>
      '지도를 열고 검색창을 탭해 목적지를 고르세요. 경로를 선택한 뒤 시작을 누르면 턴 바이 턴 안내가 시작됩니다. 인터넷 연결이 필요합니다.';

  @override
  String get tourClipsTitle => '클립';

  @override
  String get tourClipsBody =>
      '저장된 사고 영상을 확인하고, 이름을 바꾸고, 공유하거나 삭제하세요. 공유하지 않는 한 클립은 iPhone에만 남습니다.';

  @override
  String get tourSettingsTitle => '설정';

  @override
  String get tourSettingsBody =>
      '음성 알림과 민감도, 녹화 화질과 버퍼 길이를 조정하고, 취소 카운트다운이 있는 실험적 충격 알림인 긴급 모드를 설정하세요.';

  @override
  String get tourSafetyTitle => '운전 전에';

  @override
  String get tourSafety1 => '시야를 가리지 않는 곳에 iPhone을 단단히 거치하세요.';

  @override
  String get tourSafety2 => '운전 중에는 앱을 조작하지 마세요. 설정은 주차한 상태에서 하세요.';

  @override
  String get tourSafety3 => '감지와 구간은 추정값입니다. 틀리거나 누락될 수 있어요.';

  @override
  String get tourSafety4 => '안전 운전에 대한 책임은 운전자에게 있습니다.';

  @override
  String get helpTakeTour => '둘러보기 시작';

  @override
  String get helpTakeTourSub => '주행 화면을 1분 만에 안내해 드려요.';

  @override
  String get tripsTitle => '주행 기록';

  @override
  String get tripsOpen => '주행 기록';

  @override
  String get tripsEmptyTitle => '아직 주행 기록이 없어요';

  @override
  String get tripsEmptyBody =>
      'Corvista로 운전하는 동안 거리, 시간, 속도, 이동 경로가 자동으로 기록됩니다.';

  @override
  String get tripsDisabledBody =>
      '주행 기록이 꺼져 있어 새 주행이 기록되지 않아요. 켜면 이 iPhone에 경로의 비공개 기록이 보관됩니다.';

  @override
  String get tripsEnable => '주행 기록 켜기';

  @override
  String get tripsToday => '오늘';

  @override
  String get tripsYesterday => '어제';

  @override
  String tripsRecordingNow(String distance) {
    return '주행 기록 중 · $distance';
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
      other: '사고 $count건',
      one: '사고 1건',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '알림 $count건',
      one: '알림 1건',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '주행 $count건',
      zero: '주행 없음',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => '거리';

  @override
  String get tripsStatDuration => '소요 시간';

  @override
  String get tripsStatMoving => '주행 시간';

  @override
  String get tripsStatAvgSpeed => '평균 속도';

  @override
  String get tripsStatMaxSpeed => '최고 속도';

  @override
  String get tripsDetections => '감지';

  @override
  String get tripsNoDetections => '이 주행에서는 기록된 도로 객체가 없어요.';

  @override
  String get tripsTimeline => '타임라인';

  @override
  String get tripsEventStart => '주행 시작';

  @override
  String get tripsEventEnd => '주행 종료';

  @override
  String get tripsEventAlert => '음성 알림';

  @override
  String get tripsEventIncident => '사고 클립 저장됨';

  @override
  String get tripsEventEmergency => '충돌 가능성 감지됨';

  @override
  String get tripsEventNavStart => '길 안내 시작';

  @override
  String get tripsEventArrive => '목적지 도착';

  @override
  String get tripsEventReroute => '경로 재탐색됨';

  @override
  String get tripsEventRecording => '녹화 저장됨';

  @override
  String get tripsOpenClip => '클립 열기';

  @override
  String get tripsTrackPreview => 'GPS 경로';

  @override
  String get tripsRenameTitle => '주행 이름 변경';

  @override
  String get tripsRenameHint => '주행 이름';

  @override
  String get tripsFavorite => '즐겨찾기에 추가';

  @override
  String get tripsUnfavorite => '즐겨찾기에서 제거';

  @override
  String get tripsShareGpx => 'GPX 공유';

  @override
  String get tripsShareFailed => '이 주행을 공유하지 못했어요.';

  @override
  String get tripsDelete => '주행 삭제';

  @override
  String get tripsDeleteConfirmTitle => '이 주행을 삭제할까요?';

  @override
  String get tripsDeleteConfirmBody =>
      '경로와 통계가 이 iPhone에서 삭제됩니다. 이 주행의 사고 클립은 유지됩니다.';

  @override
  String get tripsDeleted => '주행을 삭제했어요';

  @override
  String get tripsNotFound => '이 주행은 더 이상 사용할 수 없어요.';

  @override
  String get tripsPrivacyNote => '이 iPhone에만 저장됩니다. 업로드되는 것은 없습니다.';

  @override
  String get settingsSectionTrips => '주행 기록';

  @override
  String get settingsTripLog => '주행 기록 저장';

  @override
  String get settingsTripLogSubtitle => '경로와 주행 통계를 이 iPhone에만 보관합니다.';

  @override
  String get settingsTripRetention => '주행 기록 보관 기간';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1년';

  @override
  String get settingsRetentionForever => '영구';

  @override
  String get settingsTripRetentionFooter =>
      '오래된 주행 기록은 Corvista가 시작될 때 자동으로 삭제됩니다.';

  @override
  String get settingsViewTrips => '주행 기록 보기';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours시간 $minutes분';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes분';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista 주행 $date';
  }

  @override
  String get settingsFreeUpSpace => '공간 확보';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      '임시 파일과 캐시를 삭제합니다. 저장된 클립과 주행 기록은 유지됩니다.';

  @override
  String settingsFreedBytes(String size) {
    return '$size 확보됨';
  }

  @override
  String get settingsNothingToFree => '캐시를 비웠어요. 삭제할 임시 파일이 없습니다.';

  @override
  String get settingsSectionPrivacyData => '개인정보 및 데이터';

  @override
  String get settingsPrivacyDataFooter =>
      '클립, 주행 기록, 설정은 이 iPhone에만 저장됩니다. 직접 공유하기로 선택한 경우에만 외부로 전달됩니다.';

  @override
  String get settingsDeleteAllData => '모든 데이터 삭제';

  @override
  String get settingsDeleteAllDataSubtitle =>
      '이 iPhone에서 클립, 주행 기록, 연락처, 설정 지우기';

  @override
  String get deleteAllTitle => '모든 데이터를 삭제할까요?';

  @override
  String get deleteAllMessage =>
      '이 iPhone에서 다음 항목이 영구적으로 삭제됩니다.\n• 사고 클립 및 썸네일\n• 주행 기록 및 GPS 경로\n• 긴급 연락처 및 긴급 이벤트\n• 감지 로그 및 진단 로그\n• 설정 및 최근 목적지\n• 임시 녹화 버퍼 및 캐시\n\n되돌릴 수 없습니다. 이후 Corvista는 시작 화면부터 다시 시작됩니다.';

  @override
  String get deleteAllConfirm => '모두 삭제';

  @override
  String get deleteAllInProgress => '삭제 중…';

  @override
  String get deleteAllDone => '모든 데이터를 삭제했어요';

  @override
  String get deleteAllPartial => '일부 항목을 삭제하지 못했어요. 설정에서 다시 시도하세요.';

  @override
  String get diagLogSection => '진단 로그';

  @override
  String get diagLogFooter =>
      '오류는 위치, 연락처 이름, 전화번호 없이 이 iPhone에만 기록됩니다. 직접 공유하지 않는 한 아무것도 전송되지 않습니다.';

  @override
  String get diagLogShare => '진단 로그 공유';

  @override
  String get diagLogEmpty => '비어 있음';

  @override
  String get diagLogClear => '로그 지우기';

  @override
  String get diagLogClearTitle => '진단 로그를 지울까요?';

  @override
  String get diagLogClearBody => '저장된 오류 기록이 이 iPhone에서 삭제됩니다.';

  @override
  String get diagLogCleared => '진단 로그를 지웠어요';

  @override
  String get diagLogShareFailed => '진단 로그를 공유하지 못했어요.';

  @override
  String get privacyControls2 =>
      '설정 › 개인정보 및 데이터 › 모든 데이터 삭제를 누르면 Corvista가 이 iPhone에 저장한 모든 클립, 주행 기록, 연락처, 로그, 설정이 삭제됩니다.';

  @override
  String get parkingZoneStop => '정지';

  @override
  String get parkingZoneVeryClose => '매우 가까움';

  @override
  String get parkingZoneClose => '가까움';

  @override
  String get parkingZoneNothingClose => '가까운 물체가 보이지 않음';

  @override
  String get parkingNotDetected => '벽, 기둥, 말뚝, 연석은 감지되지 않습니다';

  @override
  String get parkingApprox => '약';

  @override
  String get parkingSideLeft => '왼쪽';

  @override
  String get parkingSideCenter => '중앙';

  @override
  String get parkingSideRight => '오른쪽';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => '전면 카메라 화면 전용 — 360° 시스템이 아닙니다';

  @override
  String get parkingMuteBeeps => '경고음 끄기';

  @override
  String get parkingUnmuteBeeps => '경고음 켜기';

  @override
  String get parkingAbout => '주차 보기 정보';

  @override
  String get parkingLimitationsDetail =>
      '카메라 앞쪽 영역만 살펴봅니다. 승용차, 버스, 트럭, 사람, 자전거, 오토바이를 인식합니다. 벽, 기둥, 말뚝, 연석, 볼라드, 차단기, 낮은 장애물은 감지되지 않으며, 보닛이 바로 앞 지면을 가릴 수 있습니다. 거리는 카메라 한 대(물체 크기와 위치)로 추정한 대략적인 값이라 크게 틀릴 수 있습니다. 소리가 없거나 ‘가까운 물체가 보이지 않음’이라고 표시되어도 길이 비어 있다는 뜻은 아니니, 항상 주변을 살피고 거울을 확인하세요.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return '방향별 근접도: 왼쪽 $left, 중앙 $center, 오른쪽 $right';
  }

  @override
  String get privacyDiagnostics1 =>
      '오류는 이 iPhone의 비공개 로그에 기록됩니다(위치, 연락처 이름, 전화번호 제외). 자동으로 전송되지 않으며, 설정 › 진단에서 공유하거나 지울 수 있습니다.';
}
