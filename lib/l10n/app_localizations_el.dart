// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Δείτε περισσότερα σε κάθε διαδρομή.';

  @override
  String get commonCancel => 'Ακύρωση';

  @override
  String get commonDelete => 'Διαγραφή';

  @override
  String get commonSave => 'Αποθήκευση';

  @override
  String get commonBack => 'Πίσω';

  @override
  String get commonClose => 'Κλείσιμο';

  @override
  String get commonRetry => 'Δοκιμάστε ξανά';

  @override
  String get commonOpenSettings => 'Άνοιγμα Ρυθμίσεων';

  @override
  String get commonLoading => 'Φόρτωση…';

  @override
  String get commonError => 'Παρουσιάστηκε κάποιο σφάλμα.';

  @override
  String commonErrorDetail(String message) {
    return 'Παρουσιάστηκε κάποιο σφάλμα: $message';
  }

  @override
  String get commonOn => 'Ενεργό';

  @override
  String get commonOff => 'Ανενεργό';

  @override
  String get commonRename => 'Μετονομασία';

  @override
  String get commonShare => 'Κοινοποίηση';

  @override
  String get commonNotAvailable => 'Μη διαθέσιμο';

  @override
  String get commonTestFootage => 'ΒΙΝΤΕΟ ΔΟΚΙΜΗΣ';

  @override
  String get zoneVeryClose => 'Πολύ κοντά';

  @override
  String get zoneClose => 'Κοντά';

  @override
  String get zoneMedium => 'Μεσαία';

  @override
  String get zoneFar => 'Μακριά';

  @override
  String get zoneUnknown => 'Άγνωστη';

  @override
  String get classPerson => 'Άτομο';

  @override
  String get classBicycle => 'Ποδήλατο';

  @override
  String get classMotorcycle => 'Μοτοσικλέτα';

  @override
  String get classCar => 'Όχημα';

  @override
  String get classBus => 'Λεωφορείο';

  @override
  String get classTrafficLight => 'Φανάρι';

  @override
  String get classStopSign => 'Πινακίδα Stop';

  @override
  String get viewDetection => 'Ανίχνευση';

  @override
  String get viewVirtual => 'Εικονική';

  @override
  String get viewMap => 'Χάρτης';

  @override
  String get viewParking => 'Στάθμευση';

  @override
  String get viewPerception => 'Αντίληψη';

  @override
  String get unitKmh => 'χλμ./ώρα';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Κόκκινο';

  @override
  String get lightYellow => 'Κίτρινο';

  @override
  String get lightGreen => 'Πράσινο';

  @override
  String get lightUnknown => 'Άγνωστο';

  @override
  String get clipsTitle => 'Κλιπ';

  @override
  String get clipsSelect => 'Επιλογή';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count επιλεγμένα',
      one: '1 επιλεγμένο',
      zero: 'Επιλογή κλιπ',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Επιλογή όλων';

  @override
  String get clipsDeselectAll => 'Αποεπιλογή όλων';

  @override
  String get clipsDeleteSelected => 'Διαγραφή επιλεγμένων';

  @override
  String get clipsGridView => 'Προβολή πλέγματος';

  @override
  String get clipsListView => 'Προβολή λίστας';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Διαγραφή $count κλιπ;',
      one: 'Διαγραφή αυτού του κλιπ;',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Τα βίντεο αφαιρούνται οριστικά από το iPhone σας. Η ενέργεια δεν μπορεί να αναιρεθεί.',
      one: 'Το βίντεο αφαιρείται οριστικά από το iPhone σας. Η ενέργεια δεν μπορεί να αναιρεθεί.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Διαγράφηκαν $count κλιπ',
      one: 'Το κλιπ διαγράφηκε',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Δεν υπάρχουν κλιπ ακόμη';

  @override
  String get clipsEmptyBody =>
      'Καθώς οδηγείτε, το Corvista διατηρεί μια σύντομη κυλιόμενη μνήμη. Πατήστε «Αποθήκευση συμβάντος» για να κρατήσετε εδώ τα τελευταία δευτερόλεπτα του βίντεο.';

  @override
  String get clipsLoadError => 'Δεν ήταν δυνατή η φόρτωση των κλιπ σας.';

  @override
  String get clipsStorageTitle => 'Αποθηκευτικός χώρος';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Κλιπ $clips · Μνήμη $buffer · $free ελεύθερα';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αποθηκευμένα κλιπ',
      one: '1 αποθηκευμένο κλιπ',
      zero: 'Κανένα αποθηκευμένο κλιπ',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Ο αποθηκευτικός χώρος του iPhone σας είναι σχεδόν γεμάτος. Η αποθήκευση νέων συμβάντων ενδέχεται να αποτύχει.';

  @override
  String get clipsMissingFile => 'Το αρχείο λείπει';

  @override
  String get clipsEmergencyBadge => 'Πρόσκρουση';

  @override
  String clipsUntitled(String date) {
    return 'Συμβάν · $date';
  }

  @override
  String get clipsAudio => 'Με ήχο';

  @override
  String get clipsFavorite => 'Αγαπημένο';

  @override
  String get clipsUnfavorite => 'Αφαίρεση από τα αγαπημένα';

  @override
  String get clipsLocation => 'Η τοποθεσία αποθηκεύτηκε';

  @override
  String clipsOpenClip(String title) {
    return 'Άνοιγμα κλιπ $title';
  }

  @override
  String get playerNotFoundTitle => 'Το κλιπ δεν βρέθηκε';

  @override
  String get playerNotFoundBody => 'Το κλιπ ενδέχεται να έχει διαγραφεί.';

  @override
  String get playerMissingTitle => 'Το αρχείο βίντεο λείπει';

  @override
  String get playerMissingBody =>
      'Η εγγραφή αυτού του κλιπ δεν υπάρχει πλέον στο iPhone σας. Μπορείτε να αφαιρέσετε την καταχώριση από τη συλλογή σας.';

  @override
  String get playerRemoveEntry => 'Αφαίρεση καταχώρισης';

  @override
  String get playerLoadError => 'Αυτό το βίντεο δεν μπορεί να αναπαραχθεί.';

  @override
  String get playerPlay => 'Αναπαραγωγή';

  @override
  String get playerPause => 'Παύση';

  @override
  String get playerReplay => 'Επανάληψη';

  @override
  String get playerRenameTitle => 'Μετονομασία κλιπ';

  @override
  String get playerRenameHint => 'Όνομα κλιπ';

  @override
  String get playerRenamed => 'Το κλιπ μετονομάστηκε';

  @override
  String get playerFavorited => 'Προστέθηκε στα αγαπημένα';

  @override
  String get playerUnfavorited => 'Αφαιρέθηκε από τα αγαπημένα';

  @override
  String get playerShareFailed =>
      'Δεν ήταν δυνατή η κοινοποίηση αυτού του κλιπ.';

  @override
  String get playerDetails => 'Λεπτομέρειες';

  @override
  String get playerDate => 'Εγγραφή';

  @override
  String get playerDuration => 'Διάρκεια';

  @override
  String get playerResolution => 'Ανάλυση';

  @override
  String get playerSize => 'Μέγεθος αρχείου';

  @override
  String get playerAudio => 'Ήχος';

  @override
  String get playerAudioYes => 'Καταγράφηκε';

  @override
  String get playerAudioNo => 'Δεν καταγράφηκε';

  @override
  String get playerReason => 'Αποθηκεύτηκε από';

  @override
  String get playerReasonManual => 'Κουμπί «Αποθήκευση συμβάντος»';

  @override
  String get playerReasonEmergency => 'Πιθανή ανίχνευση πρόσκρουσης';

  @override
  String get playerReasonRecovered => 'Ανακτήθηκε μετά από διακοπή';

  @override
  String get playerSpeed => 'Ταχύτητα GPS κατά την αποθήκευση';

  @override
  String get playerLocation => 'Τοποθεσία';

  @override
  String get playerOpenInMaps => 'Άνοιγμα στους Χάρτες';

  @override
  String get playerBack => 'Πίσω';

  @override
  String get playerMore => 'Περισσότερες ενέργειες';

  @override
  String get clipsFilterLabel => 'Εμφάνιση';

  @override
  String get clipsFilterAll => 'Όλα';

  @override
  String get clipsFilterRecordings => 'Εγγραφές';

  @override
  String get clipsFilterIncidents => 'Συμβάντα';

  @override
  String get clipsFilterEmergency => 'Έκτακτη ανάγκη';

  @override
  String get clipsFilterFavorites => 'Αγαπημένα';

  @override
  String get clipsSort => 'Ταξινόμηση';

  @override
  String get clipsSortNewest => 'Πρώτα τα πιο πρόσφατα';

  @override
  String get clipsSortOldest => 'Πρώτα τα παλαιότερα';

  @override
  String get clipsSortLongest => 'Πρώτα τα μεγαλύτερα σε διάρκεια';

  @override
  String get clipsSortLargest => 'Πρώτα τα μεγαλύτερα σε μέγεθος';

  @override
  String get clipsToday => 'Σήμερα';

  @override
  String get clipsYesterday => 'Χθες';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κλιπ',
      one: '1 κλιπ',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty =>
      'Δεν υπάρχουν ακόμη κλιπ σε αυτή την κατηγορία.';

  @override
  String get clipsFavoritesEmpty =>
      'Σημειώστε ένα κλιπ με αστέρι για γρήγορη πρόσβαση εδώ.';

  @override
  String get clipsKindRecording => 'Εγγραφή';

  @override
  String get clipsKindIncident => 'Συμβάν';

  @override
  String get clipsKindEmergency => 'Έκτακτη ανάγκη';

  @override
  String get clipsKindTest => 'Δοκιμή';

  @override
  String clipsTripChip(String time) {
    return 'Διαδρομή · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Άνοιγμα της διαδρομής στην οποία ηχογραφήθηκε αυτό το κλιπ';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used σε χρήση · $free ελεύθερα';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Τα κλιπ καταλαμβάνουν $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εγγραφές',
      one: '1 εγγραφή',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count συμβάντα',
      one: '1 συμβάν',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count έκτακτες ανάγκες',
      one: '1 έκτακτη ανάγκη',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Αποδέσμευση χώρου';

  @override
  String get clipsStorageLowGentle =>
      'Λιγότερα από 2 GB ελεύθερα. Για ομαλή εγγραφή, αποδεσμεύστε χώρο ή διαγράψτε κλιπ που δεν χρειάζεστε πια.';

  @override
  String get clipsSaveToPhotos => 'Αποθήκευση στις Φωτογραφίες';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κλιπ',
      one: '1 κλιπ',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Διαγραφή $count κλιπ ($size);',
      one: 'Διαγραφή αυτού του κλιπ ($size);',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Αποθήκευση $done από $total στις Φωτογραφίες…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κλιπ αποθηκεύτηκαν στις Φωτογραφίες',
      one: 'Αποθηκεύτηκε στις Φωτογραφίες',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved αποθηκεύτηκαν στις Φωτογραφίες · $failed δεν αποθηκεύτηκαν';
  }

  @override
  String get clipsPhotosDenied =>
      'Το Corvista δεν έχει άδεια προσθήκης βίντεο στις Φωτογραφίες. Μπορείτε να την δώσετε στις Ρυθμίσεις.';

  @override
  String get clipsPhotosFailed =>
      'Δεν ήταν δυνατή η αποθήκευση στις Φωτογραφίες.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κλιπ προστέθηκαν στα αγαπημένα',
      one: 'Προστέθηκε στα αγαπημένα',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κλιπ αφαιρέθηκαν από τα αγαπημένα',
      one: 'Αφαιρέθηκε από τα αγαπημένα',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (περικομμένο)';
  }

  @override
  String get playerTrim => 'Περικοπή';

  @override
  String get playerInfo => 'Πληροφορίες';

  @override
  String get playerKind => 'Τύπος';

  @override
  String get playerReasonRecording => 'Κουμπί εγγραφής';

  @override
  String get trimTitle => 'Περικοπή κλιπ';

  @override
  String get trimHint =>
      'Σύρετε τις λαβές για να επιλέξετε το τμήμα που θα κρατήσετε. Το αρχικό κλιπ παραμένει αμετάβλητο.';

  @override
  String get trimStartHandle => 'Έναρξη περικοπής';

  @override
  String get trimEndHandle => 'Λήξη περικοπής';

  @override
  String trimSelection(String duration) {
    return 'Επιλέχθηκαν $duration';
  }

  @override
  String get trimSave => 'Αποθήκευση ως νέο κλιπ';

  @override
  String get trimSaving => 'Αποθήκευση περικομμένου κλιπ…';

  @override
  String get trimSaved => 'Το περικομμένο κλιπ αποθηκεύτηκε';

  @override
  String get trimOpenNew => 'Άνοιγμα';

  @override
  String get trimFailed => 'Δεν ήταν δυνατή η περικοπή αυτού του κλιπ.';

  @override
  String get trimStorageFull =>
      'Δεν υπάρχει αρκετός ελεύθερος χώρος για την αποθήκευση του περικομμένου κλιπ.';

  @override
  String get trimPreview => 'Αναπαραγωγή επιλογής';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get settingsSectionCamera => 'Κάμερα';

  @override
  String get settingsSectionAi => 'AI';

  @override
  String get settingsSectionAlerts => 'Ειδοποιήσεις';

  @override
  String get settingsSectionAlertCategories => 'Κατηγορίες ειδοποιήσεων';

  @override
  String get settingsSectionRecording => 'Εγγραφή';

  @override
  String get settingsSectionDriving => 'Οδήγηση';

  @override
  String get settingsSectionPower => 'Ενέργεια';

  @override
  String get settingsSectionEmergency => 'Έκτακτη ανάγκη';

  @override
  String get settingsSectionAppearance => 'Εμφάνιση';

  @override
  String get settingsSectionLanguage => 'Γλώσσα';

  @override
  String get settingsSectionInformation => 'Πληροφορίες';

  @override
  String get settingsCameraLens => 'Φακός κάμερας';

  @override
  String get settingsLensWide => 'Ευρυγώνιος';

  @override
  String get settingsLensUltraWide => 'Υπερευρυγώνιος';

  @override
  String get settingsLensTelephoto => 'Τηλεφακός';

  @override
  String get settingsLensUnavailable => 'Μη διαθέσιμο σε αυτό το iPhone';

  @override
  String get settingsStabilization => 'Σταθεροποίηση';

  @override
  String get settingsStabAuto => 'Αυτόματη';

  @override
  String get settingsStabOff => 'Ανενεργή';

  @override
  String get settingsStabStandard => 'Τυπική';

  @override
  String get settingsStabCinematic => 'Κινηματογραφική';

  @override
  String get settingsOverlayOpacity => 'Αδιαφάνεια επικάλυψης';

  @override
  String get settingsShowFps => 'Εμφάνιση στατιστικών απόδοσης';

  @override
  String get settingsShowFpsSubtitle =>
      'Ρυθμός καρέ και χρόνος ανάλυσης στην προβολή ανίχνευσης';

  @override
  String get settingsCameraFooter =>
      'Οι αλλαγές φακού και σταθεροποίησης εφαρμόζονται την επόμενη φορά που θα ξεκινήσει η κάμερα.';

  @override
  String get settingsAiModel => 'Μοντέλο AI';

  @override
  String get settingsConfidence => 'Βαθμός εμπιστοσύνης ανίχνευσης';

  @override
  String get settingsTracking => 'Παρακολούθηση αντικειμένων';

  @override
  String get settingsTrackingSubtitle =>
      'Διατηρεί σταθερά τα αντικείμενα μεταξύ των καρέ';

  @override
  String get settingsShowLabels => 'Εμφάνιση ετικετών';

  @override
  String get settingsShowConfidence => 'Εμφάνιση βαθμού εμπιστοσύνης';

  @override
  String get settingsSegmentationOpacity => 'Αδιαφάνεια μάσκας αντίληψης';

  @override
  String get settingsAiFooter =>
      'Ένας χαμηλότερος βαθμός εμπιστοσύνης εμφανίζει περισσότερα αντικείμενα, αλλά και περισσότερες εσφαλμένες ανιχνεύσεις. Οι ανιχνεύσεις μπορεί να είναι ανακριβείς.';

  @override
  String get settingsVoiceAlerts => 'Φωνητικές ειδοποιήσεις';

  @override
  String get settingsVoiceLanguage => 'Γλώσσα φωνής';

  @override
  String get settingsVoiceLanguageAuto => 'Ίδια με την εφαρμογή';

  @override
  String get settingsVoice => 'Φωνή';

  @override
  String get settingsVoiceDefault => 'Προεπιλογή συστήματος';

  @override
  String get settingsVoiceQualityEnhanced => 'Βελτιωμένη';

  @override
  String get settingsVoiceQualityPremium => 'Υψηλής ποιότητας';

  @override
  String get settingsNoVoices =>
      'Δεν έχει εγκατασταθεί φωνή για αυτή τη γλώσσα. Προσθέστε μία στις Ρυθμίσεις iOS › Προσβασιμότητα › Εκφώνηση περιεχομένου.';

  @override
  String get settingsAlertPedestrian => 'Πεζοί';

  @override
  String get settingsAlertCyclist => 'Ποδηλάτες';

  @override
  String get settingsAlertMotorcycle => 'Μοτοσικλέτες';

  @override
  String get settingsAlertBus => 'Λεωφορεία';

  @override
  String get settingsAlertVehicleClose => 'Όχημα πολύ κοντά μπροστά';

  @override
  String get settingsAlertTrafficLight => 'Αλλαγές φαναριού';

  @override
  String get settingsAlertTrafficMoving => 'Κίνηση της κυκλοφορίας μπροστά';

  @override
  String get settingsAlertStopSign => 'Πινακίδες Stop';

  @override
  String get settingsSensitivity => 'Ευαισθησία';

  @override
  String get settingsSensitivityLow => 'Χαμηλή';

  @override
  String get settingsSensitivityMedium => 'Μεσαία';

  @override
  String get settingsSensitivityHigh => 'Υψηλή';

  @override
  String get settingsCooldown => 'Διάστημα επανάληψης';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds δ.';
  }

  @override
  String get settingsVolume => 'Ένταση φωνής';

  @override
  String get settingsQuietMode => 'Ήσυχη λειτουργία';

  @override
  String get settingsQuietModeSubtitle =>
      'Εκφωνούνται μόνο οι πιο σημαντικές ειδοποιήσεις';

  @override
  String get settingsTestVoice => 'Δοκιμή φωνής';

  @override
  String get settingsTestVoiceDone => 'Αναπαραγωγή δείγματος ειδοποίησης…';

  @override
  String get settingsParkingBeeps => 'Ηχητικά σήματα στάθμευσης';

  @override
  String get settingsBeepVolume => 'Ένταση ηχητικών σημάτων';

  @override
  String get settingsAlertsFooter =>
      'Οι ειδοποιήσεις αποτελούν μόνο βοήθημα. Έχετε πάντα το βλέμμα στον δρόμο — η σιωπή δεν σημαίνει ότι ο δρόμος είναι ελεύθερος.';

  @override
  String get settingsRecordingProfile => 'Ποιότητα εγγραφής';

  @override
  String get settingsProfileStandard => 'Τυπική · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Μνήμη συμβάντος';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds δευτερόλεπτα';
  }

  @override
  String get settingsManualMaxLength =>
      'Μέγιστη διάρκεια χειροκίνητης εγγραφής';

  @override
  String get settingsManualMaxUnlimited => 'Απεριόριστη';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes λεπτά';
  }

  @override
  String get settingsRecordAudio => 'Εγγραφή ήχου';

  @override
  String get settingsRecordAudioSubtitle =>
      'Περιλαμβάνει τον ήχο της καμπίνας στα αποθηκευμένα συμβάντα';

  @override
  String get settingsMicDenied =>
      'Η πρόσβαση στο μικρόφωνο είναι απενεργοποιημένη. Επιτρέψτε την στις Ρυθμίσεις για να καταγράφεται ήχος.';

  @override
  String get settingsWatermark => 'Υδατογράφημα Corvista';

  @override
  String get settingsTimestamp => 'Ένδειξη ημερομηνίας και ώρας';

  @override
  String get settingsSaveLocation => 'Αποθήκευση τοποθεσίας με τα κλιπ';

  @override
  String get settingsStorage => 'Αποθηκευτικός χώρος και κλιπ';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κλιπ',
      one: '1 κλιπ',
      zero: 'Κανένα κλιπ',
    );
    return '$_temp0 · $used σε χρήση · $free ελεύθερα';
  }

  @override
  String get settingsRecordingFooter =>
      'Η κυλιόμενη μνήμη παραμένει στο iPhone σας και αντικαθίσταται συνεχώς. Τίποτα δεν καταγράφεται στο παρασκήνιο.';

  @override
  String get settingsDefaultView => 'Προεπιλεγμένη προβολή';

  @override
  String get settingsUnits => 'Μονάδες';

  @override
  String get settingsShowCompass => 'Εμφάνιση πυξίδας';

  @override
  String get settingsHudStyle => 'Στυλ HUD';

  @override
  String get settingsHudCustomize => 'Προσαρμογή HUD';

  @override
  String get settingsDrivingSide => 'Πλευρά οδήγησης';

  @override
  String get settingsDrivingSideAuto => 'Αυτόματη';

  @override
  String get settingsDrivingSideRight => 'Δεξιά';

  @override
  String get settingsDrivingSideLeft => 'Αριστερή';

  @override
  String get settingsVirtualStyle => 'Στυλ εικονικής προβολής';

  @override
  String get settingsVirtualMinimal => 'Ελάχιστο';

  @override
  String get settingsVirtualPerspective => 'Προοπτική';

  @override
  String get settingsVirtualHighContrast => 'Υψηλή αντίθεση';

  @override
  String get settingsKeepScreenOn =>
      'Να παραμένει η οθόνη αναμμένη κατά την οδήγηση';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Εμφάνιση οδηγιών πλοήγησης στην Οθόνη κλειδώματος και στο Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Η εγγραφή τέθηκε σε παύση ενώ το Corvista ήταν στο παρασκήνιο';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Σε παύση';

  @override
  String get liveActivityDashcamOff => 'Κάμερα off';

  @override
  String get liveActivityEnded => 'Η πλοήγηση ολοκληρώθηκε';

  @override
  String get liveActivityEta => 'Άφιξη';

  @override
  String get settingsAutoRecenter => 'Αυτόματη επανακέντρωση χάρτη';

  @override
  String get settingsHudStyleClassic => 'Κλασικό';

  @override
  String get settingsHudStyleGrid => 'Πλέγμα';

  @override
  String get settingsHudStyleMinimal => 'Ελάχιστο';

  @override
  String get settingsHudStylePerformance => 'Επιδόσεις';

  @override
  String get settingsHudStyleNavigation => 'Πλοήγηση';

  @override
  String get settingsHudStyleNight => 'Νύχτα';

  @override
  String get settingsHudStyleHighContrast => 'Υψηλή αντίθεση';

  @override
  String get settingsPowerMode => 'Λειτουργία ενέργειας';

  @override
  String get settingsPowerBalanced => 'Ισορροπημένη';

  @override
  String get settingsPowerPerformance => 'Επιδόσεις';

  @override
  String get settingsPowerSaver => 'Εξοικονόμηση';

  @override
  String get settingsPowerFooter =>
      'Το Corvista μειώνει αυτόματα τον ρυθμό AI και τα οπτικά εφέ όταν το iPhone σας θερμαίνεται ή η μπαταρία είναι χαμηλή.';

  @override
  String get settingsThermal => 'Θερμική κατάσταση';

  @override
  String get settingsThermalNominal => 'Κανονική';

  @override
  String get settingsThermalFair => 'Ζεστό';

  @override
  String get settingsThermalSerious => 'Πολύ ζεστό';

  @override
  String get settingsThermalCritical => 'Κρίσιμη';

  @override
  String get settingsBattery => 'Μπαταρία';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Φόρτιση';
  }

  @override
  String get settingsLowPowerMode =>
      'Η Λειτουργία χαμηλής κατανάλωσης είναι ενεργή — το AI λειτουργεί με μειωμένο ρυθμό.';

  @override
  String get settingsAiRate => 'Τρέχων ρυθμός AI';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Ανίχνευση πρόσκρουσης';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Ενεργό · αντίστροφη μέτρηση $seconds δ.';
  }

  @override
  String get settingsEmergencyFooter =>
      'Πειραματική λειτουργία. Δεν υποκαθιστά τις υπηρεσίες έκτακτης ανάγκης.';

  @override
  String get settingsTheme => 'Θέμα';

  @override
  String get settingsThemeSystem => 'Σύστημα';

  @override
  String get settingsThemeDark => 'Σκούρο';

  @override
  String get settingsThemeLight => 'Ανοιχτό';

  @override
  String get settingsReduceMotion => 'Μείωση κίνησης';

  @override
  String get settingsReduceMotionSubtitle =>
      'Ελαχιστοποιεί τα εφέ κίνησης σε όλη την εφαρμογή';

  @override
  String get settingsAppLanguage => 'Γλώσσα εφαρμογής';

  @override
  String get settingsPrivacyPolicy => 'Πολιτική απορρήτου';

  @override
  String get settingsTerms => 'Όροι χρήσης';

  @override
  String get settingsHelp => 'Βοήθεια';

  @override
  String get settingsSupport => 'Επικοινωνία με την υποστήριξη';

  @override
  String get settingsLicenses => 'Άδειες ανοιχτού κώδικα';

  @override
  String get settingsSupportUnavailable =>
      'Δεν ήταν δυνατό το άνοιγμα του Mail. Γράψτε στο support@corvista.app.';

  @override
  String get settingsSafety => 'Πληροφορίες ασφάλειας';

  @override
  String get settingsDiagnostics => 'Διαγνωστικά';

  @override
  String get settingsVersion => 'Έκδοση';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Προσαρμογή HUD';

  @override
  String get hudCustomPreview => 'Προεπισκόπηση · δείγματα τιμών';

  @override
  String get hudCustomStyle => 'Στυλ';

  @override
  String get hudCustomElements => 'Στοιχεία';

  @override
  String get hudCustomSpeed => 'Ταχύτητα';

  @override
  String get hudCustomHeading => 'Κατεύθυνση και πυξίδα';

  @override
  String get hudCustomClock => 'Ρολόι';

  @override
  String get hudCustomBattery => 'Μπαταρία και θερμοκρασία';

  @override
  String get hudCustomDetections => 'Κατάσταση AI και ανιχνεύσεις';

  @override
  String get hudCustomWeather => 'Καιρός';

  @override
  String get hudCustomAppearance => 'Μέγεθος και αδιαφάνεια';

  @override
  String get hudCustomSize => 'Μέγεθος';

  @override
  String get hudCustomOpacity => 'Αδιαφάνεια';

  @override
  String get hudCustomFooter =>
      'Οι προειδοποιήσεις, όπως η υπερθέρμανση, εμφανίζονται πάντα, ακόμη και όταν τα στοιχεία είναι κρυμμένα.';

  @override
  String get hudCustomDescClassic => 'Ισορροπημένος πίνακας οργάνων';

  @override
  String get hudCustomDescGrid => 'Πλέγμα προοπτικής πάνω από τον δρόμο';

  @override
  String get hudCustomDescMinimal => 'Μόνο η ταχύτητα, τίποτα άλλο';

  @override
  String get hudCustomDescPerformance => 'Τόξο ταχύτητας με ζωντανές ενδείξεις';

  @override
  String get hudCustomDescNavigation => 'Πρώτα η επόμενη στροφή';

  @override
  String get hudCustomDescNight =>
      'Χαμηλή φωτεινότητα και κόκκινες αποχρώσεις για νυχτερινή οδήγηση';

  @override
  String get hudCustomDescHighContrast =>
      'Μέγιστη αναγνωσιμότητα στο έντονο φως του ήλιου';

  @override
  String get languageTitle => 'Γλώσσα';

  @override
  String get languageSystem => 'Προεπιλογή συστήματος';

  @override
  String get languageSystemSubtitle => 'Ακολουθεί τη γλώσσα του iPhone σας';

  @override
  String get languageFooter =>
      'Έρχονται κι άλλες γλώσσες. Η γλώσσα των φωνητικών ειδοποιήσεων μπορεί να οριστεί ξεχωριστά στην ενότητα Ειδοποιήσεις.';

  @override
  String get diagTitle => 'Διαγνωστικά';

  @override
  String get diagPerformance => 'Επιδόσεις';

  @override
  String get diagInference => 'Χρόνος ανάλυσης';

  @override
  String get diagDetectHz => 'Ρυθμός ανίχνευσης';

  @override
  String get diagCameraFps => 'Ρυθμός καρέ κάμερας';

  @override
  String get diagMemory => 'Μνήμη';

  @override
  String get diagDropped => 'Χαμένα καρέ';

  @override
  String get diagSegmentation => 'Χρόνος τμηματοποίησης';

  @override
  String get diagCamera => 'Κάμερα';

  @override
  String get diagStatus => 'Κατάσταση';

  @override
  String get diagSource => 'Πηγή';

  @override
  String get diagSourceCamera => 'Ζωντανή κάμερα';

  @override
  String get diagSourceFile => 'Αρχείο βίντεο δοκιμής';

  @override
  String get diagResolution => 'Μέγεθος μνήμης';

  @override
  String get diagLens => 'Φακός';

  @override
  String get diagError => 'Τελευταίο σφάλμα';

  @override
  String get diagModel => 'Μοντέλο AI';

  @override
  String get diagModelLoad => 'Χρόνος φόρτωσης μοντέλου';

  @override
  String get diagPower => 'Ενέργεια';

  @override
  String get diagSegHz => 'Ρυθμός τμηματοποίησης';

  @override
  String get diagReduced => 'Μειωμένα εφέ';

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
  String get diagCamIdle => 'Αδράνεια';

  @override
  String get diagCamStarting => 'Εκκίνηση';

  @override
  String get diagCamRunning => 'Σε λειτουργία';

  @override
  String get diagCamInterrupted => 'Διακόπηκε';

  @override
  String get diagCamStopped => 'Σταμάτησε';

  @override
  String get diagCamUnavailable => 'Μη διαθέσιμη';

  @override
  String get diagCamPermissionDenied => 'Η άδεια απορρίφθηκε';

  @override
  String get diagCamError => 'Σφάλμα';

  @override
  String get diagTestFootage => 'Βίντεο δοκιμής';

  @override
  String get diagTestFootageBody =>
      'Εκτελέστε πραγματική ανίχνευση στη συσκευή σε τοπικό αρχείο βίντεο αντί για την κάμερα. Κάθε προβολή το επισημαίνει ως ΒΙΝΤΕΟ ΔΟΚΙΜΗΣ.';

  @override
  String get diagPathLabel => 'Διαδρομή αρχείου βίντεο';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Χρήση του Documents/test_drive.mp4';

  @override
  String get diagRun => 'Εκτέλεση βίντεο δοκιμής';

  @override
  String get diagRunStarted =>
      'Το βίντεο δοκιμής ξεκίνησε. Ανοίξτε την προβολή οδήγησης για να το δείτε.';

  @override
  String get diagBackToCamera => 'Επιστροφή στην ζωντανή κάμερα';

  @override
  String get diagDebugOnly =>
      'Το βίντεο δοκιμής είναι διαθέσιμο μόνο σε εκδόσεις ανάπτυξης.';

  @override
  String get diagFileMissing => 'Δεν υπάρχει αρχείο σε αυτή τη διαδρομή.';

  @override
  String get emergencySetupTitle => 'Ανίχνευση πρόσκρουσης';

  @override
  String get emergencyExperimental => 'Πειραματικό';

  @override
  String get emergencyIntro =>
      'Κατά την οδήγηση, το Corvista μπορεί να παρακολουθεί για πιθανή σοβαρή πρόσκρουση μέσω των αισθητήρων κίνησης του iPhone σας. Αν εντοπιστεί κάποια, ξεκινά μια αντίστροφη μέτρηση. Αν δεν την ακυρώσετε, το Corvista προτείνει να καλέσετε τις υπηρεσίες έκτακτης ανάγκης και να στείλετε μήνυμα στις επαφές σας.';

  @override
  String get emergencyDisclaimer1 =>
      'Δεν υποκαθιστά τις υπηρεσίες έκτακτης ανάγκης ούτε το σύστημα ανίχνευσης ατυχήματος του ίδιου του οχήματός σας.';

  @override
  String get emergencyDisclaimer2 =>
      'Το iOS ζητά πάντα επιβεβαίωση πριν πραγματοποιηθεί κλήση ή σταλεί μήνυμα.';

  @override
  String get emergencyDisclaimer3 =>
      'Μια πρόσκρουση μπορεί να μην εντοπιστεί, ενώ ένα απότομο φρενάρισμα ή κάποια λακκούβα μπορεί να εκληφθούν ως τέτοια.';

  @override
  String get emergencyParkedWarning =>
      'Ολοκληρώστε αυτή τη ρύθμιση με σταθμευμένο όχημα. Οι ρυθμίσεις κλειδώνουν όταν το όχημα κινείται.';

  @override
  String get emergencyEnable => 'Ενεργοποίηση ανίχνευσης πρόσκρουσης';

  @override
  String get emergencyEnableSubtitle =>
      'Ενεργή μόνο κατά τη διάρκεια μιας διαδρομής';

  @override
  String get emergencyNeedNumber =>
      'Προσθέστε πρώτα έναν αριθμό έκτακτης ανάγκης.';

  @override
  String get emergencyContacts => 'Επαφές έκτακτης ανάγκης';

  @override
  String get emergencyAddContact => 'Προσθήκη επαφής';

  @override
  String get emergencyNoContacts =>
      'Δεν υπάρχουν επαφές ακόμη. Οι επαφές λαμβάνουν μήνυμα μόνο αφού το επιβεβαιώσετε.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Αφαίρεση του/της $name;';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Δεν θα προτείνεται πλέον ως παραλήπτης μετά από πρόσκρουση.';

  @override
  String get emergencyRemove => 'Αφαίρεση';

  @override
  String get emergencyContactsError => 'Δεν ήταν δυνατή η φόρτωση των επαφών.';

  @override
  String get emergencyNumber => 'Αριθμός έκτακτης ανάγκης';

  @override
  String get emergencyNumberHint => 'π.χ. 112 ή 911';

  @override
  String get emergencyMessage => 'Πρότυπο μηνύματος';

  @override
  String get emergencyMessageDefault =>
      'Ενδέχεται να έχω εμπλακεί σε τροχαίο ατύχημα. Αυτό το μήνυμα ετοιμάστηκε από το Corvista και περιλαμβάνει την τελευταία γνωστή τοποθεσία μου, εφόσον είναι διαθέσιμη.';

  @override
  String get emergencyMessageHint =>
      'Αφήστε κενό για να χρησιμοποιηθεί το προεπιλεγμένο μήνυμα.';

  @override
  String get emergencyCountdown => 'Διάρκεια αντίστροφης μέτρησης';

  @override
  String get emergencyVoiceCancel => 'Ακύρωση με φωνή';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Πείτε «Είμαι καλά» ή «Ακύρωση» κατά την αντίστροφη μέτρηση. Χρησιμοποιεί αναγνώριση ομιλίας στη συσκευή, όπου είναι διαθέσιμη.';

  @override
  String get emergencyVoicePermDenied =>
      'Για την ακύρωση με φωνή απαιτείται πρόσβαση στο μικρόφωνο και στην αναγνώριση ομιλίας.';

  @override
  String get emergencyAutoSave => 'Αυτόματη αποθήκευση κλιπ συμβάντος';

  @override
  String get emergencyTest => 'Δοκιμή αντίστροφης μέτρησης (χωρίς κλήση)';

  @override
  String get emergencyTestBody =>
      'Εκτελεί μια προσομοιωμένη πρόσκρουση ώστε να δείτε την αντίστροφη μέτρηση. Στη λειτουργία δοκιμής δεν πραγματοποιείται ποτέ κλήση ή αποστολή μηνύματος.';

  @override
  String get emergencyNotSet => 'Δεν έχει οριστεί';

  @override
  String get emergencyAlertHeadline => 'Εντοπίστηκε πιθανή σοβαρή πρόσκρουση.';

  @override
  String get emergencyAlertSubtitle => 'Είστε καλά;';

  @override
  String get emergencyAlertCancel => 'Είμαι καλά — Ακύρωση';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Απομένουν $seconds δευτερόλεπτα',
      one: 'Απομένει 1 δευτερόλεπτο',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Ακρόαση — πείτε «Είμαι καλά» για ακύρωση';

  @override
  String emergencyAlertHeard(String text) {
    return 'Ακούστηκε: «$text»';
  }

  @override
  String get emergencyAlertEscalated =>
      'Δεν υπήρξε απάντηση. Επιλέξτε τι θέλετε να κάνετε:';

  @override
  String get emergencyAlertCall => 'Κλήση υπηρεσιών έκτακτης ανάγκης';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Καλεί το $number. Το iOS ζητά επιβεβαίωση.';
  }

  @override
  String get emergencyAlertMessage => 'Μήνυμα στις επαφές';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Ανοίγει ένα έτοιμο μήνυμα. Εσείς επιλέγετε αν θα σταλεί.';

  @override
  String get emergencyAlertTestMode =>
      'Λειτουργία δοκιμής — δεν θα πραγματοποιηθεί κλήση';

  @override
  String get emergencyAlertTestBadge => 'ΔΟΚΙΜΗ';

  @override
  String get emergencyAlertClose => 'Είμαι καλά — Κλείσιμο';

  @override
  String get emergencyMsgSent => 'Το μήνυμα στάλθηκε.';

  @override
  String get emergencyMsgCancelled => 'Το μήνυμα δεν στάλθηκε.';

  @override
  String get emergencyMsgFailed => 'Δεν ήταν δυνατή η αποστολή του μηνύματος.';

  @override
  String get emergencyMsgUnavailable =>
      'Η αποστολή μηνυμάτων δεν είναι διαθέσιμη σε αυτή τη συσκευή.';

  @override
  String emergencyCallFailed(String number) {
    return 'Δεν ήταν δυνατή η έναρξη της κλήσης. Καλέστε μόνοι σας το $number.';
  }

  @override
  String get modelsTitle => 'Μοντέλα AI';

  @override
  String get modelsIntro =>
      'Όλα τα μοντέλα περιλαμβάνονται στην εφαρμογή και εκτελούνται εξ ολοκλήρου στο iPhone σας. Η εικόνα της κάμεράς σας δεν φεύγει ποτέ από τη συσκευή.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Ζωντανά: $ms ms ανά καρέ · $hz ανιχνεύσεις/δ.';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Φορτώθηκε σε $ms ms';
  }

  @override
  String get modelsEfficientName => 'Αποδοτικό';

  @override
  String get modelsEfficientDesc =>
      'Γρήγορος, συμπαγής ανιχνευτής για μεγάλες διαδρομές με χαμηλή θέρμανση και κατανάλωση μπαταρίας.';

  @override
  String get modelsEnhancedName => 'Βελτιωμένο';

  @override
  String get modelsEnhancedDesc =>
      'Μεγαλύτερος ανιχνευτής που εντοπίζει μικρότερα και πιο απομακρυσμένα αντικείμενα, με υψηλότερη κατανάλωση ενέργειας.';

  @override
  String get modelsSegmentationName => 'Τμηματοποίηση';

  @override
  String get modelsSegmentationDesc =>
      'Συνδυάζει γρήγορη ανίχνευση με μάσκες οδοστρώματος και αντικειμένων για την προβολή Αντίληψης.';

  @override
  String get modelsNoneName => 'AI σε παύση';

  @override
  String get modelsNoneDesc =>
      'Η κάμερα και η εγγραφή συνεχίζουν χωρίς ανίχνευση αντικειμένων. Χαμηλότερη κατανάλωση ενέργειας.';

  @override
  String get modelsGenericDesc =>
      'Μοντέλο ανίχνευσης αντικειμένων στη συσκευή.';

  @override
  String get modelsFunctionDetection =>
      'Ανιχνεύει οχήματα, ανθρώπους, ποδήλατα, μοτοσικλέτες, λεωφορεία, φανάρια και πινακίδες Stop';

  @override
  String get modelsFunctionSegmentation =>
      'Προσθέτει μάσκες οδοστρώματος και αντικειμένων';

  @override
  String get modelsFunctionNone => 'Χωρίς ανίχνευση· μόνο εγγραφή dashcam';

  @override
  String get modelsSize => 'Μέγεθος';

  @override
  String get modelsInput => 'Είσοδος';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Λειτουργεί με';

  @override
  String get modelsStatusInstalled => 'Εγκατεστημένο (ενσωματωμένο)';

  @override
  String get modelsStatusNotInstalled => 'Δεν είναι εγκατεστημένο';

  @override
  String get modelsSelected => 'Επιλεγμένο';

  @override
  String get modelsUse => 'Χρήση αυτού του μοντέλου';

  @override
  String get modelsSwitching => 'Φόρτωση μοντέλου…';

  @override
  String modelsSwitched(String name) {
    return 'Το «$name» είναι πλέον ενεργό';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Μετρήθηκε σε αυτή τη συσκευή: μέσος όρος $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured =>
      'Δεν έχει μετρηθεί σε αυτή τη συσκευή';

  @override
  String get modelsBenchmarkRun => 'Εκτέλεση δοκιμής επιδόσεων';

  @override
  String get modelsBenchmarkRunning => 'Μέτρηση επιδόσεων…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Επιλέξτε αυτό το μοντέλο για να μετρήσετε τις επιδόσεις του.';

  @override
  String get modelsBenchmarkDone => 'Η δοκιμή επιδόσεων ολοκληρώθηκε';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Η δοκιμή επιδόσεων απέτυχε: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Τελευταία ενημέρωση $date';
  }

  @override
  String get safetyTitle => 'Πληροφορίες ασφάλειας';

  @override
  String get safetyIntro =>
      'Το Corvista είναι βοήθημα ευαισθητοποίησης στην οδήγηση. Δεν ελέγχει το όχημά σας και δεν μπορεί να αντικαταστήσει τη δική σας προσοχή, κρίση ή τα συστήματα ασφαλείας του οχήματος.';

  @override
  String get safetyBeforeTitle => 'Πριν οδηγήσετε';

  @override
  String get safetyBefore1 =>
      'Στερεώστε το iPhone σας σταθερά σε νόμιμη θέση που δεν εμποδίζει την ορατότητα, τους αερόσακους ή τα χειριστήρια.';

  @override
  String get safetyBefore2 =>
      'Ολοκληρώστε τη ρύθμιση, επιλέξτε προβολή και ορίστε προορισμό ενώ το όχημα είναι σταθμευμένο.';

  @override
  String get safetyBefore3 =>
      'Συνδέστε φορτιστή για μεγαλύτερες διαδρομές και, όπου είναι δυνατό, κρατήστε το τηλέφωνο μακριά από το άμεσο ηλιακό φως.';

  @override
  String get safetyWhileTitle => 'Κατά την οδήγηση';

  @override
  String get safetyWhile1 =>
      'Κρατήστε το βλέμμα στον δρόμο. Χρησιμοποιείτε τα μεγάλα χειριστήρια στην οθόνη μόνο όταν είναι ασφαλές και νόμιμο.';

  @override
  String get safetyWhile2 =>
      'Οι ειδοποιήσεις είναι βοηθήματα, όχι προειδοποιήσεις στις οποίες μπορείτε να βασιστείτε. Η σιωπή δεν σημαίνει ποτέ ότι ο δρόμος είναι ελεύθερος.';

  @override
  String get safetyWhile3 =>
      'Ακολουθήστε τον Κώδικα Οδικής Κυκλοφορίας, τα σήματα και τις πινακίδες — όχι την εφαρμογή — όταν διαφωνούν.';

  @override
  String get safetyLimitsTitle => 'Περιορισμοί';

  @override
  String get safetyLimits1 =>
      'Η κάμερα ενός τηλεφώνου βλέπει μόνο ό,τι βρίσκεται μπροστά της. Αντικείμενα εκτός οπτικού πεδίου, κρυμμένα ή πολύ κοντά δεν ανιχνεύονται.';

  @override
  String get safetyLimits2 =>
      'Οι ανιχνεύσεις μπορεί να χαθούν, να καθυστερήσουν ή να είναι λανθασμένες, ειδικά τη νύχτα, με βροχή, ομίχλη, θάμβος ή βρώμικο παρμπρίζ.';

  @override
  String get safetyLimits3 =>
      'Αναγνωρίζονται μόνο οι υποστηριζόμενες κατηγορίες: οχήματα, λεωφορεία, μοτοσικλέτες, ποδήλατα, άνθρωποι, φανάρια και πινακίδες Stop. Οι ενδείξεις λωρίδων στην εικονική προβολή είναι σχηματοποιημένες, όχι ανιχνευμένες λωρίδες.';

  @override
  String get safetyLimits4 =>
      'Η εγγύτητα εμφανίζεται ως κατά προσέγγιση ζώνες (Πολύ κοντά, Κοντά, Μεσαία, Μακριά), ποτέ ως μετρημένες αποστάσεις. Η προβολή στάθμευσης δεν αντικαθιστά τους αισθητήρες στάθμευσης.';

  @override
  String get safetyHeatTitle => 'Θερμότητα και μπαταρία';

  @override
  String get safetyHeat1 =>
      'Η συνεχής χρήση της κάμερας και του AI θερμαίνει το iPhone σας. Το Corvista μειώνει τον ρυθμό ανάλυσης όταν η συσκευή ζεσταίνεται και εμφανίζει προειδοποίηση· αν το iOS υπερθερμανθεί, η κάμερα ενδέχεται να σταματήσει.';

  @override
  String get safetyEmergencyTitle => 'Λειτουργία έκτακτης ανάγκης';

  @override
  String get safetyEmergency1 =>
      'Η ανίχνευση πιθανής πρόσκρουσης είναι πειραματική. Μπορεί να μην εντοπίσει πραγματικά ατυχήματα και να ενεργοποιηθεί από άλλα συμβάντα.';

  @override
  String get safetyEmergency2 =>
      'Δεν επικοινωνεί ποτέ με κανέναν αθόρυβα: το iOS ζητά πάντα επιβεβαίωση για κλήση ή μήνυμα. Δεν υποκαθιστά την κλήση των υπηρεσιών έκτακτης ανάγκης από εσάς τους ίδιους.';

  @override
  String get privacyTitle => 'Απόρρητο';

  @override
  String get privacyIntro =>
      'Το Corvista έχει σχεδιαστεί ώστε τα δεδομένα οδήγησής σας να παραμένουν στο iPhone σας. Δεν υπάρχει λογαριασμός Corvista και το Corvista δεν διατηρεί δικούς του διακομιστές.';

  @override
  String get privacyCameraTitle => 'Κάμερα και AI';

  @override
  String get privacyCamera1 =>
      'Η ανίχνευση, η παρακολούθηση και η τμηματοποίηση αντικειμένων εκτελούνται εξ ολοκλήρου στο iPhone σας. Τα καρέ της κάμερας δεν μεταφορτώνονται ποτέ.';

  @override
  String get privacyCamera2 =>
      'Η κάμερα λειτουργεί μόνο όσο το Corvista είναι ανοιχτό στην οθόνη. Σταματά όταν η εφαρμογή περνά στο παρασκήνιο — δεν υπάρχει κρυφή εγγραφή στο παρασκήνιο.';

  @override
  String get privacyRecordingsTitle => 'Εγγραφές';

  @override
  String get privacyRecordings1 =>
      'Η κυλιόμενη μνήμη είναι προσωρινή και αντικαθίσταται συνεχώς. Το υλικό διατηρείται μόνο όταν πατήσετε «Αποθήκευση συμβάντος» ή, αν το ενεργοποιήσετε, μετά από πιθανή πρόσκρουση.';

  @override
  String get privacyRecordings2 =>
      'Τα αποθηκευμένα κλιπ παραμένουν στον ιδιωτικό αποθηκευτικό χώρο του Corvista στο iPhone σας. Φεύγουν από τη συσκευή μόνο όταν επιλέξετε Κοινοποίηση. Η διαγραφή της εφαρμογής τα διαγράφει.';

  @override
  String get privacyRecordings3 =>
      'Ο ήχος καταγράφεται μόνο αν τον ενεργοποιήσετε και παραχωρήσετε πρόσβαση στο μικρόφωνο.';

  @override
  String get privacyLocationTitle => 'Τοποθεσία';

  @override
  String get privacyLocation1 =>
      'Η τοποθεσία χρησιμοποιείται όσο η εφαρμογή είναι ανοιχτή για την ταχύτητα, τον χάρτη, τις διαδρομές και τον καιρό. Αν η «Αποθήκευση τοποθεσίας» είναι ενεργή, η θέση τη στιγμή της αποθήκευσης αποθηκεύεται με το κλιπ στη συσκευή σας.';

  @override
  String get privacyNetworkTitle => 'Υπηρεσίες δικτύου';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — εμφάνιση χάρτη, αναζήτηση τόπων και διαδρομές. Το κείμενο αναζήτησης και η κατά προσέγγιση τοποθεσία σας αποστέλλονται στην Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — τρέχων και ωριαίος καιρός για την τοποθεσία σας.';

  @override
  String get privacyNetwork4 =>
      'Το Corvista δεν περιλαμβάνει διαφημίσεις ούτε αναλύσεις ή παρακολούθηση τρίτων.';

  @override
  String get privacyEmergencyTitle => 'Επαφές έκτακτης ανάγκης';

  @override
  String get privacyEmergency1 =>
      'Οι επαφές που επιλέγετε αποθηκεύονται στο iOS Keychain αυτής της συσκευής. Η ακύρωση με φωνή χρησιμοποιεί αναγνώριση ομιλίας στη συσκευή, όπου είναι διαθέσιμη. Οι κλήσεις και τα μηνύματα αποστέλλονται μόνο αφού τα επιβεβαιώσετε στο iOS.';

  @override
  String get privacyControlsTitle => 'Οι έλεγχοί σας';

  @override
  String get privacyControls1 =>
      'Μπορείτε να διαγράψετε κλιπ οποτεδήποτε στην ενότητα Κλιπ και να αλλάξετε ή να ανακαλέσετε την πρόσβαση στην κάμερα, το μικρόφωνο, την τοποθεσία και την ομιλία στις Ρυθμίσεις iOS.';

  @override
  String get termsTitle => 'Όροι χρήσης';

  @override
  String get termsIntro =>
      'Χρησιμοποιώντας το Corvista συμφωνείτε με τους παρόντες όρους. Ισχύει επίσης η τυπική Συμφωνία Άδειας Χρήσης Τελικού Χρήστη Εφαρμογής της Apple.';

  @override
  String get termsUseTitle => 'Χρήση του Corvista';

  @override
  String get termsUse1 =>
      'Το Corvista είναι βοήθημα ευαισθητοποίησης στην οδήγηση και dashcam. Παραμένετε πλήρως υπεύθυνοι για την ασφαλή και νόμιμη οδήγηση ανά πάσα στιγμή.';

  @override
  String get termsUse2 =>
      'Μην χρησιμοποιείτε την εφαρμογή με τρόπους που αποσπούν την προσοχή σας κατά την οδήγηση. Στερεώστε τη συσκευή με ασφάλεια και νόμιμα.';

  @override
  String get termsAccuracyTitle => 'Καμία εγγύηση ακρίβειας';

  @override
  String get termsAccuracy1 =>
      'Οι ανιχνεύσεις, οι ζώνες, οι ειδοποιήσεις, οι δείκτες χάρτη, οι διαδρομές και ο καιρός μπορεί να είναι ελλιπείς, καθυστερημένοι ή λανθασμένοι. Το Corvista δεν ελέγχει το όχημά σας.';

  @override
  String get termsAccuracy2 =>
      'Η λειτουργία έκτακτης ανάγκης είναι πειραματική και μπορεί να μην εντοπίσει μια πρόσκρουση ή να ενεργοποιηθεί εσφαλμένα.';

  @override
  String get termsRecordingTitle => 'Νομοθεσία εγγραφής';

  @override
  String get termsRecording1 =>
      'Η νομοθεσία για τις dashcam, την εγγραφή ήχου και τη βιντεοσκόπηση ατόμων διαφέρει ανά χώρα και περιοχή. Είστε υπεύθυνοι για τη συμμόρφωση με αυτήν, μεταξύ άλλων όταν κοινοποιείτε κλιπ.';

  @override
  String get termsLiabilityTitle => 'Ευθύνη';

  @override
  String get termsLiability1 =>
      'Η εφαρμογή παρέχεται «ως έχει». Στον βαθμό που επιτρέπεται από τον νόμο, ο προγραμματιστής δεν ευθύνεται για ατυχήματα, απώλειες, πρόστιμα ή ζημιές που προκύπτουν από τη χρήση της ή από την εξάρτηση από τα αποτελέσματά της.';

  @override
  String get termsChangesTitle => 'Αλλαγές';

  @override
  String get termsChanges1 =>
      'Οι παρόντες όροι μπορεί να ενημερώνονται με νέες εκδόσεις της εφαρμογής. Η συνέχιση της χρήσης μετά από ενημέρωση σημαίνει ότι αποδέχεστε τους αναθεωρημένους όρους.';

  @override
  String get helpTitle => 'Βοήθεια';

  @override
  String get helpIntro =>
      'Απαντήσεις σε συχνές ερωτήσεις. Για οδηγίες ασφάλειας, δείτε τις Πληροφορίες ασφάλειας.';

  @override
  String get helpQSave => 'Πώς κρατάω το βίντεο ενός συμβάντος;';

  @override
  String get helpASaveBuffer =>
      'Πατήστε το μεγάλο κουμπί «Αποθήκευση συμβάντος» στην προβολή οδήγησης. Το Corvista αποθηκεύει στα Κλιπ τα τελευταία 20 ή 30 δευτερόλεπτα της κυλιόμενης προσωρινής μνήμης (η επιλογή γίνεται στις Ρυθμίσεις › Εγγραφή).';

  @override
  String get helpQWhere => 'Πού αποθηκεύονται τα κλιπ μου;';

  @override
  String get helpAWhere =>
      'Στον ιδιωτικό αποθηκευτικό χώρο του Corvista στο iPhone σας. Δεν μεταφορτώνονται ποτέ. Χρησιμοποιήστε την Κοινοποίηση στο πρόγραμμα αναπαραγωγής για να στείλετε ή να εξαγάγετε ένα κλιπ.';

  @override
  String get helpQZones => 'Πόσο ακριβείς είναι οι ζώνες εγγύτητας;';

  @override
  String get helpAZones =>
      'Οι ζώνες είναι χονδρικές εκτιμήσεις από μία κάμερα με βάση τυπικά μεγέθη αντικειμένων. Θεωρήστε τις κατά προσέγγιση ενδείξεις, ποτέ αποστάσεις.';

  @override
  String get helpQSlow => 'Γιατί επιβραδύνεται η ανίχνευση;';

  @override
  String get helpASlow =>
      'Όταν το iPhone σας ζεσταίνεται, η μπαταρία είναι χαμηλή ή είναι ενεργή η Λειτουργία χαμηλής κατανάλωσης, το Corvista μειώνει τον ρυθμό ανάλυσης για να προστατεύσει τη συσκευή. Μπορείτε να αλλάξετε τη λειτουργία ενέργειας στις Ρυθμίσεις.';

  @override
  String get helpQMap => 'Ο χάρτης, η αναζήτηση ή ο καιρός δεν λειτουργούν.';

  @override
  String get helpAMap =>
      'Αυτές οι λειτουργίες απαιτούν σύνδεση στο διαδίκτυο και πρόσβαση στην τοποθεσία. Ελέγξτε τη σύνδεσή σας και επιτρέψτε την τοποθεσία για το Corvista στις Ρυθμίσεις iOS.';

  @override
  String get helpQSimulator => 'Η κάμερα εμφανίζεται ως μη διαθέσιμη.';

  @override
  String get helpASimulator =>
      'Βεβαιωθείτε ότι επιτρέπεται η πρόσβαση στην κάμερα στις Ρυθμίσεις iOS και ότι καμία άλλη εφαρμογή δεν χρησιμοποιεί την κάμερα. Στον iOS Simulator δεν υπάρχει κάμερα· μπορείτε να χρησιμοποιήσετε ένα τοπικό βίντεο δοκιμής.';

  @override
  String get emergencyMsgNoContacts =>
      'Προσθέστε πρώτα μια επαφή έκτακτης ανάγκης.';

  @override
  String get cameraStarting => 'Εκκίνηση κάμερας…';

  @override
  String get cameraInterrupted => 'Η κάμερα τέθηκε σε παύση';

  @override
  String get cameraInterruptedBody =>
      'Το iOS έθεσε την κάμερα σε παύση, για παράδειγμα κατά τη διάρκεια μιας κλήσης ή όταν τη χρησιμοποιεί άλλη εφαρμογή. Θα συνεχίσει αυτόματα.';

  @override
  String get cameraUnavailable => 'Η κάμερα δεν είναι διαθέσιμη';

  @override
  String get cameraUnavailableBody =>
      'Δεν υπάρχει διαθέσιμη κάμερα σε αυτή τη συσκευή. Οι προβολές ανίχνευσης, εγγραφής και στάθμευσης απαιτούν την πίσω κάμερα.';

  @override
  String get cameraRunTestFootage => 'Εκτέλεση βίντεο δοκιμής';

  @override
  String get cameraPermissionDenied =>
      'Η πρόσβαση στην κάμερα είναι απενεργοποιημένη';

  @override
  String get cameraPermissionDeniedBody =>
      'Το Corvista χρειάζεται την κάμερα για ανίχνευση, εγγραφή dashcam και προβολές στάθμευσης. Ενεργοποιήστε την πρόσβαση στην κάμερα στις Ρυθμίσεις.';

  @override
  String get cameraError => 'Σφάλμα κάμερας';

  @override
  String get cameraStopped => 'Η κάμερα σταμάτησε';

  @override
  String get cameraStart => 'Εκκίνηση κάμερας';

  @override
  String get cameraFocusHint => 'Πατήστε για εστίαση';

  @override
  String get cameraPreviewLabel =>
      'Ζωντανή προβολή κάμερας με ανιχνευμένα αντικείμενα';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Κάμερα $fps fps · AI $hz Hz · $ms ms · χαμένα $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Ταχύτητα $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Χωρίς ταχύτητα GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Κατεύθυνση $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $secondsδ';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Εγγραφή μνήμης dashcam, $seconds από $target δευτερόλεπτα στη μνήμη';
  }

  @override
  String get hudRecIdle => 'REC off';

  @override
  String get hudRecSaving => 'Αποθήκευση…';

  @override
  String get hudRecError => 'Σφάλμα REC';

  @override
  String get hudAiPaused => 'AI σε παύση';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αντικείμενα',
      one: '1 αντικείμενο',
      zero: 'Κανένα αντικείμενο',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αντικείμενα',
      one: '1 αντικείμενο',
      zero: 'κανένα αντικείμενο',
    );
    return 'Μοντέλο AI $model, $_temp0 ανιχνεύθηκαν';
  }

  @override
  String get hudThermalSerious => 'Ζέστη — το AI επιβραδύνθηκε';

  @override
  String get hudThermalCritical => 'Υπερβολική ζέστη — το AI σε παύση';

  @override
  String hudBatteryLow(String percent) {
    return 'Μπαταρία $percent';
  }

  @override
  String get hudLowPower => 'Χαμηλή κατανάλωση';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Καιρός $temperature, $condition. Πατήστε για λεπτομέρειες.';
  }

  @override
  String get hudNoGuidance =>
      'Αναζητήστε έναν προορισμό στην προβολή Χάρτη για να δείτε εδώ οδηγίες πλοήγησης.';

  @override
  String get navArrived => 'Φτάσατε';

  @override
  String get navRerouting => 'Επανυπολογισμός διαδρομής…';

  @override
  String get navSearchHint => 'Αναζήτηση προορισμού';

  @override
  String get navSearchFieldHint => 'Διεύθυνση, τόπος ή επιχείρηση';

  @override
  String get navNoResults => 'Δεν βρέθηκαν τόποι';

  @override
  String get navSearching => 'Αναζήτηση…';

  @override
  String get navSearchStartTyping =>
      'Πληκτρολογήστε μια διεύθυνση ή όνομα τόπου. Τα αποτελέσματα προέρχονται από τους Apple Maps και απαιτούν σύνδεση στο διαδίκτυο.';

  @override
  String get navErrorUnavailable =>
      'Η αναζήτηση και οι διαδρομές δεν είναι διαθέσιμες — ελέγξτε τη σύνδεσή σας στο διαδίκτυο.';

  @override
  String get navErrorNoLocation =>
      'Αναμονή για την τοποθεσία σας ώστε να προγραμματιστεί διαδρομή.';

  @override
  String get navErrorPermission =>
      'Η πρόσβαση στην τοποθεσία είναι απενεργοποιημένη, επομένως οι διαδρομές δεν μπορούν να ξεκινήσουν από τη θέση σας.';

  @override
  String navErrorGeneric(String code) {
    return 'Δεν ήταν δυνατή η φόρτωση διαδρομών ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Διαδρομές προς $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Άφιξη $time';
  }

  @override
  String get navStart => 'Έναρξη';

  @override
  String get navEnd => 'Τέλος';

  @override
  String get navEndLabel => 'Τερματισμός πλοήγησης';

  @override
  String navRemaining(String distance, String duration) {
    return 'Απομένουν $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Ειδοποίηση: $text';
  }

  @override
  String navDurationMin(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes λεπτά',
      one: '1 λεπτό',
    );
    return '$_temp0';
  }

  @override
  String navDurationHourMin(int hours, int minutes) {
    return '$hours ώ. $minutes λ.';
  }

  @override
  String navAltRouteLabel(int index, String name) {
    return 'Διαδρομή $index: $name';
  }

  @override
  String get weatherTitle => 'Καιρός';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Αίσθηση $temperature';
  }

  @override
  String get weatherPrecipitation => 'Βροχόπτωση';

  @override
  String get weatherWind => 'Άνεμος';

  @override
  String get weatherVisibility => 'Ορατότητα';

  @override
  String get weatherHumidity => 'Υγρασία';

  @override
  String get weatherHourly => 'Επόμενες ώρες';

  @override
  String weatherAsOf(String time) {
    return 'Ενημερώθηκε $time';
  }

  @override
  String get weatherRefresh => 'Ανανέωση καιρού';

  @override
  String get weatherUnavailable =>
      'Ο καιρός δεν είναι διαθέσιμος αυτή τη στιγμή.';

  @override
  String get weatherNoLocation => 'Ο καιρός χρειάζεται την τοποθεσία σας.';

  @override
  String get weatherLegal => 'Πηγές δεδομένων και νομικά';

  @override
  String weatherProvidedBy(String service) {
    return 'Δεδομένα καιρού: $service';
  }

  @override
  String get weatherNow => 'Τώρα';

  @override
  String get virtualEmpty => 'Δεν ανιχνεύθηκαν υποστηριζόμενα αντικείμενα';

  @override
  String get virtualEmptyCameraOff =>
      'Η εικονική προβολή χρειάζεται την ζωντανή κάμερα.';

  @override
  String get virtualLaneDisclaimer =>
      'Οι γραμμές λωρίδων είναι ενδεικτικές, όχι ανιχνευμένες.';

  @override
  String virtualNearest(String zone) {
    return 'Πλησιέστερο: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Εικονική σκηνή δρόμου: $summary';
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
  String get virtualStatusLive => 'ενεργό';

  @override
  String get virtualStatusPaused => 'σε παύση';

  @override
  String get virtualStatusCameraOff => 'Κάμερα off';

  @override
  String get virtualStatusTestFootage => 'Βίντεο δοκιμής';

  @override
  String get virtualEmptyHint =>
      'Οχήματα, άνθρωποι, ποδήλατα, φανάρια και πινακίδες Stop εμφανίζονται εδώ όταν ανιχνευθούν.';

  @override
  String get mapRecenter => 'Επανακέντρωση';

  @override
  String get mapZoomIn => 'Μεγέθυνση';

  @override
  String get mapZoomOut => 'Σμίκρυνση';

  @override
  String get mapUnsupported =>
      'Ο διαδραστικός χάρτης είναι διαθέσιμος στο iPhone.';

  @override
  String get mapObjectsApprox =>
      'Οι δείκτες αντικειμένων είναι κατά προσέγγιση θέσεις.';

  @override
  String get mapWeatherUnavailable => 'Ο καιρός δεν είναι διαθέσιμος';

  @override
  String get navErrorNoRoute =>
      'Δεν βρέθηκε διαδρομή προς αυτόν τον προορισμό.';

  @override
  String get navDismiss => 'Απόρριψη';

  @override
  String get navGo => 'Πηγαίνετε';

  @override
  String get navFastest => 'Ταχύτερη';

  @override
  String get navThen => 'Έπειτα';

  @override
  String get navRecents => 'Πρόσφατα';

  @override
  String get navClearRecents => 'Εκκαθάριση';

  @override
  String get navSearchSubmitHint =>
      'Πατήστε Αναζήτηση για να δείτε όλους τους τόπους που ταιριάζουν';

  @override
  String get navPlaces => 'Τόποι';

  @override
  String get navEtaLabel => 'άφιξη';

  @override
  String get navTimeLeftLabel => 'απομένουν';

  @override
  String get navOverview => 'Επισκόπηση';

  @override
  String get navMute => 'Σίγαση φωνής';

  @override
  String get navUnmute => 'Άρση σίγασης φωνής';

  @override
  String get navEndConfirm => 'Τερματισμός πλοήγησης;';

  @override
  String navEndConfirmBody(String place) {
    return 'Η καθοδήγηση προς $place θα σταματήσει.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Φτάσατε στο $place';
  }

  @override
  String get navDone => 'Τέλος';

  @override
  String get navWeakGps => 'Ασθενές σήμα GPS';

  @override
  String get navLocationOff =>
      'Η τοποθεσία είναι απενεργοποιημένη. Ενεργοποιήστε την για να σχεδιάσετε διαδρομές και να πλοηγηθείτε.';

  @override
  String get navVoiceGuidance => 'Φωνητική καθοδήγηση';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Σε $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, και μετά $second';
  }

  @override
  String get navSpeakRerouting => 'Επανυπολογισμός διαδρομής';

  @override
  String get navSpeakArrived => 'Φτάσατε στον προορισμό σας';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count μέτρα',
      one: '1 μέτρο',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value χιλιόμετρα',
      one: '1 χιλιόμετρο',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count πόδια',
      one: '1 πόδι',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count γιάρδες',
      one: '1 γιάρδα',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Συνεχίστε για $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Δεν υπάρχουν διαθέσιμες οδηγίες για αυτή τη διαδρομή σε αυτή την περιοχή. Δοκιμάστε άλλον προορισμό.';

  @override
  String navContinueFor(String distance) {
    return 'Συνεχίστε για $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value μίλια',
      one: '1 μίλι',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Πλησιέστερο: $object · $zone';
  }

  @override
  String get parkingNothing => 'Δεν ανιχνεύθηκε τίποτα στο οπτικό πεδίο';

  @override
  String get parkingBeeps => 'Ηχητικά σήματα εγγύτητας';

  @override
  String get parkingVolume => 'Ένταση ηχητικών σημάτων';

  @override
  String get parkingLimitations =>
      'Μία κάμερα, όχι 360°. Αντικείμενα εκτός του οπτικού πεδίου της κάμερας δεν ανιχνεύονται. Δεν αντικαθιστά τους αισθητήρες στάθμευσης· οι εκτιμήσεις μπορεί να είναι λανθασμένες και η σιωπή δεν σημαίνει ότι η περιοχή είναι ελεύθερη.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Προβολή εγγύτητας από πάνω. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Πρωτότυπο';

  @override
  String get perceptionModeBoxes => 'Πλαίσια';

  @override
  String get perceptionModeMasks => 'Μάσκες αντικειμένων';

  @override
  String get perceptionModeRoad => 'Οδόστρωμα';

  @override
  String get perceptionModeCombined => 'Συνδυασμός';

  @override
  String get perceptionOpacity => 'Αδιαφάνεια μάσκας';

  @override
  String get perceptionDisclaimer =>
      'Η μάσκα οδοστρώματος είναι ένα κατά προσέγγιση οπτικό επίπεδο. Δεν δείχνει τον βατό χώρο ή τις λωρίδες.';

  @override
  String get perceptionNeedsModel =>
      'Επιλέξτε το μοντέλο Τμηματοποίησης για να δείτε μάσκες.';

  @override
  String get perceptionChooseModel => 'Επιλογή μοντέλου';

  @override
  String get perceptionWaiting => 'Αναμονή για το πρώτο καρέ τμηματοποίησης…';

  @override
  String get perceptionShortCamera => 'Κάμερα';

  @override
  String get perceptionShortBoxes => 'Πλαίσια';

  @override
  String get perceptionShortObjects => 'Αντικείμενα';

  @override
  String get perceptionShortRoad => 'Δρόμος';

  @override
  String get perceptionShortAll => 'Όλα';

  @override
  String get perceptionModesLabel => 'Επίπεδα αντίληψης';

  @override
  String get perceptionStatusWarmingUp => 'Προετοιμασία…';

  @override
  String get perceptionStatusLoadingModel => 'Φόρτωση μοντέλου…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Μάσκες σε παύση';

  @override
  String get perceptionLegend => 'Υπόμνημα μασκών';

  @override
  String get perceptionUnavailable => 'Οι μάσκες δεν είναι διαθέσιμες';

  @override
  String get driveSave => 'Αποθήκευση';

  @override
  String get driveSaveIncident => 'Αποθήκευση συμβάντος';

  @override
  String driveSaveHint(int seconds) {
    return 'Αποθηκεύει τα τελευταία $seconds δευτερόλεπτα βίντεο της dashcam';
  }

  @override
  String get driveSaving => 'Αποθήκευση συμβάντος…';

  @override
  String hudRecManualLabel(String time) {
    return 'Εγγραφή, $time';
  }

  @override
  String get driveRecord => 'Εγγραφή';

  @override
  String get driveRecordStartA11y => 'Έναρξη εγγραφής';

  @override
  String driveRecordStopA11y(String time) {
    return 'Διακοπή εγγραφής, ηχογραφήθηκαν $time';
  }

  @override
  String get driveRecordHint =>
      'Ηχογραφεί συνεχώς μέχρι να τη διακόψετε, συμπεριλαμβανομένων των τελευταίων 5 δευτερολέπτων';

  @override
  String get driveRecordFailed => 'Δεν ήταν δυνατή η έναρξη της εγγραφής';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Η εγγραφή αποθηκεύτηκε · $count μέρη',
      one: 'Η εγγραφή αποθηκεύτηκε',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Η εγγραφή διακόπηκε: ο χώρος αποθήκευσης σχεδόν γέμισε',
      'max_duration': 'Η εγγραφή διακόπηκε: συμπληρώθηκε η μέγιστη διάρκεια',
      'camera_stopped': 'Η εγγραφή διακόπηκε μαζί με την κάμερα',
      'background': 'Η εγγραφή διακόπηκε: η εφαρμογή πήγε στο παρασκήνιο',
      'thermal': 'Η εγγραφή διακόπηκε: το τηλέφωνο έχει υπερθερμανθεί',
      'other': 'Η εγγραφή διακόπηκε',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Το συμβάν αποθηκεύτηκε · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Προβολή';

  @override
  String get driveSaveFailed => 'Δεν ήταν δυνατή η αποθήκευση του συμβάντος.';

  @override
  String get driveSaveNotRunning =>
      'Η εγγραφή δεν έχει ξεκινήσει ακόμη — περιμένετε να ξεκινήσει η κάμερα και δοκιμάστε ξανά.';

  @override
  String get driveSaveTestFootage =>
      'Το βίντεο δοκιμής δεν εγγράφεται. Η αποθήκευση συμβάντων λειτουργεί με την ζωντανή κάμερα.';

  @override
  String get driveSaveStorageFull =>
      'Το iPhone σας έχει εξαντλήσει τον αποθηκευτικό χώρο. Ελευθερώστε χώρο ή διαγράψτε παλαιότερα κλιπ.';

  @override
  String get driveSaveIoError =>
      'Δεν ήταν δυνατή η εγγραφή του κλιπ στον αποθηκευτικό χώρο.';

  @override
  String get driveClips => 'Κλιπ';

  @override
  String get driveSettings => 'Ρυθμίσεις';

  @override
  String get driveViewSwitcher => 'Προβολές οδήγησης';

  @override
  String get driveLocationDenied =>
      'Η τοποθεσία είναι απενεργοποιημένη — η ταχύτητα, οι χάρτες και οι διαδρομές δεν είναι διαθέσιμα.';

  @override
  String get driveCameraDenied =>
      'Η πρόσβαση στην κάμερα είναι απενεργοποιημένη — η ανίχνευση και η εγγραφή δεν είναι διαθέσιμες.';

  @override
  String get driveRecorderFallback =>
      'Εγγραφή χωρίς ήχο: η πρόσβαση στο μικρόφωνο είναι απενεργοποιημένη.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Οι ρυθμίσεις εγγραφής προσαρμόστηκαν: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Το iPhone σας είναι ζεστό. Το AI λειτουργεί πιο αργά για να δροσίσει — κρατήστε το μακριά από άμεσο ήλιο και κοντά σε αεραγωγό.';

  @override
  String get drivePowerThermalCritical =>
      'Το iPhone σας είναι υπερβολικά ζεστό. Η ανίχνευση AI είναι σε παύση μέχρι να δροσίσει· η εγγραφή συνεχίζεται, αν είναι δυνατό.';

  @override
  String get drivePowerLowPower =>
      'Η Λειτουργία χαμηλής κατανάλωσης είναι ενεργή — το AI λειτουργεί με μειωμένο ρυθμό.';

  @override
  String get drivePowerBatteryLow =>
      'Η μπαταρία είναι χαμηλή — συνδέστε το iPhone σας σε τροφοδοσία κατά την οδήγηση.';

  @override
  String get onboardingTitle1 => 'Δείτε περισσότερα σε κάθε διαδρομή.';

  @override
  String get onboardingBody1 =>
      'Μετατρέψτε το iPhone σας σε έξυπνη dashcam και σύντροφο ευαισθητοποίησης στην οδήγηση.';

  @override
  String get onboardingTitle2 => 'Ευφυΐα σε κάθε καρέ.';

  @override
  String get onboardingBody2 =>
      'Αναγνωρίστε υποστηριζόμενα οχήματα, ανθρώπους, ποδήλατα και σήματα του δρόμου απευθείας στο iPhone σας.';

  @override
  String get onboardingTitle3 => 'Ένας δρόμος. Πολλές οπτικές.';

  @override
  String get onboardingBody3 =>
      'Εναλλάξτε μεταξύ ζωντανής ανίχνευσης, εικονικών προβολών οδήγησης, διαδραστικών χαρτών και απεικόνισης στάθμευσης.';

  @override
  String get onboardingTitle4 => 'Κρατήστε τις στιγμές που μετράνε.';

  @override
  String get onboardingBody4 =>
      'Αποθηκεύστε πρόσφατο υλικό dashcam, ελέγξτε συμβάντα και κοινοποιήστε εγγραφές.';

  @override
  String get onboardingTitle5 => 'Ασφάλεια και απόρρητο';

  @override
  String get onboardingSafety1 =>
      'Το Corvista είναι βοήθημα ευαισθητοποίησης στην οδήγηση. Κρατήστε το βλέμμα στον δρόμο.';

  @override
  String get onboardingSafety2 =>
      'Δεν ελέγχει το όχημά σας ούτε αντικαθιστά την κρίση σας.';

  @override
  String get onboardingSafety3 =>
      'Οι ανιχνεύσεις και οι εκτιμήσεις μπορεί να είναι ανακριβείς ή να παραλείπονται.';

  @override
  String get onboardingSafety4 =>
      'Η επεξεργασία της κάμερας γίνεται στο iPhone σας — το βίντεο δεν μεταφορτώνεται.';

  @override
  String get onboardingSafety5 =>
      'Οι χάρτες, η αναζήτηση, οι διαδρομές και ο καιρός απαιτούν σύνδεση στο διαδίκτυο.';

  @override
  String get onboardingSafety6 =>
      'Στερεώστε το iPhone σας σταθερά ώστε να μην εμποδίζει την ορατότητά σας.';

  @override
  String get onboardingSafety7 =>
      'Ολοκληρώστε τη ρύθμιση πριν ξεκινήσετε να οδηγείτε.';

  @override
  String get onboardingAcknowledge =>
      'Κατανοώ ότι το Corvista είναι βοήθημα ευαισθητοποίησης και ότι παραμένω υπεύθυνος/η για την ασφαλή οδήγηση.';

  @override
  String get onboardingReadSafety =>
      'Διαβάστε τις πλήρεις πληροφορίες ασφάλειας';

  @override
  String get onboardingNext => 'Επόμενο';

  @override
  String get onboardingSkip => 'Παράλειψη';

  @override
  String get onboardingAgree => 'Συνέχεια';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Σελίδα $current από $total';
  }

  @override
  String get permTitle => 'Άδειες';

  @override
  String get permIntro =>
      'Το Corvista ζητά μόνο ό,τι χρειάζεται κάθε λειτουργία. Μπορείτε να τα αλλάξετε οποτεδήποτε στις Ρυθμίσεις.';

  @override
  String get permCameraTitle => 'Κάμερα';

  @override
  String get permCameraBody =>
      'Απαραίτητη για ανίχνευση, εγγραφή dashcam και την προβολή στάθμευσης. Το βίντεο επεξεργάζεται στο iPhone σας.';

  @override
  String get permLocationTitle => 'Τοποθεσία';

  @override
  String get permLocationBody =>
      'Χρησιμοποιείται για την ταχύτητα GPS, τον χάρτη, τις διαδρομές, τον καιρό και την επισήμανση των αποθηκευμένων κλιπ. Μόνο όσο χρησιμοποιείτε την εφαρμογή.';

  @override
  String get permMicTitle => 'Μικρόφωνο';

  @override
  String get permSpeechNote =>
      'Η αναγνώριση ομιλίας ζητείται μόνο αν ενεργοποιήσετε την ακύρωση με φωνή για τις ειδοποιήσεις έκτακτης ανάγκης.';

  @override
  String get permRequired => 'Απαραίτητο';

  @override
  String get permOptional => 'Προαιρετικό';

  @override
  String get permAllow => 'Αποδοχή';

  @override
  String get permGranted => 'Επιτρέπεται';

  @override
  String get permDenied => 'Απορρίφθηκε';

  @override
  String get permLimited => 'Περιορισμένη';

  @override
  String get permRestricted => 'Περιορισμένη από το σύστημα';

  @override
  String get permStart => 'Έναρξη οδήγησης';

  @override
  String get permCameraNeeded =>
      'Μπορείτε να συνεχίσετε χωρίς πρόσβαση στην κάμερα, αλλά η ανίχνευση και η εγγραφή δεν θα λειτουργούν μέχρι να την επιτρέψετε στις Ρυθμίσεις.';

  @override
  String get permSetupIntro =>
      'Το Corvista τα χρειάζεται για να λειτουργεί πλήρως. Πατήστε «Αποδοχή όλων» και το iOS θα ζητήσει το καθένα με τη σειρά. Μπορείτε να τα αλλάξετε οποτεδήποτε στις Ρυθμίσεις.';

  @override
  String get permCameraLine =>
      'Απαραίτητη για ανίχνευση, εγγραφή dashcam και την προβολή στάθμευσης. Το βίντεο επεξεργάζεται στο iPhone σας και δεν μεταφορτώνεται ποτέ.';

  @override
  String get permLocationLine =>
      'Ταχύτητα GPS, χάρτης, διαδρομές, καιρός και πού αποθηκεύτηκαν τα κλιπ. Μόνο όσο χρησιμοποιείτε την εφαρμογή.';

  @override
  String get permMicLine =>
      'Ήχος καμπίνας στα κλιπ συμβάντων και ακρόαση της φράσης ακύρωσης κατά τη διάρκεια μιας ειδοποίησης έκτακτης ανάγκης.';

  @override
  String get permSpeechTitle => 'Αναγνώριση ομιλίας';

  @override
  String get permSpeechLine =>
      'Αναγνωρίζει τη φράση ακύρωσης κατά την αντίστροφη μέτρηση έκτακτης ανάγκης, στο iPhone σας όπου υποστηρίζεται.';

  @override
  String get permAllowAll => 'Αποδοχή όλων';

  @override
  String permAsking(String permission) {
    return 'Αίτημα για: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Ορισμένες άδειες είναι απενεργοποιημένες. Ενεργοποιήστε τες στις Ρυθμίσεις για να χρησιμοποιήσετε τις αντίστοιχες λειτουργίες.';

  @override
  String get permNotNow => 'Όχι τώρα';

  @override
  String get tourLabel => 'Ξενάγηση στην οθόνη οδήγησης';

  @override
  String tourProgress(int current, int total) {
    return 'Βήμα $current από $total';
  }

  @override
  String get tourNext => 'Επόμενο';

  @override
  String get tourBack => 'Πίσω';

  @override
  String get tourSkip => 'Παράλειψη ξενάγησης';

  @override
  String get tourFinish => 'Έναρξη οδήγησης';

  @override
  String get tourWelcomeTitle => 'Η σύντομη ξενάγησή σας';

  @override
  String get tourWelcomeBody =>
      'Μια ματιά ενός λεπτού σε ό,τι μετράει στην οθόνη οδήγησης. Ιδανικά με σταθμευμένο όχημα.';

  @override
  String get tourHudTitle => 'Η μπάρα οργάνων';

  @override
  String get tourHudSpeed => 'Η ταχύτητα προέρχεται από το GPS.';

  @override
  String get tourHudRec =>
      'Το REC δείχνει πόσα δευτερόλεπτα υλικού υπάρχουν στη μνήμη.';

  @override
  String get tourHudAi =>
      'Το chip AI δείχνει το μοντέλο, πόσα αντικείμενα βλέπει και μια κουκκίδα: πράσινη σε λειτουργία, πορτοκαλί περιορισμένη, κόκκινη σταματημένη.';

  @override
  String get tourSaveTitle => 'Αποθήκευση συμβάντος';

  @override
  String tourSaveBody(int seconds) {
    return 'Το Corvista κρατά μια κυλιόμενη μνήμη των τελευταίων $seconds δευτερολέπτων βίντεο. Αντικαθίσταται συνεχώς, οπότε τίποτα δεν διατηρείται αν δεν πατήσετε Αποθήκευση. Τα αποθηκευμένα κλιπ μένουν σε αυτό το iPhone, στα Κλιπ.';
  }

  @override
  String get tourRecordTitle => 'Καταγράψτε όλη τη διαδρομή';

  @override
  String get tourRecordBody =>
      'Πατήστε «Εγγραφή» για συνεχή καταγραφή μέχρι να τη διακόψετε. Οι μεγάλες διαδρομές αποθηκεύονται στα Κλιπ σε τμήματα των 5 λεπτών και η «Αποθήκευση συμβάντος» συνεχίζει να λειτουργεί κατά την εγγραφή.';

  @override
  String get tourViewsTitle => 'Πέντε τρόποι να βλέπετε τον δρόμο';

  @override
  String get tourViewDetection =>
      'Ζωντανή κάμερα με πλαίσια γύρω από τα υποστηριζόμενα αντικείμενα.';

  @override
  String get tourViewVirtual =>
      'Μια απλοποιημένη τρισδιάστατη σκηνή που δημιουργείται από τις ανιχνεύσεις.';

  @override
  String get tourViewMap =>
      'Apple Maps με αναζήτηση και καθοδήγηση βήμα προς βήμα.';

  @override
  String get tourViewParking => 'Κάμερα και προβολή εγγύτητας από πάνω.';

  @override
  String get tourViewPerception => 'Μάσκες δρόμου και αντικειμένων.';

  @override
  String get tourMapTitle => 'Αναζήτηση και πλοήγηση βήμα προς βήμα';

  @override
  String get tourMapBody =>
      'Ανοίξτε τον Χάρτη, πατήστε τη γραμμή αναζήτησης και επιλέξτε προορισμό. Διαλέξτε διαδρομή και πατήστε Έναρξη για καθοδήγηση βήμα προς βήμα. Απαιτεί σύνδεση στο διαδίκτυο.';

  @override
  String get tourClipsTitle => 'Κλιπ';

  @override
  String get tourClipsBody =>
      'Ελέγξτε, μετονομάστε, κοινοποιήστε ή διαγράψτε αποθηκευμένα συμβάντα. Τα κλιπ μένουν στο iPhone σας εκτός αν τα κοινοποιήσετε.';

  @override
  String get tourSettingsTitle => 'Ρυθμίσεις';

  @override
  String get tourSettingsBody =>
      'Προσαρμόστε τις φωνητικές ειδοποιήσεις και την ευαισθησία τους, την ποιότητα εγγραφής και το μήκος της μνήμης, και ρυθμίστε τη λειτουργία έκτακτης ανάγκης: μια πειραματική ειδοποίηση πρόσκρουσης με αντίστροφη μέτρηση ακύρωσης.';

  @override
  String get tourSafetyTitle => 'Πριν οδηγήσετε';

  @override
  String get tourSafety1 =>
      'Στερεώστε το iPhone σας σταθερά, εκεί που δεν εμποδίζει την ορατότητά σας.';

  @override
  String get tourSafety2 =>
      'Μην χρησιμοποιείτε την εφαρμογή ενώ οδηγείτε. Κάντε τις ρυθμίσεις με σταθμευμένο όχημα.';

  @override
  String get tourSafety3 =>
      'Οι ανιχνεύσεις και οι ζώνες είναι εκτιμήσεις. Μπορεί να είναι λανθασμένες ή να παραλείπονται.';

  @override
  String get tourSafety4 => 'Παραμένετε υπεύθυνοι για την ασφαλή οδήγηση.';

  @override
  String get helpTakeTour => 'Κάντε την ξενάγηση';

  @override
  String get helpTakeTourSub =>
      'Μια καθοδηγούμενη ματιά ενός λεπτού στην οθόνη οδήγησης.';

  @override
  String get tripsTitle => 'Διαδρομές';

  @override
  String get tripsOpen => 'Ιστορικό διαδρομών';

  @override
  String get tripsEmptyTitle => 'Δεν υπάρχουν διαδρομές ακόμη';

  @override
  String get tripsEmptyBody =>
      'Οι διαδρομές καταγράφονται αυτόματα όσο οδηγείτε με το Corvista — απόσταση, χρόνος, ταχύτητα και η διαδρομή που ακολουθήσατε.';

  @override
  String get tripsDisabledBody =>
      'Το ιστορικό διαδρομών είναι απενεργοποιημένο, επομένως οι νέες διαδρομές δεν καταγράφονται. Ενεργοποιήστε το για να κρατάτε ένα ιδιωτικό αρχείο των διαδρομών σας σε αυτό το iPhone.';

  @override
  String get tripsEnable => 'Ενεργοποίηση ιστορικού διαδρομών';

  @override
  String get tripsToday => 'Σήμερα';

  @override
  String get tripsYesterday => 'Χθες';

  @override
  String tripsRecordingNow(String distance) {
    return 'Καταγραφή διαδρομής · $distance';
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
      other: '$count συμβάντα',
      one: '1 συμβάν',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ειδοποιήσεις',
      one: '1 ειδοποίηση',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count διαδρομές',
      one: '1 διαδρομή',
      zero: 'Καμία διαδρομή',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Απόσταση';

  @override
  String get tripsStatDuration => 'Διάρκεια';

  @override
  String get tripsStatMoving => 'Χρόνος κίνησης';

  @override
  String get tripsStatAvgSpeed => 'Μέση ταχύτητα';

  @override
  String get tripsStatMaxSpeed => 'Μέγιστη ταχύτητα';

  @override
  String get tripsDetections => 'Ανιχνεύσεις';

  @override
  String get tripsNoDetections =>
      'Δεν καταγράφηκαν αντικείμενα του δρόμου σε αυτή τη διαδρομή.';

  @override
  String get tripsTimeline => 'Χρονολόγιο';

  @override
  String get tripsEventStart => 'Η διαδρομή ξεκίνησε';

  @override
  String get tripsEventEnd => 'Η διαδρομή ολοκληρώθηκε';

  @override
  String get tripsEventAlert => 'Φωνητική ειδοποίηση';

  @override
  String get tripsEventIncident => 'Αποθηκεύτηκε κλιπ συμβάντος';

  @override
  String get tripsEventEmergency => 'Εντοπίστηκε πιθανό ατύχημα';

  @override
  String get tripsEventNavStart => 'Η πλοήγηση ξεκίνησε';

  @override
  String get tripsEventArrive => 'Άφιξη στον προορισμό';

  @override
  String get tripsEventReroute => 'Η διαδρομή επανυπολογίστηκε';

  @override
  String get tripsEventRecording => 'Η εγγραφή αποθηκεύτηκε';

  @override
  String get tripsOpenClip => 'Άνοιγμα κλιπ';

  @override
  String get tripsTrackPreview => 'Ίχνος GPS';

  @override
  String get tripsRenameTitle => 'Μετονομασία διαδρομής';

  @override
  String get tripsRenameHint => 'Όνομα διαδρομής';

  @override
  String get tripsFavorite => 'Προσθήκη στα αγαπημένα';

  @override
  String get tripsUnfavorite => 'Αφαίρεση από τα αγαπημένα';

  @override
  String get tripsShareGpx => 'Κοινοποίηση GPX';

  @override
  String get tripsShareFailed =>
      'Δεν ήταν δυνατή η κοινοποίηση αυτής της διαδρομής.';

  @override
  String get tripsDelete => 'Διαγραφή διαδρομής';

  @override
  String get tripsDeleteConfirmTitle => 'Διαγραφή αυτής της διαδρομής;';

  @override
  String get tripsDeleteConfirmBody =>
      'Η διαδρομή και τα στατιστικά θα αφαιρεθούν από αυτό το iPhone. Τα κλιπ συμβάντων αυτής της διαδρομής διατηρούνται.';

  @override
  String get tripsDeleted => 'Η διαδρομή διαγράφηκε';

  @override
  String get tripsNotFound => 'Αυτή η διαδρομή δεν είναι πλέον διαθέσιμη.';

  @override
  String get tripsPrivacyNote =>
      'Αποθηκεύεται μόνο σε αυτό το iPhone. Τίποτα δεν μεταφορτώνεται.';

  @override
  String get settingsSectionTrips => 'Ιστορικό διαδρομών';

  @override
  String get settingsTripLog => 'Καταγραφή διαδρομών';

  @override
  String get settingsTripLogSubtitle =>
      'Κρατά τη διαδρομή και τα στατιστικά οδήγησης μόνο σε αυτό το iPhone.';

  @override
  String get settingsTripRetention => 'Διατήρηση διαδρομών για';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ημέρες',
      one: '1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 έτος';

  @override
  String get settingsRetentionForever => 'Για πάντα';

  @override
  String get settingsTripRetentionFooter =>
      'Οι παλαιότερες διαδρομές διαγράφονται αυτόματα όταν ξεκινά το Corvista.';

  @override
  String get settingsViewTrips => 'Προβολή διαδρομών';

  @override
  String tripsDurationHM(int hours, int minutes) {
    return '$hours ώ. $minutes λ.';
  }

  @override
  String tripsDurationM(int minutes) {
    return '$minutes λ.';
  }

  @override
  String tripsGpxName(String date) {
    return 'Διαδρομή Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Ελευθέρωση χώρου';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Αφαιρεί προσωρινά αρχεία και κρυφή μνήμη. Τα αποθηκευμένα κλιπ και οι διαδρομές διατηρούνται.';

  @override
  String settingsFreedBytes(String size) {
    return 'Ελευθερώθηκαν $size';
  }

  @override
  String get settingsNothingToFree =>
      'Η κρυφή μνήμη εκκαθαρίστηκε — δεν υπάρχουν προσωρινά αρχεία για αφαίρεση.';

  @override
  String get settingsSectionPrivacyData => 'Απόρρητο και δεδομένα';

  @override
  String get settingsPrivacyDataFooter =>
      'Τα κλιπ, οι διαδρομές και οι ρυθμίσεις αποθηκεύονται μόνο σε αυτό το iPhone. Φεύγουν από αυτό μόνο όταν επιλέξετε εσείς να τα μοιραστείτε.';

  @override
  String get settingsDeleteAllData => 'Διαγραφή όλων των δεδομένων';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Διαγραφή κλιπ, διαδρομών, επαφών και ρυθμίσεων από αυτό το iPhone';

  @override
  String get deleteAllTitle => 'Διαγραφή όλων των δεδομένων;';

  @override
  String get deleteAllMessage =>
      'Αυτό αφαιρεί οριστικά από αυτό το iPhone:\n• Κλιπ συμβάντων και μικρογραφίες\n• Ημερολόγιο διαδρομών και ίχνη GPS\n• Επαφές έκτακτης ανάγκης και συμβάντα έκτακτης ανάγκης\n• Αρχεία ανίχνευσης και το διαγνωστικό αρχείο καταγραφής\n• Ρυθμίσεις και πρόσφατους προορισμούς\n• Προσωρινή μνήμη εγγραφής και cache\n\nΗ ενέργεια δεν μπορεί να αναιρεθεί. Στη συνέχεια το Corvista θα ξεκινήσει ξανά από τις οθόνες καλωσορίσματος.';

  @override
  String get deleteAllConfirm => 'Διαγραφή όλων';

  @override
  String get deleteAllInProgress => 'Διαγραφή…';

  @override
  String get deleteAllDone => 'Όλα τα δεδομένα διαγράφηκαν';

  @override
  String get deleteAllPartial =>
      'Ορισμένα στοιχεία δεν μπόρεσαν να διαγραφούν. Δοκιμάστε ξανά από τις Ρυθμίσεις.';

  @override
  String get diagLogSection => 'Διαγνωστικό αρχείο καταγραφής';

  @override
  String get diagLogFooter =>
      'Τα σφάλματα καταγράφονται μόνο σε αυτό το iPhone, χωρίς τοποθεσίες, ονόματα επαφών ή αριθμούς τηλεφώνου. Τίποτα δεν αποστέλλεται, εκτός αν μοιραστείτε εσείς το αρχείο.';

  @override
  String get diagLogShare => 'Κοινοποίηση διαγνωστικού αρχείου';

  @override
  String get diagLogEmpty => 'Κενό';

  @override
  String get diagLogClear => 'Εκκαθάριση αρχείου';

  @override
  String get diagLogClearTitle => 'Εκκαθάριση διαγνωστικού αρχείου;';

  @override
  String get diagLogClearBody =>
      'Οι αποθηκευμένες καταχωρίσεις σφαλμάτων θα διαγραφούν από αυτό το iPhone.';

  @override
  String get diagLogCleared => 'Το διαγνωστικό αρχείο εκκαθαρίστηκε';

  @override
  String get diagLogShareFailed =>
      'Δεν ήταν δυνατή η κοινοποίηση του διαγνωστικού αρχείου.';

  @override
  String get privacyControls2 =>
      'Η επιλογή Ρυθμίσεις › Απόρρητο και δεδομένα › Διαγραφή όλων των δεδομένων διαγράφει κάθε κλιπ, διαδρομή, επαφή, αρχείο καταγραφής και ρύθμιση που έχει αποθηκεύσει το Corvista σε αυτό το iPhone.';

  @override
  String get parkingZoneStop => 'Στοπ';

  @override
  String get parkingZoneVeryClose => 'Πολύ κοντά';

  @override
  String get parkingZoneClose => 'Κοντά';

  @override
  String get parkingZoneNothingClose => 'Δεν εντοπίζεται τίποτα κοντά';

  @override
  String get parkingNotDetected =>
      'Τοίχοι, κολώνες, στύλοι και κράσπεδα δεν ανιχνεύονται';

  @override
  String get parkingApprox => 'περ.';

  @override
  String get parkingSideLeft => 'Αριστερά';

  @override
  String get parkingSideCenter => 'Κέντρο';

  @override
  String get parkingSideRight => 'Δεξιά';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => 'Μόνο εμπρός κάμερα — όχι σύστημα 360°';

  @override
  String get parkingMuteBeeps => 'Σίγαση ήχων';

  @override
  String get parkingUnmuteBeeps => 'Ενεργοποίηση ήχων';

  @override
  String get parkingAbout => 'Σχετικά με την προβολή στάθμευσης';

  @override
  String get parkingLimitationsDetail =>
      'Παρακολουθείται μόνο η περιοχή μπροστά από την κάμερα. Ο ανιχνευτής αναγνωρίζει αυτοκίνητα, λεωφορεία και φορτηγά, ανθρώπους, ποδήλατα και μοτοσικλέτες. Τοίχοι, κολώνες, στύλοι, κράσπεδα, κολωνάκια, μπάρες και χαμηλά εμπόδια ΔΕΝ ανιχνεύονται και το καπό μπορεί να κρύβει το έδαφος αμέσως μπροστά. Οι αποστάσεις είναι χονδρικές εκτιμήσεις από μία κάμερα (μέγεθος και θέση αντικειμένου) και μπορεί να έχουν μεγάλη απόκλιση. Η σιωπή ή το «Δεν εντοπίζεται τίποτα κοντά» δεν σημαίνει ότι η διαδρομή είναι ελεύθερη — κοιτάζετε πάντα γύρω σας και χρησιμοποιείτε τους καθρέφτες.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Εγγύτητα ανά πλευρά: αριστερά $left, κέντρο $center, δεξιά $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Τα σφάλματα γράφονται σε ιδιωτικό αρχείο καταγραφής σε αυτό το iPhone (χωρίς τοποθεσίες, ονόματα επαφών ή αριθμούς τηλεφώνου). Δεν αποστέλλεται ποτέ αυτόματα· μπορείτε να το μοιραστείτε ή να το διαγράψετε στις Ρυθμίσεις › Διαγνωστικά.';
}
