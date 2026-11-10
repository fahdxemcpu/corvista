// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'ドライブの景色を、もっと豊かに。';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonDelete => '削除';

  @override
  String get commonSave => '保存';

  @override
  String get commonBack => '戻る';

  @override
  String get commonClose => '閉じる';

  @override
  String get commonRetry => '再試行';

  @override
  String get commonOpenSettings => '設定を開く';

  @override
  String get commonLoading => '読み込み中…';

  @override
  String get commonError => '問題が発生しました。';

  @override
  String commonErrorDetail(String message) {
    return '問題が発生しました：$message';
  }

  @override
  String get commonOn => 'オン';

  @override
  String get commonOff => 'オフ';

  @override
  String get commonRename => '名称変更';

  @override
  String get commonShare => '共有';

  @override
  String get commonNotAvailable => '利用できません';

  @override
  String get commonTestFootage => 'テスト映像';

  @override
  String get zoneVeryClose => '非常に近い';

  @override
  String get zoneClose => '近い';

  @override
  String get zoneMedium => '中距離';

  @override
  String get zoneFar => '遠い';

  @override
  String get zoneUnknown => '不明';

  @override
  String get classPerson => '人';

  @override
  String get classBicycle => '自転車';

  @override
  String get classMotorcycle => 'バイク';

  @override
  String get classCar => '車両';

  @override
  String get classBus => 'バス';

  @override
  String get classTrafficLight => '信号機';

  @override
  String get classStopSign => '一時停止標識';

  @override
  String get viewDetection => '検出';

  @override
  String get viewVirtual => 'バーチャル';

  @override
  String get viewMap => 'マップ';

  @override
  String get viewParking => '駐車';

  @override
  String get viewPerception => 'パーセプション';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => '赤';

  @override
  String get lightYellow => '黄';

  @override
  String get lightGreen => '青';

  @override
  String get lightUnknown => '不明';

  @override
  String get clipsTitle => 'クリップ';

  @override
  String get clipsSelect => '選択';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件を選択中',
      one: '1件を選択中',
      zero: 'クリップを選択',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'すべて選択';

  @override
  String get clipsDeselectAll => 'すべて選択解除';

  @override
  String get clipsDeleteSelected => '選択項目を削除';

  @override
  String get clipsGridView => 'グリッド表示';

  @override
  String get clipsListView => 'リスト表示';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のクリップを削除しますか？',
      one: 'このクリップを削除しますか？',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'これらのビデオはiPhoneから完全に削除されます。この操作は取り消せません。',
      one: 'このビデオはiPhoneから完全に削除されます。この操作は取り消せません。',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のクリップを削除しました',
      one: 'クリップを削除しました',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'クリップはまだありません';

  @override
  String get clipsEmptyBody =>
      '運転中、Corvistaは短い映像を循環バッファに保持します。「イベントを保存」をタップすると、直近の映像がここに保存されます。';

  @override
  String get clipsLoadError => 'クリップを読み込めませんでした。';

  @override
  String get clipsStorageTitle => 'ストレージ';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'クリップ $clips · バッファ $buffer · 空き $free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '保存済みクリップ$count件',
      one: '保存済みクリップ1件',
      zero: '保存されたクリップなし',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow => 'iPhoneのストレージが不足しています。新しいイベントを保存できない場合があります。';

  @override
  String get clipsMissingFile => 'ファイルなし';

  @override
  String get clipsEmergencyBadge => '衝撃';

  @override
  String clipsUntitled(String date) {
    return 'イベント · $date';
  }

  @override
  String get clipsAudio => '音声あり';

  @override
  String get clipsFavorite => 'お気に入り';

  @override
  String get clipsUnfavorite => 'お気に入りから削除';

  @override
  String get clipsLocation => '位置情報あり';

  @override
  String clipsOpenClip(String title) {
    return 'クリップ「$title」を開く';
  }

  @override
  String get playerNotFoundTitle => 'クリップが見つかりません';

  @override
  String get playerNotFoundBody => 'このクリップは削除された可能性があります。';

  @override
  String get playerMissingTitle => 'ビデオファイルがありません';

  @override
  String get playerMissingBody => 'このクリップの録画はiPhoneに残っていません。ギャラリーから項目を削除できます。';

  @override
  String get playerRemoveEntry => '項目を削除';

  @override
  String get playerLoadError => 'このビデオを再生できません。';

  @override
  String get playerPlay => '再生';

  @override
  String get playerPause => '一時停止';

  @override
  String get playerReplay => 'もう一度再生';

  @override
  String get playerRenameTitle => 'クリップの名称変更';

  @override
  String get playerRenameHint => 'クリップ名';

  @override
  String get playerRenamed => 'クリップの名称を変更しました';

  @override
  String get playerFavorited => 'お気に入りに追加しました';

  @override
  String get playerUnfavorited => 'お気に入りから削除しました';

  @override
  String get playerShareFailed => 'このクリップを共有できませんでした。';

  @override
  String get playerDetails => '詳細';

  @override
  String get playerDate => '録画日時';

  @override
  String get playerDuration => '長さ';

  @override
  String get playerResolution => '解像度';

  @override
  String get playerSize => 'ファイルサイズ';

  @override
  String get playerAudio => '音声';

  @override
  String get playerAudioYes => '録音あり';

  @override
  String get playerAudioNo => '録音なし';

  @override
  String get playerReason => '保存元';

  @override
  String get playerReasonManual => '「イベントを保存」ボタン';

  @override
  String get playerReasonEmergency => '衝撃の可能性を検知';

  @override
  String get playerReasonRecovered => '中断後に復元';

  @override
  String get playerSpeed => '保存時のGPS速度';

  @override
  String get playerLocation => '位置情報';

  @override
  String get playerOpenInMaps => 'マップで開く';

  @override
  String get playerBack => '戻る';

  @override
  String get playerMore => 'その他の操作';

  @override
  String get clipsFilterLabel => '表示';

  @override
  String get clipsFilterAll => 'すべて';

  @override
  String get clipsFilterRecordings => '録画';

  @override
  String get clipsFilterIncidents => 'イベント';

  @override
  String get clipsFilterEmergency => '緊急';

  @override
  String get clipsFilterFavorites => 'お気に入り';

  @override
  String get clipsSort => '並べ替え';

  @override
  String get clipsSortNewest => '新しい順';

  @override
  String get clipsSortOldest => '古い順';

  @override
  String get clipsSortLongest => '長い順';

  @override
  String get clipsSortLargest => 'サイズの大きい順';

  @override
  String get clipsToday => '今日';

  @override
  String get clipsYesterday => '昨日';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のクリップ',
      one: '1件のクリップ',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'このカテゴリにはまだクリップがありません。';

  @override
  String get clipsFavoritesEmpty => 'クリップにスターを付けると、ここからすばやくアクセスできます。';

  @override
  String get clipsKindRecording => '録画';

  @override
  String get clipsKindIncident => 'イベント';

  @override
  String get clipsKindEmergency => '緊急';

  @override
  String get clipsKindTest => 'テスト';

  @override
  String clipsTripChip(String time) {
    return 'トリップ · $time';
  }

  @override
  String get clipsOpenTrip => 'このクリップを録画したトリップを開く';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '使用 $used · 空き $free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'クリップの使用量 $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の録画',
      one: '1件の録画',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のイベント',
      one: '1件のイベント',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の緊急',
      one: '1件の緊急',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => '空き容量を増やす';

  @override
  String get clipsStorageLowGentle =>
      '空き容量が2 GB未満です。録画を円滑に続けるには、空き容量を増やすか、不要なクリップを削除してください。';

  @override
  String get clipsSaveToPhotos => '写真に保存';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のクリップ',
      one: '1件のクリップ',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のクリップ（$size）を削除しますか？',
      one: 'このクリップ（$size）を削除しますか？',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return '写真に保存中（$done/$total）…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のクリップを写真に保存しました',
      one: '写真に保存しました',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved件を写真に保存 · $failed件は保存できませんでした';
  }

  @override
  String get clipsPhotosDenied => 'Corvistaは写真にビデオを追加できません。設定で許可できます。';

  @override
  String get clipsPhotosFailed => '写真に保存できませんでした。';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のクリップをお気に入りに追加しました',
      one: 'お気に入りに追加しました',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のクリップをお気に入りから削除しました',
      one: 'お気に入りから削除しました',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title（トリミング済み）';
  }

  @override
  String get playerTrim => 'トリミング';

  @override
  String get playerInfo => '情報';

  @override
  String get playerKind => '種類';

  @override
  String get playerReasonRecording => '録画ボタン';

  @override
  String get trimTitle => 'クリップをトリミング';

  @override
  String get trimHint => 'ハンドルをドラッグして、残す部分を選択します。元のクリップは変更されません。';

  @override
  String get trimStartHandle => 'トリミングの開始位置';

  @override
  String get trimEndHandle => 'トリミングの終了位置';

  @override
  String trimSelection(String duration) {
    return '$durationを選択中';
  }

  @override
  String get trimSave => '新しいクリップとして保存';

  @override
  String get trimSaving => 'トリミングしたクリップを保存中…';

  @override
  String get trimSaved => 'トリミングしたクリップを保存しました';

  @override
  String get trimOpenNew => '開く';

  @override
  String get trimFailed => 'このクリップをトリミングできませんでした。';

  @override
  String get trimStorageFull => 'トリミングしたクリップを保存するための空き容量が足りません。';

  @override
  String get trimPreview => '選択範囲を再生';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsSectionCamera => 'カメラ';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'アラート';

  @override
  String get settingsSectionAlertCategories => 'アラートの種類';

  @override
  String get settingsSectionRecording => '録画';

  @override
  String get settingsSectionDriving => '運転';

  @override
  String get settingsSectionPower => '電源';

  @override
  String get settingsSectionEmergency => '緊急時';

  @override
  String get settingsSectionAppearance => '外観';

  @override
  String get settingsSectionLanguage => '言語';

  @override
  String get settingsSectionInformation => '情報';

  @override
  String get settingsCameraLens => 'カメラレンズ';

  @override
  String get settingsLensWide => '広角';

  @override
  String get settingsLensUltraWide => '超広角';

  @override
  String get settingsLensTelephoto => '望遠';

  @override
  String get settingsLensUnavailable => 'このiPhoneでは利用できません';

  @override
  String get settingsStabilization => '手ぶれ補正';

  @override
  String get settingsStabAuto => '自動';

  @override
  String get settingsStabOff => 'オフ';

  @override
  String get settingsStabStandard => '標準';

  @override
  String get settingsStabCinematic => 'シネマティック';

  @override
  String get settingsOverlayOpacity => 'オーバーレイの不透明度';

  @override
  String get settingsShowFps => 'パフォーマンス情報を表示';

  @override
  String get settingsShowFpsSubtitle => '検出ビューにフレームレートと推論時間を表示します';

  @override
  String get settingsCameraFooter => 'レンズと手ぶれ補正の変更は、次回カメラを起動したときに反映されます。';

  @override
  String get settingsAiModel => 'AIモデル';

  @override
  String get settingsConfidence => '検出の信頼度';

  @override
  String get settingsTracking => '物体トラッキング';

  @override
  String get settingsTrackingSubtitle => 'フレーム間で物体を安定して捉えます';

  @override
  String get settingsShowLabels => 'ラベルを表示';

  @override
  String get settingsShowConfidence => '信頼度を表示';

  @override
  String get settingsSegmentationOpacity => 'パーセプションマスクの不透明度';

  @override
  String get settingsAiFooter =>
      '信頼度を下げると検出される物体は増えますが、誤検出も増えます。検出結果が正確でない場合があります。';

  @override
  String get settingsVoiceAlerts => '音声アラート';

  @override
  String get settingsVoiceLanguage => '音声の言語';

  @override
  String get settingsVoiceLanguageAuto => 'Appの言語に合わせる';

  @override
  String get settingsVoice => '音声';

  @override
  String get settingsVoiceDefault => 'システムデフォルト';

  @override
  String get settingsVoiceQualityEnhanced => '拡張';

  @override
  String get settingsVoiceQualityPremium => '高品質';

  @override
  String get settingsNoVoices =>
      'この言語の音声がインストールされていません。iOSの設定 › アクセシビリティ › 読み上げコンテンツ で追加してください。';

  @override
  String get settingsAlertPedestrian => '歩行者';

  @override
  String get settingsAlertCyclist => '自転車';

  @override
  String get settingsAlertMotorcycle => 'バイク';

  @override
  String get settingsAlertBus => 'バス';

  @override
  String get settingsAlertVehicleClose => '前方の車両が非常に近い';

  @override
  String get settingsAlertTrafficLight => '信号の変化';

  @override
  String get settingsAlertTrafficMoving => '前方の車列が動き出した';

  @override
  String get settingsAlertStopSign => '一時停止標識';

  @override
  String get settingsSensitivity => '感度';

  @override
  String get settingsSensitivityLow => '低';

  @override
  String get settingsSensitivityMedium => '中';

  @override
  String get settingsSensitivityHigh => '高';

  @override
  String get settingsCooldown => '繰り返し間隔';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds秒';
  }

  @override
  String get settingsVolume => '音声の音量';

  @override
  String get settingsQuietMode => '静音モード';

  @override
  String get settingsQuietModeSubtitle => '最も重要なアラートのみ読み上げます';

  @override
  String get settingsTestVoice => '音声をテスト';

  @override
  String get settingsTestVoiceDone => 'サンプルアラートを再生中…';

  @override
  String get settingsParkingBeeps => '駐車ビープ音';

  @override
  String get settingsBeepVolume => 'ビープ音の音量';

  @override
  String get settingsAlertsFooter =>
      'アラートはあくまで補助です。常に道路状況に注意してください。アラートが出ないことは、安全であることを意味しません。';

  @override
  String get settingsRecordingProfile => '録画品質';

  @override
  String get settingsProfileStandard => '標準 · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'イベントバッファ';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds秒';
  }

  @override
  String get settingsManualMaxLength => '手動録画の最大時間';

  @override
  String get settingsManualMaxUnlimited => '無制限';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes分';
  }

  @override
  String get settingsRecordAudio => '音声を録音';

  @override
  String get settingsRecordAudioSubtitle => '保存したイベントに車内の音声を含めます';

  @override
  String get settingsMicDenied => 'マイクへのアクセスがオフです。音声を録音するには、設定で許可してください。';

  @override
  String get settingsWatermark => 'Corvistaのウォーターマーク';

  @override
  String get settingsTimestamp => '日付と時刻のスタンプ';

  @override
  String get settingsSaveLocation => 'クリップに位置情報を保存';

  @override
  String get settingsStorage => 'ストレージとクリップ';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'クリップ$count件',
      one: 'クリップ1件',
      zero: 'クリップなし',
    );
    return '$_temp0 · 使用中 $used · 空き $free';
  }

  @override
  String get settingsRecordingFooter =>
      '循環バッファはiPhone内に保持され、継続的に上書きされます。バックグラウンドでは録画しません。';

  @override
  String get settingsDefaultView => 'デフォルトのビュー';

  @override
  String get settingsUnits => '単位';

  @override
  String get settingsShowCompass => 'コンパスを表示';

  @override
  String get settingsHudStyle => 'HUDスタイル';

  @override
  String get settingsHudCustomize => 'HUDをカスタマイズ';

  @override
  String get settingsDrivingSide => '通行区分';

  @override
  String get settingsDrivingSideAuto => '自動';

  @override
  String get settingsDrivingSideRight => '右側通行';

  @override
  String get settingsDrivingSideLeft => '左側通行';

  @override
  String get settingsVirtualStyle => 'バーチャルビューのスタイル';

  @override
  String get settingsVirtualMinimal => 'ミニマル';

  @override
  String get settingsVirtualPerspective => 'パースペクティブ';

  @override
  String get settingsVirtualHighContrast => 'ハイコントラスト';

  @override
  String get settingsKeepScreenOn => '運転中は画面を点灯したままにする';

  @override
  String get settingsLiveActivity => 'ライブアクティビティ';

  @override
  String get settingsLiveActivityDesc => 'ロック画面とDynamic Islandにターンバイターン案内を表示';

  @override
  String get driveRecordingPausedBackground =>
      'Corvistaがバックグラウンドの間、録画を一時停止しました';

  @override
  String get liveActivityRec => '録画中';

  @override
  String get liveActivityPaused => '一時停止';

  @override
  String get liveActivityDashcamOff => 'カメラオフ';

  @override
  String get liveActivityEnded => 'ナビを終了しました';

  @override
  String get liveActivityEta => '到着';

  @override
  String get settingsAutoRecenter => 'マップを自動で現在地に戻す';

  @override
  String get settingsHudStyleClassic => 'クラシック';

  @override
  String get settingsHudStyleGrid => 'グリッド';

  @override
  String get settingsHudStyleMinimal => 'ミニマル';

  @override
  String get settingsHudStylePerformance => 'パフォーマンス';

  @override
  String get settingsHudStyleNavigation => 'ナビゲーション';

  @override
  String get settingsHudStyleNight => 'ナイト';

  @override
  String get settingsHudStyleHighContrast => 'ハイコントラスト';

  @override
  String get settingsPowerMode => '電源モード';

  @override
  String get settingsPowerBalanced => 'バランス';

  @override
  String get settingsPowerPerformance => 'パフォーマンス';

  @override
  String get settingsPowerSaver => '省電力';

  @override
  String get settingsPowerFooter =>
      'iPhoneが熱くなったりバッテリー残量が少なくなったりすると、CorvistaはAIの処理頻度と視覚効果を自動的に下げます。';

  @override
  String get settingsThermal => '温度状態';

  @override
  String get settingsThermalNominal => '正常';

  @override
  String get settingsThermalFair => 'やや高温';

  @override
  String get settingsThermalSerious => '高温';

  @override
  String get settingsThermalCritical => '危険';

  @override
  String get settingsBattery => 'バッテリー';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · 充電中';
  }

  @override
  String get settingsLowPowerMode => '低電力モードがオンです。AIは低い頻度で動作します。';

  @override
  String get settingsAiRate => '現在のAI処理頻度';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => '衝撃検知';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'オン · カウントダウン$seconds秒';
  }

  @override
  String get settingsEmergencyFooter => '試験的な機能です。緊急通報サービスの代わりにはなりません。';

  @override
  String get settingsTheme => 'テーマ';

  @override
  String get settingsThemeSystem => 'システム';

  @override
  String get settingsThemeDark => 'ダーク';

  @override
  String get settingsThemeLight => 'ライト';

  @override
  String get settingsReduceMotion => '視差効果を減らす';

  @override
  String get settingsReduceMotionSubtitle => 'App全体のアニメーションを抑えます';

  @override
  String get settingsAppLanguage => 'Appの言語';

  @override
  String get settingsPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get settingsTerms => '利用規約';

  @override
  String get settingsHelp => 'ヘルプ';

  @override
  String get settingsSupport => 'サポートに問い合わせる';

  @override
  String get settingsLicenses => 'オープンソースライセンス';

  @override
  String get settingsSupportUnavailable =>
      'メールを開けませんでした。support@corvista.appまでご連絡ください。';

  @override
  String get settingsSafety => '安全に関する情報';

  @override
  String get settingsDiagnostics => '診断';

  @override
  String get settingsVersion => 'バージョン';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'HUDをカスタマイズ';

  @override
  String get hudCustomPreview => 'プレビュー · サンプル値';

  @override
  String get hudCustomStyle => 'スタイル';

  @override
  String get hudCustomElements => '要素';

  @override
  String get hudCustomSpeed => '速度';

  @override
  String get hudCustomHeading => '方位とコンパス';

  @override
  String get hudCustomClock => '時計';

  @override
  String get hudCustomBattery => 'バッテリーと温度';

  @override
  String get hudCustomDetections => 'AIの状態と検出';

  @override
  String get hudCustomWeather => '天気';

  @override
  String get hudCustomAppearance => 'サイズと不透明度';

  @override
  String get hudCustomSize => 'サイズ';

  @override
  String get hudCustomOpacity => '不透明度';

  @override
  String get hudCustomFooter => '要素を非表示にしても、過熱などの警告は常に表示されます。';

  @override
  String get hudCustomDescClassic => 'バランスの取れたメーターパネル';

  @override
  String get hudCustomDescGrid => '道路に重ねるパースペクティブグリッド';

  @override
  String get hudCustomDescMinimal => '速度のみのシンプル表示';

  @override
  String get hudCustomDescPerformance => '速度アークとリアルタイム表示';

  @override
  String get hudCustomDescNavigation => '次の操作を優先して表示';

  @override
  String get hudCustomDescNight => '夜間運転向けに暗く赤みを帯びた表示';

  @override
  String get hudCustomDescHighContrast => '明るい日差しの下でも見やすい表示';

  @override
  String get languageTitle => '言語';

  @override
  String get languageSystem => 'システムデフォルト';

  @override
  String get languageSystemSubtitle => 'iPhoneの言語に合わせます';

  @override
  String get languageFooter => '対応言語は今後追加される予定です。音声アラートの言語は「アラート」で個別に設定できます。';

  @override
  String get diagTitle => '診断';

  @override
  String get diagPerformance => 'パフォーマンス';

  @override
  String get diagInference => '推論時間';

  @override
  String get diagDetectHz => '検出頻度';

  @override
  String get diagCameraFps => 'カメラのフレームレート';

  @override
  String get diagMemory => 'メモリ';

  @override
  String get diagDropped => 'ドロップしたフレーム';

  @override
  String get diagSegmentation => 'セグメンテーション時間';

  @override
  String get diagCamera => 'カメラ';

  @override
  String get diagStatus => 'ステータス';

  @override
  String get diagSource => 'ソース';

  @override
  String get diagSourceCamera => 'ライブカメラ';

  @override
  String get diagSourceFile => 'テスト映像ファイル';

  @override
  String get diagResolution => 'バッファサイズ';

  @override
  String get diagLens => 'レンズ';

  @override
  String get diagError => '直近のエラー';

  @override
  String get diagModel => 'AIモデル';

  @override
  String get diagModelLoad => 'モデルの読み込み時間';

  @override
  String get diagPower => '電源';

  @override
  String get diagSegHz => 'セグメンテーション頻度';

  @override
  String get diagReduced => '効果を軽減';

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
  String get diagCamIdle => '待機中';

  @override
  String get diagCamStarting => '起動中';

  @override
  String get diagCamRunning => '動作中';

  @override
  String get diagCamInterrupted => '中断';

  @override
  String get diagCamStopped => '停止';

  @override
  String get diagCamUnavailable => '利用不可';

  @override
  String get diagCamPermissionDenied => '許可されていません';

  @override
  String get diagCamError => 'エラー';

  @override
  String get diagTestFootage => 'テスト映像';

  @override
  String get diagTestFootageBody =>
      'カメラの代わりにローカルのビデオファイルでデバイス上の実際の検出を実行します。すべてのビューに「テスト映像」と表示されます。';

  @override
  String get diagPathLabel => 'ビデオファイルのパス';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Documents/test_drive.mp4 を使用';

  @override
  String get diagRun => 'テスト映像を実行';

  @override
  String get diagRunStarted => 'テスト映像を開始しました。ドライブビューで確認できます。';

  @override
  String get diagBackToCamera => 'ライブカメラに戻る';

  @override
  String get diagDebugOnly => 'テスト映像は開発ビルドでのみ利用できます。';

  @override
  String get diagFileMissing => 'このパスにファイルがありません。';

  @override
  String get emergencySetupTitle => '衝撃検知';

  @override
  String get emergencyExperimental => '試験的';

  @override
  String get emergencyIntro =>
      '運転中、CorvistaはiPhoneのモーションセンサーを使って、深刻な衝撃の可能性を監視できます。検知するとカウントダウンが始まり、キャンセルしない場合は、緊急通報サービスへの発信や連絡先へのメッセージ送信を案内します。';

  @override
  String get emergencyDisclaimer1 => '緊急通報サービスや車両自体の衝突検知の代わりにはなりません。';

  @override
  String get emergencyDisclaimer2 => '電話の発信やメッセージの送信の前には、必ずiOSが確認を求めます。';

  @override
  String get emergencyDisclaimer3 =>
      '衝撃を検知できない場合があります。また、急ブレーキや段差が衝撃と誤検知されることもあります。';

  @override
  String get emergencyParkedWarning => 'この設定は駐車中に行ってください。走行中は設定を変更できません。';

  @override
  String get emergencyEnable => '衝撃検知を有効にする';

  @override
  String get emergencyEnableSubtitle => 'ドライブ中のみ動作します';

  @override
  String get emergencyNeedNumber => '先に緊急連絡先の電話番号を追加してください。';

  @override
  String get emergencyContacts => '緊急連絡先';

  @override
  String get emergencyAddContact => '連絡先を追加';

  @override
  String get emergencyNoContacts => '連絡先はまだありません。メッセージは、あなたが確認した後にのみ送信されます。';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '$nameを削除しますか？';
  }

  @override
  String get emergencyRemoveContactBody => '衝撃を検知した後、この連絡先は送信先として表示されなくなります。';

  @override
  String get emergencyRemove => '削除';

  @override
  String get emergencyContactsError => '連絡先を読み込めませんでした。';

  @override
  String get emergencyNumber => '緊急通報の電話番号';

  @override
  String get emergencyNumberHint => '例：112、911';

  @override
  String get emergencyMessage => 'メッセージのテンプレート';

  @override
  String get emergencyMessageDefault =>
      '車の事故に遭った可能性があります。このメッセージはCorvistaが作成したもので、可能な場合は最後に確認された位置情報が含まれます。';

  @override
  String get emergencyMessageHint => '空欄の場合はデフォルトのメッセージを使用します。';

  @override
  String get emergencyCountdown => 'カウントダウンの長さ';

  @override
  String get emergencyVoiceCancel => '音声でキャンセル';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'カウントダウン中に「大丈夫」または「キャンセル」と話してください。対応している場合は、デバイス上の音声認識を使用します。';

  @override
  String get emergencyVoicePermDenied => '音声でキャンセルするには、マイクと音声認識へのアクセスが必要です。';

  @override
  String get emergencyAutoSave => 'イベントのクリップを自動で保存';

  @override
  String get emergencyTest => 'カウントダウンをテスト（発信なし）';

  @override
  String get emergencyTestBody =>
      '衝撃をシミュレートして、カウントダウンを確認できます。テストモードでは、電話の発信もメッセージの送信も行われません。';

  @override
  String get emergencyNotSet => '未設定';

  @override
  String get emergencyAlertHeadline => '深刻な衝撃の可能性を検知しました。';

  @override
  String get emergencyAlertSubtitle => '大丈夫ですか？';

  @override
  String get emergencyAlertCancel => '大丈夫です — キャンセル';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '残り$seconds秒',
      one: '残り1秒',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => '聞き取り中 — 「大丈夫」と話すとキャンセルします';

  @override
  String emergencyAlertHeard(String text) {
    return '認識結果：「$text」';
  }

  @override
  String get emergencyAlertEscalated => '応答がありません。次の操作を選んでください：';

  @override
  String get emergencyAlertCall => '緊急通報サービスに発信';

  @override
  String emergencyAlertCallNumber(String number) {
    return '$numberに発信します。iOSが確認を求めます。';
  }

  @override
  String get emergencyAlertMessage => '連絡先にメッセージ';

  @override
  String get emergencyAlertMessageSubtitle =>
      '作成済みのメッセージを開きます。送信するかどうかはあなたが選べます。';

  @override
  String get emergencyAlertTestMode => 'テストモード — 発信されません';

  @override
  String get emergencyAlertTestBadge => 'テスト';

  @override
  String get emergencyAlertClose => '大丈夫です — 閉じる';

  @override
  String get emergencyMsgSent => 'メッセージを送信しました。';

  @override
  String get emergencyMsgCancelled => 'メッセージは送信されませんでした。';

  @override
  String get emergencyMsgFailed => 'メッセージを送信できませんでした。';

  @override
  String get emergencyMsgUnavailable => 'このデバイスではメッセージを利用できません。';

  @override
  String emergencyCallFailed(String number) {
    return '発信できませんでした。$numberに直接電話してください。';
  }

  @override
  String get modelsTitle => 'AIモデル';

  @override
  String get modelsIntro =>
      'すべてのモデルはAppに内蔵されており、iPhone上だけで動作します。カメラの映像がデバイスの外に出ることはありません。';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'ライブ：1フレームあたり$ms ms · 毎秒$hz回検出';
  }

  @override
  String modelsLastLoad(String ms) {
    return '$ms msで読み込み完了';
  }

  @override
  String get modelsEfficientName => '高効率';

  @override
  String get modelsEfficientDesc =>
      '高速でコンパクトな検出モデル。長時間の運転向けに、発熱とバッテリー消費を抑えています。';

  @override
  String get modelsEnhancedName => '拡張';

  @override
  String get modelsEnhancedDesc => 'より大きな検出モデル。小さな物体や遠くの物体も捉えますが、消費電力は高くなります。';

  @override
  String get modelsSegmentationName => 'セグメンテーション';

  @override
  String get modelsSegmentationDesc =>
      '高速な検出に、路面と物体のマスクを組み合わせます。パーセプションビューで使用します。';

  @override
  String get modelsNoneName => 'AI一時停止';

  @override
  String get modelsNoneDesc => '物体検出を行わずに、カメラと録画を継続します。消費電力が最も低くなります。';

  @override
  String get modelsGenericDesc => 'デバイス上で動作する物体検出モデルです。';

  @override
  String get modelsFunctionDetection => '車両、人、自転車、バイク、バス、信号機、一時停止標識を検出します';

  @override
  String get modelsFunctionSegmentation => '路面と物体のマスクを追加します';

  @override
  String get modelsFunctionNone => '検出なし。ドライブレコーダーとしての録画のみ';

  @override
  String get modelsSize => 'サイズ';

  @override
  String get modelsInput => '入力';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => '対応ビュー';

  @override
  String get modelsStatusInstalled => 'インストール済み（内蔵）';

  @override
  String get modelsStatusNotInstalled => '未インストール';

  @override
  String get modelsSelected => '選択中';

  @override
  String get modelsUse => 'このモデルを使用';

  @override
  String get modelsSwitching => 'モデルを読み込み中…';

  @override
  String modelsSwitched(String name) {
    return '$nameに切り替えました';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'このデバイスでの実測値：平均$ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'このデバイスでは未測定';

  @override
  String get modelsBenchmarkRun => 'ベンチマークを実行';

  @override
  String get modelsBenchmarkRunning => 'ベンチマーク実行中…';

  @override
  String get modelsBenchmarkSelectHint => 'ベンチマークを行うには、このモデルを選択してください。';

  @override
  String get modelsBenchmarkDone => 'ベンチマークが完了しました';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'ベンチマークに失敗しました：$message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return '最終更新：$date';
  }

  @override
  String get safetyTitle => '安全に関する情報';

  @override
  String get safetyIntro =>
      'Corvistaは運転中の状況把握を補助するツールです。車両を制御することはなく、ご自身の注意力や判断、車両の安全システムの代わりにはなりません。';

  @override
  String get safetyBeforeTitle => '運転前に';

  @override
  String get safetyBefore1 => 'iPhoneは、視界、エアバッグ、操作部をふさがない合法的な位置にしっかり固定してください。';

  @override
  String get safetyBefore2 => '設定、ビューの選択、目的地の設定は、駐車中に済ませてください。';

  @override
  String get safetyBefore3 => '長時間の運転では充電器を接続し、できるだけiPhoneを直射日光に当てないでください。';

  @override
  String get safetyWhileTitle => '運転中は';

  @override
  String get safetyWhile1 => '常に前方を見てください。画面の大きなコントロールは、安全かつ合法な場合にのみ操作してください。';

  @override
  String get safetyWhile2 =>
      'アラートは補助であり、頼りにできる警告ではありません。アラートが出ないことは、道路が安全であることを意味しません。';

  @override
  String get safetyWhile3 => 'アプリの表示と食い違う場合は、アプリではなく、交通法規、信号、道路標識に従ってください。';

  @override
  String get safetyLimitsTitle => '制限事項';

  @override
  String get safetyLimits1 =>
      'iPhoneのカメラ1台では、映る範囲しか捉えられません。視野外、遮られた物体、至近距離の物体は検出されません。';

  @override
  String get safetyLimits2 =>
      '特に夜間、雨、霧、まぶしい光、フロントガラスの汚れがある場合、検出が漏れたり、遅れたり、誤ったりすることがあります。';

  @override
  String get safetyLimits3 =>
      '認識されるのは、対応するカテゴリのみです：車両、バス、バイク、自転車、人、信号機、一時停止標識。バーチャルビューの車線表示は演出であり、検出された車線ではありません。';

  @override
  String get safetyLimits4 =>
      '距離は、おおよそのゾーン（非常に近い、近い、中距離、遠い）で表示され、実測値ではありません。駐車ビューは、パーキングセンサーの代わりにはなりません。';

  @override
  String get safetyHeatTitle => '発熱とバッテリー';

  @override
  String get safetyHeat1 =>
      'カメラとAIを続けて使うと、iPhoneが熱くなります。デバイスが高温になると、Corvistaは分析頻度を下げて警告を表示します。iOSが過熱状態になると、カメラが停止する場合があります。';

  @override
  String get safetyEmergencyTitle => '緊急機能';

  @override
  String get safetyEmergency1 =>
      '衝撃の可能性の検知は試験的な機能です。実際の事故を検知できない場合や、他の出来事で作動する場合があります。';

  @override
  String get safetyEmergency2 =>
      'あなたに知らせずに連絡することはありません。電話の発信やメッセージの送信の前には、必ずiOSが確認を求めます。ご自身で緊急通報サービスに連絡することの代わりにはなりません。';

  @override
  String get privacyTitle => 'プライバシー';

  @override
  String get privacyIntro =>
      'Corvistaは、運転データをiPhone内にとどめるよう設計されています。Corvistaアカウントはなく、Corvista独自のサーバも運用していません。';

  @override
  String get privacyCameraTitle => 'カメラとAI';

  @override
  String get privacyCamera1 =>
      '物体の検出、トラッキング、セグメンテーションは、すべてiPhone上で実行されます。カメラの映像がアップロードされることはありません。';

  @override
  String get privacyCamera2 =>
      'カメラは、Corvistaが画面に表示されている間のみ動作します。Appがバックグラウンドに移ると停止し、バックグラウンドでの録画は行われません。';

  @override
  String get privacyRecordingsTitle => '録画';

  @override
  String get privacyRecordings1 =>
      '循環バッファは一時的なもので、継続的に上書きされます。映像が保存されるのは、「イベントを保存」をタップしたとき、または有効にしている場合に衝撃の可能性を検知したときだけです。';

  @override
  String get privacyRecordings2 =>
      '保存したクリップは、iPhone内のCorvista専用ストレージに保管されます。「共有」を選んだときにのみ、デバイスの外に出ます。Appを削除すると、クリップも削除されます。';

  @override
  String get privacyRecordings3 => '音声は、オンにしてマイクへのアクセスを許可した場合にのみ録音されます。';

  @override
  String get privacyLocationTitle => '位置情報';

  @override
  String get privacyLocation1 =>
      '位置情報は、Appを開いている間、速度、マップ、ルート、天気の表示に使用されます。「位置情報を保存」がオンの場合、保存時の位置がクリップとともにデバイス内に保存されます。';

  @override
  String get privacyNetworkTitle => 'ネットワークサービス';

  @override
  String get privacyNetwork1 =>
      'Appleマップ — マップ表示、場所の検索、ルート案内。検索テキストとおおよその位置情報がAppleに送信されます。';

  @override
  String get privacyNetwork2 => 'Apple 天気 (WeatherKit) — 現在地の現在の天気と1時間ごとの天気。';

  @override
  String get privacyNetwork4 => 'Corvistaには、広告、サードパーティの分析、トラッキングは含まれません。';

  @override
  String get privacyEmergencyTitle => '緊急連絡先';

  @override
  String get privacyEmergency1 =>
      '選択した連絡先は、このデバイスのiOSキーチェーンに保存されます。音声でのキャンセルには、対応している場合、デバイス上の音声認識を使用します。電話の発信とメッセージの送信は、iOSであなたが確認した後にのみ行われます。';

  @override
  String get privacyControlsTitle => 'お客様のコントロール';

  @override
  String get privacyControls1 =>
      'クリップはいつでも「クリップ」から削除できます。カメラ、マイク、位置情報、音声認識のアクセスは、iOSの設定で変更または取り消せます。';

  @override
  String get termsTitle => '利用規約';

  @override
  String get termsIntro =>
      'Corvistaを使用することで、これらの規約に同意したものとみなされます。Appleの標準使用許諾契約（Licensed Application End User License Agreement）も適用されます。';

  @override
  String get termsUseTitle => 'Corvistaの使用について';

  @override
  String get termsUse1 =>
      'Corvistaは、運転中の状況把握とドライブレコーダーを補助するツールです。安全かつ合法に運転する責任は、常にあなたにあります。';

  @override
  String get termsUse2 =>
      '運転の妨げとなる方法でAppを操作しないでください。デバイスは、しっかりと、かつ合法的に固定してください。';

  @override
  String get termsAccuracyTitle => '正確性の非保証';

  @override
  String get termsAccuracy1 =>
      '検出結果、ゾーン、アラート、マップのマーカー、ルート、天気は、不完全、遅延、または誤りを含む場合があります。Corvistaが車両を制御することはありません。';

  @override
  String get termsAccuracy2 => '緊急機能は試験的なもので、衝撃を検知できない場合や、誤って作動する場合があります。';

  @override
  String get termsRecordingTitle => '録画に関する法律';

  @override
  String get termsRecording1 =>
      'ドライブレコーダー、音声の録音、人物の撮影に関する法律は、国や地域によって異なります。クリップを共有する場合も含め、これらを遵守する責任はあなたにあります。';

  @override
  String get termsLiabilityTitle => '責任';

  @override
  String get termsLiability1 =>
      '本Appは「現状有姿」で提供されます。法律で認められる範囲において、開発者は、本Appの使用またはその出力への依存によって生じた事故、損失、罰金、損害について責任を負いません。';

  @override
  String get termsChangesTitle => '変更';

  @override
  String get termsChanges1 =>
      'これらの規約は、Appの新しいバージョンに合わせて更新されることがあります。更新後も使用を続けた場合、改定後の規約に同意したものとみなされます。';

  @override
  String get helpTitle => 'ヘルプ';

  @override
  String get helpIntro => 'よくある質問と回答です。安全に関する案内は「安全に関する情報」をご覧ください。';

  @override
  String get helpQSave => 'イベントの映像を残すには？';

  @override
  String get helpASaveBuffer =>
      'ドライブビューの大きな「イベントを保存」ボタンをタップします。Corvistaは、常時更新されるバッファの直近20秒または30秒（設定 › 録画で選択）をクリップに保存します。';

  @override
  String get helpQWhere => 'クリップはどこに保存されますか？';

  @override
  String get helpAWhere =>
      'iPhone内のCorvista専用ストレージに保存され、アップロードされることはありません。クリップを送信または書き出すには、プレーヤーの「共有」を使います。';

  @override
  String get helpQZones => '距離ゾーンの精度はどのくらいですか？';

  @override
  String get helpAZones =>
      'ゾーンは、1台のカメラで、一般的な物体のサイズをもとに算出した大まかな推定です。おおよその目安として扱い、距離とは受け取らないでください。';

  @override
  String get helpQSlow => '検出が遅くなるのはなぜですか？';

  @override
  String get helpASlow =>
      'iPhoneが熱くなっている、バッテリー残量が少ない、または低電力モードがオンの場合、Corvistaはデバイスを保護するために分析頻度を下げます。電源モードは設定で変更できます。';

  @override
  String get helpQMap => 'マップ、検索、天気が使えません。';

  @override
  String get helpAMap =>
      'これらの機能には、インターネット接続と位置情報へのアクセスが必要です。接続を確認し、iOSの設定でCorvistaに位置情報を許可してください。';

  @override
  String get helpQSimulator => 'カメラが利用できないと表示されます。';

  @override
  String get helpASimulator =>
      'iOSの設定でカメラへのアクセスが許可されていること、他のAppがカメラを使用していないことを確認してください。iOSシミュレータにはカメラがないため、代わりにローカルのテスト映像を使用できます。';

  @override
  String get emergencyMsgNoContacts => '先に緊急連絡先を追加してください。';

  @override
  String get cameraStarting => 'カメラを起動中…';

  @override
  String get cameraInterrupted => 'カメラを一時停止しました';

  @override
  String get cameraInterruptedBody =>
      '通話中や他のAppがカメラを使用している間など、iOSがカメラを一時停止しました。自動的に再開されます。';

  @override
  String get cameraUnavailable => 'カメラを利用できません';

  @override
  String get cameraUnavailableBody =>
      'このデバイスで利用できるカメラがありません。検出、録画、駐車ビューには背面カメラが必要です。';

  @override
  String get cameraRunTestFootage => 'テスト映像を実行';

  @override
  String get cameraPermissionDenied => 'カメラへのアクセスがオフです';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvistaは、検出、ドライブレコーダー、駐車ビューのためにカメラを必要とします。設定でカメラへのアクセスをオンにしてください。';

  @override
  String get cameraError => 'カメラエラー';

  @override
  String get cameraStopped => 'カメラが停止しました';

  @override
  String get cameraStart => 'カメラを起動';

  @override
  String get cameraFocusHint => 'タップしてフォーカス';

  @override
  String get cameraPreviewLabel => '検出された物体を表示するライブカメラ映像';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'カメラ $fps fps · AI $hz Hz · $ms ms · ドロップ $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return '速度 $speed $unit（GPS）';
  }

  @override
  String get hudSpeedUnavailable => 'GPS速度なし';

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
    return 'ドライブレコーダーのバッファを録画中、$target秒のうち$seconds秒を保持';
  }

  @override
  String get hudRecIdle => 'REC オフ';

  @override
  String get hudRecSaving => '保存中…';

  @override
  String get hudRecError => 'RECエラー';

  @override
  String get hudAiPaused => 'AI一時停止';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '物体$count個',
      one: '物体1個',
      zero: '物体なし',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '物体$count個を検出',
      one: '物体1個を検出',
      zero: '物体は検出されていません',
    );
    return 'AIモデル $model、$_temp0';
  }

  @override
  String get hudThermalSerious => '高温 — AIを減速中';

  @override
  String get hudThermalCritical => '過熱 — AI一時停止';

  @override
  String hudBatteryLow(String percent) {
    return '電池 $percent';
  }

  @override
  String get hudLowPower => '低電力モード';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return '天気 $temperature、$condition。タップして詳細を表示。';
  }

  @override
  String get hudNoGuidance => 'マップビューで目的地を検索すると、ここに曲がり角ごとのルート案内が表示されます。';

  @override
  String get navArrived => '目的地に到着しました';

  @override
  String get navRerouting => 'ルートを再検索中…';

  @override
  String get navSearchHint => '目的地を検索';

  @override
  String get navSearchFieldHint => '住所、場所、店名';

  @override
  String get navNoResults => '一致する場所がありません';

  @override
  String get navSearching => '検索中…';

  @override
  String get navSearchStartTyping =>
      '住所または場所の名前を入力してください。結果はAppleマップから取得するため、インターネット接続が必要です。';

  @override
  String get navErrorUnavailable => '検索とルートを利用できません。インターネット接続を確認してください。';

  @override
  String get navErrorNoLocation => 'ルートを計画するために、現在地の取得を待っています。';

  @override
  String get navErrorPermission => '位置情報へのアクセスがオフのため、現在地からのルートを開始できません。';

  @override
  String navErrorGeneric(String code) {
    return 'ルートを読み込めませんでした（$code）。';
  }

  @override
  String navRoutesTitle(String place) {
    return '$placeへのルート';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return '$timeに到着';
  }

  @override
  String get navStart => '開始';

  @override
  String get navEnd => '終了';

  @override
  String get navEndLabel => 'ナビゲーションを終了';

  @override
  String navRemaining(String distance, String duration) {
    return '残り $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'お知らせ：$text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes分',
      one: '1分',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours時間$minutes分';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'ルート$index：$name';
  }

  @override
  String get weatherTitle => '天気';

  @override
  String weatherFeelsLike(String temperature) {
    return '体感 $temperature';
  }

  @override
  String get weatherPrecipitation => '降水';

  @override
  String get weatherWind => '風';

  @override
  String get weatherVisibility => '視程';

  @override
  String get weatherHumidity => '湿度';

  @override
  String get weatherHourly => '今後数時間';

  @override
  String weatherAsOf(String time) {
    return '$timeに更新';
  }

  @override
  String get weatherRefresh => '天気を更新';

  @override
  String get weatherUnavailable => '現在、天気を利用できません。';

  @override
  String get weatherNoLocation => '天気の表示には位置情報が必要です。';

  @override
  String get weatherLegal => 'データソースと法的情報';

  @override
  String weatherProvidedBy(String service) {
    return '天気データ：$service';
  }

  @override
  String get weatherNow => '現在';

  @override
  String get virtualEmpty => '対応する物体は検出されていません';

  @override
  String get virtualEmptyCameraOff => 'バーチャルビューにはライブカメラが必要です。';

  @override
  String get virtualLaneDisclaimer => '車線は演出であり、検出されたものではありません。';

  @override
  String virtualNearest(String zone) {
    return '最も近い物体：$zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'バーチャル道路シーン：$summary';
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
  String get virtualStatusLive => '動作中';

  @override
  String get virtualStatusPaused => '一時停止';

  @override
  String get virtualStatusCameraOff => 'カメラオフ';

  @override
  String get virtualStatusTestFootage => 'テスト映像';

  @override
  String get virtualEmptyHint => '車両、人、自転車、信号、一時停止標識を検出すると、ここに表示されます。';

  @override
  String get mapRecenter => '現在地に戻る';

  @override
  String get mapZoomIn => '拡大';

  @override
  String get mapZoomOut => '縮小';

  @override
  String get mapUnsupported => 'インタラクティブマップはiPhoneで利用できます。';

  @override
  String get mapObjectsApprox => '物体のマーカーはおおよその位置です。';

  @override
  String get mapWeatherUnavailable => '天気を利用できません';

  @override
  String get navErrorNoRoute => 'この目的地へのルートが見つかりません。';

  @override
  String get navDismiss => '閉じる';

  @override
  String get navGo => '出発';

  @override
  String get navFastest => '最速';

  @override
  String get navThen => 'その後';

  @override
  String get navRecents => '最近';

  @override
  String get navClearRecents => '消去';

  @override
  String get navSearchSubmitHint => '「検索」を押すと一致する場所をすべて表示します';

  @override
  String get navPlaces => '場所';

  @override
  String get navEtaLabel => '到着';

  @override
  String get navTimeLeftLabel => '残り';

  @override
  String get navOverview => '全体表示';

  @override
  String get navMute => '音声をミュート';

  @override
  String get navUnmute => '音声のミュートを解除';

  @override
  String get navEndConfirm => 'ナビゲーションを終了しますか？';

  @override
  String navEndConfirmBody(String place) {
    return '$placeへの案内を停止します。';
  }

  @override
  String navArrivedAt(String place) {
    return '$placeに到着しました';
  }

  @override
  String get navDone => '完了';

  @override
  String get navWeakGps => 'GPS信号が弱い';

  @override
  String get navLocationOff => '位置情報がオフです。ルートの計画とナビゲーションを行うには、オンにしてください。';

  @override
  String get navVoiceGuidance => '音声案内';

  @override
  String navSpeakIn(String distance, String instruction) {
    return '$distance先、$instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first、その後$second';
  }

  @override
  String get navSpeakRerouting => 'ルートを再検索中';

  @override
  String get navSpeakArrived => '目的地に到着しました';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countメートル',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$valueキロメートル',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countフィート',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countヤード',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return '$distance、道なりです';
  }

  @override
  String get navErrorNoDirections => 'この地域では、この経路の案内を利用できません。別の目的地をお試しください。';

  @override
  String navContinueFor(String distance) {
    return '$distance直進';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$valueマイル',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return '最も近い物体：$object · $zone';
  }

  @override
  String get parkingNothing => '視野内に検出された物体はありません';

  @override
  String get parkingBeeps => '接近ビープ音';

  @override
  String get parkingVolume => 'ビープ音の音量';

  @override
  String get parkingLimitations =>
      'カメラは1台のみで、360°ではありません。カメラの視野外の物体は検出されません。パーキングセンサーの代わりにはなりません。推定は誤っている場合があり、ビープ音が鳴らないことは、周囲が安全であることを意味しません。';

  @override
  String parkingTopDownLabel(String summary) {
    return '真上から見た接近ビュー。$summary';
  }

  @override
  String get perceptionModeOriginal => 'オリジナル';

  @override
  String get perceptionModeBoxes => 'ボックス';

  @override
  String get perceptionModeMasks => '物体マスク';

  @override
  String get perceptionModeRoad => '路面';

  @override
  String get perceptionModeCombined => '複合';

  @override
  String get perceptionOpacity => 'マスクの不透明度';

  @override
  String get perceptionDisclaimer =>
      '路面マスクは、おおよその視覚的なレイヤーです。走行可能な空間や車線を示すものではありません。';

  @override
  String get perceptionNeedsModel => 'マスクを表示するには、セグメンテーションモデルを選択してください。';

  @override
  String get perceptionChooseModel => 'モデルを選択';

  @override
  String get perceptionWaiting => '最初のセグメンテーションフレームを待っています…';

  @override
  String get perceptionShortCamera => 'カメラ';

  @override
  String get perceptionShortBoxes => 'ボックス';

  @override
  String get perceptionShortObjects => '物体';

  @override
  String get perceptionShortRoad => '路面';

  @override
  String get perceptionShortAll => 'すべて';

  @override
  String get perceptionModesLabel => 'パーセプションレイヤー';

  @override
  String get perceptionStatusWarmingUp => '準備中…';

  @override
  String get perceptionStatusLoadingModel => 'モデルを読み込み中…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'マスク一時停止中';

  @override
  String get perceptionLegend => 'マスクの凡例';

  @override
  String get perceptionUnavailable => 'マスクを利用できません';

  @override
  String get driveSave => '保存';

  @override
  String get driveSaveIncident => 'イベントを保存';

  @override
  String driveSaveHint(int seconds) {
    return '直近$seconds秒のドライブレコーダー映像を保存します';
  }

  @override
  String get driveSaving => 'イベントを保存中…';

  @override
  String hudRecManualLabel(String time) {
    return '録画中、$time';
  }

  @override
  String get driveRecord => '録画';

  @override
  String get driveRecordStartA11y => '録画を開始';

  @override
  String driveRecordStopA11y(String time) {
    return '録画を停止、$time録画済み';
  }

  @override
  String get driveRecordHint => '停止するまで、直前の5秒を含めて連続で録画します';

  @override
  String get driveRecordFailed => '録画を開始できませんでした';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '録画を保存しました · $countパート',
      one: '録画を保存しました',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': '録画を停止しました：空き容量がほとんどありません',
      'max_duration': '録画を停止しました：最大時間に達しました',
      'camera_stopped': 'カメラの停止に伴い録画を停止しました',
      'background': '録画を停止しました：アプリがバックグラウンドに移りました',
      'thermal': '録画を停止しました：iPhoneが高温になっています',
      'other': '録画を停止しました',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'イベントを保存しました · $duration · $resolution';
  }

  @override
  String get driveSavedView => '表示';

  @override
  String get driveSaveFailed => 'イベントを保存できませんでした。';

  @override
  String get driveSaveNotRunning =>
      '録画がまだ開始されていません。カメラが起動するのを待ってから、もう一度お試しください。';

  @override
  String get driveSaveTestFootage => 'テスト映像は録画されません。インシデントの保存はライブカメラで利用できます。';

  @override
  String get driveSaveStorageFull =>
      'iPhoneのストレージがいっぱいです。空き容量を確保するか、古いクリップを削除してください。';

  @override
  String get driveSaveIoError => 'クリップをストレージに書き込めませんでした。';

  @override
  String get driveClips => 'クリップ';

  @override
  String get driveSettings => '設定';

  @override
  String get driveViewSwitcher => 'ドライブビュー';

  @override
  String get driveLocationDenied => '位置情報へのアクセスがオフです。速度、マップ、ルートは利用できません。';

  @override
  String get driveCameraDenied => 'カメラへのアクセスがオフです。検出と録画は利用できません。';

  @override
  String get driveRecorderFallback => '音声なしで録画中：マイクへのアクセスがオフです。';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return '録画設定が調整されました：$reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhoneが熱くなっています。冷却のためAIの動作を遅くしています。直射日光を避け、送風口の近くに置いてください。';

  @override
  String get drivePowerThermalCritical =>
      'iPhoneが高温になりすぎています。冷えるまでAI検出を一時停止します。可能な場合、録画は継続されます。';

  @override
  String get drivePowerLowPower => '低電力モードがオンです。AIは低い頻度で動作します。';

  @override
  String get drivePowerBatteryLow =>
      'バッテリー残量が少なくなっています。運転中はiPhoneを電源に接続してください。';

  @override
  String get onboardingTitle1 => 'ドライブの景色を、もっと豊かに。';

  @override
  String get onboardingBody1 => 'iPhoneを、インテリジェントなドライブレコーダー兼、運転中の状況把握のパートナーに。';

  @override
  String get onboardingTitle2 => 'すべてのフレームに、インテリジェンスを。';

  @override
  String get onboardingBody2 => '対応する車両、人、自転車、道路上のシグナルを、iPhone上で直接認識します。';

  @override
  String get onboardingTitle3 => 'ひとつの道、いくつもの視点。';

  @override
  String get onboardingBody3 =>
      'ライブ検出、バーチャルドライブビュー、インタラクティブマップ、駐車ビジュアライズを切り替えられます。';

  @override
  String get onboardingTitle4 => '大切な瞬間を残す。';

  @override
  String get onboardingBody4 => '直近のドライブレコーダー映像を保存し、イベントを見返して、録画を共有できます。';

  @override
  String get onboardingTitle5 => '安全とプライバシー';

  @override
  String get onboardingSafety1 => 'Corvistaは運転中の状況把握を補助するツールです。常に前方を見てください。';

  @override
  String get onboardingSafety2 => '車両を制御することはなく、あなたの判断の代わりにもなりません。';

  @override
  String get onboardingSafety3 => '検出や推定は、不正確であったり、漏れたりすることがあります。';

  @override
  String get onboardingSafety4 => 'カメラ映像の処理はiPhone上で行われます。ビデオはアップロードされません。';

  @override
  String get onboardingSafety5 => 'マップ、検索、ルート、天気にはインターネット接続が必要です。';

  @override
  String get onboardingSafety6 => '視界をさえぎらないよう、iPhoneをしっかり固定してください。';

  @override
  String get onboardingSafety7 => '運転を始める前に、設定を完了してください。';

  @override
  String get onboardingAcknowledge =>
      'Corvistaが状況把握を補助するツールであり、安全に運転する責任は自分にあることを理解しました。';

  @override
  String get onboardingReadSafety => '安全に関する情報をすべて読む';

  @override
  String get onboardingNext => '次へ';

  @override
  String get onboardingSkip => 'スキップ';

  @override
  String get onboardingAgree => '続ける';

  @override
  String onboardingPageLabel(int current, int total) {
    return '$totalページ中$currentページ';
  }

  @override
  String get permTitle => 'アクセス許可';

  @override
  String get permIntro => 'Corvistaは、各機能に必要なものだけを求めます。設定でいつでも変更できます。';

  @override
  String get permCameraTitle => 'カメラ';

  @override
  String get permCameraBody => '検出、ドライブレコーダー、駐車ビューに必要です。ビデオはiPhone上で処理されます。';

  @override
  String get permLocationTitle => '位置情報';

  @override
  String get permLocationBody =>
      'GPS速度、マップ、ルート、天気、保存したクリップの位置情報の記録に使用します。Appの使用中のみ利用されます。';

  @override
  String get permMicTitle => 'マイク';

  @override
  String get permSpeechNote => '音声認識へのアクセスは、緊急アラートの音声キャンセルをオンにした場合にのみ求められます。';

  @override
  String get permRequired => '必須';

  @override
  String get permOptional => '任意';

  @override
  String get permAllow => '許可';

  @override
  String get permGranted => '許可済み';

  @override
  String get permDenied => '拒否';

  @override
  String get permLimited => '制限あり';

  @override
  String get permRestricted => '制限されています';

  @override
  String get permStart => '運転を始める';

  @override
  String get permCameraNeeded => 'カメラへのアクセスなしで続行できますが、設定で許可するまで、検出と録画は利用できません。';

  @override
  String get permSetupIntro =>
      'Corvistaをフルに使うには、これらの許可が必要です。「すべて許可」をタップすると、iOSが順番に確認します。許可はいつでも設定で変更できます。';

  @override
  String get permCameraLine =>
      '検出、ドライブレコーダー録画、駐車ビューに必要です。映像はiPhone上で処理され、アップロードされません。';

  @override
  String get permLocationLine => 'GPS速度、マップ、ルート、天気、クリップの保存場所に使用します。アプリの使用中のみ。';

  @override
  String get permMicLine => 'イベントクリップへの車内音声の録音と、緊急アラート中のキャンセル用フレーズの聞き取りに使用します。';

  @override
  String get permSpeechTitle => '音声認識';

  @override
  String get permSpeechLine =>
      '緊急カウントダウン中にキャンセル用フレーズを認識します。対応している場合はiPhone上で処理します。';

  @override
  String get permAllowAll => 'すべて許可';

  @override
  String permAsking(String permission) {
    return '「$permission」の許可を確認中…';
  }

  @override
  String get permSomeDenied => '一部の許可がオフです。該当する機能を使うには、設定でオンにしてください。';

  @override
  String get permNotNow => '今はしない';

  @override
  String get tourLabel => '運転画面ツアー';

  @override
  String tourProgress(int current, int total) {
    return 'ステップ $current/$total';
  }

  @override
  String get tourNext => '次へ';

  @override
  String get tourBack => '戻る';

  @override
  String get tourSkip => 'ツアーをスキップ';

  @override
  String get tourFinish => '運転を始める';

  @override
  String get tourWelcomeTitle => 'クイックツアー';

  @override
  String get tourWelcomeBody => '運転画面の要点を1分で確認します。停車中にご覧ください。';

  @override
  String get tourHudTitle => 'インストルメントバー';

  @override
  String get tourHudSpeed => '速度はGPSから取得します。';

  @override
  String get tourHudRec => 'RECは、バッファされている映像の秒数を表示します。';

  @override
  String get tourHudAi =>
      'AIチップには、モデル、認識中の物体の数、状態を示すドットが表示されます。緑は動作中、オレンジは制限あり、赤は停止中です。';

  @override
  String get tourSaveTitle => 'イベントを保存';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvistaは直近$seconds秒の映像をバッファに保持します。バッファは常に上書きされるため、「保存」をタップしない限り何も残りません。保存したクリップは、このiPhoneの「クリップ」に保管されます。';
  }

  @override
  String get tourRecordTitle => 'ドライブ全体を録画';

  @override
  String get tourRecordBody =>
      '「録画」をタップすると、停止するまで連続で撮影します。長いドライブは5分ごとのパートに分けてクリップに保存され、録画中も「イベントを保存」は使えます。';

  @override
  String get tourViewsTitle => '道路を見る5つの方法';

  @override
  String get tourViewDetection => 'ライブカメラ映像に、対応する物体を枠で表示します。';

  @override
  String get tourViewVirtual => '検出結果から作る簡易的な3Dシーンです。';

  @override
  String get tourViewMap => '検索とターンバイターン案内に対応したApple Mapsです。';

  @override
  String get tourViewParking => 'カメラ映像と、真上から見た近接ビューです。';

  @override
  String get tourViewPerception => '道路と物体のマスク表示です。';

  @override
  String get tourMapTitle => '検索とターンバイターン案内';

  @override
  String get tourMapBody =>
      'マップを開き、検索バーをタップして目的地を選びます。ルートを選んで「開始」をタップすると、ターンバイターン案内が始まります。インターネット接続が必要です。';

  @override
  String get tourClipsTitle => 'クリップ';

  @override
  String get tourClipsBody =>
      '保存したイベントの確認、名称変更、共有、削除ができます。共有しない限り、クリップはiPhoneの外に出ません。';

  @override
  String get tourSettingsTitle => '設定';

  @override
  String get tourSettingsBody =>
      '音声アラートとその感度、録画品質、バッファの長さを調整できます。緊急モードも設定できます。これは、キャンセル用カウントダウン付きの試験的な衝撃アラートです。';

  @override
  String get tourSafetyTitle => '運転の前に';

  @override
  String get tourSafety1 => '視界を妨げない場所に、iPhoneをしっかり固定してください。';

  @override
  String get tourSafety2 => '運転中はアプリを操作しないでください。設定は停車中に行ってください。';

  @override
  String get tourSafety3 => '検出結果やゾーンは推定です。誤りや検出漏れがある場合があります。';

  @override
  String get tourSafety4 => '安全運転の責任は、常にドライバーにあります。';

  @override
  String get helpTakeTour => 'ツアーを見る';

  @override
  String get helpTakeTourSub => '運転画面を1分でご案内します。';

  @override
  String get tripsTitle => 'トリップ';

  @override
  String get tripsOpen => 'トリップ履歴';

  @override
  String get tripsEmptyTitle => 'トリップはまだありません';

  @override
  String get tripsEmptyBody => 'Corvistaで運転すると、距離、時間、速度、走行ルートが自動的に記録されます。';

  @override
  String get tripsDisabledBody =>
      'トリップ履歴がオフのため、新しい走行は記録されません。オンにすると、このiPhone上にルートの履歴を非公開で保存できます。';

  @override
  String get tripsEnable => 'トリップ履歴をオンにする';

  @override
  String get tripsToday => '今日';

  @override
  String get tripsYesterday => '昨日';

  @override
  String tripsRecordingNow(String distance) {
    return 'トリップを記録中 · $distance';
  }

  @override
  String tripsTimeRange(String start, String end) {
    return '$start～$end';
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
      other: 'イベント$count件',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'アラート$count件',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のトリップ',
      zero: 'トリップなし',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => '距離';

  @override
  String get tripsStatDuration => '所要時間';

  @override
  String get tripsStatMoving => '走行時間';

  @override
  String get tripsStatAvgSpeed => '平均速度';

  @override
  String get tripsStatMaxSpeed => '最高速度';

  @override
  String get tripsDetections => '検出';

  @override
  String get tripsNoDetections => 'このトリップでは、道路上の物体は記録されませんでした。';

  @override
  String get tripsTimeline => 'タイムライン';

  @override
  String get tripsEventStart => 'トリップ開始';

  @override
  String get tripsEventEnd => 'トリップ終了';

  @override
  String get tripsEventAlert => '音声アラート';

  @override
  String get tripsEventIncident => 'イベントクリップを保存しました';

  @override
  String get tripsEventEmergency => '衝突の可能性を検知';

  @override
  String get tripsEventNavStart => 'ナビゲーション開始';

  @override
  String get tripsEventArrive => '目的地に到着';

  @override
  String get tripsEventReroute => 'ルートを再計算しました';

  @override
  String get tripsEventRecording => '録画を保存しました';

  @override
  String get tripsOpenClip => 'クリップを開く';

  @override
  String get tripsTrackPreview => 'GPSトラック';

  @override
  String get tripsRenameTitle => 'トリップの名称変更';

  @override
  String get tripsRenameHint => 'トリップ名';

  @override
  String get tripsFavorite => 'お気に入りに追加';

  @override
  String get tripsUnfavorite => 'お気に入りから削除';

  @override
  String get tripsShareGpx => 'GPXを共有';

  @override
  String get tripsShareFailed => 'このトリップを共有できませんでした。';

  @override
  String get tripsDelete => 'トリップを削除';

  @override
  String get tripsDeleteConfirmTitle => 'このトリップを削除しますか？';

  @override
  String get tripsDeleteConfirmBody =>
      'ルートと統計情報がこのiPhoneから削除されます。このトリップのイベントクリップは残ります。';

  @override
  String get tripsDeleted => 'トリップを削除しました';

  @override
  String get tripsNotFound => 'このトリップは利用できなくなりました。';

  @override
  String get tripsPrivacyNote => 'このiPhoneにのみ保存されます。アップロードされることはありません。';

  @override
  String get settingsSectionTrips => 'トリップ履歴';

  @override
  String get settingsTripLog => 'トリップを記録';

  @override
  String get settingsTripLogSubtitle => 'ルートと走行統計を、このiPhoneにのみ保存します。';

  @override
  String get settingsTripRetention => 'トリップの保存期間';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1年';

  @override
  String get settingsRetentionForever => '無期限';

  @override
  String get settingsTripRetentionFooter => '古いトリップは、Corvistaの起動時に自動で削除されます。';

  @override
  String get settingsViewTrips => 'トリップを見る';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours時間$minutes分';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes分';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvistaトリップ $date';
  }

  @override
  String get settingsFreeUpSpace => '空き容量を増やす';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      '一時ファイルとキャッシュを削除します。保存したクリップとトリップは残ります。';

  @override
  String settingsFreedBytes(String size) {
    return '$sizeを解放しました';
  }

  @override
  String get settingsNothingToFree => 'キャッシュを消去しました。削除する一時ファイルはありません。';

  @override
  String get settingsSectionPrivacyData => 'プライバシーとデータ';

  @override
  String get settingsPrivacyDataFooter =>
      'クリップ、トリップ、設定はこのiPhoneにのみ保存されます。共有を選択した場合にのみ、外部に出ます。';

  @override
  String get settingsDeleteAllData => 'すべてのデータを削除';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'このiPhoneからクリップ、トリップ、連絡先、設定を消去します';

  @override
  String get deleteAllTitle => 'すべてのデータを削除しますか？';

  @override
  String get deleteAllMessage =>
      'このiPhoneから次の項目が完全に削除されます：\n• イベントのクリップとサムネイル\n• トリップログとGPSトラック\n• 緊急連絡先と緊急イベント\n• 検出ログと診断ログ\n• 設定と最近の目的地\n• 一時的な録画バッファとキャッシュ\n\nこの操作は取り消せません。その後、Corvistaはウェルカム画面から再開します。';

  @override
  String get deleteAllConfirm => 'すべて削除';

  @override
  String get deleteAllInProgress => '削除中…';

  @override
  String get deleteAllDone => 'すべてのデータを削除しました';

  @override
  String get deleteAllPartial => '一部の項目を削除できませんでした。設定からもう一度お試しください。';

  @override
  String get diagLogSection => '診断ログ';

  @override
  String get diagLogFooter =>
      'エラーはこのiPhoneにのみ記録され、位置情報、連絡先の名前、電話番号は含まれません。ご自身で共有しない限り、何も送信されません。';

  @override
  String get diagLogShare => '診断ログを共有';

  @override
  String get diagLogEmpty => 'なし';

  @override
  String get diagLogClear => 'ログを消去';

  @override
  String get diagLogClearTitle => '診断ログを消去しますか？';

  @override
  String get diagLogClearBody => '保存されているエラー記録がこのiPhoneから削除されます。';

  @override
  String get diagLogCleared => '診断ログを消去しました';

  @override
  String get diagLogShareFailed => '診断ログを共有できませんでした。';

  @override
  String get privacyControls2 =>
      '設定 › プライバシーとデータ › すべてのデータを削除 を実行すると、CorvistaがこのiPhoneに保存したすべてのクリップ、トリップ、連絡先、ログ、設定が消去されます。';

  @override
  String get parkingZoneStop => '停止';

  @override
  String get parkingZoneVeryClose => '非常に近い';

  @override
  String get parkingZoneClose => '近い';

  @override
  String get parkingZoneNothingClose => '近くに物体は見当たりません';

  @override
  String get parkingNotDetected => '壁、柱、ポール、縁石は検出されません';

  @override
  String get parkingApprox => '約';

  @override
  String get parkingSideLeft => '左';

  @override
  String get parkingSideCenter => '中央';

  @override
  String get parkingSideRight => '右';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => '前方カメラの映像のみ — 360°システムではありません';

  @override
  String get parkingMuteBeeps => 'ビープ音を消す';

  @override
  String get parkingUnmuteBeeps => 'ビープ音をオン';

  @override
  String get parkingAbout => '駐車ビューについて';

  @override
  String get parkingLimitationsDetail =>
      '監視するのはカメラの前方のみです。検出できるのは、乗用車、バス、トラック、人、自転車、オートバイです。壁、柱、ポール、縁石、ボラード、バリア、低い障害物は検出されず、ボンネットで真正面の地面が見えないことがあります。距離は1台のカメラ（物体の大きさと位置）からの大まかな推定で、大きく外れることがあります。音が鳴らない場合や「近くに物体は見当たりません」と表示される場合でも、進路が安全とは限りません。必ず周囲を目視し、ミラーで確認してください。';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return '方向別の近さ：左 $left、中央 $center、右 $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'エラーはこのiPhone上の非公開ログに書き込まれます（位置情報、連絡先の名前、電話番号は含まれません）。自動的に送信されることはなく、設定 › 診断 から共有または消去できます。';
}
