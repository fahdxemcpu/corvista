// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'See more of every drive.';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonSave => 'Save';

  @override
  String get commonBack => 'Back';

  @override
  String get commonClose => 'Close';

  @override
  String get commonRetry => 'Try again';

  @override
  String get commonOpenSettings => 'Open Settings';

  @override
  String get commonLoading => 'Loading…';

  @override
  String get commonError => 'Something went wrong.';

  @override
  String commonErrorDetail(String message) {
    return 'Something went wrong: $message';
  }

  @override
  String get commonOn => 'On';

  @override
  String get commonOff => 'Off';

  @override
  String get commonRename => 'Rename';

  @override
  String get commonShare => 'Share';

  @override
  String get commonNotAvailable => 'Not available';

  @override
  String get commonTestFootage => 'TEST FOOTAGE';

  @override
  String get zoneVeryClose => 'Very close';

  @override
  String get zoneClose => 'Close';

  @override
  String get zoneMedium => 'Medium';

  @override
  String get zoneFar => 'Far';

  @override
  String get zoneUnknown => 'Unknown';

  @override
  String get classPerson => 'Person';

  @override
  String get classBicycle => 'Bicycle';

  @override
  String get classMotorcycle => 'Motorcycle';

  @override
  String get classCar => 'Vehicle';

  @override
  String get classBus => 'Bus';

  @override
  String get classTrafficLight => 'Traffic light';

  @override
  String get classStopSign => 'Stop sign';

  @override
  String get viewDetection => 'Detection';

  @override
  String get viewVirtual => 'Virtual';

  @override
  String get viewMap => 'Map';

  @override
  String get viewParking => 'Parking';

  @override
  String get viewPerception => 'Perception';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Red';

  @override
  String get lightYellow => 'Yellow';

  @override
  String get lightGreen => 'Green';

  @override
  String get lightUnknown => 'Unknown';

  @override
  String get clipsTitle => 'Clips';

  @override
  String get clipsSelect => 'Select';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selected',
      one: '1 selected',
      zero: 'Select clips',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Select all';

  @override
  String get clipsDeselectAll => 'Deselect all';

  @override
  String get clipsDeleteSelected => 'Delete selected';

  @override
  String get clipsGridView => 'Grid view';

  @override
  String get clipsListView => 'List view';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count clips?',
      one: 'Delete this clip?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'These videos are permanently removed from your iPhone. This can\'t be undone.',
      one: 'The video is permanently removed from your iPhone. This can\'t be undone.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips deleted',
      one: 'Clip deleted',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'No clips yet';

  @override
  String get clipsEmptyBody =>
      'While you drive, Corvista keeps a short rolling buffer. Tap Save Incident to keep the last seconds of footage here.';

  @override
  String get clipsLoadError => 'Couldn\'t load your clips.';

  @override
  String get clipsStorageTitle => 'Storage';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Clips $clips · Buffer $buffer · $free free';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saved clips',
      one: '1 saved clip',
      zero: 'No saved clips',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Your iPhone is low on storage. New incidents may fail to save.';

  @override
  String get clipsMissingFile => 'File missing';

  @override
  String get clipsEmergencyBadge => 'Impact';

  @override
  String clipsUntitled(String date) {
    return 'Incident · $date';
  }

  @override
  String get clipsAudio => 'Audio recorded';

  @override
  String get clipsFavorite => 'Favorite';

  @override
  String get clipsUnfavorite => 'Remove from favorites';

  @override
  String get clipsLocation => 'Location saved';

  @override
  String clipsOpenClip(String title) {
    return 'Open clip $title';
  }

  @override
  String get playerNotFoundTitle => 'Clip not found';

  @override
  String get playerNotFoundBody => 'This clip may have been deleted.';

  @override
  String get playerMissingTitle => 'Video file missing';

  @override
  String get playerMissingBody =>
      'The recording for this clip is no longer on your iPhone. You can remove the entry from your gallery.';

  @override
  String get playerRemoveEntry => 'Remove entry';

  @override
  String get playerLoadError => 'This video can\'t be played.';

  @override
  String get playerPlay => 'Play';

  @override
  String get playerPause => 'Pause';

  @override
  String get playerReplay => 'Replay';

  @override
  String get playerRenameTitle => 'Rename clip';

  @override
  String get playerRenameHint => 'Clip name';

  @override
  String get playerRenamed => 'Clip renamed';

  @override
  String get playerFavorited => 'Added to favorites';

  @override
  String get playerUnfavorited => 'Removed from favorites';

  @override
  String get playerShareFailed => 'Couldn\'t share this clip.';

  @override
  String get playerDetails => 'Details';

  @override
  String get playerDate => 'Recorded';

  @override
  String get playerDuration => 'Duration';

  @override
  String get playerResolution => 'Resolution';

  @override
  String get playerSize => 'File size';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerAudioYes => 'Recorded';

  @override
  String get playerAudioNo => 'Not recorded';

  @override
  String get playerReason => 'Saved by';

  @override
  String get playerReasonManual => 'Save Incident button';

  @override
  String get playerReasonEmergency => 'Possible impact detection';

  @override
  String get playerReasonRecovered => 'Recovered after interruption';

  @override
  String get playerSpeed => 'GPS speed at save';

  @override
  String get playerLocation => 'Location';

  @override
  String get playerOpenInMaps => 'Open in Maps';

  @override
  String get playerBack => 'Back';

  @override
  String get playerMore => 'More actions';

  @override
  String get clipsFilterLabel => 'Show';

  @override
  String get clipsFilterAll => 'All';

  @override
  String get clipsFilterRecordings => 'Recordings';

  @override
  String get clipsFilterIncidents => 'Incidents';

  @override
  String get clipsFilterEmergency => 'Emergency';

  @override
  String get clipsFilterFavorites => 'Favorites';

  @override
  String get clipsSort => 'Sort';

  @override
  String get clipsSortNewest => 'Newest first';

  @override
  String get clipsSortOldest => 'Oldest first';

  @override
  String get clipsSortLongest => 'Longest first';

  @override
  String get clipsSortLargest => 'Largest first';

  @override
  String get clipsToday => 'Today';

  @override
  String get clipsYesterday => 'Yesterday';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips',
      one: '1 clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'No clips in this category yet.';

  @override
  String get clipsFavoritesEmpty =>
      'Star a clip to keep it here for quick access.';

  @override
  String get clipsKindRecording => 'Recording';

  @override
  String get clipsKindIncident => 'Incident';

  @override
  String get clipsKindEmergency => 'Emergency';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Trip · $time';
  }

  @override
  String get clipsOpenTrip => 'Open the trip this clip was recorded in';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used used · $free free';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Clips use $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count recordings',
      one: '1 recording',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count incidents',
      one: '1 incident',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emergencies',
      one: '1 emergency',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Free up space';

  @override
  String get clipsStorageLowGentle =>
      'Less than 2 GB free. To keep recording smoothly, free up space or remove clips you no longer need.';

  @override
  String get clipsSaveToPhotos => 'Save to Photos';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips',
      one: '1 clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count clips ($size)?',
      one: 'Delete this clip ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Saving $done of $total to Photos…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips saved to Photos',
      one: 'Saved to Photos',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved saved to Photos · $failed couldn\'t be saved';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista isn\'t allowed to add videos to Photos. You can allow it in Settings.';

  @override
  String get clipsPhotosFailed => 'Couldn\'t save to Photos.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips added to favorites',
      one: 'Added to favorites',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips removed from favorites',
      one: 'Removed from favorites',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (trimmed)';
  }

  @override
  String get playerTrim => 'Trim';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Type';

  @override
  String get playerReasonRecording => 'Record button';

  @override
  String get trimTitle => 'Trim clip';

  @override
  String get trimHint =>
      'Drag the handles to choose the part to keep. The original clip stays unchanged.';

  @override
  String get trimStartHandle => 'Trim start';

  @override
  String get trimEndHandle => 'Trim end';

  @override
  String trimSelection(String duration) {
    return '$duration selected';
  }

  @override
  String get trimSave => 'Save as new clip';

  @override
  String get trimSaving => 'Saving trimmed clip…';

  @override
  String get trimSaved => 'Trimmed clip saved';

  @override
  String get trimOpenNew => 'Open';

  @override
  String get trimFailed => 'Couldn\'t trim this clip.';

  @override
  String get trimStorageFull =>
      'Not enough free space to save the trimmed clip.';

  @override
  String get trimPreview => 'Play selection';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSectionCamera => 'Camera';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Alerts';

  @override
  String get settingsSectionAlertCategories => 'Alert categories';

  @override
  String get settingsSectionRecording => 'Recording';

  @override
  String get settingsSectionDriving => 'Driving';

  @override
  String get settingsSectionPower => 'Power';

  @override
  String get settingsSectionEmergency => 'Emergency';

  @override
  String get settingsSectionAppearance => 'Appearance';

  @override
  String get settingsSectionLanguage => 'Language';

  @override
  String get settingsSectionInformation => 'Information';

  @override
  String get settingsCameraLens => 'Camera lens';

  @override
  String get settingsLensWide => 'Wide';

  @override
  String get settingsLensUltraWide => 'Ultra Wide';

  @override
  String get settingsLensTelephoto => 'Telephoto';

  @override
  String get settingsLensUnavailable => 'Not available on this iPhone';

  @override
  String get settingsStabilization => 'Stabilization';

  @override
  String get settingsStabAuto => 'Automatic';

  @override
  String get settingsStabOff => 'Off';

  @override
  String get settingsStabStandard => 'Standard';

  @override
  String get settingsStabCinematic => 'Cinematic';

  @override
  String get settingsOverlayOpacity => 'Overlay opacity';

  @override
  String get settingsShowFps => 'Show performance stats';

  @override
  String get settingsShowFpsSubtitle =>
      'Frame rate and inference time on the detection view';

  @override
  String get settingsCameraFooter =>
      'Lens and stabilization changes apply the next time the camera starts.';

  @override
  String get settingsAiModel => 'AI model';

  @override
  String get settingsConfidence => 'Detection confidence';

  @override
  String get settingsTracking => 'Object tracking';

  @override
  String get settingsTrackingSubtitle => 'Keeps objects stable between frames';

  @override
  String get settingsShowLabels => 'Show labels';

  @override
  String get settingsShowConfidence => 'Show confidence';

  @override
  String get settingsSegmentationOpacity => 'Perception mask opacity';

  @override
  String get settingsAiFooter =>
      'A lower confidence shows more objects but also more false detections. Detections may be inaccurate.';

  @override
  String get settingsVoiceAlerts => 'Voice alerts';

  @override
  String get settingsVoiceLanguage => 'Voice language';

  @override
  String get settingsVoiceLanguageAuto => 'Match app language';

  @override
  String get settingsVoice => 'Voice';

  @override
  String get settingsVoiceDefault => 'System default';

  @override
  String get settingsVoiceQualityEnhanced => 'Enhanced';

  @override
  String get settingsVoiceQualityPremium => 'High quality';

  @override
  String get settingsNoVoices =>
      'No voice is installed for this language. Add one in iOS Settings › Accessibility › Spoken Content.';

  @override
  String get settingsAlertPedestrian => 'Pedestrians';

  @override
  String get settingsAlertCyclist => 'Cyclists';

  @override
  String get settingsAlertMotorcycle => 'Motorcycles';

  @override
  String get settingsAlertBus => 'Buses';

  @override
  String get settingsAlertVehicleClose => 'Vehicle very close ahead';

  @override
  String get settingsAlertTrafficLight => 'Traffic light changes';

  @override
  String get settingsAlertTrafficMoving => 'Traffic ahead moving';

  @override
  String get settingsAlertStopSign => 'Stop signs';

  @override
  String get settingsSensitivity => 'Sensitivity';

  @override
  String get settingsSensitivityLow => 'Low';

  @override
  String get settingsSensitivityMedium => 'Medium';

  @override
  String get settingsSensitivityHigh => 'High';

  @override
  String get settingsCooldown => 'Repeat interval';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Voice volume';

  @override
  String get settingsQuietMode => 'Quiet mode';

  @override
  String get settingsQuietModeSubtitle =>
      'Only the most important alerts are spoken';

  @override
  String get settingsTestVoice => 'Test voice';

  @override
  String get settingsTestVoiceDone => 'Playing a sample alert…';

  @override
  String get settingsParkingBeeps => 'Parking beeps';

  @override
  String get settingsBeepVolume => 'Beep volume';

  @override
  String get settingsAlertsFooter =>
      'Alerts are an aid only. Always watch the road — silence doesn\'t mean the way is clear.';

  @override
  String get settingsRecordingProfile => 'Recording quality';

  @override
  String get settingsProfileStandard => 'Standard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Incident buffer';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get settingsManualMaxLength => 'Manual recording max length';

  @override
  String get settingsManualMaxUnlimited => 'Unlimited';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Record audio';

  @override
  String get settingsRecordAudioSubtitle =>
      'Includes cabin audio in saved incidents';

  @override
  String get settingsMicDenied =>
      'Microphone access is off. Allow it in Settings to record audio.';

  @override
  String get settingsWatermark => 'Corvista watermark';

  @override
  String get settingsTimestamp => 'Date & time stamp';

  @override
  String get settingsSaveLocation => 'Save location with clips';

  @override
  String get settingsStorage => 'Storage & clips';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips',
      one: '1 clip',
      zero: 'No clips',
    );
    return '$_temp0 · $used used · $free free';
  }

  @override
  String get settingsRecordingFooter =>
      'The rolling buffer stays on your iPhone and is overwritten continuously. Nothing is recorded in the background.';

  @override
  String get settingsDefaultView => 'Default view';

  @override
  String get settingsUnits => 'Units';

  @override
  String get settingsShowCompass => 'Show compass';

  @override
  String get settingsHudStyle => 'HUD style';

  @override
  String get settingsHudCustomize => 'Customize HUD';

  @override
  String get settingsDrivingSide => 'Driving side';

  @override
  String get settingsDrivingSideAuto => 'Automatic';

  @override
  String get settingsDrivingSideRight => 'Right';

  @override
  String get settingsDrivingSideLeft => 'Left';

  @override
  String get settingsVirtualStyle => 'Virtual view style';

  @override
  String get settingsVirtualMinimal => 'Minimal';

  @override
  String get settingsVirtualPerspective => 'Perspective';

  @override
  String get settingsVirtualHighContrast => 'High contrast';

  @override
  String get settingsKeepScreenOn => 'Keep screen on while driving';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Show turn-by-turn directions on the Lock Screen and in the Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Recording paused while Corvista was in the background';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Paused';

  @override
  String get liveActivityDashcamOff => 'Cam off';

  @override
  String get liveActivityEnded => 'Navigation ended';

  @override
  String get liveActivityEta => 'Arrival';

  @override
  String get settingsAutoRecenter => 'Auto-recenter map';

  @override
  String get settingsHudStyleClassic => 'Classic';

  @override
  String get settingsHudStyleGrid => 'Grid';

  @override
  String get settingsHudStyleMinimal => 'Minimal';

  @override
  String get settingsHudStylePerformance => 'Performance';

  @override
  String get settingsHudStyleNavigation => 'Navigation';

  @override
  String get settingsHudStyleNight => 'Night';

  @override
  String get settingsHudStyleHighContrast => 'High contrast';

  @override
  String get settingsPowerMode => 'Power mode';

  @override
  String get settingsPowerBalanced => 'Balanced';

  @override
  String get settingsPowerPerformance => 'Performance';

  @override
  String get settingsPowerSaver => 'Power saver';

  @override
  String get settingsPowerFooter =>
      'Corvista lowers AI rate and visual effects automatically when your iPhone gets warm or the battery is low.';

  @override
  String get settingsThermal => 'Thermal state';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Warm';

  @override
  String get settingsThermalSerious => 'Hot';

  @override
  String get settingsThermalCritical => 'Critical';

  @override
  String get settingsBattery => 'Battery';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Charging';
  }

  @override
  String get settingsLowPowerMode =>
      'Low Power Mode is on — AI runs at a reduced rate.';

  @override
  String get settingsAiRate => 'Current AI rate';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Impact detection';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'On · $seconds s countdown';
  }

  @override
  String get settingsEmergencyFooter =>
      'Experimental. Not a substitute for emergency services.';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsReduceMotion => 'Reduce motion';

  @override
  String get settingsReduceMotionSubtitle =>
      'Minimizes animations across the app';

  @override
  String get settingsAppLanguage => 'App language';

  @override
  String get settingsPrivacyPolicy => 'Privacy Policy';

  @override
  String get settingsTerms => 'Terms of Use';

  @override
  String get settingsHelp => 'Help';

  @override
  String get settingsSupport => 'Contact support';

  @override
  String get settingsLicenses => 'Open-source licences';

  @override
  String get settingsSupportUnavailable =>
      'Couldn\'t open Mail. Write to support@corvista.app.';

  @override
  String get settingsSafety => 'Safety information';

  @override
  String get settingsDiagnostics => 'Diagnostics';

  @override
  String get settingsVersion => 'Version';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Customize HUD';

  @override
  String get hudCustomPreview => 'Preview · sample values';

  @override
  String get hudCustomStyle => 'Style';

  @override
  String get hudCustomElements => 'Elements';

  @override
  String get hudCustomSpeed => 'Speed';

  @override
  String get hudCustomHeading => 'Heading & compass';

  @override
  String get hudCustomClock => 'Clock';

  @override
  String get hudCustomBattery => 'Battery & thermal';

  @override
  String get hudCustomDetections => 'AI status & detections';

  @override
  String get hudCustomWeather => 'Weather';

  @override
  String get hudCustomAppearance => 'Size & opacity';

  @override
  String get hudCustomSize => 'Size';

  @override
  String get hudCustomOpacity => 'Opacity';

  @override
  String get hudCustomFooter =>
      'Warnings such as overheating are always shown, even when elements are hidden.';

  @override
  String get hudCustomDescClassic => 'Balanced instrument cluster';

  @override
  String get hudCustomDescGrid => 'Perspective grid over the road';

  @override
  String get hudCustomDescMinimal => 'Speed only, nothing else';

  @override
  String get hudCustomDescPerformance => 'Speed arc with live readouts';

  @override
  String get hudCustomDescNavigation => 'Next maneuver first';

  @override
  String get hudCustomDescNight => 'Dim and red-shifted for night driving';

  @override
  String get hudCustomDescHighContrast => 'Maximum legibility in bright sun';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageSystem => 'System default';

  @override
  String get languageSystemSubtitle => 'Follow your iPhone\'s language';

  @override
  String get languageFooter =>
      'More languages are coming. The voice alert language can be set separately under Alerts.';

  @override
  String get diagTitle => 'Diagnostics';

  @override
  String get diagPerformance => 'Performance';

  @override
  String get diagInference => 'Inference time';

  @override
  String get diagDetectHz => 'Detection rate';

  @override
  String get diagCameraFps => 'Camera frame rate';

  @override
  String get diagMemory => 'Memory';

  @override
  String get diagDropped => 'Dropped frames';

  @override
  String get diagSegmentation => 'Segmentation time';

  @override
  String get diagCamera => 'Camera';

  @override
  String get diagStatus => 'Status';

  @override
  String get diagSource => 'Source';

  @override
  String get diagSourceCamera => 'Live camera';

  @override
  String get diagSourceFile => 'Test footage file';

  @override
  String get diagResolution => 'Buffer size';

  @override
  String get diagLens => 'Lens';

  @override
  String get diagError => 'Last error';

  @override
  String get diagModel => 'AI model';

  @override
  String get diagModelLoad => 'Model load time';

  @override
  String get diagPower => 'Power';

  @override
  String get diagSegHz => 'Segmentation rate';

  @override
  String get diagReduced => 'Reduced effects';

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
  String get diagCamIdle => 'Idle';

  @override
  String get diagCamStarting => 'Starting';

  @override
  String get diagCamRunning => 'Running';

  @override
  String get diagCamInterrupted => 'Interrupted';

  @override
  String get diagCamStopped => 'Stopped';

  @override
  String get diagCamUnavailable => 'Unavailable';

  @override
  String get diagCamPermissionDenied => 'Permission denied';

  @override
  String get diagCamError => 'Error';

  @override
  String get diagTestFootage => 'Test footage';

  @override
  String get diagTestFootageBody =>
      'Run real on-device detection on a local video file instead of the camera. Every view labels it TEST FOOTAGE.';

  @override
  String get diagPathLabel => 'Video file path';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Use Documents/test_drive.mp4';

  @override
  String get diagRun => 'Run test footage';

  @override
  String get diagRunStarted =>
      'Test footage started. Open the drive view to see it.';

  @override
  String get diagBackToCamera => 'Return to live camera';

  @override
  String get diagDebugOnly =>
      'Test footage is only available in development builds.';

  @override
  String get diagFileMissing => 'No file exists at that path.';

  @override
  String get emergencySetupTitle => 'Impact detection';

  @override
  String get emergencyExperimental => 'Experimental';

  @override
  String get emergencyIntro =>
      'During a drive, Corvista can watch for a possible severe impact using your iPhone\'s motion sensors. If one is detected, a countdown starts. If you don\'t cancel it, Corvista offers to call emergency services and message your contacts.';

  @override
  String get emergencyDisclaimer1 =>
      'Not a substitute for emergency services or your vehicle\'s own crash detection.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS always asks you to confirm before a call is placed or a message is sent.';

  @override
  String get emergencyDisclaimer3 =>
      'Impacts can be missed, and hard braking or bumps can be mistaken for one.';

  @override
  String get emergencyParkedWarning =>
      'Complete this setup while parked. Settings are locked while the vehicle is moving.';

  @override
  String get emergencyEnable => 'Enable impact detection';

  @override
  String get emergencyEnableSubtitle => 'Active only during a drive session';

  @override
  String get emergencyNeedNumber => 'Add an emergency number first.';

  @override
  String get emergencyContacts => 'Emergency contacts';

  @override
  String get emergencyAddContact => 'Add contact';

  @override
  String get emergencyNoContacts =>
      'No contacts yet. Contacts get a message only after you confirm it.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Remove $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'They won\'t be offered as a recipient after an impact.';

  @override
  String get emergencyRemove => 'Remove';

  @override
  String get emergencyContactsError => 'Couldn\'t load contacts.';

  @override
  String get emergencyNumber => 'Emergency number';

  @override
  String get emergencyNumberHint => 'e.g. 112 or 911';

  @override
  String get emergencyMessage => 'Message template';

  @override
  String get emergencyMessageDefault =>
      'I may have been in a vehicle accident. This message was prepared by Corvista and includes my last known location if available.';

  @override
  String get emergencyMessageHint => 'Leave empty to use the default message.';

  @override
  String get emergencyCountdown => 'Countdown length';

  @override
  String get emergencyVoiceCancel => 'Cancel by voice';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Say “I\'m OK” or “Cancel” during the countdown. Uses on-device speech recognition where available.';

  @override
  String get emergencyVoicePermDenied =>
      'Microphone and speech recognition access are needed for voice cancellation.';

  @override
  String get emergencyAutoSave => 'Save incident clip automatically';

  @override
  String get emergencyTest => 'Test countdown (no call)';

  @override
  String get emergencyTestBody =>
      'Runs a simulated impact so you can see the countdown. No call or message is ever made in test mode.';

  @override
  String get emergencyNotSet => 'Not set';

  @override
  String get emergencyAlertHeadline => 'Possible severe impact detected.';

  @override
  String get emergencyAlertSubtitle => 'Are you okay?';

  @override
  String get emergencyAlertCancel => 'I\'m OK — Cancel';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds seconds left',
      one: '1 second left',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening => 'Listening — say “I\'m OK” to cancel';

  @override
  String emergencyAlertHeard(String text) {
    return 'Heard: “$text”';
  }

  @override
  String get emergencyAlertEscalated => 'No response. Choose what to do:';

  @override
  String get emergencyAlertCall => 'Call emergency services';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Calls $number. iOS asks you to confirm.';
  }

  @override
  String get emergencyAlertMessage => 'Message contacts';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Opens a prepared message. You choose whether to send it.';

  @override
  String get emergencyAlertTestMode => 'Test mode — no call will be placed';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'I\'m OK — Close';

  @override
  String get emergencyMsgSent => 'Message sent.';

  @override
  String get emergencyMsgCancelled => 'Message not sent.';

  @override
  String get emergencyMsgFailed => 'Couldn\'t send the message.';

  @override
  String get emergencyMsgUnavailable =>
      'Messaging isn\'t available on this device.';

  @override
  String emergencyCallFailed(String number) {
    return 'Couldn\'t start the call. Dial $number yourself.';
  }

  @override
  String get modelsTitle => 'AI Models';

  @override
  String get modelsIntro =>
      'All models are bundled with the app and run entirely on your iPhone. Your camera feed never leaves the device.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Live: $ms ms per frame · $hz detections/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Loaded in $ms ms';
  }

  @override
  String get modelsEfficientName => 'Efficient';

  @override
  String get modelsEfficientDesc =>
      'Fast, compact detector tuned for long drives with low heat and battery use.';

  @override
  String get modelsEnhancedName => 'Enhanced';

  @override
  String get modelsEnhancedDesc =>
      'Larger detector that finds smaller and more distant objects, at a higher power cost.';

  @override
  String get modelsSegmentationName => 'Segmentation';

  @override
  String get modelsSegmentationDesc =>
      'Combines fast detection with road-surface and object masks for the Perception view.';

  @override
  String get modelsNoneName => 'AI paused';

  @override
  String get modelsNoneDesc =>
      'Camera and recording keep running without object detection. Lowest power use.';

  @override
  String get modelsGenericDesc => 'On-device object detection model.';

  @override
  String get modelsFunctionDetection =>
      'Detects vehicles, people, bicycles, motorcycles, buses, traffic lights and stop signs';

  @override
  String get modelsFunctionSegmentation => 'Adds road surface and object masks';

  @override
  String get modelsFunctionNone => 'No detection; dashcam recording only';

  @override
  String get modelsSize => 'Size';

  @override
  String get modelsInput => 'Input';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Works with';

  @override
  String get modelsStatusInstalled => 'Installed (bundled)';

  @override
  String get modelsStatusNotInstalled => 'Not installed';

  @override
  String get modelsSelected => 'Selected';

  @override
  String get modelsUse => 'Use this model';

  @override
  String get modelsSwitching => 'Loading model…';

  @override
  String modelsSwitched(String name) {
    return '$name is now active';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Measured on this device: $ms ms average';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Not measured on this device';

  @override
  String get modelsBenchmarkRun => 'Run benchmark';

  @override
  String get modelsBenchmarkRunning => 'Benchmarking…';

  @override
  String get modelsBenchmarkSelectHint => 'Select this model to benchmark it.';

  @override
  String get modelsBenchmarkDone => 'Benchmark complete';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Benchmark failed: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Last updated $date';
  }

  @override
  String get safetyTitle => 'Safety information';

  @override
  String get safetyIntro =>
      'Corvista is a driving-awareness aid. It does not control your vehicle and cannot replace your own attention, judgement or the vehicle\'s safety systems.';

  @override
  String get safetyBeforeTitle => 'Before you drive';

  @override
  String get safetyBefore1 =>
      'Mount your iPhone securely in a legal position that doesn\'t block your view, airbags or controls.';

  @override
  String get safetyBefore2 =>
      'Finish setup, choose a view and set your destination while parked.';

  @override
  String get safetyBefore3 =>
      'Connect a charger for longer drives and keep the phone out of direct sunlight where possible.';

  @override
  String get safetyWhileTitle => 'While driving';

  @override
  String get safetyWhile1 =>
      'Keep your eyes on the road. Only use the large on-screen controls when it is safe and legal to do so.';

  @override
  String get safetyWhile2 =>
      'Alerts are aids, not warnings you can rely on. Silence never means the road is clear.';

  @override
  String get safetyWhile3 =>
      'Follow traffic laws, signals and road signs — not the app — when they disagree.';

  @override
  String get safetyLimitsTitle => 'Limitations';

  @override
  String get safetyLimits1 =>
      'A single phone camera sees only what is in front of it. Objects outside its view, hidden or very close are not detected.';

  @override
  String get safetyLimits2 =>
      'Detections may be missed, late or wrong, especially at night, in rain, fog, glare or with a dirty windshield.';

  @override
  String get safetyLimits3 =>
      'Only supported categories are recognised: vehicles, buses, motorcycles, bicycles, people, traffic lights and stop signs. Lane hints in the virtual view are stylised, not detected lanes.';

  @override
  String get safetyLimits4 =>
      'Proximity is shown as approximate zones (Very close, Close, Medium, Far), never as measured distances. The parking view is not a parking-sensor replacement.';

  @override
  String get safetyHeatTitle => 'Heat and battery';

  @override
  String get safetyHeat1 =>
      'Continuous camera and AI use warms your iPhone. Corvista lowers the analysis rate when the device gets hot and shows a warning; if iOS overheats, the camera may stop.';

  @override
  String get safetyEmergencyTitle => 'Emergency feature';

  @override
  String get safetyEmergency1 =>
      'Possible-impact detection is experimental. It can miss real crashes and can be triggered by other events.';

  @override
  String get safetyEmergency2 =>
      'It never contacts anyone silently: iOS always asks you to confirm a call or message. It is not a substitute for calling emergency services yourself.';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacyIntro =>
      'Corvista is designed to keep your driving data on your iPhone. There is no Corvista account, and Corvista does not run its own servers.';

  @override
  String get privacyCameraTitle => 'Camera and AI';

  @override
  String get privacyCamera1 =>
      'Object detection, tracking and segmentation run entirely on your iPhone. Camera frames are never uploaded.';

  @override
  String get privacyCamera2 =>
      'The camera only runs while Corvista is open on screen. It pauses when the app goes to the background — there is no hidden background recording.';

  @override
  String get privacyRecordingsTitle => 'Recordings';

  @override
  String get privacyRecordings1 =>
      'The rolling buffer is temporary and overwritten continuously. Footage is only kept when you tap Save Incident or, if you enable it, after a possible impact.';

  @override
  String get privacyRecordings2 =>
      'Saved clips stay in Corvista\'s private storage on your iPhone. They leave the device only when you choose Share. Deleting the app deletes them.';

  @override
  String get privacyRecordings3 =>
      'Audio is recorded only if you turn it on and grant microphone access.';

  @override
  String get privacyLocationTitle => 'Location';

  @override
  String get privacyLocation1 =>
      'Location is used while the app is open for your speed, the map, routes and weather. If \"Save location\" is on, the position at save time is stored with the clip on your device.';

  @override
  String get privacyNetworkTitle => 'Network services';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — map display, place search and routes. Your search text and approximate location are sent to Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — current and hourly weather for your location.';

  @override
  String get privacyNetwork4 =>
      'Corvista includes no advertising and no third-party analytics or tracking.';

  @override
  String get privacyEmergencyTitle => 'Emergency contacts';

  @override
  String get privacyEmergency1 =>
      'Contacts you choose are stored in the iOS Keychain on this device. Voice cancellation uses on-device speech recognition where available. Calls and messages are only sent after you confirm them in iOS.';

  @override
  String get privacyControlsTitle => 'Your controls';

  @override
  String get privacyControls1 =>
      'You can delete clips at any time in Clips, and change or revoke camera, microphone, location and speech access in iOS Settings.';

  @override
  String get termsTitle => 'Terms of Use';

  @override
  String get termsIntro =>
      'By using Corvista you agree to these terms. Apple\'s standard Licensed Application End User License Agreement also applies.';

  @override
  String get termsUseTitle => 'Using Corvista';

  @override
  String get termsUse1 =>
      'Corvista is a driving-awareness and dashcam aid. You remain fully responsible for driving safely and legally at all times.';

  @override
  String get termsUse2 =>
      'Don\'t interact with the app in ways that distract you while driving. Mount the device securely and lawfully.';

  @override
  String get termsAccuracyTitle => 'No guarantees of accuracy';

  @override
  String get termsAccuracy1 =>
      'Detections, zones, alerts, map markers, routes and weather can be incomplete, delayed or wrong. Corvista does not control your vehicle.';

  @override
  String get termsAccuracy2 =>
      'The emergency feature is experimental and may fail to detect an impact or may trigger falsely.';

  @override
  String get termsRecordingTitle => 'Recording laws';

  @override
  String get termsRecording1 =>
      'Laws on dashcams, audio recording and filming people differ by country and region. You are responsible for complying with them, including when you share clips.';

  @override
  String get termsLiabilityTitle => 'Liability';

  @override
  String get termsLiability1 =>
      'The app is provided \"as is\". To the extent permitted by law, the developer is not liable for accidents, losses, fines or damages arising from its use or from reliance on its output.';

  @override
  String get termsChangesTitle => 'Changes';

  @override
  String get termsChanges1 =>
      'These terms may be updated with new versions of the app. Continued use after an update means you accept the revised terms.';

  @override
  String get helpTitle => 'Help';

  @override
  String get helpIntro =>
      'Answers to common questions. For safety guidance, see Safety information.';

  @override
  String get helpQSave => 'How do I keep footage of an incident?';

  @override
  String get helpASaveBuffer =>
      'Tap the large Save Incident button in the drive view. Corvista saves the last 20 or 30 seconds of its rolling buffer (your choice in Settings › Recording) to Clips.';

  @override
  String get helpQWhere => 'Where are my clips stored?';

  @override
  String get helpAWhere =>
      'In Corvista\'s private storage on your iPhone. They are never uploaded. Use Share in the player to send or export a clip.';

  @override
  String get helpQZones => 'How accurate are the proximity zones?';

  @override
  String get helpAZones =>
      'Zones are rough estimates from a single camera using typical object sizes. Treat them as approximate hints, never as distances.';

  @override
  String get helpQSlow => 'Why does detection slow down?';

  @override
  String get helpASlow =>
      'When your iPhone gets warm, the battery is low or Low Power Mode is on, Corvista reduces the analysis rate to protect the device. You can change the power mode in Settings.';

  @override
  String get helpQMap => 'The map, search or weather isn\'t working.';

  @override
  String get helpAMap =>
      'These features need an internet connection and location access. Check your connection and allow location for Corvista in iOS Settings.';

  @override
  String get helpQSimulator => 'The camera shows as unavailable.';

  @override
  String get helpASimulator =>
      'Make sure camera access is allowed in iOS Settings and no other app is using the camera. On the iOS Simulator there is no camera; a local test video can be used instead.';

  @override
  String get emergencyMsgNoContacts => 'Add an emergency contact first.';

  @override
  String get cameraStarting => 'Starting camera…';

  @override
  String get cameraInterrupted => 'Camera paused';

  @override
  String get cameraInterruptedBody =>
      'iOS paused the camera, for example during a call or while another app uses it. It resumes automatically.';

  @override
  String get cameraUnavailable => 'Camera unavailable';

  @override
  String get cameraUnavailableBody =>
      'No camera is available on this device. Detection, recording and parking views need the rear camera.';

  @override
  String get cameraRunTestFootage => 'Run test footage';

  @override
  String get cameraPermissionDenied => 'Camera access is off';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista needs the camera for detection, dashcam recording and parking views. Turn on Camera access in Settings.';

  @override
  String get cameraError => 'Camera error';

  @override
  String get cameraStopped => 'Camera stopped';

  @override
  String get cameraStart => 'Start camera';

  @override
  String get cameraFocusHint => 'Tap to focus';

  @override
  String get cameraPreviewLabel => 'Live camera view with detected objects';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Camera $fps fps · AI $hz Hz · $ms ms · dropped $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Speed $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'No GPS speed';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Heading $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Dashcam buffer recording, $seconds of $target seconds buffered';
  }

  @override
  String get hudRecIdle => 'REC off';

  @override
  String get hudRecSaving => 'Saving…';

  @override
  String get hudRecError => 'REC error';

  @override
  String get hudAiPaused => 'AI paused';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objects',
      one: '1 object',
      zero: 'No objects',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objects',
      one: '1 object',
      zero: 'no objects',
    );
    return 'AI model $model, $_temp0 detected';
  }

  @override
  String get hudThermalSerious => 'Hot — AI slowed';

  @override
  String get hudThermalCritical => 'Too hot — AI paused';

  @override
  String hudBatteryLow(String percent) {
    return 'Battery $percent';
  }

  @override
  String get hudLowPower => 'Low Power Mode';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Weather $temperature, $condition. Tap for details.';
  }

  @override
  String get hudNoGuidance =>
      'Search a destination on the Map view to see turn-by-turn guidance here.';

  @override
  String get navArrived => 'You have arrived';

  @override
  String get navRerouting => 'Rerouting…';

  @override
  String get navSearchHint => 'Search destination';

  @override
  String get navSearchFieldHint => 'Address, place or business';

  @override
  String get navNoResults => 'No matching places';

  @override
  String get navSearching => 'Searching…';

  @override
  String get navSearchStartTyping =>
      'Type an address or place name. Results come from Apple Maps and need an internet connection.';

  @override
  String get navErrorUnavailable =>
      'Search and routes are unavailable — check your internet connection.';

  @override
  String get navErrorNoLocation => 'Waiting for your location to plan a route.';

  @override
  String get navErrorPermission =>
      'Location access is off, so routes can\'t start from your position.';

  @override
  String navErrorGeneric(String code) {
    return 'Couldn\'t load routes ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Routes to $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Arrive $time';
  }

  @override
  String get navStart => 'Start';

  @override
  String get navEnd => 'End';

  @override
  String get navEndLabel => 'End navigation';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration left';
  }

  @override
  String navAdvisory(String text) {
    return 'Advisory: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min',
      one: '1 min',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Route $index: $name';
  }

  @override
  String get weatherTitle => 'Weather';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Feels like $temperature';
  }

  @override
  String get weatherPrecipitation => 'Precipitation';

  @override
  String get weatherWind => 'Wind';

  @override
  String get weatherVisibility => 'Visibility';

  @override
  String get weatherHumidity => 'Humidity';

  @override
  String get weatherHourly => 'Next hours';

  @override
  String weatherAsOf(String time) {
    return 'Updated $time';
  }

  @override
  String get weatherRefresh => 'Refresh weather';

  @override
  String get weatherUnavailable => 'Weather is unavailable right now.';

  @override
  String get weatherNoLocation => 'Weather needs your location.';

  @override
  String get weatherLegal => 'Data sources & legal';

  @override
  String weatherProvidedBy(String service) {
    return 'Weather data: $service';
  }

  @override
  String get weatherNow => 'Now';

  @override
  String get virtualEmpty => 'No supported objects detected';

  @override
  String get virtualEmptyCameraOff => 'Virtual view needs the live camera.';

  @override
  String get virtualLaneDisclaimer =>
      'Lane lines are illustrative, not detected.';

  @override
  String virtualNearest(String zone) {
    return 'Nearest: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtual road scene: $summary';
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
  String get virtualStatusLive => 'live';

  @override
  String get virtualStatusPaused => 'paused';

  @override
  String get virtualStatusCameraOff => 'Camera off';

  @override
  String get virtualStatusTestFootage => 'Test footage';

  @override
  String get virtualEmptyHint =>
      'Vehicles, people, bikes, lights and stop signs appear here when detected.';

  @override
  String get mapRecenter => 'Recenter';

  @override
  String get mapZoomIn => 'Zoom in';

  @override
  String get mapZoomOut => 'Zoom out';

  @override
  String get mapUnsupported => 'The interactive map is available on iPhone.';

  @override
  String get mapObjectsApprox => 'Object markers are approximate positions.';

  @override
  String get mapWeatherUnavailable => 'Weather unavailable';

  @override
  String get navErrorNoRoute => 'No route found to this destination.';

  @override
  String get navDismiss => 'Dismiss';

  @override
  String get navGo => 'Go';

  @override
  String get navFastest => 'Fastest';

  @override
  String get navThen => 'Then';

  @override
  String get navRecents => 'Recent';

  @override
  String get navClearRecents => 'Clear';

  @override
  String get navSearchSubmitHint => 'Press Search to see all matching places';

  @override
  String get navPlaces => 'Places';

  @override
  String get navEtaLabel => 'arrival';

  @override
  String get navTimeLeftLabel => 'left';

  @override
  String get navOverview => 'Overview';

  @override
  String get navMute => 'Mute voice';

  @override
  String get navUnmute => 'Unmute voice';

  @override
  String get navEndConfirm => 'End navigation?';

  @override
  String navEndConfirmBody(String place) {
    return 'Guidance to $place will stop.';
  }

  @override
  String navArrivedAt(String place) {
    return 'You have arrived at $place';
  }

  @override
  String get navDone => 'Done';

  @override
  String get navWeakGps => 'Weak GPS signal';

  @override
  String get navLocationOff =>
      'Location is off. Turn it on to plan routes and navigate.';

  @override
  String get navVoiceGuidance => 'Voice guidance';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'In $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, then $second';
  }

  @override
  String get navSpeakRerouting => 'Rerouting';

  @override
  String get navSpeakArrived => 'You have arrived';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meters',
      one: '1 meter',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilometers',
      one: '1 kilometer',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count feet',
      one: '1 foot',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yards',
      one: '1 yard',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Continue for $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Directions aren\'t available for this trip in this region. Try another destination.';

  @override
  String navContinueFor(String distance) {
    return 'Continue for $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value miles',
      one: '1 mile',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Nearest: $object · $zone';
  }

  @override
  String get parkingNothing => 'Nothing detected in view';

  @override
  String get parkingBeeps => 'Proximity beeps';

  @override
  String get parkingVolume => 'Beep volume';

  @override
  String get parkingLimitations =>
      'Single camera, not 360°. Objects outside the camera view are not detected. Not a replacement for parking sensors; estimates can be wrong and silence does not mean the area is clear.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Top-down proximity view. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Original';

  @override
  String get perceptionModeBoxes => 'Boxes';

  @override
  String get perceptionModeMasks => 'Object masks';

  @override
  String get perceptionModeRoad => 'Road surface';

  @override
  String get perceptionModeCombined => 'Combined';

  @override
  String get perceptionOpacity => 'Mask opacity';

  @override
  String get perceptionDisclaimer =>
      'The road-surface mask is an approximate visual layer. It does not show drivable space or lanes.';

  @override
  String get perceptionNeedsModel =>
      'Select the Segmentation model to see masks.';

  @override
  String get perceptionChooseModel => 'Choose model';

  @override
  String get perceptionWaiting => 'Waiting for the first segmentation frame…';

  @override
  String get perceptionShortCamera => 'Camera';

  @override
  String get perceptionShortBoxes => 'Boxes';

  @override
  String get perceptionShortObjects => 'Objects';

  @override
  String get perceptionShortRoad => 'Road';

  @override
  String get perceptionShortAll => 'All';

  @override
  String get perceptionModesLabel => 'Perception layers';

  @override
  String get perceptionStatusWarmingUp => 'Warming up…';

  @override
  String get perceptionStatusLoadingModel => 'Loading model…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Masks paused';

  @override
  String get perceptionLegend => 'Mask legend';

  @override
  String get perceptionUnavailable => 'Masks unavailable';

  @override
  String get driveSave => 'Save';

  @override
  String get driveSaveIncident => 'Save incident';

  @override
  String driveSaveHint(int seconds) {
    return 'Saves the last $seconds seconds of dashcam footage';
  }

  @override
  String get driveSaving => 'Saving incident…';

  @override
  String hudRecManualLabel(String time) {
    return 'Recording, $time';
  }

  @override
  String get driveRecord => 'Record';

  @override
  String get driveRecordStartA11y => 'Start recording';

  @override
  String driveRecordStopA11y(String time) {
    return 'Stop recording, $time recorded';
  }

  @override
  String get driveRecordHint =>
      'Records continuously until you stop it, including the last 5 seconds';

  @override
  String get driveRecordFailed => 'Couldn’t start recording';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Recording saved · $count parts',
      one: 'Recording saved',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Recording stopped: storage almost full',
      'max_duration': 'Recording stopped: maximum length reached',
      'camera_stopped': 'Recording stopped with the camera',
      'background': 'Recording stopped: the app went to the background',
      'thermal': 'Recording stopped: the phone is too hot',
      'other': 'Recording stopped',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Incident saved · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'View';

  @override
  String get driveSaveFailed => 'Couldn\'t save the incident.';

  @override
  String get driveSaveNotRunning =>
      'Recording hasn\'t started yet — wait for the camera to start, then try again.';

  @override
  String get driveSaveTestFootage =>
      'Test footage isn\'t recorded. Incident saving works with the live camera.';

  @override
  String get driveSaveStorageFull =>
      'Your iPhone is out of storage. Free up space or delete older clips.';

  @override
  String get driveSaveIoError => 'The clip couldn\'t be written to storage.';

  @override
  String get driveClips => 'Clips';

  @override
  String get driveSettings => 'Settings';

  @override
  String get driveViewSwitcher => 'Drive views';

  @override
  String get driveLocationDenied =>
      'Location is off — speed, maps and routes are unavailable.';

  @override
  String get driveCameraDenied =>
      'Camera access is off — detection and recording are unavailable.';

  @override
  String get driveRecorderFallback =>
      'Recording without audio: microphone access is off.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Recording settings were adjusted: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Your iPhone is hot. AI runs slower to cool down — keep it out of direct sun and near a vent.';

  @override
  String get drivePowerThermalCritical =>
      'Your iPhone is too hot. AI detection is paused until it cools down; recording continues if possible.';

  @override
  String get drivePowerLowPower =>
      'Low Power Mode is on — AI runs at a reduced rate.';

  @override
  String get drivePowerBatteryLow =>
      'Battery is low — connect your iPhone to power while driving.';

  @override
  String get onboardingTitle1 => 'See more of every drive.';

  @override
  String get onboardingBody1 =>
      'Turn your iPhone into an intelligent dashcam and driving-awareness companion.';

  @override
  String get onboardingTitle2 => 'Intelligence in every frame.';

  @override
  String get onboardingBody2 =>
      'Recognize supported vehicles, people, bicycles, and road signals directly on your iPhone.';

  @override
  String get onboardingTitle3 => 'One road. Multiple perspectives.';

  @override
  String get onboardingBody3 =>
      'Switch between live detection, virtual driving views, interactive maps, and parking visualization.';

  @override
  String get onboardingTitle4 => 'Keep the moments that matter.';

  @override
  String get onboardingBody4 =>
      'Save recent dashcam footage, review incidents, and share recordings.';

  @override
  String get onboardingTitle5 => 'Safety & privacy';

  @override
  String get onboardingSafety1 =>
      'Corvista is a driving-awareness aid. Keep your eyes on the road.';

  @override
  String get onboardingSafety2 =>
      'It does not control your vehicle or replace your judgment.';

  @override
  String get onboardingSafety3 =>
      'Detections and estimates may be inaccurate or missed.';

  @override
  String get onboardingSafety4 =>
      'Camera processing happens on your iPhone — video isn\'t uploaded.';

  @override
  String get onboardingSafety5 =>
      'Maps, search, routes and weather need an internet connection.';

  @override
  String get onboardingSafety6 =>
      'Mount your iPhone securely so it doesn\'t block your view.';

  @override
  String get onboardingSafety7 => 'Complete setup before you start driving.';

  @override
  String get onboardingAcknowledge =>
      'I understand Corvista is an awareness aid and I remain responsible for driving safely.';

  @override
  String get onboardingReadSafety => 'Read full safety information';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingAgree => 'Continue';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Page $current of $total';
  }

  @override
  String get permTitle => 'Permissions';

  @override
  String get permIntro =>
      'Corvista asks only for what each feature needs. You can change these any time in Settings.';

  @override
  String get permCameraTitle => 'Camera';

  @override
  String get permCameraBody =>
      'Required for detection, dashcam recording and the parking view. Video is processed on your iPhone.';

  @override
  String get permLocationTitle => 'Location';

  @override
  String get permLocationBody =>
      'Used for GPS speed, the map, routes, weather and tagging saved clips. Only while you use the app.';

  @override
  String get permMicTitle => 'Microphone';

  @override
  String get permSpeechNote =>
      'Speech recognition is only requested if you turn on voice cancellation for emergency alerts.';

  @override
  String get permRequired => 'Required';

  @override
  String get permOptional => 'Optional';

  @override
  String get permAllow => 'Allow';

  @override
  String get permGranted => 'Allowed';

  @override
  String get permDenied => 'Denied';

  @override
  String get permLimited => 'Limited';

  @override
  String get permRestricted => 'Restricted';

  @override
  String get permStart => 'Start driving';

  @override
  String get permCameraNeeded =>
      'You can continue without camera access, but detection and recording won\'t work until you allow it in Settings.';

  @override
  String get permSetupIntro =>
      'Corvista needs these to work fully. Tap Allow all and iOS will ask for each one in turn. You can change them any time in Settings.';

  @override
  String get permCameraLine =>
      'Required for detection, dashcam recording and the parking view. Video is processed on your iPhone, never uploaded.';

  @override
  String get permLocationLine =>
      'GPS speed, the map, routes, weather and where clips were saved. Only while you use the app.';

  @override
  String get permMicLine =>
      'Cabin audio in incident clips, and hearing your cancel phrase during an emergency alert.';

  @override
  String get permSpeechTitle => 'Speech recognition';

  @override
  String get permSpeechLine =>
      'Recognizes your cancel phrase during an emergency countdown, on your iPhone where supported.';

  @override
  String get permAllowAll => 'Allow all';

  @override
  String permAsking(String permission) {
    return 'Asking for $permission…';
  }

  @override
  String get permSomeDenied =>
      'Some permissions are off. Turn them on in Settings to use those features.';

  @override
  String get permNotNow => 'Not now';

  @override
  String get tourLabel => 'Drive screen tour';

  @override
  String tourProgress(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get tourNext => 'Next';

  @override
  String get tourBack => 'Back';

  @override
  String get tourSkip => 'Skip tour';

  @override
  String get tourFinish => 'Start driving';

  @override
  String get tourWelcomeTitle => 'Your quick tour';

  @override
  String get tourWelcomeBody =>
      'A one-minute look at what matters on the Drive screen. Best done while parked.';

  @override
  String get tourHudTitle => 'Your instrument strip';

  @override
  String get tourHudSpeed => 'Speed comes from GPS.';

  @override
  String get tourHudRec =>
      'REC shows how many seconds of footage are buffered.';

  @override
  String get tourHudAi =>
      'The AI chip shows the model, how many objects it sees, and a dot: green running, amber limited, red stopped.';

  @override
  String get tourSaveTitle => 'Save Incident';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista keeps a rolling buffer of the last $seconds seconds of video. It is constantly overwritten, so nothing is kept unless you tap Save. Saved clips stay on this iPhone, in Clips.';
  }

  @override
  String get tourRecordTitle => 'Record the whole drive';

  @override
  String get tourRecordBody =>
      'Tap Record to film continuously until you stop. Long drives are saved in 5-minute parts in Clips, and Save Incident keeps working while you record.';

  @override
  String get tourViewsTitle => 'Five ways to see the road';

  @override
  String get tourViewDetection =>
      'Live camera with boxes around supported objects.';

  @override
  String get tourViewVirtual => 'A simplified 3D scene built from detections.';

  @override
  String get tourViewMap => 'Apple Maps with search and turn-by-turn guidance.';

  @override
  String get tourViewParking => 'Camera plus a top-down proximity view.';

  @override
  String get tourViewPerception => 'Road and object masks.';

  @override
  String get tourMapTitle => 'Search & turn-by-turn';

  @override
  String get tourMapBody =>
      'Open Map, tap the search bar and pick a destination. Choose a route, then tap Start for turn-by-turn guidance. Needs an internet connection.';

  @override
  String get tourClipsTitle => 'Clips';

  @override
  String get tourClipsBody =>
      'Review, rename, share or delete saved incidents. Clips stay on your iPhone unless you share them.';

  @override
  String get tourSettingsTitle => 'Settings';

  @override
  String get tourSettingsBody =>
      'Tune voice alerts and their sensitivity, recording quality and buffer length, and set up Emergency mode: an experimental impact alert with a cancel countdown.';

  @override
  String get tourSafetyTitle => 'Before you drive';

  @override
  String get tourSafety1 =>
      'Mount your iPhone securely where it doesn\'t block your view.';

  @override
  String get tourSafety2 =>
      'Don\'t interact with the app while driving. Set things up while parked.';

  @override
  String get tourSafety3 =>
      'Detections and zones are estimates. They can be wrong or missed.';

  @override
  String get tourSafety4 => 'You stay responsible for driving safely.';

  @override
  String get helpTakeTour => 'Take the tour';

  @override
  String get helpTakeTourSub => 'A one-minute guided look at the Drive screen.';

  @override
  String get tripsTitle => 'Trips';

  @override
  String get tripsOpen => 'Trip log';

  @override
  String get tripsEmptyTitle => 'No trips yet';

  @override
  String get tripsEmptyBody =>
      'Trips are recorded automatically while you drive with Corvista — distance, time, speed and the route you took.';

  @override
  String get tripsDisabledBody =>
      'Trip log is off, so new drives aren\'t recorded. Turn it on to keep a private log of your routes on this iPhone.';

  @override
  String get tripsEnable => 'Turn on trip log';

  @override
  String get tripsToday => 'Today';

  @override
  String get tripsYesterday => 'Yesterday';

  @override
  String tripsRecordingNow(String distance) {
    return 'Recording a trip · $distance';
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
      other: '$count incidents',
      one: '1 incident',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alerts',
      one: '1 alert',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trips',
      one: '1 trip',
      zero: 'No trips',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Distance';

  @override
  String get tripsStatDuration => 'Duration';

  @override
  String get tripsStatMoving => 'Moving time';

  @override
  String get tripsStatAvgSpeed => 'Avg speed';

  @override
  String get tripsStatMaxSpeed => 'Max speed';

  @override
  String get tripsDetections => 'Detections';

  @override
  String get tripsNoDetections => 'No road objects were logged on this trip.';

  @override
  String get tripsTimeline => 'Timeline';

  @override
  String get tripsEventStart => 'Trip started';

  @override
  String get tripsEventEnd => 'Trip ended';

  @override
  String get tripsEventAlert => 'Voice alert';

  @override
  String get tripsEventIncident => 'Incident clip saved';

  @override
  String get tripsEventEmergency => 'Possible crash detected';

  @override
  String get tripsEventNavStart => 'Navigation started';

  @override
  String get tripsEventArrive => 'Arrived at destination';

  @override
  String get tripsEventReroute => 'Route recalculated';

  @override
  String get tripsEventRecording => 'Recording saved';

  @override
  String get tripsOpenClip => 'Open clip';

  @override
  String get tripsTrackPreview => 'GPS track';

  @override
  String get tripsRenameTitle => 'Rename trip';

  @override
  String get tripsRenameHint => 'Trip name';

  @override
  String get tripsFavorite => 'Add to favorites';

  @override
  String get tripsUnfavorite => 'Remove from favorites';

  @override
  String get tripsShareGpx => 'Share GPX';

  @override
  String get tripsShareFailed => 'Couldn\'t share this trip.';

  @override
  String get tripsDelete => 'Delete trip';

  @override
  String get tripsDeleteConfirmTitle => 'Delete this trip?';

  @override
  String get tripsDeleteConfirmBody =>
      'The route and statistics will be removed from this iPhone. Incident clips from this trip are kept.';

  @override
  String get tripsDeleted => 'Trip deleted';

  @override
  String get tripsNotFound => 'This trip is no longer available.';

  @override
  String get tripsPrivacyNote =>
      'Stored only on this iPhone. Nothing is uploaded.';

  @override
  String get settingsSectionTrips => 'Trip log';

  @override
  String get settingsTripLog => 'Record trips';

  @override
  String get settingsTripLogSubtitle =>
      'Keeps your route and drive statistics on this iPhone only.';

  @override
  String get settingsTripRetention => 'Keep trips for';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 year';

  @override
  String get settingsRetentionForever => 'Forever';

  @override
  String get settingsTripRetentionFooter =>
      'Older trips are deleted automatically when Corvista starts.';

  @override
  String get settingsViewTrips => 'View trips';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes min';
  }

  @override
  String tripsGpxName(String date) {
    return 'Corvista trip $date';
  }

  @override
  String get settingsFreeUpSpace => 'Free up space';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Removes temporary files and caches. Saved clips and trips are kept.';

  @override
  String settingsFreedBytes(String size) {
    return 'Freed $size';
  }

  @override
  String get settingsNothingToFree =>
      'Caches cleared — no temporary files to remove.';

  @override
  String get settingsSectionPrivacyData => 'Privacy & data';

  @override
  String get settingsPrivacyDataFooter =>
      'Clips, trips and settings are stored only on this iPhone. They leave it only when you choose to share them.';

  @override
  String get settingsDeleteAllData => 'Delete all data';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Erase clips, trips, contacts and settings from this iPhone';

  @override
  String get deleteAllTitle => 'Delete all data?';

  @override
  String get deleteAllMessage =>
      'This permanently removes from this iPhone:\n• Incident clips and thumbnails\n• Trip log and GPS tracks\n• Emergency contacts and emergency events\n• Detection logs and the diagnostic log\n• Settings and recent destinations\n• Temporary recording buffer and cache\n\nThis cannot be undone. Corvista will then start again from the welcome screens.';

  @override
  String get deleteAllConfirm => 'Delete everything';

  @override
  String get deleteAllInProgress => 'Deleting…';

  @override
  String get deleteAllDone => 'All data deleted';

  @override
  String get deleteAllPartial =>
      'Some items could not be deleted. Try again from Settings.';

  @override
  String get diagLogSection => 'Diagnostic log';

  @override
  String get diagLogFooter =>
      'Errors are recorded only on this iPhone, without locations, contact names or phone numbers. Nothing is sent unless you share the log yourself.';

  @override
  String get diagLogShare => 'Share diagnostic log';

  @override
  String get diagLogEmpty => 'Empty';

  @override
  String get diagLogClear => 'Clear log';

  @override
  String get diagLogClearTitle => 'Clear diagnostic log?';

  @override
  String get diagLogClearBody =>
      'Saved error entries will be deleted from this iPhone.';

  @override
  String get diagLogCleared => 'Diagnostic log cleared';

  @override
  String get diagLogShareFailed => 'Couldn\'t share the diagnostic log.';

  @override
  String get privacyControls2 =>
      'Settings › Privacy & data › Delete all data erases every clip, trip, contact, log and setting Corvista has stored on this iPhone.';

  @override
  String get parkingZoneStop => 'Stop';

  @override
  String get parkingZoneVeryClose => 'Very close';

  @override
  String get parkingZoneClose => 'Close';

  @override
  String get parkingZoneNothingClose => 'Nothing close seen';

  @override
  String get parkingNotDetected =>
      'Walls, pillars, poles and kerbs are not detected';

  @override
  String get parkingApprox => 'approx.';

  @override
  String get parkingSideLeft => 'Left';

  @override
  String get parkingSideCenter => 'Center';

  @override
  String get parkingSideRight => 'Right';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => 'Front camera view only — not a 360° system';

  @override
  String get parkingMuteBeeps => 'Mute beeps';

  @override
  String get parkingUnmuteBeeps => 'Turn beeps on';

  @override
  String get parkingAbout => 'About parking view';

  @override
  String get parkingLimitationsDetail =>
      'Only the area in front of the camera is watched. The detector recognises cars, buses and trucks, people, bicycles and motorcycles. Walls, pillars, poles, kerbs, bollards, barriers and low obstacles are NOT detected, and the bonnet can hide the ground just ahead. Distances are rough guesses from one camera (object size and position) and can be wrong by a lot. Silence or “Nothing close seen” does not mean the way is clear — always look around and use your mirrors.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Proximity by side: left $left, center $center, right $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Errors are written to a private log on this iPhone (no locations, contact names or phone numbers). It is never sent automatically; you can share or clear it in Settings › Diagnostics.';
}

/// The translations for English, as used in the United Kingdom (`en_GB`).
class AppLocalizationsEnGb extends AppLocalizationsEn {
  AppLocalizationsEnGb() : super('en_GB');

  @override
  String get clipsFavorite => 'Favourite';

  @override
  String get clipsUnfavorite => 'Remove from favourites';

  @override
  String get playerFavorited => 'Added to favourites';

  @override
  String get playerUnfavorited => 'Removed from favourites';

  @override
  String get settingsStabilization => 'Stabilisation';

  @override
  String get settingsCameraFooter =>
      'Lens and stabilisation changes apply the next time the camera starts.';

  @override
  String get settingsHudCustomize => 'Customise HUD';

  @override
  String get settingsAutoRecenter => 'Auto-recentre map';

  @override
  String get settingsReduceMotionSubtitle =>
      'Minimises animations across the app';

  @override
  String get hudCustomTitle => 'Customise HUD';

  @override
  String get mapRecenter => 'Recentre';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metres',
      one: '1 metre',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilometres',
      one: '1 kilometre',
    );
    return '$_temp0';
  }

  @override
  String get onboardingBody2 =>
      'Recognise supported vehicles, people, bicycles, and road signals directly on your iPhone.';

  @override
  String get onboardingBody3 =>
      'Switch between live detection, virtual driving views, interactive maps, and parking visualisation.';

  @override
  String get permSpeechLine =>
      'Recognises your cancel phrase during an emergency countdown, on your iPhone where supported.';

  @override
  String get tripsFavorite => 'Add to favourites';

  @override
  String get tripsUnfavorite => 'Remove from favourites';
}
