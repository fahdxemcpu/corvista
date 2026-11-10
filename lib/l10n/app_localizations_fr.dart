// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Voyez plus loin à chaque trajet.';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonBack => 'Retour';

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonRetry => 'Réessayer';

  @override
  String get commonOpenSettings => 'Ouvrir les Réglages';

  @override
  String get commonLoading => 'Chargement…';

  @override
  String get commonError => 'Une erreur s\'est produite.';

  @override
  String commonErrorDetail(String message) {
    return 'Une erreur s\'est produite : $message';
  }

  @override
  String get commonOn => 'Activé';

  @override
  String get commonOff => 'Désactivé';

  @override
  String get commonRename => 'Renommer';

  @override
  String get commonShare => 'Partager';

  @override
  String get commonNotAvailable => 'Non disponible';

  @override
  String get commonTestFootage => 'IMAGES DE TEST';

  @override
  String get zoneVeryClose => 'Très proche';

  @override
  String get zoneClose => 'Proche';

  @override
  String get zoneMedium => 'Moyen';

  @override
  String get zoneFar => 'Loin';

  @override
  String get zoneUnknown => 'Inconnu';

  @override
  String get classPerson => 'Personne';

  @override
  String get classBicycle => 'Vélo';

  @override
  String get classMotorcycle => 'Moto';

  @override
  String get classCar => 'Véhicule';

  @override
  String get classBus => 'Bus';

  @override
  String get classTrafficLight => 'Feu tricolore';

  @override
  String get classStopSign => 'Panneau stop';

  @override
  String get viewDetection => 'Détection';

  @override
  String get viewVirtual => 'Virtuel';

  @override
  String get viewMap => 'Carte';

  @override
  String get viewParking => 'Parking';

  @override
  String get viewPerception => 'Perception';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Rouge';

  @override
  String get lightYellow => 'Orange';

  @override
  String get lightGreen => 'Vert';

  @override
  String get lightUnknown => 'Inconnu';

  @override
  String get clipsTitle => 'Clips';

  @override
  String get clipsSelect => 'Sélectionner';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sélectionnés',
      one: '1 sélectionné',
      zero: 'Sélectionner des clips',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Tout sélectionner';

  @override
  String get clipsDeselectAll => 'Tout désélectionner';

  @override
  String get clipsDeleteSelected => 'Supprimer la sélection';

  @override
  String get clipsGridView => 'Vue grille';

  @override
  String get clipsListView => 'Vue liste';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count clips ?',
      one: 'Supprimer ce clip ?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ces vidéos seront définitivement supprimées de votre iPhone. Cette action est irréversible.',
      one: 'La vidéo sera définitivement supprimée de votre iPhone. Cette action est irréversible.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips supprimés',
      one: 'Clip supprimé',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Aucun clip pour l\'instant';

  @override
  String get clipsEmptyBody =>
      'Pendant que vous conduisez, Corvista conserve un court tampon continu. Touchez Enregistrer l\'incident pour garder ici les dernières secondes de vidéo.';

  @override
  String get clipsLoadError => 'Impossible de charger vos clips.';

  @override
  String get clipsStorageTitle => 'Stockage';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Clips $clips · Tampon $buffer · $free libres';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips enregistrés',
      one: '1 clip enregistré',
      zero: 'Aucun clip enregistré',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'L\'espace de stockage de votre iPhone est faible. Les nouveaux incidents pourraient ne pas être enregistrés.';

  @override
  String get clipsMissingFile => 'Fichier manquant';

  @override
  String get clipsEmergencyBadge => 'Impact';

  @override
  String clipsUntitled(String date) {
    return 'Incident · $date';
  }

  @override
  String get clipsAudio => 'Audio enregistré';

  @override
  String get clipsFavorite => 'Favori';

  @override
  String get clipsUnfavorite => 'Retirer des favoris';

  @override
  String get clipsLocation => 'Position enregistrée';

  @override
  String clipsOpenClip(String title) {
    return 'Ouvrir le clip $title';
  }

  @override
  String get playerNotFoundTitle => 'Clip introuvable';

  @override
  String get playerNotFoundBody => 'Ce clip a peut-être été supprimé.';

  @override
  String get playerMissingTitle => 'Fichier vidéo manquant';

  @override
  String get playerMissingBody =>
      'L\'enregistrement de ce clip n\'est plus sur votre iPhone. Vous pouvez retirer l\'entrée de votre galerie.';

  @override
  String get playerRemoveEntry => 'Retirer l\'entrée';

  @override
  String get playerLoadError => 'Impossible de lire cette vidéo.';

  @override
  String get playerPlay => 'Lire';

  @override
  String get playerPause => 'Pause';

  @override
  String get playerReplay => 'Revoir';

  @override
  String get playerRenameTitle => 'Renommer le clip';

  @override
  String get playerRenameHint => 'Nom du clip';

  @override
  String get playerRenamed => 'Clip renommé';

  @override
  String get playerFavorited => 'Ajouté aux favoris';

  @override
  String get playerUnfavorited => 'Retiré des favoris';

  @override
  String get playerShareFailed => 'Impossible de partager ce clip.';

  @override
  String get playerDetails => 'Détails';

  @override
  String get playerDate => 'Enregistré le';

  @override
  String get playerDuration => 'Durée';

  @override
  String get playerResolution => 'Résolution';

  @override
  String get playerSize => 'Taille du fichier';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerAudioYes => 'Enregistré';

  @override
  String get playerAudioNo => 'Non enregistré';

  @override
  String get playerReason => 'Enregistré par';

  @override
  String get playerReasonManual => 'Bouton Enregistrer l\'incident';

  @override
  String get playerReasonEmergency => 'Détection d\'impact possible';

  @override
  String get playerReasonRecovered => 'Récupéré après une interruption';

  @override
  String get playerSpeed => 'Vitesse GPS à l\'enregistrement';

  @override
  String get playerLocation => 'Position';

  @override
  String get playerOpenInMaps => 'Ouvrir dans Plans';

  @override
  String get playerBack => 'Retour';

  @override
  String get playerMore => 'Plus d\'actions';

  @override
  String get clipsFilterLabel => 'Afficher';

  @override
  String get clipsFilterAll => 'Tous';

  @override
  String get clipsFilterRecordings => 'Enregistrements';

  @override
  String get clipsFilterIncidents => 'Incidents';

  @override
  String get clipsFilterEmergency => 'Urgences';

  @override
  String get clipsFilterFavorites => 'Favoris';

  @override
  String get clipsSort => 'Trier';

  @override
  String get clipsSortNewest => 'Plus récents d\'abord';

  @override
  String get clipsSortOldest => 'Plus anciens d\'abord';

  @override
  String get clipsSortLongest => 'Plus longs d\'abord';

  @override
  String get clipsSortLargest => 'Plus volumineux d\'abord';

  @override
  String get clipsToday => 'Aujourd\'hui';

  @override
  String get clipsYesterday => 'Hier';

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
  String get clipsFilterEmpty =>
      'Aucun clip dans cette catégorie pour le moment.';

  @override
  String get clipsFavoritesEmpty =>
      'Ajoutez un clip aux favoris pour le retrouver ici facilement.';

  @override
  String get clipsKindRecording => 'Enregistrement';

  @override
  String get clipsKindIncident => 'Incident';

  @override
  String get clipsKindEmergency => 'Urgence';

  @override
  String get clipsKindTest => 'Test';

  @override
  String clipsTripChip(String time) {
    return 'Trajet · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Ouvrir le trajet pendant lequel ce clip a été enregistré';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used utilisés · $free libres';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Les clips occupent $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count enregistrements',
      one: '1 enregistrement',
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
      other: '$count urgences',
      one: '1 urgence',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Libérer de l\'espace';

  @override
  String get clipsStorageLowGentle =>
      'Moins de 2 Go disponibles. Pour continuer à enregistrer sans problème, libérez de l\'espace ou supprimez les clips dont vous n\'avez plus besoin.';

  @override
  String get clipsSaveToPhotos => 'Enregistrer dans Photos';

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
      other: 'Supprimer $count clips ($size) ?',
      one: 'Supprimer ce clip ($size) ?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Enregistrement de $done sur $total dans Photos…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips enregistrés dans Photos',
      one: 'Enregistré dans Photos',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved enregistrés dans Photos · $failed n\'ont pas pu l\'être';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista n\'est pas autorisé à ajouter des vidéos à Photos. Vous pouvez l\'autoriser dans Réglages.';

  @override
  String get clipsPhotosFailed => 'Impossible d\'enregistrer dans Photos.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips ajoutés aux favoris',
      one: 'Ajouté aux favoris',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips retirés des favoris',
      one: 'Retiré des favoris',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (découpé)';
  }

  @override
  String get playerTrim => 'Couper';

  @override
  String get playerInfo => 'Infos';

  @override
  String get playerKind => 'Type';

  @override
  String get playerReasonRecording => 'Bouton Enregistrer';

  @override
  String get trimTitle => 'Couper le clip';

  @override
  String get trimHint =>
      'Faites glisser les poignées pour choisir la partie à conserver. Le clip d\'origine reste inchangé.';

  @override
  String get trimStartHandle => 'Début de la coupe';

  @override
  String get trimEndHandle => 'Fin de la coupe';

  @override
  String trimSelection(String duration) {
    return 'Sélection : $duration';
  }

  @override
  String get trimSave => 'Enregistrer comme nouveau clip';

  @override
  String get trimSaving => 'Enregistrement du clip coupé…';

  @override
  String get trimSaved => 'Clip coupé enregistré';

  @override
  String get trimOpenNew => 'Ouvrir';

  @override
  String get trimFailed => 'Impossible de couper ce clip.';

  @override
  String get trimStorageFull =>
      'Espace insuffisant pour enregistrer le clip coupé.';

  @override
  String get trimPreview => 'Lire la sélection';

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get settingsSectionCamera => 'Caméra';

  @override
  String get settingsSectionAi => 'IA';

  @override
  String get settingsSectionAlerts => 'Alertes';

  @override
  String get settingsSectionAlertCategories => 'Catégories d\'alertes';

  @override
  String get settingsSectionRecording => 'Enregistrement';

  @override
  String get settingsSectionDriving => 'Conduite';

  @override
  String get settingsSectionPower => 'Énergie';

  @override
  String get settingsSectionEmergency => 'Urgence';

  @override
  String get settingsSectionAppearance => 'Apparence';

  @override
  String get settingsSectionLanguage => 'Langue';

  @override
  String get settingsSectionInformation => 'Informations';

  @override
  String get settingsCameraLens => 'Objectif';

  @override
  String get settingsLensWide => 'Grand-angle';

  @override
  String get settingsLensUltraWide => 'Ultra grand-angle';

  @override
  String get settingsLensTelephoto => 'Téléobjectif';

  @override
  String get settingsLensUnavailable => 'Non disponible sur cet iPhone';

  @override
  String get settingsStabilization => 'Stabilisation';

  @override
  String get settingsStabAuto => 'Automatique';

  @override
  String get settingsStabOff => 'Désactivée';

  @override
  String get settingsStabStandard => 'Standard';

  @override
  String get settingsStabCinematic => 'Cinéma';

  @override
  String get settingsOverlayOpacity => 'Opacité de la surcouche';

  @override
  String get settingsShowFps => 'Afficher les performances';

  @override
  String get settingsShowFpsSubtitle =>
      'Fréquence d\'images et temps d\'inférence dans la vue détection';

  @override
  String get settingsCameraFooter =>
      'Les changements d\'objectif et de stabilisation s\'appliquent au prochain démarrage de la caméra.';

  @override
  String get settingsAiModel => 'Modèle d\'IA';

  @override
  String get settingsConfidence => 'Confiance de détection';

  @override
  String get settingsTracking => 'Suivi des objets';

  @override
  String get settingsTrackingSubtitle =>
      'Stabilise les objets d\'une image à l\'autre';

  @override
  String get settingsShowLabels => 'Afficher les libellés';

  @override
  String get settingsShowConfidence => 'Afficher la confiance';

  @override
  String get settingsSegmentationOpacity => 'Opacité du masque de perception';

  @override
  String get settingsAiFooter =>
      'Une confiance plus basse affiche plus d\'objets, mais aussi plus de fausses détections. Les détections peuvent être inexactes.';

  @override
  String get settingsVoiceAlerts => 'Alertes vocales';

  @override
  String get settingsVoiceLanguage => 'Langue de la voix';

  @override
  String get settingsVoiceLanguageAuto => 'Langue de l\'app';

  @override
  String get settingsVoice => 'Voix';

  @override
  String get settingsVoiceDefault => 'Par défaut du système';

  @override
  String get settingsVoiceQualityEnhanced => 'Améliorée';

  @override
  String get settingsVoiceQualityPremium => 'Haute qualité';

  @override
  String get settingsNoVoices =>
      'Aucune voix n\'est installée pour cette langue. Ajoutez-en une dans Réglages iOS › Accessibilité › Contenu énoncé.';

  @override
  String get settingsAlertPedestrian => 'Piétons';

  @override
  String get settingsAlertCyclist => 'Cyclistes';

  @override
  String get settingsAlertMotorcycle => 'Motos';

  @override
  String get settingsAlertBus => 'Bus';

  @override
  String get settingsAlertVehicleClose => 'Véhicule très proche devant';

  @override
  String get settingsAlertTrafficLight => 'Changements de feu';

  @override
  String get settingsAlertTrafficMoving => 'Circulation qui repart devant';

  @override
  String get settingsAlertStopSign => 'Panneaux stop';

  @override
  String get settingsSensitivity => 'Sensibilité';

  @override
  String get settingsSensitivityLow => 'Faible';

  @override
  String get settingsSensitivityMedium => 'Moyenne';

  @override
  String get settingsSensitivityHigh => 'Élevée';

  @override
  String get settingsCooldown => 'Intervalle de répétition';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Volume de la voix';

  @override
  String get settingsQuietMode => 'Mode discret';

  @override
  String get settingsQuietModeSubtitle =>
      'Seules les alertes essentielles sont énoncées';

  @override
  String get settingsTestVoice => 'Tester la voix';

  @override
  String get settingsTestVoiceDone => 'Lecture d\'une alerte d\'exemple…';

  @override
  String get settingsParkingBeeps => 'Bips de stationnement';

  @override
  String get settingsBeepVolume => 'Volume des bips';

  @override
  String get settingsAlertsFooter =>
      'Les alertes ne sont qu\'une aide. Surveillez toujours la route : l\'absence d\'alerte ne signifie pas que la voie est libre.';

  @override
  String get settingsRecordingProfile => 'Qualité d\'enregistrement';

  @override
  String get settingsProfileStandard => 'Standard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Tampon d\'incident';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds secondes';
  }

  @override
  String get settingsManualMaxLength =>
      'Durée maximale de l\'enregistrement manuel';

  @override
  String get settingsManualMaxUnlimited => 'Illimitée';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Enregistrer l\'audio';

  @override
  String get settingsRecordAudioSubtitle =>
      'Inclut le son de l\'habitacle dans les incidents enregistrés';

  @override
  String get settingsMicDenied =>
      'L\'accès au micro est désactivé. Autorisez-le dans les Réglages pour enregistrer l\'audio.';

  @override
  String get settingsWatermark => 'Filigrane Corvista';

  @override
  String get settingsTimestamp => 'Horodatage date et heure';

  @override
  String get settingsSaveLocation => 'Enregistrer la position avec les clips';

  @override
  String get settingsStorage => 'Stockage et clips';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips',
      one: '1 clip',
      zero: 'Aucun clip',
    );
    return '$_temp0 · $used utilisés · $free libres';
  }

  @override
  String get settingsRecordingFooter =>
      'Le tampon continu reste sur votre iPhone et est écrasé en permanence. Rien n\'est enregistré en arrière-plan.';

  @override
  String get settingsDefaultView => 'Vue par défaut';

  @override
  String get settingsUnits => 'Unités';

  @override
  String get settingsShowCompass => 'Afficher la boussole';

  @override
  String get settingsHudStyle => 'Style de l\'affichage tête haute';

  @override
  String get settingsHudCustomize => 'Personnaliser l\'affichage';

  @override
  String get settingsDrivingSide => 'Côté de conduite';

  @override
  String get settingsDrivingSideAuto => 'Automatique';

  @override
  String get settingsDrivingSideRight => 'Droite';

  @override
  String get settingsDrivingSideLeft => 'Gauche';

  @override
  String get settingsVirtualStyle => 'Style de la vue virtuelle';

  @override
  String get settingsVirtualMinimal => 'Minimal';

  @override
  String get settingsVirtualPerspective => 'Perspective';

  @override
  String get settingsVirtualHighContrast => 'Contraste élevé';

  @override
  String get settingsKeepScreenOn => 'Garder l\'écran allumé en conduisant';

  @override
  String get settingsLiveActivity => 'Activité en direct';

  @override
  String get settingsLiveActivityDesc =>
      'Afficher le guidage sur l\'écran verrouillé et dans la Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Enregistrement en pause pendant que Corvista était en arrière-plan';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'En pause';

  @override
  String get liveActivityDashcamOff => 'Caméra off';

  @override
  String get liveActivityEnded => 'Navigation terminée';

  @override
  String get liveActivityEta => 'Arrivée';

  @override
  String get settingsAutoRecenter => 'Recentrage auto de la carte';

  @override
  String get settingsHudStyleClassic => 'Classique';

  @override
  String get settingsHudStyleGrid => 'Grille';

  @override
  String get settingsHudStyleMinimal => 'Minimal';

  @override
  String get settingsHudStylePerformance => 'Performance';

  @override
  String get settingsHudStyleNavigation => 'Navigation';

  @override
  String get settingsHudStyleNight => 'Nuit';

  @override
  String get settingsHudStyleHighContrast => 'Contraste élevé';

  @override
  String get settingsPowerMode => 'Mode d\'énergie';

  @override
  String get settingsPowerBalanced => 'Équilibré';

  @override
  String get settingsPowerPerformance => 'Performance';

  @override
  String get settingsPowerSaver => 'Économie';

  @override
  String get settingsPowerFooter =>
      'Corvista réduit automatiquement la cadence de l\'IA et les effets visuels lorsque votre iPhone chauffe ou que la batterie est faible.';

  @override
  String get settingsThermal => 'État thermique';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Chaud';

  @override
  String get settingsThermalSerious => 'Très chaud';

  @override
  String get settingsThermalCritical => 'Critique';

  @override
  String get settingsBattery => 'Batterie';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · En charge';
  }

  @override
  String get settingsLowPowerMode =>
      'Le mode économie d\'énergie est activé : l\'IA fonctionne à cadence réduite.';

  @override
  String get settingsAiRate => 'Cadence actuelle de l\'IA';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Détection d\'impact';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Activée · compte à rebours de $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Fonction expérimentale. Ne remplace pas les services d\'urgence.';

  @override
  String get settingsTheme => 'Thème';

  @override
  String get settingsThemeSystem => 'Système';

  @override
  String get settingsThemeDark => 'Sombre';

  @override
  String get settingsThemeLight => 'Clair';

  @override
  String get settingsReduceMotion => 'Réduire les animations';

  @override
  String get settingsReduceMotionSubtitle =>
      'Limite les animations dans toute l\'app';

  @override
  String get settingsAppLanguage => 'Langue de l\'app';

  @override
  String get settingsPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get settingsTerms => 'Conditions d\'utilisation';

  @override
  String get settingsHelp => 'Aide';

  @override
  String get settingsSupport => 'Contacter l\'assistance';

  @override
  String get settingsLicenses => 'Licences open source';

  @override
  String get settingsSupportUnavailable =>
      'Impossible d\'ouvrir Mail. Écrivez à support@corvista.app.';

  @override
  String get settingsSafety => 'Informations de sécurité';

  @override
  String get settingsDiagnostics => 'Diagnostics';

  @override
  String get settingsVersion => 'Version';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Personnaliser l\'affichage';

  @override
  String get hudCustomPreview => 'Aperçu · valeurs d\'exemple';

  @override
  String get hudCustomStyle => 'Style';

  @override
  String get hudCustomElements => 'Éléments';

  @override
  String get hudCustomSpeed => 'Vitesse';

  @override
  String get hudCustomHeading => 'Cap et boussole';

  @override
  String get hudCustomClock => 'Horloge';

  @override
  String get hudCustomBattery => 'Batterie et température';

  @override
  String get hudCustomDetections => 'État de l\'IA et détections';

  @override
  String get hudCustomWeather => 'Météo';

  @override
  String get hudCustomAppearance => 'Taille et opacité';

  @override
  String get hudCustomSize => 'Taille';

  @override
  String get hudCustomOpacity => 'Opacité';

  @override
  String get hudCustomFooter =>
      'Les avertissements, comme la surchauffe, restent toujours affichés, même si des éléments sont masqués.';

  @override
  String get hudCustomDescClassic => 'Tableau de bord équilibré';

  @override
  String get hudCustomDescGrid => 'Grille en perspective sur la route';

  @override
  String get hudCustomDescMinimal => 'Uniquement la vitesse';

  @override
  String get hudCustomDescPerformance => 'Arc de vitesse et mesures en direct';

  @override
  String get hudCustomDescNavigation => 'Prochaine manœuvre en premier';

  @override
  String get hudCustomDescNight =>
      'Tamisé et rougeâtre pour la conduite de nuit';

  @override
  String get hudCustomDescHighContrast => 'Lisibilité maximale en plein soleil';

  @override
  String get languageTitle => 'Langue';

  @override
  String get languageSystem => 'Par défaut du système';

  @override
  String get languageSystemSubtitle => 'Suivre la langue de votre iPhone';

  @override
  String get languageFooter =>
      'D\'autres langues arrivent. La langue des alertes vocales se règle séparément dans Alertes.';

  @override
  String get diagTitle => 'Diagnostics';

  @override
  String get diagPerformance => 'Performance';

  @override
  String get diagInference => 'Temps d\'inférence';

  @override
  String get diagDetectHz => 'Cadence de détection';

  @override
  String get diagCameraFps => 'Fréquence d\'images de la caméra';

  @override
  String get diagMemory => 'Mémoire';

  @override
  String get diagDropped => 'Images perdues';

  @override
  String get diagSegmentation => 'Temps de segmentation';

  @override
  String get diagCamera => 'Caméra';

  @override
  String get diagStatus => 'État';

  @override
  String get diagSource => 'Source';

  @override
  String get diagSourceCamera => 'Caméra en direct';

  @override
  String get diagSourceFile => 'Fichier d\'images de test';

  @override
  String get diagResolution => 'Taille du tampon';

  @override
  String get diagLens => 'Objectif';

  @override
  String get diagError => 'Dernière erreur';

  @override
  String get diagModel => 'Modèle d\'IA';

  @override
  String get diagModelLoad => 'Temps de chargement du modèle';

  @override
  String get diagPower => 'Énergie';

  @override
  String get diagSegHz => 'Cadence de segmentation';

  @override
  String get diagReduced => 'Effets réduits';

  @override
  String diagMs(String value) {
    return '$value ms';
  }

  @override
  String diagFps(String value) {
    return '$value i/s';
  }

  @override
  String diagMb(String value) {
    return '$value Mo';
  }

  @override
  String get diagCamIdle => 'Inactive';

  @override
  String get diagCamStarting => 'Démarrage';

  @override
  String get diagCamRunning => 'En cours';

  @override
  String get diagCamInterrupted => 'Interrompue';

  @override
  String get diagCamStopped => 'Arrêtée';

  @override
  String get diagCamUnavailable => 'Indisponible';

  @override
  String get diagCamPermissionDenied => 'Autorisation refusée';

  @override
  String get diagCamError => 'Erreur';

  @override
  String get diagTestFootage => 'Images de test';

  @override
  String get diagTestFootageBody =>
      'Exécute une vraie détection sur l\'appareil à partir d\'un fichier vidéo local, à la place de la caméra. Chaque vue l\'indique par IMAGES DE TEST.';

  @override
  String get diagPathLabel => 'Chemin du fichier vidéo';

  @override
  String get diagPathHint => '/chemin/vers/trajet.mp4';

  @override
  String get diagUseDocuments => 'Utiliser Documents/test_drive.mp4';

  @override
  String get diagRun => 'Lancer les images de test';

  @override
  String get diagRunStarted =>
      'Images de test lancées. Ouvrez la vue conduite pour les voir.';

  @override
  String get diagBackToCamera => 'Revenir à la caméra en direct';

  @override
  String get diagDebugOnly =>
      'Les images de test ne sont disponibles que dans les versions de développement.';

  @override
  String get diagFileMissing => 'Aucun fichier à cet emplacement.';

  @override
  String get emergencySetupTitle => 'Détection d\'impact';

  @override
  String get emergencyExperimental => 'Expérimental';

  @override
  String get emergencyIntro =>
      'Pendant un trajet, Corvista peut surveiller un éventuel impact violent grâce aux capteurs de mouvement de votre iPhone. S\'il en détecte un, un compte à rebours démarre. Si vous ne l\'annulez pas, Corvista propose d\'appeler les services d\'urgence et d\'envoyer un message à vos contacts.';

  @override
  String get emergencyDisclaimer1 =>
      'Ne remplace ni les services d\'urgence ni la détection d\'accident intégrée à votre véhicule.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS vous demande toujours de confirmer avant qu\'un appel soit passé ou qu\'un message soit envoyé.';

  @override
  String get emergencyDisclaimer3 =>
      'Des impacts peuvent passer inaperçus, et un freinage brusque ou des secousses peuvent être pris pour un impact.';

  @override
  String get emergencyParkedWarning =>
      'Terminez cette configuration à l\'arrêt. Les réglages sont verrouillés lorsque le véhicule roule.';

  @override
  String get emergencyEnable => 'Activer la détection d\'impact';

  @override
  String get emergencyEnableSubtitle =>
      'Actif uniquement pendant une session de conduite';

  @override
  String get emergencyNeedNumber => 'Ajoutez d\'abord un numéro d\'urgence.';

  @override
  String get emergencyContacts => 'Contacts d\'urgence';

  @override
  String get emergencyAddContact => 'Ajouter un contact';

  @override
  String get emergencyNoContacts =>
      'Aucun contact pour l\'instant. Les contacts ne reçoivent un message qu\'après votre confirmation.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Retirer $name ?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Cette personne ne sera plus proposée comme destinataire après un impact.';

  @override
  String get emergencyRemove => 'Retirer';

  @override
  String get emergencyContactsError => 'Impossible de charger les contacts.';

  @override
  String get emergencyNumber => 'Numéro d\'urgence';

  @override
  String get emergencyNumberHint => 'p. ex. 112 ou 911';

  @override
  String get emergencyMessage => 'Modèle de message';

  @override
  String get emergencyMessageDefault =>
      'J\'ai peut-être eu un accident de la route. Ce message a été préparé par Corvista et inclut ma dernière position connue, si elle est disponible.';

  @override
  String get emergencyMessageHint =>
      'Laissez vide pour utiliser le message par défaut.';

  @override
  String get emergencyCountdown => 'Durée du compte à rebours';

  @override
  String get emergencyVoiceCancel => 'Annuler par la voix';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Dites « Ça va » ou « Annuler » pendant le compte à rebours. Utilise la reconnaissance vocale sur l\'appareil lorsqu\'elle est disponible.';

  @override
  String get emergencyVoicePermDenied =>
      'L\'accès au micro et à la reconnaissance vocale est nécessaire pour l\'annulation vocale.';

  @override
  String get emergencyAutoSave =>
      'Enregistrer automatiquement le clip de l\'incident';

  @override
  String get emergencyTest => 'Tester le compte à rebours (sans appel)';

  @override
  String get emergencyTestBody =>
      'Lance un impact simulé pour vous montrer le compte à rebours. Aucun appel ni message n\'est jamais effectué en mode test.';

  @override
  String get emergencyNotSet => 'Non défini';

  @override
  String get emergencyAlertHeadline => 'Impact violent possible détecté.';

  @override
  String get emergencyAlertSubtitle => 'Tout va bien ?';

  @override
  String get emergencyAlertCancel => 'Ça va — Annuler';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds secondes restantes',
      one: '1 seconde restante',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Écoute en cours — dites « Ça va » pour annuler';

  @override
  String emergencyAlertHeard(String text) {
    return 'Entendu : « $text »';
  }

  @override
  String get emergencyAlertEscalated =>
      'Aucune réponse. Choisissez une action :';

  @override
  String get emergencyAlertCall => 'Appeler les services d\'urgence';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Appelle le $number. iOS vous demande de confirmer.';
  }

  @override
  String get emergencyAlertMessage => 'Écrire aux contacts';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Ouvre un message préparé. Vous choisissez de l\'envoyer ou non.';

  @override
  String get emergencyAlertTestMode => 'Mode test — aucun appel ne sera passé';

  @override
  String get emergencyAlertTestBadge => 'TEST';

  @override
  String get emergencyAlertClose => 'Ça va — Fermer';

  @override
  String get emergencyMsgSent => 'Message envoyé.';

  @override
  String get emergencyMsgCancelled => 'Message non envoyé.';

  @override
  String get emergencyMsgFailed => 'Impossible d\'envoyer le message.';

  @override
  String get emergencyMsgUnavailable =>
      'La messagerie n\'est pas disponible sur cet appareil.';

  @override
  String emergencyCallFailed(String number) {
    return 'Impossible de lancer l\'appel. Composez vous-même le $number.';
  }

  @override
  String get modelsTitle => 'Modèles d\'IA';

  @override
  String get modelsIntro =>
      'Tous les modèles sont inclus dans l\'app et s\'exécutent entièrement sur votre iPhone. Le flux de votre caméra ne quitte jamais l\'appareil.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'En direct : $ms ms par image · $hz détections/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Chargé en $ms ms';
  }

  @override
  String get modelsEfficientName => 'Efficace';

  @override
  String get modelsEfficientDesc =>
      'Détecteur rapide et compact, adapté aux longs trajets avec peu de chaleur et de consommation.';

  @override
  String get modelsEnhancedName => 'Amélioré';

  @override
  String get modelsEnhancedDesc =>
      'Détecteur plus grand qui repère des objets plus petits et plus lointains, pour une consommation plus élevée.';

  @override
  String get modelsSegmentationName => 'Segmentation';

  @override
  String get modelsSegmentationDesc =>
      'Associe détection rapide et masques de la chaussée et des objets pour la vue Perception.';

  @override
  String get modelsNoneName => 'IA en pause';

  @override
  String get modelsNoneDesc =>
      'La caméra et l\'enregistrement continuent sans détection d\'objets. Consommation minimale.';

  @override
  String get modelsGenericDesc =>
      'Modèle de détection d\'objets sur l\'appareil.';

  @override
  String get modelsFunctionDetection =>
      'Détecte véhicules, personnes, vélos, motos, bus, feux tricolores et panneaux stop';

  @override
  String get modelsFunctionSegmentation =>
      'Ajoute des masques de la chaussée et des objets';

  @override
  String get modelsFunctionNone =>
      'Aucune détection ; enregistrement dashcam uniquement';

  @override
  String get modelsSize => 'Taille';

  @override
  String get modelsInput => 'Entrée';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Compatible avec';

  @override
  String get modelsStatusInstalled => 'Installé (inclus)';

  @override
  String get modelsStatusNotInstalled => 'Non installé';

  @override
  String get modelsSelected => 'Sélectionné';

  @override
  String get modelsUse => 'Utiliser ce modèle';

  @override
  String get modelsSwitching => 'Chargement du modèle…';

  @override
  String modelsSwitched(String name) {
    return '$name est maintenant actif';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Mesuré sur cet appareil : $ms ms en moyenne';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Non mesuré sur cet appareil';

  @override
  String get modelsBenchmarkRun => 'Lancer le test de performance';

  @override
  String get modelsBenchmarkRunning => 'Test en cours…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Sélectionnez ce modèle pour le tester.';

  @override
  String get modelsBenchmarkDone => 'Test terminé';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Échec du test : $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Dernière mise à jour : $date';
  }

  @override
  String get safetyTitle => 'Informations de sécurité';

  @override
  String get safetyIntro =>
      'Corvista est une aide à la vigilance au volant. Il ne contrôle pas votre véhicule et ne peut remplacer ni votre attention, ni votre jugement, ni les systèmes de sécurité du véhicule.';

  @override
  String get safetyBeforeTitle => 'Avant de conduire';

  @override
  String get safetyBefore1 =>
      'Fixez solidement votre iPhone dans une position légale qui ne gêne ni votre vue, ni les airbags, ni les commandes.';

  @override
  String get safetyBefore2 =>
      'Terminez la configuration, choisissez une vue et définissez votre destination à l\'arrêt.';

  @override
  String get safetyBefore3 =>
      'Branchez un chargeur pour les longs trajets et, si possible, gardez l\'iPhone à l\'abri du soleil direct.';

  @override
  String get safetyWhileTitle => 'En conduisant';

  @override
  String get safetyWhile1 =>
      'Gardez les yeux sur la route. N\'utilisez les grandes commandes à l\'écran que lorsque c\'est sûr et légal.';

  @override
  String get safetyWhile2 =>
      'Les alertes sont des aides, pas des avertissements sur lesquels vous pouvez compter. L\'absence d\'alerte ne signifie jamais que la voie est libre.';

  @override
  String get safetyWhile3 =>
      'Respectez le code de la route, les signaux et la signalisation — et non l\'app — en cas de désaccord.';

  @override
  String get safetyLimitsTitle => 'Limites';

  @override
  String get safetyLimits1 =>
      'La caméra d\'un seul téléphone ne voit que ce qui se trouve devant elle. Les objets hors de son champ, masqués ou très proches ne sont pas détectés.';

  @override
  String get safetyLimits2 =>
      'Des détections peuvent être manquées, tardives ou erronées, surtout de nuit, sous la pluie, dans le brouillard, en cas d\'éblouissement ou avec un pare-brise sale.';

  @override
  String get safetyLimits3 =>
      'Seules les catégories prises en charge sont reconnues : véhicules, bus, motos, vélos, personnes, feux tricolores et panneaux stop. Les repères de voie de la vue virtuelle sont stylisés et ne correspondent pas à des voies détectées.';

  @override
  String get safetyLimits4 =>
      'La proximité est indiquée par des zones approximatives (Très proche, Proche, Moyen, Loin), jamais par des distances mesurées. La vue parking ne remplace pas des capteurs de stationnement.';

  @override
  String get safetyHeatTitle => 'Chaleur et batterie';

  @override
  String get safetyHeat1 =>
      'L\'utilisation continue de la caméra et de l\'IA fait chauffer votre iPhone. Corvista réduit la cadence d\'analyse lorsque l\'appareil chauffe et affiche un avertissement ; en cas de surchauffe d\'iOS, la caméra peut s\'arrêter.';

  @override
  String get safetyEmergencyTitle => 'Fonction d\'urgence';

  @override
  String get safetyEmergency1 =>
      'La détection d\'impact possible est expérimentale. Elle peut manquer de vrais accidents et être déclenchée par d\'autres événements.';

  @override
  String get safetyEmergency2 =>
      'Elle ne contacte jamais personne en silence : iOS vous demande toujours de confirmer un appel ou un message. Elle ne remplace pas un appel aux services d\'urgence de votre part.';

  @override
  String get privacyTitle => 'Confidentialité';

  @override
  String get privacyIntro =>
      'Corvista est conçu pour garder vos données de conduite sur votre iPhone. Il n\'existe pas de compte Corvista, et Corvista n\'exploite pas ses propres serveurs.';

  @override
  String get privacyCameraTitle => 'Caméra et IA';

  @override
  String get privacyCamera1 =>
      'La détection, le suivi et la segmentation des objets s\'exécutent entièrement sur votre iPhone. Les images de la caméra ne sont jamais envoyées.';

  @override
  String get privacyCamera2 =>
      'La caméra ne fonctionne que lorsque Corvista est ouvert à l\'écran. Elle se met en pause lorsque l\'app passe en arrière-plan — il n\'y a aucun enregistrement caché en arrière-plan.';

  @override
  String get privacyRecordingsTitle => 'Enregistrements';

  @override
  String get privacyRecordings1 =>
      'Le tampon continu est temporaire et écrasé en permanence. Les images ne sont conservées que si vous touchez Enregistrer l\'incident ou, si vous l\'activez, après un impact possible.';

  @override
  String get privacyRecordings2 =>
      'Les clips enregistrés restent dans l\'espace privé de Corvista sur votre iPhone. Ils ne quittent l\'appareil que si vous choisissez Partager. La suppression de l\'app les supprime.';

  @override
  String get privacyRecordings3 =>
      'L\'audio n\'est enregistré que si vous l\'activez et accordez l\'accès au micro.';

  @override
  String get privacyLocationTitle => 'Position';

  @override
  String get privacyLocation1 =>
      'La position est utilisée lorsque l\'app est ouverte pour votre vitesse, la carte, les itinéraires et la météo. Si « Enregistrer la position » est activé, la position au moment de l\'enregistrement est stockée avec le clip sur votre appareil.';

  @override
  String get privacyNetworkTitle => 'Services réseau';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — affichage de la carte, recherche de lieux et itinéraires. Votre texte de recherche et votre position approximative sont envoyés à Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — météo actuelle et horaire pour votre position.';

  @override
  String get privacyNetwork4 =>
      'Corvista ne contient ni publicité, ni outil d\'analyse ou de suivi tiers.';

  @override
  String get privacyEmergencyTitle => 'Contacts d\'urgence';

  @override
  String get privacyEmergency1 =>
      'Les contacts que vous choisissez sont stockés dans le trousseau iOS de cet appareil. L\'annulation vocale utilise la reconnaissance vocale sur l\'appareil lorsqu\'elle est disponible. Les appels et messages ne sont envoyés qu\'après votre confirmation dans iOS.';

  @override
  String get privacyControlsTitle => 'Vos contrôles';

  @override
  String get privacyControls1 =>
      'Vous pouvez supprimer des clips à tout moment dans Clips, et modifier ou révoquer l\'accès à la caméra, au micro, à la position et à la reconnaissance vocale dans les Réglages iOS.';

  @override
  String get termsTitle => 'Conditions d\'utilisation';

  @override
  String get termsIntro =>
      'En utilisant Corvista, vous acceptez ces conditions. Le contrat de licence d\'utilisateur final standard d\'Apple pour les applications sous licence s\'applique également.';

  @override
  String get termsUseTitle => 'Utiliser Corvista';

  @override
  String get termsUse1 =>
      'Corvista est une aide à la vigilance au volant et une dashcam. Vous restez entièrement responsable d\'une conduite sûre et conforme à la loi en toutes circonstances.';

  @override
  String get termsUse2 =>
      'N\'interagissez pas avec l\'app d\'une manière qui vous distrait en conduisant. Fixez l\'appareil solidement et dans le respect de la loi.';

  @override
  String get termsAccuracyTitle => 'Aucune garantie d\'exactitude';

  @override
  String get termsAccuracy1 =>
      'Les détections, zones, alertes, repères sur la carte, itinéraires et données météo peuvent être incomplets, tardifs ou erronés. Corvista ne contrôle pas votre véhicule.';

  @override
  String get termsAccuracy2 =>
      'La fonction d\'urgence est expérimentale et peut ne pas détecter un impact ou se déclencher à tort.';

  @override
  String get termsRecordingTitle => 'Législation sur l\'enregistrement';

  @override
  String get termsRecording1 =>
      'Les lois sur les dashcams, l\'enregistrement audio et le fait de filmer des personnes varient selon les pays et les régions. Il vous appartient de les respecter, y compris lorsque vous partagez des clips.';

  @override
  String get termsLiabilityTitle => 'Responsabilité';

  @override
  String get termsLiability1 =>
      'L\'app est fournie « en l\'état ». Dans la mesure permise par la loi, le développeur n\'est pas responsable des accidents, pertes, amendes ou dommages résultant de son utilisation ou de la confiance accordée à ses résultats.';

  @override
  String get termsChangesTitle => 'Modifications';

  @override
  String get termsChanges1 =>
      'Ces conditions peuvent être mises à jour avec les nouvelles versions de l\'app. Continuer à l\'utiliser après une mise à jour vaut acceptation des conditions révisées.';

  @override
  String get helpTitle => 'Aide';

  @override
  String get helpIntro =>
      'Réponses aux questions courantes. Pour les consignes de sécurité, consultez Informations de sécurité.';

  @override
  String get helpQSave => 'Comment conserver les images d\'un incident ?';

  @override
  String get helpASaveBuffer =>
      'Touchez le grand bouton Enregistrer l\'incident dans la vue de conduite. Corvista enregistre dans Clips les 20 ou 30 dernières secondes de son tampon continu (votre choix dans Réglages › Enregistrement).';

  @override
  String get helpQWhere => 'Où sont stockés mes clips ?';

  @override
  String get helpAWhere =>
      'Dans l\'espace privé de Corvista sur votre iPhone. Ils ne sont jamais envoyés. Utilisez Partager dans le lecteur pour envoyer ou exporter un clip.';

  @override
  String get helpQZones => 'Quelle est la précision des zones de proximité ?';

  @override
  String get helpAZones =>
      'Les zones sont des estimations approximatives issues d\'une seule caméra, d\'après la taille habituelle des objets. Considérez-les comme des indications approximatives, jamais comme des distances.';

  @override
  String get helpQSlow => 'Pourquoi la détection ralentit-elle ?';

  @override
  String get helpASlow =>
      'Lorsque votre iPhone chauffe, que la batterie est faible ou que le mode économie d\'énergie est activé, Corvista réduit la cadence d\'analyse pour protéger l\'appareil. Vous pouvez changer le mode d\'énergie dans les Réglages.';

  @override
  String get helpQMap =>
      'La carte, la recherche ou la météo ne fonctionne pas.';

  @override
  String get helpAMap =>
      'Ces fonctions nécessitent une connexion internet et l\'accès à la position. Vérifiez votre connexion et autorisez la position pour Corvista dans les Réglages iOS.';

  @override
  String get helpQSimulator => 'La caméra apparaît comme indisponible.';

  @override
  String get helpASimulator =>
      'Vérifiez que l\'accès à la caméra est autorisé dans les Réglages iOS et qu\'aucune autre app n\'utilise la caméra. Le simulateur iOS n\'a pas de caméra ; une vidéo de test locale peut être utilisée à la place.';

  @override
  String get emergencyMsgNoContacts =>
      'Ajoutez d\'abord un contact d\'urgence.';

  @override
  String get cameraStarting => 'Démarrage de la caméra…';

  @override
  String get cameraInterrupted => 'Caméra en pause';

  @override
  String get cameraInterruptedBody =>
      'iOS a mis la caméra en pause, par exemple pendant un appel ou lorsqu\'une autre app l\'utilise. Elle reprend automatiquement.';

  @override
  String get cameraUnavailable => 'Caméra indisponible';

  @override
  String get cameraUnavailableBody =>
      'Aucune caméra n\'est disponible sur cet appareil. La détection, l\'enregistrement et les vues parking nécessitent la caméra arrière.';

  @override
  String get cameraRunTestFootage => 'Lancer les images de test';

  @override
  String get cameraPermissionDenied => 'L\'accès à la caméra est désactivé';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista a besoin de la caméra pour la détection, l\'enregistrement dashcam et les vues parking. Activez l\'accès à la caméra dans les Réglages.';

  @override
  String get cameraError => 'Erreur de caméra';

  @override
  String get cameraStopped => 'Caméra arrêtée';

  @override
  String get cameraStart => 'Démarrer la caméra';

  @override
  String get cameraFocusHint => 'Touchez pour faire la mise au point';

  @override
  String get cameraPreviewLabel =>
      'Vue caméra en direct avec les objets détectés';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Caméra $fps i/s · IA $hz Hz · $ms ms · perdues $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Vitesse $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Pas de vitesse GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Cap $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Tampon d\'enregistrement dashcam, $seconds secondes sur $target en mémoire';
  }

  @override
  String get hudRecIdle => 'REC désactivé';

  @override
  String get hudRecSaving => 'Enregistrement…';

  @override
  String get hudRecError => 'Erreur REC';

  @override
  String get hudAiPaused => 'IA en pause';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objets',
      one: '1 objet',
      zero: 'Aucun objet',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objets détectés',
      one: '1 objet détecté',
      zero: 'aucun objet détecté',
    );
    return 'Modèle d\'IA $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Chaud — IA ralentie';

  @override
  String get hudThermalCritical => 'Trop chaud — IA en pause';

  @override
  String hudBatteryLow(String percent) {
    return 'Batterie $percent';
  }

  @override
  String get hudLowPower => 'Mode économie d\'énergie';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Météo $temperature, $condition. Touchez pour les détails.';
  }

  @override
  String get hudNoGuidance =>
      'Recherchez une destination dans la vue Carte pour voir ici le guidage pas à pas.';

  @override
  String get navArrived => 'Vous êtes arrivé';

  @override
  String get navRerouting => 'Recalcul de l\'itinéraire…';

  @override
  String get navSearchHint => 'Rechercher une destination';

  @override
  String get navSearchFieldHint => 'Adresse, lieu ou commerce';

  @override
  String get navNoResults => 'Aucun lieu correspondant';

  @override
  String get navSearching => 'Recherche…';

  @override
  String get navSearchStartTyping =>
      'Saisissez une adresse ou un nom de lieu. Les résultats proviennent d\'Apple Maps et nécessitent une connexion internet.';

  @override
  String get navErrorUnavailable =>
      'Recherche et itinéraires indisponibles — vérifiez votre connexion internet.';

  @override
  String get navErrorNoLocation =>
      'En attente de votre position pour calculer un itinéraire.';

  @override
  String get navErrorPermission =>
      'L\'accès à la position est désactivé : les itinéraires ne peuvent pas partir de votre position.';

  @override
  String navErrorGeneric(String code) {
    return 'Impossible de charger les itinéraires ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Itinéraires vers $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Arrivée $time';
  }

  @override
  String get navStart => 'Démarrer';

  @override
  String get navEnd => 'Terminer';

  @override
  String get navEndLabel => 'Terminer la navigation';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration restantes';
  }

  @override
  String navAdvisory(String text) {
    return 'Avis : $text';
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
    return 'Itinéraire $index : $name';
  }

  @override
  String get weatherTitle => 'Météo';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Ressenti $temperature';
  }

  @override
  String get weatherPrecipitation => 'Précipitations';

  @override
  String get weatherWind => 'Vent';

  @override
  String get weatherVisibility => 'Visibilité';

  @override
  String get weatherHumidity => 'Humidité';

  @override
  String get weatherHourly => 'Prochaines heures';

  @override
  String weatherAsOf(String time) {
    return 'Mis à jour $time';
  }

  @override
  String get weatherRefresh => 'Actualiser la météo';

  @override
  String get weatherUnavailable => 'La météo est indisponible pour le moment.';

  @override
  String get weatherNoLocation => 'La météo nécessite votre position.';

  @override
  String get weatherLegal => 'Sources de données et mentions légales';

  @override
  String weatherProvidedBy(String service) {
    return 'Données météo : $service';
  }

  @override
  String get weatherNow => 'Maintenant';

  @override
  String get virtualEmpty => 'Aucun objet pris en charge détecté';

  @override
  String get virtualEmptyCameraOff =>
      'La vue virtuelle nécessite la caméra en direct.';

  @override
  String get virtualLaneDisclaimer =>
      'Les lignes de voie sont illustratives, non détectées.';

  @override
  String virtualNearest(String zone) {
    return 'Plus proche : $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Scène routière virtuelle : $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'IA $status';
  }

  @override
  String get virtualStatusLive => 'active';

  @override
  String get virtualStatusPaused => 'en pause';

  @override
  String get virtualStatusCameraOff => 'Caméra désactivée';

  @override
  String get virtualStatusTestFootage => 'Images de test';

  @override
  String get virtualEmptyHint =>
      'Les véhicules, personnes, vélos, feux et panneaux stop apparaissent ici lorsqu\'ils sont détectés.';

  @override
  String get mapRecenter => 'Recentrer';

  @override
  String get mapZoomIn => 'Zoom avant';

  @override
  String get mapZoomOut => 'Zoom arrière';

  @override
  String get mapUnsupported =>
      'La carte interactive est disponible sur iPhone.';

  @override
  String get mapObjectsApprox =>
      'Les repères d\'objets sont des positions approximatives.';

  @override
  String get mapWeatherUnavailable => 'Météo indisponible';

  @override
  String get navErrorNoRoute =>
      'Aucun itinéraire trouvé vers cette destination.';

  @override
  String get navDismiss => 'Ignorer';

  @override
  String get navGo => 'Y aller';

  @override
  String get navFastest => 'Le plus rapide';

  @override
  String get navThen => 'Puis';

  @override
  String get navRecents => 'Récents';

  @override
  String get navClearRecents => 'Effacer';

  @override
  String get navSearchSubmitHint =>
      'Appuyez sur Rechercher pour voir tous les lieux correspondants';

  @override
  String get navPlaces => 'Lieux';

  @override
  String get navEtaLabel => 'arrivée';

  @override
  String get navTimeLeftLabel => 'restant';

  @override
  String get navOverview => 'Vue d\'ensemble';

  @override
  String get navMute => 'Couper la voix';

  @override
  String get navUnmute => 'Réactiver la voix';

  @override
  String get navEndConfirm => 'Terminer la navigation ?';

  @override
  String navEndConfirmBody(String place) {
    return 'Le guidage vers $place sera interrompu.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Vous êtes arrivé à $place';
  }

  @override
  String get navDone => 'Terminé';

  @override
  String get navWeakGps => 'Signal GPS faible';

  @override
  String get navLocationOff =>
      'La localisation est désactivée. Activez-la pour planifier des itinéraires et naviguer.';

  @override
  String get navVoiceGuidance => 'Guidage vocal';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Dans $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, puis $second';
  }

  @override
  String get navSpeakRerouting => 'Recalcul de l\'itinéraire';

  @override
  String get navSpeakArrived => 'Vous êtes arrivé';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mètres',
      one: '1 mètre',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilomètres',
      one: '1 kilomètre',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pieds',
      one: '1 pied',
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
    return 'Continuez sur $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Les itinéraires ne sont pas disponibles pour ce trajet dans cette région. Essayez une autre destination.';

  @override
  String navContinueFor(String distance) {
    return 'Continuez sur $distance';
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
    return 'Plus proche : $object · $zone';
  }

  @override
  String get parkingNothing => 'Rien de détecté dans le champ';

  @override
  String get parkingBeeps => 'Bips de proximité';

  @override
  String get parkingVolume => 'Volume des bips';

  @override
  String get parkingLimitations =>
      'Une seule caméra, pas de vue à 360°. Les objets hors du champ de la caméra ne sont pas détectés. Ne remplace pas des capteurs de stationnement ; les estimations peuvent être erronées et l\'absence d\'alerte ne signifie pas que la zone est dégagée.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Vue de proximité du dessus. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Original';

  @override
  String get perceptionModeBoxes => 'Cadres';

  @override
  String get perceptionModeMasks => 'Masques d\'objets';

  @override
  String get perceptionModeRoad => 'Chaussée';

  @override
  String get perceptionModeCombined => 'Combiné';

  @override
  String get perceptionOpacity => 'Opacité du masque';

  @override
  String get perceptionDisclaimer =>
      'Le masque de la chaussée est une couche visuelle approximative. Il n\'indique ni l\'espace praticable ni les voies.';

  @override
  String get perceptionNeedsModel =>
      'Sélectionnez le modèle Segmentation pour voir les masques.';

  @override
  String get perceptionChooseModel => 'Choisir un modèle';

  @override
  String get perceptionWaiting => 'En attente de la première image segmentée…';

  @override
  String get perceptionShortCamera => 'Caméra';

  @override
  String get perceptionShortBoxes => 'Cadres';

  @override
  String get perceptionShortObjects => 'Objets';

  @override
  String get perceptionShortRoad => 'Route';

  @override
  String get perceptionShortAll => 'Tout';

  @override
  String get perceptionModesLabel => 'Calques de perception';

  @override
  String get perceptionStatusWarmingUp => 'Préparation…';

  @override
  String get perceptionStatusLoadingModel => 'Chargement du modèle…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps i/s';
  }

  @override
  String get perceptionStatusPaused => 'Masques en pause';

  @override
  String get perceptionLegend => 'Légende des masques';

  @override
  String get perceptionUnavailable => 'Masques indisponibles';

  @override
  String get driveSave => 'Enregistrer';

  @override
  String get driveSaveIncident => 'Enregistrer l\'incident';

  @override
  String driveSaveHint(int seconds) {
    return 'Enregistre les $seconds dernières secondes de vidéo dashcam';
  }

  @override
  String get driveSaving => 'Enregistrement de l\'incident…';

  @override
  String hudRecManualLabel(String time) {
    return 'Enregistrement, $time';
  }

  @override
  String get driveRecord => 'Enreg.';

  @override
  String get driveRecordStartA11y => 'Démarrer l\'enregistrement';

  @override
  String driveRecordStopA11y(String time) {
    return 'Arrêter l\'enregistrement, $time enregistrées';
  }

  @override
  String get driveRecordHint =>
      'Enregistre en continu jusqu\'à ce que vous l\'arrêtiez, y compris les 5 secondes précédentes';

  @override
  String get driveRecordFailed => 'Impossible de démarrer l\'enregistrement';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Enregistrement sauvegardé · $count parties',
      one: 'Enregistrement sauvegardé',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Enregistrement arrêté : stockage presque plein',
      'max_duration': 'Enregistrement arrêté : durée maximale atteinte',
      'camera_stopped': 'Enregistrement arrêté avec la caméra',
      'background': 'Enregistrement arrêté : l\'app est passée en arrière-plan',
      'thermal': 'Enregistrement arrêté : le téléphone est trop chaud',
      'other': 'Enregistrement arrêté',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Incident enregistré · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Voir';

  @override
  String get driveSaveFailed => 'Impossible d\'enregistrer l\'incident.';

  @override
  String get driveSaveNotRunning =>
      'L\'enregistrement n\'a pas encore démarré — attendez le démarrage de la caméra, puis réessayez.';

  @override
  String get driveSaveTestFootage =>
      'Les images de test ne sont pas enregistrées. L\'enregistrement d\'incident fonctionne avec la caméra en direct.';

  @override
  String get driveSaveStorageFull =>
      'Le stockage de votre iPhone est plein. Libérez de l\'espace ou supprimez d\'anciens clips.';

  @override
  String get driveSaveIoError =>
      'Le clip n\'a pas pu être écrit dans le stockage.';

  @override
  String get driveClips => 'Clips';

  @override
  String get driveSettings => 'Réglages';

  @override
  String get driveViewSwitcher => 'Vues de conduite';

  @override
  String get driveLocationDenied =>
      'La localisation est désactivée — vitesse, cartes et itinéraires indisponibles.';

  @override
  String get driveCameraDenied =>
      'L\'accès à la caméra est désactivé — détection et enregistrement indisponibles.';

  @override
  String get driveRecorderFallback =>
      'Enregistrement sans audio : l\'accès au micro est désactivé.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Les réglages d\'enregistrement ont été ajustés : $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Votre iPhone est chaud. L\'IA ralentit pour refroidir — gardez-le à l\'abri du soleil et près d\'une aération.';

  @override
  String get drivePowerThermalCritical =>
      'Votre iPhone est trop chaud. La détection IA est en pause jusqu\'à son refroidissement ; l\'enregistrement continue si possible.';

  @override
  String get drivePowerLowPower =>
      'Le mode économie d\'énergie est activé — l\'IA fonctionne à cadence réduite.';

  @override
  String get drivePowerBatteryLow =>
      'Batterie faible — branchez votre iPhone pendant la conduite.';

  @override
  String get onboardingTitle1 => 'Voyez plus loin à chaque trajet.';

  @override
  String get onboardingBody1 =>
      'Transformez votre iPhone en dashcam intelligente et en compagnon de vigilance au volant.';

  @override
  String get onboardingTitle2 => 'De l\'intelligence dans chaque image.';

  @override
  String get onboardingBody2 =>
      'Reconnaissez les véhicules, personnes, vélos et signaux routiers pris en charge, directement sur votre iPhone.';

  @override
  String get onboardingTitle3 => 'Une route. Plusieurs perspectives.';

  @override
  String get onboardingBody3 =>
      'Passez de la détection en direct aux vues de conduite virtuelles, aux cartes interactives et à la visualisation de stationnement.';

  @override
  String get onboardingTitle4 => 'Gardez les moments qui comptent.';

  @override
  String get onboardingBody4 =>
      'Enregistrez les dernières images de votre dashcam, revoyez les incidents et partagez vos enregistrements.';

  @override
  String get onboardingTitle5 => 'Sécurité et confidentialité';

  @override
  String get onboardingSafety1 =>
      'Corvista est une aide à la vigilance au volant. Gardez les yeux sur la route.';

  @override
  String get onboardingSafety2 =>
      'Il ne contrôle pas votre véhicule et ne remplace pas votre jugement.';

  @override
  String get onboardingSafety3 =>
      'Les détections et estimations peuvent être inexactes ou manquées.';

  @override
  String get onboardingSafety4 =>
      'Le traitement de la caméra se fait sur votre iPhone — la vidéo n\'est pas envoyée.';

  @override
  String get onboardingSafety5 =>
      'Cartes, recherche, itinéraires et météo nécessitent une connexion internet.';

  @override
  String get onboardingSafety6 =>
      'Fixez solidement votre iPhone pour qu\'il ne gêne pas votre vue.';

  @override
  String get onboardingSafety7 =>
      'Terminez la configuration avant de prendre la route.';

  @override
  String get onboardingAcknowledge =>
      'Je comprends que Corvista est une aide à la vigilance et que je reste responsable d\'une conduite sûre.';

  @override
  String get onboardingReadSafety => 'Lire toutes les informations de sécurité';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingSkip => 'Passer';

  @override
  String get onboardingAgree => 'Continuer';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Page $current sur $total';
  }

  @override
  String get permTitle => 'Autorisations';

  @override
  String get permIntro =>
      'Corvista ne demande que ce dont chaque fonction a besoin. Vous pouvez les modifier à tout moment dans les Réglages.';

  @override
  String get permCameraTitle => 'Caméra';

  @override
  String get permCameraBody =>
      'Nécessaire pour la détection, l\'enregistrement dashcam et la vue parking. La vidéo est traitée sur votre iPhone.';

  @override
  String get permLocationTitle => 'Localisation';

  @override
  String get permLocationBody =>
      'Utilisée pour la vitesse GPS, la carte, les itinéraires, la météo et l\'étiquetage des clips enregistrés. Uniquement pendant que vous utilisez l\'app.';

  @override
  String get permMicTitle => 'Micro';

  @override
  String get permSpeechNote =>
      'La reconnaissance vocale n\'est demandée que si vous activez l\'annulation vocale pour les alertes d\'urgence.';

  @override
  String get permRequired => 'Requis';

  @override
  String get permOptional => 'Facultatif';

  @override
  String get permAllow => 'Autoriser';

  @override
  String get permGranted => 'Autorisé';

  @override
  String get permDenied => 'Refusé';

  @override
  String get permLimited => 'Limité';

  @override
  String get permRestricted => 'Restreint';

  @override
  String get permStart => 'Commencer à conduire';

  @override
  String get permCameraNeeded =>
      'Vous pouvez continuer sans accès à la caméra, mais la détection et l\'enregistrement ne fonctionneront pas tant que vous ne l\'aurez pas autorisé dans les Réglages.';

  @override
  String get permSetupIntro =>
      'Corvista a besoin de ces autorisations pour fonctionner pleinement. Touchez Tout autoriser et iOS vous les demandera une à une. Vous pouvez les modifier à tout moment dans Réglages.';

  @override
  String get permCameraLine =>
      'Nécessaire à la détection, à l\'enregistrement dashcam et à la vue stationnement. La vidéo est traitée sur votre iPhone, jamais envoyée.';

  @override
  String get permLocationLine =>
      'Vitesse GPS, carte, itinéraires, météo et lieu d\'enregistrement des clips. Uniquement pendant l\'utilisation de l\'app.';

  @override
  String get permMicLine =>
      'Son de l\'habitacle dans les clips d\'incident, et reconnaissance de votre phrase d\'annulation lors d\'une alerte d\'urgence.';

  @override
  String get permSpeechTitle => 'Reconnaissance vocale';

  @override
  String get permSpeechLine =>
      'Reconnaît votre phrase d\'annulation pendant le compte à rebours d\'urgence, sur votre iPhone lorsque c\'est possible.';

  @override
  String get permAllowAll => 'Tout autoriser';

  @override
  String permAsking(String permission) {
    return 'Demande d\'accès : $permission…';
  }

  @override
  String get permSomeDenied =>
      'Certaines autorisations sont désactivées. Activez-les dans Réglages pour utiliser ces fonctions.';

  @override
  String get permNotNow => 'Plus tard';

  @override
  String get tourLabel => 'Visite de l\'écran Conduite';

  @override
  String tourProgress(int current, int total) {
    return 'Étape $current sur $total';
  }

  @override
  String get tourNext => 'Suivant';

  @override
  String get tourBack => 'Retour';

  @override
  String get tourSkip => 'Passer la visite';

  @override
  String get tourFinish => 'Commencer à conduire';

  @override
  String get tourWelcomeTitle => 'Votre visite rapide';

  @override
  String get tourWelcomeBody =>
      'Une minute pour découvrir l\'essentiel de l\'écran Conduite. À faire de préférence à l\'arrêt.';

  @override
  String get tourHudTitle => 'Votre bandeau d\'instruments';

  @override
  String get tourHudSpeed => 'La vitesse provient du GPS.';

  @override
  String get tourHudRec =>
      'REC indique combien de secondes de vidéo sont en mémoire tampon.';

  @override
  String get tourHudAi =>
      'La puce IA affiche le modèle, le nombre d\'objets détectés et un voyant : vert en marche, orange limité, rouge arrêté.';

  @override
  String get tourSaveTitle => 'Enregistrer l\'incident';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista conserve une mémoire tampon continue des $seconds dernières secondes de vidéo. Elle est sans cesse écrasée : rien n\'est conservé tant que vous ne touchez pas Enregistrer. Les clips enregistrés restent sur cet iPhone, dans Clips.';
  }

  @override
  String get tourRecordTitle => 'Filmez tout le trajet';

  @override
  String get tourRecordBody =>
      'Touchez Enreg. pour filmer en continu jusqu\'à ce que vous arrêtiez. Les longs trajets sont enregistrés par tranches de 5 minutes dans Clips, et Enregistrer l\'incident reste actif pendant l\'enregistrement.';

  @override
  String get tourViewsTitle => 'Cinq façons de voir la route';

  @override
  String get tourViewDetection =>
      'Caméra en direct avec cadres autour des objets pris en charge.';

  @override
  String get tourViewVirtual =>
      'Une scène 3D simplifiée construite à partir des détections.';

  @override
  String get tourViewMap => 'Apple Maps avec recherche et guidage pas à pas.';

  @override
  String get tourViewParking => 'Caméra et vue de proximité en plan.';

  @override
  String get tourViewPerception => 'Masques de la route et des objets.';

  @override
  String get tourMapTitle => 'Recherche et guidage pas à pas';

  @override
  String get tourMapBody =>
      'Ouvrez Carte, touchez la barre de recherche et choisissez une destination. Sélectionnez un itinéraire, puis touchez Démarrer pour le guidage pas à pas. Connexion internet requise.';

  @override
  String get tourClipsTitle => 'Clips';

  @override
  String get tourClipsBody =>
      'Consultez, renommez, partagez ou supprimez les incidents enregistrés. Les clips restent sur votre iPhone sauf si vous les partagez.';

  @override
  String get tourSettingsTitle => 'Réglages';

  @override
  String get tourSettingsBody =>
      'Ajustez les alertes vocales et leur sensibilité, la qualité d\'enregistrement et la durée du tampon, et configurez le mode Urgence : une alerte d\'impact expérimentale avec compte à rebours d\'annulation.';

  @override
  String get tourSafetyTitle => 'Avant de conduire';

  @override
  String get tourSafety1 =>
      'Fixez solidement votre iPhone, sans gêner votre visibilité.';

  @override
  String get tourSafety2 =>
      'N\'utilisez pas l\'app en conduisant. Configurez tout à l\'arrêt.';

  @override
  String get tourSafety3 =>
      'Les détections et les zones sont des estimations. Elles peuvent être erronées ou manquées.';

  @override
  String get tourSafety4 => 'Vous restez responsable d\'une conduite sûre.';

  @override
  String get helpTakeTour => 'Faire la visite';

  @override
  String get helpTakeTourSub =>
      'Une minute pour découvrir l\'écran Conduite pas à pas.';

  @override
  String get tripsTitle => 'Trajets';

  @override
  String get tripsOpen => 'Journal des trajets';

  @override
  String get tripsEmptyTitle => 'Aucun trajet pour le moment';

  @override
  String get tripsEmptyBody =>
      'Les trajets sont enregistrés automatiquement quand vous conduisez avec Corvista : distance, durée, vitesse et itinéraire suivi.';

  @override
  String get tripsDisabledBody =>
      'Le journal des trajets est désactivé : vos nouveaux trajets ne sont pas enregistrés. Activez-le pour conserver un journal privé de vos itinéraires sur cet iPhone.';

  @override
  String get tripsEnable => 'Activer le journal des trajets';

  @override
  String get tripsToday => 'Aujourd\'hui';

  @override
  String get tripsYesterday => 'Hier';

  @override
  String tripsRecordingNow(String distance) {
    return 'Trajet en cours · $distance';
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
      other: '$count alertes',
      one: '1 alerte',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trajets',
      one: '1 trajet',
      zero: 'Aucun trajet',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Distance';

  @override
  String get tripsStatDuration => 'Durée';

  @override
  String get tripsStatMoving => 'Temps en mouvement';

  @override
  String get tripsStatAvgSpeed => 'Vitesse moy.';

  @override
  String get tripsStatMaxSpeed => 'Vitesse max.';

  @override
  String get tripsDetections => 'Détections';

  @override
  String get tripsNoDetections =>
      'Aucun objet routier n\'a été enregistré pendant ce trajet.';

  @override
  String get tripsTimeline => 'Chronologie';

  @override
  String get tripsEventStart => 'Trajet démarré';

  @override
  String get tripsEventEnd => 'Trajet terminé';

  @override
  String get tripsEventAlert => 'Alerte vocale';

  @override
  String get tripsEventIncident => 'Clip d\'incident enregistré';

  @override
  String get tripsEventEmergency => 'Accident possible détecté';

  @override
  String get tripsEventNavStart => 'Navigation démarrée';

  @override
  String get tripsEventArrive => 'Arrivée à destination';

  @override
  String get tripsEventReroute => 'Itinéraire recalculé';

  @override
  String get tripsEventRecording => 'Enregistrement sauvegardé';

  @override
  String get tripsOpenClip => 'Ouvrir le clip';

  @override
  String get tripsTrackPreview => 'Trace GPS';

  @override
  String get tripsRenameTitle => 'Renommer le trajet';

  @override
  String get tripsRenameHint => 'Nom du trajet';

  @override
  String get tripsFavorite => 'Ajouter aux favoris';

  @override
  String get tripsUnfavorite => 'Retirer des favoris';

  @override
  String get tripsShareGpx => 'Partager le GPX';

  @override
  String get tripsShareFailed => 'Impossible de partager ce trajet.';

  @override
  String get tripsDelete => 'Supprimer le trajet';

  @override
  String get tripsDeleteConfirmTitle => 'Supprimer ce trajet ?';

  @override
  String get tripsDeleteConfirmBody =>
      'L\'itinéraire et les statistiques seront supprimés de cet iPhone. Les clips d\'incident de ce trajet sont conservés.';

  @override
  String get tripsDeleted => 'Trajet supprimé';

  @override
  String get tripsNotFound => 'Ce trajet n\'est plus disponible.';

  @override
  String get tripsPrivacyNote =>
      'Stocké uniquement sur cet iPhone. Rien n\'est envoyé.';

  @override
  String get settingsSectionTrips => 'Journal des trajets';

  @override
  String get settingsTripLog => 'Enregistrer les trajets';

  @override
  String get settingsTripLogSubtitle =>
      'Conserve votre itinéraire et vos statistiques de conduite uniquement sur cet iPhone.';

  @override
  String get settingsTripRetention => 'Conserver les trajets';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
      one: '1 jour',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 an';

  @override
  String get settingsRetentionForever => 'Toujours';

  @override
  String get settingsTripRetentionFooter =>
      'Les anciens trajets sont supprimés automatiquement au démarrage de Corvista.';

  @override
  String get settingsViewTrips => 'Voir les trajets';

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
    return 'Trajet Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Libérer de l\'espace';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Supprime les fichiers temporaires et les caches. Les clips et trajets enregistrés sont conservés.';

  @override
  String settingsFreedBytes(String size) {
    return '$size libérés';
  }

  @override
  String get settingsNothingToFree =>
      'Caches vidés : aucun fichier temporaire à supprimer.';

  @override
  String get settingsSectionPrivacyData => 'Confidentialité et données';

  @override
  String get settingsPrivacyDataFooter =>
      'Les clips, trajets et réglages sont stockés uniquement sur cet iPhone. Ils n\'en sortent que si vous choisissez de les partager.';

  @override
  String get settingsDeleteAllData => 'Supprimer toutes les données';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Effacer les clips, trajets, contacts et réglages de cet iPhone';

  @override
  String get deleteAllTitle => 'Supprimer toutes les données ?';

  @override
  String get deleteAllMessage =>
      'Cela supprime définitivement de cet iPhone :\n• Les clips d\'incident et leurs miniatures\n• L\'historique des trajets et les traces GPS\n• Les contacts d\'urgence et les événements d\'urgence\n• Les journaux de détection et le journal de diagnostic\n• Les réglages et les destinations récentes\n• Le tampon d\'enregistrement temporaire et le cache\n\nCette action est irréversible. Corvista repartira ensuite des écrans de bienvenue.';

  @override
  String get deleteAllConfirm => 'Tout supprimer';

  @override
  String get deleteAllInProgress => 'Suppression…';

  @override
  String get deleteAllDone => 'Toutes les données ont été supprimées';

  @override
  String get deleteAllPartial =>
      'Certains éléments n\'ont pas pu être supprimés. Réessayez depuis Réglages.';

  @override
  String get diagLogSection => 'Journal de diagnostic';

  @override
  String get diagLogFooter =>
      'Les erreurs sont enregistrées uniquement sur cet iPhone, sans position, nom de contact ni numéro de téléphone. Rien n\'est envoyé sauf si vous partagez vous-même le journal.';

  @override
  String get diagLogShare => 'Partager le journal de diagnostic';

  @override
  String get diagLogEmpty => 'Vide';

  @override
  String get diagLogClear => 'Effacer le journal';

  @override
  String get diagLogClearTitle => 'Effacer le journal de diagnostic ?';

  @override
  String get diagLogClearBody =>
      'Les entrées d\'erreur enregistrées seront supprimées de cet iPhone.';

  @override
  String get diagLogCleared => 'Journal de diagnostic effacé';

  @override
  String get diagLogShareFailed =>
      'Impossible de partager le journal de diagnostic.';

  @override
  String get privacyControls2 =>
      'Réglages › Confidentialité et données › Supprimer toutes les données efface tous les clips, trajets, contacts, journaux et réglages que Corvista a stockés sur cet iPhone.';

  @override
  String get parkingZoneStop => 'Stop';

  @override
  String get parkingZoneVeryClose => 'Très proche';

  @override
  String get parkingZoneClose => 'Proche';

  @override
  String get parkingZoneNothingClose => 'Rien de proche détecté';

  @override
  String get parkingNotDetected =>
      'Les murs, piliers, poteaux et bordures ne sont pas détectés';

  @override
  String get parkingApprox => 'approx.';

  @override
  String get parkingSideLeft => 'Gauche';

  @override
  String get parkingSideCenter => 'Centre';

  @override
  String get parkingSideRight => 'Droite';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Vue de la caméra avant uniquement — pas un système à 360°';

  @override
  String get parkingMuteBeeps => 'Couper les bips';

  @override
  String get parkingUnmuteBeeps => 'Réactiver les bips';

  @override
  String get parkingAbout => 'À propos de la vue stationnement';

  @override
  String get parkingLimitationsDetail =>
      'Seule la zone située devant la caméra est surveillée. Le détecteur reconnaît les voitures, bus et camions, les personnes, les vélos et les motos. Les murs, piliers, poteaux, bordures, bornes, barrières et obstacles bas ne sont PAS détectés, et le capot peut masquer le sol juste devant. Les distances sont de grossières estimations à partir d\'une seule caméra (taille et position de l\'objet) et peuvent être très inexactes. Le silence ou « Rien de proche détecté » ne signifie pas que la voie est libre : regardez toujours autour de vous et utilisez vos rétroviseurs.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Proximité par côté : gauche $left, centre $center, droite $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Les erreurs sont écrites dans un journal privé sur cet iPhone (sans position, nom de contact ni numéro de téléphone). Il n\'est jamais envoyé automatiquement ; vous pouvez le partager ou l\'effacer dans Réglages › Diagnostics.';
}

/// The translations for French, as used in Canada (`fr_CA`).
class AppLocalizationsFrCa extends AppLocalizationsFr {
  AppLocalizationsFrCa() : super('fr_CA');

  @override
  String get classBus => 'Autobus';

  @override
  String get classTrafficLight => 'Feu de circulation';

  @override
  String get classStopSign => 'Panneau d\'arrêt';

  @override
  String get viewParking => 'Stationnement';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count clips?',
      one: 'Supprimer ce clip?',
    );
    return '$_temp0';
  }

  @override
  String get settingsAlertBus => 'Autobus';

  @override
  String get settingsAlertStopSign => 'Panneaux d\'arrêt';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Retirer $name?';
  }

  @override
  String get emergencyAlertSubtitle => 'Tout va bien?';

  @override
  String get modelsFunctionDetection =>
      'Détecte véhicules, personnes, vélos, motos, autobus, feux de circulation et panneaux d\'arrêt';

  @override
  String get modelsFunctionNone =>
      'Aucune détection; enregistrement dashcam uniquement';

  @override
  String get safetyLimits3 =>
      'Seules les catégories prises en charge sont reconnues : véhicules, autobus, motos, vélos, personnes, feux de circulation et panneaux d\'arrêt. Les repères de voie de la vue virtuelle sont stylisés et ne correspondent pas à des voies détectées.';

  @override
  String get safetyLimits4 =>
      'La proximité est indiquée par des zones approximatives (Très proche, Proche, Moyen, Loin), jamais par des distances mesurées. La vue stationnement ne remplace pas des capteurs de stationnement.';

  @override
  String get safetyHeat1 =>
      'L\'utilisation continue de la caméra et de l\'IA fait chauffer votre iPhone. Corvista réduit la cadence d\'analyse lorsque l\'appareil chauffe et affiche un avertissement; en cas de surchauffe d\'iOS, la caméra peut s\'arrêter.';

  @override
  String get helpQSave => 'Comment conserver les images d\'un incident?';

  @override
  String get helpQWhere => 'Où sont stockés mes clips?';

  @override
  String get helpQZones => 'Quelle est la précision des zones de proximité?';

  @override
  String get helpQSlow => 'Pourquoi la détection ralentit-elle?';

  @override
  String get helpASimulator =>
      'Vérifiez que l\'accès à la caméra est autorisé dans les Réglages iOS et qu\'aucune autre app n\'utilise la caméra. Le simulateur iOS n\'a pas de caméra; une vidéo de test locale peut être utilisée à la place.';

  @override
  String get cameraUnavailableBody =>
      'Aucune caméra n\'est disponible sur cet appareil. La détection, l\'enregistrement et les vues stationnement nécessitent la caméra arrière.';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista a besoin de la caméra pour la détection, l\'enregistrement dashcam et les vues stationnement. Activez l\'accès à la caméra dans les Réglages.';

  @override
  String get virtualEmptyHint =>
      'Les véhicules, personnes, vélos, feux et panneaux d\'arrêt apparaissent ici lorsqu\'ils sont détectés.';

  @override
  String get navEndConfirm => 'Terminer la navigation?';

  @override
  String get parkingLimitations =>
      'Une seule caméra, pas de vue à 360°. Les objets hors du champ de la caméra ne sont pas détectés. Ne remplace pas des capteurs de stationnement; les estimations peuvent être erronées et l\'absence d\'alerte ne signifie pas que la zone est dégagée.';

  @override
  String get drivePowerThermalCritical =>
      'Votre iPhone est trop chaud. La détection IA est en pause jusqu\'à son refroidissement; l\'enregistrement continue si possible.';

  @override
  String get permCameraBody =>
      'Nécessaire pour la détection, l\'enregistrement dashcam et la vue stationnement. La vidéo est traitée sur votre iPhone.';
}
