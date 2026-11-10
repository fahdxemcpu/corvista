// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Veja mais em cada trajeto.';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonBack => 'Voltar';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonRetry => 'Tentar novamente';

  @override
  String get commonOpenSettings => 'Abrir Ajustes';

  @override
  String get commonLoading => 'Carregando…';

  @override
  String get commonError => 'Algo deu errado.';

  @override
  String commonErrorDetail(String message) {
    return 'Algo deu errado: $message';
  }

  @override
  String get commonOn => 'Ativado';

  @override
  String get commonOff => 'Desativado';

  @override
  String get commonRename => 'Renomear';

  @override
  String get commonShare => 'Compartilhar';

  @override
  String get commonNotAvailable => 'Indisponível';

  @override
  String get commonTestFootage => 'GRAVAÇÃO DE TESTE';

  @override
  String get zoneVeryClose => 'Muito perto';

  @override
  String get zoneClose => 'Perto';

  @override
  String get zoneMedium => 'Média';

  @override
  String get zoneFar => 'Longe';

  @override
  String get zoneUnknown => 'Desconhecida';

  @override
  String get classPerson => 'Pessoa';

  @override
  String get classBicycle => 'Bicicleta';

  @override
  String get classMotorcycle => 'Moto';

  @override
  String get classCar => 'Veículo';

  @override
  String get classBus => 'Ônibus';

  @override
  String get classTrafficLight => 'Semáforo';

  @override
  String get classStopSign => 'Placa de pare';

  @override
  String get viewDetection => 'Detecção';

  @override
  String get viewVirtual => 'Virtual';

  @override
  String get viewMap => 'Mapa';

  @override
  String get viewParking => 'Estacionamento';

  @override
  String get viewPerception => 'Percepção';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Vermelho';

  @override
  String get lightYellow => 'Amarelo';

  @override
  String get lightGreen => 'Verde';

  @override
  String get lightUnknown => 'Desconhecido';

  @override
  String get clipsTitle => 'Clipes';

  @override
  String get clipsSelect => 'Selecionar';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selecionados',
      one: '1 selecionado',
      zero: 'Selecionar clipes',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Selecionar tudo';

  @override
  String get clipsDeselectAll => 'Desmarcar tudo';

  @override
  String get clipsDeleteSelected => 'Excluir selecionados';

  @override
  String get clipsGridView => 'Visualização em grade';

  @override
  String get clipsListView => 'Visualização em lista';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count clipes?',
      one: 'Excluir este clipe?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Estes vídeos serão removidos permanentemente do seu iPhone. Esta ação não pode ser desfeita.',
      one: 'O vídeo será removido permanentemente do seu iPhone. Esta ação não pode ser desfeita.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clipes excluídos',
      one: 'Clipe excluído',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Nenhum clipe ainda';

  @override
  String get clipsEmptyBody =>
      'Enquanto você dirige, o Corvista mantém um breve buffer contínuo. Toque em Salvar incidente para guardar aqui os últimos segundos de gravação.';

  @override
  String get clipsLoadError => 'Não foi possível carregar seus clipes.';

  @override
  String get clipsStorageTitle => 'Armazenamento';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Clipes $clips · Buffer $buffer · $free livres';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clipes salvos',
      one: '1 clipe salvo',
      zero: 'Nenhum clipe salvo',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'O armazenamento do seu iPhone está baixo. Novos incidentes podem não ser salvos.';

  @override
  String get clipsMissingFile => 'Arquivo ausente';

  @override
  String get clipsEmergencyBadge => 'Impacto';

  @override
  String clipsUntitled(String date) {
    return 'Incidente · $date';
  }

  @override
  String get clipsAudio => 'Áudio gravado';

  @override
  String get clipsFavorite => 'Favorito';

  @override
  String get clipsUnfavorite => 'Remover dos favoritos';

  @override
  String get clipsLocation => 'Localização salva';

  @override
  String clipsOpenClip(String title) {
    return 'Abrir clipe $title';
  }

  @override
  String get playerNotFoundTitle => 'Clipe não encontrado';

  @override
  String get playerNotFoundBody => 'Este clipe pode ter sido excluído.';

  @override
  String get playerMissingTitle => 'Arquivo de vídeo ausente';

  @override
  String get playerMissingBody =>
      'A gravação deste clipe não está mais no seu iPhone. Você pode remover a entrada da sua galeria.';

  @override
  String get playerRemoveEntry => 'Remover entrada';

  @override
  String get playerLoadError => 'Não foi possível reproduzir este vídeo.';

  @override
  String get playerPlay => 'Reproduzir';

  @override
  String get playerPause => 'Pausar';

  @override
  String get playerReplay => 'Repetir';

  @override
  String get playerRenameTitle => 'Renomear clipe';

  @override
  String get playerRenameHint => 'Nome do clipe';

  @override
  String get playerRenamed => 'Clipe renomeado';

  @override
  String get playerFavorited => 'Adicionado aos favoritos';

  @override
  String get playerUnfavorited => 'Removido dos favoritos';

  @override
  String get playerShareFailed => 'Não foi possível compartilhar este clipe.';

  @override
  String get playerDetails => 'Detalhes';

  @override
  String get playerDate => 'Gravado';

  @override
  String get playerDuration => 'Duração';

  @override
  String get playerResolution => 'Resolução';

  @override
  String get playerSize => 'Tamanho do arquivo';

  @override
  String get playerAudio => 'Áudio';

  @override
  String get playerAudioYes => 'Gravado';

  @override
  String get playerAudioNo => 'Não gravado';

  @override
  String get playerReason => 'Salvo por';

  @override
  String get playerReasonManual => 'Botão Salvar incidente';

  @override
  String get playerReasonEmergency => 'Possível detecção de impacto';

  @override
  String get playerReasonRecovered => 'Recuperado após interrupção';

  @override
  String get playerSpeed => 'Velocidade GPS ao salvar';

  @override
  String get playerLocation => 'Localização';

  @override
  String get playerOpenInMaps => 'Abrir em Mapas';

  @override
  String get playerBack => 'Voltar';

  @override
  String get playerMore => 'Mais ações';

  @override
  String get clipsFilterLabel => 'Mostrar';

  @override
  String get clipsFilterAll => 'Todos';

  @override
  String get clipsFilterRecordings => 'Gravações';

  @override
  String get clipsFilterIncidents => 'Incidentes';

  @override
  String get clipsFilterEmergency => 'Emergências';

  @override
  String get clipsFilterFavorites => 'Favoritos';

  @override
  String get clipsSort => 'Ordenar';

  @override
  String get clipsSortNewest => 'Mais recentes primeiro';

  @override
  String get clipsSortOldest => 'Mais antigos primeiro';

  @override
  String get clipsSortLongest => 'Mais longos primeiro';

  @override
  String get clipsSortLargest => 'Maiores primeiro';

  @override
  String get clipsToday => 'Hoje';

  @override
  String get clipsYesterday => 'Ontem';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clipes',
      one: '1 clipe',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Ainda não há clipes nesta categoria.';

  @override
  String get clipsFavoritesEmpty =>
      'Marque um clipe com uma estrela para mantê-lo aqui, à mão.';

  @override
  String get clipsKindRecording => 'Gravação';

  @override
  String get clipsKindIncident => 'Incidente';

  @override
  String get clipsKindEmergency => 'Emergência';

  @override
  String get clipsKindTest => 'Teste';

  @override
  String clipsTripChip(String time) {
    return 'Viagem · $time';
  }

  @override
  String get clipsOpenTrip => 'Abrir a viagem em que este clipe foi gravado';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used usados · $free livres';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Os clipes ocupam $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gravações',
      one: '1 gravação',
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
      other: '$count emergências',
      one: '1 emergência',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Liberar espaço';

  @override
  String get clipsStorageLowGentle =>
      'Menos de 2 GB livres. Para continuar gravando sem problemas, libere espaço ou remova clipes de que você não precisa mais.';

  @override
  String get clipsSaveToPhotos => 'Salvar em Fotos';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clipes',
      one: '1 clipe',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count clipes ($size)?',
      one: 'Excluir este clipe ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Salvando $done de $total em Fotos…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clipes salvos em Fotos',
      one: 'Salvo em Fotos',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved salvos em Fotos · $failed não puderam ser salvos';
  }

  @override
  String get clipsPhotosDenied =>
      'O Corvista não tem permissão para adicionar vídeos a Fotos. Você pode permitir isso em Ajustes.';

  @override
  String get clipsPhotosFailed => 'Não foi possível salvar em Fotos.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clipes adicionados aos favoritos',
      one: 'Adicionado aos favoritos',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clipes removidos dos favoritos',
      one: 'Removido dos favoritos',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (cortado)';
  }

  @override
  String get playerTrim => 'Cortar';

  @override
  String get playerInfo => 'Info';

  @override
  String get playerKind => 'Tipo';

  @override
  String get playerReasonRecording => 'Botão Gravar';

  @override
  String get trimTitle => 'Cortar clipe';

  @override
  String get trimHint =>
      'Arraste as alças para escolher a parte a manter. O clipe original não é alterado.';

  @override
  String get trimStartHandle => 'Início do corte';

  @override
  String get trimEndHandle => 'Fim do corte';

  @override
  String trimSelection(String duration) {
    return 'Seleção: $duration';
  }

  @override
  String get trimSave => 'Salvar como novo clipe';

  @override
  String get trimSaving => 'Salvando o clipe cortado…';

  @override
  String get trimSaved => 'Clipe cortado salvo';

  @override
  String get trimOpenNew => 'Abrir';

  @override
  String get trimFailed => 'Não foi possível cortar este clipe.';

  @override
  String get trimStorageFull =>
      'Não há espaço livre suficiente para salvar o clipe cortado.';

  @override
  String get trimPreview => 'Reproduzir seleção';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsSectionCamera => 'Câmera';

  @override
  String get settingsSectionAi => 'IA';

  @override
  String get settingsSectionAlerts => 'Alertas';

  @override
  String get settingsSectionAlertCategories => 'Categorias de alertas';

  @override
  String get settingsSectionRecording => 'Gravação';

  @override
  String get settingsSectionDriving => 'Direção';

  @override
  String get settingsSectionPower => 'Energia';

  @override
  String get settingsSectionEmergency => 'Emergência';

  @override
  String get settingsSectionAppearance => 'Aparência';

  @override
  String get settingsSectionLanguage => 'Idioma';

  @override
  String get settingsSectionInformation => 'Informações';

  @override
  String get settingsCameraLens => 'Lente da câmera';

  @override
  String get settingsLensWide => 'Grande-angular';

  @override
  String get settingsLensUltraWide => 'Ultra grande-angular';

  @override
  String get settingsLensTelephoto => 'Teleobjetiva';

  @override
  String get settingsLensUnavailable => 'Indisponível neste iPhone';

  @override
  String get settingsStabilization => 'Estabilização';

  @override
  String get settingsStabAuto => 'Automática';

  @override
  String get settingsStabOff => 'Desativada';

  @override
  String get settingsStabStandard => 'Padrão';

  @override
  String get settingsStabCinematic => 'Cinematográfica';

  @override
  String get settingsOverlayOpacity => 'Opacidade da sobreposição';

  @override
  String get settingsShowFps => 'Mostrar estatísticas de desempenho';

  @override
  String get settingsShowFpsSubtitle =>
      'Taxa de quadros e tempo de inferência na visualização de detecção';

  @override
  String get settingsCameraFooter =>
      'As mudanças de lente e estabilização valem na próxima vez que a câmera iniciar.';

  @override
  String get settingsAiModel => 'Modelo de IA';

  @override
  String get settingsConfidence => 'Confiança de detecção';

  @override
  String get settingsTracking => 'Rastreamento de objetos';

  @override
  String get settingsTrackingSubtitle =>
      'Mantém os objetos estáveis entre os quadros';

  @override
  String get settingsShowLabels => 'Mostrar rótulos';

  @override
  String get settingsShowConfidence => 'Mostrar confiança';

  @override
  String get settingsSegmentationOpacity => 'Opacidade da máscara de percepção';

  @override
  String get settingsAiFooter =>
      'Uma confiança menor mostra mais objetos, mas também mais detecções falsas. As detecções podem ser imprecisas.';

  @override
  String get settingsVoiceAlerts => 'Alertas de voz';

  @override
  String get settingsVoiceLanguage => 'Idioma da voz';

  @override
  String get settingsVoiceLanguageAuto => 'Igual ao idioma do app';

  @override
  String get settingsVoice => 'Voz';

  @override
  String get settingsVoiceDefault => 'Padrão do sistema';

  @override
  String get settingsVoiceQualityEnhanced => 'Aprimorada';

  @override
  String get settingsVoiceQualityPremium => 'Alta qualidade';

  @override
  String get settingsNoVoices =>
      'Nenhuma voz está instalada para este idioma. Adicione uma em Ajustes do iOS › Acessibilidade › Conteúdo Falado.';

  @override
  String get settingsAlertPedestrian => 'Pedestres';

  @override
  String get settingsAlertCyclist => 'Ciclistas';

  @override
  String get settingsAlertMotorcycle => 'Motos';

  @override
  String get settingsAlertBus => 'Ônibus';

  @override
  String get settingsAlertVehicleClose => 'Veículo muito perto à frente';

  @override
  String get settingsAlertTrafficLight => 'Mudanças de semáforo';

  @override
  String get settingsAlertTrafficMoving => 'Trânsito à frente em movimento';

  @override
  String get settingsAlertStopSign => 'Placas de pare';

  @override
  String get settingsSensitivity => 'Sensibilidade';

  @override
  String get settingsSensitivityLow => 'Baixa';

  @override
  String get settingsSensitivityMedium => 'Média';

  @override
  String get settingsSensitivityHigh => 'Alta';

  @override
  String get settingsCooldown => 'Intervalo de repetição';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Volume da voz';

  @override
  String get settingsQuietMode => 'Modo silencioso';

  @override
  String get settingsQuietModeSubtitle =>
      'Apenas os alertas mais importantes são falados';

  @override
  String get settingsTestVoice => 'Testar voz';

  @override
  String get settingsTestVoiceDone => 'Reproduzindo um alerta de exemplo…';

  @override
  String get settingsParkingBeeps => 'Bipes de estacionamento';

  @override
  String get settingsBeepVolume => 'Volume dos bipes';

  @override
  String get settingsAlertsFooter =>
      'Os alertas são apenas um auxílio. Observe sempre a via: o silêncio não significa que o caminho esteja livre.';

  @override
  String get settingsRecordingProfile => 'Qualidade de gravação';

  @override
  String get settingsProfileStandard => 'Padrão · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Buffer de incidente';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds segundos';
  }

  @override
  String get settingsManualMaxLength => 'Duração máxima da gravação manual';

  @override
  String get settingsManualMaxUnlimited => 'Ilimitada';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Gravar áudio';

  @override
  String get settingsRecordAudioSubtitle =>
      'Inclui o áudio da cabine nos incidentes salvos';

  @override
  String get settingsMicDenied =>
      'O acesso ao microfone está desativado. Permita-o em Ajustes para gravar áudio.';

  @override
  String get settingsWatermark => 'Marca d\'água do Corvista';

  @override
  String get settingsTimestamp => 'Carimbo de data e hora';

  @override
  String get settingsSaveLocation => 'Salvar localização com os clipes';

  @override
  String get settingsStorage => 'Armazenamento e clipes';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clipes',
      one: '1 clipe',
      zero: 'Nenhum clipe',
    );
    return '$_temp0 · $used usados · $free livres';
  }

  @override
  String get settingsRecordingFooter =>
      'O buffer contínuo fica no seu iPhone e é sobrescrito continuamente. Nada é gravado em segundo plano.';

  @override
  String get settingsDefaultView => 'Visualização padrão';

  @override
  String get settingsUnits => 'Unidades';

  @override
  String get settingsShowCompass => 'Mostrar bússola';

  @override
  String get settingsHudStyle => 'Estilo do HUD';

  @override
  String get settingsHudCustomize => 'Personalizar HUD';

  @override
  String get settingsDrivingSide => 'Lado de condução';

  @override
  String get settingsDrivingSideAuto => 'Automático';

  @override
  String get settingsDrivingSideRight => 'Direita';

  @override
  String get settingsDrivingSideLeft => 'Esquerda';

  @override
  String get settingsVirtualStyle => 'Estilo da visualização virtual';

  @override
  String get settingsVirtualMinimal => 'Mínimo';

  @override
  String get settingsVirtualPerspective => 'Perspectiva';

  @override
  String get settingsVirtualHighContrast => 'Alto contraste';

  @override
  String get settingsKeepScreenOn => 'Manter a tela ligada ao dirigir';

  @override
  String get settingsLiveActivity => 'Atividade ao Vivo';

  @override
  String get settingsLiveActivityDesc =>
      'Mostrar as instruções na Tela Bloqueada e na Dynamic Island';

  @override
  String get driveRecordingPausedBackground =>
      'Gravação pausada enquanto o Corvista estava em segundo plano';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Pausado';

  @override
  String get liveActivityDashcamOff => 'Câmera off';

  @override
  String get liveActivityEnded => 'Navegação encerrada';

  @override
  String get liveActivityEta => 'Chegada';

  @override
  String get settingsAutoRecenter => 'Recentralizar mapa automaticamente';

  @override
  String get settingsHudStyleClassic => 'Clássico';

  @override
  String get settingsHudStyleGrid => 'Grade';

  @override
  String get settingsHudStyleMinimal => 'Mínimo';

  @override
  String get settingsHudStylePerformance => 'Desempenho';

  @override
  String get settingsHudStyleNavigation => 'Navegação';

  @override
  String get settingsHudStyleNight => 'Noite';

  @override
  String get settingsHudStyleHighContrast => 'Alto contraste';

  @override
  String get settingsPowerMode => 'Modo de energia';

  @override
  String get settingsPowerBalanced => 'Equilibrado';

  @override
  String get settingsPowerPerformance => 'Desempenho';

  @override
  String get settingsPowerSaver => 'Economia';

  @override
  String get settingsPowerFooter =>
      'O Corvista reduz automaticamente a taxa da IA e os efeitos visuais quando o iPhone esquenta ou a bateria está baixa.';

  @override
  String get settingsThermal => 'Estado térmico';

  @override
  String get settingsThermalNominal => 'Normal';

  @override
  String get settingsThermalFair => 'Morno';

  @override
  String get settingsThermalSerious => 'Quente';

  @override
  String get settingsThermalCritical => 'Crítico';

  @override
  String get settingsBattery => 'Bateria';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Carregando';
  }

  @override
  String get settingsLowPowerMode =>
      'O Modo de Baixo Consumo está ativado — a IA funciona em taxa reduzida.';

  @override
  String get settingsAiRate => 'Taxa atual da IA';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Detecção de impacto';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Ativada · contagem de $seconds s';
  }

  @override
  String get settingsEmergencyFooter =>
      'Experimental. Não substitui os serviços de emergência.';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeDark => 'Escuro';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsReduceMotion => 'Reduzir movimento';

  @override
  String get settingsReduceMotionSubtitle =>
      'Minimiza as animações em todo o app';

  @override
  String get settingsAppLanguage => 'Idioma do app';

  @override
  String get settingsPrivacyPolicy => 'Política de Privacidade';

  @override
  String get settingsTerms => 'Termos de Uso';

  @override
  String get settingsHelp => 'Ajuda';

  @override
  String get settingsSupport => 'Falar com o suporte';

  @override
  String get settingsLicenses => 'Licenças de código aberto';

  @override
  String get settingsSupportUnavailable =>
      'Não foi possível abrir o Mail. Escreva para support@corvista.app.';

  @override
  String get settingsSafety => 'Informações de segurança';

  @override
  String get settingsDiagnostics => 'Diagnóstico';

  @override
  String get settingsVersion => 'Versão';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Personalizar HUD';

  @override
  String get hudCustomPreview => 'Pré-visualização · valores de exemplo';

  @override
  String get hudCustomStyle => 'Estilo';

  @override
  String get hudCustomElements => 'Elementos';

  @override
  String get hudCustomSpeed => 'Velocidade';

  @override
  String get hudCustomHeading => 'Direção e bússola';

  @override
  String get hudCustomClock => 'Relógio';

  @override
  String get hudCustomBattery => 'Bateria e temperatura';

  @override
  String get hudCustomDetections => 'Status da IA e detecções';

  @override
  String get hudCustomWeather => 'Clima';

  @override
  String get hudCustomAppearance => 'Tamanho e opacidade';

  @override
  String get hudCustomSize => 'Tamanho';

  @override
  String get hudCustomOpacity => 'Opacidade';

  @override
  String get hudCustomFooter =>
      'Avisos como superaquecimento são sempre exibidos, mesmo com elementos ocultos.';

  @override
  String get hudCustomDescClassic => 'Painel de instrumentos equilibrado';

  @override
  String get hudCustomDescGrid => 'Grade em perspectiva sobre a via';

  @override
  String get hudCustomDescMinimal => 'Só a velocidade, nada mais';

  @override
  String get hudCustomDescPerformance =>
      'Arco de velocidade com leituras em tempo real';

  @override
  String get hudCustomDescNavigation => 'Próxima manobra em primeiro lugar';

  @override
  String get hudCustomDescNight => 'Suave e avermelhado para dirigir à noite';

  @override
  String get hudCustomDescHighContrast => 'Máxima legibilidade sob sol forte';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageSystem => 'Padrão do sistema';

  @override
  String get languageSystemSubtitle => 'Seguir o idioma do seu iPhone';

  @override
  String get languageFooter =>
      'Mais idiomas estão a caminho. O idioma dos alertas de voz pode ser definido separadamente em Alertas.';

  @override
  String get diagTitle => 'Diagnóstico';

  @override
  String get diagPerformance => 'Desempenho';

  @override
  String get diagInference => 'Tempo de inferência';

  @override
  String get diagDetectHz => 'Taxa de detecção';

  @override
  String get diagCameraFps => 'Taxa de quadros da câmera';

  @override
  String get diagMemory => 'Memória';

  @override
  String get diagDropped => 'Quadros perdidos';

  @override
  String get diagSegmentation => 'Tempo de segmentação';

  @override
  String get diagCamera => 'Câmera';

  @override
  String get diagStatus => 'Status';

  @override
  String get diagSource => 'Origem';

  @override
  String get diagSourceCamera => 'Câmera ao vivo';

  @override
  String get diagSourceFile => 'Arquivo de gravação de teste';

  @override
  String get diagResolution => 'Tamanho do buffer';

  @override
  String get diagLens => 'Lente';

  @override
  String get diagError => 'Último erro';

  @override
  String get diagModel => 'Modelo de IA';

  @override
  String get diagModelLoad => 'Tempo de carregamento do modelo';

  @override
  String get diagPower => 'Energia';

  @override
  String get diagSegHz => 'Taxa de segmentação';

  @override
  String get diagReduced => 'Efeitos reduzidos';

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
  String get diagCamIdle => 'Inativa';

  @override
  String get diagCamStarting => 'Iniciando';

  @override
  String get diagCamRunning => 'Em execução';

  @override
  String get diagCamInterrupted => 'Interrompida';

  @override
  String get diagCamStopped => 'Parada';

  @override
  String get diagCamUnavailable => 'Indisponível';

  @override
  String get diagCamPermissionDenied => 'Permissão negada';

  @override
  String get diagCamError => 'Erro';

  @override
  String get diagTestFootage => 'Gravação de teste';

  @override
  String get diagTestFootageBody =>
      'Executa detecção real no dispositivo em um arquivo de vídeo local, em vez da câmera. Todas as visualizações a identificam como GRAVAÇÃO DE TESTE.';

  @override
  String get diagPathLabel => 'Caminho do arquivo de vídeo';

  @override
  String get diagPathHint => '/caminho/para/trajeto.mp4';

  @override
  String get diagUseDocuments => 'Usar Documents/test_drive.mp4';

  @override
  String get diagRun => 'Executar gravação de teste';

  @override
  String get diagRunStarted =>
      'Gravação de teste iniciada. Abra a visualização de direção para vê-la.';

  @override
  String get diagBackToCamera => 'Voltar à câmera ao vivo';

  @override
  String get diagDebugOnly =>
      'A gravação de teste só está disponível em versões de desenvolvimento.';

  @override
  String get diagFileMissing => 'Não existe arquivo nesse caminho.';

  @override
  String get emergencySetupTitle => 'Detecção de impacto';

  @override
  String get emergencyExperimental => 'Experimental';

  @override
  String get emergencyIntro =>
      'Durante um trajeto, o Corvista pode monitorar um possível impacto grave usando os sensores de movimento do seu iPhone. Se um for detectado, uma contagem regressiva começa. Se você não cancelá-la, o Corvista oferece ligar para os serviços de emergência e enviar uma mensagem aos seus contatos.';

  @override
  String get emergencyDisclaimer1 =>
      'Não substitui os serviços de emergência nem a detecção de acidentes do próprio veículo.';

  @override
  String get emergencyDisclaimer2 =>
      'O iOS sempre pede sua confirmação antes de uma ligação ser feita ou de uma mensagem ser enviada.';

  @override
  String get emergencyDisclaimer3 =>
      'Impactos podem passar despercebidos, e frenagens bruscas ou buracos podem ser confundidos com um impacto.';

  @override
  String get emergencyParkedWarning =>
      'Conclua esta configuração com o veículo estacionado. Os ajustes ficam bloqueados com o veículo em movimento.';

  @override
  String get emergencyEnable => 'Ativar detecção de impacto';

  @override
  String get emergencyEnableSubtitle =>
      'Ativa apenas durante uma sessão de direção';

  @override
  String get emergencyNeedNumber =>
      'Adicione primeiro um número de emergência.';

  @override
  String get emergencyContacts => 'Contatos de emergência';

  @override
  String get emergencyAddContact => 'Adicionar contato';

  @override
  String get emergencyNoContacts =>
      'Nenhum contato ainda. Os contatos só recebem uma mensagem depois que você a confirma.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Remover $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Essa pessoa não será oferecida como destinatária após um impacto.';

  @override
  String get emergencyRemove => 'Remover';

  @override
  String get emergencyContactsError => 'Não foi possível carregar os contatos.';

  @override
  String get emergencyNumber => 'Número de emergência';

  @override
  String get emergencyNumberHint => 'ex.: 192 ou 911';

  @override
  String get emergencyMessage => 'Modelo de mensagem';

  @override
  String get emergencyMessageDefault =>
      'Posso ter sofrido um acidente de veículo. Esta mensagem foi preparada pelo Corvista e inclui minha última localização conhecida, se disponível.';

  @override
  String get emergencyMessageHint =>
      'Deixe em branco para usar a mensagem padrão.';

  @override
  String get emergencyCountdown => 'Duração da contagem regressiva';

  @override
  String get emergencyVoiceCancel => 'Cancelar por voz';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Diga “Estou bem” ou “Cancelar” durante a contagem regressiva. Usa reconhecimento de fala no dispositivo, quando disponível.';

  @override
  String get emergencyVoicePermDenied =>
      'O acesso ao microfone e ao reconhecimento de fala é necessário para o cancelamento por voz.';

  @override
  String get emergencyAutoSave => 'Salvar automaticamente o clipe do incidente';

  @override
  String get emergencyTest => 'Testar contagem regressiva (sem ligação)';

  @override
  String get emergencyTestBody =>
      'Executa um impacto simulado para você ver a contagem regressiva. Nenhuma ligação ou mensagem é feita no modo de teste.';

  @override
  String get emergencyNotSet => 'Não definido';

  @override
  String get emergencyAlertHeadline => 'Possível impacto grave detectado.';

  @override
  String get emergencyAlertSubtitle => 'Você está bem?';

  @override
  String get emergencyAlertCancel => 'Estou bem — Cancelar';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds segundos restantes',
      one: '1 segundo restante',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Ouvindo — diga “Estou bem” para cancelar';

  @override
  String emergencyAlertHeard(String text) {
    return 'Ouvido: “$text”';
  }

  @override
  String get emergencyAlertEscalated => 'Sem resposta. Escolha o que fazer:';

  @override
  String get emergencyAlertCall => 'Ligar para a emergência';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Liga para $number. O iOS pede sua confirmação.';
  }

  @override
  String get emergencyAlertMessage => 'Enviar mensagem aos contatos';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Abre uma mensagem preparada. Você decide se quer enviá-la.';

  @override
  String get emergencyAlertTestMode =>
      'Modo de teste — nenhuma ligação será feita';

  @override
  String get emergencyAlertTestBadge => 'TESTE';

  @override
  String get emergencyAlertClose => 'Estou bem — Fechar';

  @override
  String get emergencyMsgSent => 'Mensagem enviada.';

  @override
  String get emergencyMsgCancelled => 'Mensagem não enviada.';

  @override
  String get emergencyMsgFailed => 'Não foi possível enviar a mensagem.';

  @override
  String get emergencyMsgUnavailable =>
      'O envio de mensagens não está disponível neste dispositivo.';

  @override
  String emergencyCallFailed(String number) {
    return 'Não foi possível iniciar a ligação. Disque você mesmo para $number.';
  }

  @override
  String get modelsTitle => 'Modelos de IA';

  @override
  String get modelsIntro =>
      'Todos os modelos já vêm no app e são executados inteiramente no seu iPhone. A imagem da sua câmera nunca sai do dispositivo.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Ao vivo: $ms ms por quadro · $hz detecções/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Carregado em $ms ms';
  }

  @override
  String get modelsEfficientName => 'Eficiente';

  @override
  String get modelsEfficientDesc =>
      'Detector rápido e compacto, ajustado para longos trajetos com pouco calor e baixo uso de bateria.';

  @override
  String get modelsEnhancedName => 'Aprimorado';

  @override
  String get modelsEnhancedDesc =>
      'Detector maior que encontra objetos menores e mais distantes, com maior consumo de energia.';

  @override
  String get modelsSegmentationName => 'Segmentação';

  @override
  String get modelsSegmentationDesc =>
      'Combina detecção rápida com máscaras da superfície da via e de objetos para a visualização Percepção.';

  @override
  String get modelsNoneName => 'IA pausada';

  @override
  String get modelsNoneDesc =>
      'A câmera e a gravação continuam sem detecção de objetos. Menor consumo de energia.';

  @override
  String get modelsGenericDesc =>
      'Modelo de detecção de objetos no dispositivo.';

  @override
  String get modelsFunctionDetection =>
      'Detecta veículos, pessoas, bicicletas, motos, ônibus, semáforos e placas de pare';

  @override
  String get modelsFunctionSegmentation =>
      'Adiciona máscaras da superfície da via e de objetos';

  @override
  String get modelsFunctionNone => 'Sem detecção; apenas gravação de dashcam';

  @override
  String get modelsSize => 'Tamanho';

  @override
  String get modelsInput => 'Entrada';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Funciona com';

  @override
  String get modelsStatusInstalled => 'Instalado (incluído)';

  @override
  String get modelsStatusNotInstalled => 'Não instalado';

  @override
  String get modelsSelected => 'Selecionado';

  @override
  String get modelsUse => 'Usar este modelo';

  @override
  String get modelsSwitching => 'Carregando modelo…';

  @override
  String modelsSwitched(String name) {
    return '$name agora está ativo';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Medido neste dispositivo: $ms ms em média';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Não medido neste dispositivo';

  @override
  String get modelsBenchmarkRun => 'Executar teste de desempenho';

  @override
  String get modelsBenchmarkRunning => 'Medindo desempenho…';

  @override
  String get modelsBenchmarkSelectHint =>
      'Selecione este modelo para testar o desempenho.';

  @override
  String get modelsBenchmarkDone => 'Teste concluído';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Falha no teste: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Última atualização: $date';
  }

  @override
  String get safetyTitle => 'Informações de segurança';

  @override
  String get safetyIntro =>
      'O Corvista é um auxílio de atenção ao dirigir. Ele não controla seu veículo e não substitui sua própria atenção, seu discernimento nem os sistemas de segurança do veículo.';

  @override
  String get safetyBeforeTitle => 'Antes de dirigir';

  @override
  String get safetyBefore1 =>
      'Fixe seu iPhone com firmeza em uma posição legal que não bloqueie sua visão, os airbags nem os controles.';

  @override
  String get safetyBefore2 =>
      'Conclua a configuração, escolha uma visualização e defina seu destino com o veículo parado.';

  @override
  String get safetyBefore3 =>
      'Conecte um carregador em trajetos longos e, se possível, mantenha o telefone longe da luz solar direta.';

  @override
  String get safetyWhileTitle => 'Ao dirigir';

  @override
  String get safetyWhile1 =>
      'Mantenha os olhos na estrada. Use os controles grandes da tela apenas quando for seguro e legal.';

  @override
  String get safetyWhile2 =>
      'Os alertas são auxílios, não avisos em que você possa confiar. O silêncio nunca significa que a via esteja livre.';

  @override
  String get safetyWhile3 =>
      'Siga as leis de trânsito, os sinais e a sinalização — e não o app — quando houver divergência.';

  @override
  String get safetyLimitsTitle => 'Limitações';

  @override
  String get safetyLimits1 =>
      'A câmera de um único telefone enxerga apenas o que está à sua frente. Objetos fora do campo de visão, ocultos ou muito próximos não são detectados.';

  @override
  String get safetyLimits2 =>
      'As detecções podem falhar, atrasar ou estar erradas, principalmente à noite, com chuva, neblina, ofuscamento ou com o para-brisa sujo.';

  @override
  String get safetyLimits3 =>
      'Apenas as categorias compatíveis são reconhecidas: veículos, ônibus, motos, bicicletas, pessoas, semáforos e placas de pare. As indicações de faixa na visualização virtual são estilizadas, não faixas detectadas.';

  @override
  String get safetyLimits4 =>
      'A proximidade é mostrada em zonas aproximadas (Muito perto, Perto, Média, Longe), nunca como distâncias medidas. A visualização de estacionamento não substitui um sensor de estacionamento.';

  @override
  String get safetyHeatTitle => 'Calor e bateria';

  @override
  String get safetyHeat1 =>
      'O uso contínuo da câmera e da IA esquenta o iPhone. O Corvista reduz a taxa de análise quando o dispositivo esquenta e exibe um aviso; se o iOS superaquecer, a câmera pode parar.';

  @override
  String get safetyEmergencyTitle => 'Recurso de emergência';

  @override
  String get safetyEmergency1 =>
      'A detecção de possível impacto é experimental. Ela pode não detectar colisões reais e ser acionada por outros eventos.';

  @override
  String get safetyEmergency2 =>
      'Ela nunca contata ninguém em silêncio: o iOS sempre pede que você confirme uma ligação ou mensagem. Não substitui ligar você mesmo para os serviços de emergência.';

  @override
  String get privacyTitle => 'Privacidade';

  @override
  String get privacyIntro =>
      'O Corvista foi projetado para manter seus dados de direção no seu iPhone. Não há conta do Corvista, e o Corvista não opera servidores próprios.';

  @override
  String get privacyCameraTitle => 'Câmera e IA';

  @override
  String get privacyCamera1 =>
      'A detecção, o rastreamento e a segmentação de objetos são executados inteiramente no seu iPhone. Os quadros da câmera nunca são enviados.';

  @override
  String get privacyCamera2 =>
      'A câmera só funciona enquanto o Corvista está aberto na tela. Ela pausa quando o app vai para segundo plano — não há gravação oculta em segundo plano.';

  @override
  String get privacyRecordingsTitle => 'Gravações';

  @override
  String get privacyRecordings1 =>
      'O buffer contínuo é temporário e sobrescrito continuamente. As imagens só são guardadas quando você toca em Salvar incidente ou, se ativar, após um possível impacto.';

  @override
  String get privacyRecordings2 =>
      'Os clipes salvos ficam no armazenamento privado do Corvista no seu iPhone. Eles só saem do dispositivo quando você escolhe Compartilhar. Excluir o app os exclui.';

  @override
  String get privacyRecordings3 =>
      'O áudio só é gravado se você ativá-lo e conceder acesso ao microfone.';

  @override
  String get privacyLocationTitle => 'Localização';

  @override
  String get privacyLocation1 =>
      'A localização é usada com o app aberto para sua velocidade, o mapa, as rotas e o clima. Se “Salvar localização” estiver ativado, a posição no momento do salvamento é armazenada com o clipe no seu dispositivo.';

  @override
  String get privacyNetworkTitle => 'Serviços de rede';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — exibição do mapa, busca de lugares e rotas. O texto da sua busca e sua localização aproximada são enviados à Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — clima atual e por hora para a sua localização.';

  @override
  String get privacyNetwork4 =>
      'O Corvista não inclui publicidade nem análises ou rastreamento de terceiros.';

  @override
  String get privacyEmergencyTitle => 'Contatos de emergência';

  @override
  String get privacyEmergency1 =>
      'Os contatos que você escolher são armazenados no Chaveiro do iOS neste dispositivo. O cancelamento por voz usa reconhecimento de fala no dispositivo, quando disponível. Ligações e mensagens só são enviadas depois que você as confirma no iOS.';

  @override
  String get privacyControlsTitle => 'Seus controles';

  @override
  String get privacyControls1 =>
      'Você pode excluir clipes a qualquer momento em Clipes e alterar ou revogar o acesso à câmera, ao microfone, à localização e ao reconhecimento de fala nos Ajustes do iOS.';

  @override
  String get termsTitle => 'Termos de Uso';

  @override
  String get termsIntro =>
      'Ao usar o Corvista, você concorda com estes termos. O Contrato de Licença de Usuário Final de Aplicativo Licenciado padrão da Apple também se aplica.';

  @override
  String get termsUseTitle => 'Uso do Corvista';

  @override
  String get termsUse1 =>
      'O Corvista é um auxílio de atenção ao dirigir e uma dashcam. Você continua totalmente responsável por dirigir com segurança e de acordo com a lei o tempo todo.';

  @override
  String get termsUse2 =>
      'Não interaja com o app de maneiras que o distraiam ao dirigir. Fixe o dispositivo com firmeza e de forma legal.';

  @override
  String get termsAccuracyTitle => 'Sem garantia de precisão';

  @override
  String get termsAccuracy1 =>
      'Detecções, zonas, alertas, marcadores do mapa, rotas e clima podem estar incompletos, atrasados ou errados. O Corvista não controla seu veículo.';

  @override
  String get termsAccuracy2 =>
      'O recurso de emergência é experimental e pode não detectar um impacto ou ser acionado por engano.';

  @override
  String get termsRecordingTitle => 'Leis de gravação';

  @override
  String get termsRecording1 =>
      'As leis sobre dashcams, gravação de áudio e filmagem de pessoas variam conforme o país e a região. Você é responsável por cumpri-las, inclusive ao compartilhar clipes.';

  @override
  String get termsLiabilityTitle => 'Responsabilidade';

  @override
  String get termsLiability1 =>
      'O app é fornecido “como está”. Na medida permitida por lei, o desenvolvedor não se responsabiliza por acidentes, perdas, multas ou danos decorrentes do uso do app ou da confiança em seus resultados.';

  @override
  String get termsChangesTitle => 'Alterações';

  @override
  String get termsChanges1 =>
      'Estes termos podem ser atualizados com novas versões do app. O uso continuado após uma atualização significa que você aceita os termos revisados.';

  @override
  String get helpTitle => 'Ajuda';

  @override
  String get helpIntro =>
      'Respostas para perguntas comuns. Para orientações de segurança, consulte Informações de segurança.';

  @override
  String get helpQSave => 'Como guardo as imagens de um incidente?';

  @override
  String get helpASaveBuffer =>
      'Toque no botão grande Salvar incidente na tela de condução. O Corvista salva em Clipes os últimos 20 ou 30 segundos do buffer contínuo (você escolhe em Ajustes › Gravação).';

  @override
  String get helpQWhere => 'Onde ficam armazenados os meus clipes?';

  @override
  String get helpAWhere =>
      'No armazenamento privado do Corvista no seu iPhone. Eles nunca são enviados. Use Compartilhar no player para enviar ou exportar um clipe.';

  @override
  String get helpQZones => 'Qual a precisão das zonas de proximidade?';

  @override
  String get helpAZones =>
      'As zonas são estimativas aproximadas feitas a partir de uma única câmera, com base em tamanhos típicos de objetos. Trate-as como indicações aproximadas, nunca como distâncias.';

  @override
  String get helpQSlow => 'Por que a detecção fica mais lenta?';

  @override
  String get helpASlow =>
      'Quando o iPhone esquenta, a bateria está baixa ou o Modo de Baixo Consumo está ativado, o Corvista reduz a taxa de análise para proteger o dispositivo. Você pode mudar o modo de energia em Ajustes.';

  @override
  String get helpQMap => 'O mapa, a busca ou o clima não está funcionando.';

  @override
  String get helpAMap =>
      'Esses recursos exigem conexão com a internet e acesso à localização. Verifique sua conexão e permita a localização para o Corvista nos Ajustes do iOS.';

  @override
  String get helpQSimulator => 'A câmera aparece como indisponível.';

  @override
  String get helpASimulator =>
      'Verifique se o acesso à câmera está permitido nos Ajustes do iOS e se nenhum outro app está usando a câmera. O Simulador do iOS não tem câmera; um vídeo de teste local pode ser usado no lugar.';

  @override
  String get emergencyMsgNoContacts =>
      'Adicione primeiro um contato de emergência.';

  @override
  String get cameraStarting => 'Iniciando câmera…';

  @override
  String get cameraInterrupted => 'Câmera pausada';

  @override
  String get cameraInterruptedBody =>
      'O iOS pausou a câmera, por exemplo durante uma ligação ou enquanto outro app a usa. Ela retoma automaticamente.';

  @override
  String get cameraUnavailable => 'Câmera indisponível';

  @override
  String get cameraUnavailableBody =>
      'Nenhuma câmera está disponível neste dispositivo. A detecção, a gravação e as visualizações de estacionamento precisam da câmera traseira.';

  @override
  String get cameraRunTestFootage => 'Executar gravação de teste';

  @override
  String get cameraPermissionDenied => 'O acesso à câmera está desativado';

  @override
  String get cameraPermissionDeniedBody =>
      'O Corvista precisa da câmera para a detecção, a gravação de dashcam e as visualizações de estacionamento. Ative o acesso à câmera em Ajustes.';

  @override
  String get cameraError => 'Erro da câmera';

  @override
  String get cameraStopped => 'Câmera parada';

  @override
  String get cameraStart => 'Iniciar câmera';

  @override
  String get cameraFocusHint => 'Toque para focar';

  @override
  String get cameraPreviewLabel =>
      'Visualização da câmera ao vivo com os objetos detectados';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Câmera $fps fps · IA $hz Hz · $ms ms · perdidos $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Velocidade $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Sem velocidade GPS';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Direção $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC ${seconds}s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Buffer de gravação da dashcam, $seconds de $target segundos armazenados';
  }

  @override
  String get hudRecIdle => 'REC desativado';

  @override
  String get hudRecSaving => 'Salvando…';

  @override
  String get hudRecError => 'Erro de REC';

  @override
  String get hudAiPaused => 'IA pausada';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objetos',
      one: '1 objeto',
      zero: 'Nenhum objeto',
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
      zero: 'nenhum objeto detectado',
    );
    return 'Modelo de IA $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Quente — IA reduzida';

  @override
  String get hudThermalCritical => 'Muito quente — IA pausada';

  @override
  String hudBatteryLow(String percent) {
    return 'Bateria $percent';
  }

  @override
  String get hudLowPower => 'Modo de Baixo Consumo';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Clima $temperature, $condition. Toque para ver detalhes.';
  }

  @override
  String get hudNoGuidance =>
      'Busque um destino na visualização Mapa para ver aqui a orientação passo a passo.';

  @override
  String get navArrived => 'Você chegou';

  @override
  String get navRerouting => 'Recalculando rota…';

  @override
  String get navSearchHint => 'Buscar destino';

  @override
  String get navSearchFieldHint => 'Endereço, local ou estabelecimento';

  @override
  String get navNoResults => 'Nenhum local correspondente';

  @override
  String get navSearching => 'Buscando…';

  @override
  String get navSearchStartTyping =>
      'Digite um endereço ou nome de local. Os resultados vêm do Apple Maps e exigem conexão com a internet.';

  @override
  String get navErrorUnavailable =>
      'Busca e rotas indisponíveis — verifique sua conexão com a internet.';

  @override
  String get navErrorNoLocation =>
      'Aguardando sua localização para planejar uma rota.';

  @override
  String get navErrorPermission =>
      'O acesso à localização está desativado, então as rotas não podem partir da sua posição.';

  @override
  String navErrorGeneric(String code) {
    return 'Não foi possível carregar as rotas ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Rotas para $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Chegada $time';
  }

  @override
  String get navStart => 'Iniciar';

  @override
  String get navEnd => 'Encerrar';

  @override
  String get navEndLabel => 'Encerrar navegação';

  @override
  String navRemaining(String distance, String duration) {
    return 'Faltam $distance · $duration';
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
    return 'Rota $index: $name';
  }

  @override
  String get weatherTitle => 'Clima';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Sensação de $temperature';
  }

  @override
  String get weatherPrecipitation => 'Precipitação';

  @override
  String get weatherWind => 'Vento';

  @override
  String get weatherVisibility => 'Visibilidade';

  @override
  String get weatherHumidity => 'Umidade';

  @override
  String get weatherHourly => 'Próximas horas';

  @override
  String weatherAsOf(String time) {
    return 'Atualizado $time';
  }

  @override
  String get weatherRefresh => 'Atualizar clima';

  @override
  String get weatherUnavailable => 'O clima está indisponível no momento.';

  @override
  String get weatherNoLocation => 'O clima precisa da sua localização.';

  @override
  String get weatherLegal => 'Fontes de dados e avisos legais';

  @override
  String weatherProvidedBy(String service) {
    return 'Dados de clima: $service';
  }

  @override
  String get weatherNow => 'Agora';

  @override
  String get virtualEmpty => 'Nenhum objeto compatível detectado';

  @override
  String get virtualEmptyCameraOff =>
      'A visualização virtual precisa da câmera ao vivo.';

  @override
  String get virtualLaneDisclaimer =>
      'As linhas de faixa são ilustrativas, não detectadas.';

  @override
  String virtualNearest(String zone) {
    return 'Mais próximo: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Cena virtual da via: $summary';
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
  String get virtualStatusLive => 'ativa';

  @override
  String get virtualStatusPaused => 'pausada';

  @override
  String get virtualStatusCameraOff => 'Câmera desligada';

  @override
  String get virtualStatusTestFootage => 'Gravação de teste';

  @override
  String get virtualEmptyHint =>
      'Veículos, pessoas, bicicletas, semáforos e placas de pare aparecem aqui quando detectados.';

  @override
  String get mapRecenter => 'Recentralizar';

  @override
  String get mapZoomIn => 'Aumentar zoom';

  @override
  String get mapZoomOut => 'Diminuir zoom';

  @override
  String get mapUnsupported => 'O mapa interativo está disponível no iPhone.';

  @override
  String get mapObjectsApprox =>
      'Os marcadores de objetos são posições aproximadas.';

  @override
  String get mapWeatherUnavailable => 'Clima indisponível';

  @override
  String get navErrorNoRoute => 'Nenhuma rota encontrada para este destino.';

  @override
  String get navDismiss => 'Dispensar';

  @override
  String get navGo => 'Ir';

  @override
  String get navFastest => 'Mais rápida';

  @override
  String get navThen => 'Depois';

  @override
  String get navRecents => 'Recentes';

  @override
  String get navClearRecents => 'Limpar';

  @override
  String get navSearchSubmitHint =>
      'Toque em Buscar para ver todos os locais correspondentes';

  @override
  String get navPlaces => 'Locais';

  @override
  String get navEtaLabel => 'chegada';

  @override
  String get navTimeLeftLabel => 'restante';

  @override
  String get navOverview => 'Visão geral';

  @override
  String get navMute => 'Silenciar voz';

  @override
  String get navUnmute => 'Ativar voz';

  @override
  String get navEndConfirm => 'Encerrar a navegação?';

  @override
  String navEndConfirmBody(String place) {
    return 'A orientação para $place será interrompida.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Você chegou a $place';
  }

  @override
  String get navDone => 'Concluir';

  @override
  String get navWeakGps => 'Sinal de GPS fraco';

  @override
  String get navLocationOff =>
      'A localização está desativada. Ative-a para planejar rotas e navegar.';

  @override
  String get navVoiceGuidance => 'Orientação por voz';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Em $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, depois $second';
  }

  @override
  String get navSpeakRerouting => 'Recalculando rota';

  @override
  String get navSpeakArrived => 'Você chegou';

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
      other: '$value quilômetros',
      one: '1 quilômetro',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pés',
      one: '1 pé',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jardas',
      one: '1 jarda',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Continue por $distance';
  }

  @override
  String get navErrorNoDirections =>
      'As direções não estão disponíveis para este trajeto nesta região. Tente outro destino.';

  @override
  String navContinueFor(String distance) {
    return 'Continue por $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value milhas',
      one: '1 milha',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Mais próximo: $object · $zone';
  }

  @override
  String get parkingNothing => 'Nada detectado na visão';

  @override
  String get parkingBeeps => 'Bipes de proximidade';

  @override
  String get parkingVolume => 'Volume dos bipes';

  @override
  String get parkingLimitations =>
      'Uma única câmera, sem visão de 360°. Objetos fora do campo da câmera não são detectados. Não substitui sensores de estacionamento; as estimativas podem estar erradas e o silêncio não significa que a área esteja livre.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Visão de proximidade de cima. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Original';

  @override
  String get perceptionModeBoxes => 'Caixas';

  @override
  String get perceptionModeMasks => 'Máscaras de objetos';

  @override
  String get perceptionModeRoad => 'Superfície da via';

  @override
  String get perceptionModeCombined => 'Combinado';

  @override
  String get perceptionOpacity => 'Opacidade da máscara';

  @override
  String get perceptionDisclaimer =>
      'A máscara da superfície da via é uma camada visual aproximada. Ela não mostra o espaço trafegável nem as faixas.';

  @override
  String get perceptionNeedsModel =>
      'Selecione o modelo Segmentação para ver as máscaras.';

  @override
  String get perceptionChooseModel => 'Escolher modelo';

  @override
  String get perceptionWaiting =>
      'Aguardando o primeiro quadro de segmentação…';

  @override
  String get perceptionShortCamera => 'Câmera';

  @override
  String get perceptionShortBoxes => 'Caixas';

  @override
  String get perceptionShortObjects => 'Objetos';

  @override
  String get perceptionShortRoad => 'Via';

  @override
  String get perceptionShortAll => 'Tudo';

  @override
  String get perceptionModesLabel => 'Camadas de percepção';

  @override
  String get perceptionStatusWarmingUp => 'Preparando…';

  @override
  String get perceptionStatusLoadingModel => 'Carregando modelo…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps fps';
  }

  @override
  String get perceptionStatusPaused => 'Máscaras pausadas';

  @override
  String get perceptionLegend => 'Legenda das máscaras';

  @override
  String get perceptionUnavailable => 'Máscaras indisponíveis';

  @override
  String get driveSave => 'Salvar';

  @override
  String get driveSaveIncident => 'Salvar incidente';

  @override
  String driveSaveHint(int seconds) {
    return 'Salva os últimos $seconds segundos de gravação da dashcam';
  }

  @override
  String get driveSaving => 'Salvando incidente…';

  @override
  String hudRecManualLabel(String time) {
    return 'Gravando, $time';
  }

  @override
  String get driveRecord => 'Gravar';

  @override
  String get driveRecordStartA11y => 'Iniciar gravação';

  @override
  String driveRecordStopA11y(String time) {
    return 'Parar gravação, $time gravados';
  }

  @override
  String get driveRecordHint =>
      'Grava continuamente até você parar, incluindo os 5 segundos anteriores';

  @override
  String get driveRecordFailed => 'Não foi possível iniciar a gravação';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gravação salva · $count partes',
      one: 'Gravação salva',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Gravação interrompida: armazenamento quase cheio',
      'max_duration': 'Gravação interrompida: duração máxima atingida',
      'camera_stopped': 'Gravação interrompida junto com a câmera',
      'background': 'Gravação interrompida: o app foi para segundo plano',
      'thermal': 'Gravação interrompida: o celular está quente demais',
      'other': 'Gravação interrompida',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Incidente salvo · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Ver';

  @override
  String get driveSaveFailed => 'Não foi possível salvar o incidente.';

  @override
  String get driveSaveNotRunning =>
      'A gravação ainda não começou — aguarde a câmera iniciar e tente novamente.';

  @override
  String get driveSaveTestFootage =>
      'A gravação de teste não é salva. O salvamento de incidentes funciona com a câmera ao vivo.';

  @override
  String get driveSaveStorageFull =>
      'O armazenamento do seu iPhone está cheio. Libere espaço ou exclua clipes antigos.';

  @override
  String get driveSaveIoError =>
      'Não foi possível gravar o clipe no armazenamento.';

  @override
  String get driveClips => 'Clipes';

  @override
  String get driveSettings => 'Ajustes';

  @override
  String get driveViewSwitcher => 'Visualizações de direção';

  @override
  String get driveLocationDenied =>
      'A localização está desativada — velocidade, mapas e rotas indisponíveis.';

  @override
  String get driveCameraDenied =>
      'O acesso à câmera está desativado — detecção e gravação indisponíveis.';

  @override
  String get driveRecorderFallback =>
      'Gravando sem áudio: o acesso ao microfone está desativado.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'As configurações de gravação foram ajustadas: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'Seu iPhone está quente. A IA funciona mais devagar para esfriar — mantenha-o longe do sol direto e perto de uma saída de ar.';

  @override
  String get drivePowerThermalCritical =>
      'Seu iPhone está muito quente. A detecção por IA fica pausada até ele esfriar; a gravação continua, se possível.';

  @override
  String get drivePowerLowPower =>
      'O Modo de Baixo Consumo está ativado — a IA funciona em taxa reduzida.';

  @override
  String get drivePowerBatteryLow =>
      'Bateria baixa — conecte o iPhone à energia enquanto dirige.';

  @override
  String get onboardingTitle1 => 'Veja mais em cada trajeto.';

  @override
  String get onboardingBody1 =>
      'Transforme seu iPhone em uma dashcam inteligente e em um companheiro de atenção ao dirigir.';

  @override
  String get onboardingTitle2 => 'Inteligência em cada quadro.';

  @override
  String get onboardingBody2 =>
      'Reconheça veículos, pessoas, bicicletas e sinais de trânsito compatíveis diretamente no seu iPhone.';

  @override
  String get onboardingTitle3 => 'Uma estrada. Várias perspectivas.';

  @override
  String get onboardingBody3 =>
      'Alterne entre detecção ao vivo, visualizações de direção virtuais, mapas interativos e visualização de estacionamento.';

  @override
  String get onboardingTitle4 => 'Guarde os momentos que importam.';

  @override
  String get onboardingBody4 =>
      'Salve gravações recentes da dashcam, revise incidentes e compartilhe gravações.';

  @override
  String get onboardingTitle5 => 'Segurança e privacidade';

  @override
  String get onboardingSafety1 =>
      'O Corvista é um auxílio de atenção ao dirigir. Mantenha os olhos na estrada.';

  @override
  String get onboardingSafety2 =>
      'Ele não controla seu veículo nem substitui seu discernimento.';

  @override
  String get onboardingSafety3 =>
      'Detecções e estimativas podem ser imprecisas ou não ocorrer.';

  @override
  String get onboardingSafety4 =>
      'O processamento da câmera acontece no seu iPhone — o vídeo não é enviado.';

  @override
  String get onboardingSafety5 =>
      'Mapas, busca, rotas e clima exigem conexão com a internet.';

  @override
  String get onboardingSafety6 =>
      'Fixe seu iPhone com firmeza para que ele não bloqueie sua visão.';

  @override
  String get onboardingSafety7 =>
      'Conclua a configuração antes de começar a dirigir.';

  @override
  String get onboardingAcknowledge =>
      'Entendo que o Corvista é um auxílio de atenção e que continuo responsável por dirigir com segurança.';

  @override
  String get onboardingReadSafety =>
      'Ler as informações de segurança completas';

  @override
  String get onboardingNext => 'Avançar';

  @override
  String get onboardingSkip => 'Pular';

  @override
  String get onboardingAgree => 'Continuar';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Página $current de $total';
  }

  @override
  String get permTitle => 'Permissões';

  @override
  String get permIntro =>
      'O Corvista pede apenas o que cada recurso precisa. Você pode alterar isso a qualquer momento em Ajustes.';

  @override
  String get permCameraTitle => 'Câmera';

  @override
  String get permCameraBody =>
      'Necessária para a detecção, a gravação de dashcam e a visualização de estacionamento. O vídeo é processado no seu iPhone.';

  @override
  String get permLocationTitle => 'Localização';

  @override
  String get permLocationBody =>
      'Usada para a velocidade GPS, o mapa, as rotas, o clima e a marcação dos clipes salvos. Somente enquanto você usa o app.';

  @override
  String get permMicTitle => 'Microfone';

  @override
  String get permSpeechNote =>
      'O reconhecimento de fala só é solicitado se você ativar o cancelamento por voz nos alertas de emergência.';

  @override
  String get permRequired => 'Obrigatório';

  @override
  String get permOptional => 'Opcional';

  @override
  String get permAllow => 'Permitir';

  @override
  String get permGranted => 'Permitido';

  @override
  String get permDenied => 'Negado';

  @override
  String get permLimited => 'Limitado';

  @override
  String get permRestricted => 'Restrito';

  @override
  String get permStart => 'Começar a dirigir';

  @override
  String get permCameraNeeded =>
      'Você pode continuar sem acesso à câmera, mas a detecção e a gravação não funcionarão até que você o permita em Ajustes.';

  @override
  String get permSetupIntro =>
      'O Corvista precisa destas permissões para funcionar por completo. Toque em Permitir tudo e o iOS vai pedir cada uma em sequência. Você pode alterá-las a qualquer momento em Ajustes.';

  @override
  String get permCameraLine =>
      'Necessária para a detecção, a gravação dashcam e a vista de estacionamento. O vídeo é processado no seu iPhone e nunca é enviado.';

  @override
  String get permLocationLine =>
      'Velocidade por GPS, mapa, rotas, clima e onde os clipes foram salvos. Somente enquanto você usa o app.';

  @override
  String get permMicLine =>
      'Áudio da cabine nos clipes de incidente e para ouvir sua frase de cancelamento durante um alerta de emergência.';

  @override
  String get permSpeechTitle => 'Reconhecimento de fala';

  @override
  String get permSpeechLine =>
      'Reconhece sua frase de cancelamento durante a contagem regressiva de emergência, no seu iPhone quando compatível.';

  @override
  String get permAllowAll => 'Permitir tudo';

  @override
  String permAsking(String permission) {
    return 'Solicitando $permission…';
  }

  @override
  String get permSomeDenied =>
      'Algumas permissões estão desativadas. Ative-as em Ajustes para usar esses recursos.';

  @override
  String get permNotNow => 'Agora não';

  @override
  String get tourLabel => 'Tour pela tela Dirigir';

  @override
  String tourProgress(int current, int total) {
    return 'Etapa $current de $total';
  }

  @override
  String get tourNext => 'Avançar';

  @override
  String get tourBack => 'Voltar';

  @override
  String get tourSkip => 'Pular tour';

  @override
  String get tourFinish => 'Começar a dirigir';

  @override
  String get tourWelcomeTitle => 'Seu tour rápido';

  @override
  String get tourWelcomeBody =>
      'Um minuto para conhecer o essencial da tela Dirigir. O ideal é fazer com o carro parado.';

  @override
  String get tourHudTitle => 'Sua faixa de instrumentos';

  @override
  String get tourHudSpeed => 'A velocidade vem do GPS.';

  @override
  String get tourHudRec =>
      'REC mostra quantos segundos de vídeo estão no buffer.';

  @override
  String get tourHudAi =>
      'O chip de IA mostra o modelo, quantos objetos ele vê e um ponto: verde em execução, âmbar limitado, vermelho parado.';

  @override
  String get tourSaveTitle => 'Salvar incidente';

  @override
  String tourSaveBody(int seconds) {
    return 'O Corvista mantém um buffer contínuo dos últimos $seconds segundos de vídeo. Ele é constantemente sobrescrito, então nada é guardado a menos que você toque em Salvar. Os clipes salvos ficam neste iPhone, em Clipes.';
  }

  @override
  String get tourRecordTitle => 'Grave todo o trajeto';

  @override
  String get tourRecordBody =>
      'Toque em Gravar para filmar continuamente até você parar. Trajetos longos são salvos em partes de 5 minutos em Clipes, e Salvar incidente continua funcionando enquanto você grava.';

  @override
  String get tourViewsTitle => 'Cinco formas de ver a estrada';

  @override
  String get tourViewDetection =>
      'Câmera ao vivo com caixas ao redor dos objetos compatíveis.';

  @override
  String get tourViewVirtual =>
      'Uma cena 3D simplificada criada a partir das detecções.';

  @override
  String get tourViewMap => 'Apple Maps com busca e orientação passo a passo.';

  @override
  String get tourViewParking => 'Câmera e uma vista de proximidade de cima.';

  @override
  String get tourViewPerception => 'Máscaras de estrada e de objetos.';

  @override
  String get tourMapTitle => 'Busca e navegação passo a passo';

  @override
  String get tourMapBody =>
      'Abra Mapa, toque na barra de busca e escolha um destino. Escolha uma rota e toque em Iniciar para a navegação passo a passo. Requer conexão com a internet.';

  @override
  String get tourClipsTitle => 'Clipes';

  @override
  String get tourClipsBody =>
      'Reveja, renomeie, compartilhe ou exclua os incidentes salvos. Os clipes ficam no seu iPhone, a menos que você os compartilhe.';

  @override
  String get tourSettingsTitle => 'Ajustes';

  @override
  String get tourSettingsBody =>
      'Ajuste os alertas de voz e a sensibilidade, a qualidade de gravação e a duração do buffer, e configure o modo Emergência: um alerta de impacto experimental com contagem regressiva de cancelamento.';

  @override
  String get tourSafetyTitle => 'Antes de dirigir';

  @override
  String get tourSafety1 =>
      'Fixe o iPhone com segurança, sem bloquear sua visão.';

  @override
  String get tourSafety2 =>
      'Não use o app enquanto dirige. Configure tudo com o carro parado.';

  @override
  String get tourSafety3 =>
      'Detecções e zonas são estimativas. Podem estar erradas ou passar despercebidas.';

  @override
  String get tourSafety4 =>
      'Você continua responsável por dirigir com segurança.';

  @override
  String get helpTakeTour => 'Fazer o tour';

  @override
  String get helpTakeTourSub => 'Um minuto guiado pela tela Dirigir.';

  @override
  String get tripsTitle => 'Viagens';

  @override
  String get tripsOpen => 'Registro de viagens';

  @override
  String get tripsEmptyTitle => 'Nenhuma viagem ainda';

  @override
  String get tripsEmptyBody =>
      'As viagens são registradas automaticamente enquanto você dirige com o Corvista: distância, tempo, velocidade e a rota percorrida.';

  @override
  String get tripsDisabledBody =>
      'O registro de viagens está desativado, então novas viagens não são gravadas. Ative para manter um registro privado das suas rotas neste iPhone.';

  @override
  String get tripsEnable => 'Ativar registro de viagens';

  @override
  String get tripsToday => 'Hoje';

  @override
  String get tripsYesterday => 'Ontem';

  @override
  String tripsRecordingNow(String distance) {
    return 'Gravando uma viagem · $distance';
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
      other: '$count viagens',
      one: '1 viagem',
      zero: 'Nenhuma viagem',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Distância';

  @override
  String get tripsStatDuration => 'Duração';

  @override
  String get tripsStatMoving => 'Tempo em movimento';

  @override
  String get tripsStatAvgSpeed => 'Vel. média';

  @override
  String get tripsStatMaxSpeed => 'Vel. máxima';

  @override
  String get tripsDetections => 'Detecções';

  @override
  String get tripsNoDetections =>
      'Nenhum objeto da via foi registrado nesta viagem.';

  @override
  String get tripsTimeline => 'Linha do tempo';

  @override
  String get tripsEventStart => 'Viagem iniciada';

  @override
  String get tripsEventEnd => 'Viagem encerrada';

  @override
  String get tripsEventAlert => 'Alerta de voz';

  @override
  String get tripsEventIncident => 'Clipe de incidente salvo';

  @override
  String get tripsEventEmergency => 'Possível acidente detectado';

  @override
  String get tripsEventNavStart => 'Navegação iniciada';

  @override
  String get tripsEventArrive => 'Chegada ao destino';

  @override
  String get tripsEventReroute => 'Rota recalculada';

  @override
  String get tripsEventRecording => 'Gravação salva';

  @override
  String get tripsOpenClip => 'Abrir clipe';

  @override
  String get tripsTrackPreview => 'Trilha de GPS';

  @override
  String get tripsRenameTitle => 'Renomear viagem';

  @override
  String get tripsRenameHint => 'Nome da viagem';

  @override
  String get tripsFavorite => 'Adicionar aos favoritos';

  @override
  String get tripsUnfavorite => 'Remover dos favoritos';

  @override
  String get tripsShareGpx => 'Compartilhar GPX';

  @override
  String get tripsShareFailed => 'Não foi possível compartilhar esta viagem.';

  @override
  String get tripsDelete => 'Excluir viagem';

  @override
  String get tripsDeleteConfirmTitle => 'Excluir esta viagem?';

  @override
  String get tripsDeleteConfirmBody =>
      'A rota e as estatísticas serão removidas deste iPhone. Os clipes de incidente desta viagem são mantidos.';

  @override
  String get tripsDeleted => 'Viagem excluída';

  @override
  String get tripsNotFound => 'Esta viagem não está mais disponível.';

  @override
  String get tripsPrivacyNote =>
      'Armazenado somente neste iPhone. Nada é enviado.';

  @override
  String get settingsSectionTrips => 'Registro de viagens';

  @override
  String get settingsTripLog => 'Registrar viagens';

  @override
  String get settingsTripLogSubtitle =>
      'Mantém sua rota e as estatísticas de condução somente neste iPhone.';

  @override
  String get settingsTripRetention => 'Manter viagens por';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '1 dia',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 ano';

  @override
  String get settingsRetentionForever => 'Para sempre';

  @override
  String get settingsTripRetentionFooter =>
      'As viagens mais antigas são excluídas automaticamente quando o Corvista inicia.';

  @override
  String get settingsViewTrips => 'Ver viagens';

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
    return 'Viagem Corvista $date';
  }

  @override
  String get settingsFreeUpSpace => 'Liberar espaço';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Remove arquivos temporários e caches. Os clipes e viagens salvos são mantidos.';

  @override
  String settingsFreedBytes(String size) {
    return '$size liberados';
  }

  @override
  String get settingsNothingToFree =>
      'Caches limpos: não há arquivos temporários para remover.';

  @override
  String get settingsSectionPrivacyData => 'Privacidade e dados';

  @override
  String get settingsPrivacyDataFooter =>
      'Clipes, viagens e ajustes ficam armazenados somente neste iPhone. Eles só saem dele quando você escolhe compartilhá-los.';

  @override
  String get settingsDeleteAllData => 'Excluir todos os dados';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Apaga clipes, viagens, contatos e ajustes deste iPhone';

  @override
  String get deleteAllTitle => 'Excluir todos os dados?';

  @override
  String get deleteAllMessage =>
      'Isto remove permanentemente deste iPhone:\n• Clipes de incidentes e miniaturas\n• Histórico de viagens e trajetos GPS\n• Contatos de emergência e eventos de emergência\n• Registros de detecção e o registro de diagnóstico\n• Ajustes e destinos recentes\n• Buffer de gravação temporário e cache\n\nEsta ação não pode ser desfeita. Depois, o Corvista recomeçará pelas telas de boas-vindas.';

  @override
  String get deleteAllConfirm => 'Excluir tudo';

  @override
  String get deleteAllInProgress => 'Excluindo…';

  @override
  String get deleteAllDone => 'Todos os dados foram excluídos';

  @override
  String get deleteAllPartial =>
      'Alguns itens não puderam ser excluídos. Tente novamente em Ajustes.';

  @override
  String get diagLogSection => 'Registro de diagnóstico';

  @override
  String get diagLogFooter =>
      'Os erros são registrados somente neste iPhone, sem localizações, nomes de contatos ou números de telefone. Nada é enviado, a menos que você mesmo compartilhe o registro.';

  @override
  String get diagLogShare => 'Compartilhar registro de diagnóstico';

  @override
  String get diagLogEmpty => 'Vazio';

  @override
  String get diagLogClear => 'Limpar registro';

  @override
  String get diagLogClearTitle => 'Limpar o registro de diagnóstico?';

  @override
  String get diagLogClearBody =>
      'As entradas de erro salvas serão excluídas deste iPhone.';

  @override
  String get diagLogCleared => 'Registro de diagnóstico limpo';

  @override
  String get diagLogShareFailed =>
      'Não foi possível compartilhar o registro de diagnóstico.';

  @override
  String get privacyControls2 =>
      'Ajustes › Privacidade e dados › Excluir todos os dados apaga todos os clipes, viagens, contatos, registros e ajustes que o Corvista armazenou neste iPhone.';

  @override
  String get parkingZoneStop => 'Pare';

  @override
  String get parkingZoneVeryClose => 'Muito perto';

  @override
  String get parkingZoneClose => 'Perto';

  @override
  String get parkingZoneNothingClose => 'Nada perto à vista';

  @override
  String get parkingNotDetected =>
      'Paredes, pilares, postes e meios-fios não são detectados';

  @override
  String get parkingApprox => 'aprox.';

  @override
  String get parkingSideLeft => 'Esquerda';

  @override
  String get parkingSideCenter => 'Centro';

  @override
  String get parkingSideRight => 'Direita';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly =>
      'Apenas a visão da câmera frontal — não é um sistema 360°';

  @override
  String get parkingMuteBeeps => 'Silenciar bipes';

  @override
  String get parkingUnmuteBeeps => 'Ativar bipes';

  @override
  String get parkingAbout => 'Sobre a visão de estacionamento';

  @override
  String get parkingLimitationsDetail =>
      'Apenas a área à frente da câmera é monitorada. O detector reconhece carros, ônibus e caminhões, pessoas, bicicletas e motocicletas. Paredes, pilares, postes, meios-fios, balizadores, barreiras e obstáculos baixos NÃO são detectados, e o capô pode esconder o chão logo à frente. As distâncias são estimativas aproximadas feitas com uma única câmera (tamanho e posição do objeto) e podem estar muito erradas. Silêncio ou “Nada perto à vista” não significa que o caminho está livre: olhe sempre ao redor e use os retrovisores.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Proximidade por lado: esquerda $left, centro $center, direita $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Os erros são gravados em um registro privado neste iPhone (sem localizações, nomes de contatos ou números de telefone). Ele nunca é enviado automaticamente; você pode compartilhá-lo ou limpá-lo em Ajustes › Diagnóstico.';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonOpenSettings => 'Abrir Definições';

  @override
  String get commonLoading => 'A carregar…';

  @override
  String get commonError => 'Ocorreu um erro.';

  @override
  String commonErrorDetail(String message) {
    return 'Ocorreu um erro: $message';
  }

  @override
  String get commonShare => 'Partilhar';

  @override
  String get classMotorcycle => 'Mota';

  @override
  String get classBus => 'Autocarro';

  @override
  String get classStopSign => 'Sinal de stop';

  @override
  String get viewDetection => 'Deteção';

  @override
  String get viewPerception => 'Perceção';

  @override
  String get clipsDeleteSelected => 'Eliminar selecionados';

  @override
  String get clipsGridView => 'Vista em grelha';

  @override
  String get clipsListView => 'Vista em lista';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminar $count clipes?',
      one: 'Eliminar este clipe?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clipes eliminados',
      one: 'Clipe eliminado',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyBody =>
      'Enquanto conduz, o Corvista mantém um breve buffer contínuo. Toque em Guardar incidente para guardar aqui os últimos segundos de gravação.';

  @override
  String get clipsLoadError => 'Não foi possível carregar os seus clipes.';

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clipes guardados',
      one: '1 clipe guardado',
      zero: 'Nenhum clipe guardado',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'O armazenamento do seu iPhone está quase esgotado. Os novos incidentes podem não ser guardados.';

  @override
  String get clipsMissingFile => 'Ficheiro em falta';

  @override
  String get clipsLocation => 'Localização guardada';

  @override
  String get playerNotFoundBody => 'Este clipe pode ter sido eliminado.';

  @override
  String get playerMissingTitle => 'Ficheiro de vídeo em falta';

  @override
  String get playerMissingBody =>
      'A gravação deste clipe já não está no seu iPhone. Pode remover a entrada da sua galeria.';

  @override
  String get playerShareFailed => 'Não foi possível partilhar este clipe.';

  @override
  String get playerSize => 'Tamanho do ficheiro';

  @override
  String get playerReason => 'Guardado por';

  @override
  String get playerReasonManual => 'Botão Guardar incidente';

  @override
  String get playerReasonEmergency => 'Possível deteção de impacto';

  @override
  String get playerSpeed => 'Velocidade GPS ao guardar';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get settingsSectionCamera => 'Câmara';

  @override
  String get settingsSectionDriving => 'Condução';

  @override
  String get settingsCameraLens => 'Lente da câmara';

  @override
  String get settingsStabStandard => 'Standard';

  @override
  String get settingsShowFpsSubtitle =>
      'Taxa de fotogramas e tempo de inferência na vista de deteção';

  @override
  String get settingsCameraFooter =>
      'As alterações de lente e estabilização aplicam-se da próxima vez que a câmara iniciar.';

  @override
  String get settingsConfidence => 'Confiança de deteção';

  @override
  String get settingsTracking => 'Seguimento de objetos';

  @override
  String get settingsTrackingSubtitle =>
      'Mantém os objetos estáveis entre fotogramas';

  @override
  String get settingsShowLabels => 'Mostrar etiquetas';

  @override
  String get settingsSegmentationOpacity => 'Opacidade da máscara de perceção';

  @override
  String get settingsAiFooter =>
      'Uma confiança menor mostra mais objetos, mas também mais deteções falsas. As deteções podem ser imprecisas.';

  @override
  String get settingsVoiceLanguageAuto => 'Igual ao idioma da app';

  @override
  String get settingsVoiceDefault => 'Predefinição do sistema';

  @override
  String get settingsVoiceQualityEnhanced => 'Melhorada';

  @override
  String get settingsNoVoices =>
      'Nenhuma voz está instalada para este idioma. Adicione uma em Definições do iOS › Acessibilidade › Conteúdo Falado.';

  @override
  String get settingsAlertPedestrian => 'Peões';

  @override
  String get settingsAlertMotorcycle => 'Motas';

  @override
  String get settingsAlertBus => 'Autocarros';

  @override
  String get settingsAlertStopSign => 'Sinais de stop';

  @override
  String get settingsTestVoiceDone => 'A reproduzir um alerta de exemplo…';

  @override
  String get settingsParkingBeeps => 'Sinais sonoros de estacionamento';

  @override
  String get settingsBeepVolume => 'Volume dos sinais sonoros';

  @override
  String get settingsProfileStandard => 'Standard · 720p';

  @override
  String get settingsRecordAudioSubtitle =>
      'Inclui o áudio da cabina nos incidentes guardados';

  @override
  String get settingsMicDenied =>
      'O acesso ao microfone está desativado. Permita-o em Definições para gravar áudio.';

  @override
  String get settingsWatermark => 'Marca de água do Corvista';

  @override
  String get settingsSaveLocation => 'Guardar localização com os clipes';

  @override
  String get settingsRecordingFooter =>
      'O buffer contínuo fica no seu iPhone e é continuamente substituído. Nada é gravado em segundo plano.';

  @override
  String get settingsDefaultView => 'Vista predefinida';

  @override
  String get settingsKeepScreenOn => 'Manter o ecrã ligado ao conduzir';

  @override
  String get settingsLiveActivity => 'Atividade em Direto';

  @override
  String get settingsLiveActivityDesc =>
      'Mostrar as instruções no Ecrã de Bloqueio e na Dynamic Island';

  @override
  String get liveActivityDashcamOff => 'Câmara desligada';

  @override
  String get settingsAutoRecenter => 'Recentrar mapa automaticamente';

  @override
  String get settingsHudStyleGrid => 'Grelha';

  @override
  String get settingsPowerSaver => 'Poupança';

  @override
  String get settingsPowerFooter =>
      'O Corvista reduz automaticamente a taxa da IA e os efeitos visuais quando o iPhone aquece ou a bateria está fraca.';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · A carregar';
  }

  @override
  String get settingsLowPowerMode =>
      'O Modo de Pouca Energia está ativado — a IA funciona a uma taxa reduzida.';

  @override
  String get settingsEmergencySetup => 'Deteção de impacto';

  @override
  String get settingsReduceMotionSubtitle =>
      'Minimiza as animações em toda a app';

  @override
  String get settingsAppLanguage => 'Idioma da app';

  @override
  String get settingsTerms => 'Termos de Utilização';

  @override
  String get settingsSupport => 'Contactar o suporte';

  @override
  String get hudCustomDetections => 'Estado da IA e deteções';

  @override
  String get hudCustomWeather => 'Meteorologia';

  @override
  String get hudCustomFooter =>
      'Os avisos, como o sobreaquecimento, são sempre apresentados, mesmo com elementos ocultos.';

  @override
  String get hudCustomDescGrid => 'Grelha em perspetiva sobre a via';

  @override
  String get hudCustomDescNight => 'Suave e avermelhado para conduzir à noite';

  @override
  String get languageSystem => 'Predefinição do sistema';

  @override
  String get diagDetectHz => 'Taxa de deteção';

  @override
  String get diagCameraFps => 'Taxa de fotogramas da câmara';

  @override
  String get diagDropped => 'Fotogramas perdidos';

  @override
  String get diagCamera => 'Câmara';

  @override
  String get diagStatus => 'Estado';

  @override
  String get diagSourceCamera => 'Câmara em direto';

  @override
  String get diagSourceFile => 'Ficheiro de gravação de teste';

  @override
  String get diagCamStarting => 'A iniciar';

  @override
  String get diagTestFootageBody =>
      'Executa deteção real no dispositivo num ficheiro de vídeo local, em vez da câmara. Todas as vistas a identificam como GRAVAÇÃO DE TESTE.';

  @override
  String get diagPathLabel => 'Caminho do ficheiro de vídeo';

  @override
  String get diagRunStarted =>
      'Gravação de teste iniciada. Abra a vista de condução para a ver.';

  @override
  String get diagBackToCamera => 'Voltar à câmara em direto';

  @override
  String get diagFileMissing => 'Não existe nenhum ficheiro nesse caminho.';

  @override
  String get emergencySetupTitle => 'Deteção de impacto';

  @override
  String get emergencyIntro =>
      'Durante um trajeto, o Corvista pode monitorizar um possível impacto grave através dos sensores de movimento do seu iPhone. Se for detetado um, inicia-se uma contagem decrescente. Se não a cancelar, o Corvista propõe ligar para os serviços de emergência e enviar uma mensagem aos seus contactos.';

  @override
  String get emergencyDisclaimer1 =>
      'Não substitui os serviços de emergência nem a deteção de acidentes do próprio veículo.';

  @override
  String get emergencyDisclaimer2 =>
      'O iOS pede sempre a sua confirmação antes de uma chamada ser efetuada ou de uma mensagem ser enviada.';

  @override
  String get emergencyDisclaimer3 =>
      'Os impactos podem passar despercebidos, e travagens bruscas ou buracos podem ser confundidos com um impacto.';

  @override
  String get emergencyParkedWarning =>
      'Conclua esta configuração com o veículo estacionado. As definições ficam bloqueadas com o veículo em movimento.';

  @override
  String get emergencyEnable => 'Ativar deteção de impacto';

  @override
  String get emergencyEnableSubtitle =>
      'Ativa apenas durante uma sessão de condução';

  @override
  String get emergencyContacts => 'Contactos de emergência';

  @override
  String get emergencyAddContact => 'Adicionar contacto';

  @override
  String get emergencyNoContacts =>
      'Ainda sem contactos. Os contactos só recebem uma mensagem depois de a confirmar.';

  @override
  String get emergencyRemoveContactBody =>
      'Esta pessoa não será proposta como destinatária após um impacto.';

  @override
  String get emergencyContactsError =>
      'Não foi possível carregar os contactos.';

  @override
  String get emergencyNumberHint => 'ex.: 112 ou 911';

  @override
  String get emergencyMessageDefault =>
      'Posso ter sofrido um acidente de viação. Esta mensagem foi preparada pelo Corvista e inclui a minha última localização conhecida, se disponível.';

  @override
  String get emergencyMessageHint =>
      'Deixe em branco para utilizar a mensagem predefinida.';

  @override
  String get emergencyCountdown => 'Duração da contagem decrescente';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Diga “Estou bem” ou “Cancelar” durante a contagem decrescente. Utiliza o reconhecimento de voz no dispositivo, quando disponível.';

  @override
  String get emergencyVoicePermDenied =>
      'É necessário o acesso ao microfone e ao reconhecimento de voz para o cancelamento por voz.';

  @override
  String get emergencyAutoSave =>
      'Guardar automaticamente o clipe do incidente';

  @override
  String get emergencyTest => 'Testar contagem decrescente (sem chamada)';

  @override
  String get emergencyTestBody =>
      'Executa um impacto simulado para ver a contagem decrescente. Nenhuma chamada ou mensagem é efetuada no modo de teste.';

  @override
  String get emergencyAlertHeadline => 'Possível impacto grave detetado.';

  @override
  String get emergencyAlertSubtitle => 'Está bem?';

  @override
  String get emergencyAlertListening =>
      'A ouvir — diga “Estou bem” para cancelar';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Liga para $number. O iOS pede a sua confirmação.';
  }

  @override
  String get emergencyAlertMessage => 'Enviar mensagem aos contactos';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Abre uma mensagem preparada. Decide se a quer enviar.';

  @override
  String get emergencyAlertTestMode =>
      'Modo de teste — nenhuma chamada será efetuada';

  @override
  String emergencyCallFailed(String number) {
    return 'Não foi possível iniciar a chamada. Marque o $number manualmente.';
  }

  @override
  String get modelsIntro =>
      'Todos os modelos já vêm incluídos na app e são executados inteiramente no seu iPhone. A imagem da sua câmara nunca sai do dispositivo.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Em direto: $ms ms por fotograma · $hz deteções/s';
  }

  @override
  String get modelsEfficientDesc =>
      'Detetor rápido e compacto, ajustado para longos trajetos com pouco calor e baixo consumo de bateria.';

  @override
  String get modelsEnhancedName => 'Melhorado';

  @override
  String get modelsEnhancedDesc =>
      'Detetor maior que encontra objetos menores e mais distantes, com maior consumo de energia.';

  @override
  String get modelsSegmentationDesc =>
      'Combina deteção rápida com máscaras da superfície da via e de objetos para a vista Perceção.';

  @override
  String get modelsNoneDesc =>
      'A câmara e a gravação continuam sem deteção de objetos. Menor consumo de energia.';

  @override
  String get modelsGenericDesc =>
      'Modelo de deteção de objetos no dispositivo.';

  @override
  String get modelsFunctionDetection =>
      'Deteta veículos, pessoas, bicicletas, motas, autocarros, semáforos e sinais de stop';

  @override
  String get modelsFunctionNone => 'Sem deteção; apenas gravação de dashcam';

  @override
  String get modelsSwitching => 'A carregar modelo…';

  @override
  String get modelsBenchmarkRunning => 'A medir o desempenho…';

  @override
  String get safetyIntro =>
      'O Corvista é um auxílio de atenção ao conduzir. Não controla o seu veículo e não substitui a sua própria atenção, o seu discernimento nem os sistemas de segurança do veículo.';

  @override
  String get safetyBeforeTitle => 'Antes de conduzir';

  @override
  String get safetyBefore1 =>
      'Fixe o seu iPhone com firmeza numa posição legal que não bloqueie a visão, os airbags nem os controlos.';

  @override
  String get safetyBefore2 =>
      'Conclua a configuração, escolha uma vista e defina o seu destino com o veículo parado.';

  @override
  String get safetyBefore3 =>
      'Ligue um carregador em trajetos longos e, se possível, mantenha o telemóvel afastado da luz solar direta.';

  @override
  String get safetyWhileTitle => 'Ao conduzir';

  @override
  String get safetyWhile1 =>
      'Mantenha os olhos na estrada. Utilize os controlos grandes do ecrã apenas quando for seguro e legal.';

  @override
  String get safetyWhile2 =>
      'Os alertas são auxílios, não avisos em que possa confiar. O silêncio nunca significa que a via esteja livre.';

  @override
  String get safetyWhile3 =>
      'Siga as leis de trânsito, os sinais e a sinalização — e não a app — em caso de divergência.';

  @override
  String get safetyLimits1 =>
      'A câmara de um único telemóvel vê apenas o que está à sua frente. Os objetos fora do campo de visão, ocultos ou muito próximos não são detetados.';

  @override
  String get safetyLimits2 =>
      'As deteções podem falhar, atrasar-se ou estar erradas, principalmente à noite, com chuva, nevoeiro, encandeamento ou com o para-brisas sujo.';

  @override
  String get safetyLimits3 =>
      'Apenas as categorias compatíveis são reconhecidas: veículos, autocarros, motas, bicicletas, pessoas, semáforos e sinais de stop. As indicações de faixa na vista virtual são estilizadas, não faixas detetadas.';

  @override
  String get safetyLimits4 =>
      'A proximidade é mostrada em zonas aproximadas (Muito perto, Perto, Média, Longe), nunca como distâncias medidas. A vista de estacionamento não substitui um sensor de estacionamento.';

  @override
  String get safetyHeat1 =>
      'A utilização contínua da câmara e da IA aquece o iPhone. O Corvista reduz a taxa de análise quando o dispositivo aquece e mostra um aviso; se o iOS sobreaquecer, a câmara pode parar.';

  @override
  String get safetyEmergencyTitle => 'Funcionalidade de emergência';

  @override
  String get safetyEmergency1 =>
      'A deteção de possível impacto é experimental. Pode não detetar colisões reais e ser acionada por outros eventos.';

  @override
  String get safetyEmergency2 =>
      'Nunca contacta ninguém em silêncio: o iOS pede sempre que confirme uma chamada ou mensagem. Não substitui ligar pessoalmente para os serviços de emergência.';

  @override
  String get privacyIntro =>
      'O Corvista foi concebido para manter os seus dados de condução no seu iPhone. Não existe conta do Corvista, e o Corvista não opera servidores próprios.';

  @override
  String get privacyCameraTitle => 'Câmara e IA';

  @override
  String get privacyCamera1 =>
      'A deteção, o seguimento e a segmentação de objetos são executados inteiramente no seu iPhone. As imagens da câmara nunca são enviadas.';

  @override
  String get privacyCamera2 =>
      'A câmara só funciona enquanto o Corvista está aberto no ecrã. Pausa quando a app passa para segundo plano — não há gravação oculta em segundo plano.';

  @override
  String get privacyRecordings1 =>
      'O buffer contínuo é temporário e continuamente substituído. As imagens só são guardadas quando toca em Guardar incidente ou, se ativar, após um possível impacto.';

  @override
  String get privacyRecordings2 =>
      'Os clipes guardados ficam no armazenamento privado do Corvista no seu iPhone. Só saem do dispositivo quando escolhe Partilhar. Eliminar a app elimina-os.';

  @override
  String get privacyRecordings3 =>
      'O áudio só é gravado se o ativar e conceder acesso ao microfone.';

  @override
  String get privacyLocation1 =>
      'A localização é utilizada com a app aberta para a sua velocidade, o mapa, as rotas e a meteorologia. Se “Guardar localização” estiver ativado, a posição no momento de guardar é armazenada com o clipe no seu dispositivo.';

  @override
  String get privacyNetwork1 =>
      'Apple Maps — apresentação do mapa, pesquisa de locais e rotas. O texto da sua pesquisa e a sua localização aproximada são enviados à Apple.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) — meteorologia atual e por hora para a sua localização.';

  @override
  String get privacyNetwork4 =>
      'O Corvista não inclui publicidade nem análises ou rastreio de terceiros.';

  @override
  String get privacyEmergencyTitle => 'Contactos de emergência';

  @override
  String get privacyEmergency1 =>
      'Os contactos que escolher são armazenados na Chave do iOS neste dispositivo. O cancelamento por voz utiliza reconhecimento de voz no dispositivo, quando disponível. As chamadas e mensagens só são enviadas depois de as confirmar no iOS.';

  @override
  String get privacyControlsTitle => 'Os seus controlos';

  @override
  String get privacyControls1 =>
      'Pode eliminar clipes a qualquer momento em Clipes e alterar ou revogar o acesso à câmara, ao microfone, à localização e ao reconhecimento de voz nas Definições do iOS.';

  @override
  String get termsTitle => 'Termos de Utilização';

  @override
  String get termsIntro =>
      'Ao utilizar o Corvista, concorda com estes termos. O Contrato de Licença de Utilizador Final de Aplicação Licenciada padrão da Apple também se aplica.';

  @override
  String get termsUseTitle => 'Utilização do Corvista';

  @override
  String get termsUse1 =>
      'O Corvista é um auxílio de atenção ao conduzir e uma dashcam. Continua a ser totalmente responsável por conduzir em segurança e de acordo com a lei em todos os momentos.';

  @override
  String get termsUse2 =>
      'Não interaja com a app de formas que o distraiam ao conduzir. Fixe o dispositivo com firmeza e de forma legal.';

  @override
  String get termsAccuracy1 =>
      'As deteções, zonas, alertas, marcadores do mapa, rotas e meteorologia podem estar incompletos, atrasados ou errados. O Corvista não controla o seu veículo.';

  @override
  String get termsAccuracy2 =>
      'A funcionalidade de emergência é experimental e pode não detetar um impacto ou ser acionada por engano.';

  @override
  String get termsRecording1 =>
      'As leis sobre dashcams, gravação de áudio e filmagem de pessoas variam consoante o país e a região. É responsável por as cumprir, inclusive ao partilhar clipes.';

  @override
  String get termsLiability1 =>
      'A app é fornecida “tal como está”. Na medida permitida por lei, o programador não é responsável por acidentes, perdas, coimas ou danos decorrentes da utilização da app ou da confiança nos seus resultados.';

  @override
  String get termsChanges1 =>
      'Estes termos podem ser atualizados com novas versões da app. A utilização continuada após uma atualização significa que aceita os termos revistos.';

  @override
  String get helpAWhere =>
      'No armazenamento privado do Corvista no seu iPhone. Nunca são enviados. Utilize Partilhar no leitor para enviar ou exportar um clipe.';

  @override
  String get helpAZones =>
      'As zonas são estimativas aproximadas feitas a partir de uma única câmara, com base em tamanhos típicos de objetos. Trate-as como indicações aproximadas, nunca como distâncias.';

  @override
  String get helpQSlow => 'Porque é que a deteção fica mais lenta?';

  @override
  String get helpASlow =>
      'Quando o iPhone aquece, a bateria está fraca ou o Modo de Pouca Energia está ativado, o Corvista reduz a taxa de análise para proteger o dispositivo. Pode alterar o modo de energia em Definições.';

  @override
  String get helpQMap =>
      'O mapa, a pesquisa ou a meteorologia não estão a funcionar.';

  @override
  String get helpAMap =>
      'Estas funcionalidades exigem ligação à internet e acesso à localização. Verifique a sua ligação e permita a localização para o Corvista nas Definições do iOS.';

  @override
  String get helpQSimulator => 'A câmara aparece como indisponível.';

  @override
  String get helpASimulator =>
      'Verifique se o acesso à câmara está permitido nas Definições do iOS e se nenhuma outra app está a utilizar a câmara. O Simulador do iOS não tem câmara; pode ser usado, em alternativa, um vídeo de teste local.';

  @override
  String get emergencyMsgNoContacts =>
      'Adicione primeiro um contacto de emergência.';

  @override
  String get cameraStarting => 'A iniciar câmara…';

  @override
  String get cameraInterrupted => 'Câmara em pausa';

  @override
  String get cameraInterruptedBody =>
      'O iOS colocou a câmara em pausa, por exemplo durante uma chamada ou enquanto outra app a utiliza. Retoma automaticamente.';

  @override
  String get cameraUnavailable => 'Câmara indisponível';

  @override
  String get cameraUnavailableBody =>
      'Não está disponível nenhuma câmara neste dispositivo. A deteção, a gravação e as vistas de estacionamento precisam da câmara traseira.';

  @override
  String get cameraPermissionDenied => 'O acesso à câmara está desativado';

  @override
  String get cameraPermissionDeniedBody =>
      'O Corvista precisa da câmara para a deteção, a gravação de dashcam e as vistas de estacionamento. Ative o acesso à câmara em Definições.';

  @override
  String get cameraError => 'Erro da câmara';

  @override
  String get cameraStopped => 'Câmara parada';

  @override
  String get cameraStart => 'Iniciar câmara';

  @override
  String get cameraPreviewLabel =>
      'Vista da câmara em direto com os objetos detetados';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Câmara $fps fps · IA $hz Hz · $ms ms · perdidos $dropped';
  }

  @override
  String get hudRecSaving => 'A guardar…';

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objetos detetados',
      one: '1 objeto detetado',
      zero: 'nenhum objeto detetado',
    );
    return 'Modelo de IA $model, $_temp0';
  }

  @override
  String get hudLowPower => 'Modo de Pouca Energia';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Meteorologia $temperature, $condition. Toque para ver detalhes.';
  }

  @override
  String get hudNoGuidance =>
      'Pesquise um destino na vista Mapa para ver aqui a orientação passo a passo.';

  @override
  String get navArrived => 'Chegou';

  @override
  String get navRerouting => 'A recalcular rota…';

  @override
  String get navSearchHint => 'Pesquisar destino';

  @override
  String get navSearchFieldHint => 'Morada, local ou estabelecimento';

  @override
  String get navSearching => 'A pesquisar…';

  @override
  String get navSearchStartTyping =>
      'Escreva uma morada ou nome de local. Os resultados vêm do Apple Maps e exigem ligação à internet.';

  @override
  String get navErrorUnavailable =>
      'Pesquisa e rotas indisponíveis — verifique a sua ligação à internet.';

  @override
  String get navErrorNoLocation =>
      'A aguardar a sua localização para planear uma rota.';

  @override
  String get navErrorPermission =>
      'O acesso à localização está desativado, por isso as rotas não podem partir da sua posição.';

  @override
  String get weatherTitle => 'Meteorologia';

  @override
  String get weatherRefresh => 'Atualizar meteorologia';

  @override
  String get weatherUnavailable =>
      'A meteorologia está indisponível de momento.';

  @override
  String get weatherNoLocation => 'A meteorologia precisa da sua localização.';

  @override
  String weatherProvidedBy(String service) {
    return 'Dados meteorológicos: $service';
  }

  @override
  String get virtualEmpty => 'Nenhum objeto compatível detetado';

  @override
  String get virtualEmptyCameraOff =>
      'A vista virtual precisa da câmara em direto.';

  @override
  String get virtualLaneDisclaimer =>
      'As linhas de faixa são ilustrativas, não detetadas.';

  @override
  String get virtualStatusCameraOff => 'Câmara desligada';

  @override
  String get virtualEmptyHint =>
      'Veículos, pessoas, bicicletas, semáforos e sinais de stop aparecem aqui quando detetados.';

  @override
  String get mapRecenter => 'Recentrar';

  @override
  String get mapWeatherUnavailable => 'Meteorologia indisponível';

  @override
  String get navSearchSubmitHint =>
      'Toque em Pesquisar para ver todos os locais correspondentes';

  @override
  String navArrivedAt(String place) {
    return 'Chegou a $place';
  }

  @override
  String get navLocationOff =>
      'A localização está desativada. Ative-a para planear rotas e navegar.';

  @override
  String get navSpeakRerouting => 'A recalcular rota';

  @override
  String get navSpeakArrived => 'Chegou';

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value quilómetros',
      one: '1 quilómetro',
    );
    return '$_temp0';
  }

  @override
  String get parkingNothing => 'Nada detetado na vista';

  @override
  String get parkingBeeps => 'Sinais sonoros de proximidade';

  @override
  String get parkingVolume => 'Volume dos sinais sonoros';

  @override
  String get parkingLimitations =>
      'Uma única câmara, sem visão de 360°. Os objetos fora do campo da câmara não são detetados. Não substitui os sensores de estacionamento; as estimativas podem estar erradas e o silêncio não significa que a área esteja livre.';

  @override
  String get perceptionDisclaimer =>
      'A máscara da superfície da via é uma camada visual aproximada. Não mostra o espaço transitável nem as faixas.';

  @override
  String get perceptionWaiting =>
      'A aguardar o primeiro fotograma de segmentação…';

  @override
  String get driveSave => 'Guardar';

  @override
  String get driveSaveIncident => 'Guardar incidente';

  @override
  String driveSaveHint(int seconds) {
    return 'Guarda os últimos $seconds segundos de gravação da dashcam';
  }

  @override
  String get driveSaving => 'A guardar incidente…';

  @override
  String driveSaved(String duration, String resolution) {
    return 'Incidente guardado · $duration · $resolution';
  }

  @override
  String get driveSaveFailed => 'Não foi possível guardar o incidente.';

  @override
  String get driveSaveNotRunning =>
      'A gravação ainda não começou — aguarde que a câmara inicie e tente novamente.';

  @override
  String get driveSaveTestFootage =>
      'A gravação de teste não é guardada. Guardar incidentes funciona com a câmara em direto.';

  @override
  String get driveSaveStorageFull =>
      'O armazenamento do seu iPhone está cheio. Liberte espaço ou elimine clipes antigos.';

  @override
  String get driveSaveIoError =>
      'Não foi possível escrever o clipe no armazenamento.';

  @override
  String get driveSettings => 'Definições';

  @override
  String get driveViewSwitcher => 'Vistas de condução';

  @override
  String get driveCameraDenied =>
      'O acesso à câmara está desativado — deteção e gravação indisponíveis.';

  @override
  String get driveRecorderFallback =>
      'A gravar sem áudio: o acesso ao microfone está desativado.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'As definições de gravação foram ajustadas: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'O seu iPhone está quente. A IA funciona mais devagar para arrefecer — mantenha-o afastado do sol direto e perto de uma saída de ar.';

  @override
  String get drivePowerThermalCritical =>
      'O seu iPhone está muito quente. A deteção por IA fica em pausa até arrefecer; a gravação continua, se possível.';

  @override
  String get drivePowerLowPower =>
      'O Modo de Pouca Energia está ativado — a IA funciona a uma taxa reduzida.';

  @override
  String get drivePowerBatteryLow =>
      'Bateria fraca — ligue o iPhone à corrente enquanto conduz.';

  @override
  String get onboardingBody1 =>
      'Transforme o seu iPhone numa dashcam inteligente e num companheiro de atenção ao conduzir.';

  @override
  String get onboardingTitle2 => 'Inteligência em cada fotograma.';

  @override
  String get onboardingBody3 =>
      'Alterne entre deteção em direto, vistas de condução virtuais, mapas interativos e visualização de estacionamento.';

  @override
  String get onboardingBody4 =>
      'Guarde gravações recentes da dashcam, reveja incidentes e partilhe gravações.';

  @override
  String get onboardingSafety1 =>
      'O Corvista é um auxílio de atenção ao conduzir. Mantenha os olhos na estrada.';

  @override
  String get onboardingSafety2 =>
      'Não controla o seu veículo nem substitui o seu discernimento.';

  @override
  String get onboardingSafety3 =>
      'As deteções e estimativas podem ser imprecisas ou não ocorrer.';

  @override
  String get onboardingSafety4 =>
      'O processamento da câmara acontece no seu iPhone — o vídeo não é enviado.';

  @override
  String get onboardingSafety5 =>
      'Mapas, pesquisa, rotas e meteorologia exigem ligação à internet.';

  @override
  String get onboardingSafety6 =>
      'Fixe o seu iPhone com firmeza para que não bloqueie a visão.';

  @override
  String get onboardingSafety7 =>
      'Conclua a configuração antes de começar a conduzir.';

  @override
  String get onboardingAcknowledge =>
      'Compreendo que o Corvista é um auxílio de atenção e que continuo a ser responsável por conduzir em segurança.';

  @override
  String get onboardingSkip => 'Saltar';

  @override
  String get permIntro =>
      'O Corvista pede apenas o que cada funcionalidade precisa. Pode alterar isto a qualquer momento em Definições.';

  @override
  String get permCameraTitle => 'Câmara';

  @override
  String get permCameraBody =>
      'Necessária para a deteção, a gravação de dashcam e a vista de estacionamento. O vídeo é processado no seu iPhone.';

  @override
  String get permLocationBody =>
      'Utilizada para a velocidade GPS, o mapa, as rotas, a meteorologia e a marcação dos clipes guardados. Apenas enquanto utiliza a app.';

  @override
  String get permSpeechNote =>
      'O reconhecimento de fala só é solicitado se ativar o cancelamento por voz nos alertas de emergência.';

  @override
  String get permStart => 'Começar a conduzir';

  @override
  String get permCameraNeeded =>
      'Pode continuar sem acesso à câmara, mas a deteção e a gravação não funcionarão até que o permita em Definições.';
}
