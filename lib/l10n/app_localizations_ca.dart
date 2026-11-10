// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Veu més de cada trajecte.';

  @override
  String get commonCancel => 'Cancel·la';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get commonSave => 'Desa';

  @override
  String get commonBack => 'Enrere';

  @override
  String get commonClose => 'Tanca';

  @override
  String get commonRetry => 'Torna-ho a provar';

  @override
  String get commonOpenSettings => 'Obre Configuració';

  @override
  String get commonLoading => 'S\'està carregant…';

  @override
  String get commonError => 'S\'ha produït un error.';

  @override
  String commonErrorDetail(String message) {
    return 'S\'ha produït un error: $message';
  }

  @override
  String get commonOn => 'Activat';

  @override
  String get commonOff => 'Desactivat';

  @override
  String get commonRename => 'Canvia el nom';

  @override
  String get commonShare => 'Comparteix';

  @override
  String get commonNotAvailable => 'No disponible';

  @override
  String get commonTestFootage => 'IMATGES DE PROVA';

  @override
  String get zoneVeryClose => 'Molt a prop';

  @override
  String get zoneClose => 'A prop';

  @override
  String get zoneMedium => 'Mitjà';

  @override
  String get zoneFar => 'Lluny';

  @override
  String get zoneUnknown => 'Desconegut';

  @override
  String get classPerson => 'Persona';

  @override
  String get classBicycle => 'Bicicleta';

  @override
  String get classMotorcycle => 'Motocicleta';

  @override
  String get classCar => 'Vehicle';

  @override
  String get classBus => 'Autobús';

  @override
  String get classTrafficLight => 'Semàfor';

  @override
  String get classStopSign => 'Senyal de stop';

  @override
  String get viewDetection => 'Detecció';

  @override
  String get viewVirtual => 'Virtual';

  @override
  String get viewMap => 'Mapa';

  @override
  String get viewParking => 'Aparcament';

  @override
  String get viewPerception => 'Percepció';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Vermell';

  @override
  String get lightYellow => 'Groc';

  @override
  String get lightGreen => 'Verd';

  @override
  String get lightUnknown => 'Desconegut';

  @override
  String get clipsTitle => 'Clips';

  @override
  String get clipsSelect => 'Selecciona';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seleccionats',
      one: '1 seleccionat',
      zero: 'Selecciona clips',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Selecciona-ho tot';

  @override
  String get clipsDeselectAll => 'Desselecciona-ho tot';

  @override
  String get clipsDeleteSelected => 'Elimina la selecció';

  @override
  String get clipsGridView => 'Vista en quadrícula';

  @override
  String get clipsListView => 'Vista en llista';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vols eliminar $count clips?',
      one: 'Vols eliminar aquest clip?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Els vídeos s\'eliminaran definitivament de l\'iPhone. Aquesta acció no es pot desfer.',
      one: 'El vídeo s\'eliminarà definitivament de l\'iPhone. Aquesta acció no es pot desfer.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips eliminats',
      one: 'Clip eliminat',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Encara no hi ha clips';

  @override
  String get clipsEmptyBody =>
      'Mentre condueixes, Corvista conserva un breu buffer continu. Toca Desa l\'incident per guardar aquí els darrers segons d\'imatges.';

  @override
  String get clipsLoadError => 'No s\'han pogut carregar els clips.';

  @override
  String get clipsStorageTitle => 'Emmagatzematge';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Clips $clips · Buffer $buffer · $free lliures';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips desats',
      one: '1 clip desat',
      zero: 'Cap clip desat',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'L\'iPhone té poc espai d\'emmagatzematge. És possible que els nous incidents no es desin.';

  @override
  String get clipsMissingFile => 'Falta el fitxer';

  @override
  String get clipsEmergencyBadge => 'Impacte';

  @override
  String clipsUntitled(String date) {
    return 'Incident · $date';
  }

  @override
  String get clipsAudio => 'Àudio gravat';

  @override
  String get clipsFavorite => 'Preferit';

  @override
  String get clipsUnfavorite => 'Elimina dels preferits';

  @override
  String get clipsLocation => 'Ubicació desada';

  @override
  String clipsOpenClip(String title) {
    return 'Obre el clip $title';
  }

  @override
  String get playerNotFoundTitle => 'No s\'ha trobat el clip';

  @override
  String get playerNotFoundBody =>
      'És possible que aquest clip s\'hagi eliminat.';

  @override
  String get playerMissingTitle => 'Falta el fitxer de vídeo';

  @override
  String get playerMissingBody =>
      'La gravació d\'aquest clip ja no és a l\'iPhone. Pots eliminar l\'entrada de la galeria.';

  @override
  String get playerRemoveEntry => 'Elimina l\'entrada';

  @override
  String get playerLoadError => 'No es pot reproduir aquest vídeo.';

  @override
  String get playerPlay => 'Reprodueix';

  @override
  String get playerPause => 'Pausa';

  @override
  String get playerReplay => 'Torna a reproduir';

  @override
  String get playerRenameTitle => 'Canvia el nom del clip';

  @override
  String get playerRenameHint => 'Nom del clip';

  @override
  String get playerRenamed => 'Nom del clip canviat';

  @override
  String get playerFavorited => 'Afegit als preferits';

  @override
  String get playerUnfavorited => 'Eliminat dels preferits';

  @override
  String get playerShareFailed => 'No s\'ha pogut compartir aquest clip.';

  @override
  String get playerDetails => 'Detalls';

  @override
  String get playerDate => 'Gravat';

  @override
  String get playerDuration => 'Durada';

  @override
  String get playerResolution => 'Resolució';

  @override
  String get playerSize => 'Mida del fitxer';

  @override
  String get playerAudio => 'Àudio';

  @override
  String get playerAudioYes => 'Gravat';

  @override
  String get playerAudioNo => 'No gravat';

  @override
  String get playerReason => 'Desat per';

  @override
  String get playerReasonManual => 'Botó Desa l\'incident';

  @override
  String get playerReasonEmergency => 'Possible detecció d\'impacte';

  @override
  String get playerReasonRecovered => 'Recuperat després d\'una interrupció';

  @override
  String get playerSpeed => 'Velocitat GPS en desar';

  @override
  String get playerLocation => 'Ubicació';

  @override
  String get playerOpenInMaps => 'Obre a Mapes';

  @override
  String get playerBack => 'Enrere';

  @override
  String get playerMore => 'Més accions';

  @override
  String get clipsFilterLabel => 'Mostra';

  @override
  String get clipsFilterAll => 'Tots';

  @override
  String get clipsFilterRecordings => 'Gravacions';

  @override
  String get clipsFilterIncidents => 'Incidents';

  @override
  String get clipsFilterEmergency => 'Emergència';

  @override
  String get clipsFilterFavorites => 'Preferits';

  @override
  String get clipsSort => 'Ordena';

  @override
  String get clipsSortNewest => 'Més recents primer';

  @override
  String get clipsSortOldest => 'Més antics primer';

  @override
  String get clipsSortLongest => 'Més llargs primer';

  @override
  String get clipsSortLargest => 'Més grans primer';

  @override
  String get clipsToday => 'Avui';

  @override
  String get clipsYesterday => 'Ahir';

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
  String get clipsFilterEmpty => 'Encara no hi ha clips en aquesta categoria.';

  @override
  String get clipsFavoritesEmpty =>
      'Marca un clip amb una estrella per tenir-lo aquí a mà.';

  @override
  String get clipsKindRecording => 'Gravació';

  @override
  String get clipsKindIncident => 'Incident';

  @override
  String get clipsKindEmergency => 'Emergència';

  @override
  String get clipsKindTest => 'Prova';

  @override
  String clipsTripChip(String time) {
    return 'Trajecte · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Obre el trajecte en què es va gravar aquest clip';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used utilitzats · $free lliures';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Els clips ocupen $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gravacions',
      one: '1 gravació',
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
      other: '$count emergències',
      one: '1 emergència',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Allibera espai';

  @override
  String get clipsStorageLowGentle =>
      'Queden menys de 2 GB lliures. Perquè la gravació vagi bé, allibera espai o elimina els clips que ja no necessitis.';

  @override
  String get clipsSaveToPhotos => 'Desa a Fotos';

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
      other: 'Vols eliminar $count clips ($size)?',
      one: 'Vols eliminar aquest clip ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Desant $done de $total a Fotos…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips desats a Fotos',
      one: 'Desat a Fotos',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved desats a Fotos · $failed no s\'han pogut desar';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista no té permís per afegir vídeos a Fotos. Pots permetre-ho a Configuració.';

  @override
  String get clipsPhotosFailed => 'No s\'ha pogut desar a Fotos.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips afegits als preferits',
      one: 'Afegit als preferits',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips eliminats dels preferits',
      one: 'Eliminat dels preferits',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (retallat)';
  }

  @override
  String get playerTrim => 'Retalla';

  @override
  String get playerInfo => 'Informació';

  @override
  String get playerKind => 'Tipus';

  @override
  String get playerReasonRecording => 'Botó Grava';

  @override
  String get trimTitle => 'Retalla el clip';

  @override
  String get trimHint =>
      'Arrossega els tiradors per triar la part que vols conservar. El clip original no canvia.';

  @override
  String get trimStartHandle => 'Inici del retall';

  @override
  String get trimEndHandle => 'Final del retall';

  @override
  String trimSelection(String duration) {
    return '$duration seleccionats';
  }

  @override
  String get trimSave => 'Desa com a clip nou';

  @override
  String get trimSaving => 'Desant el clip retallat…';

  @override
  String get trimSaved => 'Clip retallat desat';

  @override
  String get trimOpenNew => 'Obre';

  @override
  String get trimFailed => 'No s\'ha pogut retallar aquest clip.';

  @override
  String get trimStorageFull =>
      'No hi ha prou espai lliure per desar el clip retallat.';

  @override
  String get trimPreview => 'Reprodueix la selecció';

  @override
  String get settingsTitle => 'Configuració';

  @override
  String get settingsSectionCamera => 'Càmera';

  @override
  String get settingsSectionAi => 'IA';

  @override
  String get settingsSectionAlerts => 'Alertes';

  @override
  String get settingsSectionAlertCategories => 'Categories d\'alertes';

  @override
  String get settingsSectionRecording => 'Gravació';

  @override
  String get settingsSectionDriving => 'Conducció';

  @override
  String get settingsSectionPower => 'Energia';

  @override
  String get settingsSectionEmergency => 'Emergència';

  @override
  String get settingsSectionAppearance => 'Aparença';

  @override
  String get settingsSectionLanguage => 'Idioma';

  @override
  String get settingsSectionInformation => 'Informació';

  @override
  String get settingsCameraLens => 'Objectiu de la càmera';

  @override
  String get settingsLensWide => 'Gran angular';

  @override
  String get settingsLensUltraWide => 'Ultra gran angular';

  @override
  String get settingsLensTelephoto => 'Teleobjectiu';

  @override
  String get settingsLensUnavailable => 'No disponible en aquest iPhone';

  @override
  String get settingsStabilization => 'Estabilització';

  @override
  String get settingsStabAuto => 'Automàtica';

  @override
  String get settingsStabOff => 'Desactivada';

  @override
  String get settingsStabStandard => 'Estàndard';

  @override
  String get settingsStabCinematic => 'Cinematogràfica';

  @override
  String get settingsOverlayOpacity => 'Opacitat de la superposició';

  @override
  String get settingsShowFps => 'Mostra estadístiques de rendiment';

  @override
  String get settingsShowFpsSubtitle =>
      'Freqüència de fotogrames i temps d\'inferència a la vista de detecció';

  @override
  String get settingsCameraFooter =>
      'Els canvis d\'objectiu i d\'estabilització s\'apliquen la propera vegada que s\'iniciï la càmera.';

  @override
  String get settingsAiModel => 'Model d\'IA';

  @override
  String get settingsConfidence => 'Confiança de detecció';

  @override
  String get settingsTracking => 'Seguiment d\'objectes';

  @override
  String get settingsTrackingSubtitle =>
      'Manté els objectes estables entre fotogrames';

  @override
  String get settingsShowLabels => 'Mostra les etiquetes';

  @override
  String get settingsShowConfidence => 'Mostra la confiança';

  @override
  String get settingsSegmentationOpacity =>
      'Opacitat de la màscara de percepció';

  @override
  String get settingsAiFooter =>
      'Una confiança més baixa mostra més objectes, però també més falses deteccions. Les deteccions poden ser inexactes.';

  @override
  String get settingsVoiceAlerts => 'Alertes de veu';

  @override
  String get settingsVoiceLanguage => 'Idioma de la veu';

  @override
  String get settingsVoiceLanguageAuto => 'Igual que l\'idioma de l\'app';

  @override
  String get settingsVoice => 'Veu';

  @override
  String get settingsVoiceDefault => 'Predeterminada del sistema';

  @override
  String get settingsVoiceQualityEnhanced => 'Millorada';

  @override
  String get settingsVoiceQualityPremium => 'Alta qualitat';

  @override
  String get settingsNoVoices =>
      'No hi ha cap veu instal·lada per a aquest idioma. Afegeix-ne una a Configuració d\'iOS › Accessibilitat › Contingut parlat.';

  @override
  String get settingsAlertPedestrian => 'Vianants';

  @override
  String get settingsAlertCyclist => 'Ciclistes';

  @override
  String get settingsAlertMotorcycle => 'Motocicletes';

  @override
  String get settingsAlertBus => 'Autobusos';

  @override
  String get settingsAlertVehicleClose => 'Vehicle molt a prop al davant';

  @override
  String get settingsAlertTrafficLight => 'Canvis de semàfor';

  @override
  String get settingsAlertTrafficMoving => 'Trànsit endavant en moviment';

  @override
  String get settingsAlertStopSign => 'Senyals de stop';

  @override
  String get settingsSensitivity => 'Sensibilitat';

  @override
  String get settingsSensitivityLow => 'Baixa';

  @override
  String get settingsSensitivityMedium => 'Mitjana';

  @override
  String get settingsSensitivityHigh => 'Alta';

  @override
  String get settingsCooldown => 'Interval de repetició';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Volum de la veu';

  @override
  String get settingsQuietMode => 'Mode silenciós';

  @override
  String get settingsQuietModeSubtitle =>
      'Només es diuen en veu alta les alertes més importants';

  @override
  String get settingsTestVoice => 'Prova la veu';

  @override
  String get settingsTestVoiceDone =>
      'S\'està reproduint una alerta d\'exemple…';

  @override
  String get settingsParkingBeeps => 'Sons d\'aparcament';

  @override
  String get settingsBeepVolume => 'Volum dels sons';

  @override
  String get settingsAlertsFooter =>
      'Les alertes només són una ajuda. Vigila sempre la carretera: que no sonin no vol dir que el camí estigui lliure.';

  @override
  String get settingsRecordingProfile => 'Qualitat de gravació';

  @override
  String get settingsProfileStandard => 'Estàndard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Buffer d\'incidents';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds segons';
  }

  @override
  String get settingsManualMaxLength => 'Durada màxima de la gravació manual';

  @override
  String get settingsManualMaxUnlimited => 'Sense límit';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Grava l\'àudio';

  @override
  String get settingsRecordAudioSubtitle =>
      'Inclou l\'àudio de l\'habitacle als incidents desats';

  @override
  String get settingsMicDenied =>
      'L\'accés al micròfon està desactivat. Permet-lo a Configuració per gravar àudio.';

  @override
  String get settingsWatermark => 'Marca d\'aigua de Corvista';

  @override
  String get settingsTimestamp => 'Marca de data i hora';

  @override
  String get settingsSaveLocation => 'Desa la ubicació amb els clips';

  @override
  String get settingsStorage => 'Emmagatzematge i clips';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips',
      one: '1 clip',
      zero: 'Cap clip',
    );
    return '$_temp0 · $used utilitzats · $free lliures';
  }

  @override
  String get settingsRecordingFooter =>
      'El buffer continu es manté a l\'iPhone i se sobreescriu constantment. No es grava res en segon pla.';

  @override
  String get settingsDefaultView => 'Vista predeterminada';

  @override
  String get settingsUnits => 'Unitats';

  @override
  String get settingsShowCompass => 'Mostra la brúixola';

  @override
  String get settingsHudStyle => 'Estil del HUD';

  @override
  String get settingsHudCustomize => 'Personalitza el HUD';

  @override
  String get settingsDrivingSide => 'Costat de conducció';

  @override
  String get settingsDrivingSideAuto => 'Automàtic';

  @override
  String get settingsDrivingSideRight => 'Dreta';

  @override
  String get settingsDrivingSideLeft => 'Esquerra';

  @override
  String get settingsVirtualStyle => 'Estil de la vista virtual';

  @override
  String get settingsVirtualMinimal => 'Minimalista';

  @override
  String get settingsVirtualPerspective => 'Perspectiva';

  @override
  String get settingsVirtualHighContrast => 'Contrast alt';

  @override
  String get settingsKeepScreenOn =>
      'Mantén la pantalla encesa mentre condueixes';

  @override
  String get settingsLiveActivity => 'Activitat en directe';

  @override
  String get settingsLiveActivityDesc =>
      'Mostra les indicacions de navegació a la pantalla de bloqueig i a la Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Gravació en pausa mentre Corvista era en segon pla';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'En pausa';

  @override
  String get liveActivityDashcamOff => 'Càm. apagada';

  @override
  String get liveActivityEnded => 'Navegació finalitzada';

  @override
  String get liveActivityEta => 'Arribada';

  @override
  String get settingsAutoRecenter => 'Recentra el mapa automàticament';

  @override
  String get settingsHudStyleClassic => 'Clàssic';

  @override
  String get settingsHudStyleGrid => 'Quadrícula';

  @override
  String get settingsHudStyleMinimal => 'Minimalista';

  @override
  String get settingsHudStylePerformance => 'Rendiment';

  @override
  String get settingsHudStyleNavigation => 'Navegació';

  @override
  String get settingsHudStyleNight => 'Nit';

  @override
  String get settingsHudStyleHighContrast => 'Contrast alt';

  @override
  String get settingsPowerMode => 'Mode d\'energia';

  @override
  String get settingsPowerBalanced => 'Equilibrat';

  @override
  String get settingsPowerPerformance => 'Rendiment';

  @override
  String get settingsPowerSaver => 'Estalvi d\'energia';

  @override
  String get settingsPowerFooter =>
      'Corvista redueix automàticament la freqüència de la IA i els efectes visuals quan l\'iPhone s\'escalfa o la bateria és baixa.';

  @override
  String get settingsThermal => 'Estat tèrmic';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Càlid';

  @override
  String get settingsThermalSerious => 'Molt calent';

  @override
  String get settingsThermalCritical => 'Crític';

  @override
  String get settingsBattery => 'Bateria';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Carregant';
  }

  @override
  String get settingsLowPowerMode =>
      'El mode de baix consum està activat: la IA s\'executa a una freqüència reduïda.';

  @override
  String get settingsAiRate => 'Freqüència actual de la IA';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Detecció d\'impactes';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Activada · compte enrere de $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Experimental. No substitueix els serveis d\'emergència.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeDark => 'Fosc';

  @override
  String get settingsThemeLight => 'Clar';

  @override
  String get settingsReduceMotion => 'Redueix el moviment';

  @override
  String get settingsReduceMotionSubtitle =>
      'Minimitza les animacions a tota l\'app';

  @override
  String get settingsAppLanguage => 'Idioma de l\'app';

  @override
  String get settingsPrivacyPolicy => 'Política de privadesa';

  @override
  String get settingsTerms => 'Condicions d\'ús';

  @override
  String get settingsHelp => 'Ajuda';

  @override
  String get settingsSupport => 'Contacta amb el suport';

  @override
  String get settingsLicenses => 'Llicències de codi obert';

  @override
  String get settingsSupportUnavailable =>
      'No s\'ha pogut obrir Mail. Escriu a support@corvista.app.';

  @override
  String get settingsSafety => 'Informació de seguretat';

  @override
  String get settingsDiagnostics => 'Diagnòstic';

  @override
  String get settingsVersion => 'Versió';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Personalitza el HUD';

  @override
  String get hudCustomPreview => 'Previsualització · valors d\'exemple';

  @override
  String get hudCustomStyle => 'Estil';

  @override
  String get hudCustomElements => 'Elements';

  @override
  String get hudCustomSpeed => 'Velocitat';

  @override
  String get hudCustomHeading => 'Rumb i brúixola';

  @override
  String get hudCustomClock => 'Rellotge';

  @override
  String get hudCustomBattery => 'Bateria i temperatura';

  @override
  String get hudCustomDetections => 'Estat de la IA i deteccions';

  @override
  String get hudCustomWeather => 'Temps';

  @override
  String get hudCustomAppearance => 'Mida i opacitat';

  @override
  String get hudCustomSize => 'Mida';

  @override
  String get hudCustomOpacity => 'Opacitat';

  @override
  String get hudCustomFooter =>
      'Els avisos, com el sobreescalfament, sempre es mostren, fins i tot quan els elements estan amagats.';

  @override
  String get hudCustomDescClassic => 'Quadre d\'instruments equilibrat';

  @override
  String get hudCustomDescGrid =>
      'Quadrícula en perspectiva sobre la carretera';

  @override
  String get hudCustomDescMinimal => 'Només la velocitat, res més';

  @override
  String get hudCustomDescPerformance =>
      'Arc de velocitat amb lectures en directe';

  @override
  String get hudCustomDescNavigation => 'Primer la propera maniobra';

  @override
  String get hudCustomDescNight =>
      'Atenuat i amb tons vermells per a la conducció nocturna';

  @override
  String get hudCustomDescHighContrast => 'Màxima llegibilitat amb sol intens';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageSystem => 'Predeterminat del sistema';

  @override
  String get languageSystemSubtitle => 'Segueix l\'idioma de l\'iPhone';

  @override
  String get languageFooter =>
      'Properament hi haurà més idiomes. L\'idioma de les alertes de veu es pot definir per separat a Alertes.';

  @override
  String get diagTitle => 'Diagnòstic';

  @override
  String get diagPerformance => 'Rendiment';

  @override
  String get diagInference => 'Temps d\'inferència';

  @override
  String get diagDetectHz => 'Freqüència de detecció';

  @override
  String get diagCameraFps => 'Fotogrames de la càmera';

  @override
  String get diagMemory => 'Memòria';

  @override
  String get diagDropped => 'Fotogrames perduts';

  @override
  String get diagSegmentation => 'Temps de segmentació';

  @override
  String get diagCamera => 'Càmera';

  @override
  String get diagStatus => 'Estat';

  @override
  String get diagSource => 'Font';

  @override
  String get diagSourceCamera => 'Càmera en directe';

  @override
  String get diagSourceFile => 'Fitxer d\'imatges de prova';

  @override
  String get diagResolution => 'Mida del buffer';

  @override
  String get diagLens => 'Objectiu';

  @override
  String get diagError => 'Darrer error';

  @override
  String get diagModel => 'Model d\'IA';

  @override
  String get diagModelLoad => 'Temps de càrrega del model';

  @override
  String get diagPower => 'Energia';

  @override
  String get diagSegHz => 'Freqüència de segmentació';

  @override
  String get diagReduced => 'Efectes reduïts';

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
  String get diagCamIdle => 'Inactiva';

  @override
  String get diagCamStarting => 'Iniciant';

  @override
  String get diagCamRunning => 'En execució';

  @override
  String get diagCamInterrupted => 'Interrompuda';

  @override
  String get diagCamStopped => 'Aturada';

  @override
  String get diagCamUnavailable => 'No disponible';

  @override
  String get diagCamPermissionDenied => 'Permís denegat';

  @override
  String get diagCamError => 'Error';

  @override
  String get diagTestFootage => 'Imatges de prova';

  @override
  String get diagTestFootageBody =>
      'Executa la detecció real al dispositiu sobre un fitxer de vídeo local en lloc de la càmera. Totes les vistes ho indiquen amb IMATGES DE PROVA.';

  @override
  String get diagPathLabel => 'Ruta del fitxer de vídeo';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Utilitza Documents/test_drive.mp4';

  @override
  String get diagRun => 'Executa les imatges de prova';

  @override
  String get diagRunStarted =>
      'Imatges de prova iniciades. Obre la vista de conducció per veure-les.';

  @override
  String get diagBackToCamera => 'Torna a la càmera en directe';

  @override
  String get diagDebugOnly =>
      'Les imatges de prova només estan disponibles en compilacions de desenvolupament.';

  @override
  String get diagFileMissing => 'No hi ha cap fitxer en aquesta ruta.';

  @override
  String get emergencySetupTitle => 'Detecció d\'impactes';

  @override
  String get emergencyExperimental => 'Experimental';

  @override
  String get emergencyIntro =>
      'Durant la conducció, Corvista pot detectar un possible impacte greu amb els sensors de moviment de l\'iPhone. Si se\'n detecta un, comença un compte enrere. Si no el cancel·les, Corvista t\'ofereix trucar als serveis d\'emergència i enviar un missatge als teus contactes.';

  @override
  String get emergencyDisclaimer1 =>
      'No substitueix els serveis d\'emergència ni la detecció de col·lisions del vehicle.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS sempre et demana confirmació abans de fer una trucada o enviar un missatge.';

  @override
  String get emergencyDisclaimer3 =>
      'Es poden passar per alt impactes, i una frenada brusca o uns sotracs es poden confondre amb un impacte.';

  @override
  String get emergencyParkedWarning =>
      'Completa aquesta configuració amb el vehicle aparcat. Els ajustos es bloquegen mentre el vehicle es mou.';

  @override
  String get emergencyEnable => 'Activa la detecció d\'impactes';

  @override
  String get emergencyEnableSubtitle =>
      'Només actiu durant una sessió de conducció';

  @override
  String get emergencyNeedNumber => 'Afegeix primer un número d\'emergència.';

  @override
  String get emergencyContacts => 'Contactes d\'emergència';

  @override
  String get emergencyAddContact => 'Afegeix un contacte';

  @override
  String get emergencyNoContacts =>
      'Encara no hi ha contactes. Els contactes només reben un missatge després que el confirmis.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Vols eliminar $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Després d\'un impacte, ja no es proposarà com a destinatari.';

  @override
  String get emergencyRemove => 'Elimina';

  @override
  String get emergencyContactsError =>
      'No s\'han pogut carregar els contactes.';

  @override
  String get emergencyNumber => 'Número d\'emergència';

  @override
  String get emergencyNumberHint => 'p. ex. 112 o 911';

  @override
  String get emergencyMessage => 'Plantilla del missatge';

  @override
  String get emergencyMessageDefault =>
      'Potser he tingut un accident de trànsit. Aquest missatge l\'ha preparat Corvista i inclou la meva darrera ubicació coneguda, si està disponible.';

  @override
  String get emergencyMessageHint =>
      'Deixa-ho buit per utilitzar el missatge predeterminat.';

  @override
  String get emergencyCountdown => 'Durada del compte enrere';

  @override
  String get emergencyVoiceCancel => 'Cancel·la per veu';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Digues «estic bé» o «cancel·la» durant el compte enrere. Utilitza el reconeixement de veu al dispositiu quan està disponible.';

  @override
  String get emergencyVoicePermDenied =>
      'Per cancel·lar per veu calen els permisos de micròfon i de reconeixement de veu.';

  @override
  String get emergencyAutoSave => 'Desa automàticament el clip de l\'incident';

  @override
  String get emergencyTest => 'Prova el compte enrere (sense trucada)';

  @override
  String get emergencyTestBody =>
      'Executa un impacte simulat perquè puguis veure el compte enrere. En mode de prova mai es fa cap trucada ni s\'envia cap missatge.';

  @override
  String get emergencyNotSet => 'Sense definir';

  @override
  String get emergencyAlertHeadline =>
      'S\'ha detectat un possible impacte greu.';

  @override
  String get emergencyAlertSubtitle => 'Estàs bé?';

  @override
  String get emergencyAlertCancel => 'Estic bé — Cancel·la';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Queden $seconds segons',
      one: 'Queda 1 segon',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Escoltant — digues «estic bé» per cancel·lar';

  @override
  String emergencyAlertHeard(String text) {
    return 'S\'ha sentit: «$text»';
  }

  @override
  String get emergencyAlertEscalated => 'Sense resposta. Tria què vols fer:';

  @override
  String get emergencyAlertCall => 'Truca als serveis d\'emergència';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Truca al $number. iOS et demana confirmació.';
  }

  @override
  String get emergencyAlertMessage => 'Envia un missatge als contactes';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Obre un missatge preparat. Tu decideixes si l\'envies.';

  @override
  String get emergencyAlertTestMode => 'Mode de prova: no es farà cap trucada';

  @override
  String get emergencyAlertTestBadge => 'PROVA';

  @override
  String get emergencyAlertClose => 'Estic bé — Tanca';

  @override
  String get emergencyMsgSent => 'Missatge enviat.';

  @override
  String get emergencyMsgCancelled => 'Missatge no enviat.';

  @override
  String get emergencyMsgFailed => 'No s\'ha pogut enviar el missatge.';

  @override
  String get emergencyMsgUnavailable =>
      'La missatgeria no està disponible en aquest dispositiu.';

  @override
  String emergencyCallFailed(String number) {
    return 'No s\'ha pogut iniciar la trucada. Marca tu mateix el $number.';
  }

  @override
  String get modelsTitle => 'Models d\'IA';

  @override
  String get modelsIntro =>
      'Tots els models s\'inclouen amb l\'app i s\'executen íntegrament a l\'iPhone. La imatge de la càmera mai surt del dispositiu.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'En directe: $ms ms per fotograma · $hz deteccions/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Carregat en $ms ms';
  }

  @override
  String get modelsEfficientName => 'Eficient';

  @override
  String get modelsEfficientDesc =>
      'Detector ràpid i compacte, pensat per a llargs trajectes amb poca calor i baix consum de bateria.';

  @override
  String get modelsEnhancedName => 'Millorat';

  @override
  String get modelsEnhancedDesc =>
      'Detector més gran que troba objectes més petits i llunyans, amb un consum d\'energia més alt.';

  @override
  String get modelsSegmentationName => 'Segmentació';

  @override
  String get modelsSegmentationDesc =>
      'Combina una detecció ràpida amb màscares de la superfície de la carretera i dels objectes per a la vista de percepció.';

  @override
  String get modelsNoneName => 'IA en pausa';

  @override
  String get modelsNoneDesc =>
      'La càmera i la gravació continuen funcionant sense detecció d\'objectes. Consum d\'energia mínim.';

  @override
  String get modelsGenericDesc =>
      'Model de detecció d\'objectes al dispositiu.';

  @override
  String get modelsFunctionDetection =>
      'Detecta vehicles, persones, bicicletes, motocicletes, autobusos, semàfors i senyals de stop';

  @override
  String get modelsFunctionSegmentation =>
      'Afegeix màscares de la superfície de la carretera i dels objectes';

  @override
  String get modelsFunctionNone => 'Sense detecció; només gravació de dashcam';

  @override
  String get modelsSize => 'Mida';

  @override
  String get modelsInput => 'Entrada';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Compatible amb';

  @override
  String get modelsStatusInstalled => 'Instal·lat (inclòs)';

  @override
  String get modelsStatusNotInstalled => 'No instal·lat';

  @override
  String get modelsSelected => 'Seleccionat';

  @override
  String get modelsUse => 'Utilitza aquest model';

  @override
  String get modelsSwitching => 'S\'està carregant el model…';

  @override
  String modelsSwitched(String name) {
    return '$name ara està actiu';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Mesurat en aquest dispositiu: $ms ms de mitjana';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'No mesurat en aquest dispositiu';

  @override
  String get modelsBenchmarkRun => 'Executa la prova de rendiment';

  @override
  String get modelsBenchmarkRunning => 'S\'està mesurant el rendiment…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Selecciona aquest model per fer-ne la prova de rendiment.';

  @override
  String get modelsBenchmarkDone => 'Prova de rendiment completada';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'La prova de rendiment ha fallat: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Darrera actualització: $date';
  }

  @override
  String get safetyTitle => 'Informació de seguretat';

  @override
  String get safetyIntro =>
      'Corvista és una ajuda per estar més atent mentre condueixes. No controla el vehicle i no pot substituir la teva atenció, el teu criteri ni els sistemes de seguretat del vehicle.';

  @override
  String get safetyBeforeTitle => 'Abans de conduir';

  @override
  String get safetyBefore1 =>
      'Fixa bé l\'iPhone en una posició legal que no bloquegi la visió, els airbags ni els controls.';

  @override
  String get safetyBefore2 =>
      'Acaba la configuració, tria una vista i defineix la destinació amb el vehicle aparcat.';

  @override
  String get safetyBefore3 =>
      'Connecta un carregador en trajectes llargs i, si pots, evita que el telèfon rebi llum solar directa.';

  @override
  String get safetyWhileTitle => 'Mentre condueixes';

  @override
  String get safetyWhile1 =>
      'Mantén la vista a la carretera. Utilitza els controls grans de la pantalla només quan sigui segur i legal.';

  @override
  String get safetyWhile2 =>
      'Les alertes són ajudes, no avisos en què puguis confiar plenament. El silenci mai no vol dir que la carretera estigui lliure.';

  @override
  String get safetyWhile3 =>
      'Segueix les normes de circulació, els semàfors i els senyals, i no l\'app, quan no coincideixin.';

  @override
  String get safetyLimitsTitle => 'Limitacions';

  @override
  String get safetyLimits1 =>
      'La càmera d\'un sol telèfon només veu el que té al davant. Els objectes fora del seu camp de visió, tapats o molt a prop no es detecten.';

  @override
  String get safetyLimits2 =>
      'Les deteccions poden fallar, arribar tard o ser errònies, sobretot de nit, amb pluja, boira o enlluernament, o amb el parabrisa brut.';

  @override
  String get safetyLimits3 =>
      'Només es reconeixen les categories compatibles: vehicles, autobusos, motocicletes, bicicletes, persones, semàfors i senyals de stop. Les indicacions de carril de la vista virtual són estilitzades, no carrils detectats.';

  @override
  String get safetyLimits4 =>
      'La proximitat es mostra com a zones aproximades (Molt a prop, A prop, Mitjà, Lluny), mai com a distàncies mesurades. La vista d\'aparcament no substitueix els sensors d\'aparcament.';

  @override
  String get safetyHeatTitle => 'Calor i bateria';

  @override
  String get safetyHeat1 =>
      'L\'ús continu de la càmera i de la IA escalfa l\'iPhone. Corvista redueix la freqüència d\'anàlisi quan el dispositiu s\'escalfa i mostra un avís; si iOS es sobreescalfa, la càmera pot aturar-se.';

  @override
  String get safetyEmergencyTitle => 'Funció d\'emergència';

  @override
  String get safetyEmergency1 =>
      'La detecció de possibles impactes és experimental. Pot no detectar col·lisions reals i es pot activar per altres esdeveniments.';

  @override
  String get safetyEmergency2 =>
      'Mai contacta amb ningú en silenci: iOS sempre et demana que confirmis una trucada o un missatge. No substitueix trucar tu mateix als serveis d\'emergència.';

  @override
  String get privacyTitle => 'Privadesa';

  @override
  String get privacyIntro =>
      'Corvista està dissenyada perquè les teves dades de conducció es quedin a l\'iPhone. No hi ha cap compte de Corvista i Corvista no té servidors propis.';

  @override
  String get privacyCameraTitle => 'Càmera i IA';

  @override
  String get privacyCamera1 =>
      'La detecció, el seguiment i la segmentació d\'objectes s\'executen íntegrament a l\'iPhone. Els fotogrames de la càmera no es pugen mai.';

  @override
  String get privacyCamera2 =>
      'La càmera només funciona mentre Corvista és oberta a la pantalla. Es pausa quan l\'app passa a segon pla: no hi ha cap gravació oculta en segon pla.';

  @override
  String get privacyRecordingsTitle => 'Gravacions';

  @override
  String get privacyRecordings1 =>
      'El buffer continu és temporal i se sobreescriu constantment. Les imatges només es conserven quan toques Desa l\'incident o, si ho actives, després d\'un possible impacte.';

  @override
  String get privacyRecordings2 =>
      'Els clips desats es queden a l\'emmagatzematge privat de Corvista a l\'iPhone. Només surten del dispositiu quan tries Comparteix. Si elimines l\'app, també s\'eliminen.';

  @override
  String get privacyRecordings3 =>
      'L\'àudio només es grava si l\'actives i concedeixes accés al micròfon.';

  @override
  String get privacyLocationTitle => 'Ubicació';

  @override
  String get privacyLocation1 =>
      'La ubicació s\'utilitza mentre l\'app és oberta per a la velocitat, el mapa, les rutes i el temps. Si «Desa la ubicació» està activat, la posició en el moment de desar s\'emmagatzema amb el clip al dispositiu.';

  @override
  String get privacyNetworkTitle => 'Serveis de xarxa';

  @override
  String get privacyNetwork1 =>
      'Apple Maps: visualització del mapa, cerca de llocs i rutes. El text de cerca i la ubicació aproximada s\'envien a Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit): el temps actual i per hores a la teva ubicació.';

  @override
  String get privacyNetwork4 =>
      'Corvista no inclou publicitat ni analítiques o seguiment de tercers.';

  @override
  String get privacyEmergencyTitle => 'Contactes d\'emergència';

  @override
  String get privacyEmergency1 =>
      'Els contactes que tries es desen al clauer d\'iOS d\'aquest dispositiu. La cancel·lació per veu utilitza el reconeixement de veu al dispositiu quan està disponible. Les trucades i els missatges només s\'envien després que els confirmis a iOS.';

  @override
  String get privacyControlsTitle => 'Els teus controls';

  @override
  String get privacyControls1 =>
      'Pots eliminar clips en qualsevol moment a Clips i canviar o revocar l\'accés a la càmera, el micròfon, la ubicació i la veu a Configuració d\'iOS.';

  @override
  String get termsTitle => 'Condicions d\'ús';

  @override
  String get termsIntro =>
      'En utilitzar Corvista acceptes aquestes condicions. També s\'aplica el contracte de llicència d\'usuari final estàndard d\'Apple per a aplicacions amb llicència.';

  @override
  String get termsUseTitle => 'Ús de Corvista';

  @override
  String get termsUse1 =>
      'Corvista és una ajuda de consciència en la conducció i de dashcam. Continues sent plenament responsable de conduir de manera segura i legal en tot moment.';

  @override
  String get termsUse2 =>
      'No interactuïs amb l\'app de manera que et distregui mentre condueixes. Fixa el dispositiu de manera segura i legal.';

  @override
  String get termsAccuracyTitle => 'Sense garanties de precisió';

  @override
  String get termsAccuracy1 =>
      'Les deteccions, les zones, les alertes, els marcadors del mapa, les rutes i el temps poden ser incomplets, endarrerits o erronis. Corvista no controla el vehicle.';

  @override
  String get termsAccuracy2 =>
      'La funció d\'emergència és experimental i pot no detectar un impacte o activar-se per error.';

  @override
  String get termsRecordingTitle => 'Lleis de gravació';

  @override
  String get termsRecording1 =>
      'Les lleis sobre dashcams, gravació d\'àudio i filmació de persones varien segons el país i la regió. Ets responsable de complir-les, també quan comparteixes clips.';

  @override
  String get termsLiabilityTitle => 'Responsabilitat';

  @override
  String get termsLiability1 =>
      'L\'app es ofereix «tal com és». En la mesura que ho permeti la llei, el desenvolupador no es fa responsable d\'accidents, pèrdues, multes o danys derivats de l\'ús de l\'app o de la confiança en els seus resultats.';

  @override
  String get termsChangesTitle => 'Canvis';

  @override
  String get termsChanges1 =>
      'Aquestes condicions es poden actualitzar amb noves versions de l\'app. Si continues utilitzant l\'app després d\'una actualització, acceptes les condicions revisades.';

  @override
  String get helpTitle => 'Ajuda';

  @override
  String get helpIntro =>
      'Respostes a preguntes habituals. Per a la guia de seguretat, consulta Informació de seguretat.';

  @override
  String get helpQSave => 'Com puc conservar les imatges d\'un incident?';

  @override
  String get helpASaveBuffer =>
      'Toca el botó gran Desa l\'incident a la vista de conducció. Corvista desa a Clips els últims 20 o 30 segons de la seva memòria intermèdia contínua (ho tries a Configuració › Gravació).';

  @override
  String get helpQWhere => 'On es desen els meus clips?';

  @override
  String get helpAWhere =>
      'A l\'emmagatzematge privat de Corvista a l\'iPhone. Mai es pugen. Utilitza Comparteix al reproductor per enviar o exportar un clip.';

  @override
  String get helpQZones => 'Quina precisió tenen les zones de proximitat?';

  @override
  String get helpAZones =>
      'Les zones són estimacions aproximades d\'una sola càmera a partir de mides d\'objectes típiques. Considera-les indicacions aproximades, mai distàncies.';

  @override
  String get helpQSlow => 'Per què la detecció va més lenta?';

  @override
  String get helpASlow =>
      'Quan l\'iPhone s\'escalfa, la bateria és baixa o el mode de baix consum està activat, Corvista redueix la freqüència d\'anàlisi per protegir el dispositiu. Pots canviar el mode d\'energia a Configuració.';

  @override
  String get helpQMap => 'El mapa, la cerca o el temps no funciona.';

  @override
  String get helpAMap =>
      'Aquestes funcions necessiten connexió a internet i accés a la ubicació. Comprova la connexió i permet la ubicació per a Corvista a Configuració d\'iOS.';

  @override
  String get helpQSimulator => 'La càmera apareix com a no disponible.';

  @override
  String get helpASimulator =>
      'Assegura\'t que l\'accés a la càmera està permès a Configuració d\'iOS i que cap altra app l\'està utilitzant. Al simulador d\'iOS no hi ha càmera; es pot fer servir un vídeo de prova local.';

  @override
  String get emergencyMsgNoContacts =>
      'Afegeix primer un contacte d\'emergència.';

  @override
  String get cameraStarting => 'S\'està iniciant la càmera…';

  @override
  String get cameraInterrupted => 'Càmera en pausa';

  @override
  String get cameraInterruptedBody =>
      'iOS ha posat la càmera en pausa, per exemple durant una trucada o mentre una altra app l\'utilitza. Es reprendrà automàticament.';

  @override
  String get cameraUnavailable => 'Càmera no disponible';

  @override
  String get cameraUnavailableBody =>
      'No hi ha cap càmera disponible en aquest dispositiu. La detecció, la gravació i les vistes d\'aparcament necessiten la càmera posterior.';

  @override
  String get cameraRunTestFootage => 'Executa les imatges de prova';

  @override
  String get cameraPermissionDenied => 'L\'accés a la càmera està desactivat';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista necessita la càmera per a la detecció, la gravació de dashcam i les vistes d\'aparcament. Activa l\'accés a la càmera a Configuració.';

  @override
  String get cameraError => 'Error de la càmera';

  @override
  String get cameraStopped => 'Càmera aturada';

  @override
  String get cameraStart => 'Inicia la càmera';

  @override
  String get cameraFocusHint => 'Toca per enfocar';

  @override
  String get cameraPreviewLabel =>
      'Vista en directe de la càmera amb els objectes detectats';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Càmera $fps fps · IA $hz Hz · $ms ms · perduts $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Velocitat $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Sense velocitat GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Rumb $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Gravació del buffer de dashcam, $seconds de $target segons al buffer';
  }

  @override
  String get hudRecIdle => 'REC desactivat';

  @override
  String get hudRecSaving => 'Desant…';

  @override
  String get hudRecError => 'Error de REC';

  @override
  String get hudAiPaused => 'IA en pausa';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objectes',
      one: '1 objecte',
      zero: 'Cap objecte',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objectes detectats',
      one: '1 objecte detectat',
      zero: 'cap objecte detectat',
    );
    return 'Model d\'IA $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Calent: IA alentida';

  @override
  String get hudThermalCritical => 'Massa calent: IA en pausa';

  @override
  String hudBatteryLow(String percent) {
    return 'Bateria $percent';
  }

  @override
  String get hudLowPower => 'Mode de baix consum';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Temps $temperature, $condition. Toca per veure\'n els detalls.';
  }

  @override
  String get hudNoGuidance =>
      'Cerca una destinació a la vista de mapa per veure aquí les indicacions pas a pas.';

  @override
  String get navArrived => 'Has arribat';

  @override
  String get navRerouting => 'Recalculant la ruta…';

  @override
  String get navSearchHint => 'Cerca una destinació';

  @override
  String get navSearchFieldHint => 'Adreça, lloc o negoci';

  @override
  String get navNoResults => 'Cap lloc coincident';

  @override
  String get navSearching => 'Cercant…';

  @override
  String get navSearchStartTyping =>
      'Escriu una adreça o el nom d\'un lloc. Els resultats provenen d\'Apple Maps i cal connexió a internet.';

  @override
  String get navErrorUnavailable =>
      'La cerca i les rutes no estan disponibles: comprova la connexió a internet.';

  @override
  String get navErrorNoLocation =>
      'S\'està esperant la ubicació per planificar la ruta.';

  @override
  String get navErrorPermission =>
      'L\'accés a la ubicació està desactivat, per tant les rutes no poden començar des de la teva posició.';

  @override
  String navErrorGeneric(String code) {
    return 'No s\'han pogut carregar les rutes ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Rutes cap a $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Arribada: $time';
  }

  @override
  String get navStart => 'Inicia';

  @override
  String get navEnd => 'Finalitza';

  @override
  String get navEndLabel => 'Finalitza la navegació';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration restants';
  }

  @override
  String navAdvisory(String text) {
    return 'Avís: $text';
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
    return 'Ruta $index: $name';
  }

  @override
  String get weatherTitle => 'Temps';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Sensació de $temperature';
  }

  @override
  String get weatherPrecipitation => 'Precipitació';

  @override
  String get weatherWind => 'Vent';

  @override
  String get weatherVisibility => 'Visibilitat';

  @override
  String get weatherHumidity => 'Humitat';

  @override
  String get weatherHourly => 'Properes hores';

  @override
  String weatherAsOf(String time) {
    return 'Actualitzat a les $time';
  }

  @override
  String get weatherRefresh => 'Actualitza el temps';

  @override
  String get weatherUnavailable => 'El temps no està disponible ara mateix.';

  @override
  String get weatherNoLocation => 'El temps necessita la teva ubicació.';

  @override
  String get weatherLegal => 'Fonts de dades i avís legal';

  @override
  String weatherProvidedBy(String service) {
    return 'Dades meteorològiques: $service';
  }

  @override
  String get weatherNow => 'Ara';

  @override
  String get virtualEmpty => 'No s\'ha detectat cap objecte compatible';

  @override
  String get virtualEmptyCameraOff =>
      'La vista virtual necessita la càmera en directe.';

  @override
  String get virtualLaneDisclaimer =>
      'Les línies de carril són il·lustratives, no detectades.';

  @override
  String virtualNearest(String zone) {
    return 'Més a prop: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Escena virtual de la carretera: $summary';
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
  String get virtualStatusLive => 'en directe';

  @override
  String get virtualStatusPaused => 'en pausa';

  @override
  String get virtualStatusCameraOff => 'Càmera apagada';

  @override
  String get virtualStatusTestFootage => 'Imatges de prova';

  @override
  String get virtualEmptyHint =>
      'Els vehicles, les persones, les bicicletes, els semàfors i els senyals de stop apareixen aquí quan es detecten.';

  @override
  String get mapRecenter => 'Recentra';

  @override
  String get mapZoomIn => 'Amplia';

  @override
  String get mapZoomOut => 'Redueix';

  @override
  String get mapUnsupported =>
      'El mapa interactiu només està disponible a l\'iPhone.';

  @override
  String get mapObjectsApprox =>
      'Els marcadors d\'objectes són posicions aproximades.';

  @override
  String get mapWeatherUnavailable => 'Temps no disponible';

  @override
  String get navErrorNoRoute =>
      'No s\'ha trobat cap ruta cap a aquesta destinació.';

  @override
  String get navDismiss => 'Descarta';

  @override
  String get navGo => 'Vés-hi';

  @override
  String get navFastest => 'La més ràpida';

  @override
  String get navThen => 'Després';

  @override
  String get navRecents => 'Recents';

  @override
  String get navClearRecents => 'Esborra';

  @override
  String get navSearchSubmitHint =>
      'Prem Cerca per veure tots els llocs coincidents';

  @override
  String get navPlaces => 'Llocs';

  @override
  String get navEtaLabel => 'arribada';

  @override
  String get navTimeLeftLabel => 'restant';

  @override
  String get navOverview => 'Visió general';

  @override
  String get navMute => 'Silencia la veu';

  @override
  String get navUnmute => 'Activa la veu';

  @override
  String get navEndConfirm => 'Vols finalitzar la navegació?';

  @override
  String navEndConfirmBody(String place) {
    return 'S\'aturarà la guia cap a $place.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Has arribat a $place';
  }

  @override
  String get navDone => 'Fet';

  @override
  String get navWeakGps => 'Senyal GPS feble';

  @override
  String get navLocationOff =>
      'La ubicació està desactivada. Activa-la per planificar rutes i navegar.';

  @override
  String get navVoiceGuidance => 'Guia per veu';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'D\'aquí a $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first i, tot seguit, $second';
  }

  @override
  String get navSpeakRerouting => 'Recalculant la ruta';

  @override
  String get navSpeakArrived => 'Has arribat';

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
      other: '$value quilòmetres',
      one: '1 quilòmetre',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count peus',
      one: '1 peu',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count iardes',
      one: '1 iarda',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Continua durant $distance';
  }

  @override
  String get navErrorNoDirections =>
      'No hi ha indicacions disponibles per a aquest trajecte en aquesta regió. Prova una altra destinació.';

  @override
  String navContinueFor(String distance) {
    return 'Continua durant $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value milles',
      one: '1 milla',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Més a prop: $object · $zone';
  }

  @override
  String get parkingNothing => 'No s\'ha detectat res a la vista';

  @override
  String get parkingBeeps => 'Sons de proximitat';

  @override
  String get parkingVolume => 'Volum dels sons';

  @override
  String get parkingLimitations =>
      'Una sola càmera, no 360°. Els objectes fora del camp de visió de la càmera no es detecten. No substitueix els sensors d\'aparcament; les estimacions poden ser errònies i el silenci no vol dir que la zona estigui lliure.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Vista de proximitat des de dalt. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Original';

  @override
  String get perceptionModeBoxes => 'Quadres';

  @override
  String get perceptionModeMasks => 'Màscares d\'objectes';

  @override
  String get perceptionModeRoad => 'Superfície de la carretera';

  @override
  String get perceptionModeCombined => 'Combinat';

  @override
  String get perceptionOpacity => 'Opacitat de la màscara';

  @override
  String get perceptionDisclaimer =>
      'La màscara de la superfície de la carretera és una capa visual aproximada. No mostra l\'espai transitable ni els carrils.';

  @override
  String get perceptionNeedsModel =>
      'Selecciona el model de segmentació per veure les màscares.';

  @override
  String get perceptionChooseModel => 'Tria un model';

  @override
  String get perceptionWaiting =>
      'S\'està esperant el primer fotograma de segmentació…';

  @override
  String get perceptionShortCamera => 'Càmera';

  @override
  String get perceptionShortBoxes => 'Quadres';

  @override
  String get perceptionShortObjects => 'Objectes';

  @override
  String get perceptionShortRoad => 'Carretera';

  @override
  String get perceptionShortAll => 'Tot';

  @override
  String get perceptionModesLabel => 'Capes de percepció';

  @override
  String get perceptionStatusWarmingUp => 'Preparant…';

  @override
  String get perceptionStatusLoadingModel => 'Carregant el model…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Màscares en pausa';

  @override
  String get perceptionLegend => 'Llegenda de les màscares';

  @override
  String get perceptionUnavailable => 'Màscares no disponibles';

  @override
  String get driveSave => 'Desa';

  @override
  String get driveSaveIncident => 'Desa l\'incident';

  @override
  String driveSaveHint(int seconds) {
    return 'Desa els darrers $seconds segons d\'imatges de dashcam';
  }

  @override
  String get driveSaving => 'Desant l\'incident…';

  @override
  String hudRecManualLabel(String time) {
    return 'Gravant, $time';
  }

  @override
  String get driveRecord => 'Grava';

  @override
  String get driveRecordStartA11y => 'Inicia la gravació';

  @override
  String driveRecordStopA11y(String time) {
    return 'Atura la gravació, $time gravats';
  }

  @override
  String get driveRecordHint =>
      'Grava de manera contínua fins que l\'aturis, inclosos els 5 segons anteriors';

  @override
  String get driveRecordFailed => 'No s\'ha pogut iniciar la gravació';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gravació desada · $count parts',
      one: 'Gravació desada',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Gravació aturada: emmagatzematge gairebé ple',
      'max_duration': 'Gravació aturada: s\'ha assolit la durada màxima',
      'camera_stopped': 'Gravació aturada amb la càmera',
      'background': 'Gravació aturada: l\'app ha passat a segon pla',
      'thermal': 'Gravació aturada: el telèfon està massa calent',
      'other': 'Gravació aturada',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Incident desat · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Mostra';

  @override
  String get driveSaveFailed => 'No s\'ha pogut desar l\'incident.';

  @override
  String get driveSaveNotRunning =>
      'La gravació encara no ha començat: espera que la càmera s\'iniciï i torna-ho a provar.';

  @override
  String get driveSaveTestFootage =>
      'Les imatges de prova no es graven. El desament d\'incidents funciona amb la càmera en directe.';

  @override
  String get driveSaveStorageFull =>
      'L\'iPhone s\'ha quedat sense espai. Allibera espai o elimina clips més antics.';

  @override
  String get driveSaveIoError =>
      'No s\'ha pogut escriure el clip a l\'emmagatzematge.';

  @override
  String get driveClips => 'Clips';

  @override
  String get driveSettings => 'Configuració';

  @override
  String get driveViewSwitcher => 'Vistes de conducció';

  @override
  String get driveLocationDenied =>
      'La ubicació està desactivada: la velocitat, els mapes i les rutes no estan disponibles.';

  @override
  String get driveCameraDenied =>
      'L\'accés a la càmera està desactivat: la detecció i la gravació no estan disponibles.';

  @override
  String get driveRecorderFallback =>
      'Gravant sense àudio: l\'accés al micròfon està desactivat.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'S\'han ajustat els paràmetres de gravació: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'L\'iPhone està calent. La IA funciona més lenta per refredar-se: allunya\'l del sol directe i apropa\'l a una sortida d\'aire.';

  @override
  String get drivePowerThermalCritical =>
      'L\'iPhone està massa calent. La detecció d\'IA queda en pausa fins que es refredi; la gravació continua si és possible.';

  @override
  String get drivePowerLowPower =>
      'El mode de baix consum està activat: la IA s\'executa a una freqüència reduïda.';

  @override
  String get drivePowerBatteryLow =>
      'La bateria és baixa: connecta l\'iPhone a l\'alimentació mentre condueixes.';

  @override
  String get onboardingTitle1 => 'Veu més de cada trajecte.';

  @override
  String get onboardingBody1 =>
      'Converteix l\'iPhone en una dashcam intel·ligent i en un company de consciència en la conducció.';

  @override
  String get onboardingTitle2 => 'Intel·ligència en cada fotograma.';

  @override
  String get onboardingBody2 =>
      'Reconeix vehicles, persones, bicicletes i senyals de carretera compatibles directament a l\'iPhone.';

  @override
  String get onboardingTitle3 => 'Una carretera. Diverses perspectives.';

  @override
  String get onboardingBody3 =>
      'Canvia entre la detecció en directe, les vistes de conducció virtuals, els mapes interactius i la visualització d\'aparcament.';

  @override
  String get onboardingTitle4 => 'Conserva els moments que importen.';

  @override
  String get onboardingBody4 =>
      'Desa les imatges recents de la dashcam, revisa incidents i comparteix gravacions.';

  @override
  String get onboardingTitle5 => 'Seguretat i privadesa';

  @override
  String get onboardingSafety1 =>
      'Corvista és una ajuda per estar més atent en la conducció. Mantén la vista a la carretera.';

  @override
  String get onboardingSafety2 =>
      'No controla el vehicle ni substitueix el teu criteri.';

  @override
  String get onboardingSafety3 =>
      'Les deteccions i les estimacions poden ser inexactes o no detectar-se.';

  @override
  String get onboardingSafety4 =>
      'El processament de la càmera es fa a l\'iPhone: el vídeo no es puja.';

  @override
  String get onboardingSafety5 =>
      'Els mapes, la cerca, les rutes i el temps necessiten connexió a internet.';

  @override
  String get onboardingSafety6 =>
      'Fixa bé l\'iPhone perquè no bloquegi la visió.';

  @override
  String get onboardingSafety7 =>
      'Completa la configuració abans de començar a conduir.';

  @override
  String get onboardingAcknowledge =>
      'Entenc que Corvista és una ajuda de consciència i que continuo sent responsable de conduir de manera segura.';

  @override
  String get onboardingReadSafety => 'Llegeix tota la informació de seguretat';

  @override
  String get onboardingNext => 'Següent';

  @override
  String get onboardingSkip => 'Omet';

  @override
  String get onboardingAgree => 'Continua';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Pàgina $current de $total';
  }

  @override
  String get permTitle => 'Permisos';

  @override
  String get permIntro =>
      'Corvista només demana el que cada funció necessita. Pots canviar-ho en qualsevol moment a Configuració.';

  @override
  String get permCameraTitle => 'Càmera';

  @override
  String get permCameraBody =>
      'Necessària per a la detecció, la gravació de dashcam i la vista d\'aparcament. El vídeo es processa a l\'iPhone.';

  @override
  String get permLocationTitle => 'Ubicació';

  @override
  String get permLocationBody =>
      'S\'utilitza per a la velocitat GPS, el mapa, les rutes, el temps i l\'etiquetatge dels clips desats. Només mentre utilitzes l\'app.';

  @override
  String get permMicTitle => 'Micròfon';

  @override
  String get permSpeechNote =>
      'El reconeixement de veu només es demana si actives la cancel·lació per veu per a les alertes d\'emergència.';

  @override
  String get permRequired => 'Obligatori';

  @override
  String get permOptional => 'Opcional';

  @override
  String get permAllow => 'Permet';

  @override
  String get permGranted => 'Permès';

  @override
  String get permDenied => 'Denegat';

  @override
  String get permLimited => 'Limitat';

  @override
  String get permRestricted => 'Restringit';

  @override
  String get permStart => 'Comença a conduir';

  @override
  String get permCameraNeeded =>
      'Pots continuar sense accés a la càmera, però la detecció i la gravació no funcionaran fins que el permetis a Configuració.';

  @override
  String get permSetupIntro =>
      'Corvista els necessita per funcionar plenament. Toca Permet-ho tot i iOS te\'ls demanarà un per un. Pots canviar-ho en qualsevol moment a Configuració.';

  @override
  String get permCameraLine =>
      'Necessària per a la detecció, la gravació de dashcam i la vista d\'aparcament. El vídeo es processa a l\'iPhone i no es puja mai.';

  @override
  String get permLocationLine =>
      'Velocitat GPS, mapa, rutes, temps i on s\'han desat els clips. Només mentre utilitzes l\'app.';

  @override
  String get permMicLine =>
      'L\'àudio de l\'habitacle als clips d\'incidents i escoltar la frase de cancel·lació durant una alerta d\'emergència.';

  @override
  String get permSpeechTitle => 'Reconeixement de veu';

  @override
  String get permSpeechLine =>
      'Reconeix la frase de cancel·lació durant un compte enrere d\'emergència, a l\'iPhone quan és compatible.';

  @override
  String get permAllowAll => 'Permet-ho tot';

  @override
  String permAsking(String permission) {
    return 'S\'està demanant $permission…';
  }

  @override
  String get permSomeDenied =>
      'Alguns permisos estan desactivats. Activa\'ls a Configuració per utilitzar aquestes funcions.';

  @override
  String get permNotNow => 'Ara no';

  @override
  String get tourLabel => 'Visita guiada de la pantalla de conducció';

  @override
  String tourProgress(int current, int total) {
    return 'Pas $current de $total';
  }

  @override
  String get tourNext => 'Següent';

  @override
  String get tourBack => 'Enrere';

  @override
  String get tourSkip => 'Omet la visita';

  @override
  String get tourFinish => 'Comença a conduir';

  @override
  String get tourWelcomeTitle => 'La teva visita ràpida';

  @override
  String get tourWelcomeBody =>
      'Un cop d\'ull d\'un minut al que importa a la pantalla de conducció. Millor si es fa amb el vehicle aparcat.';

  @override
  String get tourHudTitle => 'La teva barra d\'instruments';

  @override
  String get tourHudSpeed => 'La velocitat ve del GPS.';

  @override
  String get tourHudRec =>
      'REC mostra quants segons d\'imatges hi ha al buffer.';

  @override
  String get tourHudAi =>
      'L\'etiqueta d\'IA mostra el model, quants objectes veu i un punt: verd en funcionament, ambre limitat, vermell aturat.';

  @override
  String get tourSaveTitle => 'Desa l\'incident';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista manté un buffer continu amb els darrers $seconds segons de vídeo. Se sobreescriu constantment, de manera que no es conserva res si no toques Desa. Els clips desats es queden en aquest iPhone, a Clips.';
  }

  @override
  String get tourRecordTitle => 'Grava tot el trajecte';

  @override
  String get tourRecordBody =>
      'Toca Grava per filmar de manera contínua fins que l\'aturis. Els trajectes llargs es desen a Clips en parts de 5 minuts, i Desa l\'incident continua funcionant mentre graves.';

  @override
  String get tourViewsTitle => 'Cinc maneres de veure la carretera';

  @override
  String get tourViewDetection =>
      'Càmera en directe amb quadres al voltant dels objectes compatibles.';

  @override
  String get tourViewVirtual =>
      'Una escena 3D simplificada creada a partir de les deteccions.';

  @override
  String get tourViewMap => 'Apple Maps amb cerca i guia pas a pas.';

  @override
  String get tourViewParking => 'Càmera i una vista de proximitat des de dalt.';

  @override
  String get tourViewPerception => 'Màscares de carretera i objectes.';

  @override
  String get tourMapTitle => 'Cerca i guia pas a pas';

  @override
  String get tourMapBody =>
      'Obre Mapa, toca la barra de cerca i tria una destinació. Tria una ruta i toca Inicia per obtenir la guia pas a pas. Cal connexió a internet.';

  @override
  String get tourClipsTitle => 'Clips';

  @override
  String get tourClipsBody =>
      'Revisa, canvia el nom, comparteix o elimina els incidents desats. Els clips es queden a l\'iPhone tret que els comparteixis.';

  @override
  String get tourSettingsTitle => 'Configuració';

  @override
  String get tourSettingsBody =>
      'Ajusta les alertes de veu i la seva sensibilitat, la qualitat de gravació i la durada del buffer, i configura el mode d\'emergència: una alerta d\'impacte experimental amb compte enrere de cancel·lació.';

  @override
  String get tourSafetyTitle => 'Abans de conduir';

  @override
  String get tourSafety1 => 'Fixa bé l\'iPhone on no bloquegi la visió.';

  @override
  String get tourSafety2 =>
      'No interactuïs amb l\'app mentre condueixes. Configura-ho tot amb el vehicle aparcat.';

  @override
  String get tourSafety3 =>
      'Les deteccions i les zones són estimacions. Poden ser errònies o no detectar-se.';

  @override
  String get tourSafety4 =>
      'Continues sent responsable de conduir de manera segura.';

  @override
  String get helpTakeTour => 'Fes la visita';

  @override
  String get helpTakeTourSub =>
      'Un cop d\'ull guiat d\'un minut a la pantalla de conducció.';

  @override
  String get tripsTitle => 'Trajectes';

  @override
  String get tripsOpen => 'Registre de trajectes';

  @override
  String get tripsEmptyTitle => 'Encara no hi ha trajectes';

  @override
  String get tripsEmptyBody =>
      'Els trajectes es graven automàticament quan condueixes amb Corvista: distància, temps, velocitat i la ruta que has fet.';

  @override
  String get tripsDisabledBody =>
      'El registre de trajectes està desactivat, de manera que els nous trajectes no es graven. Activa\'l per mantenir un registre privat de les rutes en aquest iPhone.';

  @override
  String get tripsEnable => 'Activa el registre de trajectes';

  @override
  String get tripsToday => 'Avui';

  @override
  String get tripsYesterday => 'Ahir';

  @override
  String tripsRecordingNow(String distance) {
    return 'Gravant un trajecte · $distance';
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
      one: '1 alerta',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trajectes',
      one: '1 trajecte',
      zero: 'Cap trajecte',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Distància';

  @override
  String get tripsStatDuration => 'Durada';

  @override
  String get tripsStatMoving => 'Temps en moviment';

  @override
  String get tripsStatAvgSpeed => 'Vel. mitjana';

  @override
  String get tripsStatMaxSpeed => 'Vel. màxima';

  @override
  String get tripsDetections => 'Deteccions';

  @override
  String get tripsNoDetections =>
      'No s\'ha registrat cap objecte de la carretera en aquest trajecte.';

  @override
  String get tripsTimeline => 'Cronologia';

  @override
  String get tripsEventStart => 'Trajecte iniciat';

  @override
  String get tripsEventEnd => 'Trajecte finalitzat';

  @override
  String get tripsEventAlert => 'Alerta de veu';

  @override
  String get tripsEventIncident => 'Clip d\'incident desat';

  @override
  String get tripsEventEmergency => 'S\'ha detectat una possible col·lisió';

  @override
  String get tripsEventNavStart => 'Navegació iniciada';

  @override
  String get tripsEventArrive => 'Arribada a la destinació';

  @override
  String get tripsEventReroute => 'Ruta recalculada';

  @override
  String get tripsEventRecording => 'Gravació desada';

  @override
  String get tripsOpenClip => 'Obre el clip';

  @override
  String get tripsTrackPreview => 'Traça GPS';

  @override
  String get tripsRenameTitle => 'Canvia el nom del trajecte';

  @override
  String get tripsRenameHint => 'Nom del trajecte';

  @override
  String get tripsFavorite => 'Afegeix als preferits';

  @override
  String get tripsUnfavorite => 'Elimina dels preferits';

  @override
  String get tripsShareGpx => 'Comparteix GPX';

  @override
  String get tripsShareFailed => 'No s\'ha pogut compartir aquest trajecte.';

  @override
  String get tripsDelete => 'Elimina el trajecte';

  @override
  String get tripsDeleteConfirmTitle => 'Vols eliminar aquest trajecte?';

  @override
  String get tripsDeleteConfirmBody =>
      'La ruta i les estadístiques s\'eliminaran d\'aquest iPhone. Els clips d\'incidents d\'aquest trajecte es conserven.';

  @override
  String get tripsDeleted => 'Trajecte eliminat';

  @override
  String get tripsNotFound => 'Aquest trajecte ja no està disponible.';

  @override
  String get tripsPrivacyNote =>
      'Només es desa en aquest iPhone. No es puja res.';

  @override
  String get settingsSectionTrips => 'Registre de trajectes';

  @override
  String get settingsTripLog => 'Registra els trajectes';

  @override
  String get settingsTripLogSubtitle =>
      'Conserva la teva ruta i les estadístiques de conducció només en aquest iPhone.';

  @override
  String get settingsTripRetention => 'Conserva els trajectes durant';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dies',
      one: '1 dia',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 any';

  @override
  String get settingsRetentionForever => 'Per sempre';

  @override
  String get settingsTripRetentionFooter =>
      'Els trajectes més antics s\'eliminen automàticament quan s\'inicia Corvista.';

  @override
  String get settingsViewTrips => 'Mostra els trajectes';

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
    return 'Trajecte de Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Allibera espai';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Elimina els fitxers temporals i les memòries cau. Els clips i els trajectes desats es conserven.';

  @override
  String settingsFreedBytes(String size) {
    return 'S\'han alliberat $size';
  }

  @override
  String get settingsNothingToFree =>
      'Memòries cau esborrades: no hi ha fitxers temporals per eliminar.';

  @override
  String get settingsSectionPrivacyData => 'Privadesa i dades';

  @override
  String get settingsPrivacyDataFooter =>
      'Els clips, els trajectes i la configuració només es guarden en aquest iPhone. Només en surten quan tu tries compartir-los.';

  @override
  String get settingsDeleteAllData => 'Elimina totes les dades';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Esborra clips, trajectes, contactes i configuració d\'aquest iPhone';

  @override
  String get deleteAllTitle => 'Vols eliminar totes les dades?';

  @override
  String get deleteAllMessage =>
      'Això eliminarà de manera permanent d\'aquest iPhone:\n• Clips d\'incidents i miniatures\n• Registre de trajectes i rutes GPS\n• Contactes d\'emergència i esdeveniments d\'emergència\n• Registres de detecció i registre de diagnòstic\n• Configuració i destinacions recents\n• Memòria intermèdia de gravació temporal i cau\n\nAixò no es pot desfer. Després, Corvista tornarà a començar des de les pantalles de benvinguda.';

  @override
  String get deleteAllConfirm => 'Elimina-ho tot';

  @override
  String get deleteAllInProgress => 'Eliminant…';

  @override
  String get deleteAllDone => 'Totes les dades eliminades';

  @override
  String get deleteAllPartial =>
      'Alguns elements no s\'han pogut eliminar. Torna-ho a provar des de Configuració.';

  @override
  String get diagLogSection => 'Registre de diagnòstic';

  @override
  String get diagLogFooter =>
      'Els errors només es registren en aquest iPhone, sense ubicacions, noms de contactes ni números de telèfon. No s\'envia res tret que comparteixis tu mateix el registre.';

  @override
  String get diagLogShare => 'Comparteix el registre de diagnòstic';

  @override
  String get diagLogEmpty => 'Buit';

  @override
  String get diagLogClear => 'Esborra el registre';

  @override
  String get diagLogClearTitle => 'Vols esborrar el registre de diagnòstic?';

  @override
  String get diagLogClearBody =>
      'Les entrades d\'error desades s\'eliminaran d\'aquest iPhone.';

  @override
  String get diagLogCleared => 'Registre de diagnòstic esborrat';

  @override
  String get diagLogShareFailed =>
      'No s\'ha pogut compartir el registre de diagnòstic.';

  @override
  String get privacyControls2 =>
      'Configuració › Privadesa i dades › Elimina totes les dades esborra tots els clips, trajectes, contactes, registres i ajustos que Corvista té desats en aquest iPhone.';

  @override
  String get parkingZoneStop => 'Atura';

  @override
  String get parkingZoneVeryClose => 'Molt a prop';

  @override
  String get parkingZoneClose => 'A prop';

  @override
  String get parkingZoneNothingClose => 'No es veu res a prop';

  @override
  String get parkingNotDetected =>
      'No es detecten parets, pilars, pals ni vorades';

  @override
  String get parkingApprox => 'aprox.';

  @override
  String get parkingSideLeft => 'Esquerra';

  @override
  String get parkingSideCenter => 'Centre';

  @override
  String get parkingSideRight => 'Dreta';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Només vista de la càmera frontal — no és un sistema 360°';

  @override
  String get parkingMuteBeeps => 'Silencia els pitits';

  @override
  String get parkingUnmuteBeeps => 'Activa els pitits';

  @override
  String get parkingAbout => 'Sobre la vista d\'aparcament';

  @override
  String get parkingLimitationsDetail =>
      'Només es vigila la zona davant de la càmera. El detector reconeix cotxes, autobusos i camions, persones, bicicletes i motos. Les parets, els pilars, els pals, les vorades, els pilons, les barreres i els obstacles baixos NO es detecten, i el capó pot amagar el terra just davant. Les distàncies són estimacions aproximades a partir d\'una sola càmera (mida i posició de l\'objecte) i poden ser molt errònies. El silenci o «No es veu res a prop» no vol dir que el camí estigui lliure: mira sempre al teu voltant i fes servir els retrovisors.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Proximitat per costat: esquerra $left, centre $center, dreta $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Els errors s\'escriuen en un registre privat d\'aquest iPhone (sense ubicacions, noms de contactes ni números de telèfon). Mai s\'envia automàticament; el pots compartir o esborrar a Configuració › Diagnòstic.';
}
