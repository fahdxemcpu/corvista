import 'alert_engine.dart';

/// Short, calm spoken phrases. Informational only — never instructs the
/// driver to go/proceed or claims anything is safe.
abstract final class AlertPhrases {
  static const languages = [
    'en', 'fr', 'ar', 'es', 'de', 'pt', 'it', 'nl', 'tr', 'hi', 'zh', 'ja', //
  ];

  /// Default BCP-47 voice language per supported language code.
  static const defaultVoiceLanguage = {
    'en': 'en-US',
    'fr': 'fr-FR',
    'ar': 'ar-SA',
    'es': 'es-ES',
    'de': 'de-DE',
    'pt': 'pt-BR',
    'it': 'it-IT',
    'nl': 'nl-NL',
    'tr': 'tr-TR',
    'hi': 'hi-IN',
    'zh': 'zh-CN',
    'ja': 'ja-JP',
  };

  /// Primary language subtag of a locale tag (`fr-CA` / `fr_CA` → `fr`).
  static String languageOf(String? tag) {
    if (tag == null || tag.isEmpty) return 'en';
    return tag.split(RegExp('[-_]')).first.toLowerCase();
  }

  /// Supported phrase language for [tag], falling back to English.
  static String supportedLanguage(String? tag) {
    final l = languageOf(tag);
    return languages.contains(l) ? l : 'en';
  }

  static const Map<String, Map<AlertKind, String>> _phrases = {
    'en': {
      AlertKind.pedestrian: 'Pedestrian ahead',
      AlertKind.cyclist: 'Cyclist ahead',
      AlertKind.motorcycle: 'Motorcycle nearby',
      AlertKind.bus: 'Bus ahead',
      AlertKind.vehicleClose: 'Vehicle close ahead',
      AlertKind.trafficLightGreen: 'Light changed to green',
      AlertKind.trafficLightRed: 'Light changed to red',
      AlertKind.trafficMoving: 'Traffic ahead is moving',
      AlertKind.stopSign: 'Stop sign ahead',
    },
    'fr': {
      AlertKind.pedestrian: 'Piéton devant',
      AlertKind.cyclist: 'Cycliste devant',
      AlertKind.motorcycle: 'Moto à proximité',
      AlertKind.bus: 'Bus devant',
      AlertKind.vehicleClose: 'Véhicule proche devant',
      AlertKind.trafficLightGreen: 'Le feu est passé au vert',
      AlertKind.trafficLightRed: 'Le feu est passé au rouge',
      AlertKind.trafficMoving: 'La circulation devant avance',
      AlertKind.stopSign: 'Panneau stop devant',
    },
    'ar': {
      AlertKind.pedestrian: 'أحد المشاة أمامك',
      AlertKind.cyclist: 'دراج أمامك',
      AlertKind.motorcycle: 'دراجة نارية قريبة',
      AlertKind.bus: 'حافلة أمامك',
      AlertKind.vehicleClose: 'مركبة قريبة أمامك',
      AlertKind.trafficLightGreen: 'تحولت الإشارة إلى الأخضر',
      AlertKind.trafficLightRed: 'تحولت الإشارة إلى الأحمر',
      AlertKind.trafficMoving: 'حركة المرور أمامك تتحرك',
      AlertKind.stopSign: 'إشارة توقف أمامك',
    },
    'es': {
      AlertKind.pedestrian: 'Peatón delante',
      AlertKind.cyclist: 'Ciclista delante',
      AlertKind.motorcycle: 'Moto cerca',
      AlertKind.bus: 'Autobús delante',
      AlertKind.vehicleClose: 'Vehículo cerca delante',
      AlertKind.trafficLightGreen: 'El semáforo cambió a verde',
      AlertKind.trafficLightRed: 'El semáforo cambió a rojo',
      AlertKind.trafficMoving: 'El tráfico de delante avanza',
      AlertKind.stopSign: 'Señal de stop delante',
    },
    'de': {
      AlertKind.pedestrian: 'Fußgänger voraus',
      AlertKind.cyclist: 'Radfahrer voraus',
      AlertKind.motorcycle: 'Motorrad in der Nähe',
      AlertKind.bus: 'Bus voraus',
      AlertKind.vehicleClose: 'Fahrzeug dicht voraus',
      AlertKind.trafficLightGreen: 'Ampel auf Grün gewechselt',
      AlertKind.trafficLightRed: 'Ampel auf Rot gewechselt',
      AlertKind.trafficMoving: 'Der Verkehr vorne fährt an',
      AlertKind.stopSign: 'Stoppschild voraus',
    },
    'pt': {
      AlertKind.pedestrian: 'Pedestre à frente',
      AlertKind.cyclist: 'Ciclista à frente',
      AlertKind.motorcycle: 'Moto por perto',
      AlertKind.bus: 'Ônibus à frente',
      AlertKind.vehicleClose: 'Veículo próximo à frente',
      AlertKind.trafficLightGreen: 'O semáforo mudou para verde',
      AlertKind.trafficLightRed: 'O semáforo mudou para vermelho',
      AlertKind.trafficMoving: 'O trânsito à frente está andando',
      AlertKind.stopSign: 'Placa de pare à frente',
    },
    'it': {
      AlertKind.pedestrian: 'Pedone davanti',
      AlertKind.cyclist: 'Ciclista davanti',
      AlertKind.motorcycle: 'Moto vicina',
      AlertKind.bus: 'Autobus davanti',
      AlertKind.vehicleClose: 'Veicolo vicino davanti',
      AlertKind.trafficLightGreen: 'Il semaforo è diventato verde',
      AlertKind.trafficLightRed: 'Il semaforo è diventato rosso',
      AlertKind.trafficMoving: 'Il traffico davanti si muove',
      AlertKind.stopSign: 'Segnale di stop davanti',
    },
    'nl': {
      AlertKind.pedestrian: 'Voetganger voor je',
      AlertKind.cyclist: 'Fietser voor je',
      AlertKind.motorcycle: 'Motor in de buurt',
      AlertKind.bus: 'Bus voor je',
      AlertKind.vehicleClose: 'Voertuig dichtbij voor je',
      AlertKind.trafficLightGreen: 'Het licht is op groen gesprongen',
      AlertKind.trafficLightRed: 'Het licht is op rood gesprongen',
      AlertKind.trafficMoving: 'Het verkeer voor je rijdt weer',
      AlertKind.stopSign: 'Stopbord voor je',
    },
    'tr': {
      AlertKind.pedestrian: 'Önünüzde yaya var',
      AlertKind.cyclist: 'Önünüzde bisikletli var',
      AlertKind.motorcycle: 'Yakında motosiklet var',
      AlertKind.bus: 'Önünüzde otobüs var',
      AlertKind.vehicleClose: 'Öndeki araç çok yakın',
      AlertKind.trafficLightGreen: 'Işık yeşile döndü',
      AlertKind.trafficLightRed: 'Işık kırmızıya döndü',
      AlertKind.trafficMoving: 'Öndeki trafik ilerliyor',
      AlertKind.stopSign: 'Önünüzde dur levhası var',
    },
    'hi': {
      AlertKind.pedestrian: 'आगे पैदल यात्री है',
      AlertKind.cyclist: 'आगे साइकिल सवार है',
      AlertKind.motorcycle: 'पास में मोटरसाइकिल है',
      AlertKind.bus: 'आगे बस है',
      AlertKind.vehicleClose: 'आगे वाहन बहुत पास है',
      AlertKind.trafficLightGreen: 'बत्ती हरी हो गई है',
      AlertKind.trafficLightRed: 'बत्ती लाल हो गई है',
      AlertKind.trafficMoving: 'आगे का ट्रैफ़िक चल रहा है',
      AlertKind.stopSign: 'आगे स्टॉप साइन है',
    },
    'zh': {
      AlertKind.pedestrian: '前方有行人',
      AlertKind.cyclist: '前方有骑车人',
      AlertKind.motorcycle: '附近有摩托车',
      AlertKind.bus: '前方有公交车',
      AlertKind.vehicleClose: '前方车辆较近',
      AlertKind.trafficLightGreen: '信号灯已变绿',
      AlertKind.trafficLightRed: '信号灯已变红',
      AlertKind.trafficMoving: '前方车流在移动',
      AlertKind.stopSign: '前方有停车标志',
    },
    'ja': {
      AlertKind.pedestrian: '前方に歩行者',
      AlertKind.cyclist: '前方に自転車',
      AlertKind.motorcycle: '近くにバイク',
      AlertKind.bus: '前方にバス',
      AlertKind.vehicleClose: '前方の車両が近いです',
      AlertKind.trafficLightGreen: '信号が青に変わりました',
      AlertKind.trafficLightRed: '信号が赤に変わりました',
      AlertKind.trafficMoving: '前の車が動き出しました',
      AlertKind.stopSign: '前方に一時停止標識',
    },
  };

  static const Map<String, String> _test = {
    'en': 'Voice alerts are on',
    'fr': 'Les alertes vocales sont activées',
    'ar': 'التنبيهات الصوتية مفعلة',
    'es': 'Las alertas de voz están activadas',
    'de': 'Sprachhinweise sind aktiviert',
    'pt': 'Os alertas de voz estão ativados',
    'it': 'Gli avvisi vocali sono attivi',
    'nl': 'Gesproken meldingen staan aan',
    'tr': 'Sesli uyarılar açık',
    'hi': 'आवाज़ अलर्ट चालू हैं',
    'zh': '语音提示已开启',
    'ja': '音声案内はオンです',
  };

  /// Phrase for [kind] in [lang] (any tag; falls back to English).
  static String phrase(AlertKind kind, String? lang) =>
      _phrases[supportedLanguage(lang)]![kind] ?? _phrases['en']![kind]!;

  static String testPhrase(String? lang) => _test[supportedLanguage(lang)]!;

  /// Phrases recognised as "cancel" during an emergency countdown, for
  /// [lang] plus English (always accepted).
  static List<String> emergencyCancelPhrases(String? lang) {
    final l = supportedLanguage(lang);
    return {...?_cancel[l], ..._cancel['en']!}.toList();
  }

  static const Map<String, List<String>> _cancel = {
    'en': ["I'm okay", 'I am okay', "I'm OK", 'cancel'],
    'fr': ['ça va', 'je vais bien', 'annuler'],
    'ar': ['أنا بخير', 'إلغاء'],
    'es': ['estoy bien', 'cancelar'],
    'de': ['mir geht es gut', 'alles okay', 'abbrechen'],
    'pt': ['estou bem', 'cancelar'],
    'it': ['sto bene', 'annulla'],
    'nl': ['het gaat goed', 'annuleren'],
    'tr': ['iyiyim', 'iptal'],
    'hi': ['मैं ठीक हूँ', 'रद्द करें'],
    'zh': ['我没事', '取消'],
    'ja': ['大丈夫', 'キャンセル'],
  };
}
