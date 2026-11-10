// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Vedi di più a ogni viaggio.';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get commonSave => 'Salva';

  @override
  String get commonBack => 'Indietro';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get commonRetry => 'Riprova';

  @override
  String get commonOpenSettings => 'Apri Impostazioni';

  @override
  String get commonLoading => 'Caricamento…';

  @override
  String get commonError => 'Qualcosa è andato storto.';

  @override
  String commonErrorDetail(String message) {
    return 'Qualcosa è andato storto: $message';
  }

  @override
  String get commonOn => 'Attivo';

  @override
  String get commonOff => 'Disattivato';

  @override
  String get commonRename => 'Rinomina';

  @override
  String get commonShare => 'Condividi';

  @override
  String get commonNotAvailable => 'Non disponibile';

  @override
  String get commonTestFootage => 'FILMATO DI PROVA';

  @override
  String get zoneVeryClose => 'Molto vicino';

  @override
  String get zoneClose => 'Vicino';

  @override
  String get zoneMedium => 'Medio';

  @override
  String get zoneFar => 'Lontano';

  @override
  String get zoneUnknown => 'Sconosciuta';

  @override
  String get classPerson => 'Persona';

  @override
  String get classBicycle => 'Bicicletta';

  @override
  String get classMotorcycle => 'Moto';

  @override
  String get classCar => 'Veicolo';

  @override
  String get classBus => 'Autobus';

  @override
  String get classTrafficLight => 'Semaforo';

  @override
  String get classStopSign => 'Segnale di stop';

  @override
  String get viewDetection => 'Rilevamento';

  @override
  String get viewVirtual => 'Virtuale';

  @override
  String get viewMap => 'Mappa';

  @override
  String get viewParking => 'Parcheggio';

  @override
  String get viewPerception => 'Percezione';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Rosso';

  @override
  String get lightYellow => 'Giallo';

  @override
  String get lightGreen => 'Verde';

  @override
  String get lightUnknown => 'Sconosciuto';

  @override
  String get clipsTitle => 'Clip';

  @override
  String get clipsSelect => 'Seleziona';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selezionate',
      one: '1 selezionata',
      zero: 'Seleziona clip',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Seleziona tutto';

  @override
  String get clipsDeselectAll => 'Deseleziona tutto';

  @override
  String get clipsDeleteSelected => 'Elimina selezionate';

  @override
  String get clipsGridView => 'Vista a griglia';

  @override
  String get clipsListView => 'Vista a elenco';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminare $count clip?',
      one: 'Eliminare questa clip?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Questi video verranno rimossi definitivamente dal tuo iPhone. L\'operazione non può essere annullata.',
      one: 'Il video verrà rimosso definitivamente dal tuo iPhone. L\'operazione non può essere annullata.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip eliminate',
      one: 'Clip eliminata',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Ancora nessuna clip';

  @override
  String get clipsEmptyBody =>
      'Mentre guidi, Corvista mantiene un breve buffer continuo. Tocca Salva incidente per conservare qui gli ultimi secondi di filmato.';

  @override
  String get clipsLoadError => 'Impossibile caricare le tue clip.';

  @override
  String get clipsStorageTitle => 'Spazio';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Clip $clips · Buffer $buffer · $free liberi';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip salvate',
      one: '1 clip salvata',
      zero: 'Nessuna clip salvata',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Lo spazio sul tuo iPhone è in esaurimento. I nuovi incidenti potrebbero non essere salvati.';

  @override
  String get clipsMissingFile => 'File mancante';

  @override
  String get clipsEmergencyBadge => 'Impatto';

  @override
  String clipsUntitled(String date) {
    return 'Incidente · $date';
  }

  @override
  String get clipsAudio => 'Audio registrato';

  @override
  String get clipsFavorite => 'Preferita';

  @override
  String get clipsUnfavorite => 'Rimuovi dai preferiti';

  @override
  String get clipsLocation => 'Posizione salvata';

  @override
  String clipsOpenClip(String title) {
    return 'Apri clip $title';
  }

  @override
  String get playerNotFoundTitle => 'Clip non trovata';

  @override
  String get playerNotFoundBody =>
      'Questa clip potrebbe essere stata eliminata.';

  @override
  String get playerMissingTitle => 'File video mancante';

  @override
  String get playerMissingBody =>
      'La registrazione di questa clip non è più sul tuo iPhone. Puoi rimuovere la voce dalla galleria.';

  @override
  String get playerRemoveEntry => 'Rimuovi voce';

  @override
  String get playerLoadError => 'Impossibile riprodurre questo video.';

  @override
  String get playerPlay => 'Riproduci';

  @override
  String get playerPause => 'Pausa';

  @override
  String get playerReplay => 'Riproduci di nuovo';

  @override
  String get playerRenameTitle => 'Rinomina clip';

  @override
  String get playerRenameHint => 'Nome della clip';

  @override
  String get playerRenamed => 'Clip rinominata';

  @override
  String get playerFavorited => 'Aggiunta ai preferiti';

  @override
  String get playerUnfavorited => 'Rimossa dai preferiti';

  @override
  String get playerShareFailed => 'Impossibile condividere questa clip.';

  @override
  String get playerDetails => 'Dettagli';

  @override
  String get playerDate => 'Registrata';

  @override
  String get playerDuration => 'Durata';

  @override
  String get playerResolution => 'Risoluzione';

  @override
  String get playerSize => 'Dimensione file';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerAudioYes => 'Registrato';

  @override
  String get playerAudioNo => 'Non registrato';

  @override
  String get playerReason => 'Salvata da';

  @override
  String get playerReasonManual => 'Pulsante Salva incidente';

  @override
  String get playerReasonEmergency => 'Possibile rilevamento di impatto';

  @override
  String get playerReasonRecovered => 'Recuperata dopo un\'interruzione';

  @override
  String get playerSpeed => 'Velocità GPS al salvataggio';

  @override
  String get playerLocation => 'Posizione';

  @override
  String get playerOpenInMaps => 'Apri in Mappe';

  @override
  String get playerBack => 'Indietro';

  @override
  String get playerMore => 'Altre azioni';

  @override
  String get clipsFilterLabel => 'Mostra';

  @override
  String get clipsFilterAll => 'Tutte';

  @override
  String get clipsFilterRecordings => 'Registrazioni';

  @override
  String get clipsFilterIncidents => 'Incidenti';

  @override
  String get clipsFilterEmergency => 'Emergenze';

  @override
  String get clipsFilterFavorites => 'Preferite';

  @override
  String get clipsSort => 'Ordina';

  @override
  String get clipsSortNewest => 'Più recenti prima';

  @override
  String get clipsSortOldest => 'Più vecchie prima';

  @override
  String get clipsSortLongest => 'Più lunghe prima';

  @override
  String get clipsSortLargest => 'Più grandi prima';

  @override
  String get clipsToday => 'Oggi';

  @override
  String get clipsYesterday => 'Ieri';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip',
      one: '1 clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Ancora nessuna clip in questa categoria.';

  @override
  String get clipsFavoritesEmpty =>
      'Contrassegna una clip con la stella per averla qui a portata di mano.';

  @override
  String get clipsKindRecording => 'Registrazione';

  @override
  String get clipsKindIncident => 'Incidente';

  @override
  String get clipsKindEmergency => 'Emergenza';

  @override
  String get clipsKindTest => 'Prova';

  @override
  String clipsTripChip(String time) {
    return 'Viaggio · $time';
  }

  @override
  String get clipsOpenTrip =>
      'Apri il viaggio in cui è stata registrata questa clip';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used usati · $free liberi';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Le clip occupano $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registrazioni',
      one: '1 registrazione',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count incidenti',
      one: '1 incidente',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emergenze',
      one: '1 emergenza',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Libera spazio';

  @override
  String get clipsStorageLowGentle =>
      'Meno di 2 GB liberi. Per continuare a registrare senza problemi, libera spazio o rimuovi le clip che non ti servono più.';

  @override
  String get clipsSaveToPhotos => 'Salva in Foto';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip',
      one: '1 clip',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminare $count clip ($size)?',
      one: 'Eliminare questa clip ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Salvataggio di $done su $total in Foto…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip salvate in Foto',
      one: 'Salvata in Foto',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved salvate in Foto · $failed non è stato possibile salvarle';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista non ha il permesso di aggiungere video a Foto. Puoi consentirlo in Impostazioni.';

  @override
  String get clipsPhotosFailed => 'Impossibile salvare in Foto.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip aggiunte ai preferiti',
      one: 'Aggiunta ai preferiti',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip rimosse dai preferiti',
      one: 'Rimossa dai preferiti',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (tagliata)';
  }

  @override
  String get playerTrim => 'Taglia';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Tipo';

  @override
  String get playerReasonRecording => 'Pulsante Registra';

  @override
  String get trimTitle => 'Taglia clip';

  @override
  String get trimHint =>
      'Trascina le maniglie per scegliere la parte da conservare. La clip originale resta invariata.';

  @override
  String get trimStartHandle => 'Inizio del taglio';

  @override
  String get trimEndHandle => 'Fine del taglio';

  @override
  String trimSelection(String duration) {
    return 'Selezione: $duration';
  }

  @override
  String get trimSave => 'Salva come nuova clip';

  @override
  String get trimSaving => 'Salvataggio della clip tagliata…';

  @override
  String get trimSaved => 'Clip tagliata salvata';

  @override
  String get trimOpenNew => 'Apri';

  @override
  String get trimFailed => 'Impossibile tagliare questa clip.';

  @override
  String get trimStorageFull =>
      'Spazio libero insufficiente per salvare la clip tagliata.';

  @override
  String get trimPreview => 'Riproduci selezione';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsSectionCamera => 'Fotocamera';

  @override
  String get settingsSectionAi => 'IA';

  @override
  String get settingsSectionAlerts => 'Avvisi';

  @override
  String get settingsSectionAlertCategories => 'Categorie di avvisi';

  @override
  String get settingsSectionRecording => 'Registrazione';

  @override
  String get settingsSectionDriving => 'Guida';

  @override
  String get settingsSectionPower => 'Energia';

  @override
  String get settingsSectionEmergency => 'Emergenza';

  @override
  String get settingsSectionAppearance => 'Aspetto';

  @override
  String get settingsSectionLanguage => 'Lingua';

  @override
  String get settingsSectionInformation => 'Informazioni';

  @override
  String get settingsCameraLens => 'Obiettivo';

  @override
  String get settingsLensWide => 'Grandangolo';

  @override
  String get settingsLensUltraWide => 'Ultra grandangolo';

  @override
  String get settingsLensTelephoto => 'Teleobiettivo';

  @override
  String get settingsLensUnavailable => 'Non disponibile su questo iPhone';

  @override
  String get settingsStabilization => 'Stabilizzazione';

  @override
  String get settingsStabAuto => 'Automatica';

  @override
  String get settingsStabOff => 'Disattivata';

  @override
  String get settingsStabStandard => 'Standard';

  @override
  String get settingsStabCinematic => 'Cinema';

  @override
  String get settingsOverlayOpacity => 'Opacità sovrapposizione';

  @override
  String get settingsShowFps => 'Mostra statistiche prestazioni';

  @override
  String get settingsShowFpsSubtitle =>
      'Frequenza fotogrammi e tempo di inferenza nella vista di rilevamento';

  @override
  String get settingsCameraFooter =>
      'Le modifiche a obiettivo e stabilizzazione si applicano al prossimo avvio della fotocamera.';

  @override
  String get settingsAiModel => 'Modello IA';

  @override
  String get settingsConfidence => 'Affidabilità del rilevamento';

  @override
  String get settingsTracking => 'Tracciamento oggetti';

  @override
  String get settingsTrackingSubtitle =>
      'Mantiene stabili gli oggetti tra i fotogrammi';

  @override
  String get settingsShowLabels => 'Mostra etichette';

  @override
  String get settingsShowConfidence => 'Mostra affidabilità';

  @override
  String get settingsSegmentationOpacity => 'Opacità maschera di percezione';

  @override
  String get settingsAiFooter =>
      'Un\'affidabilità minore mostra più oggetti, ma anche più falsi rilevamenti. I rilevamenti possono essere imprecisi.';

  @override
  String get settingsVoiceAlerts => 'Avvisi vocali';

  @override
  String get settingsVoiceLanguage => 'Lingua della voce';

  @override
  String get settingsVoiceLanguageAuto => 'Come la lingua dell\'app';

  @override
  String get settingsVoice => 'Voce';

  @override
  String get settingsVoiceDefault => 'Predefinita di sistema';

  @override
  String get settingsVoiceQualityEnhanced => 'Avanzata';

  @override
  String get settingsVoiceQualityPremium => 'Alta qualità';

  @override
  String get settingsNoVoices =>
      'Nessuna voce installata per questa lingua. Aggiungine una in Impostazioni iOS › Accessibilità › Contenuti vocali.';

  @override
  String get settingsAlertPedestrian => 'Pedoni';

  @override
  String get settingsAlertCyclist => 'Ciclisti';

  @override
  String get settingsAlertMotorcycle => 'Moto';

  @override
  String get settingsAlertBus => 'Autobus';

  @override
  String get settingsAlertVehicleClose => 'Veicolo molto vicino davanti';

  @override
  String get settingsAlertTrafficLight => 'Cambi di semaforo';

  @override
  String get settingsAlertTrafficMoving => 'Traffico davanti in movimento';

  @override
  String get settingsAlertStopSign => 'Segnali di stop';

  @override
  String get settingsSensitivity => 'Sensibilità';

  @override
  String get settingsSensitivityLow => 'Bassa';

  @override
  String get settingsSensitivityMedium => 'Media';

  @override
  String get settingsSensitivityHigh => 'Alta';

  @override
  String get settingsCooldown => 'Intervallo di ripetizione';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Volume della voce';

  @override
  String get settingsQuietMode => 'Modalità silenziosa';

  @override
  String get settingsQuietModeSubtitle =>
      'Vengono annunciati solo gli avvisi più importanti';

  @override
  String get settingsTestVoice => 'Prova la voce';

  @override
  String get settingsTestVoiceDone => 'Riproduzione di un avviso di esempio…';

  @override
  String get settingsParkingBeeps => 'Segnali di parcheggio';

  @override
  String get settingsBeepVolume => 'Volume dei segnali';

  @override
  String get settingsAlertsFooter =>
      'Gli avvisi sono solo un aiuto. Guarda sempre la strada: il silenzio non significa che la via sia libera.';

  @override
  String get settingsRecordingProfile => 'Qualità di registrazione';

  @override
  String get settingsProfileStandard => 'Standard · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Buffer incidente';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds secondi';
  }

  @override
  String get settingsManualMaxLength => 'Durata massima registrazione manuale';

  @override
  String get settingsManualMaxUnlimited => 'Illimitata';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Registra audio';

  @override
  String get settingsRecordAudioSubtitle =>
      'Include l\'audio dell\'abitacolo negli incidenti salvati';

  @override
  String get settingsMicDenied =>
      'L\'accesso al microfono è disattivato. Consentilo in Impostazioni per registrare l\'audio.';

  @override
  String get settingsWatermark => 'Filigrana Corvista';

  @override
  String get settingsTimestamp => 'Data e ora sul video';

  @override
  String get settingsSaveLocation => 'Salva la posizione con le clip';

  @override
  String get settingsStorage => 'Spazio e clip';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clip',
      one: '1 clip',
      zero: 'Nessuna clip',
    );
    return '$_temp0 · $used usati · $free liberi';
  }

  @override
  String get settingsRecordingFooter =>
      'Il buffer continuo resta sul tuo iPhone e viene sovrascritto di continuo. Nulla viene registrato in background.';

  @override
  String get settingsDefaultView => 'Vista predefinita';

  @override
  String get settingsUnits => 'Unità';

  @override
  String get settingsShowCompass => 'Mostra bussola';

  @override
  String get settingsHudStyle => 'Stile HUD';

  @override
  String get settingsHudCustomize => 'Personalizza HUD';

  @override
  String get settingsDrivingSide => 'Lato di guida';

  @override
  String get settingsDrivingSideAuto => 'Automatico';

  @override
  String get settingsDrivingSideRight => 'Destra';

  @override
  String get settingsDrivingSideLeft => 'Sinistra';

  @override
  String get settingsVirtualStyle => 'Stile della vista virtuale';

  @override
  String get settingsVirtualMinimal => 'Minimale';

  @override
  String get settingsVirtualPerspective => 'Prospettiva';

  @override
  String get settingsVirtualHighContrast => 'Alto contrasto';

  @override
  String get settingsKeepScreenOn => 'Tieni lo schermo acceso alla guida';

  @override
  String get settingsLiveActivity => 'Attività in tempo reale';

  @override
  String get settingsLiveActivityDesc =>
      'Mostra le indicazioni sulla schermata di blocco e nella Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Registrazione in pausa mentre Corvista era in background';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'In pausa';

  @override
  String get liveActivityDashcamOff => 'Camera off';

  @override
  String get liveActivityEnded => 'Navigazione terminata';

  @override
  String get liveActivityEta => 'Arrivo';

  @override
  String get settingsAutoRecenter => 'Ricentra mappa automaticamente';

  @override
  String get settingsHudStyleClassic => 'Classico';

  @override
  String get settingsHudStyleGrid => 'Griglia';

  @override
  String get settingsHudStyleMinimal => 'Minimale';

  @override
  String get settingsHudStylePerformance => 'Prestazioni';

  @override
  String get settingsHudStyleNavigation => 'Navigazione';

  @override
  String get settingsHudStyleNight => 'Notte';

  @override
  String get settingsHudStyleHighContrast => 'Alto contrasto';

  @override
  String get settingsPowerMode => 'Modalità energia';

  @override
  String get settingsPowerBalanced => 'Bilanciata';

  @override
  String get settingsPowerPerformance => 'Prestazioni';

  @override
  String get settingsPowerSaver => 'Risparmio';

  @override
  String get settingsPowerFooter =>
      'Corvista riduce automaticamente la frequenza dell\'IA e gli effetti visivi quando l\'iPhone si scalda o la batteria è scarica.';

  @override
  String get settingsThermal => 'Stato termico';

  @override
  String get settingsThermalNominal => 'Normale';

  @override
  String get settingsThermalFair => 'Caldo';

  @override
  String get settingsThermalSerious => 'Molto caldo';

  @override
  String get settingsThermalCritical => 'Critico';

  @override
  String get settingsBattery => 'Batteria';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · In carica';
  }

  @override
  String get settingsLowPowerMode =>
      'La modalità Risparmio Energetico è attiva: l\'IA funziona a frequenza ridotta.';

  @override
  String get settingsAiRate => 'Frequenza attuale dell\'IA';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Rilevamento impatto';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Attivo · conto alla rovescia di $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Sperimentale. Non sostituisce i servizi di emergenza.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeDark => 'Scuro';

  @override
  String get settingsThemeLight => 'Chiaro';

  @override
  String get settingsReduceMotion => 'Riduci movimento';

  @override
  String get settingsReduceMotionSubtitle =>
      'Riduce al minimo le animazioni in tutta l\'app';

  @override
  String get settingsAppLanguage => 'Lingua dell\'app';

  @override
  String get settingsPrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get settingsTerms => 'Termini di utilizzo';

  @override
  String get settingsHelp => 'Aiuto';

  @override
  String get settingsSupport => 'Contatta l\'assistenza';

  @override
  String get settingsLicenses => 'Licenze open source';

  @override
  String get settingsSupportUnavailable =>
      'Impossibile aprire Mail. Scrivi a support@corvista.app.';

  @override
  String get settingsSafety => 'Informazioni sulla sicurezza';

  @override
  String get settingsDiagnostics => 'Diagnostica';

  @override
  String get settingsVersion => 'Versione';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Personalizza HUD';

  @override
  String get hudCustomPreview => 'Anteprima · valori di esempio';

  @override
  String get hudCustomStyle => 'Stile';

  @override
  String get hudCustomElements => 'Elementi';

  @override
  String get hudCustomSpeed => 'Velocità';

  @override
  String get hudCustomHeading => 'Direzione e bussola';

  @override
  String get hudCustomClock => 'Orologio';

  @override
  String get hudCustomBattery => 'Batteria e temperatura';

  @override
  String get hudCustomDetections => 'Stato IA e rilevamenti';

  @override
  String get hudCustomWeather => 'Meteo';

  @override
  String get hudCustomAppearance => 'Dimensione e opacità';

  @override
  String get hudCustomSize => 'Dimensione';

  @override
  String get hudCustomOpacity => 'Opacità';

  @override
  String get hudCustomFooter =>
      'Gli avvisi, come il surriscaldamento, vengono sempre mostrati, anche se alcuni elementi sono nascosti.';

  @override
  String get hudCustomDescClassic => 'Quadro strumenti bilanciato';

  @override
  String get hudCustomDescGrid => 'Griglia prospettica sulla strada';

  @override
  String get hudCustomDescMinimal => 'Solo velocità, nient\'altro';

  @override
  String get hudCustomDescPerformance =>
      'Arco di velocità con letture in tempo reale';

  @override
  String get hudCustomDescNavigation => 'Prima la prossima manovra';

  @override
  String get hudCustomDescNight =>
      'Soffuso e tendente al rosso per la guida notturna';

  @override
  String get hudCustomDescHighContrast => 'Massima leggibilità sotto il sole';

  @override
  String get languageTitle => 'Lingua';

  @override
  String get languageSystem => 'Predefinita di sistema';

  @override
  String get languageSystemSubtitle => 'Segui la lingua del tuo iPhone';

  @override
  String get languageFooter =>
      'Altre lingue sono in arrivo. La lingua degli avvisi vocali si può impostare separatamente in Avvisi.';

  @override
  String get diagTitle => 'Diagnostica';

  @override
  String get diagPerformance => 'Prestazioni';

  @override
  String get diagInference => 'Tempo di inferenza';

  @override
  String get diagDetectHz => 'Frequenza di rilevamento';

  @override
  String get diagCameraFps => 'Frequenza fotogrammi fotocamera';

  @override
  String get diagMemory => 'Memoria';

  @override
  String get diagDropped => 'Fotogrammi persi';

  @override
  String get diagSegmentation => 'Tempo di segmentazione';

  @override
  String get diagCamera => 'Fotocamera';

  @override
  String get diagStatus => 'Stato';

  @override
  String get diagSource => 'Sorgente';

  @override
  String get diagSourceCamera => 'Fotocamera dal vivo';

  @override
  String get diagSourceFile => 'File di filmato di prova';

  @override
  String get diagResolution => 'Dimensione buffer';

  @override
  String get diagLens => 'Obiettivo';

  @override
  String get diagError => 'Ultimo errore';

  @override
  String get diagModel => 'Modello IA';

  @override
  String get diagModelLoad => 'Tempo di caricamento del modello';

  @override
  String get diagPower => 'Energia';

  @override
  String get diagSegHz => 'Frequenza di segmentazione';

  @override
  String get diagReduced => 'Effetti ridotti';

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
  String get diagCamIdle => 'Inattiva';

  @override
  String get diagCamStarting => 'Avvio';

  @override
  String get diagCamRunning => 'In esecuzione';

  @override
  String get diagCamInterrupted => 'Interrotta';

  @override
  String get diagCamStopped => 'Arrestata';

  @override
  String get diagCamUnavailable => 'Non disponibile';

  @override
  String get diagCamPermissionDenied => 'Permesso negato';

  @override
  String get diagCamError => 'Errore';

  @override
  String get diagTestFootage => 'Filmato di prova';

  @override
  String get diagTestFootageBody =>
      'Esegue un vero rilevamento sul dispositivo su un file video locale al posto della fotocamera. Ogni vista lo indica come FILMATO DI PROVA.';

  @override
  String get diagPathLabel => 'Percorso del file video';

  @override
  String get diagPathHint => '/percorso/del/viaggio.mp4';

  @override
  String get diagUseDocuments => 'Usa Documents/test_drive.mp4';

  @override
  String get diagRun => 'Avvia filmato di prova';

  @override
  String get diagRunStarted =>
      'Filmato di prova avviato. Apri la vista di guida per vederlo.';

  @override
  String get diagBackToCamera => 'Torna alla fotocamera dal vivo';

  @override
  String get diagDebugOnly =>
      'Il filmato di prova è disponibile solo nelle build di sviluppo.';

  @override
  String get diagFileMissing => 'Nessun file in questo percorso.';

  @override
  String get emergencySetupTitle => 'Rilevamento impatto';

  @override
  String get emergencyExperimental => 'Sperimentale';

  @override
  String get emergencyIntro =>
      'Durante un viaggio, Corvista può monitorare un possibile impatto grave usando i sensori di movimento del tuo iPhone. Se ne rileva uno, parte un conto alla rovescia. Se non lo annulli, Corvista propone di chiamare i servizi di emergenza e di scrivere ai tuoi contatti.';

  @override
  String get emergencyDisclaimer1 =>
      'Non sostituisce i servizi di emergenza né il rilevamento degli incidenti del tuo veicolo.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS chiede sempre una conferma prima di effettuare una chiamata o inviare un messaggio.';

  @override
  String get emergencyDisclaimer3 =>
      'Gli impatti possono non essere rilevati, e frenate brusche o buche possono essere scambiate per un impatto.';

  @override
  String get emergencyParkedWarning =>
      'Completa questa configurazione a veicolo fermo. Le impostazioni sono bloccate mentre il veicolo è in movimento.';

  @override
  String get emergencyEnable => 'Attiva rilevamento impatto';

  @override
  String get emergencyEnableSubtitle =>
      'Attivo solo durante una sessione di guida';

  @override
  String get emergencyNeedNumber => 'Aggiungi prima un numero di emergenza.';

  @override
  String get emergencyContacts => 'Contatti di emergenza';

  @override
  String get emergencyAddContact => 'Aggiungi contatto';

  @override
  String get emergencyNoContacts =>
      'Ancora nessun contatto. I contatti ricevono un messaggio solo dopo la tua conferma.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Rimuovere $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Non verrà proposto come destinatario dopo un impatto.';

  @override
  String get emergencyRemove => 'Rimuovi';

  @override
  String get emergencyContactsError => 'Impossibile caricare i contatti.';

  @override
  String get emergencyNumber => 'Numero di emergenza';

  @override
  String get emergencyNumberHint => 'es. 112 o 911';

  @override
  String get emergencyMessage => 'Modello di messaggio';

  @override
  String get emergencyMessageDefault =>
      'Potrei aver avuto un incidente stradale. Questo messaggio è stato preparato da Corvista e include la mia ultima posizione nota, se disponibile.';

  @override
  String get emergencyMessageHint =>
      'Lascia vuoto per usare il messaggio predefinito.';

  @override
  String get emergencyCountdown => 'Durata del conto alla rovescia';

  @override
  String get emergencyVoiceCancel => 'Annulla con la voce';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Di\' «Sto bene» o «Annulla» durante il conto alla rovescia. Usa il riconoscimento vocale sul dispositivo, se disponibile.';

  @override
  String get emergencyVoicePermDenied =>
      'Per l\'annullamento vocale servono l\'accesso al microfono e al riconoscimento vocale.';

  @override
  String get emergencyAutoSave =>
      'Salva automaticamente la clip dell\'incidente';

  @override
  String get emergencyTest => 'Prova il conto alla rovescia (senza chiamata)';

  @override
  String get emergencyTestBody =>
      'Avvia un impatto simulato per mostrarti il conto alla rovescia. In modalità di prova non viene mai effettuata alcuna chiamata né inviato alcun messaggio.';

  @override
  String get emergencyNotSet => 'Non impostato';

  @override
  String get emergencyAlertHeadline => 'Rilevato un possibile impatto grave.';

  @override
  String get emergencyAlertSubtitle => 'Stai bene?';

  @override
  String get emergencyAlertCancel => 'Sto bene — Annulla';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds secondi rimasti',
      one: '1 secondo rimasto',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'In ascolto — di\' «Sto bene» per annullare';

  @override
  String emergencyAlertHeard(String text) {
    return 'Sentito: «$text»';
  }

  @override
  String get emergencyAlertEscalated => 'Nessuna risposta. Scegli cosa fare:';

  @override
  String get emergencyAlertCall => 'Chiama i servizi di emergenza';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Chiama il $number. iOS chiede conferma.';
  }

  @override
  String get emergencyAlertMessage => 'Scrivi ai contatti';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Apre un messaggio già pronto. Sei tu a decidere se inviarlo.';

  @override
  String get emergencyAlertTestMode =>
      'Modalità di prova — nessuna chiamata verrà effettuata';

  @override
  String get emergencyAlertTestBadge => 'PROVA';

  @override
  String get emergencyAlertClose => 'Sto bene — Chiudi';

  @override
  String get emergencyMsgSent => 'Messaggio inviato.';

  @override
  String get emergencyMsgCancelled => 'Messaggio non inviato.';

  @override
  String get emergencyMsgFailed => 'Impossibile inviare il messaggio.';

  @override
  String get emergencyMsgUnavailable =>
      'I messaggi non sono disponibili su questo dispositivo.';

  @override
  String emergencyCallFailed(String number) {
    return 'Impossibile avviare la chiamata. Componi tu il $number.';
  }

  @override
  String get modelsTitle => 'Modelli IA';

  @override
  String get modelsIntro =>
      'Tutti i modelli sono inclusi nell\'app e funzionano interamente sul tuo iPhone. Il flusso della fotocamera non lascia mai il dispositivo.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'In diretta: $ms ms per fotogramma · $hz rilevamenti/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Caricato in $ms ms';
  }

  @override
  String get modelsEfficientName => 'Efficiente';

  @override
  String get modelsEfficientDesc =>
      'Rilevatore rapido e compatto, ideale per viaggi lunghi con poco calore e basso consumo di batteria.';

  @override
  String get modelsEnhancedName => 'Avanzato';

  @override
  String get modelsEnhancedDesc =>
      'Rilevatore più grande che individua oggetti più piccoli e lontani, con un consumo energetico maggiore.';

  @override
  String get modelsSegmentationName => 'Segmentazione';

  @override
  String get modelsSegmentationDesc =>
      'Unisce rilevamento rapido e maschere del manto stradale e degli oggetti per la vista Percezione.';

  @override
  String get modelsNoneName => 'IA in pausa';

  @override
  String get modelsNoneDesc =>
      'Fotocamera e registrazione continuano senza rilevamento di oggetti. Consumo energetico minimo.';

  @override
  String get modelsGenericDesc =>
      'Modello di rilevamento oggetti sul dispositivo.';

  @override
  String get modelsFunctionDetection =>
      'Rileva veicoli, persone, biciclette, moto, autobus, semafori e segnali di stop';

  @override
  String get modelsFunctionSegmentation =>
      'Aggiunge maschere del manto stradale e degli oggetti';

  @override
  String get modelsFunctionNone =>
      'Nessun rilevamento; solo registrazione dashcam';

  @override
  String get modelsSize => 'Dimensione';

  @override
  String get modelsInput => 'Input';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Compatibile con';

  @override
  String get modelsStatusInstalled => 'Installato (incluso)';

  @override
  String get modelsStatusNotInstalled => 'Non installato';

  @override
  String get modelsSelected => 'Selezionato';

  @override
  String get modelsUse => 'Usa questo modello';

  @override
  String get modelsSwitching => 'Caricamento del modello…';

  @override
  String modelsSwitched(String name) {
    return '$name è ora attivo';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Misurato su questo dispositivo: $ms ms in media';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Non misurato su questo dispositivo';

  @override
  String get modelsBenchmarkRun => 'Avvia test prestazioni';

  @override
  String get modelsBenchmarkRunning => 'Test in corso…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Seleziona questo modello per testarlo.';

  @override
  String get modelsBenchmarkDone => 'Test completato';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Test non riuscito: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Ultimo aggiornamento: $date';
  }

  @override
  String get safetyTitle => 'Informazioni sulla sicurezza';

  @override
  String get safetyIntro =>
      'Corvista è un ausilio per l\'attenzione alla guida. Non controlla il tuo veicolo e non può sostituire la tua attenzione, il tuo giudizio né i sistemi di sicurezza del veicolo.';

  @override
  String get safetyBeforeTitle => 'Prima di guidare';

  @override
  String get safetyBefore1 =>
      'Fissa saldamente l\'iPhone in una posizione consentita che non ostruisca la visuale, gli airbag o i comandi.';

  @override
  String get safetyBefore2 =>
      'Completa la configurazione, scegli una vista e imposta la destinazione a veicolo fermo.';

  @override
  String get safetyBefore3 =>
      'Collega un caricabatterie nei viaggi lunghi e, se possibile, tieni il telefono al riparo dalla luce solare diretta.';

  @override
  String get safetyWhileTitle => 'Durante la guida';

  @override
  String get safetyWhile1 =>
      'Tieni gli occhi sulla strada. Usa i grandi comandi sullo schermo solo quando è sicuro e consentito.';

  @override
  String get safetyWhile2 =>
      'Gli avvisi sono ausili, non segnalazioni su cui fare affidamento. Il silenzio non significa mai che la strada sia libera.';

  @override
  String get safetyWhile3 =>
      'Rispetta il codice della strada, i segnali e la segnaletica — non l\'app — in caso di contrasto.';

  @override
  String get safetyLimitsTitle => 'Limiti';

  @override
  String get safetyLimits1 =>
      'La fotocamera di un solo telefono vede solo ciò che ha davanti. Gli oggetti fuori dal campo visivo, nascosti o molto vicini non vengono rilevati.';

  @override
  String get safetyLimits2 =>
      'I rilevamenti possono mancare, arrivare in ritardo o essere errati, soprattutto di notte, con pioggia, nebbia, abbagliamento o con il parabrezza sporco.';

  @override
  String get safetyLimits3 =>
      'Vengono riconosciute solo le categorie supportate: veicoli, autobus, moto, biciclette, persone, semafori e segnali di stop. Le indicazioni di corsia nella vista virtuale sono stilizzate, non corsie rilevate.';

  @override
  String get safetyLimits4 =>
      'La prossimità è mostrata come zone approssimative (Molto vicino, Vicino, Medio, Lontano), mai come distanze misurate. La vista parcheggio non sostituisce un sensore di parcheggio.';

  @override
  String get safetyHeatTitle => 'Calore e batteria';

  @override
  String get safetyHeat1 =>
      'L\'uso continuo di fotocamera e IA scalda l\'iPhone. Corvista riduce la frequenza di analisi quando il dispositivo si scalda e mostra un avviso; se iOS si surriscalda, la fotocamera potrebbe fermarsi.';

  @override
  String get safetyEmergencyTitle => 'Funzione di emergenza';

  @override
  String get safetyEmergency1 =>
      'Il rilevamento di un possibile impatto è sperimentale. Può non rilevare incidenti reali e può essere attivato da altri eventi.';

  @override
  String get safetyEmergency2 =>
      'Non contatta mai nessuno in modo silenzioso: iOS chiede sempre di confermare una chiamata o un messaggio. Non sostituisce una chiamata ai servizi di emergenza fatta da te.';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacyIntro =>
      'Corvista è progettata per mantenere i tuoi dati di guida sul tuo iPhone. Non esiste un account Corvista e Corvista non gestisce server propri.';

  @override
  String get privacyCameraTitle => 'Fotocamera e IA';

  @override
  String get privacyCamera1 =>
      'Rilevamento, tracciamento e segmentazione degli oggetti funzionano interamente sul tuo iPhone. I fotogrammi della fotocamera non vengono mai caricati.';

  @override
  String get privacyCamera2 =>
      'La fotocamera funziona solo mentre Corvista è aperta sullo schermo. Si mette in pausa quando l\'app passa in background — non esiste alcuna registrazione nascosta in background.';

  @override
  String get privacyRecordingsTitle => 'Registrazioni';

  @override
  String get privacyRecordings1 =>
      'Il buffer continuo è temporaneo e viene sovrascritto di continuo. I filmati vengono conservati solo quando tocchi Salva incidente oppure, se lo attivi, dopo un possibile impatto.';

  @override
  String get privacyRecordings2 =>
      'Le clip salvate restano nello spazio privato di Corvista sul tuo iPhone. Lasciano il dispositivo solo quando scegli Condividi. Eliminando l\'app vengono eliminate.';

  @override
  String get privacyRecordings3 =>
      'L\'audio viene registrato solo se lo attivi e concedi l\'accesso al microfono.';

  @override
  String get privacyLocationTitle => 'Posizione';

  @override
  String get privacyLocation1 =>
      'La posizione viene usata a app aperta per velocità, mappa, percorsi e meteo. Se «Salva la posizione» è attivo, la posizione al momento del salvataggio viene memorizzata con la clip sul tuo dispositivo.';

  @override
  String get privacyNetworkTitle => 'Servizi di rete';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — visualizzazione della mappa, ricerca di luoghi e percorsi. Il testo della ricerca e la tua posizione approssimativa vengono inviati ad Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — meteo attuale e orario per la tua posizione.';

  @override
  String get privacyNetwork4 =>
      'Corvista non include pubblicità né analisi o tracciamento di terze parti.';

  @override
  String get privacyEmergencyTitle => 'Contatti di emergenza';

  @override
  String get privacyEmergency1 =>
      'I contatti che scegli sono memorizzati nel Portachiavi di iOS su questo dispositivo. L\'annullamento vocale usa il riconoscimento vocale sul dispositivo, se disponibile. Chiamate e messaggi vengono inviati solo dopo la tua conferma in iOS.';

  @override
  String get privacyControlsTitle => 'I tuoi controlli';

  @override
  String get privacyControls1 =>
      'Puoi eliminare le clip in qualsiasi momento in Clip e modificare o revocare l\'accesso a fotocamera, microfono, posizione e riconoscimento vocale nelle Impostazioni di iOS.';

  @override
  String get termsTitle => 'Termini di utilizzo';

  @override
  String get termsIntro =>
      'Usando Corvista accetti questi termini. Si applica anche il Contratto di licenza standard per l\'utente finale di Apple per le applicazioni su licenza.';

  @override
  String get termsUseTitle => 'Uso di Corvista';

  @override
  String get termsUse1 =>
      'Corvista è un ausilio per l\'attenzione alla guida e una dashcam. Resti pienamente responsabile di guidare in modo sicuro e nel rispetto della legge in ogni momento.';

  @override
  String get termsUse2 =>
      'Non interagire con l\'app in modi che ti distraggano alla guida. Fissa il dispositivo saldamente e nel rispetto della legge.';

  @override
  String get termsAccuracyTitle => 'Nessuna garanzia di accuratezza';

  @override
  String get termsAccuracy1 =>
      'Rilevamenti, zone, avvisi, indicatori sulla mappa, percorsi e meteo possono essere incompleti, in ritardo o errati. Corvista non controlla il tuo veicolo.';

  @override
  String get termsAccuracy2 =>
      'La funzione di emergenza è sperimentale e può non rilevare un impatto o attivarsi per errore.';

  @override
  String get termsRecordingTitle => 'Leggi sulla registrazione';

  @override
  String get termsRecording1 =>
      'Le leggi su dashcam, registrazione audio e riprese di persone variano da paese a paese e da regione a regione. Sei tenuto a rispettarle, anche quando condividi le clip.';

  @override
  String get termsLiabilityTitle => 'Responsabilità';

  @override
  String get termsLiability1 =>
      'L\'app è fornita «così com\'è». Nei limiti consentiti dalla legge, lo sviluppatore non è responsabile di incidenti, perdite, multe o danni derivanti dal suo uso o dall\'affidamento ai suoi risultati.';

  @override
  String get termsChangesTitle => 'Modifiche';

  @override
  String get termsChanges1 =>
      'Questi termini possono essere aggiornati con le nuove versioni dell\'app. L\'uso continuato dopo un aggiornamento comporta l\'accettazione dei termini rivisti.';

  @override
  String get helpTitle => 'Aiuto';

  @override
  String get helpIntro =>
      'Risposte alle domande più comuni. Per le indicazioni di sicurezza, consulta Informazioni sulla sicurezza.';

  @override
  String get helpQSave => 'Come conservo il filmato di un incidente?';

  @override
  String get helpASaveBuffer =>
      'Tocca il grande pulsante Salva incidente nella vista di guida. Corvista salva in Clip gli ultimi 20 o 30 secondi del suo buffer continuo (a tua scelta in Impostazioni › Registrazione).';

  @override
  String get helpQWhere => 'Dove sono archiviate le mie clip?';

  @override
  String get helpAWhere =>
      'Nello spazio privato di Corvista sul tuo iPhone. Non vengono mai caricate. Usa Condividi nel lettore per inviare o esportare una clip.';

  @override
  String get helpQZones => 'Quanto sono accurate le zone di prossimità?';

  @override
  String get helpAZones =>
      'Le zone sono stime approssimative ottenute da una sola fotocamera in base alle dimensioni tipiche degli oggetti. Considerale indicazioni di massima, mai distanze.';

  @override
  String get helpQSlow => 'Perché il rilevamento rallenta?';

  @override
  String get helpASlow =>
      'Quando l\'iPhone si scalda, la batteria è scarica o è attiva la modalità Risparmio Energetico, Corvista riduce la frequenza di analisi per proteggere il dispositivo. Puoi cambiare la modalità energia in Impostazioni.';

  @override
  String get helpQMap => 'Mappa, ricerca o meteo non funzionano.';

  @override
  String get helpAMap =>
      'Queste funzioni richiedono una connessione a internet e l\'accesso alla posizione. Controlla la connessione e consenti la posizione a Corvista nelle Impostazioni di iOS.';

  @override
  String get helpQSimulator => 'La fotocamera risulta non disponibile.';

  @override
  String get helpASimulator =>
      'Verifica che l\'accesso alla fotocamera sia consentito nelle Impostazioni di iOS e che nessun\'altra app la stia usando. Il simulatore iOS non ha una fotocamera; si può usare invece un video di prova locale.';

  @override
  String get emergencyMsgNoContacts =>
      'Aggiungi prima un contatto di emergenza.';

  @override
  String get cameraStarting => 'Avvio della fotocamera…';

  @override
  String get cameraInterrupted => 'Fotocamera in pausa';

  @override
  String get cameraInterruptedBody =>
      'iOS ha messo in pausa la fotocamera, per esempio durante una chiamata o mentre un\'altra app la usa. Riprende automaticamente.';

  @override
  String get cameraUnavailable => 'Fotocamera non disponibile';

  @override
  String get cameraUnavailableBody =>
      'Nessuna fotocamera disponibile su questo dispositivo. Rilevamento, registrazione e viste parcheggio richiedono la fotocamera posteriore.';

  @override
  String get cameraRunTestFootage => 'Avvia filmato di prova';

  @override
  String get cameraPermissionDenied =>
      'L\'accesso alla fotocamera è disattivato';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista ha bisogno della fotocamera per rilevamento, registrazione dashcam e viste parcheggio. Attiva l\'accesso alla fotocamera in Impostazioni.';

  @override
  String get cameraError => 'Errore della fotocamera';

  @override
  String get cameraStopped => 'Fotocamera arrestata';

  @override
  String get cameraStart => 'Avvia fotocamera';

  @override
  String get cameraFocusHint => 'Tocca per mettere a fuoco';

  @override
  String get cameraPreviewLabel =>
      'Vista della fotocamera dal vivo con gli oggetti rilevati';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Fotocamera $fps fps · IA $hz Hz · $ms ms · persi $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Velocità $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Nessuna velocità GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Direzione $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Buffer di registrazione dashcam, $seconds di $target secondi memorizzati';
  }

  @override
  String get hudRecIdle => 'REC disattivato';

  @override
  String get hudRecSaving => 'Salvataggio…';

  @override
  String get hudRecError => 'Errore REC';

  @override
  String get hudAiPaused => 'IA in pausa';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oggetti',
      one: '1 oggetto',
      zero: 'Nessun oggetto',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oggetti rilevati',
      one: '1 oggetto rilevato',
      zero: 'nessun oggetto rilevato',
    );
    return 'Modello IA $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Caldo — IA rallentata';

  @override
  String get hudThermalCritical => 'Troppo caldo — IA in pausa';

  @override
  String hudBatteryLow(String percent) {
    return 'Batteria $percent';
  }

  @override
  String get hudLowPower => 'Risparmio Energetico';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Meteo $temperature, $condition. Tocca per i dettagli.';
  }

  @override
  String get hudNoGuidance =>
      'Cerca una destinazione nella vista Mappa per vedere qui le indicazioni passo passo.';

  @override
  String get navArrived => 'Sei arrivato';

  @override
  String get navRerouting => 'Ricalcolo del percorso…';

  @override
  String get navSearchHint => 'Cerca destinazione';

  @override
  String get navSearchFieldHint => 'Indirizzo, luogo o attività';

  @override
  String get navNoResults => 'Nessun luogo corrispondente';

  @override
  String get navSearching => 'Ricerca in corso…';

  @override
  String get navSearchStartTyping =>
      'Digita un indirizzo o il nome di un luogo. I risultati provengono da Apple Maps e richiedono una connessione a internet.';

  @override
  String get navErrorUnavailable =>
      'Ricerca e percorsi non disponibili — controlla la connessione a internet.';

  @override
  String get navErrorNoLocation =>
      'In attesa della tua posizione per pianificare un percorso.';

  @override
  String get navErrorPermission =>
      'L\'accesso alla posizione è disattivato, quindi i percorsi non possono partire dalla tua posizione.';

  @override
  String navErrorGeneric(String code) {
    return 'Impossibile caricare i percorsi ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Percorsi per $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Arrivo $time';
  }

  @override
  String get navStart => 'Avvia';

  @override
  String get navEnd => 'Termina';

  @override
  String get navEndLabel => 'Termina navigazione';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration rimanenti';
  }

  @override
  String navAdvisory(String text) {
    return 'Avviso: $text';
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
    return 'Percorso $index: $name';
  }

  @override
  String get weatherTitle => 'Meteo';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Percepita $temperature';
  }

  @override
  String get weatherPrecipitation => 'Precipitazioni';

  @override
  String get weatherWind => 'Vento';

  @override
  String get weatherVisibility => 'Visibilità';

  @override
  String get weatherHumidity => 'Umidità';

  @override
  String get weatherHourly => 'Prossime ore';

  @override
  String weatherAsOf(String time) {
    return 'Aggiornato $time';
  }

  @override
  String get weatherRefresh => 'Aggiorna meteo';

  @override
  String get weatherUnavailable => 'Il meteo non è disponibile al momento.';

  @override
  String get weatherNoLocation => 'Il meteo richiede la tua posizione.';

  @override
  String get weatherLegal => 'Fonti dei dati e note legali';

  @override
  String weatherProvidedBy(String service) {
    return 'Dati meteo: $service';
  }

  @override
  String get weatherNow => 'Ora';

  @override
  String get virtualEmpty => 'Nessun oggetto supportato rilevato';

  @override
  String get virtualEmptyCameraOff =>
      'La vista virtuale richiede la fotocamera dal vivo.';

  @override
  String get virtualLaneDisclaimer =>
      'Le linee di corsia sono illustrative, non rilevate.';

  @override
  String virtualNearest(String zone) {
    return 'Più vicino: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Scena stradale virtuale: $summary';
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
  String get virtualStatusLive => 'attiva';

  @override
  String get virtualStatusPaused => 'in pausa';

  @override
  String get virtualStatusCameraOff => 'Fotocamera spenta';

  @override
  String get virtualStatusTestFootage => 'Filmato di prova';

  @override
  String get virtualEmptyHint =>
      'Veicoli, persone, bici, semafori e segnali di stop compaiono qui quando vengono rilevati.';

  @override
  String get mapRecenter => 'Ricentra';

  @override
  String get mapZoomIn => 'Ingrandisci';

  @override
  String get mapZoomOut => 'Riduci';

  @override
  String get mapUnsupported => 'La mappa interattiva è disponibile su iPhone.';

  @override
  String get mapObjectsApprox =>
      'Gli indicatori degli oggetti sono posizioni approssimative.';

  @override
  String get mapWeatherUnavailable => 'Meteo non disponibile';

  @override
  String get navErrorNoRoute =>
      'Nessun percorso trovato per questa destinazione.';

  @override
  String get navDismiss => 'Chiudi';

  @override
  String get navGo => 'Vai';

  @override
  String get navFastest => 'Più veloce';

  @override
  String get navThen => 'Poi';

  @override
  String get navRecents => 'Recenti';

  @override
  String get navClearRecents => 'Cancella';

  @override
  String get navSearchSubmitHint =>
      'Premi Cerca per vedere tutti i luoghi corrispondenti';

  @override
  String get navPlaces => 'Luoghi';

  @override
  String get navEtaLabel => 'arrivo';

  @override
  String get navTimeLeftLabel => 'rimanente';

  @override
  String get navOverview => 'Panoramica';

  @override
  String get navMute => 'Disattiva voce';

  @override
  String get navUnmute => 'Attiva voce';

  @override
  String get navEndConfirm => 'Terminare la navigazione?';

  @override
  String navEndConfirmBody(String place) {
    return 'La guida verso $place verrà interrotta.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Sei arrivato a $place';
  }

  @override
  String get navDone => 'Fine';

  @override
  String get navWeakGps => 'Segnale GPS debole';

  @override
  String get navLocationOff =>
      'La posizione è disattivata. Attivala per pianificare percorsi e navigare.';

  @override
  String get navVoiceGuidance => 'Guida vocale';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Tra $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, poi $second';
  }

  @override
  String get navSpeakRerouting => 'Ricalcolo del percorso';

  @override
  String get navSpeakArrived => 'Sei arrivato';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metri',
      one: '1 metro',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value chilometri',
      one: '1 chilometro',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count piedi',
      one: '1 piede',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count iarde',
      one: '1 iarda',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Prosegui per $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Le indicazioni non sono disponibili per questo viaggio in questa regione. Prova un\'altra destinazione.';

  @override
  String navContinueFor(String distance) {
    return 'Prosegui per $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value miglia',
      one: '1 miglio',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Più vicino: $object · $zone';
  }

  @override
  String get parkingNothing => 'Nulla rilevato nell\'inquadratura';

  @override
  String get parkingBeeps => 'Segnali di prossimità';

  @override
  String get parkingVolume => 'Volume dei segnali';

  @override
  String get parkingLimitations =>
      'Una sola fotocamera, non a 360°. Gli oggetti fuori dal campo della fotocamera non vengono rilevati. Non sostituisce i sensori di parcheggio; le stime possono essere errate e il silenzio non significa che l\'area sia libera.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Vista di prossimità dall\'alto. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Originale';

  @override
  String get perceptionModeBoxes => 'Riquadri';

  @override
  String get perceptionModeMasks => 'Maschere oggetti';

  @override
  String get perceptionModeRoad => 'Manto stradale';

  @override
  String get perceptionModeCombined => 'Combinata';

  @override
  String get perceptionOpacity => 'Opacità maschera';

  @override
  String get perceptionDisclaimer =>
      'La maschera del manto stradale è un livello visivo approssimativo. Non mostra lo spazio percorribile né le corsie.';

  @override
  String get perceptionNeedsModel =>
      'Seleziona il modello Segmentazione per vedere le maschere.';

  @override
  String get perceptionChooseModel => 'Scegli modello';

  @override
  String get perceptionWaiting =>
      'In attesa del primo fotogramma di segmentazione…';

  @override
  String get perceptionShortCamera => 'Fotocamera';

  @override
  String get perceptionShortBoxes => 'Riquadri';

  @override
  String get perceptionShortObjects => 'Oggetti';

  @override
  String get perceptionShortRoad => 'Strada';

  @override
  String get perceptionShortAll => 'Tutto';

  @override
  String get perceptionModesLabel => 'Livelli di percezione';

  @override
  String get perceptionStatusWarmingUp => 'Preparazione…';

  @override
  String get perceptionStatusLoadingModel => 'Caricamento modello…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Maschere in pausa';

  @override
  String get perceptionLegend => 'Legenda delle maschere';

  @override
  String get perceptionUnavailable => 'Maschere non disponibili';

  @override
  String get driveSave => 'Salva';

  @override
  String get driveSaveIncident => 'Salva incidente';

  @override
  String driveSaveHint(int seconds) {
    return 'Salva gli ultimi $seconds secondi di filmato dashcam';
  }

  @override
  String get driveSaving => 'Salvataggio dell\'incidente…';

  @override
  String hudRecManualLabel(String time) {
    return 'Registrazione in corso, $time';
  }

  @override
  String get driveRecord => 'Registra';

  @override
  String get driveRecordStartA11y => 'Avvia registrazione';

  @override
  String driveRecordStopA11y(String time) {
    return 'Interrompi registrazione, $time registrati';
  }

  @override
  String get driveRecordHint =>
      'Registra in continuo finché non la interrompi, compresi i 5 secondi precedenti';

  @override
  String get driveRecordFailed => 'Impossibile avviare la registrazione';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Registrazione salvata · $count parti',
      one: 'Registrazione salvata',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Registrazione interrotta: memoria quasi piena',
      'max_duration': 'Registrazione interrotta: durata massima raggiunta',
      'camera_stopped': 'Registrazione interrotta insieme alla fotocamera',
      'background': 'Registrazione interrotta: l\'app è passata in background',
      'thermal': 'Registrazione interrotta: il telefono è troppo caldo',
      'other': 'Registrazione interrotta',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Incidente salvato · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Vedi';

  @override
  String get driveSaveFailed => 'Impossibile salvare l\'incidente.';

  @override
  String get driveSaveNotRunning =>
      'La registrazione non è ancora iniziata — attendi l\'avvio della fotocamera e riprova.';

  @override
  String get driveSaveTestFootage =>
      'Il filmato di prova non viene registrato. Il salvataggio degli incidenti funziona con la fotocamera dal vivo.';

  @override
  String get driveSaveStorageFull =>
      'Lo spazio sul tuo iPhone è esaurito. Libera spazio o elimina le clip meno recenti.';

  @override
  String get driveSaveIoError =>
      'Impossibile scrivere la clip nello spazio di archiviazione.';

  @override
  String get driveClips => 'Clip';

  @override
  String get driveSettings => 'Impostazioni';

  @override
  String get driveViewSwitcher => 'Viste di guida';

  @override
  String get driveLocationDenied =>
      'La posizione è disattivata — velocità, mappe e percorsi non disponibili.';

  @override
  String get driveCameraDenied =>
      'L\'accesso alla fotocamera è disattivato — rilevamento e registrazione non disponibili.';

  @override
  String get driveRecorderFallback =>
      'Registrazione senza audio: l\'accesso al microfono è disattivato.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Le impostazioni di registrazione sono state modificate: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Il tuo iPhone è caldo. L\'IA rallenta per raffreddarsi — tienilo al riparo dal sole diretto e vicino a una bocchetta d\'aria.';

  @override
  String get drivePowerThermalCritical =>
      'Il tuo iPhone è troppo caldo. Il rilevamento IA è in pausa finché non si raffredda; la registrazione continua, se possibile.';

  @override
  String get drivePowerLowPower =>
      'La modalità Risparmio Energetico è attiva — l\'IA funziona a frequenza ridotta.';

  @override
  String get drivePowerBatteryLow =>
      'Batteria scarica — collega l\'iPhone all\'alimentazione mentre guidi.';

  @override
  String get onboardingTitle1 => 'Vedi di più a ogni viaggio.';

  @override
  String get onboardingBody1 =>
      'Trasforma il tuo iPhone in una dashcam intelligente e in un compagno per l\'attenzione alla guida.';

  @override
  String get onboardingTitle2 => 'Intelligenza in ogni fotogramma.';

  @override
  String get onboardingBody2 =>
      'Riconosci veicoli, persone, biciclette e segnali stradali supportati direttamente sul tuo iPhone.';

  @override
  String get onboardingTitle3 => 'Una strada. Più prospettive.';

  @override
  String get onboardingBody3 =>
      'Passa dal rilevamento dal vivo alle viste di guida virtuali, alle mappe interattive e alla visualizzazione del parcheggio.';

  @override
  String get onboardingTitle4 => 'Conserva i momenti che contano.';

  @override
  String get onboardingBody4 =>
      'Salva i filmati recenti della dashcam, rivedi gli incidenti e condividi le registrazioni.';

  @override
  String get onboardingTitle5 => 'Sicurezza e privacy';

  @override
  String get onboardingSafety1 =>
      'Corvista è un ausilio per l\'attenzione alla guida. Tieni gli occhi sulla strada.';

  @override
  String get onboardingSafety2 =>
      'Non controlla il tuo veicolo né sostituisce il tuo giudizio.';

  @override
  String get onboardingSafety3 =>
      'Rilevamenti e stime possono essere imprecisi o mancare.';

  @override
  String get onboardingSafety4 =>
      'L\'elaborazione della fotocamera avviene sul tuo iPhone — il video non viene caricato.';

  @override
  String get onboardingSafety5 =>
      'Mappe, ricerca, percorsi e meteo richiedono una connessione a internet.';

  @override
  String get onboardingSafety6 =>
      'Fissa saldamente l\'iPhone in modo che non ostruisca la visuale.';

  @override
  String get onboardingSafety7 =>
      'Completa la configurazione prima di metterti alla guida.';

  @override
  String get onboardingAcknowledge =>
      'Capisco che Corvista è un ausilio per l\'attenzione e che resto responsabile di guidare in modo sicuro.';

  @override
  String get onboardingReadSafety =>
      'Leggi le informazioni complete sulla sicurezza';

  @override
  String get onboardingNext => 'Avanti';

  @override
  String get onboardingSkip => 'Salta';

  @override
  String get onboardingAgree => 'Continua';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Pagina $current di $total';
  }

  @override
  String get permTitle => 'Autorizzazioni';

  @override
  String get permIntro =>
      'Corvista chiede solo ciò che serve a ciascuna funzione. Puoi modificarle in qualsiasi momento in Impostazioni.';

  @override
  String get permCameraTitle => 'Fotocamera';

  @override
  String get permCameraBody =>
      'Necessaria per rilevamento, registrazione dashcam e vista parcheggio. Il video viene elaborato sul tuo iPhone.';

  @override
  String get permLocationTitle => 'Posizione';

  @override
  String get permLocationBody =>
      'Usata per velocità GPS, mappa, percorsi, meteo e per etichettare le clip salvate. Solo mentre usi l\'app.';

  @override
  String get permMicTitle => 'Microfono';

  @override
  String get permSpeechNote =>
      'Il riconoscimento vocale viene richiesto solo se attivi l\'annullamento vocale per gli avvisi di emergenza.';

  @override
  String get permRequired => 'Obbligatorio';

  @override
  String get permOptional => 'Facoltativo';

  @override
  String get permAllow => 'Consenti';

  @override
  String get permGranted => 'Consentito';

  @override
  String get permDenied => 'Negato';

  @override
  String get permLimited => 'Limitato';

  @override
  String get permRestricted => 'Limitato dal sistema';

  @override
  String get permStart => 'Inizia a guidare';

  @override
  String get permCameraNeeded =>
      'Puoi continuare senza l\'accesso alla fotocamera, ma rilevamento e registrazione non funzioneranno finché non lo consenti in Impostazioni.';

  @override
  String get permSetupIntro =>
      'Corvista ha bisogno di queste autorizzazioni per funzionare al meglio. Tocca Consenti tutto e iOS le chiederà una alla volta. Puoi modificarle in qualsiasi momento in Impostazioni.';

  @override
  String get permCameraLine =>
      'Necessaria per il rilevamento, la registrazione dashcam e la vista parcheggio. Il video viene elaborato sul tuo iPhone e non viene mai caricato.';

  @override
  String get permLocationLine =>
      'Velocità GPS, mappa, percorsi, meteo e dove sono stati salvati i clip. Solo mentre usi l\'app.';

  @override
  String get permMicLine =>
      'Audio dell\'abitacolo nei clip di incidente e ascolto della tua frase di annullamento durante un avviso di emergenza.';

  @override
  String get permSpeechTitle => 'Riconoscimento vocale';

  @override
  String get permSpeechLine =>
      'Riconosce la tua frase di annullamento durante il conto alla rovescia di emergenza, sul tuo iPhone dove supportato.';

  @override
  String get permAllowAll => 'Consenti tutto';

  @override
  String permAsking(String permission) {
    return 'Richiesta di $permission…';
  }

  @override
  String get permSomeDenied =>
      'Alcune autorizzazioni sono disattivate. Attivale in Impostazioni per usare queste funzioni.';

  @override
  String get permNotNow => 'Non ora';

  @override
  String get tourLabel => 'Tour della schermata Guida';

  @override
  String tourProgress(int current, int total) {
    return 'Passo $current di $total';
  }

  @override
  String get tourNext => 'Avanti';

  @override
  String get tourBack => 'Indietro';

  @override
  String get tourSkip => 'Salta il tour';

  @override
  String get tourFinish => 'Inizia a guidare';

  @override
  String get tourWelcomeTitle => 'Il tuo tour rapido';

  @override
  String get tourWelcomeBody =>
      'Un minuto per scoprire l\'essenziale della schermata Guida. Meglio a veicolo fermo.';

  @override
  String get tourHudTitle => 'La tua barra strumenti';

  @override
  String get tourHudSpeed => 'La velocità proviene dal GPS.';

  @override
  String get tourHudRec =>
      'REC mostra quanti secondi di video sono nel buffer.';

  @override
  String get tourHudAi =>
      'Il chip IA mostra il modello, quanti oggetti vede e un indicatore: verde in funzione, ambra limitato, rosso fermo.';

  @override
  String get tourSaveTitle => 'Salva incidente';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista mantiene un buffer continuo degli ultimi $seconds secondi di video. Viene sovrascritto di continuo, quindi nulla viene conservato se non tocchi Salva. I clip salvati restano su questo iPhone, in Clip.';
  }

  @override
  String get tourRecordTitle => 'Registra tutto il viaggio';

  @override
  String get tourRecordBody =>
      'Tocca Registra per filmare in continuo finché non interrompi. I viaggi lunghi vengono salvati in Clip in parti da 5 minuti, e Salva incidente continua a funzionare mentre registri.';

  @override
  String get tourViewsTitle => 'Cinque modi di vedere la strada';

  @override
  String get tourViewDetection =>
      'Fotocamera dal vivo con riquadri attorno agli oggetti supportati.';

  @override
  String get tourViewVirtual =>
      'Una scena 3D semplificata costruita dai rilevamenti.';

  @override
  String get tourViewMap => 'Apple Maps con ricerca e guida passo passo.';

  @override
  String get tourViewParking => 'Fotocamera e vista di prossimità dall\'alto.';

  @override
  String get tourViewPerception => 'Maschere di strada e oggetti.';

  @override
  String get tourMapTitle => 'Ricerca e guida passo passo';

  @override
  String get tourMapBody =>
      'Apri Mappa, tocca la barra di ricerca e scegli una destinazione. Scegli un percorso e tocca Avvia per la guida passo passo. Richiede una connessione internet.';

  @override
  String get tourClipsTitle => 'Clip';

  @override
  String get tourClipsBody =>
      'Rivedi, rinomina, condividi o elimina gli incidenti salvati. I clip restano sul tuo iPhone a meno che tu non li condivida.';

  @override
  String get tourSettingsTitle => 'Impostazioni';

  @override
  String get tourSettingsBody =>
      'Regola gli avvisi vocali e la loro sensibilità, la qualità di registrazione e la durata del buffer, e configura la modalità Emergenza: un avviso di impatto sperimentale con conto alla rovescia di annullamento.';

  @override
  String get tourSafetyTitle => 'Prima di guidare';

  @override
  String get tourSafety1 =>
      'Fissa l\'iPhone in modo sicuro, senza ostruire la visuale.';

  @override
  String get tourSafety2 =>
      'Non usare l\'app mentre guidi. Configura tutto a veicolo fermo.';

  @override
  String get tourSafety3 =>
      'Rilevamenti e zone sono stime. Possono essere errati o mancare.';

  @override
  String get tourSafety4 => 'Resti responsabile di guidare in sicurezza.';

  @override
  String get helpTakeTour => 'Fai il tour';

  @override
  String get helpTakeTourSub =>
      'Un minuto di tour guidato della schermata Guida.';

  @override
  String get tripsTitle => 'Viaggi';

  @override
  String get tripsOpen => 'Registro viaggi';

  @override
  String get tripsEmptyTitle => 'Ancora nessun viaggio';

  @override
  String get tripsEmptyBody =>
      'I viaggi vengono registrati automaticamente mentre guidi con Corvista: distanza, tempo, velocità e percorso seguito.';

  @override
  String get tripsDisabledBody =>
      'Il registro viaggi è disattivato, quindi i nuovi viaggi non vengono registrati. Attivalo per tenere un registro privato dei tuoi percorsi su questo iPhone.';

  @override
  String get tripsEnable => 'Attiva registro viaggi';

  @override
  String get tripsToday => 'Oggi';

  @override
  String get tripsYesterday => 'Ieri';

  @override
  String tripsRecordingNow(String distance) {
    return 'Registrazione del viaggio · $distance';
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
      other: '$count incidenti',
      one: '1 incidente',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count avvisi',
      one: '1 avviso',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count viaggi',
      one: '1 viaggio',
      zero: 'Nessun viaggio',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Distanza';

  @override
  String get tripsStatDuration => 'Durata';

  @override
  String get tripsStatMoving => 'Tempo in movimento';

  @override
  String get tripsStatAvgSpeed => 'Vel. media';

  @override
  String get tripsStatMaxSpeed => 'Vel. massima';

  @override
  String get tripsDetections => 'Rilevamenti';

  @override
  String get tripsNoDetections =>
      'Nessun oggetto stradale è stato registrato in questo viaggio.';

  @override
  String get tripsTimeline => 'Cronologia';

  @override
  String get tripsEventStart => 'Viaggio iniziato';

  @override
  String get tripsEventEnd => 'Viaggio terminato';

  @override
  String get tripsEventAlert => 'Avviso vocale';

  @override
  String get tripsEventIncident => 'Clip di incidente salvato';

  @override
  String get tripsEventEmergency => 'Possibile incidente rilevato';

  @override
  String get tripsEventNavStart => 'Navigazione avviata';

  @override
  String get tripsEventArrive => 'Arrivo a destinazione';

  @override
  String get tripsEventReroute => 'Percorso ricalcolato';

  @override
  String get tripsEventRecording => 'Registrazione salvata';

  @override
  String get tripsOpenClip => 'Apri clip';

  @override
  String get tripsTrackPreview => 'Traccia GPS';

  @override
  String get tripsRenameTitle => 'Rinomina viaggio';

  @override
  String get tripsRenameHint => 'Nome del viaggio';

  @override
  String get tripsFavorite => 'Aggiungi ai preferiti';

  @override
  String get tripsUnfavorite => 'Rimuovi dai preferiti';

  @override
  String get tripsShareGpx => 'Condividi GPX';

  @override
  String get tripsShareFailed => 'Impossibile condividere questo viaggio.';

  @override
  String get tripsDelete => 'Elimina viaggio';

  @override
  String get tripsDeleteConfirmTitle => 'Eliminare questo viaggio?';

  @override
  String get tripsDeleteConfirmBody =>
      'Il percorso e le statistiche verranno rimossi da questo iPhone. I clip di incidente di questo viaggio vengono conservati.';

  @override
  String get tripsDeleted => 'Viaggio eliminato';

  @override
  String get tripsNotFound => 'Questo viaggio non è più disponibile.';

  @override
  String get tripsPrivacyNote =>
      'Salvato solo su questo iPhone. Non viene caricato nulla.';

  @override
  String get settingsSectionTrips => 'Registro viaggi';

  @override
  String get settingsTripLog => 'Registra i viaggi';

  @override
  String get settingsTripLogSubtitle =>
      'Conserva il percorso e le statistiche di guida solo su questo iPhone.';

  @override
  String get settingsTripRetention => 'Conserva i viaggi per';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni',
      one: '1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 anno';

  @override
  String get settingsRetentionForever => 'Per sempre';

  @override
  String get settingsTripRetentionFooter =>
      'I viaggi meno recenti vengono eliminati automaticamente all\'avvio di Corvista.';

  @override
  String get settingsViewTrips => 'Vedi viaggi';

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
    return 'Viaggio Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Libera spazio';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Rimuove file temporanei e cache. I clip e i viaggi salvati vengono conservati.';

  @override
  String settingsFreedBytes(String size) {
    return 'Liberati $size';
  }

  @override
  String get settingsNothingToFree =>
      'Cache svuotate: nessun file temporaneo da rimuovere.';

  @override
  String get settingsSectionPrivacyData => 'Privacy e dati';

  @override
  String get settingsPrivacyDataFooter =>
      'Clip, viaggi e impostazioni sono archiviati solo su questo iPhone. Ne escono solo quando scegli di condividerli.';

  @override
  String get settingsDeleteAllData => 'Elimina tutti i dati';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Cancella clip, viaggi, contatti e impostazioni da questo iPhone';

  @override
  String get deleteAllTitle => 'Eliminare tutti i dati?';

  @override
  String get deleteAllMessage =>
      'Verranno rimossi definitivamente da questo iPhone:\n• Clip di incidenti e miniature\n• Registro dei viaggi e tracce GPS\n• Contatti di emergenza ed eventi di emergenza\n• Registri di rilevamento e registro diagnostico\n• Impostazioni e destinazioni recenti\n• Buffer di registrazione temporaneo e cache\n\nL\'operazione non può essere annullata. Corvista ripartirà poi dalle schermate di benvenuto.';

  @override
  String get deleteAllConfirm => 'Elimina tutto';

  @override
  String get deleteAllInProgress => 'Eliminazione…';

  @override
  String get deleteAllDone => 'Tutti i dati sono stati eliminati';

  @override
  String get deleteAllPartial =>
      'Non è stato possibile eliminare alcuni elementi. Riprova da Impostazioni.';

  @override
  String get diagLogSection => 'Registro diagnostico';

  @override
  String get diagLogFooter =>
      'Gli errori vengono registrati solo su questo iPhone, senza posizioni, nomi dei contatti o numeri di telefono. Non viene inviato nulla a meno che tu non condivida il registro.';

  @override
  String get diagLogShare => 'Condividi registro diagnostico';

  @override
  String get diagLogEmpty => 'Vuoto';

  @override
  String get diagLogClear => 'Cancella registro';

  @override
  String get diagLogClearTitle => 'Cancellare il registro diagnostico?';

  @override
  String get diagLogClearBody =>
      'Le voci di errore salvate verranno eliminate da questo iPhone.';

  @override
  String get diagLogCleared => 'Registro diagnostico cancellato';

  @override
  String get diagLogShareFailed =>
      'Impossibile condividere il registro diagnostico.';

  @override
  String get privacyControls2 =>
      'Impostazioni › Privacy e dati › Elimina tutti i dati cancella ogni clip, viaggio, contatto, registro e impostazione che Corvista ha archiviato su questo iPhone.';

  @override
  String get parkingZoneStop => 'Stop';

  @override
  String get parkingZoneVeryClose => 'Molto vicino';

  @override
  String get parkingZoneClose => 'Vicino';

  @override
  String get parkingZoneNothingClose => 'Nulla di vicino rilevato';

  @override
  String get parkingNotDetected =>
      'Muri, pilastri, paletti e cordoli non vengono rilevati';

  @override
  String get parkingApprox => 'circa';

  @override
  String get parkingSideLeft => 'Sinistra';

  @override
  String get parkingSideCenter => 'Centro';

  @override
  String get parkingSideRight => 'Destra';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Solo vista della fotocamera anteriore — non è un sistema a 360°';

  @override
  String get parkingMuteBeeps => 'Silenzia i segnali';

  @override
  String get parkingUnmuteBeeps => 'Riattiva i segnali';

  @override
  String get parkingAbout => 'Info sulla vista parcheggio';

  @override
  String get parkingLimitationsDetail =>
      'Viene monitorata solo l\'area davanti alla fotocamera. Il rilevatore riconosce auto, autobus e camion, persone, biciclette e moto. Muri, pilastri, paletti, cordoli, colonnine, barriere e ostacoli bassi NON vengono rilevati, e il cofano può nascondere il suolo subito davanti. Le distanze sono stime approssimative ottenute da una sola fotocamera (dimensione e posizione dell\'oggetto) e possono essere molto sbagliate. Il silenzio o «Nulla di vicino rilevato» non significa che la via sia libera: guarda sempre intorno a te e usa gli specchietti.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Vicinanza per lato: sinistra $left, centro $center, destra $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Gli errori vengono scritti in un registro privato su questo iPhone (senza posizioni, nomi dei contatti o numeri di telefono). Non viene mai inviato automaticamente; puoi condividerlo o cancellarlo in Impostazioni › Diagnostica.';
}
