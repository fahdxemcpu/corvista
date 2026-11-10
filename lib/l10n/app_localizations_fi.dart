// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appName => 'Corvista';

  @override
  String get appTagline => 'Näe enemmän jokaisella ajolla.';

  @override
  String get commonCancel => 'Peruuta';

  @override
  String get commonDelete => 'Poista';

  @override
  String get commonSave => 'Tallenna';

  @override
  String get commonBack => 'Takaisin';

  @override
  String get commonClose => 'Sulje';

  @override
  String get commonRetry => 'Yritä uudelleen';

  @override
  String get commonOpenSettings => 'Avaa asetukset';

  @override
  String get commonLoading => 'Ladataan…';

  @override
  String get commonError => 'Jokin meni pieleen.';

  @override
  String commonErrorDetail(String message) {
    return 'Jokin meni pieleen: $message';
  }

  @override
  String get commonOn => 'Päällä';

  @override
  String get commonOff => 'Pois';

  @override
  String get commonRename => 'Nimeä uudelleen';

  @override
  String get commonShare => 'Jaa';

  @override
  String get commonNotAvailable => 'Ei saatavilla';

  @override
  String get commonTestFootage => 'TESTIVIDEO';

  @override
  String get zoneVeryClose => 'Hyvin lähellä';

  @override
  String get zoneClose => 'Lähellä';

  @override
  String get zoneMedium => 'Keskimatka';

  @override
  String get zoneFar => 'Kaukana';

  @override
  String get zoneUnknown => 'Tuntematon';

  @override
  String get classPerson => 'Henkilö';

  @override
  String get classBicycle => 'Polkupyörä';

  @override
  String get classMotorcycle => 'Moottoripyörä';

  @override
  String get classCar => 'Ajoneuvo';

  @override
  String get classBus => 'Linja-auto';

  @override
  String get classTrafficLight => 'Liikennevalo';

  @override
  String get classStopSign => 'Stop-merkki';

  @override
  String get viewDetection => 'Tunnistus';

  @override
  String get viewVirtual => 'Virtuaali';

  @override
  String get viewMap => 'Kartta';

  @override
  String get viewParking => 'Pysäköinti';

  @override
  String get viewPerception => 'Hahmotus';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get lightRed => 'Punainen';

  @override
  String get lightYellow => 'Keltainen';

  @override
  String get lightGreen => 'Vihreä';

  @override
  String get lightUnknown => 'Tuntematon';

  @override
  String get clipsTitle => 'Tallenteet';

  @override
  String get clipsSelect => 'Valitse';

  @override
  String clipsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valittu',
      one: '1 valittu',
      zero: 'Valitse tallenteita',
    );
    return '$_temp0';
  }

  @override
  String get clipsSelectAll => 'Valitse kaikki';

  @override
  String get clipsDeselectAll => 'Poista valinnat';

  @override
  String get clipsDeleteSelected => 'Poista valitut';

  @override
  String get clipsGridView => 'Ruudukkonäkymä';

  @override
  String get clipsListView => 'Luettelonäkymä';

  @override
  String clipsDeleteConfirmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Poistetaanko $count tallennetta?',
      one: 'Poistetaanko tämä tallenne?',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleteConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Videot poistetaan iPhonesta pysyvästi. Tätä ei voi perua.',
      one: 'Video poistetaan iPhonesta pysyvästi. Tätä ei voi perua.',
    );
    return '$_temp0';
  }

  @override
  String clipsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tallennetta poistettu',
      one: 'Tallenne poistettu',
    );
    return '$_temp0';
  }

  @override
  String get clipsEmptyTitle => 'Ei vielä tallenteita';

  @override
  String get clipsEmptyBody =>
      'Ajon aikana Corvista säilyttää lyhyttä jatkuvaa puskuria. Säilytä viimeisten sekuntien kuva täällä napauttamalla Tallenna tapaus.';

  @override
  String get clipsLoadError => 'Tallenteita ei voitu ladata.';

  @override
  String get clipsStorageTitle => 'Tallennustila';

  @override
  String clipsStorageUsage(String clips, String buffer, String free) {
    return 'Tallenteet $clips · Puskuri $buffer · $free vapaana';
  }

  @override
  String clipsStorageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tallennettua tallennetta',
      one: '1 tallennettu tallenne',
      zero: 'Ei tallennettuja tallenteita',
    );
    return '$_temp0';
  }

  @override
  String get clipsStorageLow =>
      'iPhonen tallennustila on vähissä. Uusia tapauksia ei välttämättä voi tallentaa.';

  @override
  String get clipsMissingFile => 'Tiedosto puuttuu';

  @override
  String get clipsEmergencyBadge => 'Isku';

  @override
  String clipsUntitled(String date) {
    return 'Tapaus · $date';
  }

  @override
  String get clipsAudio => 'Ääni tallennettu';

  @override
  String get clipsFavorite => 'Suosikki';

  @override
  String get clipsUnfavorite => 'Poista suosikeista';

  @override
  String get clipsLocation => 'Sijainti tallennettu';

  @override
  String clipsOpenClip(String title) {
    return 'Avaa tallenne $title';
  }

  @override
  String get playerNotFoundTitle => 'Tallennetta ei löydy';

  @override
  String get playerNotFoundBody => 'Tämä tallenne on voitu poistaa.';

  @override
  String get playerMissingTitle => 'Videotiedosto puuttuu';

  @override
  String get playerMissingBody =>
      'Tämän tallenteen videota ei enää ole iPhonessasi. Voit poistaa merkinnän galleriasta.';

  @override
  String get playerRemoveEntry => 'Poista merkintä';

  @override
  String get playerLoadError => 'Tätä videota ei voi toistaa.';

  @override
  String get playerPlay => 'Toista';

  @override
  String get playerPause => 'Tauko';

  @override
  String get playerReplay => 'Toista uudelleen';

  @override
  String get playerRenameTitle => 'Nimeä tallenne uudelleen';

  @override
  String get playerRenameHint => 'Tallenteen nimi';

  @override
  String get playerRenamed => 'Tallenne nimetty uudelleen';

  @override
  String get playerFavorited => 'Lisätty suosikkeihin';

  @override
  String get playerUnfavorited => 'Poistettu suosikeista';

  @override
  String get playerShareFailed => 'Tallennetta ei voitu jakaa.';

  @override
  String get playerDetails => 'Tiedot';

  @override
  String get playerDate => 'Tallennettu';

  @override
  String get playerDuration => 'Kesto';

  @override
  String get playerResolution => 'Resoluutio';

  @override
  String get playerSize => 'Tiedostokoko';

  @override
  String get playerAudio => 'Ääni';

  @override
  String get playerAudioYes => 'Tallennettu';

  @override
  String get playerAudioNo => 'Ei tallennettu';

  @override
  String get playerReason => 'Tallennuksen syy';

  @override
  String get playerReasonManual => 'Tallenna tapaus -painike';

  @override
  String get playerReasonEmergency => 'Mahdollinen iskun tunnistus';

  @override
  String get playerReasonRecovered => 'Palautettu keskeytyksen jälkeen';

  @override
  String get playerSpeed => 'GPS-nopeus tallennushetkellä';

  @override
  String get playerLocation => 'Sijainti';

  @override
  String get playerOpenInMaps => 'Avaa Kartoissa';

  @override
  String get playerBack => 'Takaisin';

  @override
  String get playerMore => 'Lisää toimintoja';

  @override
  String get clipsFilterLabel => 'Näytä';

  @override
  String get clipsFilterAll => 'Kaikki';

  @override
  String get clipsFilterRecordings => 'Nauhoitukset';

  @override
  String get clipsFilterIncidents => 'Tapaukset';

  @override
  String get clipsFilterEmergency => 'Hätätilanteet';

  @override
  String get clipsFilterFavorites => 'Suosikit';

  @override
  String get clipsSort => 'Lajittele';

  @override
  String get clipsSortNewest => 'Uusin ensin';

  @override
  String get clipsSortOldest => 'Vanhin ensin';

  @override
  String get clipsSortLongest => 'Pisin ensin';

  @override
  String get clipsSortLargest => 'Suurin ensin';

  @override
  String get clipsToday => 'Tänään';

  @override
  String get clipsYesterday => 'Eilen';

  @override
  String clipsGroupSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tallennetta',
      one: '1 tallenne',
    );
    return '$_temp0 · $size';
  }

  @override
  String get clipsFilterEmpty => 'Tässä luokassa ei ole vielä tallenteita.';

  @override
  String get clipsFavoritesEmpty =>
      'Merkitse tallenne tähdellä, niin se säilyy täällä pikakäyttöä varten.';

  @override
  String get clipsKindRecording => 'Nauhoitus';

  @override
  String get clipsKindIncident => 'Tapaus';

  @override
  String get clipsKindEmergency => 'Hätätilanne';

  @override
  String get clipsKindTest => 'Testi';

  @override
  String clipsTripChip(String time) {
    return 'Matka · $time';
  }

  @override
  String get clipsOpenTrip => 'Avaa matka, jonka aikana tallenne on tehty';

  @override
  String clipsStorageUsedFree(String used, String free) {
    return '$used käytössä · $free vapaana';
  }

  @override
  String clipsStorageClips(String size) {
    return 'Tallenteet vievät $size';
  }

  @override
  String clipsCountRecordings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nauhoitusta',
      one: '1 nauhoitus',
    );
    return '$_temp0';
  }

  @override
  String clipsCountIncidents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tapausta',
      one: '1 tapaus',
    );
    return '$_temp0';
  }

  @override
  String clipsCountEmergency(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hätätilannetta',
      one: '1 hätätilanne',
    );
    return '$_temp0';
  }

  @override
  String get clipsFreeUpSpace => 'Vapauta tilaa';

  @override
  String get clipsStorageLowGentle =>
      'Vapaata alle 2 Gt. Jotta tallennus sujuu moitteettomasti, vapauta tilaa tai poista tarpeettomat tallenteet.';

  @override
  String get clipsSaveToPhotos => 'Tallenna Kuviin';

  @override
  String clipsSelectionSummary(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tallennetta',
      one: '1 tallenne',
    );
    return '$_temp0 · $size';
  }

  @override
  String clipsDeleteConfirmTitleSize(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Poistetaanko $count tallennetta ($size)?',
      one: 'Poistetaanko tämä tallenne ($size)?',
    );
    return '$_temp0';
  }

  @override
  String clipsSavingToPhotos(int done, int total) {
    return 'Tallennetaan $done/$total Kuviin…';
  }

  @override
  String clipsPhotosSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tallennetta tallennettu Kuviin',
      one: 'Tallennettu Kuviin',
    );
    return '$_temp0';
  }

  @override
  String clipsPhotosPartial(int saved, int failed) {
    return '$saved tallennettu Kuviin · $failed tallentaminen epäonnistui';
  }

  @override
  String get clipsPhotosDenied =>
      'Corvistalla ei ole lupaa lisätä videoita Kuviin. Voit sallia sen asetuksissa.';

  @override
  String get clipsPhotosFailed => 'Kuviin tallennus epäonnistui.';

  @override
  String clipsFavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tallennetta lisätty suosikkeihin',
      one: 'Lisätty suosikkeihin',
    );
    return '$_temp0';
  }

  @override
  String clipsUnfavoritedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tallennetta poistettu suosikeista',
      one: 'Poistettu suosikeista',
    );
    return '$_temp0';
  }

  @override
  String clipsTrimmedTitle(String title) {
    return '$title (leikattu)';
  }

  @override
  String get playerTrim => 'Leikkaa';

  @override
  String get playerInfo => 'Tiedot';

  @override
  String get playerKind => 'Tyyppi';

  @override
  String get playerReasonRecording => 'Nauhoituspainike';

  @override
  String get trimTitle => 'Leikkaa tallenne';

  @override
  String get trimHint =>
      'Valitse säilytettävä osa vetämällä kahvoista. Alkuperäinen tallenne pysyy muuttumattomana.';

  @override
  String get trimStartHandle => 'Leikkauksen alku';

  @override
  String get trimEndHandle => 'Leikkauksen loppu';

  @override
  String trimSelection(String duration) {
    return '$duration valittu';
  }

  @override
  String get trimSave => 'Tallenna uutena tallenteena';

  @override
  String get trimSaving => 'Tallennetaan leikattua tallennetta…';

  @override
  String get trimSaved => 'Leikattu tallenne tallennettu';

  @override
  String get trimOpenNew => 'Avaa';

  @override
  String get trimFailed => 'Tallenteen leikkaus epäonnistui.';

  @override
  String get trimStorageFull =>
      'Vapaata tilaa ei ole tarpeeksi leikatun tallenteen tallentamiseen.';

  @override
  String get trimPreview => 'Toista valinta';

  @override
  String get settingsTitle => 'Asetukset';

  @override
  String get settingsSectionCamera => 'Kamera';

  @override
  String get settingsSectionAi => 'Tekoäly';

  @override
  String get settingsSectionAlerts => 'Hälytykset';

  @override
  String get settingsSectionAlertCategories => 'Hälytysluokat';

  @override
  String get settingsSectionRecording => 'Tallennus';

  @override
  String get settingsSectionDriving => 'Ajaminen';

  @override
  String get settingsSectionPower => 'Virta';

  @override
  String get settingsSectionEmergency => 'Hätätilanne';

  @override
  String get settingsSectionAppearance => 'Ulkoasu';

  @override
  String get settingsSectionLanguage => 'Kieli';

  @override
  String get settingsSectionInformation => 'Tietoja';

  @override
  String get settingsCameraLens => 'Kameran objektiivi';

  @override
  String get settingsLensWide => 'Laajakulma';

  @override
  String get settingsLensUltraWide => 'Ultralaajakulma';

  @override
  String get settingsLensTelephoto => 'Teleobjektiivi';

  @override
  String get settingsLensUnavailable => 'Ei saatavilla tässä iPhonessa';

  @override
  String get settingsStabilization => 'Vakautus';

  @override
  String get settingsStabAuto => 'Automaattinen';

  @override
  String get settingsStabOff => 'Pois';

  @override
  String get settingsStabStandard => 'Vakio';

  @override
  String get settingsStabCinematic => 'Elokuvamainen';

  @override
  String get settingsOverlayOpacity => 'Peittokuvan läpinäkyvyys';

  @override
  String get settingsShowFps => 'Näytä suorituskykytiedot';

  @override
  String get settingsShowFpsSubtitle =>
      'Kuvataajuus ja päättelyaika tunnistusnäkymässä';

  @override
  String get settingsCameraFooter =>
      'Objektiivin ja vakautuksen muutokset tulevat voimaan, kun kamera käynnistetään seuraavan kerran.';

  @override
  String get settingsAiModel => 'Tekoälymalli';

  @override
  String get settingsConfidence => 'Tunnistuksen varmuus';

  @override
  String get settingsTracking => 'Kohteiden seuranta';

  @override
  String get settingsTrackingSubtitle =>
      'Pitää kohteet vakaina ruutujen välillä';

  @override
  String get settingsShowLabels => 'Näytä nimiöt';

  @override
  String get settingsShowConfidence => 'Näytä varmuus';

  @override
  String get settingsSegmentationOpacity => 'Hahmotusmaskin läpinäkyvyys';

  @override
  String get settingsAiFooter =>
      'Alempi varmuus näyttää enemmän kohteita mutta myös enemmän virhetunnistuksia. Tunnistukset voivat olla virheellisiä.';

  @override
  String get settingsVoiceAlerts => 'Ääni-ilmoitukset';

  @override
  String get settingsVoiceLanguage => 'Äänen kieli';

  @override
  String get settingsVoiceLanguageAuto => 'Sama kuin sovelluksen kieli';

  @override
  String get settingsVoice => 'Ääni';

  @override
  String get settingsVoiceDefault => 'Järjestelmän oletus';

  @override
  String get settingsVoiceQualityEnhanced => 'Parannettu';

  @override
  String get settingsVoiceQualityPremium => 'Korkea laatu';

  @override
  String get settingsNoVoices =>
      'Tälle kielelle ei ole asennettu ääntä. Lisää sellainen iOS:n kohdassa Asetukset › Saavutettavuus › Puhuttu sisältö.';

  @override
  String get settingsAlertPedestrian => 'Jalankulkijat';

  @override
  String get settingsAlertCyclist => 'Pyöräilijät';

  @override
  String get settingsAlertMotorcycle => 'Moottoripyörät';

  @override
  String get settingsAlertBus => 'Linja-autot';

  @override
  String get settingsAlertVehicleClose => 'Ajoneuvo hyvin lähellä edessä';

  @override
  String get settingsAlertTrafficLight => 'Liikennevalon vaihtuminen';

  @override
  String get settingsAlertTrafficMoving => 'Edessä oleva liikenne liikkuu';

  @override
  String get settingsAlertStopSign => 'Stop-merkit';

  @override
  String get settingsSensitivity => 'Herkkyys';

  @override
  String get settingsSensitivityLow => 'Matala';

  @override
  String get settingsSensitivityMedium => 'Keskitaso';

  @override
  String get settingsSensitivityHigh => 'Korkea';

  @override
  String get settingsCooldown => 'Toistoväli';

  @override
  String settingsSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String get settingsVolume => 'Äänen voimakkuus';

  @override
  String get settingsQuietMode => 'Hiljainen tila';

  @override
  String get settingsQuietModeSubtitle => 'Vain tärkeimmät hälytykset puhutaan';

  @override
  String get settingsTestVoice => 'Testaa ääni';

  @override
  String get settingsTestVoiceDone => 'Toistetaan esimerkkihälytys…';

  @override
  String get settingsParkingBeeps => 'Pysäköintipiippaukset';

  @override
  String get settingsBeepVolume => 'Piippauksen voimakkuus';

  @override
  String get settingsAlertsFooter =>
      'Hälytykset ovat vain apuväline. Seuraa aina tietä – hiljaisuus ei tarkoita, että tie on vapaa.';

  @override
  String get settingsRecordingProfile => 'Tallennuksen laatu';

  @override
  String get settingsProfileStandard => 'Vakio · 720p';

  @override
  String get settingsProfilePremium => 'Full HD · 1080p';

  @override
  String get settingsBufferLength => 'Tapauspuskuri';

  @override
  String settingsBufferSeconds(int seconds) {
    return '$seconds sekuntia';
  }

  @override
  String get settingsManualMaxLength =>
      'Käsin tehdyn nauhoituksen enimmäispituus';

  @override
  String get settingsManualMaxUnlimited => 'Rajoittamaton';

  @override
  String settingsManualMaxMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get settingsRecordAudio => 'Tallenna ääni';

  @override
  String get settingsRecordAudioSubtitle =>
      'Sisältää auton sisäisen äänen tallennetuissa tapauksissa';

  @override
  String get settingsMicDenied =>
      'Mikrofonin käyttö on pois päältä. Salli se asetuksissa äänen tallentamista varten.';

  @override
  String get settingsWatermark => 'Corvista-vesileima';

  @override
  String get settingsTimestamp => 'Päivämäärä- ja aikaleima';

  @override
  String get settingsSaveLocation => 'Tallenna sijainti tallenteiden mukana';

  @override
  String get settingsStorage => 'Tallennustila ja tallenteet';

  @override
  String settingsStorageSummary(int count, String used, String free) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tallennetta',
      one: '1 tallenne',
      zero: 'Ei tallenteita',
    );
    return '$_temp0 · $used käytössä · $free vapaana';
  }

  @override
  String get settingsRecordingFooter =>
      'Jatkuva puskuri pysyy iPhonessasi ja ylikirjoitetaan koko ajan. Mitään ei tallenneta taustalla.';

  @override
  String get settingsDefaultView => 'Oletusnäkymä';

  @override
  String get settingsUnits => 'Yksiköt';

  @override
  String get settingsShowCompass => 'Näytä kompassi';

  @override
  String get settingsHudStyle => 'HUD-tyyli';

  @override
  String get settingsHudCustomize => 'Mukauta HUD';

  @override
  String get settingsDrivingSide => 'Ajopuoli';

  @override
  String get settingsDrivingSideAuto => 'Automaattinen';

  @override
  String get settingsDrivingSideRight => 'Oikea';

  @override
  String get settingsDrivingSideLeft => 'Vasen';

  @override
  String get settingsVirtualStyle => 'Virtuaalinäkymän tyyli';

  @override
  String get settingsVirtualMinimal => 'Minimaalinen';

  @override
  String get settingsVirtualPerspective => 'Perspektiivi';

  @override
  String get settingsVirtualHighContrast => 'Korkea kontrasti';

  @override
  String get settingsKeepScreenOn => 'Pidä näyttö päällä ajon aikana';

  @override
  String get settingsLiveActivity => 'Live Activity';

  @override
  String get settingsLiveActivityDesc =>
      'Näytä käännös käännökseltä -ohjeet lukitusnäytöllä ja Dynamic Islandissa';

  @override
  String get driveRecordingPausedBackground =>
      'Tallennus keskeytyi, kun Corvista oli taustalla';

  @override
  String get liveActivityRec => 'REC';

  @override
  String get liveActivityPaused => 'Tauolla';

  @override
  String get liveActivityDashcamOff => 'Kamera pois';

  @override
  String get liveActivityEnded => 'Navigointi päättyi';

  @override
  String get liveActivityEta => 'Saapuminen';

  @override
  String get settingsAutoRecenter => 'Keskitä kartta automaattisesti';

  @override
  String get settingsHudStyleClassic => 'Klassinen';

  @override
  String get settingsHudStyleGrid => 'Ruudukko';

  @override
  String get settingsHudStyleMinimal => 'Minimaalinen';

  @override
  String get settingsHudStylePerformance => 'Suorituskyky';

  @override
  String get settingsHudStyleNavigation => 'Navigointi';

  @override
  String get settingsHudStyleNight => 'Yö';

  @override
  String get settingsHudStyleHighContrast => 'Korkea kontrasti';

  @override
  String get settingsPowerMode => 'Virtatila';

  @override
  String get settingsPowerBalanced => 'Tasapainoinen';

  @override
  String get settingsPowerPerformance => 'Suorituskyky';

  @override
  String get settingsPowerSaver => 'Virransäästö';

  @override
  String get settingsPowerFooter =>
      'Corvista vähentää tekoälyn tahtia ja visuaalisia tehosteita automaattisesti, kun iPhone lämpenee tai akku on vähissä.';

  @override
  String get settingsThermal => 'Lämpötila';

  @override
  String get settingsThermalNominal => 'Normaali';

  @override
  String get settingsThermalFair => 'Lämmin';

  @override
  String get settingsThermalSerious => 'Kuuma';

  @override
  String get settingsThermalCritical => 'Kriittinen';

  @override
  String get settingsBattery => 'Akku';

  @override
  String settingsBatteryCharging(String percent) {
    return '$percent · Latautuu';
  }

  @override
  String get settingsLowPowerMode =>
      'Virransäästötila on päällä – tekoäly toimii hitaammalla tahdilla.';

  @override
  String get settingsAiRate => 'Tekoälyn nykyinen tahti';

  @override
  String settingsHzValue(String value) {
    return '$value Hz';
  }

  @override
  String get settingsEmergencySetup => 'Iskun tunnistus';

  @override
  String settingsEmergencyOn(int seconds) {
    return 'Päällä · $seconds s lähtölaskenta';
  }

  @override
  String get settingsEmergencyFooter =>
      'Kokeellinen. Ei korvaa hätäpalveluita.';

  @override
  String get settingsTheme => 'Teema';

  @override
  String get settingsThemeSystem => 'Järjestelmä';

  @override
  String get settingsThemeDark => 'Tumma';

  @override
  String get settingsThemeLight => 'Vaalea';

  @override
  String get settingsReduceMotion => 'Vähennä liikettä';

  @override
  String get settingsReduceMotionSubtitle =>
      'Vähentää animaatioita koko sovelluksessa';

  @override
  String get settingsAppLanguage => 'Sovelluksen kieli';

  @override
  String get settingsPrivacyPolicy => 'Tietosuojakäytäntö';

  @override
  String get settingsTerms => 'Käyttöehdot';

  @override
  String get settingsHelp => 'Ohje';

  @override
  String get settingsSupport => 'Ota yhteyttä tukeen';

  @override
  String get settingsLicenses => 'Avoimen lähdekoodin lisenssit';

  @override
  String get settingsSupportUnavailable =>
      'Mailia ei voitu avata. Kirjoita osoitteeseen support@corvista.app.';

  @override
  String get settingsSafety => 'Turvallisuustiedot';

  @override
  String get settingsDiagnostics => 'Diagnostiikka';

  @override
  String get settingsVersion => 'Versio';

  @override
  String settingsVersionValue(String version, String build) {
    return '$version ($build)';
  }

  @override
  String get hudCustomTitle => 'Mukauta HUD';

  @override
  String get hudCustomPreview => 'Esikatselu · esimerkkiarvot';

  @override
  String get hudCustomStyle => 'Tyyli';

  @override
  String get hudCustomElements => 'Elementit';

  @override
  String get hudCustomSpeed => 'Nopeus';

  @override
  String get hudCustomHeading => 'Suunta ja kompassi';

  @override
  String get hudCustomClock => 'Kello';

  @override
  String get hudCustomBattery => 'Akku ja lämpötila';

  @override
  String get hudCustomDetections => 'Tekoälyn tila ja tunnistukset';

  @override
  String get hudCustomWeather => 'Sää';

  @override
  String get hudCustomAppearance => 'Koko ja läpinäkyvyys';

  @override
  String get hudCustomSize => 'Koko';

  @override
  String get hudCustomOpacity => 'Läpinäkyvyys';

  @override
  String get hudCustomFooter =>
      'Varoitukset, kuten ylikuumeneminen, näytetään aina, vaikka elementit olisi piilotettu.';

  @override
  String get hudCustomDescClassic => 'Tasapainoinen mittaristo';

  @override
  String get hudCustomDescGrid => 'Perspektiiviruudukko tien päällä';

  @override
  String get hudCustomDescMinimal => 'Vain nopeus, ei muuta';

  @override
  String get hudCustomDescPerformance =>
      'Nopeuskaari ja reaaliaikaiset lukemat';

  @override
  String get hudCustomDescNavigation => 'Seuraava ohje ensin';

  @override
  String get hudCustomDescNight => 'Himmeä ja punasävyinen yöajoon';

  @override
  String get hudCustomDescHighContrast =>
      'Paras luettavuus kirkkaassa auringossa';

  @override
  String get languageTitle => 'Kieli';

  @override
  String get languageSystem => 'Järjestelmän oletus';

  @override
  String get languageSystemSubtitle => 'Seuraa iPhonen kieltä';

  @override
  String get languageFooter =>
      'Lisää kieliä on tulossa. Ääni-ilmoitusten kielen voi asettaa erikseen kohdassa Hälytykset.';

  @override
  String get diagTitle => 'Diagnostiikka';

  @override
  String get diagPerformance => 'Suorituskyky';

  @override
  String get diagInference => 'Päättelyaika';

  @override
  String get diagDetectHz => 'Tunnistustahti';

  @override
  String get diagCameraFps => 'Kameran kuvataajuus';

  @override
  String get diagMemory => 'Muisti';

  @override
  String get diagDropped => 'Pudonneet ruudut';

  @override
  String get diagSegmentation => 'Segmentointiaika';

  @override
  String get diagCamera => 'Kamera';

  @override
  String get diagStatus => 'Tila';

  @override
  String get diagSource => 'Lähde';

  @override
  String get diagSourceCamera => 'Kamera livenä';

  @override
  String get diagSourceFile => 'Testivideotiedosto';

  @override
  String get diagResolution => 'Puskurin koko';

  @override
  String get diagLens => 'Objektiivi';

  @override
  String get diagError => 'Viimeisin virhe';

  @override
  String get diagModel => 'Tekoälymalli';

  @override
  String get diagModelLoad => 'Mallin latausaika';

  @override
  String get diagPower => 'Virta';

  @override
  String get diagSegHz => 'Segmentointitahti';

  @override
  String get diagReduced => 'Vähennetyt tehosteet';

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
    return '$value Mt';
  }

  @override
  String get diagCamIdle => 'Lepotila';

  @override
  String get diagCamStarting => 'Käynnistyy';

  @override
  String get diagCamRunning => 'Käynnissä';

  @override
  String get diagCamInterrupted => 'Keskeytetty';

  @override
  String get diagCamStopped => 'Pysäytetty';

  @override
  String get diagCamUnavailable => 'Ei saatavilla';

  @override
  String get diagCamPermissionDenied => 'Lupa evätty';

  @override
  String get diagCamError => 'Virhe';

  @override
  String get diagTestFootage => 'Testivideo';

  @override
  String get diagTestFootageBody =>
      'Suorita oikea laitteella tapahtuva tunnistus paikallisesta videotiedostosta kameran sijaan. Jokainen näkymä merkitsee sen tekstillä TESTIVIDEO.';

  @override
  String get diagPathLabel => 'Videotiedoston polku';

  @override
  String get diagPathHint => '/path/to/drive.mp4';

  @override
  String get diagUseDocuments => 'Käytä Documents/test_drive.mp4';

  @override
  String get diagRun => 'Suorita testivideo';

  @override
  String get diagRunStarted =>
      'Testivideo käynnistetty. Avaa ajonäkymä nähdäksesi sen.';

  @override
  String get diagBackToCamera => 'Palaa live-kameraan';

  @override
  String get diagDebugOnly =>
      'Testivideo on käytettävissä vain kehitysversioissa.';

  @override
  String get diagFileMissing => 'Tässä polussa ei ole tiedostoa.';

  @override
  String get emergencySetupTitle => 'Iskun tunnistus';

  @override
  String get emergencyExperimental => 'Kokeellinen';

  @override
  String get emergencyIntro =>
      'Ajon aikana Corvista voi tarkkailla mahdollista vakavaa iskua iPhonen liikeanturien avulla. Jos isku tunnistetaan, lähtölaskenta alkaa. Ellet peruuta sitä, Corvista tarjoutuu soittamaan hätäpalveluihin ja lähettämään viestin yhteyshenkilöillesi.';

  @override
  String get emergencyDisclaimer1 =>
      'Ei korvaa hätäpalveluita eikä ajoneuvon omaa onnettomuuksien tunnistusta.';

  @override
  String get emergencyDisclaimer2 =>
      'iOS pyytää aina vahvistuksen ennen puhelun soittamista tai viestin lähettämistä.';

  @override
  String get emergencyDisclaimer3 =>
      'Iskuja voi jäädä havaitsematta, ja kova jarrutus tai kuopat voidaan tulkita iskuksi.';

  @override
  String get emergencyParkedWarning =>
      'Tee nämä asetukset pysäköitynä. Asetukset lukitaan, kun ajoneuvo liikkuu.';

  @override
  String get emergencyEnable => 'Ota iskun tunnistus käyttöön';

  @override
  String get emergencyEnableSubtitle => 'Aktiivinen vain ajon aikana';

  @override
  String get emergencyNeedNumber => 'Lisää ensin hätänumero.';

  @override
  String get emergencyContacts => 'Hätäyhteyshenkilöt';

  @override
  String get emergencyAddContact => 'Lisää yhteyshenkilö';

  @override
  String get emergencyNoContacts =>
      'Ei vielä yhteyshenkilöitä. Yhteyshenkilöille lähetetään viesti vasta vahvistuksesi jälkeen.';

  @override
  String emergencyRemoveContactTitle(String name) {
    return 'Poistetaanko $name?';
  }

  @override
  String get emergencyRemoveContactBody =>
      'Häntä ei enää tarjota vastaanottajaksi iskun jälkeen.';

  @override
  String get emergencyRemove => 'Poista';

  @override
  String get emergencyContactsError => 'Yhteystietoja ei voitu ladata.';

  @override
  String get emergencyNumber => 'Hätänumero';

  @override
  String get emergencyNumberHint => 'esim. 112 tai 911';

  @override
  String get emergencyMessage => 'Viestipohja';

  @override
  String get emergencyMessageDefault =>
      'Olen ehkä joutunut ajoneuvo-onnettomuuteen. Tämän viestin on laatinut Corvista, ja se sisältää viimeisimmän tunnetun sijaintini, jos se on saatavilla.';

  @override
  String get emergencyMessageHint =>
      'Jätä tyhjäksi käyttääksesi oletusviestiä.';

  @override
  String get emergencyCountdown => 'Lähtölaskennan pituus';

  @override
  String get emergencyVoiceCancel => 'Peruuta äänellä';

  @override
  String get emergencyVoiceCancelSubtitle =>
      'Sano lähtölaskennan aikana ”Olen kunnossa” tai ”Peruuta”. Käyttää laitteella tapahtuvaa puheentunnistusta, jos se on saatavilla.';

  @override
  String get emergencyVoicePermDenied =>
      'Äänellä peruuttaminen vaatii mikrofonin ja puheentunnistuksen käyttöoikeuden.';

  @override
  String get emergencyAutoSave => 'Tallenna tapaustallenne automaattisesti';

  @override
  String get emergencyTest => 'Testaa lähtölaskenta (ei puhelua)';

  @override
  String get emergencyTestBody =>
      'Suorittaa simuloidun iskun, jotta näet lähtölaskennan. Testitilassa ei soiteta puhelua eikä lähetetä viestiä.';

  @override
  String get emergencyNotSet => 'Ei asetettu';

  @override
  String get emergencyAlertHeadline => 'Mahdollinen vakava isku tunnistettu.';

  @override
  String get emergencyAlertSubtitle => 'Oletko kunnossa?';

  @override
  String get emergencyAlertCancel => 'Olen kunnossa – Peruuta';

  @override
  String emergencyAlertSecondsLeft(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds sekuntia jäljellä',
      one: '1 sekunti jäljellä',
    );
    return '$_temp0';
  }

  @override
  String get emergencyAlertListening =>
      'Kuunnellaan – peruuta sanomalla ”Olen kunnossa”';

  @override
  String emergencyAlertHeard(String text) {
    return 'Kuultu: ”$text”';
  }

  @override
  String get emergencyAlertEscalated => 'Ei vastausta. Valitse, mitä tehdään:';

  @override
  String get emergencyAlertCall => 'Soita hätäpalveluihin';

  @override
  String emergencyAlertCallNumber(String number) {
    return 'Soittaa numeroon $number. iOS pyytää vahvistuksen.';
  }

  @override
  String get emergencyAlertMessage => 'Viesti yhteyshenkilöille';

  @override
  String get emergencyAlertMessageSubtitle =>
      'Avaa valmiin viestin. Voit itse päättää, lähetetäänkö se.';

  @override
  String get emergencyAlertTestMode => 'Testitila – puhelua ei soiteta';

  @override
  String get emergencyAlertTestBadge => 'TESTI';

  @override
  String get emergencyAlertClose => 'Olen kunnossa – Sulje';

  @override
  String get emergencyMsgSent => 'Viesti lähetetty.';

  @override
  String get emergencyMsgCancelled => 'Viestiä ei lähetetty.';

  @override
  String get emergencyMsgFailed => 'Viestiä ei voitu lähettää.';

  @override
  String get emergencyMsgUnavailable =>
      'Viestit eivät ole käytettävissä tällä laitteella.';

  @override
  String emergencyCallFailed(String number) {
    return 'Puhelua ei voitu aloittaa. Soita numeroon $number itse.';
  }

  @override
  String get modelsTitle => 'Tekoälymallit';

  @override
  String get modelsIntro =>
      'Kaikki mallit sisältyvät sovellukseen ja toimivat kokonaan iPhonessasi. Kameran kuva ei koskaan poistu laitteesta.';

  @override
  String modelsActiveStats(String ms, String hz) {
    return 'Live: $ms ms ruudulta · $hz tunnistusta/s';
  }

  @override
  String modelsLastLoad(String ms) {
    return 'Ladattu ajassa $ms ms';
  }

  @override
  String get modelsEfficientName => 'Tehokas';

  @override
  String get modelsEfficientDesc =>
      'Nopea ja kompakti tunnistin pitkille ajoille, vähäinen lämpeneminen ja akunkulutus.';

  @override
  String get modelsEnhancedName => 'Parannettu';

  @override
  String get modelsEnhancedDesc =>
      'Suurempi tunnistin, joka havaitsee pienempiä ja kauempana olevia kohteita, mutta kuluttaa enemmän virtaa.';

  @override
  String get modelsSegmentationName => 'Segmentointi';

  @override
  String get modelsSegmentationDesc =>
      'Yhdistää nopean tunnistuksen tienpinnan ja kohteiden maskeihin Hahmotus-näkymää varten.';

  @override
  String get modelsNoneName => 'Tekoäly tauolla';

  @override
  String get modelsNoneDesc =>
      'Kamera ja tallennus jatkavat toimintaansa ilman kohteiden tunnistusta. Pienin virrankulutus.';

  @override
  String get modelsGenericDesc =>
      'Laitteella toimiva kohteiden tunnistusmalli.';

  @override
  String get modelsFunctionDetection =>
      'Tunnistaa ajoneuvoja, ihmisiä, polkupyöriä, moottoripyöriä, linja-autoja, liikennevaloja ja stop-merkkejä';

  @override
  String get modelsFunctionSegmentation =>
      'Lisää tienpinnan ja kohteiden maskit';

  @override
  String get modelsFunctionNone => 'Ei tunnistusta; vain ajokameratallennus';

  @override
  String get modelsSize => 'Koko';

  @override
  String get modelsInput => 'Syöte';

  @override
  String modelsInputValue(String size) {
    return '$size × $size px';
  }

  @override
  String get modelsViews => 'Toimii näkymissä';

  @override
  String get modelsStatusInstalled => 'Asennettu (sisäänrakennettu)';

  @override
  String get modelsStatusNotInstalled => 'Ei asennettu';

  @override
  String get modelsSelected => 'Valittu';

  @override
  String get modelsUse => 'Käytä tätä mallia';

  @override
  String get modelsSwitching => 'Ladataan mallia…';

  @override
  String modelsSwitched(String name) {
    return '$name on nyt käytössä';
  }

  @override
  String modelsBenchmarkMeasured(String ms) {
    return 'Mitattu tällä laitteella: keskimäärin $ms ms';
  }

  @override
  String get modelsBenchmarkNotMeasured => 'Ei mitattu tällä laitteella';

  @override
  String get modelsBenchmarkRun => 'Suorita vertailumittaus';

  @override
  String get modelsBenchmarkRunning => 'Mitataan…';

  @override
  String get modelsBenchmarkSelectHint => 'Valitse tämä malli mitataksesi sen.';

  @override
  String get modelsBenchmarkDone => 'Vertailumittaus valmis';

  @override
  String modelsBenchmarkFailed(String message) {
    return 'Vertailumittaus epäonnistui: $message';
  }

  @override
  String modelsLicense(String license, String source) {
    return '$license · $source';
  }

  @override
  String infoLastUpdated(String date) {
    return 'Päivitetty viimeksi $date';
  }

  @override
  String get safetyTitle => 'Turvallisuustiedot';

  @override
  String get safetyIntro =>
      'Corvista on ajotietoisuutta tukeva apuväline. Se ei ohjaa ajoneuvoasi eikä voi korvata omaa tarkkaavaisuuttasi, harkintaasi tai ajoneuvon turvajärjestelmiä.';

  @override
  String get safetyBeforeTitle => 'Ennen ajoa';

  @override
  String get safetyBefore1 =>
      'Kiinnitä iPhone tukevasti sallittuun paikkaan, joka ei peitä näkyvyyttä, turvatyynyjä tai ohjaimia.';

  @override
  String get safetyBefore2 =>
      'Tee asetukset, valitse näkymä ja aseta määränpää pysäköitynä.';

  @override
  String get safetyBefore3 =>
      'Kytke laturi pidemmille ajoille ja pidä puhelin mahdollisuuksien mukaan poissa suorasta auringonvalosta.';

  @override
  String get safetyWhileTitle => 'Ajon aikana';

  @override
  String get safetyWhile1 =>
      'Pidä katse tiellä. Käytä suuria näyttöohjaimia vain, kun se on turvallista ja laillista.';

  @override
  String get safetyWhile2 =>
      'Hälytykset ovat apuvälineitä, eivät varoituksia, joihin voi luottaa. Hiljaisuus ei koskaan tarkoita, että tie on vapaa.';

  @override
  String get safetyWhile3 =>
      'Noudata liikennesääntöjä, merkkejä ja liikennemerkkejä – älä sovellusta – jos ne ovat ristiriidassa.';

  @override
  String get safetyLimitsTitle => 'Rajoitukset';

  @override
  String get safetyLimits1 =>
      'Yksi puhelimen kamera näkee vain sen, mikä on sen edessä. Näkökentän ulkopuolella olevia, piilossa olevia tai hyvin lähellä olevia kohteita ei tunnisteta.';

  @override
  String get safetyLimits2 =>
      'Tunnistukset voivat jäädä tekemättä, viivästyä tai olla vääriä, etenkin yöllä, sateessa, sumussa, vastavalossa tai tuulilasin ollessa likainen.';

  @override
  String get safetyLimits3 =>
      'Vain tuetut luokat tunnistetaan: ajoneuvot, linja-autot, moottoripyörät, polkupyörät, ihmiset, liikennevalot ja stop-merkit. Virtuaalinäkymän kaistaviivat ovat tyyliteltyjä, eivät tunnistettuja kaistoja.';

  @override
  String get safetyLimits4 =>
      'Läheisyys näytetään likimääräisinä vyöhykkeinä (Hyvin lähellä, Lähellä, Keskimatka, Kaukana), ei koskaan mitattuina etäisyyksinä. Pysäköintinäkymä ei korvaa pysäköintitutkaa.';

  @override
  String get safetyHeatTitle => 'Lämpö ja akku';

  @override
  String get safetyHeat1 =>
      'Jatkuva kameran ja tekoälyn käyttö lämmittää iPhonea. Corvista vähentää analyysitahtia laitteen kuumentuessa ja näyttää varoituksen; jos iOS ylikuumenee, kamera voi pysähtyä.';

  @override
  String get safetyEmergencyTitle => 'Hätäominaisuus';

  @override
  String get safetyEmergency1 =>
      'Mahdollisen iskun tunnistus on kokeellinen. Se voi jättää oikeita kolareita havaitsematta ja käynnistyä muista tapahtumista.';

  @override
  String get safetyEmergency2 =>
      'Se ei koskaan ota yhteyttä kehenkään äänettömästi: iOS pyytää aina vahvistuksen puhelulle tai viestille. Se ei korvaa hätäpalveluihin soittamista itse.';

  @override
  String get privacyTitle => 'Tietosuoja';

  @override
  String get privacyIntro =>
      'Corvista on suunniteltu pitämään ajotietosi iPhonessasi. Corvista-tiliä ei ole, eikä Corvista ylläpidä omia palvelimiaan.';

  @override
  String get privacyCameraTitle => 'Kamera ja tekoäly';

  @override
  String get privacyCamera1 =>
      'Kohteiden tunnistus, seuranta ja segmentointi toimivat kokonaan iPhonessasi. Kameran kuvaa ei koskaan lähetetä verkkoon.';

  @override
  String get privacyCamera2 =>
      'Kamera toimii vain, kun Corvista on auki näytöllä. Se keskeytyy, kun sovellus siirtyy taustalle – piilotettua taustatallennusta ei ole.';

  @override
  String get privacyRecordingsTitle => 'Tallenteet';

  @override
  String get privacyRecordings1 =>
      'Jatkuva puskuri on väliaikainen ja ylikirjoitetaan koko ajan. Kuvaa säilytetään vain, kun napautat Tallenna tapaus tai, jos otat sen käyttöön, mahdollisen iskun jälkeen.';

  @override
  String get privacyRecordings2 =>
      'Tallennetut tallenteet pysyvät Corvistan yksityisessä tallennustilassa iPhonessasi. Ne poistuvat laitteesta vain, kun valitset Jaa. Sovelluksen poistaminen poistaa ne.';

  @override
  String get privacyRecordings3 =>
      'Ääni tallennetaan vain, jos otat sen käyttöön ja myönnät mikrofonin käyttöoikeuden.';

  @override
  String get privacyLocationTitle => 'Sijainti';

  @override
  String get privacyLocation1 =>
      'Sijaintia käytetään sovelluksen ollessa auki nopeuteen, karttaan, reitteihin ja säähän. Jos ”Tallenna sijainti” on päällä, tallennushetken sijainti tallennetaan tallenteen mukana laitteellesi.';

  @override
  String get privacyNetworkTitle => 'Verkkopalvelut';

  @override
  String get privacyNetwork1 =>
      'Apple Maps – kartan näyttö, paikkahaku ja reitit. Hakutekstisi ja likimääräinen sijaintisi lähetetään Applelle.';

  @override
  String get privacyNetwork2 =>
      'Apple Weather (WeatherKit) – nykyinen ja tuntikohtainen sää sijainnillesi.';

  @override
  String get privacyNetwork4 =>
      'Corvistassa ei ole mainontaa eikä kolmannen osapuolen analytiikkaa tai seurantaa.';

  @override
  String get privacyEmergencyTitle => 'Hätäyhteyshenkilöt';

  @override
  String get privacyEmergency1 =>
      'Valitsemasi yhteyshenkilöt tallennetaan tämän laitteen iOS-avainnippuun. Äänellä peruuttaminen käyttää laitteella tapahtuvaa puheentunnistusta, jos se on saatavilla. Puhelut ja viestit lähetetään vasta, kun vahvistat ne iOS:ssä.';

  @override
  String get privacyControlsTitle => 'Hallintasi';

  @override
  String get privacyControls1 =>
      'Voit poistaa tallenteita milloin tahansa Tallenteet-kohdassa sekä muuttaa tai perua kameran, mikrofonin, sijainnin ja puheen käyttöoikeuksia iOS:n asetuksissa.';

  @override
  String get termsTitle => 'Käyttöehdot';

  @override
  String get termsIntro =>
      'Käyttämällä Corvistaa hyväksyt nämä ehdot. Myös Applen vakiomuotoinen Licensed Application End User License Agreement -sopimus on voimassa.';

  @override
  String get termsUseTitle => 'Corvistan käyttö';

  @override
  String get termsUse1 =>
      'Corvista on ajotietoisuutta ja ajokameratoimintoja tukeva apuväline. Olet itse aina täysin vastuussa turvallisesta ja laillisesta ajamisesta.';

  @override
  String get termsUse2 =>
      'Älä käytä sovellusta tavalla, joka häiritsee ajamistasi. Kiinnitä laite tukevasti ja lainmukaisesti.';

  @override
  String get termsAccuracyTitle => 'Ei takuita tarkkuudesta';

  @override
  String get termsAccuracy1 =>
      'Tunnistukset, vyöhykkeet, hälytykset, karttamerkit, reitit ja sää voivat olla puutteellisia, viivästyneitä tai virheellisiä. Corvista ei ohjaa ajoneuvoasi.';

  @override
  String get termsAccuracy2 =>
      'Hätäominaisuus on kokeellinen, eikä se välttämättä tunnista iskua tai se voi käynnistyä virheellisesti.';

  @override
  String get termsRecordingTitle => 'Tallennuslait';

  @override
  String get termsRecording1 =>
      'Ajokameroita, äänen tallennusta ja ihmisten kuvaamista koskevat lait vaihtelevat maittain ja alueittain. Olet vastuussa niiden noudattamisesta, myös tallenteita jakaessasi.';

  @override
  String get termsLiabilityTitle => 'Vastuu';

  @override
  String get termsLiability1 =>
      'Sovellus tarjotaan ”sellaisena kuin se on”. Lain sallimissa rajoissa kehittäjä ei vastaa onnettomuuksista, menetyksistä, sakoista tai vahingoista, jotka johtuvat sovelluksen käytöstä tai sen tuottamiin tietoihin luottamisesta.';

  @override
  String get termsChangesTitle => 'Muutokset';

  @override
  String get termsChanges1 =>
      'Näitä ehtoja voidaan päivittää sovelluksen uusien versioiden mukana. Käytön jatkaminen päivityksen jälkeen tarkoittaa, että hyväksyt tarkistetut ehdot.';

  @override
  String get helpTitle => 'Ohje';

  @override
  String get helpIntro =>
      'Vastauksia yleisiin kysymyksiin. Turvallisuusohjeet löydät kohdasta Turvallisuustiedot.';

  @override
  String get helpQSave => 'Miten säilytän tapauksen kuvan?';

  @override
  String get helpASaveBuffer =>
      'Napauta ajonäkymän suurta Tallenna tapaus -painiketta. Corvista tallentaa jatkuvan puskurinsa viimeiset 20 tai 30 sekuntia (valinta kohdassa Asetukset › Tallennus) Tallenteisiin.';

  @override
  String get helpQWhere => 'Missä tallenteeni säilytetään?';

  @override
  String get helpAWhere =>
      'Corvistan yksityisessä tallennustilassa iPhonessasi. Niitä ei koskaan lähetetä verkkoon. Lähetä tai vie tallenne soittimen Jaa-toiminnolla.';

  @override
  String get helpQZones => 'Kuinka tarkkoja läheisyysvyöhykkeet ovat?';

  @override
  String get helpAZones =>
      'Vyöhykkeet ovat karkeita arvioita yhdestä kamerasta tyypillisten kohdekokojen perusteella. Pidä niitä likimääräisinä vihjeinä, ei koskaan etäisyyksinä.';

  @override
  String get helpQSlow => 'Miksi tunnistus hidastuu?';

  @override
  String get helpASlow =>
      'Kun iPhone lämpenee, akku on vähissä tai virransäästötila on päällä, Corvista vähentää analyysitahtia laitteen suojaamiseksi. Voit muuttaa virtatilaa asetuksissa.';

  @override
  String get helpQMap => 'Kartta, haku tai sää ei toimi.';

  @override
  String get helpAMap =>
      'Nämä toiminnot vaativat internetyhteyden ja sijainnin käyttöoikeuden. Tarkista yhteytesi ja salli Corvistalle sijainti iOS:n asetuksissa.';

  @override
  String get helpQSimulator => 'Kamera näkyy ei-saatavilla-tilassa.';

  @override
  String get helpASimulator =>
      'Varmista, että kameran käyttö on sallittu iOS:n asetuksissa eikä mikään muu sovellus käytä kameraa. iOS Simulatorissa ei ole kameraa; sen sijaan voi käyttää paikallista testivideota.';

  @override
  String get emergencyMsgNoContacts => 'Lisää ensin hätäyhteyshenkilö.';

  @override
  String get cameraStarting => 'Käynnistetään kameraa…';

  @override
  String get cameraInterrupted => 'Kamera tauolla';

  @override
  String get cameraInterruptedBody =>
      'iOS keskeytti kameran, esimerkiksi puhelun aikana tai kun toinen sovellus käyttää sitä. Se jatkuu automaattisesti.';

  @override
  String get cameraUnavailable => 'Kamera ei ole saatavilla';

  @override
  String get cameraUnavailableBody =>
      'Tällä laitteella ei ole saatavilla kameraa. Tunnistus, tallennus ja pysäköintinäkymät tarvitsevat takakameran.';

  @override
  String get cameraRunTestFootage => 'Suorita testivideo';

  @override
  String get cameraPermissionDenied => 'Kameran käyttö on pois päältä';

  @override
  String get cameraPermissionDeniedBody =>
      'Corvista tarvitsee kameraa tunnistukseen, ajokameratallennukseen ja pysäköintinäkymiin. Ota kameran käyttö käyttöön asetuksissa.';

  @override
  String get cameraError => 'Kameravirhe';

  @override
  String get cameraStopped => 'Kamera pysäytetty';

  @override
  String get cameraStart => 'Käynnistä kamera';

  @override
  String get cameraFocusHint => 'Tarkenna napauttamalla';

  @override
  String get cameraPreviewLabel => 'Live-kameranäkymä tunnistetuilla kohteilla';

  @override
  String cameraDiagLine(String fps, String hz, String ms, int dropped) {
    return 'Kamera $fps fps · tekoäly $hz Hz · $ms ms · pudonneita $dropped';
  }

  @override
  String hudSpeedLabel(String speed, String unit) {
    return 'Nopeus $speed $unit (GPS)';
  }

  @override
  String get hudSpeedUnavailable => 'Ei GPS-nopeutta';

  @override
  String hudHeading(String direction, String degrees) {
    return 'Suunta $direction $degrees°';
  }

  @override
  String hudRecBuffer(int seconds) {
    return 'REC $seconds s';
  }

  @override
  String hudRecBufferLabel(int seconds, int target) {
    return 'Ajokameran puskuritallennus, $seconds/$target sekuntia puskuroitu';
  }

  @override
  String get hudRecIdle => 'REC pois';

  @override
  String get hudRecSaving => 'Tallennetaan…';

  @override
  String get hudRecError => 'REC-virhe';

  @override
  String get hudAiPaused => 'Tekoäly tauolla';

  @override
  String hudAiObjects(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kohdetta',
      one: '1 kohde',
      zero: 'Ei kohteita',
    );
    return '$_temp0';
  }

  @override
  String hudAiStatusLabel(String model, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kohdetta tunnistettu',
      one: '1 kohde tunnistettu',
      zero: 'ei tunnistettuja kohteita',
    );
    return 'Tekoälymalli $model, $_temp0';
  }

  @override
  String get hudThermalSerious => 'Kuuma – tekoäly hidastettu';

  @override
  String get hudThermalCritical => 'Liian kuuma – tekoäly tauolla';

  @override
  String hudBatteryLow(String percent) {
    return 'Akku $percent';
  }

  @override
  String get hudLowPower => 'Virransäästötila';

  @override
  String hudWeatherLabel(String temperature, String condition) {
    return 'Sää $temperature, $condition. Napauta nähdäksesi lisätiedot.';
  }

  @override
  String get hudNoGuidance =>
      'Hae määränpää Kartta-näkymässä, niin käännös käännökseltä -ohjeet näkyvät tässä.';

  @override
  String get navArrived => 'Olet perillä';

  @override
  String get navRerouting => 'Lasketaan reittiä uudelleen…';

  @override
  String get navSearchHint => 'Hae määränpäätä';

  @override
  String get navSearchFieldHint => 'Osoite, paikka tai yritys';

  @override
  String get navNoResults => 'Ei vastaavia paikkoja';

  @override
  String get navSearching => 'Haetaan…';

  @override
  String get navSearchStartTyping =>
      'Kirjoita osoite tai paikan nimi. Tulokset tulevat Apple Mapsista ja vaativat internetyhteyden.';

  @override
  String get navErrorUnavailable =>
      'Haku ja reitit eivät ole käytettävissä – tarkista internetyhteytesi.';

  @override
  String get navErrorNoLocation =>
      'Odotetaan sijaintiasi reitin suunnittelua varten.';

  @override
  String get navErrorPermission =>
      'Sijainnin käyttö on pois päältä, joten reittejä ei voi aloittaa sijainnistasi.';

  @override
  String navErrorGeneric(String code) {
    return 'Reittejä ei voitu ladata ($code).';
  }

  @override
  String navRoutesTitle(String place) {
    return 'Reitit kohteeseen $place';
  }

  @override
  String navRouteOption(String distance, String duration) {
    return '$distance · $duration';
  }

  @override
  String navArriveAt(String time) {
    return 'Saapuminen $time';
  }

  @override
  String get navStart => 'Aloita';

  @override
  String get navEnd => 'Lopeta';

  @override
  String get navEndLabel => 'Lopeta navigointi';

  @override
  String navRemaining(String distance, String duration) {
    return '$distance · $duration jäljellä';
  }

  @override
  String navAdvisory(String text) {
    return 'Huomautus: $text';
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
    return 'Reitti $index: $name';
  }

  @override
  String get weatherTitle => 'Sää';

  @override
  String weatherFeelsLike(String temperature) {
    return 'Tuntuu kuin $temperature';
  }

  @override
  String get weatherPrecipitation => 'Sade';

  @override
  String get weatherWind => 'Tuuli';

  @override
  String get weatherVisibility => 'Näkyvyys';

  @override
  String get weatherHumidity => 'Kosteus';

  @override
  String get weatherHourly => 'Seuraavat tunnit';

  @override
  String weatherAsOf(String time) {
    return 'Päivitetty $time';
  }

  @override
  String get weatherRefresh => 'Päivitä sää';

  @override
  String get weatherUnavailable => 'Sää ei ole tällä hetkellä saatavilla.';

  @override
  String get weatherNoLocation => 'Sää vaatii sijaintisi.';

  @override
  String get weatherLegal => 'Tietolähteet ja oikeudelliset tiedot';

  @override
  String weatherProvidedBy(String service) {
    return 'Säätiedot: $service';
  }

  @override
  String get weatherNow => 'Nyt';

  @override
  String get virtualEmpty => 'Tuettuja kohteita ei tunnistettu';

  @override
  String get virtualEmptyCameraOff => 'Virtuaalinäkymä tarvitsee live-kameran.';

  @override
  String get virtualLaneDisclaimer =>
      'Kaistaviivat ovat havainnollistavia, eivät tunnistettuja.';

  @override
  String virtualNearest(String zone) {
    return 'Lähin: $zone';
  }

  @override
  String virtualSceneLabel(String summary) {
    return 'Virtuaalinen tienäkymä: $summary';
  }

  @override
  String virtualCount(String label, int count) {
    return '$label $count';
  }

  @override
  String virtualStatusAi(String status) {
    return 'Tekoäly $status';
  }

  @override
  String get virtualStatusLive => 'käynnissä';

  @override
  String get virtualStatusPaused => 'tauolla';

  @override
  String get virtualStatusCameraOff => 'Kamera pois';

  @override
  String get virtualStatusTestFootage => 'Testivideo';

  @override
  String get virtualEmptyHint =>
      'Ajoneuvot, ihmiset, polkupyörät, valot ja stop-merkit näkyvät tässä, kun ne tunnistetaan.';

  @override
  String get mapRecenter => 'Keskitä';

  @override
  String get mapZoomIn => 'Lähennä';

  @override
  String get mapZoomOut => 'Loitonna';

  @override
  String get mapUnsupported =>
      'Interaktiivinen kartta on saatavilla iPhonessa.';

  @override
  String get mapObjectsApprox => 'Kohdemerkit ovat likimääräisiä sijainteja.';

  @override
  String get mapWeatherUnavailable => 'Sää ei saatavilla';

  @override
  String get navErrorNoRoute => 'Tähän määränpäähän ei löytynyt reittiä.';

  @override
  String get navDismiss => 'Ohita';

  @override
  String get navGo => 'Lähde';

  @override
  String get navFastest => 'Nopein';

  @override
  String get navThen => 'Sitten';

  @override
  String get navRecents => 'Viimeaikaiset';

  @override
  String get navClearRecents => 'Tyhjennä';

  @override
  String get navSearchSubmitHint =>
      'Paina Hae nähdäksesi kaikki vastaavat paikat';

  @override
  String get navPlaces => 'Paikat';

  @override
  String get navEtaLabel => 'saapuminen';

  @override
  String get navTimeLeftLabel => 'jäljellä';

  @override
  String get navOverview => 'Yleiskuva';

  @override
  String get navMute => 'Mykistä ääniohjeet';

  @override
  String get navUnmute => 'Poista ääniohjeiden mykistys';

  @override
  String get navEndConfirm => 'Lopetetaanko navigointi?';

  @override
  String navEndConfirmBody(String place) {
    return 'Opastus kohteeseen $place päättyy.';
  }

  @override
  String navArrivedAt(String place) {
    return 'Olet perillä: $place';
  }

  @override
  String get navDone => 'Valmis';

  @override
  String get navWeakGps => 'Heikko GPS-signaali';

  @override
  String get navLocationOff =>
      'Sijainti on pois päältä. Ota se käyttöön reittien suunnittelua ja navigointia varten.';

  @override
  String get navVoiceGuidance => 'Ääniohjeet';

  @override
  String navSpeakIn(String distance, String instruction) {
    return 'Matkaa $distance, $instruction';
  }

  @override
  String navSpeakThen(String first, String second) {
    return '$first, sitten $second';
  }

  @override
  String get navSpeakRerouting => 'Lasketaan reittiä uudelleen';

  @override
  String get navSpeakArrived => 'Olet perillä';

  @override
  String navSpokenMeters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metriä',
      one: '1 metri',
    );
    return '$_temp0';
  }

  @override
  String navSpokenKilometers(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value kilometriä',
      one: '1 kilometri',
    );
    return '$_temp0';
  }

  @override
  String navSpokenFeet(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jalkaa',
      one: '1 jalka',
    );
    return '$_temp0';
  }

  @override
  String navSpokenYards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jaardia',
      one: '1 jaardi',
    );
    return '$_temp0';
  }

  @override
  String navSpeakContinue(String distance) {
    return 'Jatka $distance';
  }

  @override
  String get navErrorNoDirections =>
      'Ohjeita ei ole saatavilla tälle matkalle tällä alueella. Kokeile toista määränpäätä.';

  @override
  String navContinueFor(String distance) {
    return 'Jatka $distance';
  }

  @override
  String navSpokenMiles(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value mailia',
      one: '1 maili',
    );
    return '$_temp0';
  }

  @override
  String parkingNearest(String object, String zone) {
    return 'Lähin: $object · $zone';
  }

  @override
  String get parkingNothing => 'Näkymässä ei tunnistettu mitään';

  @override
  String get parkingBeeps => 'Läheisyyspiippaukset';

  @override
  String get parkingVolume => 'Piippauksen voimakkuus';

  @override
  String get parkingLimitations =>
      'Yksi kamera, ei 360°. Kameran näkymän ulkopuolella olevia kohteita ei tunnisteta. Ei korvaa pysäköintitutkaa; arviot voivat olla virheellisiä, eikä hiljaisuus tarkoita, että alue on vapaa.';

  @override
  String parkingTopDownLabel(String summary) {
    return 'Läheisyysnäkymä ylhäältä. $summary';
  }

  @override
  String get perceptionModeOriginal => 'Alkuperäinen';

  @override
  String get perceptionModeBoxes => 'Laatikot';

  @override
  String get perceptionModeMasks => 'Kohdemaskit';

  @override
  String get perceptionModeRoad => 'Tienpinta';

  @override
  String get perceptionModeCombined => 'Yhdistetty';

  @override
  String get perceptionOpacity => 'Maskin läpinäkyvyys';

  @override
  String get perceptionDisclaimer =>
      'Tienpintamaski on likimääräinen visuaalinen kerros. Se ei näytä ajettavaa tilaa eikä kaistoja.';

  @override
  String get perceptionNeedsModel =>
      'Valitse Segmentointi-malli nähdäksesi maskit.';

  @override
  String get perceptionChooseModel => 'Valitse malli';

  @override
  String get perceptionWaiting => 'Odotetaan ensimmäistä segmentointiruutua…';

  @override
  String get perceptionShortCamera => 'Kamera';

  @override
  String get perceptionShortBoxes => 'Ruudut';

  @override
  String get perceptionShortObjects => 'Kohteet';

  @override
  String get perceptionShortRoad => 'Tie';

  @override
  String get perceptionShortAll => 'Kaikki';

  @override
  String get perceptionModesLabel => 'Hahmotuskerrokset';

  @override
  String get perceptionStatusWarmingUp => 'Lämpiää…';

  @override
  String get perceptionStatusLoadingModel => 'Ladataan mallia…';

  @override
  String perceptionStatusLive(String fps) {
    return '$fps kuvaa/s';
  }

  @override
  String get perceptionStatusPaused => 'Maskit tauolla';

  @override
  String get perceptionLegend => 'Maskien selite';

  @override
  String get perceptionUnavailable => 'Maskit eivät ole käytettävissä';

  @override
  String get driveSave => 'Tallenna';

  @override
  String get driveSaveIncident => 'Tallenna tapaus';

  @override
  String driveSaveHint(int seconds) {
    return 'Tallentaa ajokameran viimeiset $seconds sekuntia';
  }

  @override
  String get driveSaving => 'Tallennetaan tapausta…';

  @override
  String hudRecManualLabel(String time) {
    return 'Nauhoitetaan, $time';
  }

  @override
  String get driveRecord => 'Nauhoita';

  @override
  String get driveRecordStartA11y => 'Aloita nauhoitus';

  @override
  String driveRecordStopA11y(String time) {
    return 'Lopeta nauhoitus, $time nauhoitettu';
  }

  @override
  String get driveRecordHint =>
      'Nauhoittaa jatkuvasti, kunnes lopetat, mukaan lukien viimeiset 5 sekuntia';

  @override
  String get driveRecordFailed => 'Nauhoituksen aloitus epäonnistui';

  @override
  String driveRecordSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nauhoitus tallennettu · $count osaa',
      one: 'Nauhoitus tallennettu',
    );
    return '$_temp0';
  }

  @override
  String driveRecordStopped(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'storage': 'Nauhoitus pysähtyi: tallennustila on lähes täynnä',
      'max_duration': 'Nauhoitus pysähtyi: enimmäispituus saavutettu',
      'camera_stopped': 'Nauhoitus pysähtyi kameran mukana',
      'background': 'Nauhoitus pysähtyi: sovellus siirtyi taustalle',
      'thermal': 'Nauhoitus pysähtyi: puhelin on liian kuuma',
      'other': 'Nauhoitus pysähtyi',
    });
    return '$_temp0';
  }

  @override
  String driveSaved(String duration, String resolution) {
    return 'Tapaus tallennettu · $duration · $resolution';
  }

  @override
  String get driveSavedView => 'Näytä';

  @override
  String get driveSaveFailed => 'Tapausta ei voitu tallentaa.';

  @override
  String get driveSaveNotRunning =>
      'Tallennus ei ole vielä alkanut – odota kameran käynnistymistä ja yritä uudelleen.';

  @override
  String get driveSaveTestFootage =>
      'Testivideota ei tallenneta. Tapausten tallennus toimii live-kameralla.';

  @override
  String get driveSaveStorageFull =>
      'iPhonen tallennustila on täynnä. Vapauta tilaa tai poista vanhempia tallenteita.';

  @override
  String get driveSaveIoError =>
      'Tallennetta ei voitu kirjoittaa tallennustilaan.';

  @override
  String get driveClips => 'Tallenteet';

  @override
  String get driveSettings => 'Asetukset';

  @override
  String get driveViewSwitcher => 'Ajonäkymät';

  @override
  String get driveLocationDenied =>
      'Sijainti on pois päältä – nopeus, kartat ja reitit eivät ole käytettävissä.';

  @override
  String get driveCameraDenied =>
      'Kameran käyttö on pois päältä – tunnistus ja tallennus eivät ole käytettävissä.';

  @override
  String get driveRecorderFallback =>
      'Tallennus ilman ääntä: mikrofonin käyttö on pois päältä.';

  @override
  String driveRecorderFallbackGeneric(String reason) {
    return 'Tallennusasetuksia muutettiin: $reason';
  }

  @override
  String get drivePowerThermalSerious =>
      'iPhone on kuuma. Tekoäly toimii hitaammin jäähtyäkseen – pidä laite poissa suorasta auringosta ja ilmanvaihtoaukon lähellä.';

  @override
  String get drivePowerThermalCritical =>
      'iPhone on liian kuuma. Tekoälytunnistus on tauolla, kunnes laite jäähtyy; tallennus jatkuu, jos mahdollista.';

  @override
  String get drivePowerLowPower =>
      'Virransäästötila on päällä – tekoäly toimii hitaammalla tahdilla.';

  @override
  String get drivePowerBatteryLow =>
      'Akku on vähissä – kytke iPhone virtalähteeseen ajon ajaksi.';

  @override
  String get onboardingTitle1 => 'Näe enemmän jokaisella ajolla.';

  @override
  String get onboardingBody1 =>
      'Muuta iPhonesi älykkääksi ajokameraksi ja ajotietoisuutta tukevaksi kumppaniksi.';

  @override
  String get onboardingTitle2 => 'Älykkyyttä joka ruudussa.';

  @override
  String get onboardingBody2 =>
      'Tunnista tuetut ajoneuvot, ihmiset, polkupyörät ja tiemerkinnät suoraan iPhonessasi.';

  @override
  String get onboardingTitle3 => 'Yksi tie. Useita näkökulmia.';

  @override
  String get onboardingBody3 =>
      'Vaihda live-tunnistuksen, virtuaalisten ajonäkymien, interaktiivisten karttojen ja pysäköintinäkymän välillä.';

  @override
  String get onboardingTitle4 => 'Säilytä tärkeät hetket.';

  @override
  String get onboardingBody4 =>
      'Tallenna ajokameran viimeaikaista kuvaa, tarkastele tapauksia ja jaa tallenteita.';

  @override
  String get onboardingTitle5 => 'Turvallisuus ja tietosuoja';

  @override
  String get onboardingSafety1 =>
      'Corvista on ajotietoisuutta tukeva apuväline. Pidä katse tiellä.';

  @override
  String get onboardingSafety2 =>
      'Se ei ohjaa ajoneuvoasi eikä korvaa harkintaasi.';

  @override
  String get onboardingSafety3 =>
      'Tunnistukset ja arviot voivat olla virheellisiä tai jäädä tekemättä.';

  @override
  String get onboardingSafety4 =>
      'Kuvan käsittely tapahtuu iPhonessasi – videota ei lähetetä verkkoon.';

  @override
  String get onboardingSafety5 =>
      'Kartat, haku, reitit ja sää vaativat internetyhteyden.';

  @override
  String get onboardingSafety6 =>
      'Kiinnitä iPhone tukevasti niin, ettei se peitä näkyvyyttä.';

  @override
  String get onboardingSafety7 =>
      'Tee asetukset valmiiksi ennen ajon aloittamista.';

  @override
  String get onboardingAcknowledge =>
      'Ymmärrän, että Corvista on tietoisuutta tukeva apuväline ja että vastaan edelleen turvallisesta ajamisesta.';

  @override
  String get onboardingReadSafety => 'Lue täydet turvallisuustiedot';

  @override
  String get onboardingNext => 'Seuraava';

  @override
  String get onboardingSkip => 'Ohita';

  @override
  String get onboardingAgree => 'Jatka';

  @override
  String onboardingPageLabel(int current, int total) {
    return 'Sivu $current/$total';
  }

  @override
  String get permTitle => 'Käyttöoikeudet';

  @override
  String get permIntro =>
      'Corvista pyytää vain sen, mitä kukin ominaisuus tarvitsee. Voit muuttaa näitä milloin tahansa asetuksissa.';

  @override
  String get permCameraTitle => 'Kamera';

  @override
  String get permCameraBody =>
      'Tarvitaan tunnistukseen, ajokameratallennukseen ja pysäköintinäkymään. Video käsitellään iPhonessasi.';

  @override
  String get permLocationTitle => 'Sijainti';

  @override
  String get permLocationBody =>
      'Käytetään GPS-nopeuteen, karttaan, reitteihin, säähän ja tallenteiden merkitsemiseen. Vain sovellusta käytettäessä.';

  @override
  String get permMicTitle => 'Mikrofoni';

  @override
  String get permSpeechNote =>
      'Puheentunnistusta pyydetään vain, jos otat käyttöön äänellä peruuttamisen hätähälytyksissä.';

  @override
  String get permRequired => 'Pakollinen';

  @override
  String get permOptional => 'Valinnainen';

  @override
  String get permAllow => 'Salli';

  @override
  String get permGranted => 'Sallittu';

  @override
  String get permDenied => 'Estetty';

  @override
  String get permLimited => 'Rajoitettu';

  @override
  String get permRestricted => 'Rajattu';

  @override
  String get permStart => 'Aloita ajaminen';

  @override
  String get permCameraNeeded =>
      'Voit jatkaa ilman kameran käyttöoikeutta, mutta tunnistus ja tallennus eivät toimi, ennen kuin sallit sen asetuksissa.';

  @override
  String get permSetupIntro =>
      'Corvista tarvitsee nämä toimiakseen täysin. Napauta Salli kaikki, niin iOS kysyy jokaisesta vuorollaan. Voit muuttaa niitä milloin tahansa asetuksissa.';

  @override
  String get permCameraLine =>
      'Tarvitaan tunnistukseen, ajokameratallennukseen ja pysäköintinäkymään. Video käsitellään iPhonessasi, sitä ei koskaan lähetetä verkkoon.';

  @override
  String get permLocationLine =>
      'GPS-nopeus, kartta, reitit, sää ja tallenteiden tallennuspaikka. Vain sovellusta käytettäessä.';

  @override
  String get permMicLine =>
      'Auton sisäinen ääni tapaustallenteissa ja peruutuslauseesi kuuleminen hätähälytyksen aikana.';

  @override
  String get permSpeechTitle => 'Puheentunnistus';

  @override
  String get permSpeechLine =>
      'Tunnistaa peruutuslauseesi hätälähtölaskennan aikana iPhonessasi, jos se on tuettu.';

  @override
  String get permAllowAll => 'Salli kaikki';

  @override
  String permAsking(String permission) {
    return 'Pyydetään lupaa: $permission…';
  }

  @override
  String get permSomeDenied =>
      'Joitakin käyttöoikeuksia ei ole sallittu. Ota ne käyttöön asetuksissa käyttääksesi näitä ominaisuuksia.';

  @override
  String get permNotNow => 'Ei nyt';

  @override
  String get tourLabel => 'Ajonäkymän esittely';

  @override
  String tourProgress(int current, int total) {
    return 'Vaihe $current/$total';
  }

  @override
  String get tourNext => 'Seuraava';

  @override
  String get tourBack => 'Takaisin';

  @override
  String get tourSkip => 'Ohita esittely';

  @override
  String get tourFinish => 'Aloita ajaminen';

  @override
  String get tourWelcomeTitle => 'Pikaesittelysi';

  @override
  String get tourWelcomeBody =>
      'Minuutin katsaus ajonäkymän tärkeimpiin asioihin. Parasta tehdä pysäköitynä.';

  @override
  String get tourHudTitle => 'Mittaririvisi';

  @override
  String get tourHudSpeed => 'Nopeus tulee GPS:stä.';

  @override
  String get tourHudRec => 'REC näyttää, montako sekuntia kuvaa on puskuroitu.';

  @override
  String get tourHudAi =>
      'Tekoälykuvake näyttää mallin, havaittujen kohteiden määrän ja pisteen: vihreä käynnissä, keltainen rajoitettu, punainen pysäytetty.';

  @override
  String get tourSaveTitle => 'Tallenna tapaus';

  @override
  String tourSaveBody(int seconds) {
    return 'Corvista säilyttää jatkuvaa puskuria videon viimeisistä $seconds sekunnista. Se ylikirjoitetaan koko ajan, joten mitään ei säilytetä, ellet napauta Tallenna. Tallennetut tallenteet pysyvät tässä iPhonessa Tallenteissa.';
  }

  @override
  String get tourRecordTitle => 'Nauhoita koko ajo';

  @override
  String get tourRecordBody =>
      'Napauta Nauhoita kuvataksesi jatkuvasti, kunnes lopetat. Pitkät ajot tallennetaan 5 minuutin osina Tallenteisiin, ja Tallenna tapaus toimii edelleen nauhoituksen aikana.';

  @override
  String get tourViewsTitle => 'Viisi tapaa nähdä tie';

  @override
  String get tourViewDetection =>
      'Live-kamera, jossa tuettujen kohteiden ympärillä on laatikot.';

  @override
  String get tourViewVirtual =>
      'Tunnistuksista rakennettu yksinkertaistettu 3D-näkymä.';

  @override
  String get tourViewMap =>
      'Apple Maps hakutoiminnolla ja käännös käännökseltä -opastuksella.';

  @override
  String get tourViewParking => 'Kamera ja läheisyysnäkymä ylhäältä.';

  @override
  String get tourViewPerception => 'Tien ja kohteiden maskit.';

  @override
  String get tourMapTitle => 'Haku ja käännös käännökseltä';

  @override
  String get tourMapBody =>
      'Avaa Kartta, napauta hakukenttää ja valitse määränpää. Valitse reitti ja aloita käännös käännökseltä -opastus napauttamalla Aloita. Vaatii internetyhteyden.';

  @override
  String get tourClipsTitle => 'Tallenteet';

  @override
  String get tourClipsBody =>
      'Tarkastele, nimeä uudelleen, jaa tai poista tallennettuja tapauksia. Tallenteet pysyvät iPhonessasi, ellet jaa niitä.';

  @override
  String get tourSettingsTitle => 'Asetukset';

  @override
  String get tourSettingsBody =>
      'Säädä ääni-ilmoituksia ja niiden herkkyyttä, tallennuksen laatua ja puskurin pituutta sekä ota käyttöön hätätila: kokeellinen iskuhälytys, jossa on peruutuslähtölaskenta.';

  @override
  String get tourSafetyTitle => 'Ennen ajoa';

  @override
  String get tourSafety1 =>
      'Kiinnitä iPhone tukevasti niin, ettei se peitä näkyvyyttä.';

  @override
  String get tourSafety2 =>
      'Älä käytä sovellusta ajaessasi. Tee asetukset pysäköitynä.';

  @override
  String get tourSafety3 =>
      'Tunnistukset ja vyöhykkeet ovat arvioita. Ne voivat olla vääriä tai jäädä tekemättä.';

  @override
  String get tourSafety4 => 'Vastaat edelleen turvallisesta ajamisesta.';

  @override
  String get helpTakeTour => 'Katso esittely';

  @override
  String get helpTakeTourSub => 'Minuutin opastettu katsaus ajonäkymään.';

  @override
  String get tripsTitle => 'Matkat';

  @override
  String get tripsOpen => 'Matkaloki';

  @override
  String get tripsEmptyTitle => 'Ei vielä matkoja';

  @override
  String get tripsEmptyBody =>
      'Matkat tallennetaan automaattisesti, kun ajat Corvistalla – matka, aika, nopeus ja ajamasi reitti.';

  @override
  String get tripsDisabledBody =>
      'Matkaloki on pois päältä, joten uusia ajoja ei tallenneta. Ota se käyttöön, jos haluat pitää yksityistä lokia reiteistäsi tässä iPhonessa.';

  @override
  String get tripsEnable => 'Ota matkaloki käyttöön';

  @override
  String get tripsToday => 'Tänään';

  @override
  String get tripsYesterday => 'Eilen';

  @override
  String tripsRecordingNow(String distance) {
    return 'Tallennetaan matkaa · $distance';
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
      other: '$count tapausta',
      one: '1 tapaus',
    );
    return '$_temp0';
  }

  @override
  String tripsAlerts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hälytystä',
      one: '1 hälytys',
    );
    return '$_temp0';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count matkaa',
      one: '1 matka',
      zero: 'Ei matkoja',
    );
    return '$_temp0';
  }

  @override
  String get tripsStatDistance => 'Matka';

  @override
  String get tripsStatDuration => 'Kesto';

  @override
  String get tripsStatMoving => 'Liikkumisaika';

  @override
  String get tripsStatAvgSpeed => 'Keskinopeus';

  @override
  String get tripsStatMaxSpeed => 'Huippunopeus';

  @override
  String get tripsDetections => 'Tunnistukset';

  @override
  String get tripsNoDetections =>
      'Tältä matkalta ei kirjattu tieliikennekohteita.';

  @override
  String get tripsTimeline => 'Aikajana';

  @override
  String get tripsEventStart => 'Matka alkoi';

  @override
  String get tripsEventEnd => 'Matka päättyi';

  @override
  String get tripsEventAlert => 'Ääni-ilmoitus';

  @override
  String get tripsEventIncident => 'Tapaustallenne tallennettu';

  @override
  String get tripsEventEmergency => 'Mahdollinen kolari tunnistettu';

  @override
  String get tripsEventNavStart => 'Navigointi alkoi';

  @override
  String get tripsEventArrive => 'Saavuttu määränpäähän';

  @override
  String get tripsEventReroute => 'Reitti laskettu uudelleen';

  @override
  String get tripsEventRecording => 'Nauhoitus tallennettu';

  @override
  String get tripsOpenClip => 'Avaa tallenne';

  @override
  String get tripsTrackPreview => 'GPS-jälki';

  @override
  String get tripsRenameTitle => 'Nimeä matka uudelleen';

  @override
  String get tripsRenameHint => 'Matkan nimi';

  @override
  String get tripsFavorite => 'Lisää suosikkeihin';

  @override
  String get tripsUnfavorite => 'Poista suosikeista';

  @override
  String get tripsShareGpx => 'Jaa GPX';

  @override
  String get tripsShareFailed => 'Matkaa ei voitu jakaa.';

  @override
  String get tripsDelete => 'Poista matka';

  @override
  String get tripsDeleteConfirmTitle => 'Poistetaanko tämä matka?';

  @override
  String get tripsDeleteConfirmBody =>
      'Reitti ja tilastot poistetaan tästä iPhonesta. Matkan tapaustallenteet säilyvät.';

  @override
  String get tripsDeleted => 'Matka poistettu';

  @override
  String get tripsNotFound => 'Tämä matka ei ole enää saatavilla.';

  @override
  String get tripsPrivacyNote =>
      'Tallennetaan vain tähän iPhoneen. Mitään ei lähetetä verkkoon.';

  @override
  String get settingsSectionTrips => 'Matkaloki';

  @override
  String get settingsTripLog => 'Tallenna matkat';

  @override
  String get settingsTripLogSubtitle =>
      'Säilyttää reittisi ja ajotilastosi vain tässä iPhonessa.';

  @override
  String get settingsTripRetention => 'Säilytä matkat';

  @override
  String settingsRetentionDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days päivää',
      one: '1 päivä',
    );
    return '$_temp0';
  }

  @override
  String get settingsRetentionYear => '1 vuosi';

  @override
  String get settingsRetentionForever => 'Ikuisesti';

  @override
  String get settingsTripRetentionFooter =>
      'Vanhemmat matkat poistetaan automaattisesti, kun Corvista käynnistyy.';

  @override
  String get settingsViewTrips => 'Näytä matkat';

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
    return 'Corvista-matka $date';
  }

  @override
  String get settingsFreeUpSpace => 'Vapauta tilaa';

  @override
  String get settingsFreeUpSpaceSubtitle =>
      'Poistaa väliaikaiset tiedostot ja välimuistit. Tallennetut tallenteet ja matkat säilyvät.';

  @override
  String settingsFreedBytes(String size) {
    return 'Vapautettu $size';
  }

  @override
  String get settingsNothingToFree =>
      'Välimuistit tyhjennetty – poistettavia väliaikaisia tiedostoja ei ole.';

  @override
  String get settingsSectionPrivacyData => 'Tietosuoja ja data';

  @override
  String get settingsPrivacyDataFooter =>
      'Tallenteet, matkat ja asetukset tallennetaan vain tähän iPhoneen. Ne poistuvat sieltä vain, kun itse päätät jakaa ne.';

  @override
  String get settingsDeleteAllData => 'Poista kaikki tiedot';

  @override
  String get settingsDeleteAllDataSubtitle =>
      'Poista tallenteet, matkat, yhteystiedot ja asetukset tästä iPhonesta';

  @override
  String get deleteAllTitle => 'Poistetaanko kaikki tiedot?';

  @override
  String get deleteAllMessage =>
      'Tämä poistaa pysyvästi tästä iPhonesta:\n• Tapaustallenteet ja pikkukuvat\n• Matkaloki ja GPS-reitit\n• Hätäyhteyshenkilöt ja hätätapahtumat\n• Tunnistuslokit ja diagnostiikkaloki\n• Asetukset ja viimeisimmät kohteet\n• Tilapäinen tallennuspuskuri ja välimuisti\n\nToimintoa ei voi peruuttaa. Corvista käynnistyy sen jälkeen uudelleen tervetulonäytöistä.';

  @override
  String get deleteAllConfirm => 'Poista kaikki';

  @override
  String get deleteAllInProgress => 'Poistetaan…';

  @override
  String get deleteAllDone => 'Kaikki tiedot poistettu';

  @override
  String get deleteAllPartial =>
      'Joitakin kohteita ei voitu poistaa. Yritä uudelleen asetuksista.';

  @override
  String get diagLogSection => 'Diagnostiikkaloki';

  @override
  String get diagLogFooter =>
      'Virheet tallennetaan vain tähän iPhoneen ilman sijainteja, yhteystietojen nimiä tai puhelinnumeroita. Mitään ei lähetetä, ellet itse jaa lokia.';

  @override
  String get diagLogShare => 'Jaa diagnostiikkaloki';

  @override
  String get diagLogEmpty => 'Tyhjä';

  @override
  String get diagLogClear => 'Tyhjennä loki';

  @override
  String get diagLogClearTitle => 'Tyhjennetäänkö diagnostiikkaloki?';

  @override
  String get diagLogClearBody =>
      'Tallennetut virhemerkinnät poistetaan tästä iPhonesta.';

  @override
  String get diagLogCleared => 'Diagnostiikkaloki tyhjennetty';

  @override
  String get diagLogShareFailed => 'Diagnostiikkalokin jakaminen epäonnistui.';

  @override
  String get privacyControls2 =>
      'Asetukset › Tietosuoja ja data › Poista kaikki tiedot poistaa kaikki tallenteet, matkat, yhteystiedot, lokit ja asetukset, jotka Corvista on tallentanut tähän iPhoneen.';

  @override
  String get parkingZoneStop => 'Seis';

  @override
  String get parkingZoneVeryClose => 'Hyvin lähellä';

  @override
  String get parkingZoneClose => 'Lähellä';

  @override
  String get parkingZoneNothingClose => 'Ei havaittu mitään lähellä';

  @override
  String get parkingNotDetected =>
      'Seiniä, pilareita, tolppia ja reunakiviä ei havaita';

  @override
  String get parkingApprox => 'n.';

  @override
  String get parkingSideLeft => 'Vasen';

  @override
  String get parkingSideCenter => 'Keskellä';

  @override
  String get parkingSideRight => 'Oikea';

  @override
  String parkingObjectSide(String object, String side) {
    return '$object · $side';
  }

  @override
  String get parkingFrontOnly => 'Vain etukameran näkymä — ei 360°-järjestelmä';

  @override
  String get parkingMuteBeeps => 'Mykistä piippaukset';

  @override
  String get parkingUnmuteBeeps => 'Ota piippaukset käyttöön';

  @override
  String get parkingAbout => 'Tietoa pysäköintinäkymästä';

  @override
  String get parkingLimitationsDetail =>
      'Vain kameran edessä oleva alue on valvonnassa. Tunnistin tunnistaa autot, bussit ja kuorma-autot, ihmiset, polkupyörät ja moottoripyörät. Seiniä, pilareita, tolppia, reunakiviä, pollareita, puomeja ja matalia esteitä EI havaita, ja konepelti voi peittää maan aivan edessä. Etäisyydet ovat karkeita arvioita yhdestä kamerasta (kohteen koko ja sijainti), ja ne voivat olla pahasti pielessä. Hiljaisuus tai ”Ei havaittu mitään lähellä” ei tarkoita, että tie on vapaa – katso aina ympärillesi ja käytä peilejä.';

  @override
  String parkingSectorsLabel(String left, String center, String right) {
    return 'Läheisyys sivuittain: vasen $left, keski $center, oikea $right';
  }

  @override
  String get privacyDiagnostics1 =>
      'Virheet kirjoitetaan yksityiseen lokiin tähän iPhoneen (ei sijainteja, yhteystietojen nimiä tai puhelinnumeroita). Sitä ei koskaan lähetetä automaattisesti; voit jakaa tai tyhjentää sen kohdassa Asetukset › Diagnostiikka.';
}
