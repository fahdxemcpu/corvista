import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('en', 'GB'),
    Locale('es'),
    Locale('es', '419'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('fr', 'CA'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('lt'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'PT'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sv'),
    Locale('ta'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// Product name; do not translate
  ///
  /// In en, this message translates to:
  /// **'Corvista'**
  String get appName;

  /// Brand tagline
  ///
  /// In en, this message translates to:
  /// **'See more of every drive.'**
  String get appTagline;

  /// Generic cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// Generic delete button
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// Generic save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// Generic back button
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// Generic close button
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// Retry after an error
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonRetry;

  /// Opens the iOS Settings app for this app
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get commonOpenSettings;

  /// Generic loading label
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get commonLoading;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get commonError;

  /// Generic error with technical detail
  ///
  /// In en, this message translates to:
  /// **'Something went wrong: {message}'**
  String commonErrorDetail(String message);

  /// Toggle state on
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get commonOn;

  /// Toggle state off
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get commonOff;

  /// Rename action
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get commonRename;

  /// Share action
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get commonShare;

  /// Generic unavailable value
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get commonNotAvailable;

  /// Label shown while a local test video is used instead of the live camera
  ///
  /// In en, this message translates to:
  /// **'TEST FOOTAGE'**
  String get commonTestFootage;

  /// Proximity zone (qualitative, not a measured distance)
  ///
  /// In en, this message translates to:
  /// **'Very close'**
  String get zoneVeryClose;

  /// Proximity zone
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get zoneClose;

  /// Proximity zone
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get zoneMedium;

  /// Proximity zone
  ///
  /// In en, this message translates to:
  /// **'Far'**
  String get zoneFar;

  /// Proximity zone when it cannot be estimated
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get zoneUnknown;

  /// Object class label
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get classPerson;

  /// Object class label
  ///
  /// In en, this message translates to:
  /// **'Bicycle'**
  String get classBicycle;

  /// Object class label
  ///
  /// In en, this message translates to:
  /// **'Motorcycle'**
  String get classMotorcycle;

  /// Object class label (cars, trucks, vans)
  ///
  /// In en, this message translates to:
  /// **'Vehicle'**
  String get classCar;

  /// Object class label
  ///
  /// In en, this message translates to:
  /// **'Bus'**
  String get classBus;

  /// Object class label
  ///
  /// In en, this message translates to:
  /// **'Traffic light'**
  String get classTrafficLight;

  /// Object class label
  ///
  /// In en, this message translates to:
  /// **'Stop sign'**
  String get classStopSign;

  /// Drive view name: live camera with detection boxes
  ///
  /// In en, this message translates to:
  /// **'Detection'**
  String get viewDetection;

  /// Drive view name: 2.5D virtual road scene
  ///
  /// In en, this message translates to:
  /// **'Virtual'**
  String get viewVirtual;

  /// Drive view name: interactive map
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get viewMap;

  /// Drive view name: parking visualization
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get viewParking;

  /// Drive view name: segmentation masks (Premium)
  ///
  /// In en, this message translates to:
  /// **'Perception'**
  String get viewPerception;

  /// Speed unit kilometres per hour
  ///
  /// In en, this message translates to:
  /// **'km/h'**
  String get unitKmh;

  /// Speed unit miles per hour
  ///
  /// In en, this message translates to:
  /// **'mph'**
  String get unitMph;

  /// Traffic light lamp state
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get lightRed;

  /// Traffic light lamp state
  ///
  /// In en, this message translates to:
  /// **'Yellow'**
  String get lightYellow;

  /// Traffic light lamp state
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get lightGreen;

  /// Traffic light lamp state when unclear
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get lightUnknown;

  /// Title of the saved incident clips screen
  ///
  /// In en, this message translates to:
  /// **'Clips'**
  String get clipsTitle;

  /// Enter multi-select mode in the clips gallery
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get clipsSelect;

  /// Title while selecting clips
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Select clips} =1{1 selected} other{{count} selected}}'**
  String clipsSelectedCount(int count);

  /// Select all visible clips
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get clipsSelectAll;

  /// Clear the clip selection
  ///
  /// In en, this message translates to:
  /// **'Deselect all'**
  String get clipsDeselectAll;

  /// Delete the selected clips
  ///
  /// In en, this message translates to:
  /// **'Delete selected'**
  String get clipsDeleteSelected;

  /// Switch gallery to grid layout
  ///
  /// In en, this message translates to:
  /// **'Grid view'**
  String get clipsGridView;

  /// Switch gallery to list layout
  ///
  /// In en, this message translates to:
  /// **'List view'**
  String get clipsListView;

  /// Confirmation dialog title for deleting clips
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete this clip?} other{Delete {count} clips?}}'**
  String clipsDeleteConfirmTitle(int count);

  /// Confirmation dialog body for deleting clips
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{The video is permanently removed from your iPhone. This can\'t be undone.} other{These videos are permanently removed from your iPhone. This can\'t be undone.}}'**
  String clipsDeleteConfirmBody(int count);

  /// Snackbar after deleting clips
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Clip deleted} other{{count} clips deleted}}'**
  String clipsDeleted(int count);

  /// Empty state title in the clips gallery
  ///
  /// In en, this message translates to:
  /// **'No clips yet'**
  String get clipsEmptyTitle;

  /// Empty state body in the clips gallery
  ///
  /// In en, this message translates to:
  /// **'While you drive, Corvista keeps a short rolling buffer. Tap Save Incident to keep the last seconds of footage here.'**
  String get clipsEmptyBody;

  /// Error loading clips
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load your clips.'**
  String get clipsLoadError;

  /// Storage section title
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get clipsStorageTitle;

  /// Storage usage summary line
  ///
  /// In en, this message translates to:
  /// **'Clips {clips} · Buffer {buffer} · {free} free'**
  String clipsStorageUsage(String clips, String buffer, String free);

  /// Number of saved clips
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No saved clips} =1{1 saved clip} other{{count} saved clips}}'**
  String clipsStorageCount(int count);

  /// Warning when free storage is low
  ///
  /// In en, this message translates to:
  /// **'Your iPhone is low on storage. New incidents may fail to save.'**
  String get clipsStorageLow;

  /// Badge when a clip's video file can't be found
  ///
  /// In en, this message translates to:
  /// **'File missing'**
  String get clipsMissingFile;

  /// Badge for a clip saved automatically after a possible impact
  ///
  /// In en, this message translates to:
  /// **'Impact'**
  String get clipsEmergencyBadge;

  /// Fallback clip title using its date
  ///
  /// In en, this message translates to:
  /// **'Incident · {date}'**
  String clipsUntitled(String date);

  /// Accessibility label for the audio icon
  ///
  /// In en, this message translates to:
  /// **'Audio recorded'**
  String get clipsAudio;

  /// Favorite badge / action
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get clipsFavorite;

  /// Remove favorite action
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get clipsUnfavorite;

  /// Accessibility label for location icon
  ///
  /// In en, this message translates to:
  /// **'Location saved'**
  String get clipsLocation;

  /// Accessibility label for a clip tile
  ///
  /// In en, this message translates to:
  /// **'Open clip {title}'**
  String clipsOpenClip(String title);

  /// Player: clip id doesn't exist (deleted)
  ///
  /// In en, this message translates to:
  /// **'Clip not found'**
  String get playerNotFoundTitle;

  /// Player: clip not found body
  ///
  /// In en, this message translates to:
  /// **'This clip may have been deleted.'**
  String get playerNotFoundBody;

  /// Player: the video file can't be found on disk
  ///
  /// In en, this message translates to:
  /// **'Video file missing'**
  String get playerMissingTitle;

  /// Player: missing file body
  ///
  /// In en, this message translates to:
  /// **'The recording for this clip is no longer on your iPhone. You can remove the entry from your gallery.'**
  String get playerMissingBody;

  /// Player: delete a clip entry whose file is missing
  ///
  /// In en, this message translates to:
  /// **'Remove entry'**
  String get playerRemoveEntry;

  /// Player: video failed to initialize
  ///
  /// In en, this message translates to:
  /// **'This video can\'t be played.'**
  String get playerLoadError;

  /// Play button
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get playerPlay;

  /// Pause button
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get playerPause;

  /// Replay button at the end of the video
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get playerReplay;

  /// Rename dialog title
  ///
  /// In en, this message translates to:
  /// **'Rename clip'**
  String get playerRenameTitle;

  /// Rename text field hint
  ///
  /// In en, this message translates to:
  /// **'Clip name'**
  String get playerRenameHint;

  /// Snackbar after rename
  ///
  /// In en, this message translates to:
  /// **'Clip renamed'**
  String get playerRenamed;

  /// Snackbar after favoriting
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get playerFavorited;

  /// Snackbar after unfavoriting
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get playerUnfavorited;

  /// Share failed
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t share this clip.'**
  String get playerShareFailed;

  /// Metadata panel title
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get playerDetails;

  /// Metadata label: recording date
  ///
  /// In en, this message translates to:
  /// **'Recorded'**
  String get playerDate;

  /// Metadata label
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get playerDuration;

  /// Metadata label
  ///
  /// In en, this message translates to:
  /// **'Resolution'**
  String get playerResolution;

  /// Metadata label
  ///
  /// In en, this message translates to:
  /// **'File size'**
  String get playerSize;

  /// Metadata label
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get playerAudio;

  /// Metadata value: audio present
  ///
  /// In en, this message translates to:
  /// **'Recorded'**
  String get playerAudioYes;

  /// Metadata value: no audio
  ///
  /// In en, this message translates to:
  /// **'Not recorded'**
  String get playerAudioNo;

  /// Metadata label: what triggered the save
  ///
  /// In en, this message translates to:
  /// **'Saved by'**
  String get playerReason;

  /// Metadata value: manual save
  ///
  /// In en, this message translates to:
  /// **'Save Incident button'**
  String get playerReasonManual;

  /// Metadata value: automatic emergency save
  ///
  /// In en, this message translates to:
  /// **'Possible impact detection'**
  String get playerReasonEmergency;

  /// Metadata value: clip recovered after app termination
  ///
  /// In en, this message translates to:
  /// **'Recovered after interruption'**
  String get playerReasonRecovered;

  /// Metadata label
  ///
  /// In en, this message translates to:
  /// **'GPS speed at save'**
  String get playerSpeed;

  /// Metadata label
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get playerLocation;

  /// Opens the clip location in Apple Maps
  ///
  /// In en, this message translates to:
  /// **'Open in Maps'**
  String get playerOpenInMaps;

  /// Back button accessibility label
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get playerBack;

  /// Overflow menu accessibility label
  ///
  /// In en, this message translates to:
  /// **'More actions'**
  String get playerMore;

  /// Accessibility label of the clip category filter row
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get clipsFilterLabel;

  /// Clip filter: every clip
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get clipsFilterAll;

  /// Clip filter: manual continuous recordings (Record button)
  ///
  /// In en, this message translates to:
  /// **'Recordings'**
  String get clipsFilterRecordings;

  /// Clip filter: clips saved with Save Incident
  ///
  /// In en, this message translates to:
  /// **'Incidents'**
  String get clipsFilterIncidents;

  /// Clip filter: clips saved by impact / emergency detection
  ///
  /// In en, this message translates to:
  /// **'Emergency'**
  String get clipsFilterEmergency;

  /// Clip filter: starred clips
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get clipsFilterFavorites;

  /// Sort menu button tooltip in the clips library
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get clipsSort;

  /// Clip sort option
  ///
  /// In en, this message translates to:
  /// **'Newest first'**
  String get clipsSortNewest;

  /// Clip sort option
  ///
  /// In en, this message translates to:
  /// **'Oldest first'**
  String get clipsSortOldest;

  /// Clip sort option
  ///
  /// In en, this message translates to:
  /// **'Longest first'**
  String get clipsSortLongest;

  /// Clip sort option (file size)
  ///
  /// In en, this message translates to:
  /// **'Largest first'**
  String get clipsSortLargest;

  /// Date group header for clips recorded today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get clipsToday;

  /// Date group header for clips recorded yesterday
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get clipsYesterday;

  /// Trailing text of a date group header: number of clips and their total size
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 clip} other{{count} clips}} · {size}'**
  String clipsGroupSummary(int count, String size);

  /// Empty state when the selected clip filter matches nothing
  ///
  /// In en, this message translates to:
  /// **'No clips in this category yet.'**
  String get clipsFilterEmpty;

  /// Empty state of the Favorites clip filter
  ///
  /// In en, this message translates to:
  /// **'Star a clip to keep it here for quick access.'**
  String get clipsFavoritesEmpty;

  /// Badge on a manual (Record button) clip
  ///
  /// In en, this message translates to:
  /// **'Recording'**
  String get clipsKindRecording;

  /// Badge on a Save Incident clip
  ///
  /// In en, this message translates to:
  /// **'Incident'**
  String get clipsKindIncident;

  /// Badge on a clip saved by impact / emergency detection
  ///
  /// In en, this message translates to:
  /// **'Emergency'**
  String get clipsKindEmergency;

  /// Badge on a clip recorded from test footage
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get clipsKindTest;

  /// Chip on a clip linking to the trip it was recorded in; time = trip start time
  ///
  /// In en, this message translates to:
  /// **'Trip · {time}'**
  String clipsTripChip(String time);

  /// Accessibility hint of the trip chip on a clip
  ///
  /// In en, this message translates to:
  /// **'Open the trip this clip was recorded in'**
  String get clipsOpenTrip;

  /// Storage header line: device storage used and free
  ///
  /// In en, this message translates to:
  /// **'{used} used · {free} free'**
  String clipsStorageUsedFree(String used, String free);

  /// Storage header: space used by saved clips
  ///
  /// In en, this message translates to:
  /// **'Clips use {size}'**
  String clipsStorageClips(String size);

  /// Storage header count of manual recordings
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 recording} other{{count} recordings}}'**
  String clipsCountRecordings(int count);

  /// Storage header count of incident clips
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 incident} other{{count} incidents}}'**
  String clipsCountIncidents(int count);

  /// Storage header count of emergency clips
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 emergency} other{{count} emergencies}}'**
  String clipsCountEmergency(int count);

  /// Storage header button that removes temporary files (never saved clips)
  ///
  /// In en, this message translates to:
  /// **'Free up space'**
  String get clipsFreeUpSpace;

  /// Gentle low-storage warning in the clips library
  ///
  /// In en, this message translates to:
  /// **'Less than 2 GB free. To keep recording smoothly, free up space or remove clips you no longer need.'**
  String get clipsStorageLowGentle;

  /// Action: copy clip(s) into the iPhone photo library
  ///
  /// In en, this message translates to:
  /// **'Save to Photos'**
  String get clipsSaveToPhotos;

  /// Selection bar summary: number of selected clips and their total size
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 clip} other{{count} clips}} · {size}'**
  String clipsSelectionSummary(int count, String size);

  /// Confirmation title for deleting selected clips, with their total size
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete this clip ({size})?} other{Delete {count} clips ({size})?}}'**
  String clipsDeleteConfirmTitleSize(int count, String size);

  /// Progress dialog while saving clips to Photos
  ///
  /// In en, this message translates to:
  /// **'Saving {done} of {total} to Photos…'**
  String clipsSavingToPhotos(int done, int total);

  /// Result after saving clips to Photos
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Saved to Photos} other{{count} clips saved to Photos}}'**
  String clipsPhotosSaved(int count);

  /// Result when some clips could not be saved to Photos
  ///
  /// In en, this message translates to:
  /// **'{saved} saved to Photos · {failed} couldn\'t be saved'**
  String clipsPhotosPartial(int saved, int failed);

  /// Shown when add-only Photos access is denied
  ///
  /// In en, this message translates to:
  /// **'Corvista isn\'t allowed to add videos to Photos. You can allow it in Settings.'**
  String get clipsPhotosDenied;

  /// Shown when saving to Photos failed
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save to Photos.'**
  String get clipsPhotosFailed;

  /// Result after starring selected clips
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Added to favorites} other{{count} clips added to favorites}}'**
  String clipsFavoritedMany(int count);

  /// Result after un-starring selected clips
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Removed from favorites} other{{count} clips removed from favorites}}'**
  String clipsUnfavoritedMany(int count);

  /// Default name of a clip created by trimming another clip
  ///
  /// In en, this message translates to:
  /// **'{title} (trimmed)'**
  String clipsTrimmedTitle(String title);

  /// Player action: cut a shorter clip from this clip
  ///
  /// In en, this message translates to:
  /// **'Trim'**
  String get playerTrim;

  /// Player action: show clip details sheet
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get playerInfo;

  /// Clip details row: clip kind (recording / incident / emergency)
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get playerKind;

  /// Clip details: clip came from manual recording
  ///
  /// In en, this message translates to:
  /// **'Record button'**
  String get playerReasonRecording;

  /// Trim screen title
  ///
  /// In en, this message translates to:
  /// **'Trim clip'**
  String get trimTitle;

  /// Trim screen instructions
  ///
  /// In en, this message translates to:
  /// **'Drag the handles to choose the part to keep. The original clip stays unchanged.'**
  String get trimHint;

  /// Accessibility label of the trim start handle
  ///
  /// In en, this message translates to:
  /// **'Trim start'**
  String get trimStartHandle;

  /// Accessibility label of the trim end handle
  ///
  /// In en, this message translates to:
  /// **'Trim end'**
  String get trimEndHandle;

  /// Trim screen: length of the kept range
  ///
  /// In en, this message translates to:
  /// **'{duration} selected'**
  String trimSelection(String duration);

  /// Trim screen primary button
  ///
  /// In en, this message translates to:
  /// **'Save as new clip'**
  String get trimSave;

  /// Trim screen progress text
  ///
  /// In en, this message translates to:
  /// **'Saving trimmed clip…'**
  String get trimSaving;

  /// Snackbar after a trimmed clip was saved
  ///
  /// In en, this message translates to:
  /// **'Trimmed clip saved'**
  String get trimSaved;

  /// Snackbar action that opens the new trimmed clip
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get trimOpenNew;

  /// Trim error
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t trim this clip.'**
  String get trimFailed;

  /// Trim error when storage is full
  ///
  /// In en, this message translates to:
  /// **'Not enough free space to save the trimmed clip.'**
  String get trimStorageFull;

  /// Trim screen: play the selected range
  ///
  /// In en, this message translates to:
  /// **'Play selection'**
  String get trimPreview;

  /// Settings screen title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get settingsSectionCamera;

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'AI'**
  String get settingsSectionAi;

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get settingsSectionAlerts;

  /// Settings section listing which objects trigger voice alerts
  ///
  /// In en, this message translates to:
  /// **'Alert categories'**
  String get settingsSectionAlertCategories;

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'Recording'**
  String get settingsSectionRecording;

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'Driving'**
  String get settingsSectionDriving;

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'Power'**
  String get settingsSectionPower;

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'Emergency'**
  String get settingsSectionEmergency;

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsSectionAppearance;

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsSectionLanguage;

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get settingsSectionInformation;

  /// Setting: which rear camera to use
  ///
  /// In en, this message translates to:
  /// **'Camera lens'**
  String get settingsCameraLens;

  /// Camera lens option
  ///
  /// In en, this message translates to:
  /// **'Wide'**
  String get settingsLensWide;

  /// Camera lens option
  ///
  /// In en, this message translates to:
  /// **'Ultra Wide'**
  String get settingsLensUltraWide;

  /// Camera lens option
  ///
  /// In en, this message translates to:
  /// **'Telephoto'**
  String get settingsLensTelephoto;

  /// Shown under a lens option the device lacks
  ///
  /// In en, this message translates to:
  /// **'Not available on this iPhone'**
  String get settingsLensUnavailable;

  /// Setting: video stabilization mode
  ///
  /// In en, this message translates to:
  /// **'Stabilization'**
  String get settingsStabilization;

  /// Stabilization option
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get settingsStabAuto;

  /// Stabilization option
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get settingsStabOff;

  /// Stabilization option
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get settingsStabStandard;

  /// Stabilization option
  ///
  /// In en, this message translates to:
  /// **'Cinematic'**
  String get settingsStabCinematic;

  /// Setting: opacity of detection boxes
  ///
  /// In en, this message translates to:
  /// **'Overlay opacity'**
  String get settingsOverlayOpacity;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Show performance stats'**
  String get settingsShowFps;

  /// Subtitle of performance stats toggle
  ///
  /// In en, this message translates to:
  /// **'Frame rate and inference time on the detection view'**
  String get settingsShowFpsSubtitle;

  /// Footer under camera settings
  ///
  /// In en, this message translates to:
  /// **'Lens and stabilization changes apply the next time the camera starts.'**
  String get settingsCameraFooter;

  /// Opens the AI model list
  ///
  /// In en, this message translates to:
  /// **'AI model'**
  String get settingsAiModel;

  /// Setting: minimum confidence threshold
  ///
  /// In en, this message translates to:
  /// **'Detection confidence'**
  String get settingsConfidence;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Object tracking'**
  String get settingsTracking;

  /// Subtitle of tracking toggle
  ///
  /// In en, this message translates to:
  /// **'Keeps objects stable between frames'**
  String get settingsTrackingSubtitle;

  /// Setting toggle: object labels on boxes
  ///
  /// In en, this message translates to:
  /// **'Show labels'**
  String get settingsShowLabels;

  /// Setting toggle: confidence percentage on boxes
  ///
  /// In en, this message translates to:
  /// **'Show confidence'**
  String get settingsShowConfidence;

  /// Setting: opacity of segmentation masks
  ///
  /// In en, this message translates to:
  /// **'Perception mask opacity'**
  String get settingsSegmentationOpacity;

  /// Footer under AI settings
  ///
  /// In en, this message translates to:
  /// **'A lower confidence shows more objects but also more false detections. Detections may be inaccurate.'**
  String get settingsAiFooter;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Voice alerts'**
  String get settingsVoiceAlerts;

  /// Setting: language for spoken alerts
  ///
  /// In en, this message translates to:
  /// **'Voice language'**
  String get settingsVoiceLanguage;

  /// Voice language option following the app language
  ///
  /// In en, this message translates to:
  /// **'Match app language'**
  String get settingsVoiceLanguageAuto;

  /// Setting: which installed voice speaks alerts
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get settingsVoice;

  /// Default voice option
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get settingsVoiceDefault;

  /// Voice quality label
  ///
  /// In en, this message translates to:
  /// **'Enhanced'**
  String get settingsVoiceQualityEnhanced;

  /// Voice quality label (iOS premium voice)
  ///
  /// In en, this message translates to:
  /// **'High quality'**
  String get settingsVoiceQualityPremium;

  /// Shown when no TTS voice exists for the chosen language
  ///
  /// In en, this message translates to:
  /// **'No voice is installed for this language. Add one in iOS Settings › Accessibility › Spoken Content.'**
  String get settingsNoVoices;

  /// Alert category toggle
  ///
  /// In en, this message translates to:
  /// **'Pedestrians'**
  String get settingsAlertPedestrian;

  /// Alert category toggle
  ///
  /// In en, this message translates to:
  /// **'Cyclists'**
  String get settingsAlertCyclist;

  /// Alert category toggle
  ///
  /// In en, this message translates to:
  /// **'Motorcycles'**
  String get settingsAlertMotorcycle;

  /// Alert category toggle
  ///
  /// In en, this message translates to:
  /// **'Buses'**
  String get settingsAlertBus;

  /// Alert category toggle
  ///
  /// In en, this message translates to:
  /// **'Vehicle very close ahead'**
  String get settingsAlertVehicleClose;

  /// Alert category toggle
  ///
  /// In en, this message translates to:
  /// **'Traffic light changes'**
  String get settingsAlertTrafficLight;

  /// Alert category toggle
  ///
  /// In en, this message translates to:
  /// **'Traffic ahead moving'**
  String get settingsAlertTrafficMoving;

  /// Alert category toggle
  ///
  /// In en, this message translates to:
  /// **'Stop signs'**
  String get settingsAlertStopSign;

  /// Setting: alert sensitivity
  ///
  /// In en, this message translates to:
  /// **'Sensitivity'**
  String get settingsSensitivity;

  /// Sensitivity option
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get settingsSensitivityLow;

  /// Sensitivity option
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get settingsSensitivityMedium;

  /// Sensitivity option
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get settingsSensitivityHigh;

  /// Setting: minimum time before the same alert repeats
  ///
  /// In en, this message translates to:
  /// **'Repeat interval'**
  String get settingsCooldown;

  /// Compact seconds value
  ///
  /// In en, this message translates to:
  /// **'{seconds} s'**
  String settingsSecondsShort(int seconds);

  /// Setting slider
  ///
  /// In en, this message translates to:
  /// **'Voice volume'**
  String get settingsVolume;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Quiet mode'**
  String get settingsQuietMode;

  /// Subtitle of quiet mode toggle
  ///
  /// In en, this message translates to:
  /// **'Only the most important alerts are spoken'**
  String get settingsQuietModeSubtitle;

  /// Button: speak a sample alert
  ///
  /// In en, this message translates to:
  /// **'Test voice'**
  String get settingsTestVoice;

  /// Snackbar after test voice
  ///
  /// In en, this message translates to:
  /// **'Playing a sample alert…'**
  String get settingsTestVoiceDone;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Parking beeps'**
  String get settingsParkingBeeps;

  /// Setting slider
  ///
  /// In en, this message translates to:
  /// **'Beep volume'**
  String get settingsBeepVolume;

  /// Footer under alert settings
  ///
  /// In en, this message translates to:
  /// **'Alerts are an aid only. Always watch the road — silence doesn\'t mean the way is clear.'**
  String get settingsAlertsFooter;

  /// Setting: incident clip resolution
  ///
  /// In en, this message translates to:
  /// **'Recording quality'**
  String get settingsRecordingProfile;

  /// Recording profile option
  ///
  /// In en, this message translates to:
  /// **'Standard · 720p'**
  String get settingsProfileStandard;

  /// Recording profile option
  ///
  /// In en, this message translates to:
  /// **'Full HD · 1080p'**
  String get settingsProfilePremium;

  /// Setting: seconds kept in the rolling buffer
  ///
  /// In en, this message translates to:
  /// **'Incident buffer'**
  String get settingsBufferLength;

  /// Buffer length option
  ///
  /// In en, this message translates to:
  /// **'{seconds} seconds'**
  String settingsBufferSeconds(int seconds);

  /// Recording settings: auto-stop length for manual recording
  ///
  /// In en, this message translates to:
  /// **'Manual recording max length'**
  String get settingsManualMaxLength;

  /// Manual recording max length option: no limit
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get settingsManualMaxUnlimited;

  /// Manual recording max length option
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String settingsManualMaxMinutes(int minutes);

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Record audio'**
  String get settingsRecordAudio;

  /// Subtitle of audio toggle
  ///
  /// In en, this message translates to:
  /// **'Includes cabin audio in saved incidents'**
  String get settingsRecordAudioSubtitle;

  /// Shown when microphone permission is denied
  ///
  /// In en, this message translates to:
  /// **'Microphone access is off. Allow it in Settings to record audio.'**
  String get settingsMicDenied;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Corvista watermark'**
  String get settingsWatermark;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Date & time stamp'**
  String get settingsTimestamp;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Save location with clips'**
  String get settingsSaveLocation;

  /// Opens the clips gallery
  ///
  /// In en, this message translates to:
  /// **'Storage & clips'**
  String get settingsStorage;

  /// Storage summary line
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No clips} =1{1 clip} other{{count} clips}} · {used} used · {free} free'**
  String settingsStorageSummary(int count, String used, String free);

  /// Footer under recording settings
  ///
  /// In en, this message translates to:
  /// **'The rolling buffer stays on your iPhone and is overwritten continuously. Nothing is recorded in the background.'**
  String get settingsRecordingFooter;

  /// Setting: view shown when a drive starts
  ///
  /// In en, this message translates to:
  /// **'Default view'**
  String get settingsDefaultView;

  /// Setting: speed/distance units
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get settingsUnits;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Show compass'**
  String get settingsShowCompass;

  /// Setting: heads-up display style
  ///
  /// In en, this message translates to:
  /// **'HUD style'**
  String get settingsHudStyle;

  /// Opens HUD customization
  ///
  /// In en, this message translates to:
  /// **'Customize HUD'**
  String get settingsHudCustomize;

  /// Settings › Driving: which side of the road traffic drives on (affects the virtual view's stylized road)
  ///
  /// In en, this message translates to:
  /// **'Driving side'**
  String get settingsDrivingSide;

  /// Driving side option: follow the device region
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get settingsDrivingSideAuto;

  /// Driving side option: right-hand traffic
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get settingsDrivingSideRight;

  /// Driving side option: left-hand traffic
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get settingsDrivingSideLeft;

  /// Setting: rendering style of the virtual view
  ///
  /// In en, this message translates to:
  /// **'Virtual view style'**
  String get settingsVirtualStyle;

  /// Virtual style option
  ///
  /// In en, this message translates to:
  /// **'Minimal'**
  String get settingsVirtualMinimal;

  /// Virtual style option
  ///
  /// In en, this message translates to:
  /// **'Perspective'**
  String get settingsVirtualPerspective;

  /// Virtual style option
  ///
  /// In en, this message translates to:
  /// **'High contrast'**
  String get settingsVirtualHighContrast;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Keep screen on while driving'**
  String get settingsKeepScreenOn;

  /// Setting toggle: turn-by-turn Live Activity
  ///
  /// In en, this message translates to:
  /// **'Live Activity'**
  String get settingsLiveActivity;

  /// Setting toggle subtitle
  ///
  /// In en, this message translates to:
  /// **'Show turn-by-turn directions on the Lock Screen and in the Dynamic Island'**
  String get settingsLiveActivityDesc;

  /// Drive banner after returning from the background during a drive (iOS stops the camera in the background)
  ///
  /// In en, this message translates to:
  /// **'Recording paused while Corvista was in the background'**
  String get driveRecordingPausedBackground;

  /// Live Activity dashcam badge: recording (keep very short)
  ///
  /// In en, this message translates to:
  /// **'REC'**
  String get liveActivityRec;

  /// Live Activity dashcam badge: recording paused (keep short)
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get liveActivityPaused;

  /// Live Activity dashcam badge: dashcam not running (keep short)
  ///
  /// In en, this message translates to:
  /// **'Cam off'**
  String get liveActivityDashcamOff;

  /// Live Activity final state when navigation is cancelled
  ///
  /// In en, this message translates to:
  /// **'Navigation ended'**
  String get liveActivityEnded;

  /// Live Activity label before the arrival time
  ///
  /// In en, this message translates to:
  /// **'Arrival'**
  String get liveActivityEta;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Auto-recenter map'**
  String get settingsAutoRecenter;

  /// HUD style name
  ///
  /// In en, this message translates to:
  /// **'Classic'**
  String get settingsHudStyleClassic;

  /// HUD style name
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get settingsHudStyleGrid;

  /// HUD style name
  ///
  /// In en, this message translates to:
  /// **'Minimal'**
  String get settingsHudStyleMinimal;

  /// HUD style name
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get settingsHudStylePerformance;

  /// HUD style name
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get settingsHudStyleNavigation;

  /// HUD style name
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get settingsHudStyleNight;

  /// HUD style name
  ///
  /// In en, this message translates to:
  /// **'High contrast'**
  String get settingsHudStyleHighContrast;

  /// Setting: performance/battery trade-off
  ///
  /// In en, this message translates to:
  /// **'Power mode'**
  String get settingsPowerMode;

  /// Power mode option
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get settingsPowerBalanced;

  /// Power mode option
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get settingsPowerPerformance;

  /// Power mode option
  ///
  /// In en, this message translates to:
  /// **'Power saver'**
  String get settingsPowerSaver;

  /// Footer under power settings
  ///
  /// In en, this message translates to:
  /// **'Corvista lowers AI rate and visual effects automatically when your iPhone gets warm or the battery is low.'**
  String get settingsPowerFooter;

  /// Live device thermal state
  ///
  /// In en, this message translates to:
  /// **'Thermal state'**
  String get settingsThermal;

  /// Thermal state
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get settingsThermalNominal;

  /// Thermal state
  ///
  /// In en, this message translates to:
  /// **'Warm'**
  String get settingsThermalFair;

  /// Thermal state
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get settingsThermalSerious;

  /// Thermal state
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get settingsThermalCritical;

  /// Live battery level
  ///
  /// In en, this message translates to:
  /// **'Battery'**
  String get settingsBattery;

  /// Battery level while charging
  ///
  /// In en, this message translates to:
  /// **'{percent} · Charging'**
  String settingsBatteryCharging(String percent);

  /// Shown when iOS Low Power Mode is enabled
  ///
  /// In en, this message translates to:
  /// **'Low Power Mode is on — AI runs at a reduced rate.'**
  String get settingsLowPowerMode;

  /// Live detection rate
  ///
  /// In en, this message translates to:
  /// **'Current AI rate'**
  String get settingsAiRate;

  /// Frequency value
  ///
  /// In en, this message translates to:
  /// **'{value} Hz'**
  String settingsHzValue(String value);

  /// Opens emergency setup
  ///
  /// In en, this message translates to:
  /// **'Impact detection'**
  String get settingsEmergencySetup;

  /// Emergency status when enabled
  ///
  /// In en, this message translates to:
  /// **'On · {seconds} s countdown'**
  String settingsEmergencyOn(int seconds);

  /// Footer under emergency settings
  ///
  /// In en, this message translates to:
  /// **'Experimental. Not a substitute for emergency services.'**
  String get settingsEmergencyFooter;

  /// Setting: app color theme
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// Theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeSystem;

  /// Theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// Theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// Setting toggle
  ///
  /// In en, this message translates to:
  /// **'Reduce motion'**
  String get settingsReduceMotion;

  /// Subtitle of reduce motion toggle
  ///
  /// In en, this message translates to:
  /// **'Minimizes animations across the app'**
  String get settingsReduceMotionSubtitle;

  /// Opens the language list
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get settingsAppLanguage;

  /// Information link
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyPolicy;

  /// Information link
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get settingsTerms;

  /// Information link
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get settingsHelp;

  /// Opens mail to support
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get settingsSupport;

  /// Information link to the third-party licence notices page
  ///
  /// In en, this message translates to:
  /// **'Open-source licences'**
  String get settingsLicenses;

  /// Shown when mailto fails
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open Mail. Write to support@corvista.app.'**
  String get settingsSupportUnavailable;

  /// Information link
  ///
  /// In en, this message translates to:
  /// **'Safety information'**
  String get settingsSafety;

  /// Opens diagnostics screen
  ///
  /// In en, this message translates to:
  /// **'Diagnostics'**
  String get settingsDiagnostics;

  /// App version row
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// App version and build number
  ///
  /// In en, this message translates to:
  /// **'{version} ({build})'**
  String settingsVersionValue(String version, String build);

  /// HUD customization screen title
  ///
  /// In en, this message translates to:
  /// **'Customize HUD'**
  String get hudCustomTitle;

  /// Caption of the HUD preview card
  ///
  /// In en, this message translates to:
  /// **'Preview · sample values'**
  String get hudCustomPreview;

  /// Section title
  ///
  /// In en, this message translates to:
  /// **'Style'**
  String get hudCustomStyle;

  /// Section title
  ///
  /// In en, this message translates to:
  /// **'Elements'**
  String get hudCustomElements;

  /// HUD element toggle
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get hudCustomSpeed;

  /// HUD element toggle
  ///
  /// In en, this message translates to:
  /// **'Heading & compass'**
  String get hudCustomHeading;

  /// HUD element toggle
  ///
  /// In en, this message translates to:
  /// **'Clock'**
  String get hudCustomClock;

  /// HUD element toggle
  ///
  /// In en, this message translates to:
  /// **'Battery & thermal'**
  String get hudCustomBattery;

  /// HUD element toggle
  ///
  /// In en, this message translates to:
  /// **'AI status & detections'**
  String get hudCustomDetections;

  /// HUD element toggle
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get hudCustomWeather;

  /// Section title
  ///
  /// In en, this message translates to:
  /// **'Size & opacity'**
  String get hudCustomAppearance;

  /// HUD scale slider
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get hudCustomSize;

  /// HUD opacity slider
  ///
  /// In en, this message translates to:
  /// **'Opacity'**
  String get hudCustomOpacity;

  /// Footer under HUD elements
  ///
  /// In en, this message translates to:
  /// **'Warnings such as overheating are always shown, even when elements are hidden.'**
  String get hudCustomFooter;

  /// HUD style description
  ///
  /// In en, this message translates to:
  /// **'Balanced instrument cluster'**
  String get hudCustomDescClassic;

  /// HUD style description
  ///
  /// In en, this message translates to:
  /// **'Perspective grid over the road'**
  String get hudCustomDescGrid;

  /// HUD style description
  ///
  /// In en, this message translates to:
  /// **'Speed only, nothing else'**
  String get hudCustomDescMinimal;

  /// HUD style description
  ///
  /// In en, this message translates to:
  /// **'Speed arc with live readouts'**
  String get hudCustomDescPerformance;

  /// HUD style description
  ///
  /// In en, this message translates to:
  /// **'Next maneuver first'**
  String get hudCustomDescNavigation;

  /// HUD style description
  ///
  /// In en, this message translates to:
  /// **'Dim and red-shifted for night driving'**
  String get hudCustomDescNight;

  /// HUD style description
  ///
  /// In en, this message translates to:
  /// **'Maximum legibility in bright sun'**
  String get hudCustomDescHighContrast;

  /// Language screen title
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// Language option following iOS
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get languageSystem;

  /// Subtitle of system language option
  ///
  /// In en, this message translates to:
  /// **'Follow your iPhone\'s language'**
  String get languageSystemSubtitle;

  /// Footer on language screen
  ///
  /// In en, this message translates to:
  /// **'More languages are coming. The voice alert language can be set separately under Alerts.'**
  String get languageFooter;

  /// Diagnostics screen title
  ///
  /// In en, this message translates to:
  /// **'Diagnostics'**
  String get diagTitle;

  /// Diagnostics section
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get diagPerformance;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Inference time'**
  String get diagInference;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Detection rate'**
  String get diagDetectHz;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Camera frame rate'**
  String get diagCameraFps;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Memory'**
  String get diagMemory;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Dropped frames'**
  String get diagDropped;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Segmentation time'**
  String get diagSegmentation;

  /// Diagnostics section
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get diagCamera;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get diagStatus;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get diagSource;

  /// Camera source value
  ///
  /// In en, this message translates to:
  /// **'Live camera'**
  String get diagSourceCamera;

  /// Camera source value
  ///
  /// In en, this message translates to:
  /// **'Test footage file'**
  String get diagSourceFile;

  /// Diagnostics row: camera buffer resolution
  ///
  /// In en, this message translates to:
  /// **'Buffer size'**
  String get diagResolution;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Lens'**
  String get diagLens;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Last error'**
  String get diagError;

  /// Diagnostics section
  ///
  /// In en, this message translates to:
  /// **'AI model'**
  String get diagModel;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Model load time'**
  String get diagModelLoad;

  /// Diagnostics section
  ///
  /// In en, this message translates to:
  /// **'Power'**
  String get diagPower;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Segmentation rate'**
  String get diagSegHz;

  /// Diagnostics row
  ///
  /// In en, this message translates to:
  /// **'Reduced effects'**
  String get diagReduced;

  /// Milliseconds value
  ///
  /// In en, this message translates to:
  /// **'{value} ms'**
  String diagMs(String value);

  /// Frames per second value
  ///
  /// In en, this message translates to:
  /// **'{value} fps'**
  String diagFps(String value);

  /// Megabytes value
  ///
  /// In en, this message translates to:
  /// **'{value} MB'**
  String diagMb(String value);

  /// Camera status
  ///
  /// In en, this message translates to:
  /// **'Idle'**
  String get diagCamIdle;

  /// Camera status
  ///
  /// In en, this message translates to:
  /// **'Starting'**
  String get diagCamStarting;

  /// Camera status
  ///
  /// In en, this message translates to:
  /// **'Running'**
  String get diagCamRunning;

  /// Camera status
  ///
  /// In en, this message translates to:
  /// **'Interrupted'**
  String get diagCamInterrupted;

  /// Camera status
  ///
  /// In en, this message translates to:
  /// **'Stopped'**
  String get diagCamStopped;

  /// Camera status
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get diagCamUnavailable;

  /// Camera status
  ///
  /// In en, this message translates to:
  /// **'Permission denied'**
  String get diagCamPermissionDenied;

  /// Camera status
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get diagCamError;

  /// Diagnostics section
  ///
  /// In en, this message translates to:
  /// **'Test footage'**
  String get diagTestFootage;

  /// Explanation of test footage mode
  ///
  /// In en, this message translates to:
  /// **'Run real on-device detection on a local video file instead of the camera. Every view labels it TEST FOOTAGE.'**
  String get diagTestFootageBody;

  /// Text field label
  ///
  /// In en, this message translates to:
  /// **'Video file path'**
  String get diagPathLabel;

  /// Text field hint; keep as a path example
  ///
  /// In en, this message translates to:
  /// **'/path/to/drive.mp4'**
  String get diagPathHint;

  /// Fills the path with a file in the app's Documents folder
  ///
  /// In en, this message translates to:
  /// **'Use Documents/test_drive.mp4'**
  String get diagUseDocuments;

  /// Starts decoding the test file
  ///
  /// In en, this message translates to:
  /// **'Run test footage'**
  String get diagRun;

  /// Snackbar after starting test footage
  ///
  /// In en, this message translates to:
  /// **'Test footage started. Open the drive view to see it.'**
  String get diagRunStarted;

  /// Restarts the live camera
  ///
  /// In en, this message translates to:
  /// **'Return to live camera'**
  String get diagBackToCamera;

  /// Shown in release builds
  ///
  /// In en, this message translates to:
  /// **'Test footage is only available in development builds.'**
  String get diagDebugOnly;

  /// Validation error
  ///
  /// In en, this message translates to:
  /// **'No file exists at that path.'**
  String get diagFileMissing;

  /// Emergency setup screen title
  ///
  /// In en, this message translates to:
  /// **'Impact detection'**
  String get emergencySetupTitle;

  /// Badge on emergency feature
  ///
  /// In en, this message translates to:
  /// **'Experimental'**
  String get emergencyExperimental;

  /// Emergency feature explanation
  ///
  /// In en, this message translates to:
  /// **'During a drive, Corvista can watch for a possible severe impact using your iPhone\'s motion sensors. If one is detected, a countdown starts. If you don\'t cancel it, Corvista offers to call emergency services and message your contacts.'**
  String get emergencyIntro;

  /// Emergency disclaimer bullet
  ///
  /// In en, this message translates to:
  /// **'Not a substitute for emergency services or your vehicle\'s own crash detection.'**
  String get emergencyDisclaimer1;

  /// Emergency disclaimer bullet
  ///
  /// In en, this message translates to:
  /// **'iOS always asks you to confirm before a call is placed or a message is sent.'**
  String get emergencyDisclaimer2;

  /// Emergency disclaimer bullet
  ///
  /// In en, this message translates to:
  /// **'Impacts can be missed, and hard braking or bumps can be mistaken for one.'**
  String get emergencyDisclaimer3;

  /// Warning shown when speed exceeds 5 km/h
  ///
  /// In en, this message translates to:
  /// **'Complete this setup while parked. Settings are locked while the vehicle is moving.'**
  String get emergencyParkedWarning;

  /// Toggle
  ///
  /// In en, this message translates to:
  /// **'Enable impact detection'**
  String get emergencyEnable;

  /// Subtitle of enable toggle
  ///
  /// In en, this message translates to:
  /// **'Active only during a drive session'**
  String get emergencyEnableSubtitle;

  /// Validation message
  ///
  /// In en, this message translates to:
  /// **'Add an emergency number first.'**
  String get emergencyNeedNumber;

  /// Section title
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts'**
  String get emergencyContacts;

  /// Button: pick a contact
  ///
  /// In en, this message translates to:
  /// **'Add contact'**
  String get emergencyAddContact;

  /// Empty contacts state
  ///
  /// In en, this message translates to:
  /// **'No contacts yet. Contacts get a message only after you confirm it.'**
  String get emergencyNoContacts;

  /// Confirm dialog title
  ///
  /// In en, this message translates to:
  /// **'Remove {name}?'**
  String emergencyRemoveContactTitle(String name);

  /// Confirm dialog body
  ///
  /// In en, this message translates to:
  /// **'They won\'t be offered as a recipient after an impact.'**
  String get emergencyRemoveContactBody;

  /// Confirm button
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get emergencyRemove;

  /// Error loading contacts
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load contacts.'**
  String get emergencyContactsError;

  /// Setting: number to call
  ///
  /// In en, this message translates to:
  /// **'Emergency number'**
  String get emergencyNumber;

  /// Hint for emergency number field
  ///
  /// In en, this message translates to:
  /// **'e.g. 112 or 911'**
  String get emergencyNumberHint;

  /// Setting: text sent to contacts
  ///
  /// In en, this message translates to:
  /// **'Message template'**
  String get emergencyMessage;

  /// Default emergency message
  ///
  /// In en, this message translates to:
  /// **'I may have been in a vehicle accident. This message was prepared by Corvista and includes my last known location if available.'**
  String get emergencyMessageDefault;

  /// Hint for message field
  ///
  /// In en, this message translates to:
  /// **'Leave empty to use the default message.'**
  String get emergencyMessageHint;

  /// Setting
  ///
  /// In en, this message translates to:
  /// **'Countdown length'**
  String get emergencyCountdown;

  /// Toggle
  ///
  /// In en, this message translates to:
  /// **'Cancel by voice'**
  String get emergencyVoiceCancel;

  /// Subtitle of voice cancel toggle
  ///
  /// In en, this message translates to:
  /// **'Say “I\'m OK” or “Cancel” during the countdown. Uses on-device speech recognition where available.'**
  String get emergencyVoiceCancelSubtitle;

  /// Shown when permission is denied
  ///
  /// In en, this message translates to:
  /// **'Microphone and speech recognition access are needed for voice cancellation.'**
  String get emergencyVoicePermDenied;

  /// Toggle
  ///
  /// In en, this message translates to:
  /// **'Save incident clip automatically'**
  String get emergencyAutoSave;

  /// Button: run a simulated impact
  ///
  /// In en, this message translates to:
  /// **'Test countdown (no call)'**
  String get emergencyTest;

  /// Explanation of test button
  ///
  /// In en, this message translates to:
  /// **'Runs a simulated impact so you can see the countdown. No call or message is ever made in test mode.'**
  String get emergencyTestBody;

  /// Placeholder for empty values
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get emergencyNotSet;

  /// Full-screen alert headline
  ///
  /// In en, this message translates to:
  /// **'Possible severe impact detected.'**
  String get emergencyAlertHeadline;

  /// Full-screen alert subtitle
  ///
  /// In en, this message translates to:
  /// **'Are you okay?'**
  String get emergencyAlertSubtitle;

  /// Giant cancel button
  ///
  /// In en, this message translates to:
  /// **'I\'m OK — Cancel'**
  String get emergencyAlertCancel;

  /// Accessibility label for countdown
  ///
  /// In en, this message translates to:
  /// **'{seconds, plural, =1{1 second left} other{{seconds} seconds left}}'**
  String emergencyAlertSecondsLeft(int seconds);

  /// Voice cancel indicator
  ///
  /// In en, this message translates to:
  /// **'Listening — say “I\'m OK” to cancel'**
  String get emergencyAlertListening;

  /// Last recognized speech
  ///
  /// In en, this message translates to:
  /// **'Heard: “{text}”'**
  String emergencyAlertHeard(String text);

  /// Shown after countdown ends
  ///
  /// In en, this message translates to:
  /// **'No response. Choose what to do:'**
  String get emergencyAlertEscalated;

  /// Button
  ///
  /// In en, this message translates to:
  /// **'Call emergency services'**
  String get emergencyAlertCall;

  /// Subtitle of call button
  ///
  /// In en, this message translates to:
  /// **'Calls {number}. iOS asks you to confirm.'**
  String emergencyAlertCallNumber(String number);

  /// Button
  ///
  /// In en, this message translates to:
  /// **'Message contacts'**
  String get emergencyAlertMessage;

  /// Subtitle of message button
  ///
  /// In en, this message translates to:
  /// **'Opens a prepared message. You choose whether to send it.'**
  String get emergencyAlertMessageSubtitle;

  /// Label on disabled actions in test mode
  ///
  /// In en, this message translates to:
  /// **'Test mode — no call will be placed'**
  String get emergencyAlertTestMode;

  /// Badge shown during a test countdown
  ///
  /// In en, this message translates to:
  /// **'TEST'**
  String get emergencyAlertTestBadge;

  /// Close button after escalation
  ///
  /// In en, this message translates to:
  /// **'I\'m OK — Close'**
  String get emergencyAlertClose;

  /// Result of message compose
  ///
  /// In en, this message translates to:
  /// **'Message sent.'**
  String get emergencyMsgSent;

  /// Result of message compose
  ///
  /// In en, this message translates to:
  /// **'Message not sent.'**
  String get emergencyMsgCancelled;

  /// Result of message compose
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t send the message.'**
  String get emergencyMsgFailed;

  /// Result of message compose
  ///
  /// In en, this message translates to:
  /// **'Messaging isn\'t available on this device.'**
  String get emergencyMsgUnavailable;

  /// Call failure
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t start the call. Dial {number} yourself.'**
  String emergencyCallFailed(String number);

  /// Title of the AI models screen
  ///
  /// In en, this message translates to:
  /// **'AI Models'**
  String get modelsTitle;

  /// Intro text on the AI models screen
  ///
  /// In en, this message translates to:
  /// **'All models are bundled with the app and run entirely on your iPhone. Your camera feed never leaves the device.'**
  String get modelsIntro;

  /// Live inference stats of the active model
  ///
  /// In en, this message translates to:
  /// **'Live: {ms} ms per frame · {hz} detections/s'**
  String modelsActiveStats(String ms, String hz);

  /// Time the active model took to load
  ///
  /// In en, this message translates to:
  /// **'Loaded in {ms} ms'**
  String modelsLastLoad(String ms);

  /// Display name for the efficient detection model
  ///
  /// In en, this message translates to:
  /// **'Efficient'**
  String get modelsEfficientName;

  /// Description of the efficient model
  ///
  /// In en, this message translates to:
  /// **'Fast, compact detector tuned for long drives with low heat and battery use.'**
  String get modelsEfficientDesc;

  /// Display name for the enhanced detection model
  ///
  /// In en, this message translates to:
  /// **'Enhanced'**
  String get modelsEnhancedName;

  /// Description of the enhanced model
  ///
  /// In en, this message translates to:
  /// **'Larger detector that finds smaller and more distant objects, at a higher power cost.'**
  String get modelsEnhancedDesc;

  /// Display name for the segmentation model
  ///
  /// In en, this message translates to:
  /// **'Segmentation'**
  String get modelsSegmentationName;

  /// Description of the segmentation model
  ///
  /// In en, this message translates to:
  /// **'Combines fast detection with road-surface and object masks for the Perception view.'**
  String get modelsSegmentationDesc;

  /// Display name for the option that pauses detection
  ///
  /// In en, this message translates to:
  /// **'AI paused'**
  String get modelsNoneName;

  /// Description of the paused-AI option
  ///
  /// In en, this message translates to:
  /// **'Camera and recording keep running without object detection. Lowest power use.'**
  String get modelsNoneDesc;

  /// Fallback description for an unknown model
  ///
  /// In en, this message translates to:
  /// **'On-device object detection model.'**
  String get modelsGenericDesc;

  /// Functionality line: detection
  ///
  /// In en, this message translates to:
  /// **'Detects vehicles, people, bicycles, motorcycles, buses, traffic lights and stop signs'**
  String get modelsFunctionDetection;

  /// Functionality line: segmentation
  ///
  /// In en, this message translates to:
  /// **'Adds road surface and object masks'**
  String get modelsFunctionSegmentation;

  /// Functionality line for paused AI
  ///
  /// In en, this message translates to:
  /// **'No detection; dashcam recording only'**
  String get modelsFunctionNone;

  /// Label: model file size
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get modelsSize;

  /// Label: model input resolution
  ///
  /// In en, this message translates to:
  /// **'Input'**
  String get modelsInput;

  /// Model input resolution value
  ///
  /// In en, this message translates to:
  /// **'{size} × {size} px'**
  String modelsInputValue(String size);

  /// Label: supported drive views
  ///
  /// In en, this message translates to:
  /// **'Works with'**
  String get modelsViews;

  /// Model is bundled with the app
  ///
  /// In en, this message translates to:
  /// **'Installed (bundled)'**
  String get modelsStatusInstalled;

  /// Model is not available on this device
  ///
  /// In en, this message translates to:
  /// **'Not installed'**
  String get modelsStatusNotInstalled;

  /// Label on the currently selected model
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get modelsSelected;

  /// Button to select a model
  ///
  /// In en, this message translates to:
  /// **'Use this model'**
  String get modelsUse;

  /// Shown while a model is being loaded
  ///
  /// In en, this message translates to:
  /// **'Loading model…'**
  String get modelsSwitching;

  /// Snackbar after switching model
  ///
  /// In en, this message translates to:
  /// **'{name} is now active'**
  String modelsSwitched(String name);

  /// Benchmark result (mean inference time measured on this iPhone)
  ///
  /// In en, this message translates to:
  /// **'Measured on this device: {ms} ms average'**
  String modelsBenchmarkMeasured(String ms);

  /// No benchmark has been run yet
  ///
  /// In en, this message translates to:
  /// **'Not measured on this device'**
  String get modelsBenchmarkNotMeasured;

  /// Button to run an on-device benchmark
  ///
  /// In en, this message translates to:
  /// **'Run benchmark'**
  String get modelsBenchmarkRun;

  /// Shown while benchmark runs
  ///
  /// In en, this message translates to:
  /// **'Benchmarking…'**
  String get modelsBenchmarkRunning;

  /// Hint: benchmarks run on the active model only
  ///
  /// In en, this message translates to:
  /// **'Select this model to benchmark it.'**
  String get modelsBenchmarkSelectHint;

  /// Snackbar after benchmark
  ///
  /// In en, this message translates to:
  /// **'Benchmark complete'**
  String get modelsBenchmarkDone;

  /// Snackbar on benchmark error
  ///
  /// In en, this message translates to:
  /// **'Benchmark failed: {message}'**
  String modelsBenchmarkFailed(String message);

  /// Model license and source line
  ///
  /// In en, this message translates to:
  /// **'{license} · {source}'**
  String modelsLicense(String license, String source);

  /// Footer showing when an info page was last revised
  ///
  /// In en, this message translates to:
  /// **'Last updated {date}'**
  String infoLastUpdated(String date);

  /// Title of the safety information screen
  ///
  /// In en, this message translates to:
  /// **'Safety information'**
  String get safetyTitle;

  /// Safety screen intro
  ///
  /// In en, this message translates to:
  /// **'Corvista is a driving-awareness aid. It does not control your vehicle and cannot replace your own attention, judgement or the vehicle\'s safety systems.'**
  String get safetyIntro;

  /// Safety section heading
  ///
  /// In en, this message translates to:
  /// **'Before you drive'**
  String get safetyBeforeTitle;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Mount your iPhone securely in a legal position that doesn\'t block your view, airbags or controls.'**
  String get safetyBefore1;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Finish setup, choose a view and set your destination while parked.'**
  String get safetyBefore2;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Connect a charger for longer drives and keep the phone out of direct sunlight where possible.'**
  String get safetyBefore3;

  /// Safety section heading
  ///
  /// In en, this message translates to:
  /// **'While driving'**
  String get safetyWhileTitle;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Keep your eyes on the road. Only use the large on-screen controls when it is safe and legal to do so.'**
  String get safetyWhile1;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Alerts are aids, not warnings you can rely on. Silence never means the road is clear.'**
  String get safetyWhile2;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Follow traffic laws, signals and road signs — not the app — when they disagree.'**
  String get safetyWhile3;

  /// Safety section heading
  ///
  /// In en, this message translates to:
  /// **'Limitations'**
  String get safetyLimitsTitle;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'A single phone camera sees only what is in front of it. Objects outside its view, hidden or very close are not detected.'**
  String get safetyLimits1;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Detections may be missed, late or wrong, especially at night, in rain, fog, glare or with a dirty windshield.'**
  String get safetyLimits2;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Only supported categories are recognised: vehicles, buses, motorcycles, bicycles, people, traffic lights and stop signs. Lane hints in the virtual view are stylised, not detected lanes.'**
  String get safetyLimits3;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Proximity is shown as approximate zones (Very close, Close, Medium, Far), never as measured distances. The parking view is not a parking-sensor replacement.'**
  String get safetyLimits4;

  /// Safety section heading
  ///
  /// In en, this message translates to:
  /// **'Heat and battery'**
  String get safetyHeatTitle;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Continuous camera and AI use warms your iPhone. Corvista lowers the analysis rate when the device gets hot and shows a warning; if iOS overheats, the camera may stop.'**
  String get safetyHeat1;

  /// Safety section heading
  ///
  /// In en, this message translates to:
  /// **'Emergency feature'**
  String get safetyEmergencyTitle;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'Possible-impact detection is experimental. It can miss real crashes and can be triggered by other events.'**
  String get safetyEmergency1;

  /// Safety bullet
  ///
  /// In en, this message translates to:
  /// **'It never contacts anyone silently: iOS always asks you to confirm a call or message. It is not a substitute for calling emergency services yourself.'**
  String get safetyEmergency2;

  /// Title of the in-app privacy policy screen
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyTitle;

  /// Privacy intro
  ///
  /// In en, this message translates to:
  /// **'Corvista is designed to keep your driving data on your iPhone. There is no Corvista account, and Corvista does not run its own servers.'**
  String get privacyIntro;

  /// Privacy section heading
  ///
  /// In en, this message translates to:
  /// **'Camera and AI'**
  String get privacyCameraTitle;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'Object detection, tracking and segmentation run entirely on your iPhone. Camera frames are never uploaded.'**
  String get privacyCamera1;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'The camera only runs while Corvista is open on screen. It pauses when the app goes to the background — there is no hidden background recording.'**
  String get privacyCamera2;

  /// Privacy section heading
  ///
  /// In en, this message translates to:
  /// **'Recordings'**
  String get privacyRecordingsTitle;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'The rolling buffer is temporary and overwritten continuously. Footage is only kept when you tap Save Incident or, if you enable it, after a possible impact.'**
  String get privacyRecordings1;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'Saved clips stay in Corvista\'s private storage on your iPhone. They leave the device only when you choose Share. Deleting the app deletes them.'**
  String get privacyRecordings2;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'Audio is recorded only if you turn it on and grant microphone access.'**
  String get privacyRecordings3;

  /// Privacy section heading
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get privacyLocationTitle;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'Location is used while the app is open for your speed, the map, routes and weather. If \"Save location\" is on, the position at save time is stored with the clip on your device.'**
  String get privacyLocation1;

  /// Privacy section heading
  ///
  /// In en, this message translates to:
  /// **'Network services'**
  String get privacyNetworkTitle;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'Apple Maps — map display, place search and routes. Your search text and approximate location are sent to Apple.'**
  String get privacyNetwork1;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'Apple Weather (WeatherKit) — current and hourly weather for your location.'**
  String get privacyNetwork2;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'Corvista includes no advertising and no third-party analytics or tracking.'**
  String get privacyNetwork4;

  /// Privacy section heading
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts'**
  String get privacyEmergencyTitle;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'Contacts you choose are stored in the iOS Keychain on this device. Voice cancellation uses on-device speech recognition where available. Calls and messages are only sent after you confirm them in iOS.'**
  String get privacyEmergency1;

  /// Privacy section heading
  ///
  /// In en, this message translates to:
  /// **'Your controls'**
  String get privacyControlsTitle;

  /// Privacy bullet
  ///
  /// In en, this message translates to:
  /// **'You can delete clips at any time in Clips, and change or revoke camera, microphone, location and speech access in iOS Settings.'**
  String get privacyControls1;

  /// Title of the terms screen
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsTitle;

  /// Terms intro
  ///
  /// In en, this message translates to:
  /// **'By using Corvista you agree to these terms. Apple\'s standard Licensed Application End User License Agreement also applies.'**
  String get termsIntro;

  /// Terms section heading
  ///
  /// In en, this message translates to:
  /// **'Using Corvista'**
  String get termsUseTitle;

  /// Terms bullet
  ///
  /// In en, this message translates to:
  /// **'Corvista is a driving-awareness and dashcam aid. You remain fully responsible for driving safely and legally at all times.'**
  String get termsUse1;

  /// Terms bullet
  ///
  /// In en, this message translates to:
  /// **'Don\'t interact with the app in ways that distract you while driving. Mount the device securely and lawfully.'**
  String get termsUse2;

  /// Terms section heading
  ///
  /// In en, this message translates to:
  /// **'No guarantees of accuracy'**
  String get termsAccuracyTitle;

  /// Terms bullet
  ///
  /// In en, this message translates to:
  /// **'Detections, zones, alerts, map markers, routes and weather can be incomplete, delayed or wrong. Corvista does not control your vehicle.'**
  String get termsAccuracy1;

  /// Terms bullet
  ///
  /// In en, this message translates to:
  /// **'The emergency feature is experimental and may fail to detect an impact or may trigger falsely.'**
  String get termsAccuracy2;

  /// Terms section heading
  ///
  /// In en, this message translates to:
  /// **'Recording laws'**
  String get termsRecordingTitle;

  /// Terms bullet
  ///
  /// In en, this message translates to:
  /// **'Laws on dashcams, audio recording and filming people differ by country and region. You are responsible for complying with them, including when you share clips.'**
  String get termsRecording1;

  /// Terms section heading
  ///
  /// In en, this message translates to:
  /// **'Liability'**
  String get termsLiabilityTitle;

  /// Terms bullet
  ///
  /// In en, this message translates to:
  /// **'The app is provided \"as is\". To the extent permitted by law, the developer is not liable for accidents, losses, fines or damages arising from its use or from reliance on its output.'**
  String get termsLiability1;

  /// Terms section heading
  ///
  /// In en, this message translates to:
  /// **'Changes'**
  String get termsChangesTitle;

  /// Terms bullet
  ///
  /// In en, this message translates to:
  /// **'These terms may be updated with new versions of the app. Continued use after an update means you accept the revised terms.'**
  String get termsChanges1;

  /// Title of the help / FAQ screen
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get helpTitle;

  /// Help intro
  ///
  /// In en, this message translates to:
  /// **'Answers to common questions. For safety guidance, see Safety information.'**
  String get helpIntro;

  /// FAQ question
  ///
  /// In en, this message translates to:
  /// **'How do I keep footage of an incident?'**
  String get helpQSave;

  /// Help FAQ answer: how to save an incident
  ///
  /// In en, this message translates to:
  /// **'Tap the large Save Incident button in the drive view. Corvista saves the last 20 or 30 seconds of its rolling buffer (your choice in Settings › Recording) to Clips.'**
  String get helpASaveBuffer;

  /// FAQ question
  ///
  /// In en, this message translates to:
  /// **'Where are my clips stored?'**
  String get helpQWhere;

  /// FAQ answer
  ///
  /// In en, this message translates to:
  /// **'In Corvista\'s private storage on your iPhone. They are never uploaded. Use Share in the player to send or export a clip.'**
  String get helpAWhere;

  /// FAQ question
  ///
  /// In en, this message translates to:
  /// **'How accurate are the proximity zones?'**
  String get helpQZones;

  /// FAQ answer
  ///
  /// In en, this message translates to:
  /// **'Zones are rough estimates from a single camera using typical object sizes. Treat them as approximate hints, never as distances.'**
  String get helpAZones;

  /// FAQ question
  ///
  /// In en, this message translates to:
  /// **'Why does detection slow down?'**
  String get helpQSlow;

  /// FAQ answer
  ///
  /// In en, this message translates to:
  /// **'When your iPhone gets warm, the battery is low or Low Power Mode is on, Corvista reduces the analysis rate to protect the device. You can change the power mode in Settings.'**
  String get helpASlow;

  /// FAQ question
  ///
  /// In en, this message translates to:
  /// **'The map, search or weather isn\'t working.'**
  String get helpQMap;

  /// FAQ answer
  ///
  /// In en, this message translates to:
  /// **'These features need an internet connection and location access. Check your connection and allow location for Corvista in iOS Settings.'**
  String get helpAMap;

  /// FAQ question
  ///
  /// In en, this message translates to:
  /// **'The camera shows as unavailable.'**
  String get helpQSimulator;

  /// FAQ answer
  ///
  /// In en, this message translates to:
  /// **'Make sure camera access is allowed in iOS Settings and no other app is using the camera. On the iOS Simulator there is no camera; a local test video can be used instead.'**
  String get helpASimulator;

  /// Shown when messaging with no contacts configured
  ///
  /// In en, this message translates to:
  /// **'Add an emergency contact first.'**
  String get emergencyMsgNoContacts;

  /// Overlay while the camera session starts
  ///
  /// In en, this message translates to:
  /// **'Starting camera…'**
  String get cameraStarting;

  /// Overlay title when iOS interrupts the camera (call, other app, multitasking)
  ///
  /// In en, this message translates to:
  /// **'Camera paused'**
  String get cameraInterrupted;

  /// Overlay body for an interrupted camera
  ///
  /// In en, this message translates to:
  /// **'iOS paused the camera, for example during a call or while another app uses it. It resumes automatically.'**
  String get cameraInterruptedBody;

  /// Overlay title when there is no camera (e.g. the iOS Simulator)
  ///
  /// In en, this message translates to:
  /// **'Camera unavailable'**
  String get cameraUnavailable;

  /// Overlay body for an unavailable camera
  ///
  /// In en, this message translates to:
  /// **'No camera is available on this device. Detection, recording and parking views need the rear camera.'**
  String get cameraUnavailableBody;

  /// Debug-only button that opens diagnostics to play a local video through the detection pipeline
  ///
  /// In en, this message translates to:
  /// **'Run test footage'**
  String get cameraRunTestFootage;

  /// Overlay title when camera permission is denied
  ///
  /// In en, this message translates to:
  /// **'Camera access is off'**
  String get cameraPermissionDenied;

  /// Overlay body when camera permission is denied
  ///
  /// In en, this message translates to:
  /// **'Corvista needs the camera for detection, dashcam recording and parking views. Turn on Camera access in Settings.'**
  String get cameraPermissionDeniedBody;

  /// Overlay title for a camera failure
  ///
  /// In en, this message translates to:
  /// **'Camera error'**
  String get cameraError;

  /// Overlay title when the camera is stopped
  ///
  /// In en, this message translates to:
  /// **'Camera stopped'**
  String get cameraStopped;

  /// Button that (re)starts the camera
  ///
  /// In en, this message translates to:
  /// **'Start camera'**
  String get cameraStart;

  /// Accessibility hint for tap-to-focus on the camera preview
  ///
  /// In en, this message translates to:
  /// **'Tap to focus'**
  String get cameraFocusHint;

  /// Accessibility label for the camera preview
  ///
  /// In en, this message translates to:
  /// **'Live camera view with detected objects'**
  String get cameraPreviewLabel;

  /// On-screen diagnostics line (show FPS setting)
  ///
  /// In en, this message translates to:
  /// **'Camera {fps} fps · AI {hz} Hz · {ms} ms · dropped {dropped}'**
  String cameraDiagLine(String fps, String hz, String ms, int dropped);

  /// Accessibility label for the speed readout
  ///
  /// In en, this message translates to:
  /// **'Speed {speed} {unit} (GPS)'**
  String hudSpeedLabel(String speed, String unit);

  /// Accessibility label when GPS speed is unavailable
  ///
  /// In en, this message translates to:
  /// **'No GPS speed'**
  String get hudSpeedUnavailable;

  /// Accessibility label for the compass heading
  ///
  /// In en, this message translates to:
  /// **'Heading {direction} {degrees}°'**
  String hudHeading(String direction, String degrees);

  /// Rolling dashcam buffer indicator with buffered seconds
  ///
  /// In en, this message translates to:
  /// **'REC {seconds}s'**
  String hudRecBuffer(int seconds);

  /// Accessibility label for the rolling buffer indicator
  ///
  /// In en, this message translates to:
  /// **'Dashcam buffer recording, {seconds} of {target} seconds buffered'**
  String hudRecBufferLabel(int seconds, int target);

  /// Dashcam buffer not recording
  ///
  /// In en, this message translates to:
  /// **'REC off'**
  String get hudRecIdle;

  /// Dashcam buffer is saving an incident
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get hudRecSaving;

  /// Dashcam recorder failed
  ///
  /// In en, this message translates to:
  /// **'REC error'**
  String get hudRecError;

  /// AI detection is paused (no model)
  ///
  /// In en, this message translates to:
  /// **'AI paused'**
  String get hudAiPaused;

  /// Number of tracked objects in the HUD AI chip
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No objects} =1{1 object} other{{count} objects}}'**
  String hudAiObjects(int count);

  /// Accessibility label for the AI chip
  ///
  /// In en, this message translates to:
  /// **'AI model {model}, {count, plural, =0{no objects} =1{1 object} other{{count} objects}} detected'**
  String hudAiStatusLabel(String model, int count);

  /// Thermal warning chip: device is hot so AI rate is reduced
  ///
  /// In en, this message translates to:
  /// **'Hot — AI slowed'**
  String get hudThermalSerious;

  /// Thermal critical warning chip
  ///
  /// In en, this message translates to:
  /// **'Too hot — AI paused'**
  String get hudThermalCritical;

  /// Low battery warning chip
  ///
  /// In en, this message translates to:
  /// **'Battery {percent}'**
  String hudBatteryLow(String percent);

  /// iOS Low Power Mode active warning chip
  ///
  /// In en, this message translates to:
  /// **'Low Power Mode'**
  String get hudLowPower;

  /// Accessibility label for the weather chip
  ///
  /// In en, this message translates to:
  /// **'Weather {temperature}, {condition}. Tap for details.'**
  String hudWeatherLabel(String temperature, String condition);

  /// Navigation HUD style when no route is active
  ///
  /// In en, this message translates to:
  /// **'Search a destination on the Map view to see turn-by-turn guidance here.'**
  String get hudNoGuidance;

  /// Navigation: destination reached
  ///
  /// In en, this message translates to:
  /// **'You have arrived'**
  String get navArrived;

  /// Navigation: off route, calculating a new route
  ///
  /// In en, this message translates to:
  /// **'Rerouting…'**
  String get navRerouting;

  /// Map search pill placeholder
  ///
  /// In en, this message translates to:
  /// **'Search destination'**
  String get navSearchHint;

  /// Destination search text field placeholder
  ///
  /// In en, this message translates to:
  /// **'Address, place or business'**
  String get navSearchFieldHint;

  /// Destination search returned nothing
  ///
  /// In en, this message translates to:
  /// **'No matching places'**
  String get navNoResults;

  /// Destination search in progress
  ///
  /// In en, this message translates to:
  /// **'Searching…'**
  String get navSearching;

  /// Destination search empty state
  ///
  /// In en, this message translates to:
  /// **'Type an address or place name. Results come from Apple Maps and need an internet connection.'**
  String get navSearchStartTyping;

  /// Navigation service unavailable / offline
  ///
  /// In en, this message translates to:
  /// **'Search and routes are unavailable — check your internet connection.'**
  String get navErrorUnavailable;

  /// No GPS fix yet for routing
  ///
  /// In en, this message translates to:
  /// **'Waiting for your location to plan a route.'**
  String get navErrorNoLocation;

  /// Location permission denied for routing
  ///
  /// In en, this message translates to:
  /// **'Location access is off, so routes can\'t start from your position.'**
  String get navErrorPermission;

  /// Generic navigation error with code
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load routes ({code}).'**
  String navErrorGeneric(String code);

  /// Route preview card title
  ///
  /// In en, this message translates to:
  /// **'Routes to {place}'**
  String navRoutesTitle(String place);

  /// Route option chip: distance and travel time
  ///
  /// In en, this message translates to:
  /// **'{distance} · {duration}'**
  String navRouteOption(String distance, String duration);

  /// Estimated arrival time
  ///
  /// In en, this message translates to:
  /// **'Arrive {time}'**
  String navArriveAt(String time);

  /// Start turn-by-turn navigation
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get navStart;

  /// End navigation
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get navEnd;

  /// Accessibility label for the end navigation button
  ///
  /// In en, this message translates to:
  /// **'End navigation'**
  String get navEndLabel;

  /// Remaining distance and time while navigating
  ///
  /// In en, this message translates to:
  /// **'{distance} · {duration} left'**
  String navRemaining(String distance, String duration);

  /// Route advisory from Apple Maps
  ///
  /// In en, this message translates to:
  /// **'Advisory: {text}'**
  String navAdvisory(String text);

  /// Travel duration in minutes
  ///
  /// In en, this message translates to:
  /// **'{minutes, plural, =1{1 min} other{{minutes} min}}'**
  String navDurationMin(int minutes);

  /// Travel duration with hours and minutes
  ///
  /// In en, this message translates to:
  /// **'{hours} h {minutes} min'**
  String navDurationHourMin(int hours, int minutes);

  /// Accessibility label for a route alternative
  ///
  /// In en, this message translates to:
  /// **'Route {index}: {name}'**
  String navAltRouteLabel(int index, String name);

  /// Weather detail sheet title
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weatherTitle;

  /// Apparent temperature
  ///
  /// In en, this message translates to:
  /// **'Feels like {temperature}'**
  String weatherFeelsLike(String temperature);

  /// Precipitation chance label
  ///
  /// In en, this message translates to:
  /// **'Precipitation'**
  String get weatherPrecipitation;

  /// Wind speed label
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get weatherWind;

  /// Visibility label
  ///
  /// In en, this message translates to:
  /// **'Visibility'**
  String get weatherVisibility;

  /// Humidity label
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get weatherHumidity;

  /// Hourly forecast section title
  ///
  /// In en, this message translates to:
  /// **'Next hours'**
  String get weatherHourly;

  /// Weather observation time
  ///
  /// In en, this message translates to:
  /// **'Updated {time}'**
  String weatherAsOf(String time);

  /// Refresh weather button label
  ///
  /// In en, this message translates to:
  /// **'Refresh weather'**
  String get weatherRefresh;

  /// Weather could not be loaded
  ///
  /// In en, this message translates to:
  /// **'Weather is unavailable right now.'**
  String get weatherUnavailable;

  /// Weather unavailable because there is no GPS fix
  ///
  /// In en, this message translates to:
  /// **'Weather needs your location.'**
  String get weatherNoLocation;

  /// Link to the weather provider's legal attribution page (required)
  ///
  /// In en, this message translates to:
  /// **'Data sources & legal'**
  String get weatherLegal;

  /// Weather provider attribution
  ///
  /// In en, this message translates to:
  /// **'Weather data: {service}'**
  String weatherProvidedBy(String service);

  /// Hourly forecast: current hour
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get weatherNow;

  /// Virtual view empty state: nothing confirmed by the detector (no fake traffic is shown)
  ///
  /// In en, this message translates to:
  /// **'No supported objects detected'**
  String get virtualEmpty;

  /// Virtual view when the camera is not running
  ///
  /// In en, this message translates to:
  /// **'Virtual view needs the live camera.'**
  String get virtualEmptyCameraOff;

  /// Persistent caption in the virtual view
  ///
  /// In en, this message translates to:
  /// **'Lane lines are illustrative, not detected.'**
  String get virtualLaneDisclaimer;

  /// Virtual view info chip: nearest object proximity zone
  ///
  /// In en, this message translates to:
  /// **'Nearest: {zone}'**
  String virtualNearest(String zone);

  /// Accessibility label for the virtual scene
  ///
  /// In en, this message translates to:
  /// **'Virtual road scene: {summary}'**
  String virtualSceneLabel(String summary);

  /// Per-class count chip, e.g. 'Vehicle 3'
  ///
  /// In en, this message translates to:
  /// **'{label} {count}'**
  String virtualCount(String label, int count);

  /// Virtual view chip: AI status
  ///
  /// In en, this message translates to:
  /// **'AI {status}'**
  String virtualStatusAi(String status);

  /// AI status: running
  ///
  /// In en, this message translates to:
  /// **'live'**
  String get virtualStatusLive;

  /// AI status: paused or camera off
  ///
  /// In en, this message translates to:
  /// **'paused'**
  String get virtualStatusPaused;

  /// Virtual view status pill: the camera is not running, so nothing is detected
  ///
  /// In en, this message translates to:
  /// **'Camera off'**
  String get virtualStatusCameraOff;

  /// Virtual view status pill: detections come from a local test video, not the live camera
  ///
  /// In en, this message translates to:
  /// **'Test footage'**
  String get virtualStatusTestFootage;

  /// Virtual view empty state secondary line
  ///
  /// In en, this message translates to:
  /// **'Vehicles, people, bikes, lights and stop signs appear here when detected.'**
  String get virtualEmptyHint;

  /// Map button that returns to the follow-driving camera
  ///
  /// In en, this message translates to:
  /// **'Recenter'**
  String get mapRecenter;

  /// Map zoom in button
  ///
  /// In en, this message translates to:
  /// **'Zoom in'**
  String get mapZoomIn;

  /// Map zoom out button
  ///
  /// In en, this message translates to:
  /// **'Zoom out'**
  String get mapZoomOut;

  /// Shown where the native map view cannot be created (e.g. tests)
  ///
  /// In en, this message translates to:
  /// **'The interactive map is available on iPhone.'**
  String get mapUnsupported;

  /// Caption explaining detection markers on the map
  ///
  /// In en, this message translates to:
  /// **'Object markers are approximate positions.'**
  String get mapObjectsApprox;

  /// Map chip when weather could not be loaded
  ///
  /// In en, this message translates to:
  /// **'Weather unavailable'**
  String get mapWeatherUnavailable;

  /// Routing returned no routes
  ///
  /// In en, this message translates to:
  /// **'No route found to this destination.'**
  String get navErrorNoRoute;

  /// Dismiss a navigation error
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get navDismiss;

  /// Big button that starts turn-by-turn navigation on the selected route
  ///
  /// In en, this message translates to:
  /// **'Go'**
  String get navGo;

  /// Tag on the quickest route alternative
  ///
  /// In en, this message translates to:
  /// **'Fastest'**
  String get navFastest;

  /// Prefix of the small chip showing the maneuver that follows the next one
  ///
  /// In en, this message translates to:
  /// **'Then'**
  String get navThen;

  /// Header of the recent destinations list
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get navRecents;

  /// Clears the recent destinations list
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get navClearRecents;

  /// Hint under suggestions
  ///
  /// In en, this message translates to:
  /// **'Press Search to see all matching places'**
  String get navSearchSubmitHint;

  /// Header of full search results
  ///
  /// In en, this message translates to:
  /// **'Places'**
  String get navPlaces;

  /// Small caption under the ETA clock time in the trip bar
  ///
  /// In en, this message translates to:
  /// **'arrival'**
  String get navEtaLabel;

  /// Small caption under remaining time in the trip bar
  ///
  /// In en, this message translates to:
  /// **'left'**
  String get navTimeLeftLabel;

  /// Shows the whole route
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get navOverview;

  /// Turns spoken navigation guidance off
  ///
  /// In en, this message translates to:
  /// **'Mute voice'**
  String get navMute;

  /// Turns spoken navigation guidance on
  ///
  /// In en, this message translates to:
  /// **'Unmute voice'**
  String get navUnmute;

  /// Confirmation dialog title before ending guidance
  ///
  /// In en, this message translates to:
  /// **'End navigation?'**
  String get navEndConfirm;

  /// Confirmation dialog body
  ///
  /// In en, this message translates to:
  /// **'Guidance to {place} will stop.'**
  String navEndConfirmBody(String place);

  /// Arrival card title
  ///
  /// In en, this message translates to:
  /// **'You have arrived at {place}'**
  String navArrivedAt(String place);

  /// Closes the arrival card and ends navigation
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get navDone;

  /// Shown while navigating when the GPS fix is old or inaccurate
  ///
  /// In en, this message translates to:
  /// **'Weak GPS signal'**
  String get navWeakGps;

  /// Shown in search / navigation when location permission is denied
  ///
  /// In en, this message translates to:
  /// **'Location is off. Turn it on to plan routes and navigate.'**
  String get navLocationOff;

  /// Setting / toggle label for spoken turn-by-turn navigation
  ///
  /// In en, this message translates to:
  /// **'Voice guidance'**
  String get navVoiceGuidance;

  /// Spoken prompt before a maneuver. distance is spoken distance (e.g. 500 meters), instruction comes from Apple Maps
  ///
  /// In en, this message translates to:
  /// **'In {distance}, {instruction}'**
  String navSpeakIn(String distance, String instruction);

  /// Spoken prompt chaining two close maneuvers
  ///
  /// In en, this message translates to:
  /// **'{first}, then {second}'**
  String navSpeakThen(String first, String second);

  /// Spoken when a new route is computed after leaving the route
  ///
  /// In en, this message translates to:
  /// **'Rerouting'**
  String get navSpeakRerouting;

  /// Spoken at the destination
  ///
  /// In en, this message translates to:
  /// **'You have arrived'**
  String get navSpeakArrived;

  /// Spoken distance in meters
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 meter} other{{count} meters}}'**
  String navSpokenMeters(int count);

  /// Spoken distance in kilometers; count is 1 only for exactly one kilometer, value is the formatted number
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 kilometer} other{{value} kilometers}}'**
  String navSpokenKilometers(int count, String value);

  /// Spoken distance in feet
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 foot} other{{count} feet}}'**
  String navSpokenFeet(int count);

  /// Spoken distance in yards (UK)
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 yard} other{{count} yards}}'**
  String navSpokenYards(int count);

  /// Spoken right after a maneuver when the next one is far away
  ///
  /// In en, this message translates to:
  /// **'Continue for {distance}'**
  String navSpeakContinue(String distance);

  /// Apple Maps cannot provide driving directions (unsupported country/region or no road connection)
  ///
  /// In en, this message translates to:
  /// **'Directions aren\'t available for this trip in this region. Try another destination.'**
  String get navErrorNoDirections;

  /// Banner text when the next maneuver is far away
  ///
  /// In en, this message translates to:
  /// **'Continue for {distance}'**
  String navContinueFor(String distance);

  /// Spoken distance in miles; count is 1 only for exactly one mile, value is the formatted number
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 mile} other{{value} miles}}'**
  String navSpokenMiles(int count, String value);

  /// Parking view: nearest detected object and its proximity zone
  ///
  /// In en, this message translates to:
  /// **'Nearest: {object} · {zone}'**
  String parkingNearest(String object, String zone);

  /// Parking view: no object detected in the camera's field of view (does not mean the area is clear)
  ///
  /// In en, this message translates to:
  /// **'Nothing detected in view'**
  String get parkingNothing;

  /// Toggle for parking proximity tones
  ///
  /// In en, this message translates to:
  /// **'Proximity beeps'**
  String get parkingBeeps;

  /// Slider label for parking beep volume
  ///
  /// In en, this message translates to:
  /// **'Beep volume'**
  String get parkingVolume;

  /// Persistent parking limitations text
  ///
  /// In en, this message translates to:
  /// **'Single camera, not 360°. Objects outside the camera view are not detected. Not a replacement for parking sensors; estimates can be wrong and silence does not mean the area is clear.'**
  String get parkingLimitations;

  /// Accessibility label for the parking top-down scene
  ///
  /// In en, this message translates to:
  /// **'Top-down proximity view. {summary}'**
  String parkingTopDownLabel(String summary);

  /// Segmentation display mode: camera only
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get perceptionModeOriginal;

  /// Segmentation display mode: detection boxes only
  ///
  /// In en, this message translates to:
  /// **'Boxes'**
  String get perceptionModeBoxes;

  /// Segmentation display mode: per-object masks
  ///
  /// In en, this message translates to:
  /// **'Object masks'**
  String get perceptionModeMasks;

  /// Segmentation display mode: road surface mask
  ///
  /// In en, this message translates to:
  /// **'Road surface'**
  String get perceptionModeRoad;

  /// Segmentation display mode: masks, road and boxes
  ///
  /// In en, this message translates to:
  /// **'Combined'**
  String get perceptionModeCombined;

  /// Slider label for segmentation mask opacity
  ///
  /// In en, this message translates to:
  /// **'Mask opacity'**
  String get perceptionOpacity;

  /// Persistent disclaimer in the perception view
  ///
  /// In en, this message translates to:
  /// **'The road-surface mask is an approximate visual layer. It does not show drivable space or lanes.'**
  String get perceptionDisclaimer;

  /// Shown when the active AI model does not produce segmentation
  ///
  /// In en, this message translates to:
  /// **'Select the Segmentation model to see masks.'**
  String get perceptionNeedsModel;

  /// Button opening the AI models screen
  ///
  /// In en, this message translates to:
  /// **'Choose model'**
  String get perceptionChooseModel;

  /// Shown until the first mask arrives
  ///
  /// In en, this message translates to:
  /// **'Waiting for the first segmentation frame…'**
  String get perceptionWaiting;

  /// Perception mode pill, very short label: plain camera, no overlays
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get perceptionShortCamera;

  /// Perception mode pill, very short label: detection boxes only
  ///
  /// In en, this message translates to:
  /// **'Boxes'**
  String get perceptionShortBoxes;

  /// Perception mode pill, very short label: object masks
  ///
  /// In en, this message translates to:
  /// **'Objects'**
  String get perceptionShortObjects;

  /// Perception mode pill, very short label: road-surface mask
  ///
  /// In en, this message translates to:
  /// **'Road'**
  String get perceptionShortRoad;

  /// Perception mode pill, very short label: boxes + object masks + road
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get perceptionShortAll;

  /// Accessibility label of the perception mode pill
  ///
  /// In en, this message translates to:
  /// **'Perception layers'**
  String get perceptionModesLabel;

  /// Status chip until the first segmentation map arrives
  ///
  /// In en, this message translates to:
  /// **'Warming up…'**
  String get perceptionStatusWarmingUp;

  /// Status chip while the segmentation model loads
  ///
  /// In en, this message translates to:
  /// **'Loading model…'**
  String get perceptionStatusLoadingModel;

  /// Status chip: segmentation maps per second
  ///
  /// In en, this message translates to:
  /// **'{fps} fps'**
  String perceptionStatusLive(String fps);

  /// Status chip when no segmentation map arrived for a few seconds
  ///
  /// In en, this message translates to:
  /// **'Masks paused'**
  String get perceptionStatusPaused;

  /// Accessibility label of the colour legend chip (tap to expand/collapse)
  ///
  /// In en, this message translates to:
  /// **'Mask legend'**
  String get perceptionLegend;

  /// Title of the perception empty state when no segmentation model is active
  ///
  /// In en, this message translates to:
  /// **'Masks unavailable'**
  String get perceptionUnavailable;

  /// Save Incident button short label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get driveSave;

  /// Accessibility label for the Save Incident button
  ///
  /// In en, this message translates to:
  /// **'Save incident'**
  String get driveSaveIncident;

  /// Accessibility hint for Save Incident
  ///
  /// In en, this message translates to:
  /// **'Saves the last {seconds} seconds of dashcam footage'**
  String driveSaveHint(int seconds);

  /// Save Incident in progress
  ///
  /// In en, this message translates to:
  /// **'Saving incident…'**
  String get driveSaving;

  /// VoiceOver label of the HUD REC chip during manual recording
  ///
  /// In en, this message translates to:
  /// **'Recording, {time}'**
  String hudRecManualLabel(String time);

  /// Label of the manual (continuous) recording toggle when idle
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get driveRecord;

  /// VoiceOver label of the Record toggle when idle
  ///
  /// In en, this message translates to:
  /// **'Start recording'**
  String get driveRecordStartA11y;

  /// VoiceOver label of the Record toggle while recording
  ///
  /// In en, this message translates to:
  /// **'Stop recording, {time} recorded'**
  String driveRecordStopA11y(String time);

  /// VoiceOver hint of the Record toggle
  ///
  /// In en, this message translates to:
  /// **'Records continuously until you stop it, including the last 5 seconds'**
  String get driveRecordHint;

  /// Snackbar when manual recording cannot start
  ///
  /// In en, this message translates to:
  /// **'Couldn’t start recording'**
  String get driveRecordFailed;

  /// Snackbar after the user stops a manual recording
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Recording saved} other{Recording saved · {count} parts}}'**
  String driveRecordSaved(int count);

  /// Snackbar when manual recording stops automatically; recordings so far are saved
  ///
  /// In en, this message translates to:
  /// **'{reason, select, storage{Recording stopped: storage almost full} max_duration{Recording stopped: maximum length reached} camera_stopped{Recording stopped with the camera} background{Recording stopped: the app went to the background} thermal{Recording stopped: the phone is too hot} other{Recording stopped}}'**
  String driveRecordStopped(String reason);

  /// Snackbar after a successful incident save
  ///
  /// In en, this message translates to:
  /// **'Incident saved · {duration} · {resolution}'**
  String driveSaved(String duration, String resolution);

  /// Snackbar action opening the saved clip
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get driveSavedView;

  /// Generic incident save failure
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save the incident.'**
  String get driveSaveFailed;

  /// Incident save failed because the recorder isn't running
  ///
  /// In en, this message translates to:
  /// **'Recording hasn\'t started yet — wait for the camera to start, then try again.'**
  String get driveSaveNotRunning;

  /// Shown when Save is tapped while TEST FOOTAGE (a video file) is playing instead of the camera
  ///
  /// In en, this message translates to:
  /// **'Test footage isn\'t recorded. Incident saving works with the live camera.'**
  String get driveSaveTestFootage;

  /// Incident save failed: storage full
  ///
  /// In en, this message translates to:
  /// **'Your iPhone is out of storage. Free up space or delete older clips.'**
  String get driveSaveStorageFull;

  /// Incident save failed: I/O error
  ///
  /// In en, this message translates to:
  /// **'The clip couldn\'t be written to storage.'**
  String get driveSaveIoError;

  /// Button opening the clips gallery
  ///
  /// In en, this message translates to:
  /// **'Clips'**
  String get driveClips;

  /// Button opening settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get driveSettings;

  /// Accessibility label for the bottom view switcher
  ///
  /// In en, this message translates to:
  /// **'Drive views'**
  String get driveViewSwitcher;

  /// Banner when location permission is denied
  ///
  /// In en, this message translates to:
  /// **'Location is off — speed, maps and routes are unavailable.'**
  String get driveLocationDenied;

  /// Banner when camera permission is denied (shown on non-camera views)
  ///
  /// In en, this message translates to:
  /// **'Camera access is off — detection and recording are unavailable.'**
  String get driveCameraDenied;

  /// Banner when audio recording fell back because mic permission is missing
  ///
  /// In en, this message translates to:
  /// **'Recording without audio: microphone access is off.'**
  String get driveRecorderFallback;

  /// Banner when the native recorder adjusted the configuration
  ///
  /// In en, this message translates to:
  /// **'Recording settings were adjusted: {reason}'**
  String driveRecorderFallbackGeneric(String reason);

  /// Power notice: thermal serious
  ///
  /// In en, this message translates to:
  /// **'Your iPhone is hot. AI runs slower to cool down — keep it out of direct sun and near a vent.'**
  String get drivePowerThermalSerious;

  /// Power notice: thermal critical
  ///
  /// In en, this message translates to:
  /// **'Your iPhone is too hot. AI detection is paused until it cools down; recording continues if possible.'**
  String get drivePowerThermalCritical;

  /// Power notice: low power mode
  ///
  /// In en, this message translates to:
  /// **'Low Power Mode is on — AI runs at a reduced rate.'**
  String get drivePowerLowPower;

  /// Power notice: battery low
  ///
  /// In en, this message translates to:
  /// **'Battery is low — connect your iPhone to power while driving.'**
  String get drivePowerBatteryLow;

  /// Onboarding page 1 headline
  ///
  /// In en, this message translates to:
  /// **'See more of every drive.'**
  String get onboardingTitle1;

  /// Onboarding page 1 subtitle
  ///
  /// In en, this message translates to:
  /// **'Turn your iPhone into an intelligent dashcam and driving-awareness companion.'**
  String get onboardingBody1;

  /// Onboarding page 2 headline
  ///
  /// In en, this message translates to:
  /// **'Intelligence in every frame.'**
  String get onboardingTitle2;

  /// Onboarding page 2 subtitle
  ///
  /// In en, this message translates to:
  /// **'Recognize supported vehicles, people, bicycles, and road signals directly on your iPhone.'**
  String get onboardingBody2;

  /// Onboarding page 3 headline
  ///
  /// In en, this message translates to:
  /// **'One road. Multiple perspectives.'**
  String get onboardingTitle3;

  /// Onboarding page 3 subtitle
  ///
  /// In en, this message translates to:
  /// **'Switch between live detection, virtual driving views, interactive maps, and parking visualization.'**
  String get onboardingBody3;

  /// Onboarding page 4 headline
  ///
  /// In en, this message translates to:
  /// **'Keep the moments that matter.'**
  String get onboardingTitle4;

  /// Onboarding page 4 subtitle
  ///
  /// In en, this message translates to:
  /// **'Save recent dashcam footage, review incidents, and share recordings.'**
  String get onboardingBody4;

  /// Onboarding page 5 headline
  ///
  /// In en, this message translates to:
  /// **'Safety & privacy'**
  String get onboardingTitle5;

  /// Safety bullet: awareness aid
  ///
  /// In en, this message translates to:
  /// **'Corvista is a driving-awareness aid. Keep your eyes on the road.'**
  String get onboardingSafety1;

  /// Safety bullet: no vehicle control
  ///
  /// In en, this message translates to:
  /// **'It does not control your vehicle or replace your judgment.'**
  String get onboardingSafety2;

  /// Safety bullet: may be inaccurate
  ///
  /// In en, this message translates to:
  /// **'Detections and estimates may be inaccurate or missed.'**
  String get onboardingSafety3;

  /// Safety bullet: on-device processing
  ///
  /// In en, this message translates to:
  /// **'Camera processing happens on your iPhone — video isn\'t uploaded.'**
  String get onboardingSafety4;

  /// Safety bullet: network services
  ///
  /// In en, this message translates to:
  /// **'Maps, search, routes and weather need an internet connection.'**
  String get onboardingSafety5;

  /// Safety bullet: secure mount
  ///
  /// In en, this message translates to:
  /// **'Mount your iPhone securely so it doesn\'t block your view.'**
  String get onboardingSafety6;

  /// Safety bullet: setup before driving
  ///
  /// In en, this message translates to:
  /// **'Complete setup before you start driving.'**
  String get onboardingSafety7;

  /// Acknowledgement checkbox on the safety page
  ///
  /// In en, this message translates to:
  /// **'I understand Corvista is an awareness aid and I remain responsible for driving safely.'**
  String get onboardingAcknowledge;

  /// Link to the safety information screen
  ///
  /// In en, this message translates to:
  /// **'Read full safety information'**
  String get onboardingReadSafety;

  /// Onboarding next page button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// Onboarding skip to the safety page
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// Onboarding final button (requires acknowledgement)
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingAgree;

  /// Accessibility label for onboarding page indicator
  ///
  /// In en, this message translates to:
  /// **'Page {current} of {total}'**
  String onboardingPageLabel(int current, int total);

  /// Permissions screen title
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permTitle;

  /// Permissions screen intro
  ///
  /// In en, this message translates to:
  /// **'Corvista asks only for what each feature needs. You can change these any time in Settings.'**
  String get permIntro;

  /// Camera permission title
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get permCameraTitle;

  /// Camera permission explanation
  ///
  /// In en, this message translates to:
  /// **'Required for detection, dashcam recording and the parking view. Video is processed on your iPhone.'**
  String get permCameraBody;

  /// Location permission title
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get permLocationTitle;

  /// Location permission explanation
  ///
  /// In en, this message translates to:
  /// **'Used for GPS speed, the map, routes, weather and tagging saved clips. Only while you use the app.'**
  String get permLocationBody;

  /// Microphone permission title
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get permMicTitle;

  /// Note that speech permission is requested later, in context
  ///
  /// In en, this message translates to:
  /// **'Speech recognition is only requested if you turn on voice cancellation for emergency alerts.'**
  String get permSpeechNote;

  /// Badge for a required permission
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get permRequired;

  /// Badge for an optional permission
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get permOptional;

  /// Button that triggers the iOS permission prompt
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get permAllow;

  /// Permission granted state
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get permGranted;

  /// Permission denied state
  ///
  /// In en, this message translates to:
  /// **'Denied'**
  String get permDenied;

  /// Permission limited state
  ///
  /// In en, this message translates to:
  /// **'Limited'**
  String get permLimited;

  /// Permission restricted by device management or parental controls
  ///
  /// In en, this message translates to:
  /// **'Restricted'**
  String get permRestricted;

  /// Finish onboarding and open the drive screen
  ///
  /// In en, this message translates to:
  /// **'Start driving'**
  String get permStart;

  /// Hint shown when camera is denied on the permissions screen
  ///
  /// In en, this message translates to:
  /// **'You can continue without camera access, but detection and recording won\'t work until you allow it in Settings.'**
  String get permCameraNeeded;

  /// First-run permissions screen intro
  ///
  /// In en, this message translates to:
  /// **'Corvista needs these to work fully. Tap Allow all and iOS will ask for each one in turn. You can change them any time in Settings.'**
  String get permSetupIntro;

  /// One-line camera permission explanation
  ///
  /// In en, this message translates to:
  /// **'Required for detection, dashcam recording and the parking view. Video is processed on your iPhone, never uploaded.'**
  String get permCameraLine;

  /// One-line location (when in use) permission explanation
  ///
  /// In en, this message translates to:
  /// **'GPS speed, the map, routes, weather and where clips were saved. Only while you use the app.'**
  String get permLocationLine;

  /// One-line microphone permission explanation
  ///
  /// In en, this message translates to:
  /// **'Cabin audio in incident clips, and hearing your cancel phrase during an emergency alert.'**
  String get permMicLine;

  /// Speech recognition permission title
  ///
  /// In en, this message translates to:
  /// **'Speech recognition'**
  String get permSpeechTitle;

  /// One-line speech recognition permission explanation
  ///
  /// In en, this message translates to:
  /// **'Recognizes your cancel phrase during an emergency countdown, on your iPhone where supported.'**
  String get permSpeechLine;

  /// Primary button that shows the iOS permission prompts one after another
  ///
  /// In en, this message translates to:
  /// **'Allow all'**
  String get permAllowAll;

  /// Progress while one iOS permission prompt is shown
  ///
  /// In en, this message translates to:
  /// **'Asking for {permission}…'**
  String permAsking(String permission);

  /// Hint when one or more permissions were denied
  ///
  /// In en, this message translates to:
  /// **'Some permissions are off. Turn them on in Settings to use those features.'**
  String get permSomeDenied;

  /// Secondary button to continue without granting the remaining permissions
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get permNotNow;

  /// Accessibility label for the coach-mark tour overlay
  ///
  /// In en, this message translates to:
  /// **'Drive screen tour'**
  String get tourLabel;

  /// Tour progress for screen readers
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String tourProgress(int current, int total);

  /// Tour next step button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get tourNext;

  /// Tour previous step button
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get tourBack;

  /// Tour skip button
  ///
  /// In en, this message translates to:
  /// **'Skip tour'**
  String get tourSkip;

  /// Tour last-step button
  ///
  /// In en, this message translates to:
  /// **'Start driving'**
  String get tourFinish;

  /// Tour step 1 title
  ///
  /// In en, this message translates to:
  /// **'Your quick tour'**
  String get tourWelcomeTitle;

  /// Tour step 1 body
  ///
  /// In en, this message translates to:
  /// **'A one-minute look at what matters on the Drive screen. Best done while parked.'**
  String get tourWelcomeBody;

  /// Tour step: HUD title
  ///
  /// In en, this message translates to:
  /// **'Your instrument strip'**
  String get tourHudTitle;

  /// Tour step: HUD speed line
  ///
  /// In en, this message translates to:
  /// **'Speed comes from GPS.'**
  String get tourHudSpeed;

  /// Tour step: HUD REC/buffer line
  ///
  /// In en, this message translates to:
  /// **'REC shows how many seconds of footage are buffered.'**
  String get tourHudRec;

  /// Tour step: HUD AI status line
  ///
  /// In en, this message translates to:
  /// **'The AI chip shows the model, how many objects it sees, and a dot: green running, amber limited, red stopped.'**
  String get tourHudAi;

  /// Tour step: Save Incident title
  ///
  /// In en, this message translates to:
  /// **'Save Incident'**
  String get tourSaveTitle;

  /// Tour step: Save Incident explanation
  ///
  /// In en, this message translates to:
  /// **'Corvista keeps a rolling buffer of the last {seconds} seconds of video. It is constantly overwritten, so nothing is kept unless you tap Save. Saved clips stay on this iPhone, in Clips.'**
  String tourSaveBody(int seconds);

  /// Guided tour step title for the manual Record button
  ///
  /// In en, this message translates to:
  /// **'Record the whole drive'**
  String get tourRecordTitle;

  /// Guided tour step explaining manual continuous recording
  ///
  /// In en, this message translates to:
  /// **'Tap Record to film continuously until you stop. Long drives are saved in 5-minute parts in Clips, and Save Incident keeps working while you record.'**
  String get tourRecordBody;

  /// Tour step: view switcher title
  ///
  /// In en, this message translates to:
  /// **'Five ways to see the road'**
  String get tourViewsTitle;

  /// Tour: one-line Detection view description
  ///
  /// In en, this message translates to:
  /// **'Live camera with boxes around supported objects.'**
  String get tourViewDetection;

  /// Tour: one-line Virtual view description
  ///
  /// In en, this message translates to:
  /// **'A simplified 3D scene built from detections.'**
  String get tourViewVirtual;

  /// Tour: one-line Map view description
  ///
  /// In en, this message translates to:
  /// **'Apple Maps with search and turn-by-turn guidance.'**
  String get tourViewMap;

  /// Tour: one-line Parking view description
  ///
  /// In en, this message translates to:
  /// **'Camera plus a top-down proximity view.'**
  String get tourViewParking;

  /// Tour: one-line Perception view description
  ///
  /// In en, this message translates to:
  /// **'Road and object masks.'**
  String get tourViewPerception;

  /// Tour step: map navigation title
  ///
  /// In en, this message translates to:
  /// **'Search & turn-by-turn'**
  String get tourMapTitle;

  /// Tour step: map navigation body
  ///
  /// In en, this message translates to:
  /// **'Open Map, tap the search bar and pick a destination. Choose a route, then tap Start for turn-by-turn guidance. Needs an internet connection.'**
  String get tourMapBody;

  /// Tour step: clips title
  ///
  /// In en, this message translates to:
  /// **'Clips'**
  String get tourClipsTitle;

  /// Tour step: clips body
  ///
  /// In en, this message translates to:
  /// **'Review, rename, share or delete saved incidents. Clips stay on your iPhone unless you share them.'**
  String get tourClipsBody;

  /// Tour step: settings title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tourSettingsTitle;

  /// Tour step: settings body
  ///
  /// In en, this message translates to:
  /// **'Tune voice alerts and their sensitivity, recording quality and buffer length, and set up Emergency mode: an experimental impact alert with a cancel countdown.'**
  String get tourSettingsBody;

  /// Tour last step: safety reminders title
  ///
  /// In en, this message translates to:
  /// **'Before you drive'**
  String get tourSafetyTitle;

  /// Tour safety reminder: mounting
  ///
  /// In en, this message translates to:
  /// **'Mount your iPhone securely where it doesn\'t block your view.'**
  String get tourSafety1;

  /// Tour safety reminder: no interaction while driving
  ///
  /// In en, this message translates to:
  /// **'Don\'t interact with the app while driving. Set things up while parked.'**
  String get tourSafety2;

  /// Tour safety reminder: estimates
  ///
  /// In en, this message translates to:
  /// **'Detections and zones are estimates. They can be wrong or missed.'**
  String get tourSafety3;

  /// Tour safety reminder: responsibility
  ///
  /// In en, this message translates to:
  /// **'You stay responsible for driving safely.'**
  String get tourSafety4;

  /// Help screen entry that replays the Drive screen tour
  ///
  /// In en, this message translates to:
  /// **'Take the tour'**
  String get helpTakeTour;

  /// Subtitle of the Take the tour entry
  ///
  /// In en, this message translates to:
  /// **'A one-minute guided look at the Drive screen.'**
  String get helpTakeTourSub;

  /// Title of the trip log screen
  ///
  /// In en, this message translates to:
  /// **'Trips'**
  String get tripsTitle;

  /// Tooltip/label of the button that opens the trip log
  ///
  /// In en, this message translates to:
  /// **'Trip log'**
  String get tripsOpen;

  /// Trip log empty state title
  ///
  /// In en, this message translates to:
  /// **'No trips yet'**
  String get tripsEmptyTitle;

  /// Trip log empty state body
  ///
  /// In en, this message translates to:
  /// **'Trips are recorded automatically while you drive with Corvista — distance, time, speed and the route you took.'**
  String get tripsEmptyBody;

  /// Empty state when trip logging is disabled
  ///
  /// In en, this message translates to:
  /// **'Trip log is off, so new drives aren\'t recorded. Turn it on to keep a private log of your routes on this iPhone.'**
  String get tripsDisabledBody;

  /// Button enabling the trip log
  ///
  /// In en, this message translates to:
  /// **'Turn on trip log'**
  String get tripsEnable;

  /// Day group header for today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get tripsToday;

  /// Day group header for yesterday
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get tripsYesterday;

  /// Banner while a trip is being recorded
  ///
  /// In en, this message translates to:
  /// **'Recording a trip · {distance}'**
  String tripsRecordingNow(String distance);

  /// Trip start–end time range
  ///
  /// In en, this message translates to:
  /// **'{start} – {end}'**
  String tripsTimeRange(String start, String end);

  /// Trip start → end place names
  ///
  /// In en, this message translates to:
  /// **'{start} → {end}'**
  String tripsPlaceRange(String start, String end);

  /// Number of incident clips saved during a trip
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 incident} other{{count} incidents}}'**
  String tripsIncidents(int count);

  /// Number of voice alerts during a trip
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 alert} other{{count} alerts}}'**
  String tripsAlerts(int count);

  /// Number of recorded trips
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No trips} =1{1 trip} other{{count} trips}}'**
  String tripsCount(int count);

  /// Stat card label
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get tripsStatDistance;

  /// Stat card label
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get tripsStatDuration;

  /// Stat card label
  ///
  /// In en, this message translates to:
  /// **'Moving time'**
  String get tripsStatMoving;

  /// Stat card label (average speed while moving)
  ///
  /// In en, this message translates to:
  /// **'Avg speed'**
  String get tripsStatAvgSpeed;

  /// Stat card label
  ///
  /// In en, this message translates to:
  /// **'Max speed'**
  String get tripsStatMaxSpeed;

  /// Section title: objects detected per class
  ///
  /// In en, this message translates to:
  /// **'Detections'**
  String get tripsDetections;

  /// Shown when no detections
  ///
  /// In en, this message translates to:
  /// **'No road objects were logged on this trip.'**
  String get tripsNoDetections;

  /// Section title: trip events
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get tripsTimeline;

  /// Timeline entry
  ///
  /// In en, this message translates to:
  /// **'Trip started'**
  String get tripsEventStart;

  /// Timeline entry
  ///
  /// In en, this message translates to:
  /// **'Trip ended'**
  String get tripsEventEnd;

  /// Timeline entry for a spoken alert
  ///
  /// In en, this message translates to:
  /// **'Voice alert'**
  String get tripsEventAlert;

  /// Timeline entry; tap opens the clip
  ///
  /// In en, this message translates to:
  /// **'Incident clip saved'**
  String get tripsEventIncident;

  /// Timeline entry for an emergency event
  ///
  /// In en, this message translates to:
  /// **'Possible crash detected'**
  String get tripsEventEmergency;

  /// Timeline entry
  ///
  /// In en, this message translates to:
  /// **'Navigation started'**
  String get tripsEventNavStart;

  /// Timeline entry
  ///
  /// In en, this message translates to:
  /// **'Arrived at destination'**
  String get tripsEventArrive;

  /// Timeline entry
  ///
  /// In en, this message translates to:
  /// **'Route recalculated'**
  String get tripsEventReroute;

  /// Timeline entry for a manual recording part
  ///
  /// In en, this message translates to:
  /// **'Recording saved'**
  String get tripsEventRecording;

  /// Accessibility hint for incident timeline entries
  ///
  /// In en, this message translates to:
  /// **'Open clip'**
  String get tripsOpenClip;

  /// Label of the track-only preview when no map is available
  ///
  /// In en, this message translates to:
  /// **'GPS track'**
  String get tripsTrackPreview;

  /// Rename dialog title
  ///
  /// In en, this message translates to:
  /// **'Rename trip'**
  String get tripsRenameTitle;

  /// Rename text field hint
  ///
  /// In en, this message translates to:
  /// **'Trip name'**
  String get tripsRenameHint;

  /// Menu action
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get tripsFavorite;

  /// Menu action
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get tripsUnfavorite;

  /// Menu action: export the track as a GPX file
  ///
  /// In en, this message translates to:
  /// **'Share GPX'**
  String get tripsShareGpx;

  /// Error when sharing fails
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t share this trip.'**
  String get tripsShareFailed;

  /// Menu action
  ///
  /// In en, this message translates to:
  /// **'Delete trip'**
  String get tripsDelete;

  /// Delete confirmation title
  ///
  /// In en, this message translates to:
  /// **'Delete this trip?'**
  String get tripsDeleteConfirmTitle;

  /// Delete confirmation body
  ///
  /// In en, this message translates to:
  /// **'The route and statistics will be removed from this iPhone. Incident clips from this trip are kept.'**
  String get tripsDeleteConfirmBody;

  /// Snackbar after deletion
  ///
  /// In en, this message translates to:
  /// **'Trip deleted'**
  String get tripsDeleted;

  /// Trip detail when the trip was deleted
  ///
  /// In en, this message translates to:
  /// **'This trip is no longer available.'**
  String get tripsNotFound;

  /// Footer note on the trip detail
  ///
  /// In en, this message translates to:
  /// **'Stored only on this iPhone. Nothing is uploaded.'**
  String get tripsPrivacyNote;

  /// Settings section title
  ///
  /// In en, this message translates to:
  /// **'Trip log'**
  String get settingsSectionTrips;

  /// Settings switch
  ///
  /// In en, this message translates to:
  /// **'Record trips'**
  String get settingsTripLog;

  /// Settings switch subtitle
  ///
  /// In en, this message translates to:
  /// **'Keeps your route and drive statistics on this iPhone only.'**
  String get settingsTripLogSubtitle;

  /// Settings choice: retention period
  ///
  /// In en, this message translates to:
  /// **'Keep trips for'**
  String get settingsTripRetention;

  /// Retention option
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1{1 day} other{{days} days}}'**
  String settingsRetentionDays(int days);

  /// Retention option
  ///
  /// In en, this message translates to:
  /// **'1 year'**
  String get settingsRetentionYear;

  /// Retention option
  ///
  /// In en, this message translates to:
  /// **'Forever'**
  String get settingsRetentionForever;

  /// Footer under trip settings
  ///
  /// In en, this message translates to:
  /// **'Older trips are deleted automatically when Corvista starts.'**
  String get settingsTripRetentionFooter;

  /// Settings row opening the trip log
  ///
  /// In en, this message translates to:
  /// **'View trips'**
  String get settingsViewTrips;

  /// Trip duration with hours
  ///
  /// In en, this message translates to:
  /// **'{hours} h {minutes} min'**
  String tripsDurationHM(int hours, int minutes);

  /// Trip duration under an hour
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String tripsDurationM(int minutes);

  /// Name embedded in exported GPX files
  ///
  /// In en, this message translates to:
  /// **'Corvista trip {date}'**
  String tripsGpxName(String date);

  /// Settings action that deletes temporary files and caches
  ///
  /// In en, this message translates to:
  /// **'Free up space'**
  String get settingsFreeUpSpace;

  /// Explains what Free up space deletes
  ///
  /// In en, this message translates to:
  /// **'Removes temporary files and caches. Saved clips and trips are kept.'**
  String get settingsFreeUpSpaceSubtitle;

  /// Result after cleanup
  ///
  /// In en, this message translates to:
  /// **'Freed {size}'**
  String settingsFreedBytes(String size);

  /// Result when nothing besides caches was removed
  ///
  /// In en, this message translates to:
  /// **'Caches cleared — no temporary files to remove.'**
  String get settingsNothingToFree;

  /// Settings section title for privacy controls and deleting user data
  ///
  /// In en, this message translates to:
  /// **'Privacy & data'**
  String get settingsSectionPrivacyData;

  /// Footer under the Privacy & data settings section
  ///
  /// In en, this message translates to:
  /// **'Clips, trips and settings are stored only on this iPhone. They leave it only when you choose to share them.'**
  String get settingsPrivacyDataFooter;

  /// Settings action that erases everything Corvista has stored on the device
  ///
  /// In en, this message translates to:
  /// **'Delete all data'**
  String get settingsDeleteAllData;

  /// Subtitle of the Delete all data action
  ///
  /// In en, this message translates to:
  /// **'Erase clips, trips, contacts and settings from this iPhone'**
  String get settingsDeleteAllDataSubtitle;

  /// Title of the confirmation dialog for Delete all data
  ///
  /// In en, this message translates to:
  /// **'Delete all data?'**
  String get deleteAllTitle;

  /// Body of the Delete all data confirmation dialog. Keep the bullet list (one item per line) and the warning that it cannot be undone
  ///
  /// In en, this message translates to:
  /// **'This permanently removes from this iPhone:\n• Incident clips and thumbnails\n• Trip log and GPS tracks\n• Emergency contacts and emergency events\n• Detection logs and the diagnostic log\n• Settings and recent destinations\n• Temporary recording buffer and cache\n\nThis cannot be undone. Corvista will then start again from the welcome screens.'**
  String get deleteAllMessage;

  /// Destructive confirm button of the Delete all data dialog
  ///
  /// In en, this message translates to:
  /// **'Delete everything'**
  String get deleteAllConfirm;

  /// Shown while all data is being deleted
  ///
  /// In en, this message translates to:
  /// **'Deleting…'**
  String get deleteAllInProgress;

  /// Snackbar after Delete all data succeeded
  ///
  /// In en, this message translates to:
  /// **'All data deleted'**
  String get deleteAllDone;

  /// Snackbar when Delete all data could not remove everything
  ///
  /// In en, this message translates to:
  /// **'Some items could not be deleted. Try again from Settings.'**
  String get deleteAllPartial;

  /// Diagnostics section title for the private on-device error log
  ///
  /// In en, this message translates to:
  /// **'Diagnostic log'**
  String get diagLogSection;

  /// Footer explaining the private error log
  ///
  /// In en, this message translates to:
  /// **'Errors are recorded only on this iPhone, without locations, contact names or phone numbers. Nothing is sent unless you share the log yourself.'**
  String get diagLogFooter;

  /// Action that opens the share sheet with the error log file
  ///
  /// In en, this message translates to:
  /// **'Share diagnostic log'**
  String get diagLogShare;

  /// Value shown when the diagnostic log has no entries
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get diagLogEmpty;

  /// Action that deletes the diagnostic log
  ///
  /// In en, this message translates to:
  /// **'Clear log'**
  String get diagLogClear;

  /// Title of the confirmation dialog for clearing the diagnostic log
  ///
  /// In en, this message translates to:
  /// **'Clear diagnostic log?'**
  String get diagLogClearTitle;

  /// Body of the confirmation dialog for clearing the diagnostic log
  ///
  /// In en, this message translates to:
  /// **'Saved error entries will be deleted from this iPhone.'**
  String get diagLogClearBody;

  /// Snackbar after the diagnostic log was cleared
  ///
  /// In en, this message translates to:
  /// **'Diagnostic log cleared'**
  String get diagLogCleared;

  /// Snackbar when the share sheet could not be opened
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t share the diagnostic log.'**
  String get diagLogShareFailed;

  /// Paragraph in the in-app privacy policy about Delete all data
  ///
  /// In en, this message translates to:
  /// **'Settings › Privacy & data › Delete all data erases every clip, trip, contact, log and setting Corvista has stored on this iPhone.'**
  String get privacyControls2;

  /// Parking view headline when an object is estimated to be touching-close (under about 0.6 m). Short, imperative.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get parkingZoneStop;

  /// Parking view zone: object estimated very close to the vehicle front
  ///
  /// In en, this message translates to:
  /// **'Very close'**
  String get parkingZoneVeryClose;

  /// Parking view zone: object estimated close (a few metres)
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get parkingZoneClose;

  /// Parking view headline when no supported object is estimated close. Must NOT claim the area is clear.
  ///
  /// In en, this message translates to:
  /// **'Nothing close seen'**
  String get parkingZoneNothingClose;

  /// Reminder under 'Nothing close seen' in the parking view: these obstacles are never detected
  ///
  /// In en, this message translates to:
  /// **'Walls, pillars, poles and kerbs are not detected'**
  String get parkingNotDetected;

  /// Small tag next to a parking zone: the zone is a rough estimate
  ///
  /// In en, this message translates to:
  /// **'approx.'**
  String get parkingApprox;

  /// Parking view sector: left of the vehicle's path
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get parkingSideLeft;

  /// Parking view sector: straight ahead in the vehicle's path
  ///
  /// In en, this message translates to:
  /// **'Center'**
  String get parkingSideCenter;

  /// Parking view sector: right of the vehicle's path
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get parkingSideRight;

  /// Nearest object in the parking view and the sector it is in, e.g. 'Car · Left'
  ///
  /// In en, this message translates to:
  /// **'{object} · {side}'**
  String parkingObjectSide(String object, String side);

  /// Always-visible disclaimer on the parking view
  ///
  /// In en, this message translates to:
  /// **'Front camera view only — not a 360° system'**
  String get parkingFrontOnly;

  /// Button that silences the parking proximity beeps
  ///
  /// In en, this message translates to:
  /// **'Mute beeps'**
  String get parkingMuteBeeps;

  /// Button that turns the parking proximity beeps back on
  ///
  /// In en, this message translates to:
  /// **'Turn beeps on'**
  String get parkingUnmuteBeeps;

  /// Button / dialog title explaining what the parking view can and cannot detect
  ///
  /// In en, this message translates to:
  /// **'About parking view'**
  String get parkingAbout;

  /// Full explanation of the parking view's limitations, shown in the About dialog
  ///
  /// In en, this message translates to:
  /// **'Only the area in front of the camera is watched. The detector recognises cars, buses and trucks, people, bicycles and motorcycles. Walls, pillars, poles, kerbs, bollards, barriers and low obstacles are NOT detected, and the bonnet can hide the ground just ahead. Distances are rough guesses from one camera (object size and position) and can be wrong by a lot. Silence or “Nothing close seen” does not mean the way is clear — always look around and use your mirrors.'**
  String get parkingLimitationsDetail;

  /// Screen-reader label for the parking sector display
  ///
  /// In en, this message translates to:
  /// **'Proximity by side: left {left}, center {center}, right {right}'**
  String parkingSectorsLabel(String left, String center, String right);

  /// Paragraph in the in-app privacy policy about the local diagnostic log
  ///
  /// In en, this message translates to:
  /// **'Errors are written to a private log on this iPhone (no locations, contact names or phone numbers). It is never sent automatically; you can share or clear it in Settings › Diagnostics.'**
  String get privacyDiagnostics1;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bg',
    'bn',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fa',
    'fi',
    'fr',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'lt',
    'ms',
    'nb',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sv',
    'ta',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en':
      {
        switch (locale.countryCode) {
          case 'GB':
            return AppLocalizationsEnGb();
        }
        break;
      }
    case 'es':
      {
        switch (locale.countryCode) {
          case '419':
            return AppLocalizationsEs419();
        }
        break;
      }
    case 'fr':
      {
        switch (locale.countryCode) {
          case 'CA':
            return AppLocalizationsFrCa();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'lt':
      return AppLocalizationsLt();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sv':
      return AppLocalizationsSv();
    case 'ta':
      return AppLocalizationsTa();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
