// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Ve más en cada trayecto.';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonBack => 'Atrás';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonRetry => 'Reintentar';

  @override
  String get commonOpenSettings => 'Abrir Ajustes';

  @override
  String get commonLoading => 'Cargando…';

  @override
  String get commonError => 'Algo salió mal.';

  @override
  String commonErrorDetail(String message) {
    return 'Algo salió mal: $message';
  }

  @override
  String get commonOn => 'Activado';

  @override
  String get commonOff => 'Desactivado';

  @override
  String get commonRename => 'Renombrar';

  @override
  String get commonShare => 'Compartir';

  @override
  String get commonNotAvailable => 'No disponible';

  @override
  String get commonTestFootage => 'GRABACIÓN DE PRUEBA';

  @override
  String get zoneVeryClose => 'Muy cerca';

  @override
  String get zoneClose => 'Cerca';

  @override
  String get zoneMedium => 'Media';

  @override
  String get zoneFar => 'Lejos';

  @override
  String get zoneUnknown => 'Desconocida';

  @override
  String get classPerson => 'Persona';

  @override
  String get classBicycle => 'Bicicleta';

  @override
  String get classMotorcycle => 'Moto';

  @override
  String get classCar => 'Vehículo';

  @override
  String get classBus => 'Autobús';

  @override
  String get classTrafficLight => 'Semáforo';

  @override
  String get classStopSign => 'Señal de stop';

  @override
  String get viewDetection => 'Detección';

  @override
  String get viewVirtual => 'Virtual';

  @override
  String get viewMap => 'Mapa';

  @override
  String get viewParking => 'Aparcamiento';

  @override
  String get viewPerception => 'Percepción';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Rojo';

  @override
  String get lightYellow => 'Ámbar';

  @override
  String get lightGreen => 'Verde';

  @override
  String get lightUnknown => 'Desconocido';

  @override
  String get clipsTitle => 'Clips';

  @override
  String get clipsSelect => 'Seleccionar';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seleccionados',
      one: '1 seleccionado',
      zero: 'Seleccionar clips',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Seleccionar todo';

  @override
  String get clipsDeselectAll => 'Deseleccionar todo';

  @override
  String get clipsDeleteSelected => 'Eliminar selección';

  @override
  String get clipsGridView => 'Vista de cuadrícula';

  @override
  String get clipsListView => 'Vista de lista';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¿Eliminar $count clips?',
      one: '¿Eliminar este clip?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Estos vídeos se eliminarán de forma permanente de tu iPhone. Esta acción no se puede deshacer.',
      one: 'El vídeo se eliminará de forma permanente de tu iPhone. Esta acción no se puede deshacer.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips eliminados',
      one: 'Clip eliminado',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Aún no hay clips';

  @override
  String get clipsEmptyBody =>
      'Mientras conduces, Corvista mantiene un breve búfer continuo. Toca Guardar incidente para conservar aquí los últimos segundos de grabación.';

  @override
  String get clipsLoadError => 'No se pudieron cargar tus clips.';

  @override
  String get clipsStorageTitle => 'Almacenamiento';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Clips $clips · Búfer $buffer · $free libres';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips guardados',
      one: '1 clip guardado',
      zero: 'Ningún clip guardado',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'Tu iPhone tiene poco espacio. Es posible que los nuevos incidentes no se guarden.';

  @override
  String get clipsMissingFile => 'Archivo no encontrado';

  @override
  String get clipsEmergencyBadge => 'Impacto';

  @override
  String clipsUntitled(String date) {
    return 'Incidente · $date';
  }

  @override
  String get clipsAudio => 'Audio grabado';

  @override
  String get clipsFavorite => 'Favorito';

  @override
  String get clipsUnfavorite => 'Quitar de favoritos';

  @override
  String get clipsLocation => 'Ubicación guardada';

  @override
  String clipsOpenClip(String title) {
    return 'Abrir clip $title';
  }

  @override
  String get playerNotFoundTitle => 'Clip no encontrado';

  @override
  String get playerNotFoundBody =>
      'Es posible que este clip se haya eliminado.';

  @override
  String get playerMissingTitle => 'Falta el archivo de vídeo';

  @override
  String get playerMissingBody =>
      'La grabación de este clip ya no está en tu iPhone. Puedes quitar la entrada de tu galería.';

  @override
  String get playerRemoveEntry => 'Quitar entrada';

  @override
  String get playerLoadError => 'No se puede reproducir este vídeo.';

  @override
  String get playerPlay => 'Reproducir';

  @override
  String get playerPause => 'Pausar';

  @override
  String get playerReplay => 'Repetir';

  @override
  String get playerRenameTitle => 'Renombrar clip';

  @override
  String get playerRenameHint => 'Nombre del clip';

  @override
  String get playerRenamed => 'Clip renombrado';

  @override
  String get playerFavorited => 'Añadido a favoritos';

  @override
  String get playerUnfavorited => 'Quitado de favoritos';

  @override
  String get playerShareFailed => 'No se pudo compartir este clip.';

  @override
  String get playerDetails => 'Detalles';

  @override
  String get playerDate => 'Grabado';

  @override
  String get playerDuration => 'Duración';

  @override
  String get playerResolution => 'Resolución';

  @override
  String get playerSize => 'Tamaño del archivo';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerAudioYes => 'Grabado';

  @override
  String get playerAudioNo => 'No grabado';

  @override
  String get playerReason => 'Guardado por';

  @override
  String get playerReasonManual => 'Botón Guardar incidente';

  @override
  String get playerReasonEmergency => 'Posible detección de impacto';

  @override
  String get playerReasonRecovered => 'Recuperado tras una interrupción';

  @override
  String get playerSpeed => 'Velocidad GPS al guardar';

  @override
  String get playerLocation => 'Ubicación';

  @override
  String get playerOpenInMaps => 'Abrir en Mapas';

  @override
  String get playerBack => 'Atrás';

  @override
  String get playerMore => 'Más acciones';

  @override
  String get clipsFilterLabel => 'Mostrar';

  @override
  String get clipsFilterAll => 'Todos';

  @override
  String get clipsFilterRecordings => 'Grabaciones';

  @override
  String get clipsFilterIncidents => 'Incidentes';

  @override
  String get clipsFilterEmergency => 'Emergencias';

  @override
  String get clipsFilterFavorites => 'Favoritos';

  @override
  String get clipsSort => 'Ordenar';

  @override
  String get clipsSortNewest => 'Más recientes primero';

  @override
  String get clipsSortOldest => 'Más antiguos primero';

  @override
  String get clipsSortLongest => 'Más largos primero';

  @override
  String get clipsSortLargest => 'Más pesados primero';

  @override
  String get clipsToday => 'Hoy';

  @override
  String get clipsYesterday => 'Ayer';

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
  String get clipsFilterEmpty => 'Todavía no hay clips en esta categoría.';

  @override
  String get clipsFavoritesEmpty =>
      'Marca un clip con una estrella para tenerlo aquí a mano.';

  @override
  String get clipsKindRecording => 'Grabación';

  @override
  String get clipsKindIncident => 'Incidente';

  @override
  String get clipsKindEmergency => 'Emergencia';

  @override
  String get clipsKindTest => 'Prueba';

  @override
  String clipsTripChip(String time) {
    return 'Trayecto · $time';
  }

  @override
  String get clipsOpenTrip => 'Abrir el trayecto en el que se grabó este clip';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used usados · $free libres';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Los clips ocupan $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count grabaciones',
      one: '1 grabación',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count incidentes',
      one: '1 incidente',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emergencias',
      one: '1 emergencia',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Liberar espacio';

  @override
  String get clipsStorageLowGentle =>
      'Quedan menos de 2 GB libres. Para seguir grabando sin problemas, libera espacio o elimina los clips que ya no necesites.';

  @override
  String get clipsSaveToPhotos => 'Guardar en Fotos';

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
      other: '¿Eliminar $count clips ($size)?',
      one: '¿Eliminar este clip ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Guardando $done de $total en Fotos…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips guardados en Fotos',
      one: 'Guardado en Fotos',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved guardados en Fotos · $failed no se pudieron guardar';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvista no tiene permiso para añadir vídeos a Fotos. Puedes permitirlo en Ajustes.';

  @override
  String get clipsPhotosFailed => 'No se pudo guardar en Fotos.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips añadidos a favoritos',
      one: 'Añadido a favoritos',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips quitados de favoritos',
      one: 'Quitado de favoritos',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (recortado)';
  }

  @override
  String get playerTrim => 'Recortar';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Tipo';

  @override
  String get playerReasonRecording => 'Botón Grabar';

  @override
  String get trimTitle => 'Recortar clip';

  @override
  String get trimHint =>
      'Arrastra los controles para elegir la parte que quieres conservar. El clip original no se modifica.';

  @override
  String get trimStartHandle => 'Inicio del recorte';

  @override
  String get trimEndHandle => 'Fin del recorte';

  @override
  String trimSelection(String duration) {
    return 'Selección: $duration';
  }

  @override
  String get trimSave => 'Guardar como clip nuevo';

  @override
  String get trimSaving => 'Guardando el clip recortado…';

  @override
  String get trimSaved => 'Clip recortado guardado';

  @override
  String get trimOpenNew => 'Abrir';

  @override
  String get trimFailed => 'No se pudo recortar este clip.';

  @override
  String get trimStorageFull =>
      'No hay espacio libre suficiente para guardar el clip recortado.';

  @override
  String get trimPreview => 'Reproducir selección';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsSectionCamera => 'Cámara';

  @override
  String get settingsSectionAi => 'IA';

  @override
  String get settingsSectionAlerts => 'Alertas';

  @override
  String get settingsSectionAlertCategories => 'Categorías de alertas';

  @override
  String get settingsSectionRecording => 'Grabación';

  @override
  String get settingsSectionDriving => 'Conducción';

  @override
  String get settingsSectionPower => 'Energía';

  @override
  String get settingsSectionEmergency => 'Emergencia';

  @override
  String get settingsSectionAppearance => 'Apariencia';

  @override
  String get settingsSectionLanguage => 'Idioma';

  @override
  String get settingsSectionInformation => 'Información';

  @override
  String get settingsCameraLens => 'Objetivo de la cámara';

  @override
  String get settingsLensWide => 'Gran angular';

  @override
  String get settingsLensUltraWide => 'Ultra gran angular';

  @override
  String get settingsLensTelephoto => 'Teleobjetivo';

  @override
  String get settingsLensUnavailable => 'No disponible en este iPhone';

  @override
  String get settingsStabilization => 'Estabilización';

  @override
  String get settingsStabAuto => 'Automática';

  @override
  String get settingsStabOff => 'Desactivada';

  @override
  String get settingsStabStandard => 'Estándar';

  @override
  String get settingsStabCinematic => 'Cinematográfica';

  @override
  String get settingsOverlayOpacity => 'Opacidad de la capa';

  @override
  String get settingsShowFps => 'Mostrar estadísticas de rendimiento';

  @override
  String get settingsShowFpsSubtitle =>
      'Fotogramas por segundo y tiempo de inferencia en la vista de detección';

  @override
  String get settingsCameraFooter =>
      'Los cambios de objetivo y estabilización se aplican la próxima vez que se inicie la cámara.';

  @override
  String get settingsAiModel => 'Modelo de IA';

  @override
  String get settingsConfidence => 'Confianza de detección';

  @override
  String get settingsTracking => 'Seguimiento de objetos';

  @override
  String get settingsTrackingSubtitle =>
      'Mantiene los objetos estables entre fotogramas';

  @override
  String get settingsShowLabels => 'Mostrar etiquetas';

  @override
  String get settingsShowConfidence => 'Mostrar confianza';

  @override
  String get settingsSegmentationOpacity =>
      'Opacidad de la máscara de percepción';

  @override
  String get settingsAiFooter =>
      'Una confianza menor muestra más objetos, pero también más falsas detecciones. Las detecciones pueden ser inexactas.';

  @override
  String get settingsVoiceAlerts => 'Alertas de voz';

  @override
  String get settingsVoiceLanguage => 'Idioma de la voz';

  @override
  String get settingsVoiceLanguageAuto => 'Igual que la app';

  @override
  String get settingsVoice => 'Voz';

  @override
  String get settingsVoiceDefault => 'Predeterminada del sistema';

  @override
  String get settingsVoiceQualityEnhanced => 'Mejorada';

  @override
  String get settingsVoiceQualityPremium => 'Alta calidad';

  @override
  String get settingsNoVoices =>
      'No hay ninguna voz instalada para este idioma. Añade una en Ajustes de iOS › Accesibilidad › Contenido hablado.';

  @override
  String get settingsAlertPedestrian => 'Peatones';

  @override
  String get settingsAlertCyclist => 'Ciclistas';

  @override
  String get settingsAlertMotorcycle => 'Motos';

  @override
  String get settingsAlertBus => 'Autobuses';

  @override
  String get settingsAlertVehicleClose => 'Vehículo muy cerca delante';

  @override
  String get settingsAlertTrafficLight => 'Cambios de semáforo';

  @override
  String get settingsAlertTrafficMoving => 'El tráfico de delante avanza';

  @override
  String get settingsAlertStopSign => 'Señales de stop';

  @override
  String get settingsSensitivity => 'Sensibilidad';

  @override
  String get settingsSensitivityLow => 'Baja';

  @override
  String get settingsSensitivityMedium => 'Media';

  @override
  String get settingsSensitivityHigh => 'Alta';

  @override
  String get settingsCooldown => 'Intervalo de repetición';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Volumen de la voz';

  @override
  String get settingsQuietMode => 'Modo silencioso';

  @override
  String get settingsQuietModeSubtitle =>
      'Solo se anuncian las alertas más importantes';

  @override
  String get settingsTestVoice => 'Probar voz';

  @override
  String get settingsTestVoiceDone => 'Reproduciendo una alerta de muestra…';

  @override
  String get settingsParkingBeeps => 'Pitidos de aparcamiento';

  @override
  String get settingsBeepVolume => 'Volumen de los pitidos';

  @override
  String get settingsAlertsFooter =>
      'Las alertas son solo una ayuda. Mira siempre la carretera: el silencio no significa que el camino esté libre.';

  @override
  String get settingsRecordingProfile => 'Calidad de grabación';

  @override
  String get settingsProfileStandard => 'Estándar · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Búfer de incidentes';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds segundos';
  }

  @override
  String get settingsManualMaxLength =>
      'Duración máxima de la grabación manual';

  @override
  String get settingsManualMaxUnlimited => 'Sin límite';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Grabar audio';

  @override
  String get settingsRecordAudioSubtitle =>
      'Incluye el audio del habitáculo en los incidentes guardados';

  @override
  String get settingsMicDenied =>
      'El acceso al micrófono está desactivado. Permítelo en Ajustes para grabar audio.';

  @override
  String get settingsWatermark => 'Marca de agua de Corvista';

  @override
  String get settingsTimestamp => 'Sello de fecha y hora';

  @override
  String get settingsSaveLocation => 'Guardar ubicación con los clips';

  @override
  String get settingsStorage => 'Almacenamiento y clips';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clips',
      one: '1 clip',
      zero: 'Sin clips',
    );
    return '$_temp0 · $used usados · $free libres';
  }

  @override
  String get settingsRecordingFooter =>
      'El búfer continuo permanece en tu iPhone y se sobrescribe constantemente. No se graba nada en segundo plano.';

  @override
  String get settingsDefaultView => 'Vista predeterminada';

  @override
  String get settingsUnits => 'Unidades';

  @override
  String get settingsShowCompass => 'Mostrar brújula';

  @override
  String get settingsHudStyle => 'Estilo del HUD';

  @override
  String get settingsHudCustomize => 'Personalizar HUD';

  @override
  String get settingsDrivingSide => 'Lado de conducción';

  @override
  String get settingsDrivingSideAuto => 'Automático';

  @override
  String get settingsDrivingSideRight => 'Derecha';

  @override
  String get settingsDrivingSideLeft => 'Izquierda';

  @override
  String get settingsVirtualStyle => 'Estilo de la vista virtual';

  @override
  String get settingsVirtualMinimal => 'Mínimo';

  @override
  String get settingsVirtualPerspective => 'Perspectiva';

  @override
  String get settingsVirtualHighContrast => 'Alto contraste';

  @override
  String get settingsKeepScreenOn =>
      'Mantener la pantalla encendida al conducir';

  @override
  String get settingsLiveActivity => 'Actividad en vivo';

  @override
  String get settingsLiveActivityDesc =>
      'Mostrar las indicaciones en la pantalla bloqueada y en la Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Grabación en pausa mientras Corvista estaba en segundo plano';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'En pausa';

  @override
  String get liveActivityDashcamOff => 'Cámara off';

  @override
  String get liveActivityEnded => 'Navegación finalizada';

  @override
  String get liveActivityEta => 'Llegada';

  @override
  String get settingsAutoRecenter => 'Recentrar mapa automáticamente';

  @override
  String get settingsHudStyleClassic => 'Clásico';

  @override
  String get settingsHudStyleGrid => 'Cuadrícula';

  @override
  String get settingsHudStyleMinimal => 'Mínimo';

  @override
  String get settingsHudStylePerformance => 'Rendimiento';

  @override
  String get settingsHudStyleNavigation => 'Navegación';

  @override
  String get settingsHudStyleNight => 'Noche';

  @override
  String get settingsHudStyleHighContrast => 'Alto contraste';

  @override
  String get settingsPowerMode => 'Modo de energía';

  @override
  String get settingsPowerBalanced => 'Equilibrado';

  @override
  String get settingsPowerPerformance => 'Rendimiento';

  @override
  String get settingsPowerSaver => 'Ahorro';

  @override
  String get settingsPowerFooter =>
      'Corvista reduce automáticamente la frecuencia de la IA y los efectos visuales cuando tu iPhone se calienta o la batería está baja.';

  @override
  String get settingsThermal => 'Estado térmico';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Cálido';

  @override
  String get settingsThermalSerious => 'Caliente';

  @override
  String get settingsThermalCritical => 'Crítico';

  @override
  String get settingsBattery => 'Batería';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Cargando';
  }

  @override
  String get settingsLowPowerMode =>
      'El modo de bajo consumo está activado: la IA funciona a menor frecuencia.';

  @override
  String get settingsAiRate => 'Frecuencia actual de la IA';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Detección de impactos';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Activada · cuenta atrás de $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Experimental. No sustituye a los servicios de emergencia.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeDark => 'Oscuro';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsReduceMotion => 'Reducir movimiento';

  @override
  String get settingsReduceMotionSubtitle =>
      'Minimiza las animaciones en toda la app';

  @override
  String get settingsAppLanguage => 'Idioma de la app';

  @override
  String get settingsPrivacyPolicy => 'Política de privacidad';

  @override
  String get settingsTerms => 'Términos de uso';

  @override
  String get settingsHelp => 'Ayuda';

  @override
  String get settingsSupport => 'Contactar con soporte';

  @override
  String get settingsLicenses => 'Licencias de código abierto';

  @override
  String get settingsSupportUnavailable =>
      'No se pudo abrir Mail. Escribe a support@corvista.app.';

  @override
  String get settingsSafety => 'Información de seguridad';

  @override
  String get settingsDiagnostics => 'Diagnóstico';

  @override
  String get settingsVersion => 'Versión';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Personalizar HUD';

  @override
  String get hudCustomPreview => 'Vista previa · valores de muestra';

  @override
  String get hudCustomStyle => 'Estilo';

  @override
  String get hudCustomElements => 'Elementos';

  @override
  String get hudCustomSpeed => 'Velocidad';

  @override
  String get hudCustomHeading => 'Rumbo y brújula';

  @override
  String get hudCustomClock => 'Reloj';

  @override
  String get hudCustomBattery => 'Batería y temperatura';

  @override
  String get hudCustomDetections => 'Estado de la IA y detecciones';

  @override
  String get hudCustomWeather => 'Tiempo';

  @override
  String get hudCustomAppearance => 'Tamaño y opacidad';

  @override
  String get hudCustomSize => 'Tamaño';

  @override
  String get hudCustomOpacity => 'Opacidad';

  @override
  String get hudCustomFooter =>
      'Los avisos, como el sobrecalentamiento, se muestran siempre, aunque haya elementos ocultos.';

  @override
  String get hudCustomDescClassic => 'Cuadro de instrumentos equilibrado';

  @override
  String get hudCustomDescGrid =>
      'Cuadrícula en perspectiva sobre la carretera';

  @override
  String get hudCustomDescMinimal => 'Solo velocidad, nada más';

  @override
  String get hudCustomDescPerformance =>
      'Arco de velocidad con lecturas en vivo';

  @override
  String get hudCustomDescNavigation => 'Primero la siguiente maniobra';

  @override
  String get hudCustomDescNight =>
      'Tenue y con tono rojizo para conducir de noche';

  @override
  String get hudCustomDescHighContrast => 'Máxima legibilidad con sol intenso';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageSystem => 'Predeterminado del sistema';

  @override
  String get languageSystemSubtitle => 'Seguir el idioma de tu iPhone';

  @override
  String get languageFooter =>
      'Habrá más idiomas. El idioma de las alertas de voz se puede ajustar por separado en Alertas.';

  @override
  String get diagTitle => 'Diagnóstico';

  @override
  String get diagPerformance => 'Rendimiento';

  @override
  String get diagInference => 'Tiempo de inferencia';

  @override
  String get diagDetectHz => 'Frecuencia de detección';

  @override
  String get diagCameraFps => 'Fotogramas por segundo de la cámara';

  @override
  String get diagMemory => 'Memoria';

  @override
  String get diagDropped => 'Fotogramas perdidos';

  @override
  String get diagSegmentation => 'Tiempo de segmentación';

  @override
  String get diagCamera => 'Cámara';

  @override
  String get diagStatus => 'Estado';

  @override
  String get diagSource => 'Origen';

  @override
  String get diagSourceCamera => 'Cámara en vivo';

  @override
  String get diagSourceFile => 'Archivo de grabación de prueba';

  @override
  String get diagResolution => 'Tamaño del búfer';

  @override
  String get diagLens => 'Objetivo';

  @override
  String get diagError => 'Último error';

  @override
  String get diagModel => 'Modelo de IA';

  @override
  String get diagModelLoad => 'Tiempo de carga del modelo';

  @override
  String get diagPower => 'Energía';

  @override
  String get diagSegHz => 'Frecuencia de segmentación';

  @override
  String get diagReduced => 'Efectos reducidos';

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
  String get diagCamStarting => 'Iniciando';

  @override
  String get diagCamRunning => 'En marcha';

  @override
  String get diagCamInterrupted => 'Interrumpida';

  @override
  String get diagCamStopped => 'Detenida';

  @override
  String get diagCamUnavailable => 'No disponible';

  @override
  String get diagCamPermissionDenied => 'Permiso denegado';

  @override
  String get diagCamError => 'Error';

  @override
  String get diagTestFootage => 'Grabación de prueba';

  @override
  String get diagTestFootageBody =>
      'Ejecuta detección real en el dispositivo sobre un archivo de vídeo local en lugar de la cámara. Todas las vistas lo indican con GRABACIÓN DE PRUEBA.';

  @override
  String get diagPathLabel => 'Ruta del archivo de vídeo';

  @override
  String get diagPathHint => '/ruta/al/trayecto.mp4';

  @override
  String get diagUseDocuments => 'Usar Documents/test_drive.mp4';

  @override
  String get diagRun => 'Ejecutar grabación de prueba';

  @override
  String get diagRunStarted =>
      'Grabación de prueba iniciada. Abre la vista de conducción para verla.';

  @override
  String get diagBackToCamera => 'Volver a la cámara en vivo';

  @override
  String get diagDebugOnly =>
      'La grabación de prueba solo está disponible en compilaciones de desarrollo.';

  @override
  String get diagFileMissing => 'No existe ningún archivo en esa ruta.';

  @override
  String get emergencySetupTitle => 'Detección de impactos';

  @override
  String get emergencyExperimental => 'Experimental';

  @override
  String get emergencyIntro =>
      'Durante un trayecto, Corvista puede vigilar un posible impacto grave mediante los sensores de movimiento de tu iPhone. Si detecta uno, se inicia una cuenta atrás. Si no la cancelas, Corvista te ofrece llamar a los servicios de emergencia y enviar un mensaje a tus contactos.';

  @override
  String get emergencyDisclaimer1 =>
      'No sustituye a los servicios de emergencia ni a la detección de accidentes del propio vehículo.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS siempre te pide confirmación antes de realizar una llamada o enviar un mensaje.';

  @override
  String get emergencyDisclaimer3 =>
      'Pueden pasar impactos sin detectar, y una frenada brusca o los baches pueden confundirse con uno.';

  @override
  String get emergencyParkedWarning =>
      'Completa esta configuración con el vehículo aparcado. Los ajustes se bloquean mientras el vehículo está en movimiento.';

  @override
  String get emergencyEnable => 'Activar detección de impactos';

  @override
  String get emergencyEnableSubtitle =>
      'Activa solo durante una sesión de conducción';

  @override
  String get emergencyNeedNumber => 'Añade primero un número de emergencia.';

  @override
  String get emergencyContacts => 'Contactos de emergencia';

  @override
  String get emergencyAddContact => 'Añadir contacto';

  @override
  String get emergencyNoContacts =>
      'Aún no hay contactos. Los contactos solo reciben un mensaje después de que lo confirmes.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return '¿Quitar a $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'No se le ofrecerá como destinatario tras un impacto.';

  @override
  String get emergencyRemove => 'Quitar';

  @override
  String get emergencyContactsError => 'No se pudieron cargar los contactos.';

  @override
  String get emergencyNumber => 'Número de emergencia';

  @override
  String get emergencyNumberHint => 'p. ej., 112 o 911';

  @override
  String get emergencyMessage => 'Plantilla de mensaje';

  @override
  String get emergencyMessageDefault =>
      'Puede que haya sufrido un accidente de tráfico. Este mensaje lo ha preparado Corvista e incluye mi última ubicación conocida, si está disponible.';

  @override
  String get emergencyMessageHint =>
      'Déjalo vacío para usar el mensaje predeterminado.';

  @override
  String get emergencyCountdown => 'Duración de la cuenta atrás';

  @override
  String get emergencyVoiceCancel => 'Cancelar por voz';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Di «Estoy bien» o «Cancelar» durante la cuenta atrás. Usa el reconocimiento de voz en el dispositivo cuando está disponible.';

  @override
  String get emergencyVoicePermDenied =>
      'Se necesita acceso al micrófono y al reconocimiento de voz para cancelar por voz.';

  @override
  String get emergencyAutoSave =>
      'Guardar automáticamente el clip del incidente';

  @override
  String get emergencyTest => 'Probar cuenta atrás (sin llamada)';

  @override
  String get emergencyTestBody =>
      'Ejecuta un impacto simulado para que veas la cuenta atrás. En el modo de prueba nunca se realiza ninguna llamada ni se envía ningún mensaje.';

  @override
  String get emergencyNotSet => 'Sin definir';

  @override
  String get emergencyAlertHeadline => 'Posible impacto grave detectado.';

  @override
  String get emergencyAlertSubtitle => '¿Estás bien?';

  @override
  String get emergencyAlertCancel => 'Estoy bien — Cancelar';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Quedan $seconds segundos',
      one: 'Queda 1 segundo',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Escuchando — di «Estoy bien» para cancelar';

  @override
  String emergencyAlertHeard(String text) {
    return 'Se oyó: «$text»';
  }

  @override
  String get emergencyAlertEscalated => 'Sin respuesta. Elige qué hacer:';

  @override
  String get emergencyAlertCall => 'Llamar a emergencias';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Llama al $number. iOS te pide confirmación.';
  }

  @override
  String get emergencyAlertMessage => 'Enviar mensaje a contactos';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Abre un mensaje preparado. Tú decides si enviarlo.';

  @override
  String get emergencyAlertTestMode =>
      'Modo de prueba — no se realizará ninguna llamada';

  @override
  String get emergencyAlertTestBadge => 'PRUEBA';

  @override
  String get emergencyAlertClose => 'Estoy bien — Cerrar';

  @override
  String get emergencyMsgSent => 'Mensaje enviado.';

  @override
  String get emergencyMsgCancelled => 'Mensaje no enviado.';

  @override
  String get emergencyMsgFailed => 'No se pudo enviar el mensaje.';

  @override
  String get emergencyMsgUnavailable =>
      'La mensajería no está disponible en este dispositivo.';

  @override
  String emergencyCallFailed(String number) {
    return 'No se pudo iniciar la llamada. Marca tú mismo el $number.';
  }

  @override
  String get modelsTitle => 'Modelos de IA';

  @override
  String get modelsIntro =>
      'Todos los modelos vienen incluidos en la app y se ejecutan por completo en tu iPhone. La imagen de tu cámara nunca sale del dispositivo.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'En vivo: $ms ms por fotograma · $hz detecciones/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Cargado en $ms ms';
  }

  @override
  String get modelsEfficientName => 'Eficiente';

  @override
  String get modelsEfficientDesc =>
      'Detector rápido y compacto, pensado para trayectos largos con poco calor y bajo consumo de batería.';

  @override
  String get modelsEnhancedName => 'Mejorado';

  @override
  String get modelsEnhancedDesc =>
      'Detector más grande que encuentra objetos más pequeños y lejanos, con mayor consumo de energía.';

  @override
  String get modelsSegmentationName => 'Segmentación';

  @override
  String get modelsSegmentationDesc =>
      'Combina detección rápida con máscaras de la calzada y de objetos para la vista Percepción.';

  @override
  String get modelsNoneName => 'IA en pausa';

  @override
  String get modelsNoneDesc =>
      'La cámara y la grabación siguen funcionando sin detección de objetos. Menor consumo de energía.';

  @override
  String get modelsGenericDesc =>
      'Modelo de detección de objetos en el dispositivo.';

  @override
  String get modelsFunctionDetection =>
      'Detecta vehículos, personas, bicicletas, motos, autobuses, semáforos y señales de stop';

  @override
  String get modelsFunctionSegmentation =>
      'Añade máscaras de la calzada y de objetos';

  @override
  String get modelsFunctionNone => 'Sin detección; solo grabación de dashcam';

  @override
  String get modelsSize => 'Tamaño';

  @override
  String get modelsInput => 'Entrada';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Compatible con';

  @override
  String get modelsStatusInstalled => 'Instalado (incluido)';

  @override
  String get modelsStatusNotInstalled => 'No instalado';

  @override
  String get modelsSelected => 'Seleccionado';

  @override
  String get modelsUse => 'Usar este modelo';

  @override
  String get modelsSwitching => 'Cargando modelo…';

  @override
  String modelsSwitched(String name) {
    return '$name está activo ahora';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Medido en este dispositivo: $ms ms de media';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'No medido en este dispositivo';

  @override
  String get modelsBenchmarkRun => 'Ejecutar prueba de rendimiento';

  @override
  String get modelsBenchmarkRunning => 'Midiendo rendimiento…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Selecciona este modelo para medir su rendimiento.';

  @override
  String get modelsBenchmarkDone => 'Prueba completada';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Falló la prueba: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Última actualización: $date';
  }

  @override
  String get safetyTitle => 'Información de seguridad';

  @override
  String get safetyIntro =>
      'Corvista es una ayuda para la atención al volante. No controla tu vehículo y no puede sustituir tu propia atención, tu criterio ni los sistemas de seguridad del vehículo.';

  @override
  String get safetyBeforeTitle => 'Antes de conducir';

  @override
  String get safetyBefore1 =>
      'Fija tu iPhone con firmeza en una posición legal que no tape tu visión, los airbags ni los mandos.';

  @override
  String get safetyBefore2 =>
      'Termina la configuración, elige una vista y define tu destino con el vehículo aparcado.';

  @override
  String get safetyBefore3 =>
      'Conecta un cargador en trayectos largos y, si es posible, evita la luz solar directa sobre el teléfono.';

  @override
  String get safetyWhileTitle => 'Al conducir';

  @override
  String get safetyWhile1 =>
      'Mantén la vista en la carretera. Usa los controles grandes de la pantalla solo cuando sea seguro y legal.';

  @override
  String get safetyWhile2 =>
      'Las alertas son ayudas, no avisos en los que puedas confiar. El silencio nunca significa que la carretera esté libre.';

  @override
  String get safetyWhile3 =>
      'Cumple las normas de tráfico, las señales y la señalización, no la app, cuando no coincidan.';

  @override
  String get safetyLimitsTitle => 'Limitaciones';

  @override
  String get safetyLimits1 =>
      'La cámara de un solo teléfono solo ve lo que tiene delante. Los objetos fuera de su campo de visión, ocultos o muy cercanos no se detectan.';

  @override
  String get safetyLimits2 =>
      'Las detecciones pueden fallar, llegar tarde o ser erróneas, sobre todo de noche, con lluvia, niebla, deslumbramiento o con el parabrisas sucio.';

  @override
  String get safetyLimits3 =>
      'Solo se reconocen las categorías compatibles: vehículos, autobuses, motos, bicicletas, personas, semáforos y señales de stop. Las líneas de carril de la vista virtual son estilizadas, no carriles detectados.';

  @override
  String get safetyLimits4 =>
      'La proximidad se muestra en zonas aproximadas (Muy cerca, Cerca, Media, Lejos), nunca como distancias medidas. La vista de aparcamiento no sustituye a un sensor de aparcamiento.';

  @override
  String get safetyHeatTitle => 'Calor y batería';

  @override
  String get safetyHeat1 =>
      'El uso continuo de la cámara y la IA calienta tu iPhone. Corvista reduce la frecuencia de análisis cuando el dispositivo se calienta y muestra un aviso; si iOS se sobrecalienta, la cámara puede detenerse.';

  @override
  String get safetyEmergencyTitle => 'Función de emergencia';

  @override
  String get safetyEmergency1 =>
      'La detección de posibles impactos es experimental. Puede no detectar choques reales y activarse por otros eventos.';

  @override
  String get safetyEmergency2 =>
      'Nunca contacta con nadie en silencio: iOS siempre te pide confirmar una llamada o un mensaje. No sustituye a que llames tú mismo a los servicios de emergencia.';

  @override
  String get privacyTitle => 'Privacidad';

  @override
  String get privacyIntro =>
      'Corvista está diseñado para mantener tus datos de conducción en tu iPhone. No existe una cuenta de Corvista, y Corvista no utiliza servidores propios.';

  @override
  String get privacyCameraTitle => 'Cámara e IA';

  @override
  String get privacyCamera1 =>
      'La detección, el seguimiento y la segmentación de objetos se ejecutan por completo en tu iPhone. Las imágenes de la cámara nunca se suben.';

  @override
  String get privacyCamera2 =>
      'La cámara solo funciona mientras Corvista está abierto en pantalla. Se pausa cuando la app pasa a segundo plano: no hay ninguna grabación oculta en segundo plano.';

  @override
  String get privacyRecordingsTitle => 'Grabaciones';

  @override
  String get privacyRecordings1 =>
      'El búfer continuo es temporal y se sobrescribe constantemente. Las imágenes solo se conservan cuando tocas Guardar incidente o, si lo activas, tras un posible impacto.';

  @override
  String get privacyRecordings2 =>
      'Los clips guardados permanecen en el almacenamiento privado de Corvista en tu iPhone. Solo salen del dispositivo cuando eliges Compartir. Al eliminar la app, se eliminan.';

  @override
  String get privacyRecordings3 =>
      'El audio solo se graba si lo activas y concedes acceso al micrófono.';

  @override
  String get privacyLocationTitle => 'Ubicación';

  @override
  String get privacyLocation1 =>
      'La ubicación se usa mientras la app está abierta para tu velocidad, el mapa, las rutas y el tiempo. Si «Guardar ubicación» está activado, la posición en el momento de guardar se almacena con el clip en tu dispositivo.';

  @override
  String get privacyNetworkTitle => 'Servicios de red';

  @override
  String get privacyNetwork1 =>
      'Apple Maps: visualización del mapa, búsqueda de lugares y rutas. El texto de tu búsqueda y tu ubicación aproximada se envían a Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit): tiempo actual y por horas para tu ubicación.';

  @override
  String get privacyNetwork4 =>
      'Corvista no incluye publicidad ni analíticas o seguimiento de terceros.';

  @override
  String get privacyEmergencyTitle => 'Contactos de emergencia';

  @override
  String get privacyEmergency1 =>
      'Los contactos que elijas se almacenan en el llavero de iOS de este dispositivo. La cancelación por voz usa el reconocimiento de voz en el dispositivo cuando está disponible. Las llamadas y los mensajes solo se envían después de que los confirmes en iOS.';

  @override
  String get privacyControlsTitle => 'Tus controles';

  @override
  String get privacyControls1 =>
      'Puedes eliminar clips en cualquier momento en Clips, y cambiar o revocar el acceso a la cámara, el micrófono, la ubicación y el reconocimiento de voz en los Ajustes de iOS.';

  @override
  String get termsTitle => 'Términos de uso';

  @override
  String get termsIntro =>
      'Al usar Corvista aceptas estos términos. También se aplica el Contrato de licencia de usuario final de aplicación bajo licencia estándar de Apple.';

  @override
  String get termsUseTitle => 'Uso de Corvista';

  @override
  String get termsUse1 =>
      'Corvista es una ayuda para la atención al volante y una dashcam. Sigues siendo plenamente responsable de conducir con seguridad y conforme a la ley en todo momento.';

  @override
  String get termsUse2 =>
      'No interactúes con la app de formas que te distraigan mientras conduces. Fija el dispositivo con firmeza y conforme a la ley.';

  @override
  String get termsAccuracyTitle => 'Sin garantía de exactitud';

  @override
  String get termsAccuracy1 =>
      'Las detecciones, zonas, alertas, marcadores del mapa, rutas y datos meteorológicos pueden ser incompletos, tardíos o erróneos. Corvista no controla tu vehículo.';

  @override
  String get termsAccuracy2 =>
      'La función de emergencia es experimental y puede no detectar un impacto o activarse por error.';

  @override
  String get termsRecordingTitle => 'Normativa de grabación';

  @override
  String get termsRecording1 =>
      'Las leyes sobre dashcams, grabación de audio y filmación de personas varían según el país y la región. Eres responsable de cumplirlas, también cuando compartas clips.';

  @override
  String get termsLiabilityTitle => 'Responsabilidad';

  @override
  String get termsLiability1 =>
      'La app se proporciona «tal cual». En la medida permitida por la ley, el desarrollador no es responsable de accidentes, pérdidas, multas o daños derivados de su uso o de confiar en sus resultados.';

  @override
  String get termsChangesTitle => 'Cambios';

  @override
  String get termsChanges1 =>
      'Estos términos pueden actualizarse con nuevas versiones de la app. Seguir usándola tras una actualización implica que aceptas los términos revisados.';

  @override
  String get helpTitle => 'Ayuda';

  @override
  String get helpIntro =>
      'Respuestas a preguntas frecuentes. Para consejos de seguridad, consulta Información de seguridad.';

  @override
  String get helpQSave => '¿Cómo conservo la grabación de un incidente?';

  @override
  String get helpASaveBuffer =>
      'Toca el botón grande Guardar incidente en la vista de conducción. Corvista guarda en Clips los últimos 20 o 30 segundos de su búfer continuo (tú eliges en Ajustes › Grabación).';

  @override
  String get helpQWhere => '¿Dónde se almacenan mis clips?';

  @override
  String get helpAWhere =>
      'En el almacenamiento privado de Corvista en tu iPhone. Nunca se suben. Usa Compartir en el reproductor para enviar o exportar un clip.';

  @override
  String get helpQZones => '¿Qué precisión tienen las zonas de proximidad?';

  @override
  String get helpAZones =>
      'Las zonas son estimaciones aproximadas obtenidas con una sola cámara a partir de tamaños típicos de objetos. Considéralas indicaciones aproximadas, nunca distancias.';

  @override
  String get helpQSlow => '¿Por qué se ralentiza la detección?';

  @override
  String get helpASlow =>
      'Cuando tu iPhone se calienta, la batería está baja o el modo de bajo consumo está activado, Corvista reduce la frecuencia de análisis para proteger el dispositivo. Puedes cambiar el modo de energía en Ajustes.';

  @override
  String get helpQMap => 'El mapa, la búsqueda o el tiempo no funcionan.';

  @override
  String get helpAMap =>
      'Estas funciones requieren conexión a internet y acceso a la ubicación. Comprueba tu conexión y permite la ubicación para Corvista en los Ajustes de iOS.';

  @override
  String get helpQSimulator => 'La cámara aparece como no disponible.';

  @override
  String get helpASimulator =>
      'Asegúrate de que el acceso a la cámara esté permitido en los Ajustes de iOS y de que ninguna otra app la esté usando. El simulador de iOS no tiene cámara; en su lugar se puede usar un vídeo de prueba local.';

  @override
  String get emergencyMsgNoContacts =>
      'Añade primero un contacto de emergencia.';

  @override
  String get cameraStarting => 'Iniciando cámara…';

  @override
  String get cameraInterrupted => 'Cámara en pausa';

  @override
  String get cameraInterruptedBody =>
      'iOS pausó la cámara, por ejemplo durante una llamada o mientras otra app la usa. Se reanuda automáticamente.';

  @override
  String get cameraUnavailable => 'Cámara no disponible';

  @override
  String get cameraUnavailableBody =>
      'No hay ninguna cámara disponible en este dispositivo. La detección, la grabación y las vistas de aparcamiento necesitan la cámara trasera.';

  @override
  String get cameraRunTestFootage => 'Ejecutar grabación de prueba';

  @override
  String get cameraPermissionDenied => 'El acceso a la cámara está desactivado';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista necesita la cámara para la detección, la grabación de dashcam y las vistas de aparcamiento. Activa el acceso a la cámara en Ajustes.';

  @override
  String get cameraError => 'Error de cámara';

  @override
  String get cameraStopped => 'Cámara detenida';

  @override
  String get cameraStart => 'Iniciar cámara';

  @override
  String get cameraFocusHint => 'Toca para enfocar';

  @override
  String get cameraPreviewLabel =>
      'Vista de cámara en vivo con los objetos detectados';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Cámara $fps fps · IA $hz Hz · $ms ms · perdidos $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Velocidad $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Sin velocidad GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Rumbo $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Búfer de grabación de dashcam, $seconds de $target segundos almacenados';
  }

  @override
  String get hudRecIdle => 'REC desactivado';

  @override
  String get hudRecSaving => 'Guardando…';

  @override
  String get hudRecError => 'Error de REC';

  @override
  String get hudAiPaused => 'IA en pausa';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objetos',
      one: '1 objeto',
      zero: 'Sin objetos',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objetos detectados',
      one: '1 objeto detectado',
      zero: 'ningún objeto detectado',
    );
    return 'Modelo de IA $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Caliente — IA ralentizada';

  @override
  String get hudThermalCritical => 'Demasiado caliente — IA en pausa';

  @override
  String hudBatteryLow(String percent) {
    return 'Batería $percent';
  }

  @override
  String get hudLowPower => 'Modo de bajo consumo';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Tiempo $temperature, $condition. Toca para ver detalles.';
  }

  @override
  String get hudNoGuidance =>
      'Busca un destino en la vista Mapa para ver aquí la guía paso a paso.';

  @override
  String get navArrived => 'Has llegado';

  @override
  String get navRerouting => 'Recalculando ruta…';

  @override
  String get navSearchHint => 'Buscar destino';

  @override
  String get navSearchFieldHint => 'Dirección, lugar o negocio';

  @override
  String get navNoResults => 'No hay lugares coincidentes';

  @override
  String get navSearching => 'Buscando…';

  @override
  String get navSearchStartTyping =>
      'Escribe una dirección o el nombre de un lugar. Los resultados proceden de Apple Maps y requieren conexión a internet.';

  @override
  String get navErrorUnavailable =>
      'La búsqueda y las rutas no están disponibles: comprueba tu conexión a internet.';

  @override
  String get navErrorNoLocation =>
      'Esperando tu ubicación para planificar una ruta.';

  @override
  String get navErrorPermission =>
      'El acceso a la ubicación está desactivado, por lo que las rutas no pueden partir de tu posición.';

  @override
  String navErrorGeneric(String code) {
    return 'No se pudieron cargar las rutas ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Rutas a $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Llegada $time';
  }

  @override
  String get navStart => 'Iniciar';

  @override
  String get navEnd => 'Finalizar';

  @override
  String get navEndLabel => 'Finalizar navegación';

  @override
  String navRemaining(String distance, String duration) {
    return 'Quedan $distance · $duration';
  }

  @override
  String navAdvisory(String text) {
    return 'Aviso: $text';
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
  String get weatherTitle => 'Tiempo';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Sensación de $temperature';
  }

  @override
  String get weatherPrecipitation => 'Precipitación';

  @override
  String get weatherWind => 'Viento';

  @override
  String get weatherVisibility => 'Visibilidad';

  @override
  String get weatherHumidity => 'Humedad';

  @override
  String get weatherHourly => 'Próximas horas';

  @override
  String weatherAsOf(String time) {
    return 'Actualizado $time';
  }

  @override
  String get weatherRefresh => 'Actualizar el tiempo';

  @override
  String get weatherUnavailable =>
      'El tiempo no está disponible en este momento.';

  @override
  String get weatherNoLocation => 'El tiempo necesita tu ubicación.';

  @override
  String get weatherLegal => 'Fuentes de datos y aviso legal';

  @override
  String weatherProvidedBy(String service) {
    return 'Datos meteorológicos: $service';
  }

  @override
  String get weatherNow => 'Ahora';

  @override
  String get virtualEmpty => 'No se detectan objetos compatibles';

  @override
  String get virtualEmptyCameraOff =>
      'La vista virtual necesita la cámara en vivo.';

  @override
  String get virtualLaneDisclaimer =>
      'Las líneas de carril son ilustrativas, no detectadas.';

  @override
  String virtualNearest(String zone) {
    return 'Más cercano: $zone';
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
  String get virtualStatusLive => 'activa';

  @override
  String get virtualStatusPaused => 'en pausa';

  @override
  String get virtualStatusCameraOff => 'Cámara apagada';

  @override
  String get virtualStatusTestFootage => 'Grabación de prueba';

  @override
  String get virtualEmptyHint =>
      'Los vehículos, personas, bicicletas, semáforos y señales de stop aparecerán aquí cuando se detecten.';

  @override
  String get mapRecenter => 'Recentrar';

  @override
  String get mapZoomIn => 'Acercar';

  @override
  String get mapZoomOut => 'Alejar';

  @override
  String get mapUnsupported => 'El mapa interactivo está disponible en iPhone.';

  @override
  String get mapObjectsApprox =>
      'Los marcadores de objetos son posiciones aproximadas.';

  @override
  String get mapWeatherUnavailable => 'Tiempo no disponible';

  @override
  String get navErrorNoRoute => 'No se encontró ninguna ruta a este destino.';

  @override
  String get navDismiss => 'Descartar';

  @override
  String get navGo => 'Ir';

  @override
  String get navFastest => 'Más rápida';

  @override
  String get navThen => 'Luego';

  @override
  String get navRecents => 'Recientes';

  @override
  String get navClearRecents => 'Borrar';

  @override
  String get navSearchSubmitHint =>
      'Pulsa Buscar para ver todos los lugares coincidentes';

  @override
  String get navPlaces => 'Lugares';

  @override
  String get navEtaLabel => 'llegada';

  @override
  String get navTimeLeftLabel => 'restante';

  @override
  String get navOverview => 'Vista general';

  @override
  String get navMute => 'Silenciar voz';

  @override
  String get navUnmute => 'Activar voz';

  @override
  String get navEndConfirm => '¿Finalizar la navegación?';

  @override
  String navEndConfirmBody(String place) {
    return 'Se detendrá la guía hacia $place.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Has llegado a $place';
  }

  @override
  String get navDone => 'Listo';

  @override
  String get navWeakGps => 'Señal GPS débil';

  @override
  String get navLocationOff =>
      'La ubicación está desactivada. Actívala para planificar rutas y navegar.';

  @override
  String get navVoiceGuidance => 'Guía por voz';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'En $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, luego $second';
  }

  @override
  String get navSpeakRerouting => 'Recalculando ruta';

  @override
  String get navSpeakArrived => 'Has llegado';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metros',
      one: '1 metro',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilómetros',
      one: '1 kilómetro',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pies',
      one: '1 pie',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yardas',
      one: '1 yarda',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Continúa durante $distance';
  }

  @override
  String get navErrorNoDirections =>
      'No hay indicaciones disponibles para este trayecto en esta región. Prueba con otro destino.';

  @override
  String navContinueFor(String distance) {
    return 'Continúa durante $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value millas',
      one: '1 milla',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Más cercano: $object · $zone';
  }

  @override
  String get parkingNothing => 'No se detecta nada en la vista';

  @override
  String get parkingBeeps => 'Pitidos de proximidad';

  @override
  String get parkingVolume => 'Volumen de los pitidos';

  @override
  String get parkingLimitations =>
      'Una sola cámara, no 360°. Los objetos fuera del campo de la cámara no se detectan. No sustituye a los sensores de aparcamiento; las estimaciones pueden ser erróneas y el silencio no significa que la zona esté despejada.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Vista de proximidad cenital. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Original';

  @override
  String get perceptionModeBoxes => 'Recuadros';

  @override
  String get perceptionModeMasks => 'Máscaras de objetos';

  @override
  String get perceptionModeRoad => 'Calzada';

  @override
  String get perceptionModeCombined => 'Combinado';

  @override
  String get perceptionOpacity => 'Opacidad de la máscara';

  @override
  String get perceptionDisclaimer =>
      'La máscara de la calzada es una capa visual aproximada. No muestra el espacio transitable ni los carriles.';

  @override
  String get perceptionNeedsModel =>
      'Selecciona el modelo Segmentación para ver las máscaras.';

  @override
  String get perceptionChooseModel => 'Elegir modelo';

  @override
  String get perceptionWaiting =>
      'Esperando el primer fotograma de segmentación…';

  @override
  String get perceptionShortCamera => 'Cámara';

  @override
  String get perceptionShortBoxes => 'Recuadros';

  @override
  String get perceptionShortObjects => 'Objetos';

  @override
  String get perceptionShortRoad => 'Vía';

  @override
  String get perceptionShortAll => 'Todo';

  @override
  String get perceptionModesLabel => 'Capas de percepción';

  @override
  String get perceptionStatusWarmingUp => 'Preparando…';

  @override
  String get perceptionStatusLoadingModel => 'Cargando modelo…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Máscaras en pausa';

  @override
  String get perceptionLegend => 'Leyenda de máscaras';

  @override
  String get perceptionUnavailable => 'Máscaras no disponibles';

  @override
  String get driveSave => 'Guardar';

  @override
  String get driveSaveIncident => 'Guardar incidente';

  @override
  String driveSaveHint(int seconds) {
    return 'Guarda los últimos $seconds segundos de grabación de dashcam';
  }

  @override
  String get driveSaving => 'Guardando incidente…';

  @override
  String hudRecManualLabel(String time) {
    return 'Grabando, $time';
  }

  @override
  String get driveRecord => 'Grabar';

  @override
  String get driveRecordStartA11y => 'Iniciar grabación';

  @override
  String driveRecordStopA11y(String time) {
    return 'Detener grabación, $time grabados';
  }

  @override
  String get driveRecordHint =>
      'Graba de forma continua hasta que la detengas, incluidos los 5 segundos anteriores';

  @override
  String get driveRecordFailed => 'No se pudo iniciar la grabación';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Grabación guardada · $count partes',
      one: 'Grabación guardada',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Grabación detenida: almacenamiento casi lleno',
      'max_duration': 'Grabación detenida: se alcanzó la duración máxima',
      'camera_stopped': 'Grabación detenida junto con la cámara',
      'background': 'Grabación detenida: la app pasó a segundo plano',
      'thermal': 'Grabación detenida: el teléfono está demasiado caliente',
      'other': 'Grabación detenida',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Incidente guardado · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Ver';

  @override
  String get driveSaveFailed => 'No se pudo guardar el incidente.';

  @override
  String get driveSaveNotRunning =>
      'La grabación aún no ha comenzado: espera a que se inicie la cámara e inténtalo de nuevo.';

  @override
  String get driveSaveTestFootage =>
      'La grabación de prueba no se guarda. El guardado de incidentes funciona con la cámara en vivo.';

  @override
  String get driveSaveStorageFull =>
      'Tu iPhone se ha quedado sin espacio. Libera espacio o elimina clips antiguos.';

  @override
  String get driveSaveIoError =>
      'No se pudo escribir el clip en el almacenamiento.';

  @override
  String get driveClips => 'Clips';

  @override
  String get driveSettings => 'Ajustes';

  @override
  String get driveViewSwitcher => 'Vistas de conducción';

  @override
  String get driveLocationDenied =>
      'La ubicación está desactivada: velocidad, mapas y rutas no disponibles.';

  @override
  String get driveCameraDenied =>
      'El acceso a la cámara está desactivado: detección y grabación no disponibles.';

  @override
  String get driveRecorderFallback =>
      'Grabando sin audio: el acceso al micrófono está desactivado.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Se ajustaron los ajustes de grabación: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Tu iPhone está caliente. La IA funciona más despacio para enfriarse: evita el sol directo y colócalo cerca de una salida de aire.';

  @override
  String get drivePowerThermalCritical =>
      'Tu iPhone está demasiado caliente. La detección con IA está en pausa hasta que se enfríe; la grabación continúa si es posible.';

  @override
  String get drivePowerLowPower =>
      'El modo de bajo consumo está activado: la IA funciona a menor frecuencia.';

  @override
  String get drivePowerBatteryLow =>
      'Batería baja: conecta tu iPhone a la corriente mientras conduces.';

  @override
  String get onboardingTitle1 => 'Ve más en cada trayecto.';

  @override
  String get onboardingBody1 =>
      'Convierte tu iPhone en una dashcam inteligente y en un compañero de atención al volante.';

  @override
  String get onboardingTitle2 => 'Inteligencia en cada fotograma.';

  @override
  String get onboardingBody2 =>
      'Reconoce vehículos, personas, bicicletas y señales viales compatibles directamente en tu iPhone.';

  @override
  String get onboardingTitle3 => 'Una carretera. Varias perspectivas.';

  @override
  String get onboardingBody3 =>
      'Cambia entre detección en vivo, vistas de conducción virtuales, mapas interactivos y visualización de aparcamiento.';

  @override
  String get onboardingTitle4 => 'Conserva los momentos que importan.';

  @override
  String get onboardingBody4 =>
      'Guarda grabaciones recientes de la dashcam, revisa incidentes y comparte grabaciones.';

  @override
  String get onboardingTitle5 => 'Seguridad y privacidad';

  @override
  String get onboardingSafety1 =>
      'Corvista es una ayuda para la atención al volante. Mantén la vista en la carretera.';

  @override
  String get onboardingSafety2 =>
      'No controla tu vehículo ni sustituye tu criterio.';

  @override
  String get onboardingSafety3 =>
      'Las detecciones y estimaciones pueden ser inexactas o no producirse.';

  @override
  String get onboardingSafety4 =>
      'El procesamiento de la cámara se realiza en tu iPhone: el vídeo no se sube.';

  @override
  String get onboardingSafety5 =>
      'Los mapas, la búsqueda, las rutas y el tiempo necesitan conexión a internet.';

  @override
  String get onboardingSafety6 =>
      'Fija tu iPhone con firmeza para que no tape tu visión.';

  @override
  String get onboardingSafety7 =>
      'Completa la configuración antes de empezar a conducir.';

  @override
  String get onboardingAcknowledge =>
      'Entiendo que Corvista es una ayuda para la atención y que sigo siendo responsable de conducir con seguridad.';

  @override
  String get onboardingReadSafety =>
      'Leer la información de seguridad completa';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingSkip => 'Omitir';

  @override
  String get onboardingAgree => 'Continuar';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Página $current de $total';
  }

  @override
  String get permTitle => 'Permisos';

  @override
  String get permIntro =>
      'Corvista solo pide lo que necesita cada función. Puedes cambiarlos en cualquier momento en Ajustes.';

  @override
  String get permCameraTitle => 'Cámara';

  @override
  String get permCameraBody =>
      'Necesaria para la detección, la grabación de dashcam y la vista de aparcamiento. El vídeo se procesa en tu iPhone.';

  @override
  String get permLocationTitle => 'Ubicación';

  @override
  String get permLocationBody =>
      'Se usa para la velocidad GPS, el mapa, las rutas, el tiempo y para etiquetar los clips guardados. Solo mientras usas la app.';

  @override
  String get permMicTitle => 'Micrófono';

  @override
  String get permSpeechNote =>
      'El reconocimiento de voz solo se solicita si activas la cancelación por voz de las alertas de emergencia.';

  @override
  String get permRequired => 'Obligatorio';

  @override
  String get permOptional => 'Opcional';

  @override
  String get permAllow => 'Permitir';

  @override
  String get permGranted => 'Permitido';

  @override
  String get permDenied => 'Denegado';

  @override
  String get permLimited => 'Limitado';

  @override
  String get permRestricted => 'Restringido';

  @override
  String get permStart => 'Empezar a conducir';

  @override
  String get permCameraNeeded =>
      'Puedes continuar sin acceso a la cámara, pero la detección y la grabación no funcionarán hasta que lo permitas en Ajustes.';

  @override
  String get permSetupIntro =>
      'Corvista necesita estos permisos para funcionar al completo. Toca Permitir todo e iOS los pedirá uno a uno. Puedes cambiarlos en cualquier momento en Ajustes.';

  @override
  String get permCameraLine =>
      'Necesaria para la detección, la grabación dashcam y la vista de aparcamiento. El vídeo se procesa en tu iPhone y nunca se sube.';

  @override
  String get permLocationLine =>
      'Velocidad GPS, mapa, rutas, tiempo y dónde se guardaron los clips. Solo mientras usas la app.';

  @override
  String get permMicLine =>
      'Audio del habitáculo en los clips de incidente y para oír tu frase de cancelación durante una alerta de emergencia.';

  @override
  String get permSpeechTitle => 'Reconocimiento de voz';

  @override
  String get permSpeechLine =>
      'Reconoce tu frase de cancelación durante la cuenta atrás de emergencia, en tu iPhone cuando es posible.';

  @override
  String get permAllowAll => 'Permitir todo';

  @override
  String permAsking(String permission) {
    return 'Solicitando $permission…';
  }

  @override
  String get permSomeDenied =>
      'Algunos permisos están desactivados. Actívalos en Ajustes para usar esas funciones.';

  @override
  String get permNotNow => 'Ahora no';

  @override
  String get tourLabel => 'Recorrido por la pantalla Conducir';

  @override
  String tourProgress(int current, int total) {
    return 'Paso $current de $total';
  }

  @override
  String get tourNext => 'Siguiente';

  @override
  String get tourBack => 'Atrás';

  @override
  String get tourSkip => 'Omitir recorrido';

  @override
  String get tourFinish => 'Empezar a conducir';

  @override
  String get tourWelcomeTitle => 'Tu recorrido rápido';

  @override
  String get tourWelcomeBody =>
      'Un minuto para ver lo esencial de la pantalla Conducir. Mejor con el coche parado.';

  @override
  String get tourHudTitle => 'Tu panel de instrumentos';

  @override
  String get tourHudSpeed => 'La velocidad procede del GPS.';

  @override
  String get tourHudRec =>
      'REC indica cuántos segundos de vídeo hay en el búfer.';

  @override
  String get tourHudAi =>
      'El chip de IA muestra el modelo, cuántos objetos ve y un punto: verde en marcha, ámbar limitado, rojo detenido.';

  @override
  String get tourSaveTitle => 'Guardar incidente';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista mantiene un búfer continuo de los últimos $seconds segundos de vídeo. Se sobrescribe constantemente, así que no se conserva nada salvo que toques Guardar. Los clips guardados permanecen en este iPhone, en Clips.';
  }

  @override
  String get tourRecordTitle => 'Graba todo el trayecto';

  @override
  String get tourRecordBody =>
      'Toca Grabar para filmar de forma continua hasta que lo detengas. Los trayectos largos se guardan en partes de 5 minutos en Clips, y Guardar incidente sigue funcionando mientras grabas.';

  @override
  String get tourViewsTitle => 'Cinco formas de ver la carretera';

  @override
  String get tourViewDetection =>
      'Cámara en vivo con recuadros alrededor de los objetos compatibles.';

  @override
  String get tourViewVirtual =>
      'Una escena 3D simplificada creada a partir de las detecciones.';

  @override
  String get tourViewMap => 'Apple Maps con búsqueda y guiado paso a paso.';

  @override
  String get tourViewParking =>
      'Cámara y una vista de proximidad desde arriba.';

  @override
  String get tourViewPerception => 'Máscaras de carretera y objetos.';

  @override
  String get tourMapTitle => 'Búsqueda y guiado paso a paso';

  @override
  String get tourMapBody =>
      'Abre Mapa, toca la barra de búsqueda y elige un destino. Elige una ruta y toca Iniciar para el guiado paso a paso. Requiere conexión a internet.';

  @override
  String get tourClipsTitle => 'Clips';

  @override
  String get tourClipsBody =>
      'Revisa, renombra, comparte o elimina los incidentes guardados. Los clips permanecen en tu iPhone salvo que los compartas.';

  @override
  String get tourSettingsTitle => 'Ajustes';

  @override
  String get tourSettingsBody =>
      'Ajusta las alertas de voz y su sensibilidad, la calidad de grabación y la duración del búfer, y configura el modo Emergencia: una alerta de impacto experimental con cuenta atrás de cancelación.';

  @override
  String get tourSafetyTitle => 'Antes de conducir';

  @override
  String get tourSafety1 =>
      'Fija tu iPhone con seguridad, sin que tape tu visión.';

  @override
  String get tourSafety2 =>
      'No uses la app mientras conduces. Configúrala con el coche parado.';

  @override
  String get tourSafety3 =>
      'Las detecciones y zonas son estimaciones. Pueden ser erróneas o pasarse por alto.';

  @override
  String get tourSafety4 =>
      'Sigues siendo responsable de conducir con seguridad.';

  @override
  String get helpTakeTour => 'Hacer el recorrido';

  @override
  String get helpTakeTourSub => 'Un minuto guiado por la pantalla Conducir.';

  @override
  String get tripsTitle => 'Trayectos';

  @override
  String get tripsOpen => 'Registro de trayectos';

  @override
  String get tripsEmptyTitle => 'Aún no hay trayectos';

  @override
  String get tripsEmptyBody =>
      'Los trayectos se registran automáticamente mientras conduces con Corvista: distancia, tiempo, velocidad y la ruta que seguiste.';

  @override
  String get tripsDisabledBody =>
      'El registro de trayectos está desactivado, así que los nuevos viajes no se registran. Actívalo para guardar un registro privado de tus rutas en este iPhone.';

  @override
  String get tripsEnable => 'Activar registro de trayectos';

  @override
  String get tripsToday => 'Hoy';

  @override
  String get tripsYesterday => 'Ayer';

  @override
  String tripsRecordingNow(String distance) {
    return 'Grabando un trayecto · $distance';
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
      other: '$count incidentes',
      one: '1 incidente',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alertas',
      one: '1 alerta',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trayectos',
      one: '1 trayecto',
      zero: 'Sin trayectos',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Distancia';

  @override
  String get tripsStatDuration => 'Duración';

  @override
  String get tripsStatMoving => 'Tiempo en movimiento';

  @override
  String get tripsStatAvgSpeed => 'Vel. media';

  @override
  String get tripsStatMaxSpeed => 'Vel. máxima';

  @override
  String get tripsDetections => 'Detecciones';

  @override
  String get tripsNoDetections =>
      'No se registró ningún objeto de la vía en este trayecto.';

  @override
  String get tripsTimeline => 'Cronología';

  @override
  String get tripsEventStart => 'Trayecto iniciado';

  @override
  String get tripsEventEnd => 'Trayecto finalizado';

  @override
  String get tripsEventAlert => 'Alerta de voz';

  @override
  String get tripsEventIncident => 'Clip de incidente guardado';

  @override
  String get tripsEventEmergency => 'Posible accidente detectado';

  @override
  String get tripsEventNavStart => 'Navegación iniciada';

  @override
  String get tripsEventArrive => 'Llegada al destino';

  @override
  String get tripsEventReroute => 'Ruta recalculada';

  @override
  String get tripsEventRecording => 'Grabación guardada';

  @override
  String get tripsOpenClip => 'Abrir clip';

  @override
  String get tripsTrackPreview => 'Track GPS';

  @override
  String get tripsRenameTitle => 'Renombrar trayecto';

  @override
  String get tripsRenameHint => 'Nombre del trayecto';

  @override
  String get tripsFavorite => 'Añadir a favoritos';

  @override
  String get tripsUnfavorite => 'Quitar de favoritos';

  @override
  String get tripsShareGpx => 'Compartir GPX';

  @override
  String get tripsShareFailed => 'No se pudo compartir este trayecto.';

  @override
  String get tripsDelete => 'Eliminar trayecto';

  @override
  String get tripsDeleteConfirmTitle => '¿Eliminar este trayecto?';

  @override
  String get tripsDeleteConfirmBody =>
      'La ruta y las estadísticas se eliminarán de este iPhone. Los clips de incidente de este trayecto se conservan.';

  @override
  String get tripsDeleted => 'Trayecto eliminado';

  @override
  String get tripsNotFound => 'Este trayecto ya no está disponible.';

  @override
  String get tripsPrivacyNote =>
      'Se guarda solo en este iPhone. No se sube nada.';

  @override
  String get settingsSectionTrips => 'Registro de trayectos';

  @override
  String get settingsTripLog => 'Registrar trayectos';

  @override
  String get settingsTripLogSubtitle =>
      'Guarda tu ruta y las estadísticas de conducción solo en este iPhone.';

  @override
  String get settingsTripRetention => 'Conservar trayectos';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días',
      one: '1 día',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 año';

  @override
  String get settingsRetentionForever => 'Siempre';

  @override
  String get settingsTripRetentionFooter =>
      'Los trayectos antiguos se eliminan automáticamente al iniciar Corvista.';

  @override
  String get settingsViewTrips => 'Ver trayectos';

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
    return 'Trayecto de Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Liberar espacio';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Elimina archivos temporales y cachés. Los clips y trayectos guardados se conservan.';

  @override
  String settingsFreedBytes(String size) {
    return 'Liberados $size';
  }

  @override
  String get settingsNothingToFree =>
      'Cachés vaciadas: no hay archivos temporales que eliminar.';

  @override
  String get settingsSectionPrivacyData => 'Privacidad y datos';

  @override
  String get settingsPrivacyDataFooter =>
      'Los clips, trayectos y ajustes se almacenan solo en este iPhone. Solo salen de él cuando decides compartirlos.';

  @override
  String get settingsDeleteAllData => 'Eliminar todos los datos';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Borra los clips, trayectos, contactos y ajustes de este iPhone';

  @override
  String get deleteAllTitle => '¿Eliminar todos los datos?';

  @override
  String get deleteAllMessage =>
      'Esto elimina de forma permanente de este iPhone:\n• Los clips de incidentes y sus miniaturas\n• El registro de trayectos y las rutas GPS\n• Los contactos de emergencia y los eventos de emergencia\n• Los registros de detección y el registro de diagnóstico\n• Los ajustes y los destinos recientes\n• El búfer de grabación temporal y la caché\n\nEsta acción no se puede deshacer. Después, Corvista volverá a empezar desde las pantallas de bienvenida.';

  @override
  String get deleteAllConfirm => 'Eliminar todo';

  @override
  String get deleteAllInProgress => 'Eliminando…';

  @override
  String get deleteAllDone => 'Todos los datos eliminados';

  @override
  String get deleteAllPartial =>
      'No se pudieron eliminar algunos elementos. Inténtalo de nuevo desde Ajustes.';

  @override
  String get diagLogSection => 'Registro de diagnóstico';

  @override
  String get diagLogFooter =>
      'Los errores se registran solo en este iPhone, sin ubicaciones, nombres de contactos ni números de teléfono. No se envía nada a menos que compartas tú mismo el registro.';

  @override
  String get diagLogShare => 'Compartir registro de diagnóstico';

  @override
  String get diagLogEmpty => 'Vacío';

  @override
  String get diagLogClear => 'Borrar registro';

  @override
  String get diagLogClearTitle => '¿Borrar el registro de diagnóstico?';

  @override
  String get diagLogClearBody =>
      'Las entradas de error guardadas se eliminarán de este iPhone.';

  @override
  String get diagLogCleared => 'Registro de diagnóstico borrado';

  @override
  String get diagLogShareFailed =>
      'No se pudo compartir el registro de diagnóstico.';

  @override
  String get privacyControls2 =>
      'Ajustes › Privacidad y datos › Eliminar todos los datos borra todos los clips, trayectos, contactos, registros y ajustes que Corvista ha almacenado en este iPhone.';

  @override
  String get parkingZoneStop => 'Alto';

  @override
  String get parkingZoneVeryClose => 'Muy cerca';

  @override
  String get parkingZoneClose => 'Cerca';

  @override
  String get parkingZoneNothingClose => 'No se ve nada cerca';

  @override
  String get parkingNotDetected =>
      'No se detectan muros, pilares, postes ni bordillos';

  @override
  String get parkingApprox => 'aprox.';

  @override
  String get parkingSideLeft => 'Izquierda';

  @override
  String get parkingSideCenter => 'Centro';

  @override
  String get parkingSideRight => 'Derecha';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Solo vista de la cámara frontal — no es un sistema de 360°';

  @override
  String get parkingMuteBeeps => 'Silenciar pitidos';

  @override
  String get parkingUnmuteBeeps => 'Activar pitidos';

  @override
  String get parkingAbout => 'Sobre la vista de aparcamiento';

  @override
  String get parkingLimitationsDetail =>
      'Solo se vigila la zona situada delante de la cámara. El detector reconoce coches, autobuses y camiones, personas, bicicletas y motocicletas. Los muros, pilares, postes, bordillos, bolardos, barreras y obstáculos bajos NO se detectan, y el capó puede ocultar el suelo justo delante. Las distancias son estimaciones aproximadas a partir de una sola cámara (tamaño y posición del objeto) y pueden ser muy imprecisas. El silencio o «No se ve nada cerca» no significa que el camino esté libre: mira siempre a tu alrededor y usa los retrovisores.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Proximidad por lado: izquierda $left, centro $center, derecha $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Los errores se escriben en un registro privado en este iPhone (sin ubicaciones, nombres de contactos ni números de teléfono). Nunca se envía automáticamente; puedes compartirlo o borrarlo en Ajustes › Diagnóstico.';
}

/// The translations for Spanish Castilian, as used in Latin America and the Caribbean (`es_419`).
class AppLocalizationsEs419 extends AppLocalizationsEs {
  AppLocalizationsEs419() : super('es_419');

  @override
  String get classStopSign => 'Señal de alto';

  @override
  String get viewParking => 'Estacionamiento';

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Estos videos se eliminarán de forma permanente de tu iPhone. Esta acción no se puede deshacer.',
      one: 'El video se eliminará de forma permanente de tu iPhone. Esta acción no se puede deshacer.',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyBody =>
      'Mientras manejas, Corvista mantiene un breve búfer continuo. Toca Guardar incidente para conservar aquí los últimos segundos de grabación.';

  @override
  String get playerMissingTitle => 'Falta el archivo de video';

  @override
  String get playerLoadError => 'No se puede reproducir este video.';

  @override
  String get playerFavorited => 'Agregado a favoritos';

  @override
  String get settingsShowFpsSubtitle =>
      'Cuadros por segundo y tiempo de inferencia en la vista de detección';

  @override
  String get settingsTrackingSubtitle =>
      'Mantiene los objetos estables entre cuadros';

  @override
  String get settingsNoVoices =>
      'No hay ninguna voz instalada para este idioma. Agrega una en Ajustes de iOS › Accesibilidad › Contenido hablado.';

  @override
  String get settingsAlertStopSign => 'Señales de alto';

  @override
  String get settingsParkingBeeps => 'Pitidos de estacionamiento';

  @override
  String get settingsRecordAudioSubtitle =>
      'Incluye el audio de la cabina en los incidentes guardados';

  @override
  String get settingsKeepScreenOn =>
      'Mantener la pantalla encendida al manejar';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Activada · cuenta regresiva de $seconds s';
  }

  @override
  String get hudCustomWeather => 'Clima';

  @override
  String get hudCustomDescNight =>
      'Tenue y con tono rojizo para manejar de noche';

  @override
  String get diagCameraFps => 'Cuadros por segundo de la cámara';

  @override
  String get diagDropped => 'Cuadros perdidos';

  @override
  String get diagTestFootageBody =>
      'Ejecuta detección real en el dispositivo sobre un archivo de video local en lugar de la cámara. Todas las vistas lo indican con GRABACIÓN DE PRUEBA.';

  @override
  String get diagPathLabel => 'Ruta del archivo de video';

  @override
  String get emergencyIntro =>
      'Durante un trayecto, Corvista puede vigilar un posible impacto grave mediante los sensores de movimiento de tu iPhone. Si detecta uno, se inicia una cuenta regresiva. Si no la cancelas, Corvista te ofrece llamar a los servicios de emergencia y enviar un mensaje a tus contactos.';

  @override
  String get emergencyParkedWarning =>
      'Completa esta configuración con el vehículo estacionado. Los ajustes se bloquean mientras el vehículo está en movimiento.';

  @override
  String get emergencyNeedNumber => 'Agrega primero un número de emergencia.';

  @override
  String get emergencyAddContact => 'Agregar contacto';

  @override
  String get emergencyMessageDefault =>
      'Puede que haya sufrido un accidente de tráfico. Este mensaje fue preparado por Corvista e incluye mi última ubicación conocida, si está disponible.';

  @override
  String get emergencyCountdown => 'Duración de la cuenta regresiva';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Di «Estoy bien» o «Cancelar» durante la cuenta regresiva. Usa el reconocimiento de voz en el dispositivo cuando está disponible.';

  @override
  String get emergencyTest => 'Probar cuenta regresiva (sin llamada)';

  @override
  String get emergencyTestBody =>
      'Ejecuta un impacto simulado para que veas la cuenta regresiva. En el modo de prueba nunca se realiza ninguna llamada ni se envía ningún mensaje.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'En vivo: $ms ms por cuadro · $hz detecciones/s';
  }

  @override
  String get modelsFunctionDetection =>
      'Detecta vehículos, personas, bicicletas, motos, autobuses, semáforos y señales de alto';

  @override
  String get modelsFunctionSegmentation =>
      'Agrega máscaras de la calzada y de objetos';

  @override
  String get safetyBeforeTitle => 'Antes de manejar';

  @override
  String get safetyBefore2 =>
      'Termina la configuración, elige una vista y define tu destino con el vehículo estacionado.';

  @override
  String get safetyBefore3 =>
      'Conecta un cargador en trayectos largos y, si es posible, evita la luz solar directa sobre el celular.';

  @override
  String get safetyWhileTitle => 'Al manejar';

  @override
  String get safetyLimits1 =>
      'La cámara de un solo celular solo ve lo que tiene delante. Los objetos fuera de su campo de visión, ocultos o muy cercanos no se detectan.';

  @override
  String get safetyLimits3 =>
      'Solo se reconocen las categorías compatibles: vehículos, autobuses, motos, bicicletas, personas, semáforos y señales de alto. Las líneas de carril de la vista virtual son estilizadas, no carriles detectados.';

  @override
  String get safetyLimits4 =>
      'La proximidad se muestra en zonas aproximadas (Muy cerca, Cerca, Media, Lejos), nunca como distancias medidas. La vista de estacionamiento no sustituye a un sensor de estacionamiento.';

  @override
  String get privacyLocation1 =>
      'La ubicación se usa mientras la app está abierta para tu velocidad, el mapa, las rutas y el clima. Si «Guardar ubicación» está activado, la posición en el momento de guardar se almacena con el clip en tu dispositivo.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit): clima actual y por horas para tu ubicación.';

  @override
  String get termsUse1 =>
      'Corvista es una ayuda para la atención al volante y una dashcam. Sigues siendo plenamente responsable de manejar con seguridad y conforme a la ley en todo momento.';

  @override
  String get termsUse2 =>
      'No interactúes con la app de formas que te distraigan mientras manejas. Fija el dispositivo con firmeza y conforme a la ley.';

  @override
  String get helpQMap => 'El mapa, la búsqueda o el clima no funcionan.';

  @override
  String get helpAMap =>
      'Estas funciones requieren conexión a internet y acceso a la ubicación. Verifica tu conexión y permite la ubicación para Corvista en los Ajustes de iOS.';

  @override
  String get helpASimulator =>
      'Asegúrate de que el acceso a la cámara esté permitido en los Ajustes de iOS y de que ninguna otra app la esté usando. El simulador de iOS no tiene cámara; en su lugar se puede usar un video de prueba local.';

  @override
  String get emergencyMsgNoContacts =>
      'Agrega primero un contacto de emergencia.';

  @override
  String get cameraUnavailableBody =>
      'No hay ninguna cámara disponible en este dispositivo. La detección, la grabación y las vistas de estacionamiento necesitan la cámara trasera.';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista necesita la cámara para la detección, la grabación de dashcam y las vistas de estacionamiento. Activa el acceso a la cámara en Ajustes.';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Clima $temperature, $condition. Toca para ver detalles.';
  }

  @override
  String get weatherTitle => 'Clima';

  @override
  String get weatherRefresh => 'Actualizar el clima';

  @override
  String get weatherUnavailable =>
      'El clima no está disponible en este momento.';

  @override
  String get weatherNoLocation => 'El clima necesita tu ubicación.';

  @override
  String get virtualEmptyHint =>
      'Los vehículos, personas, bicicletas, semáforos y señales de alto aparecerán aquí cuando se detecten.';

  @override
  String get mapWeatherUnavailable => 'Clima no disponible';

  @override
  String get navSearchSubmitHint =>
      'Toca Buscar para ver todos los lugares coincidentes';

  @override
  String get parkingLimitations =>
      'Una sola cámara, no 360°. Los objetos fuera del campo de la cámara no se detectan. No sustituye a los sensores de estacionamiento; las estimaciones pueden ser erróneas y el silencio no significa que la zona esté despejada.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Vista de proximidad desde arriba. $summary';
  }

  @override
  String get perceptionWaiting => 'Esperando el primer cuadro de segmentación…';

  @override
  String get driveSaveNotRunning =>
      'La grabación aún no comenzó: espera a que se inicie la cámara e inténtalo de nuevo.';

  @override
  String get driveSaveStorageFull =>
      'Tu iPhone se quedó sin espacio. Libera espacio o elimina clips antiguos.';

  @override
  String get drivePowerBatteryLow =>
      'Batería baja: conecta tu iPhone a la corriente mientras manejas.';

  @override
  String get onboardingTitle2 => 'Inteligencia en cada cuadro.';

  @override
  String get onboardingBody3 =>
      'Cambia entre detección en vivo, vistas de conducción virtuales, mapas interactivos y visualización de estacionamiento.';

  @override
  String get onboardingSafety4 =>
      'El procesamiento de la cámara se realiza en tu iPhone: el video no se sube.';

  @override
  String get onboardingSafety5 =>
      'Los mapas, la búsqueda, las rutas y el clima necesitan conexión a internet.';

  @override
  String get onboardingSafety7 =>
      'Completa la configuración antes de empezar a manejar.';

  @override
  String get onboardingAcknowledge =>
      'Entiendo que Corvista es una ayuda para la atención y que sigo siendo responsable de manejar con seguridad.';

  @override
  String get permCameraBody =>
      'Necesaria para la detección, la grabación de dashcam y la vista de estacionamiento. El video se procesa en tu iPhone.';

  @override
  String get permLocationBody =>
      'Se usa para la velocidad GPS, el mapa, las rutas, el clima y para etiquetar los clips guardados. Solo mientras usas la app.';

  @override
  String get permStart => 'Comenzar a manejar';
}
