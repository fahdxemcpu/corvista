// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SettingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class SettingRow extends DataClass implements Insertable<SettingRow> {
  final String key;
  final String value;
  const SettingRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(key: Value(key), value: Value(value));
  }

  factory SettingRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SettingRow copyWith({String? key, String? value}) =>
      SettingRow(key: key ?? this.key, value: value ?? this.value);
  SettingRow copyWithCompanion(SettingsCompanion data) {
    return SettingRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingRow &&
          other.key == this.key &&
          other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<SettingRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<SettingRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IncidentClipsTable extends IncidentClips
    with TableInfo<$IncidentClipsTable, IncidentClipRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncidentClipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnailPathMeta = const VerificationMeta(
    'thumbnailPath',
  );
  @override
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
    'thumbnail_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMsMeta = const VerificationMeta(
    'durationMs',
  );
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
    'duration_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sizeBytesMeta = const VerificationMeta(
    'sizeBytes',
  );
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
    'size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _hasAudioMeta = const VerificationMeta(
    'hasAudio',
  );
  @override
  late final GeneratedColumn<bool> hasAudio = GeneratedColumn<bool>(
    'has_audio',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_audio" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _favoriteMeta = const VerificationMeta(
    'favorite',
  );
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
    'favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('manual'),
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
    'speed',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _missingFileMeta = const VerificationMeta(
    'missingFile',
  );
  @override
  late final GeneratedColumn<bool> missingFile = GeneratedColumn<bool>(
    'missing_file',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("missing_file" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('incident'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    path,
    thumbnailPath,
    durationMs,
    width,
    height,
    sizeBytes,
    hasAudio,
    favorite,
    createdAt,
    reason,
    lat,
    lon,
    speed,
    missingFile,
    kind,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'incident_clips';
  @override
  VerificationContext validateIntegrity(
    Insertable<IncidentClipRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
        _thumbnailPathMeta,
        thumbnailPath.isAcceptableOrUnknown(
          data['thumbnail_path']!,
          _thumbnailPathMeta,
        ),
      );
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
        _durationMsMeta,
        durationMs.isAcceptableOrUnknown(data['duration_ms']!, _durationMsMeta),
      );
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('size_bytes')) {
      context.handle(
        _sizeBytesMeta,
        sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta),
      );
    }
    if (data.containsKey('has_audio')) {
      context.handle(
        _hasAudioMeta,
        hasAudio.isAcceptableOrUnknown(data['has_audio']!, _hasAudioMeta),
      );
    }
    if (data.containsKey('favorite')) {
      context.handle(
        _favoriteMeta,
        favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('lon')) {
      context.handle(
        _lonMeta,
        lon.isAcceptableOrUnknown(data['lon']!, _lonMeta),
      );
    }
    if (data.containsKey('speed')) {
      context.handle(
        _speedMeta,
        speed.isAcceptableOrUnknown(data['speed']!, _speedMeta),
      );
    }
    if (data.containsKey('missing_file')) {
      context.handle(
        _missingFileMeta,
        missingFile.isAcceptableOrUnknown(
          data['missing_file']!,
          _missingFileMeta,
        ),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncidentClipRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncidentClipRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      thumbnailPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_path'],
      ),
      durationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_ms'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      )!,
      sizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size_bytes'],
      )!,
      hasAudio: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_audio'],
      )!,
      favorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}favorite'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      lon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lon'],
      ),
      speed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speed'],
      ),
      missingFile: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}missing_file'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
    );
  }

  @override
  $IncidentClipsTable createAlias(String alias) {
    return $IncidentClipsTable(attachedDatabase, alias);
  }
}

class IncidentClipRow extends DataClass implements Insertable<IncidentClipRow> {
  final String id;
  final String title;
  final String path;
  final String? thumbnailPath;
  final int durationMs;
  final int width;
  final int height;
  final int sizeBytes;
  final bool hasAudio;
  final bool favorite;
  final DateTime createdAt;
  final String reason;
  final double? lat;
  final double? lon;
  final double? speed;
  final bool missingFile;

  /// `incident` | `manual` | `emergency` | `test` (schema v3).
  final String kind;
  const IncidentClipRow({
    required this.id,
    required this.title,
    required this.path,
    this.thumbnailPath,
    required this.durationMs,
    required this.width,
    required this.height,
    required this.sizeBytes,
    required this.hasAudio,
    required this.favorite,
    required this.createdAt,
    required this.reason,
    this.lat,
    this.lon,
    this.speed,
    required this.missingFile,
    required this.kind,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['path'] = Variable<String>(path);
    if (!nullToAbsent || thumbnailPath != null) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath);
    }
    map['duration_ms'] = Variable<int>(durationMs);
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
    map['size_bytes'] = Variable<int>(sizeBytes);
    map['has_audio'] = Variable<bool>(hasAudio);
    map['favorite'] = Variable<bool>(favorite);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['reason'] = Variable<String>(reason);
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lon != null) {
      map['lon'] = Variable<double>(lon);
    }
    if (!nullToAbsent || speed != null) {
      map['speed'] = Variable<double>(speed);
    }
    map['missing_file'] = Variable<bool>(missingFile);
    map['kind'] = Variable<String>(kind);
    return map;
  }

  IncidentClipsCompanion toCompanion(bool nullToAbsent) {
    return IncidentClipsCompanion(
      id: Value(id),
      title: Value(title),
      path: Value(path),
      thumbnailPath: thumbnailPath == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailPath),
      durationMs: Value(durationMs),
      width: Value(width),
      height: Value(height),
      sizeBytes: Value(sizeBytes),
      hasAudio: Value(hasAudio),
      favorite: Value(favorite),
      createdAt: Value(createdAt),
      reason: Value(reason),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lon: lon == null && nullToAbsent ? const Value.absent() : Value(lon),
      speed: speed == null && nullToAbsent
          ? const Value.absent()
          : Value(speed),
      missingFile: Value(missingFile),
      kind: Value(kind),
    );
  }

  factory IncidentClipRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncidentClipRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      path: serializer.fromJson<String>(json['path']),
      thumbnailPath: serializer.fromJson<String?>(json['thumbnailPath']),
      durationMs: serializer.fromJson<int>(json['durationMs']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      hasAudio: serializer.fromJson<bool>(json['hasAudio']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      reason: serializer.fromJson<String>(json['reason']),
      lat: serializer.fromJson<double?>(json['lat']),
      lon: serializer.fromJson<double?>(json['lon']),
      speed: serializer.fromJson<double?>(json['speed']),
      missingFile: serializer.fromJson<bool>(json['missingFile']),
      kind: serializer.fromJson<String>(json['kind']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'path': serializer.toJson<String>(path),
      'thumbnailPath': serializer.toJson<String?>(thumbnailPath),
      'durationMs': serializer.toJson<int>(durationMs),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'hasAudio': serializer.toJson<bool>(hasAudio),
      'favorite': serializer.toJson<bool>(favorite),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'reason': serializer.toJson<String>(reason),
      'lat': serializer.toJson<double?>(lat),
      'lon': serializer.toJson<double?>(lon),
      'speed': serializer.toJson<double?>(speed),
      'missingFile': serializer.toJson<bool>(missingFile),
      'kind': serializer.toJson<String>(kind),
    };
  }

  IncidentClipRow copyWith({
    String? id,
    String? title,
    String? path,
    Value<String?> thumbnailPath = const Value.absent(),
    int? durationMs,
    int? width,
    int? height,
    int? sizeBytes,
    bool? hasAudio,
    bool? favorite,
    DateTime? createdAt,
    String? reason,
    Value<double?> lat = const Value.absent(),
    Value<double?> lon = const Value.absent(),
    Value<double?> speed = const Value.absent(),
    bool? missingFile,
    String? kind,
  }) => IncidentClipRow(
    id: id ?? this.id,
    title: title ?? this.title,
    path: path ?? this.path,
    thumbnailPath: thumbnailPath.present
        ? thumbnailPath.value
        : this.thumbnailPath,
    durationMs: durationMs ?? this.durationMs,
    width: width ?? this.width,
    height: height ?? this.height,
    sizeBytes: sizeBytes ?? this.sizeBytes,
    hasAudio: hasAudio ?? this.hasAudio,
    favorite: favorite ?? this.favorite,
    createdAt: createdAt ?? this.createdAt,
    reason: reason ?? this.reason,
    lat: lat.present ? lat.value : this.lat,
    lon: lon.present ? lon.value : this.lon,
    speed: speed.present ? speed.value : this.speed,
    missingFile: missingFile ?? this.missingFile,
    kind: kind ?? this.kind,
  );
  IncidentClipRow copyWithCompanion(IncidentClipsCompanion data) {
    return IncidentClipRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      path: data.path.present ? data.path.value : this.path,
      thumbnailPath: data.thumbnailPath.present
          ? data.thumbnailPath.value
          : this.thumbnailPath,
      durationMs: data.durationMs.present
          ? data.durationMs.value
          : this.durationMs,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      hasAudio: data.hasAudio.present ? data.hasAudio.value : this.hasAudio,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      reason: data.reason.present ? data.reason.value : this.reason,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
      speed: data.speed.present ? data.speed.value : this.speed,
      missingFile: data.missingFile.present
          ? data.missingFile.value
          : this.missingFile,
      kind: data.kind.present ? data.kind.value : this.kind,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncidentClipRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('path: $path, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('durationMs: $durationMs, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('hasAudio: $hasAudio, ')
          ..write('favorite: $favorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('reason: $reason, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('speed: $speed, ')
          ..write('missingFile: $missingFile, ')
          ..write('kind: $kind')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    path,
    thumbnailPath,
    durationMs,
    width,
    height,
    sizeBytes,
    hasAudio,
    favorite,
    createdAt,
    reason,
    lat,
    lon,
    speed,
    missingFile,
    kind,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncidentClipRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.path == this.path &&
          other.thumbnailPath == this.thumbnailPath &&
          other.durationMs == this.durationMs &&
          other.width == this.width &&
          other.height == this.height &&
          other.sizeBytes == this.sizeBytes &&
          other.hasAudio == this.hasAudio &&
          other.favorite == this.favorite &&
          other.createdAt == this.createdAt &&
          other.reason == this.reason &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.speed == this.speed &&
          other.missingFile == this.missingFile &&
          other.kind == this.kind);
}

class IncidentClipsCompanion extends UpdateCompanion<IncidentClipRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> path;
  final Value<String?> thumbnailPath;
  final Value<int> durationMs;
  final Value<int> width;
  final Value<int> height;
  final Value<int> sizeBytes;
  final Value<bool> hasAudio;
  final Value<bool> favorite;
  final Value<DateTime> createdAt;
  final Value<String> reason;
  final Value<double?> lat;
  final Value<double?> lon;
  final Value<double?> speed;
  final Value<bool> missingFile;
  final Value<String> kind;
  final Value<int> rowid;
  const IncidentClipsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.path = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.hasAudio = const Value.absent(),
    this.favorite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.reason = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.speed = const Value.absent(),
    this.missingFile = const Value.absent(),
    this.kind = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IncidentClipsCompanion.insert({
    required String id,
    this.title = const Value.absent(),
    required String path,
    this.thumbnailPath = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.hasAudio = const Value.absent(),
    this.favorite = const Value.absent(),
    required DateTime createdAt,
    this.reason = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.speed = const Value.absent(),
    this.missingFile = const Value.absent(),
    this.kind = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       path = Value(path),
       createdAt = Value(createdAt);
  static Insertable<IncidentClipRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? path,
    Expression<String>? thumbnailPath,
    Expression<int>? durationMs,
    Expression<int>? width,
    Expression<int>? height,
    Expression<int>? sizeBytes,
    Expression<bool>? hasAudio,
    Expression<bool>? favorite,
    Expression<DateTime>? createdAt,
    Expression<String>? reason,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<double>? speed,
    Expression<bool>? missingFile,
    Expression<String>? kind,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (path != null) 'path': path,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
      if (durationMs != null) 'duration_ms': durationMs,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (hasAudio != null) 'has_audio': hasAudio,
      if (favorite != null) 'favorite': favorite,
      if (createdAt != null) 'created_at': createdAt,
      if (reason != null) 'reason': reason,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (speed != null) 'speed': speed,
      if (missingFile != null) 'missing_file': missingFile,
      if (kind != null) 'kind': kind,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IncidentClipsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? path,
    Value<String?>? thumbnailPath,
    Value<int>? durationMs,
    Value<int>? width,
    Value<int>? height,
    Value<int>? sizeBytes,
    Value<bool>? hasAudio,
    Value<bool>? favorite,
    Value<DateTime>? createdAt,
    Value<String>? reason,
    Value<double?>? lat,
    Value<double?>? lon,
    Value<double?>? speed,
    Value<bool>? missingFile,
    Value<String>? kind,
    Value<int>? rowid,
  }) {
    return IncidentClipsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      path: path ?? this.path,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      durationMs: durationMs ?? this.durationMs,
      width: width ?? this.width,
      height: height ?? this.height,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      hasAudio: hasAudio ?? this.hasAudio,
      favorite: favorite ?? this.favorite,
      createdAt: createdAt ?? this.createdAt,
      reason: reason ?? this.reason,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      speed: speed ?? this.speed,
      missingFile: missingFile ?? this.missingFile,
      kind: kind ?? this.kind,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (hasAudio.present) {
      map['has_audio'] = Variable<bool>(hasAudio.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (missingFile.present) {
      map['missing_file'] = Variable<bool>(missingFile.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncidentClipsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('path: $path, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('durationMs: $durationMs, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('hasAudio: $hasAudio, ')
          ..write('favorite: $favorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('reason: $reason, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('speed: $speed, ')
          ..write('missingFile: $missingFile, ')
          ..write('kind: $kind, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DrivingSessionsTable extends DrivingSessions
    with TableInfo<$DrivingSessionsTable, DrivingSessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DrivingSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _viewMeta = const VerificationMeta('view');
  @override
  late final GeneratedColumn<String> view = GeneratedColumn<String>(
    'view',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelIdMeta = const VerificationMeta(
    'modelId',
  );
  @override
  late final GeneratedColumn<String> modelId = GeneratedColumn<String>(
    'model_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordingProfileMeta = const VerificationMeta(
    'recordingProfile',
  );
  @override
  late final GeneratedColumn<String> recordingProfile = GeneratedColumn<String>(
    'recording_profile',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metricsJsonMeta = const VerificationMeta(
    'metricsJson',
  );
  @override
  late final GeneratedColumn<String> metricsJson = GeneratedColumn<String>(
    'metrics_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startedAt,
    endedAt,
    view,
    modelId,
    recordingProfile,
    metricsJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'driving_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DrivingSessionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('view')) {
      context.handle(
        _viewMeta,
        view.isAcceptableOrUnknown(data['view']!, _viewMeta),
      );
    } else if (isInserting) {
      context.missing(_viewMeta);
    }
    if (data.containsKey('model_id')) {
      context.handle(
        _modelIdMeta,
        modelId.isAcceptableOrUnknown(data['model_id']!, _modelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_modelIdMeta);
    }
    if (data.containsKey('recording_profile')) {
      context.handle(
        _recordingProfileMeta,
        recordingProfile.isAcceptableOrUnknown(
          data['recording_profile']!,
          _recordingProfileMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordingProfileMeta);
    }
    if (data.containsKey('metrics_json')) {
      context.handle(
        _metricsJsonMeta,
        metricsJson.isAcceptableOrUnknown(
          data['metrics_json']!,
          _metricsJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DrivingSessionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DrivingSessionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
      view: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}view'],
      )!,
      modelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_id'],
      )!,
      recordingProfile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recording_profile'],
      )!,
      metricsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metrics_json'],
      )!,
    );
  }

  @override
  $DrivingSessionsTable createAlias(String alias) {
    return $DrivingSessionsTable(attachedDatabase, alias);
  }
}

class DrivingSessionRow extends DataClass
    implements Insertable<DrivingSessionRow> {
  final String id;
  final DateTime startedAt;
  final DateTime? endedAt;
  final String view;
  final String modelId;
  final String recordingProfile;
  final String metricsJson;
  const DrivingSessionRow({
    required this.id,
    required this.startedAt,
    this.endedAt,
    required this.view,
    required this.modelId,
    required this.recordingProfile,
    required this.metricsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    map['view'] = Variable<String>(view);
    map['model_id'] = Variable<String>(modelId);
    map['recording_profile'] = Variable<String>(recordingProfile);
    map['metrics_json'] = Variable<String>(metricsJson);
    return map;
  }

  DrivingSessionsCompanion toCompanion(bool nullToAbsent) {
    return DrivingSessionsCompanion(
      id: Value(id),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      view: Value(view),
      modelId: Value(modelId),
      recordingProfile: Value(recordingProfile),
      metricsJson: Value(metricsJson),
    );
  }

  factory DrivingSessionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DrivingSessionRow(
      id: serializer.fromJson<String>(json['id']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      view: serializer.fromJson<String>(json['view']),
      modelId: serializer.fromJson<String>(json['modelId']),
      recordingProfile: serializer.fromJson<String>(json['recordingProfile']),
      metricsJson: serializer.fromJson<String>(json['metricsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'view': serializer.toJson<String>(view),
      'modelId': serializer.toJson<String>(modelId),
      'recordingProfile': serializer.toJson<String>(recordingProfile),
      'metricsJson': serializer.toJson<String>(metricsJson),
    };
  }

  DrivingSessionRow copyWith({
    String? id,
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
    String? view,
    String? modelId,
    String? recordingProfile,
    String? metricsJson,
  }) => DrivingSessionRow(
    id: id ?? this.id,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    view: view ?? this.view,
    modelId: modelId ?? this.modelId,
    recordingProfile: recordingProfile ?? this.recordingProfile,
    metricsJson: metricsJson ?? this.metricsJson,
  );
  DrivingSessionRow copyWithCompanion(DrivingSessionsCompanion data) {
    return DrivingSessionRow(
      id: data.id.present ? data.id.value : this.id,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      view: data.view.present ? data.view.value : this.view,
      modelId: data.modelId.present ? data.modelId.value : this.modelId,
      recordingProfile: data.recordingProfile.present
          ? data.recordingProfile.value
          : this.recordingProfile,
      metricsJson: data.metricsJson.present
          ? data.metricsJson.value
          : this.metricsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DrivingSessionRow(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('view: $view, ')
          ..write('modelId: $modelId, ')
          ..write('recordingProfile: $recordingProfile, ')
          ..write('metricsJson: $metricsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    startedAt,
    endedAt,
    view,
    modelId,
    recordingProfile,
    metricsJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DrivingSessionRow &&
          other.id == this.id &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.view == this.view &&
          other.modelId == this.modelId &&
          other.recordingProfile == this.recordingProfile &&
          other.metricsJson == this.metricsJson);
}

class DrivingSessionsCompanion extends UpdateCompanion<DrivingSessionRow> {
  final Value<String> id;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<String> view;
  final Value<String> modelId;
  final Value<String> recordingProfile;
  final Value<String> metricsJson;
  final Value<int> rowid;
  const DrivingSessionsCompanion({
    this.id = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.view = const Value.absent(),
    this.modelId = const Value.absent(),
    this.recordingProfile = const Value.absent(),
    this.metricsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DrivingSessionsCompanion.insert({
    required String id,
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    required String view,
    required String modelId,
    required String recordingProfile,
    this.metricsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       startedAt = Value(startedAt),
       view = Value(view),
       modelId = Value(modelId),
       recordingProfile = Value(recordingProfile);
  static Insertable<DrivingSessionRow> custom({
    Expression<String>? id,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<String>? view,
    Expression<String>? modelId,
    Expression<String>? recordingProfile,
    Expression<String>? metricsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (view != null) 'view': view,
      if (modelId != null) 'model_id': modelId,
      if (recordingProfile != null) 'recording_profile': recordingProfile,
      if (metricsJson != null) 'metrics_json': metricsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DrivingSessionsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
    Value<String>? view,
    Value<String>? modelId,
    Value<String>? recordingProfile,
    Value<String>? metricsJson,
    Value<int>? rowid,
  }) {
    return DrivingSessionsCompanion(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      view: view ?? this.view,
      modelId: modelId ?? this.modelId,
      recordingProfile: recordingProfile ?? this.recordingProfile,
      metricsJson: metricsJson ?? this.metricsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (view.present) {
      map['view'] = Variable<String>(view.value);
    }
    if (modelId.present) {
      map['model_id'] = Variable<String>(modelId.value);
    }
    if (recordingProfile.present) {
      map['recording_profile'] = Variable<String>(recordingProfile.value);
    }
    if (metricsJson.present) {
      map['metrics_json'] = Variable<String>(metricsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DrivingSessionsCompanion(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('view: $view, ')
          ..write('modelId: $modelId, ')
          ..write('recordingProfile: $recordingProfile, ')
          ..write('metricsJson: $metricsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EmergencyEventsTable extends EmergencyEvents
    with TableInfo<$EmergencyEventsTable, EmergencyEventRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmergencyEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _triggeredAtMeta = const VerificationMeta(
    'triggeredAt',
  );
  @override
  late final GeneratedColumn<DateTime> triggeredAt = GeneratedColumn<DateTime>(
    'triggered_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _evidenceJsonMeta = const VerificationMeta(
    'evidenceJson',
  );
  @override
  late final GeneratedColumn<String> evidenceJson = GeneratedColumn<String>(
    'evidence_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cancelledMeta = const VerificationMeta(
    'cancelled',
  );
  @override
  late final GeneratedColumn<bool> cancelled = GeneratedColumn<bool>(
    'cancelled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("cancelled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cancelledByMeta = const VerificationMeta(
    'cancelledBy',
  );
  @override
  late final GeneratedColumn<String> cancelledBy = GeneratedColumn<String>(
    'cancelled_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clipIdMeta = const VerificationMeta('clipId');
  @override
  late final GeneratedColumn<String> clipId = GeneratedColumn<String>(
    'clip_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionsJsonMeta = const VerificationMeta(
    'actionsJson',
  );
  @override
  late final GeneratedColumn<String> actionsJson = GeneratedColumn<String>(
    'actions_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    triggeredAt,
    evidenceJson,
    cancelled,
    cancelledBy,
    clipId,
    lat,
    lon,
    actionsJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'emergency_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmergencyEventRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('triggered_at')) {
      context.handle(
        _triggeredAtMeta,
        triggeredAt.isAcceptableOrUnknown(
          data['triggered_at']!,
          _triggeredAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_triggeredAtMeta);
    }
    if (data.containsKey('evidence_json')) {
      context.handle(
        _evidenceJsonMeta,
        evidenceJson.isAcceptableOrUnknown(
          data['evidence_json']!,
          _evidenceJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_evidenceJsonMeta);
    }
    if (data.containsKey('cancelled')) {
      context.handle(
        _cancelledMeta,
        cancelled.isAcceptableOrUnknown(data['cancelled']!, _cancelledMeta),
      );
    }
    if (data.containsKey('cancelled_by')) {
      context.handle(
        _cancelledByMeta,
        cancelledBy.isAcceptableOrUnknown(
          data['cancelled_by']!,
          _cancelledByMeta,
        ),
      );
    }
    if (data.containsKey('clip_id')) {
      context.handle(
        _clipIdMeta,
        clipId.isAcceptableOrUnknown(data['clip_id']!, _clipIdMeta),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('lon')) {
      context.handle(
        _lonMeta,
        lon.isAcceptableOrUnknown(data['lon']!, _lonMeta),
      );
    }
    if (data.containsKey('actions_json')) {
      context.handle(
        _actionsJsonMeta,
        actionsJson.isAcceptableOrUnknown(
          data['actions_json']!,
          _actionsJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmergencyEventRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmergencyEventRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      triggeredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}triggered_at'],
      )!,
      evidenceJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evidence_json'],
      )!,
      cancelled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}cancelled'],
      )!,
      cancelledBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cancelled_by'],
      ),
      clipId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}clip_id'],
      ),
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      lon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lon'],
      ),
      actionsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}actions_json'],
      )!,
    );
  }

  @override
  $EmergencyEventsTable createAlias(String alias) {
    return $EmergencyEventsTable(attachedDatabase, alias);
  }
}

class EmergencyEventRow extends DataClass
    implements Insertable<EmergencyEventRow> {
  final String id;
  final DateTime triggeredAt;
  final String evidenceJson;
  final bool cancelled;
  final String? cancelledBy;
  final String? clipId;
  final double? lat;
  final double? lon;
  final String actionsJson;
  const EmergencyEventRow({
    required this.id,
    required this.triggeredAt,
    required this.evidenceJson,
    required this.cancelled,
    this.cancelledBy,
    this.clipId,
    this.lat,
    this.lon,
    required this.actionsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['triggered_at'] = Variable<DateTime>(triggeredAt);
    map['evidence_json'] = Variable<String>(evidenceJson);
    map['cancelled'] = Variable<bool>(cancelled);
    if (!nullToAbsent || cancelledBy != null) {
      map['cancelled_by'] = Variable<String>(cancelledBy);
    }
    if (!nullToAbsent || clipId != null) {
      map['clip_id'] = Variable<String>(clipId);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lon != null) {
      map['lon'] = Variable<double>(lon);
    }
    map['actions_json'] = Variable<String>(actionsJson);
    return map;
  }

  EmergencyEventsCompanion toCompanion(bool nullToAbsent) {
    return EmergencyEventsCompanion(
      id: Value(id),
      triggeredAt: Value(triggeredAt),
      evidenceJson: Value(evidenceJson),
      cancelled: Value(cancelled),
      cancelledBy: cancelledBy == null && nullToAbsent
          ? const Value.absent()
          : Value(cancelledBy),
      clipId: clipId == null && nullToAbsent
          ? const Value.absent()
          : Value(clipId),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lon: lon == null && nullToAbsent ? const Value.absent() : Value(lon),
      actionsJson: Value(actionsJson),
    );
  }

  factory EmergencyEventRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmergencyEventRow(
      id: serializer.fromJson<String>(json['id']),
      triggeredAt: serializer.fromJson<DateTime>(json['triggeredAt']),
      evidenceJson: serializer.fromJson<String>(json['evidenceJson']),
      cancelled: serializer.fromJson<bool>(json['cancelled']),
      cancelledBy: serializer.fromJson<String?>(json['cancelledBy']),
      clipId: serializer.fromJson<String?>(json['clipId']),
      lat: serializer.fromJson<double?>(json['lat']),
      lon: serializer.fromJson<double?>(json['lon']),
      actionsJson: serializer.fromJson<String>(json['actionsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'triggeredAt': serializer.toJson<DateTime>(triggeredAt),
      'evidenceJson': serializer.toJson<String>(evidenceJson),
      'cancelled': serializer.toJson<bool>(cancelled),
      'cancelledBy': serializer.toJson<String?>(cancelledBy),
      'clipId': serializer.toJson<String?>(clipId),
      'lat': serializer.toJson<double?>(lat),
      'lon': serializer.toJson<double?>(lon),
      'actionsJson': serializer.toJson<String>(actionsJson),
    };
  }

  EmergencyEventRow copyWith({
    String? id,
    DateTime? triggeredAt,
    String? evidenceJson,
    bool? cancelled,
    Value<String?> cancelledBy = const Value.absent(),
    Value<String?> clipId = const Value.absent(),
    Value<double?> lat = const Value.absent(),
    Value<double?> lon = const Value.absent(),
    String? actionsJson,
  }) => EmergencyEventRow(
    id: id ?? this.id,
    triggeredAt: triggeredAt ?? this.triggeredAt,
    evidenceJson: evidenceJson ?? this.evidenceJson,
    cancelled: cancelled ?? this.cancelled,
    cancelledBy: cancelledBy.present ? cancelledBy.value : this.cancelledBy,
    clipId: clipId.present ? clipId.value : this.clipId,
    lat: lat.present ? lat.value : this.lat,
    lon: lon.present ? lon.value : this.lon,
    actionsJson: actionsJson ?? this.actionsJson,
  );
  EmergencyEventRow copyWithCompanion(EmergencyEventsCompanion data) {
    return EmergencyEventRow(
      id: data.id.present ? data.id.value : this.id,
      triggeredAt: data.triggeredAt.present
          ? data.triggeredAt.value
          : this.triggeredAt,
      evidenceJson: data.evidenceJson.present
          ? data.evidenceJson.value
          : this.evidenceJson,
      cancelled: data.cancelled.present ? data.cancelled.value : this.cancelled,
      cancelledBy: data.cancelledBy.present
          ? data.cancelledBy.value
          : this.cancelledBy,
      clipId: data.clipId.present ? data.clipId.value : this.clipId,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
      actionsJson: data.actionsJson.present
          ? data.actionsJson.value
          : this.actionsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmergencyEventRow(')
          ..write('id: $id, ')
          ..write('triggeredAt: $triggeredAt, ')
          ..write('evidenceJson: $evidenceJson, ')
          ..write('cancelled: $cancelled, ')
          ..write('cancelledBy: $cancelledBy, ')
          ..write('clipId: $clipId, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('actionsJson: $actionsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    triggeredAt,
    evidenceJson,
    cancelled,
    cancelledBy,
    clipId,
    lat,
    lon,
    actionsJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmergencyEventRow &&
          other.id == this.id &&
          other.triggeredAt == this.triggeredAt &&
          other.evidenceJson == this.evidenceJson &&
          other.cancelled == this.cancelled &&
          other.cancelledBy == this.cancelledBy &&
          other.clipId == this.clipId &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.actionsJson == this.actionsJson);
}

class EmergencyEventsCompanion extends UpdateCompanion<EmergencyEventRow> {
  final Value<String> id;
  final Value<DateTime> triggeredAt;
  final Value<String> evidenceJson;
  final Value<bool> cancelled;
  final Value<String?> cancelledBy;
  final Value<String?> clipId;
  final Value<double?> lat;
  final Value<double?> lon;
  final Value<String> actionsJson;
  final Value<int> rowid;
  const EmergencyEventsCompanion({
    this.id = const Value.absent(),
    this.triggeredAt = const Value.absent(),
    this.evidenceJson = const Value.absent(),
    this.cancelled = const Value.absent(),
    this.cancelledBy = const Value.absent(),
    this.clipId = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.actionsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EmergencyEventsCompanion.insert({
    required String id,
    required DateTime triggeredAt,
    required String evidenceJson,
    this.cancelled = const Value.absent(),
    this.cancelledBy = const Value.absent(),
    this.clipId = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.actionsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       triggeredAt = Value(triggeredAt),
       evidenceJson = Value(evidenceJson);
  static Insertable<EmergencyEventRow> custom({
    Expression<String>? id,
    Expression<DateTime>? triggeredAt,
    Expression<String>? evidenceJson,
    Expression<bool>? cancelled,
    Expression<String>? cancelledBy,
    Expression<String>? clipId,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<String>? actionsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (triggeredAt != null) 'triggered_at': triggeredAt,
      if (evidenceJson != null) 'evidence_json': evidenceJson,
      if (cancelled != null) 'cancelled': cancelled,
      if (cancelledBy != null) 'cancelled_by': cancelledBy,
      if (clipId != null) 'clip_id': clipId,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (actionsJson != null) 'actions_json': actionsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EmergencyEventsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? triggeredAt,
    Value<String>? evidenceJson,
    Value<bool>? cancelled,
    Value<String?>? cancelledBy,
    Value<String?>? clipId,
    Value<double?>? lat,
    Value<double?>? lon,
    Value<String>? actionsJson,
    Value<int>? rowid,
  }) {
    return EmergencyEventsCompanion(
      id: id ?? this.id,
      triggeredAt: triggeredAt ?? this.triggeredAt,
      evidenceJson: evidenceJson ?? this.evidenceJson,
      cancelled: cancelled ?? this.cancelled,
      cancelledBy: cancelledBy ?? this.cancelledBy,
      clipId: clipId ?? this.clipId,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      actionsJson: actionsJson ?? this.actionsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (triggeredAt.present) {
      map['triggered_at'] = Variable<DateTime>(triggeredAt.value);
    }
    if (evidenceJson.present) {
      map['evidence_json'] = Variable<String>(evidenceJson.value);
    }
    if (cancelled.present) {
      map['cancelled'] = Variable<bool>(cancelled.value);
    }
    if (cancelledBy.present) {
      map['cancelled_by'] = Variable<String>(cancelledBy.value);
    }
    if (clipId.present) {
      map['clip_id'] = Variable<String>(clipId.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (actionsJson.present) {
      map['actions_json'] = Variable<String>(actionsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmergencyEventsCompanion(')
          ..write('id: $id, ')
          ..write('triggeredAt: $triggeredAt, ')
          ..write('evidenceJson: $evidenceJson, ')
          ..write('cancelled: $cancelled, ')
          ..write('cancelledBy: $cancelledBy, ')
          ..write('clipId: $clipId, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('actionsJson: $actionsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AiModelsTable extends AiModels
    with TableInfo<$AiModelsTable, AiModelRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _labelsJsonMeta = const VerificationMeta(
    'labelsJson',
  );
  @override
  late final GeneratedColumn<String> labelsJson = GeneratedColumn<String>(
    'labels_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _viewsJsonMeta = const VerificationMeta(
    'viewsJson',
  );
  @override
  late final GeneratedColumn<String> viewsJson = GeneratedColumn<String>(
    'views_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _licenseMeta = const VerificationMeta(
    'license',
  );
  @override
  late final GeneratedColumn<String> license = GeneratedColumn<String>(
    'license',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _perfJsonMeta = const VerificationMeta(
    'perfJson',
  );
  @override
  late final GeneratedColumn<String> perfJson = GeneratedColumn<String>(
    'perf_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    version,
    fileName,
    labelsJson,
    viewsJson,
    license,
    perfJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_models';
  @override
  VerificationContext validateIntegrity(
    Insertable<AiModelRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    }
    if (data.containsKey('labels_json')) {
      context.handle(
        _labelsJsonMeta,
        labelsJson.isAcceptableOrUnknown(data['labels_json']!, _labelsJsonMeta),
      );
    }
    if (data.containsKey('views_json')) {
      context.handle(
        _viewsJsonMeta,
        viewsJson.isAcceptableOrUnknown(data['views_json']!, _viewsJsonMeta),
      );
    }
    if (data.containsKey('license')) {
      context.handle(
        _licenseMeta,
        license.isAcceptableOrUnknown(data['license']!, _licenseMeta),
      );
    }
    if (data.containsKey('perf_json')) {
      context.handle(
        _perfJsonMeta,
        perfJson.isAcceptableOrUnknown(data['perf_json']!, _perfJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AiModelRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiModelRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      labelsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}labels_json'],
      )!,
      viewsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}views_json'],
      )!,
      license: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}license'],
      )!,
      perfJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}perf_json'],
      )!,
    );
  }

  @override
  $AiModelsTable createAlias(String alias) {
    return $AiModelsTable(attachedDatabase, alias);
  }
}

class AiModelRow extends DataClass implements Insertable<AiModelRow> {
  final String id;
  final String name;
  final String version;
  final String fileName;
  final String labelsJson;
  final String viewsJson;
  final String license;
  final String perfJson;
  const AiModelRow({
    required this.id,
    required this.name,
    required this.version,
    required this.fileName,
    required this.labelsJson,
    required this.viewsJson,
    required this.license,
    required this.perfJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['version'] = Variable<String>(version);
    map['file_name'] = Variable<String>(fileName);
    map['labels_json'] = Variable<String>(labelsJson);
    map['views_json'] = Variable<String>(viewsJson);
    map['license'] = Variable<String>(license);
    map['perf_json'] = Variable<String>(perfJson);
    return map;
  }

  AiModelsCompanion toCompanion(bool nullToAbsent) {
    return AiModelsCompanion(
      id: Value(id),
      name: Value(name),
      version: Value(version),
      fileName: Value(fileName),
      labelsJson: Value(labelsJson),
      viewsJson: Value(viewsJson),
      license: Value(license),
      perfJson: Value(perfJson),
    );
  }

  factory AiModelRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiModelRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      version: serializer.fromJson<String>(json['version']),
      fileName: serializer.fromJson<String>(json['fileName']),
      labelsJson: serializer.fromJson<String>(json['labelsJson']),
      viewsJson: serializer.fromJson<String>(json['viewsJson']),
      license: serializer.fromJson<String>(json['license']),
      perfJson: serializer.fromJson<String>(json['perfJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'version': serializer.toJson<String>(version),
      'fileName': serializer.toJson<String>(fileName),
      'labelsJson': serializer.toJson<String>(labelsJson),
      'viewsJson': serializer.toJson<String>(viewsJson),
      'license': serializer.toJson<String>(license),
      'perfJson': serializer.toJson<String>(perfJson),
    };
  }

  AiModelRow copyWith({
    String? id,
    String? name,
    String? version,
    String? fileName,
    String? labelsJson,
    String? viewsJson,
    String? license,
    String? perfJson,
  }) => AiModelRow(
    id: id ?? this.id,
    name: name ?? this.name,
    version: version ?? this.version,
    fileName: fileName ?? this.fileName,
    labelsJson: labelsJson ?? this.labelsJson,
    viewsJson: viewsJson ?? this.viewsJson,
    license: license ?? this.license,
    perfJson: perfJson ?? this.perfJson,
  );
  AiModelRow copyWithCompanion(AiModelsCompanion data) {
    return AiModelRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      version: data.version.present ? data.version.value : this.version,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      labelsJson: data.labelsJson.present
          ? data.labelsJson.value
          : this.labelsJson,
      viewsJson: data.viewsJson.present ? data.viewsJson.value : this.viewsJson,
      license: data.license.present ? data.license.value : this.license,
      perfJson: data.perfJson.present ? data.perfJson.value : this.perfJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiModelRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('version: $version, ')
          ..write('fileName: $fileName, ')
          ..write('labelsJson: $labelsJson, ')
          ..write('viewsJson: $viewsJson, ')
          ..write('license: $license, ')
          ..write('perfJson: $perfJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    version,
    fileName,
    labelsJson,
    viewsJson,
    license,
    perfJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiModelRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.version == this.version &&
          other.fileName == this.fileName &&
          other.labelsJson == this.labelsJson &&
          other.viewsJson == this.viewsJson &&
          other.license == this.license &&
          other.perfJson == this.perfJson);
}

class AiModelsCompanion extends UpdateCompanion<AiModelRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> version;
  final Value<String> fileName;
  final Value<String> labelsJson;
  final Value<String> viewsJson;
  final Value<String> license;
  final Value<String> perfJson;
  final Value<int> rowid;
  const AiModelsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.version = const Value.absent(),
    this.fileName = const Value.absent(),
    this.labelsJson = const Value.absent(),
    this.viewsJson = const Value.absent(),
    this.license = const Value.absent(),
    this.perfJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AiModelsCompanion.insert({
    required String id,
    required String name,
    this.version = const Value.absent(),
    this.fileName = const Value.absent(),
    this.labelsJson = const Value.absent(),
    this.viewsJson = const Value.absent(),
    this.license = const Value.absent(),
    this.perfJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<AiModelRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? version,
    Expression<String>? fileName,
    Expression<String>? labelsJson,
    Expression<String>? viewsJson,
    Expression<String>? license,
    Expression<String>? perfJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (version != null) 'version': version,
      if (fileName != null) 'file_name': fileName,
      if (labelsJson != null) 'labels_json': labelsJson,
      if (viewsJson != null) 'views_json': viewsJson,
      if (license != null) 'license': license,
      if (perfJson != null) 'perf_json': perfJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AiModelsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? version,
    Value<String>? fileName,
    Value<String>? labelsJson,
    Value<String>? viewsJson,
    Value<String>? license,
    Value<String>? perfJson,
    Value<int>? rowid,
  }) {
    return AiModelsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      version: version ?? this.version,
      fileName: fileName ?? this.fileName,
      labelsJson: labelsJson ?? this.labelsJson,
      viewsJson: viewsJson ?? this.viewsJson,
      license: license ?? this.license,
      perfJson: perfJson ?? this.perfJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (labelsJson.present) {
      map['labels_json'] = Variable<String>(labelsJson.value);
    }
    if (viewsJson.present) {
      map['views_json'] = Variable<String>(viewsJson.value);
    }
    if (license.present) {
      map['license'] = Variable<String>(license.value);
    }
    if (perfJson.present) {
      map['perf_json'] = Variable<String>(perfJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AiModelsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('version: $version, ')
          ..write('fileName: $fileName, ')
          ..write('labelsJson: $labelsJson, ')
          ..write('viewsJson: $viewsJson, ')
          ..write('license: $license, ')
          ..write('perfJson: $perfJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DetectionsTable extends Detections
    with TableInfo<$DetectionsTable, DetectionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<double> ts = GeneratedColumn<double>(
    'ts',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clsMeta = const VerificationMeta('cls');
  @override
  late final GeneratedColumn<int> cls = GeneratedColumn<int>(
    'cls',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confMeta = const VerificationMeta('conf');
  @override
  late final GeneratedColumn<double> conf = GeneratedColumn<double>(
    'conf',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<double> x = GeneratedColumn<double>(
    'x',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<double> y = GeneratedColumn<double>(
    'y',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wMeta = const VerificationMeta('w');
  @override
  late final GeneratedColumn<double> w = GeneratedColumn<double>(
    'w',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hMeta = const VerificationMeta('h');
  @override
  late final GeneratedColumn<double> h = GeneratedColumn<double>(
    'h',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trackIdMeta = const VerificationMeta(
    'trackId',
  );
  @override
  late final GeneratedColumn<int> trackId = GeneratedColumn<int>(
    'track_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rangeMMeta = const VerificationMeta('rangeM');
  @override
  late final GeneratedColumn<double> rangeM = GeneratedColumn<double>(
    'range_m',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bearingMeta = const VerificationMeta(
    'bearing',
  );
  @override
  late final GeneratedColumn<double> bearing = GeneratedColumn<double>(
    'bearing',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modelIdMeta = const VerificationMeta(
    'modelId',
  );
  @override
  late final GeneratedColumn<String> modelId = GeneratedColumn<String>(
    'model_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ts,
    cls,
    conf,
    x,
    y,
    w,
    h,
    trackId,
    rangeM,
    bearing,
    modelId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'detections';
  @override
  VerificationContext validateIntegrity(
    Insertable<DetectionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('cls')) {
      context.handle(
        _clsMeta,
        cls.isAcceptableOrUnknown(data['cls']!, _clsMeta),
      );
    } else if (isInserting) {
      context.missing(_clsMeta);
    }
    if (data.containsKey('conf')) {
      context.handle(
        _confMeta,
        conf.isAcceptableOrUnknown(data['conf']!, _confMeta),
      );
    } else if (isInserting) {
      context.missing(_confMeta);
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('w')) {
      context.handle(_wMeta, w.isAcceptableOrUnknown(data['w']!, _wMeta));
    } else if (isInserting) {
      context.missing(_wMeta);
    }
    if (data.containsKey('h')) {
      context.handle(_hMeta, h.isAcceptableOrUnknown(data['h']!, _hMeta));
    } else if (isInserting) {
      context.missing(_hMeta);
    }
    if (data.containsKey('track_id')) {
      context.handle(
        _trackIdMeta,
        trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta),
      );
    }
    if (data.containsKey('range_m')) {
      context.handle(
        _rangeMMeta,
        rangeM.isAcceptableOrUnknown(data['range_m']!, _rangeMMeta),
      );
    }
    if (data.containsKey('bearing')) {
      context.handle(
        _bearingMeta,
        bearing.isAcceptableOrUnknown(data['bearing']!, _bearingMeta),
      );
    }
    if (data.containsKey('model_id')) {
      context.handle(
        _modelIdMeta,
        modelId.isAcceptableOrUnknown(data['model_id']!, _modelIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DetectionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DetectionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ts: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ts'],
      )!,
      cls: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cls'],
      )!,
      conf: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}conf'],
      )!,
      x: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}x'],
      )!,
      y: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}y'],
      )!,
      w: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}w'],
      )!,
      h: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}h'],
      )!,
      trackId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}track_id'],
      ),
      rangeM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}range_m'],
      ),
      bearing: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bearing'],
      ),
      modelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_id'],
      )!,
    );
  }

  @override
  $DetectionsTable createAlias(String alias) {
    return $DetectionsTable(attachedDatabase, alias);
  }
}

class DetectionRow extends DataClass implements Insertable<DetectionRow> {
  final int id;
  final double ts;
  final int cls;
  final double conf;
  final double x;
  final double y;
  final double w;
  final double h;
  final int? trackId;
  final double? rangeM;
  final double? bearing;
  final String modelId;
  const DetectionRow({
    required this.id,
    required this.ts,
    required this.cls,
    required this.conf,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
    this.trackId,
    this.rangeM,
    this.bearing,
    required this.modelId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ts'] = Variable<double>(ts);
    map['cls'] = Variable<int>(cls);
    map['conf'] = Variable<double>(conf);
    map['x'] = Variable<double>(x);
    map['y'] = Variable<double>(y);
    map['w'] = Variable<double>(w);
    map['h'] = Variable<double>(h);
    if (!nullToAbsent || trackId != null) {
      map['track_id'] = Variable<int>(trackId);
    }
    if (!nullToAbsent || rangeM != null) {
      map['range_m'] = Variable<double>(rangeM);
    }
    if (!nullToAbsent || bearing != null) {
      map['bearing'] = Variable<double>(bearing);
    }
    map['model_id'] = Variable<String>(modelId);
    return map;
  }

  DetectionsCompanion toCompanion(bool nullToAbsent) {
    return DetectionsCompanion(
      id: Value(id),
      ts: Value(ts),
      cls: Value(cls),
      conf: Value(conf),
      x: Value(x),
      y: Value(y),
      w: Value(w),
      h: Value(h),
      trackId: trackId == null && nullToAbsent
          ? const Value.absent()
          : Value(trackId),
      rangeM: rangeM == null && nullToAbsent
          ? const Value.absent()
          : Value(rangeM),
      bearing: bearing == null && nullToAbsent
          ? const Value.absent()
          : Value(bearing),
      modelId: Value(modelId),
    );
  }

  factory DetectionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetectionRow(
      id: serializer.fromJson<int>(json['id']),
      ts: serializer.fromJson<double>(json['ts']),
      cls: serializer.fromJson<int>(json['cls']),
      conf: serializer.fromJson<double>(json['conf']),
      x: serializer.fromJson<double>(json['x']),
      y: serializer.fromJson<double>(json['y']),
      w: serializer.fromJson<double>(json['w']),
      h: serializer.fromJson<double>(json['h']),
      trackId: serializer.fromJson<int?>(json['trackId']),
      rangeM: serializer.fromJson<double?>(json['rangeM']),
      bearing: serializer.fromJson<double?>(json['bearing']),
      modelId: serializer.fromJson<String>(json['modelId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ts': serializer.toJson<double>(ts),
      'cls': serializer.toJson<int>(cls),
      'conf': serializer.toJson<double>(conf),
      'x': serializer.toJson<double>(x),
      'y': serializer.toJson<double>(y),
      'w': serializer.toJson<double>(w),
      'h': serializer.toJson<double>(h),
      'trackId': serializer.toJson<int?>(trackId),
      'rangeM': serializer.toJson<double?>(rangeM),
      'bearing': serializer.toJson<double?>(bearing),
      'modelId': serializer.toJson<String>(modelId),
    };
  }

  DetectionRow copyWith({
    int? id,
    double? ts,
    int? cls,
    double? conf,
    double? x,
    double? y,
    double? w,
    double? h,
    Value<int?> trackId = const Value.absent(),
    Value<double?> rangeM = const Value.absent(),
    Value<double?> bearing = const Value.absent(),
    String? modelId,
  }) => DetectionRow(
    id: id ?? this.id,
    ts: ts ?? this.ts,
    cls: cls ?? this.cls,
    conf: conf ?? this.conf,
    x: x ?? this.x,
    y: y ?? this.y,
    w: w ?? this.w,
    h: h ?? this.h,
    trackId: trackId.present ? trackId.value : this.trackId,
    rangeM: rangeM.present ? rangeM.value : this.rangeM,
    bearing: bearing.present ? bearing.value : this.bearing,
    modelId: modelId ?? this.modelId,
  );
  DetectionRow copyWithCompanion(DetectionsCompanion data) {
    return DetectionRow(
      id: data.id.present ? data.id.value : this.id,
      ts: data.ts.present ? data.ts.value : this.ts,
      cls: data.cls.present ? data.cls.value : this.cls,
      conf: data.conf.present ? data.conf.value : this.conf,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
      w: data.w.present ? data.w.value : this.w,
      h: data.h.present ? data.h.value : this.h,
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      rangeM: data.rangeM.present ? data.rangeM.value : this.rangeM,
      bearing: data.bearing.present ? data.bearing.value : this.bearing,
      modelId: data.modelId.present ? data.modelId.value : this.modelId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DetectionRow(')
          ..write('id: $id, ')
          ..write('ts: $ts, ')
          ..write('cls: $cls, ')
          ..write('conf: $conf, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('w: $w, ')
          ..write('h: $h, ')
          ..write('trackId: $trackId, ')
          ..write('rangeM: $rangeM, ')
          ..write('bearing: $bearing, ')
          ..write('modelId: $modelId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ts,
    cls,
    conf,
    x,
    y,
    w,
    h,
    trackId,
    rangeM,
    bearing,
    modelId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetectionRow &&
          other.id == this.id &&
          other.ts == this.ts &&
          other.cls == this.cls &&
          other.conf == this.conf &&
          other.x == this.x &&
          other.y == this.y &&
          other.w == this.w &&
          other.h == this.h &&
          other.trackId == this.trackId &&
          other.rangeM == this.rangeM &&
          other.bearing == this.bearing &&
          other.modelId == this.modelId);
}

class DetectionsCompanion extends UpdateCompanion<DetectionRow> {
  final Value<int> id;
  final Value<double> ts;
  final Value<int> cls;
  final Value<double> conf;
  final Value<double> x;
  final Value<double> y;
  final Value<double> w;
  final Value<double> h;
  final Value<int?> trackId;
  final Value<double?> rangeM;
  final Value<double?> bearing;
  final Value<String> modelId;
  const DetectionsCompanion({
    this.id = const Value.absent(),
    this.ts = const Value.absent(),
    this.cls = const Value.absent(),
    this.conf = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.w = const Value.absent(),
    this.h = const Value.absent(),
    this.trackId = const Value.absent(),
    this.rangeM = const Value.absent(),
    this.bearing = const Value.absent(),
    this.modelId = const Value.absent(),
  });
  DetectionsCompanion.insert({
    this.id = const Value.absent(),
    required double ts,
    required int cls,
    required double conf,
    required double x,
    required double y,
    required double w,
    required double h,
    this.trackId = const Value.absent(),
    this.rangeM = const Value.absent(),
    this.bearing = const Value.absent(),
    this.modelId = const Value.absent(),
  }) : ts = Value(ts),
       cls = Value(cls),
       conf = Value(conf),
       x = Value(x),
       y = Value(y),
       w = Value(w),
       h = Value(h);
  static Insertable<DetectionRow> custom({
    Expression<int>? id,
    Expression<double>? ts,
    Expression<int>? cls,
    Expression<double>? conf,
    Expression<double>? x,
    Expression<double>? y,
    Expression<double>? w,
    Expression<double>? h,
    Expression<int>? trackId,
    Expression<double>? rangeM,
    Expression<double>? bearing,
    Expression<String>? modelId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ts != null) 'ts': ts,
      if (cls != null) 'cls': cls,
      if (conf != null) 'conf': conf,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (w != null) 'w': w,
      if (h != null) 'h': h,
      if (trackId != null) 'track_id': trackId,
      if (rangeM != null) 'range_m': rangeM,
      if (bearing != null) 'bearing': bearing,
      if (modelId != null) 'model_id': modelId,
    });
  }

  DetectionsCompanion copyWith({
    Value<int>? id,
    Value<double>? ts,
    Value<int>? cls,
    Value<double>? conf,
    Value<double>? x,
    Value<double>? y,
    Value<double>? w,
    Value<double>? h,
    Value<int?>? trackId,
    Value<double?>? rangeM,
    Value<double?>? bearing,
    Value<String>? modelId,
  }) {
    return DetectionsCompanion(
      id: id ?? this.id,
      ts: ts ?? this.ts,
      cls: cls ?? this.cls,
      conf: conf ?? this.conf,
      x: x ?? this.x,
      y: y ?? this.y,
      w: w ?? this.w,
      h: h ?? this.h,
      trackId: trackId ?? this.trackId,
      rangeM: rangeM ?? this.rangeM,
      bearing: bearing ?? this.bearing,
      modelId: modelId ?? this.modelId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ts.present) {
      map['ts'] = Variable<double>(ts.value);
    }
    if (cls.present) {
      map['cls'] = Variable<int>(cls.value);
    }
    if (conf.present) {
      map['conf'] = Variable<double>(conf.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    if (w.present) {
      map['w'] = Variable<double>(w.value);
    }
    if (h.present) {
      map['h'] = Variable<double>(h.value);
    }
    if (trackId.present) {
      map['track_id'] = Variable<int>(trackId.value);
    }
    if (rangeM.present) {
      map['range_m'] = Variable<double>(rangeM.value);
    }
    if (bearing.present) {
      map['bearing'] = Variable<double>(bearing.value);
    }
    if (modelId.present) {
      map['model_id'] = Variable<String>(modelId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetectionsCompanion(')
          ..write('id: $id, ')
          ..write('ts: $ts, ')
          ..write('cls: $cls, ')
          ..write('conf: $conf, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('w: $w, ')
          ..write('h: $h, ')
          ..write('trackId: $trackId, ')
          ..write('rangeM: $rangeM, ')
          ..write('bearing: $bearing, ')
          ..write('modelId: $modelId')
          ..write(')'))
        .toString();
  }
}

class $TripsTable extends Trips with TableInfo<$TripsTable, TripRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distanceMMeta = const VerificationMeta(
    'distanceM',
  );
  @override
  late final GeneratedColumn<double> distanceM = GeneratedColumn<double>(
    'distance_m',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _movingTimeSMeta = const VerificationMeta(
    'movingTimeS',
  );
  @override
  late final GeneratedColumn<double> movingTimeS = GeneratedColumn<double>(
    'moving_time_s',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _avgSpeedMsMeta = const VerificationMeta(
    'avgSpeedMs',
  );
  @override
  late final GeneratedColumn<double> avgSpeedMs = GeneratedColumn<double>(
    'avg_speed_ms',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxSpeedMsMeta = const VerificationMeta(
    'maxSpeedMs',
  );
  @override
  late final GeneratedColumn<double> maxSpeedMs = GeneratedColumn<double>(
    'max_speed_ms',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _startLatMeta = const VerificationMeta(
    'startLat',
  );
  @override
  late final GeneratedColumn<double> startLat = GeneratedColumn<double>(
    'start_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startLonMeta = const VerificationMeta(
    'startLon',
  );
  @override
  late final GeneratedColumn<double> startLon = GeneratedColumn<double>(
    'start_lon',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endLatMeta = const VerificationMeta('endLat');
  @override
  late final GeneratedColumn<double> endLat = GeneratedColumn<double>(
    'end_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endLonMeta = const VerificationMeta('endLon');
  @override
  late final GeneratedColumn<double> endLon = GeneratedColumn<double>(
    'end_lon',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startPlaceMeta = const VerificationMeta(
    'startPlace',
  );
  @override
  late final GeneratedColumn<String> startPlace = GeneratedColumn<String>(
    'start_place',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endPlaceMeta = const VerificationMeta(
    'endPlace',
  );
  @override
  late final GeneratedColumn<String> endPlace = GeneratedColumn<String>(
    'end_place',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _detectionCountsJsonMeta =
      const VerificationMeta('detectionCountsJson');
  @override
  late final GeneratedColumn<String> detectionCountsJson =
      GeneratedColumn<String>(
        'detection_counts_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('{}'),
      );
  static const VerificationMeta _alertsCountMeta = const VerificationMeta(
    'alertsCount',
  );
  @override
  late final GeneratedColumn<int> alertsCount = GeneratedColumn<int>(
    'alerts_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _incidentCountMeta = const VerificationMeta(
    'incidentCount',
  );
  @override
  late final GeneratedColumn<int> incidentCount = GeneratedColumn<int>(
    'incident_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _emergencyCountMeta = const VerificationMeta(
    'emergencyCount',
  );
  @override
  late final GeneratedColumn<int> emergencyCount = GeneratedColumn<int>(
    'emergency_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _favoriteMeta = const VerificationMeta(
    'favorite',
  );
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
    'favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startedAt,
    endedAt,
    distanceM,
    movingTimeS,
    avgSpeedMs,
    maxSpeedMs,
    startLat,
    startLon,
    endLat,
    endLon,
    startPlace,
    endPlace,
    detectionCountsJson,
    alertsCount,
    incidentCount,
    emergencyCount,
    title,
    favorite,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trips';
  @override
  VerificationContext validateIntegrity(
    Insertable<TripRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('distance_m')) {
      context.handle(
        _distanceMMeta,
        distanceM.isAcceptableOrUnknown(data['distance_m']!, _distanceMMeta),
      );
    }
    if (data.containsKey('moving_time_s')) {
      context.handle(
        _movingTimeSMeta,
        movingTimeS.isAcceptableOrUnknown(
          data['moving_time_s']!,
          _movingTimeSMeta,
        ),
      );
    }
    if (data.containsKey('avg_speed_ms')) {
      context.handle(
        _avgSpeedMsMeta,
        avgSpeedMs.isAcceptableOrUnknown(
          data['avg_speed_ms']!,
          _avgSpeedMsMeta,
        ),
      );
    }
    if (data.containsKey('max_speed_ms')) {
      context.handle(
        _maxSpeedMsMeta,
        maxSpeedMs.isAcceptableOrUnknown(
          data['max_speed_ms']!,
          _maxSpeedMsMeta,
        ),
      );
    }
    if (data.containsKey('start_lat')) {
      context.handle(
        _startLatMeta,
        startLat.isAcceptableOrUnknown(data['start_lat']!, _startLatMeta),
      );
    }
    if (data.containsKey('start_lon')) {
      context.handle(
        _startLonMeta,
        startLon.isAcceptableOrUnknown(data['start_lon']!, _startLonMeta),
      );
    }
    if (data.containsKey('end_lat')) {
      context.handle(
        _endLatMeta,
        endLat.isAcceptableOrUnknown(data['end_lat']!, _endLatMeta),
      );
    }
    if (data.containsKey('end_lon')) {
      context.handle(
        _endLonMeta,
        endLon.isAcceptableOrUnknown(data['end_lon']!, _endLonMeta),
      );
    }
    if (data.containsKey('start_place')) {
      context.handle(
        _startPlaceMeta,
        startPlace.isAcceptableOrUnknown(data['start_place']!, _startPlaceMeta),
      );
    }
    if (data.containsKey('end_place')) {
      context.handle(
        _endPlaceMeta,
        endPlace.isAcceptableOrUnknown(data['end_place']!, _endPlaceMeta),
      );
    }
    if (data.containsKey('detection_counts_json')) {
      context.handle(
        _detectionCountsJsonMeta,
        detectionCountsJson.isAcceptableOrUnknown(
          data['detection_counts_json']!,
          _detectionCountsJsonMeta,
        ),
      );
    }
    if (data.containsKey('alerts_count')) {
      context.handle(
        _alertsCountMeta,
        alertsCount.isAcceptableOrUnknown(
          data['alerts_count']!,
          _alertsCountMeta,
        ),
      );
    }
    if (data.containsKey('incident_count')) {
      context.handle(
        _incidentCountMeta,
        incidentCount.isAcceptableOrUnknown(
          data['incident_count']!,
          _incidentCountMeta,
        ),
      );
    }
    if (data.containsKey('emergency_count')) {
      context.handle(
        _emergencyCountMeta,
        emergencyCount.isAcceptableOrUnknown(
          data['emergency_count']!,
          _emergencyCountMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('favorite')) {
      context.handle(
        _favoriteMeta,
        favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TripRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TripRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
      distanceM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance_m'],
      )!,
      movingTimeS: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}moving_time_s'],
      )!,
      avgSpeedMs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}avg_speed_ms'],
      )!,
      maxSpeedMs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max_speed_ms'],
      )!,
      startLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}start_lat'],
      ),
      startLon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}start_lon'],
      ),
      endLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}end_lat'],
      ),
      endLon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}end_lon'],
      ),
      startPlace: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_place'],
      ),
      endPlace: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_place'],
      ),
      detectionCountsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detection_counts_json'],
      )!,
      alertsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}alerts_count'],
      )!,
      incidentCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}incident_count'],
      )!,
      emergencyCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}emergency_count'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      favorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}favorite'],
      )!,
    );
  }

  @override
  $TripsTable createAlias(String alias) {
    return $TripsTable(attachedDatabase, alias);
  }
}

class TripRow extends DataClass implements Insertable<TripRow> {
  final String id;
  final DateTime startedAt;
  final DateTime? endedAt;
  final double distanceM;
  final double movingTimeS;
  final double avgSpeedMs;
  final double maxSpeedMs;
  final double? startLat;
  final double? startLon;
  final double? endLat;
  final double? endLon;
  final String? startPlace;
  final String? endPlace;
  final String detectionCountsJson;
  final int alertsCount;
  final int incidentCount;
  final int emergencyCount;
  final String title;
  final bool favorite;
  const TripRow({
    required this.id,
    required this.startedAt,
    this.endedAt,
    required this.distanceM,
    required this.movingTimeS,
    required this.avgSpeedMs,
    required this.maxSpeedMs,
    this.startLat,
    this.startLon,
    this.endLat,
    this.endLon,
    this.startPlace,
    this.endPlace,
    required this.detectionCountsJson,
    required this.alertsCount,
    required this.incidentCount,
    required this.emergencyCount,
    required this.title,
    required this.favorite,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    map['distance_m'] = Variable<double>(distanceM);
    map['moving_time_s'] = Variable<double>(movingTimeS);
    map['avg_speed_ms'] = Variable<double>(avgSpeedMs);
    map['max_speed_ms'] = Variable<double>(maxSpeedMs);
    if (!nullToAbsent || startLat != null) {
      map['start_lat'] = Variable<double>(startLat);
    }
    if (!nullToAbsent || startLon != null) {
      map['start_lon'] = Variable<double>(startLon);
    }
    if (!nullToAbsent || endLat != null) {
      map['end_lat'] = Variable<double>(endLat);
    }
    if (!nullToAbsent || endLon != null) {
      map['end_lon'] = Variable<double>(endLon);
    }
    if (!nullToAbsent || startPlace != null) {
      map['start_place'] = Variable<String>(startPlace);
    }
    if (!nullToAbsent || endPlace != null) {
      map['end_place'] = Variable<String>(endPlace);
    }
    map['detection_counts_json'] = Variable<String>(detectionCountsJson);
    map['alerts_count'] = Variable<int>(alertsCount);
    map['incident_count'] = Variable<int>(incidentCount);
    map['emergency_count'] = Variable<int>(emergencyCount);
    map['title'] = Variable<String>(title);
    map['favorite'] = Variable<bool>(favorite);
    return map;
  }

  TripsCompanion toCompanion(bool nullToAbsent) {
    return TripsCompanion(
      id: Value(id),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      distanceM: Value(distanceM),
      movingTimeS: Value(movingTimeS),
      avgSpeedMs: Value(avgSpeedMs),
      maxSpeedMs: Value(maxSpeedMs),
      startLat: startLat == null && nullToAbsent
          ? const Value.absent()
          : Value(startLat),
      startLon: startLon == null && nullToAbsent
          ? const Value.absent()
          : Value(startLon),
      endLat: endLat == null && nullToAbsent
          ? const Value.absent()
          : Value(endLat),
      endLon: endLon == null && nullToAbsent
          ? const Value.absent()
          : Value(endLon),
      startPlace: startPlace == null && nullToAbsent
          ? const Value.absent()
          : Value(startPlace),
      endPlace: endPlace == null && nullToAbsent
          ? const Value.absent()
          : Value(endPlace),
      detectionCountsJson: Value(detectionCountsJson),
      alertsCount: Value(alertsCount),
      incidentCount: Value(incidentCount),
      emergencyCount: Value(emergencyCount),
      title: Value(title),
      favorite: Value(favorite),
    );
  }

  factory TripRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TripRow(
      id: serializer.fromJson<String>(json['id']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      distanceM: serializer.fromJson<double>(json['distanceM']),
      movingTimeS: serializer.fromJson<double>(json['movingTimeS']),
      avgSpeedMs: serializer.fromJson<double>(json['avgSpeedMs']),
      maxSpeedMs: serializer.fromJson<double>(json['maxSpeedMs']),
      startLat: serializer.fromJson<double?>(json['startLat']),
      startLon: serializer.fromJson<double?>(json['startLon']),
      endLat: serializer.fromJson<double?>(json['endLat']),
      endLon: serializer.fromJson<double?>(json['endLon']),
      startPlace: serializer.fromJson<String?>(json['startPlace']),
      endPlace: serializer.fromJson<String?>(json['endPlace']),
      detectionCountsJson: serializer.fromJson<String>(
        json['detectionCountsJson'],
      ),
      alertsCount: serializer.fromJson<int>(json['alertsCount']),
      incidentCount: serializer.fromJson<int>(json['incidentCount']),
      emergencyCount: serializer.fromJson<int>(json['emergencyCount']),
      title: serializer.fromJson<String>(json['title']),
      favorite: serializer.fromJson<bool>(json['favorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'distanceM': serializer.toJson<double>(distanceM),
      'movingTimeS': serializer.toJson<double>(movingTimeS),
      'avgSpeedMs': serializer.toJson<double>(avgSpeedMs),
      'maxSpeedMs': serializer.toJson<double>(maxSpeedMs),
      'startLat': serializer.toJson<double?>(startLat),
      'startLon': serializer.toJson<double?>(startLon),
      'endLat': serializer.toJson<double?>(endLat),
      'endLon': serializer.toJson<double?>(endLon),
      'startPlace': serializer.toJson<String?>(startPlace),
      'endPlace': serializer.toJson<String?>(endPlace),
      'detectionCountsJson': serializer.toJson<String>(detectionCountsJson),
      'alertsCount': serializer.toJson<int>(alertsCount),
      'incidentCount': serializer.toJson<int>(incidentCount),
      'emergencyCount': serializer.toJson<int>(emergencyCount),
      'title': serializer.toJson<String>(title),
      'favorite': serializer.toJson<bool>(favorite),
    };
  }

  TripRow copyWith({
    String? id,
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
    double? distanceM,
    double? movingTimeS,
    double? avgSpeedMs,
    double? maxSpeedMs,
    Value<double?> startLat = const Value.absent(),
    Value<double?> startLon = const Value.absent(),
    Value<double?> endLat = const Value.absent(),
    Value<double?> endLon = const Value.absent(),
    Value<String?> startPlace = const Value.absent(),
    Value<String?> endPlace = const Value.absent(),
    String? detectionCountsJson,
    int? alertsCount,
    int? incidentCount,
    int? emergencyCount,
    String? title,
    bool? favorite,
  }) => TripRow(
    id: id ?? this.id,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    distanceM: distanceM ?? this.distanceM,
    movingTimeS: movingTimeS ?? this.movingTimeS,
    avgSpeedMs: avgSpeedMs ?? this.avgSpeedMs,
    maxSpeedMs: maxSpeedMs ?? this.maxSpeedMs,
    startLat: startLat.present ? startLat.value : this.startLat,
    startLon: startLon.present ? startLon.value : this.startLon,
    endLat: endLat.present ? endLat.value : this.endLat,
    endLon: endLon.present ? endLon.value : this.endLon,
    startPlace: startPlace.present ? startPlace.value : this.startPlace,
    endPlace: endPlace.present ? endPlace.value : this.endPlace,
    detectionCountsJson: detectionCountsJson ?? this.detectionCountsJson,
    alertsCount: alertsCount ?? this.alertsCount,
    incidentCount: incidentCount ?? this.incidentCount,
    emergencyCount: emergencyCount ?? this.emergencyCount,
    title: title ?? this.title,
    favorite: favorite ?? this.favorite,
  );
  TripRow copyWithCompanion(TripsCompanion data) {
    return TripRow(
      id: data.id.present ? data.id.value : this.id,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      distanceM: data.distanceM.present ? data.distanceM.value : this.distanceM,
      movingTimeS: data.movingTimeS.present
          ? data.movingTimeS.value
          : this.movingTimeS,
      avgSpeedMs: data.avgSpeedMs.present
          ? data.avgSpeedMs.value
          : this.avgSpeedMs,
      maxSpeedMs: data.maxSpeedMs.present
          ? data.maxSpeedMs.value
          : this.maxSpeedMs,
      startLat: data.startLat.present ? data.startLat.value : this.startLat,
      startLon: data.startLon.present ? data.startLon.value : this.startLon,
      endLat: data.endLat.present ? data.endLat.value : this.endLat,
      endLon: data.endLon.present ? data.endLon.value : this.endLon,
      startPlace: data.startPlace.present
          ? data.startPlace.value
          : this.startPlace,
      endPlace: data.endPlace.present ? data.endPlace.value : this.endPlace,
      detectionCountsJson: data.detectionCountsJson.present
          ? data.detectionCountsJson.value
          : this.detectionCountsJson,
      alertsCount: data.alertsCount.present
          ? data.alertsCount.value
          : this.alertsCount,
      incidentCount: data.incidentCount.present
          ? data.incidentCount.value
          : this.incidentCount,
      emergencyCount: data.emergencyCount.present
          ? data.emergencyCount.value
          : this.emergencyCount,
      title: data.title.present ? data.title.value : this.title,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TripRow(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('distanceM: $distanceM, ')
          ..write('movingTimeS: $movingTimeS, ')
          ..write('avgSpeedMs: $avgSpeedMs, ')
          ..write('maxSpeedMs: $maxSpeedMs, ')
          ..write('startLat: $startLat, ')
          ..write('startLon: $startLon, ')
          ..write('endLat: $endLat, ')
          ..write('endLon: $endLon, ')
          ..write('startPlace: $startPlace, ')
          ..write('endPlace: $endPlace, ')
          ..write('detectionCountsJson: $detectionCountsJson, ')
          ..write('alertsCount: $alertsCount, ')
          ..write('incidentCount: $incidentCount, ')
          ..write('emergencyCount: $emergencyCount, ')
          ..write('title: $title, ')
          ..write('favorite: $favorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    startedAt,
    endedAt,
    distanceM,
    movingTimeS,
    avgSpeedMs,
    maxSpeedMs,
    startLat,
    startLon,
    endLat,
    endLon,
    startPlace,
    endPlace,
    detectionCountsJson,
    alertsCount,
    incidentCount,
    emergencyCount,
    title,
    favorite,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TripRow &&
          other.id == this.id &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.distanceM == this.distanceM &&
          other.movingTimeS == this.movingTimeS &&
          other.avgSpeedMs == this.avgSpeedMs &&
          other.maxSpeedMs == this.maxSpeedMs &&
          other.startLat == this.startLat &&
          other.startLon == this.startLon &&
          other.endLat == this.endLat &&
          other.endLon == this.endLon &&
          other.startPlace == this.startPlace &&
          other.endPlace == this.endPlace &&
          other.detectionCountsJson == this.detectionCountsJson &&
          other.alertsCount == this.alertsCount &&
          other.incidentCount == this.incidentCount &&
          other.emergencyCount == this.emergencyCount &&
          other.title == this.title &&
          other.favorite == this.favorite);
}

class TripsCompanion extends UpdateCompanion<TripRow> {
  final Value<String> id;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<double> distanceM;
  final Value<double> movingTimeS;
  final Value<double> avgSpeedMs;
  final Value<double> maxSpeedMs;
  final Value<double?> startLat;
  final Value<double?> startLon;
  final Value<double?> endLat;
  final Value<double?> endLon;
  final Value<String?> startPlace;
  final Value<String?> endPlace;
  final Value<String> detectionCountsJson;
  final Value<int> alertsCount;
  final Value<int> incidentCount;
  final Value<int> emergencyCount;
  final Value<String> title;
  final Value<bool> favorite;
  final Value<int> rowid;
  const TripsCompanion({
    this.id = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.distanceM = const Value.absent(),
    this.movingTimeS = const Value.absent(),
    this.avgSpeedMs = const Value.absent(),
    this.maxSpeedMs = const Value.absent(),
    this.startLat = const Value.absent(),
    this.startLon = const Value.absent(),
    this.endLat = const Value.absent(),
    this.endLon = const Value.absent(),
    this.startPlace = const Value.absent(),
    this.endPlace = const Value.absent(),
    this.detectionCountsJson = const Value.absent(),
    this.alertsCount = const Value.absent(),
    this.incidentCount = const Value.absent(),
    this.emergencyCount = const Value.absent(),
    this.title = const Value.absent(),
    this.favorite = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TripsCompanion.insert({
    required String id,
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    this.distanceM = const Value.absent(),
    this.movingTimeS = const Value.absent(),
    this.avgSpeedMs = const Value.absent(),
    this.maxSpeedMs = const Value.absent(),
    this.startLat = const Value.absent(),
    this.startLon = const Value.absent(),
    this.endLat = const Value.absent(),
    this.endLon = const Value.absent(),
    this.startPlace = const Value.absent(),
    this.endPlace = const Value.absent(),
    this.detectionCountsJson = const Value.absent(),
    this.alertsCount = const Value.absent(),
    this.incidentCount = const Value.absent(),
    this.emergencyCount = const Value.absent(),
    this.title = const Value.absent(),
    this.favorite = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       startedAt = Value(startedAt);
  static Insertable<TripRow> custom({
    Expression<String>? id,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<double>? distanceM,
    Expression<double>? movingTimeS,
    Expression<double>? avgSpeedMs,
    Expression<double>? maxSpeedMs,
    Expression<double>? startLat,
    Expression<double>? startLon,
    Expression<double>? endLat,
    Expression<double>? endLon,
    Expression<String>? startPlace,
    Expression<String>? endPlace,
    Expression<String>? detectionCountsJson,
    Expression<int>? alertsCount,
    Expression<int>? incidentCount,
    Expression<int>? emergencyCount,
    Expression<String>? title,
    Expression<bool>? favorite,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (distanceM != null) 'distance_m': distanceM,
      if (movingTimeS != null) 'moving_time_s': movingTimeS,
      if (avgSpeedMs != null) 'avg_speed_ms': avgSpeedMs,
      if (maxSpeedMs != null) 'max_speed_ms': maxSpeedMs,
      if (startLat != null) 'start_lat': startLat,
      if (startLon != null) 'start_lon': startLon,
      if (endLat != null) 'end_lat': endLat,
      if (endLon != null) 'end_lon': endLon,
      if (startPlace != null) 'start_place': startPlace,
      if (endPlace != null) 'end_place': endPlace,
      if (detectionCountsJson != null)
        'detection_counts_json': detectionCountsJson,
      if (alertsCount != null) 'alerts_count': alertsCount,
      if (incidentCount != null) 'incident_count': incidentCount,
      if (emergencyCount != null) 'emergency_count': emergencyCount,
      if (title != null) 'title': title,
      if (favorite != null) 'favorite': favorite,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TripsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
    Value<double>? distanceM,
    Value<double>? movingTimeS,
    Value<double>? avgSpeedMs,
    Value<double>? maxSpeedMs,
    Value<double?>? startLat,
    Value<double?>? startLon,
    Value<double?>? endLat,
    Value<double?>? endLon,
    Value<String?>? startPlace,
    Value<String?>? endPlace,
    Value<String>? detectionCountsJson,
    Value<int>? alertsCount,
    Value<int>? incidentCount,
    Value<int>? emergencyCount,
    Value<String>? title,
    Value<bool>? favorite,
    Value<int>? rowid,
  }) {
    return TripsCompanion(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      distanceM: distanceM ?? this.distanceM,
      movingTimeS: movingTimeS ?? this.movingTimeS,
      avgSpeedMs: avgSpeedMs ?? this.avgSpeedMs,
      maxSpeedMs: maxSpeedMs ?? this.maxSpeedMs,
      startLat: startLat ?? this.startLat,
      startLon: startLon ?? this.startLon,
      endLat: endLat ?? this.endLat,
      endLon: endLon ?? this.endLon,
      startPlace: startPlace ?? this.startPlace,
      endPlace: endPlace ?? this.endPlace,
      detectionCountsJson: detectionCountsJson ?? this.detectionCountsJson,
      alertsCount: alertsCount ?? this.alertsCount,
      incidentCount: incidentCount ?? this.incidentCount,
      emergencyCount: emergencyCount ?? this.emergencyCount,
      title: title ?? this.title,
      favorite: favorite ?? this.favorite,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (distanceM.present) {
      map['distance_m'] = Variable<double>(distanceM.value);
    }
    if (movingTimeS.present) {
      map['moving_time_s'] = Variable<double>(movingTimeS.value);
    }
    if (avgSpeedMs.present) {
      map['avg_speed_ms'] = Variable<double>(avgSpeedMs.value);
    }
    if (maxSpeedMs.present) {
      map['max_speed_ms'] = Variable<double>(maxSpeedMs.value);
    }
    if (startLat.present) {
      map['start_lat'] = Variable<double>(startLat.value);
    }
    if (startLon.present) {
      map['start_lon'] = Variable<double>(startLon.value);
    }
    if (endLat.present) {
      map['end_lat'] = Variable<double>(endLat.value);
    }
    if (endLon.present) {
      map['end_lon'] = Variable<double>(endLon.value);
    }
    if (startPlace.present) {
      map['start_place'] = Variable<String>(startPlace.value);
    }
    if (endPlace.present) {
      map['end_place'] = Variable<String>(endPlace.value);
    }
    if (detectionCountsJson.present) {
      map['detection_counts_json'] = Variable<String>(
        detectionCountsJson.value,
      );
    }
    if (alertsCount.present) {
      map['alerts_count'] = Variable<int>(alertsCount.value);
    }
    if (incidentCount.present) {
      map['incident_count'] = Variable<int>(incidentCount.value);
    }
    if (emergencyCount.present) {
      map['emergency_count'] = Variable<int>(emergencyCount.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripsCompanion(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('distanceM: $distanceM, ')
          ..write('movingTimeS: $movingTimeS, ')
          ..write('avgSpeedMs: $avgSpeedMs, ')
          ..write('maxSpeedMs: $maxSpeedMs, ')
          ..write('startLat: $startLat, ')
          ..write('startLon: $startLon, ')
          ..write('endLat: $endLat, ')
          ..write('endLon: $endLon, ')
          ..write('startPlace: $startPlace, ')
          ..write('endPlace: $endPlace, ')
          ..write('detectionCountsJson: $detectionCountsJson, ')
          ..write('alertsCount: $alertsCount, ')
          ..write('incidentCount: $incidentCount, ')
          ..write('emergencyCount: $emergencyCount, ')
          ..write('title: $title, ')
          ..write('favorite: $favorite, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TripPointsTable extends TripPoints
    with TableInfo<$TripPointsTable, TripPointRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripPointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<String> tripId = GeneratedColumn<String>(
    'trip_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<double> ts = GeneratedColumn<double>(
    'ts',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
    'speed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseMeta = const VerificationMeta('course');
  @override
  late final GeneratedColumn<double> course = GeneratedColumn<double>(
    'course',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hAccMeta = const VerificationMeta('hAcc');
  @override
  late final GeneratedColumn<double> hAcc = GeneratedColumn<double>(
    'h_acc',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tripId,
    ts,
    lat,
    lon,
    speed,
    course,
    hAcc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trip_points';
  @override
  VerificationContext validateIntegrity(
    Insertable<TripPointRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('trip_id')) {
      context.handle(
        _tripIdMeta,
        tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
        _lonMeta,
        lon.isAcceptableOrUnknown(data['lon']!, _lonMeta),
      );
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    if (data.containsKey('speed')) {
      context.handle(
        _speedMeta,
        speed.isAcceptableOrUnknown(data['speed']!, _speedMeta),
      );
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('course')) {
      context.handle(
        _courseMeta,
        course.isAcceptableOrUnknown(data['course']!, _courseMeta),
      );
    } else if (isInserting) {
      context.missing(_courseMeta);
    }
    if (data.containsKey('h_acc')) {
      context.handle(
        _hAccMeta,
        hAcc.isAcceptableOrUnknown(data['h_acc']!, _hAccMeta),
      );
    } else if (isInserting) {
      context.missing(_hAccMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TripPointRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TripPointRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tripId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trip_id'],
      )!,
      ts: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ts'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lon'],
      )!,
      speed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speed'],
      )!,
      course: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}course'],
      )!,
      hAcc: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}h_acc'],
      )!,
    );
  }

  @override
  $TripPointsTable createAlias(String alias) {
    return $TripPointsTable(attachedDatabase, alias);
  }
}

class TripPointRow extends DataClass implements Insertable<TripPointRow> {
  final int id;
  final String tripId;

  /// Epoch milliseconds.
  final double ts;
  final double lat;
  final double lon;

  /// m/s, negative = unknown.
  final double speed;
  final double course;
  final double hAcc;
  const TripPointRow({
    required this.id,
    required this.tripId,
    required this.ts,
    required this.lat,
    required this.lon,
    required this.speed,
    required this.course,
    required this.hAcc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['trip_id'] = Variable<String>(tripId);
    map['ts'] = Variable<double>(ts);
    map['lat'] = Variable<double>(lat);
    map['lon'] = Variable<double>(lon);
    map['speed'] = Variable<double>(speed);
    map['course'] = Variable<double>(course);
    map['h_acc'] = Variable<double>(hAcc);
    return map;
  }

  TripPointsCompanion toCompanion(bool nullToAbsent) {
    return TripPointsCompanion(
      id: Value(id),
      tripId: Value(tripId),
      ts: Value(ts),
      lat: Value(lat),
      lon: Value(lon),
      speed: Value(speed),
      course: Value(course),
      hAcc: Value(hAcc),
    );
  }

  factory TripPointRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TripPointRow(
      id: serializer.fromJson<int>(json['id']),
      tripId: serializer.fromJson<String>(json['tripId']),
      ts: serializer.fromJson<double>(json['ts']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
      speed: serializer.fromJson<double>(json['speed']),
      course: serializer.fromJson<double>(json['course']),
      hAcc: serializer.fromJson<double>(json['hAcc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tripId': serializer.toJson<String>(tripId),
      'ts': serializer.toJson<double>(ts),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
      'speed': serializer.toJson<double>(speed),
      'course': serializer.toJson<double>(course),
      'hAcc': serializer.toJson<double>(hAcc),
    };
  }

  TripPointRow copyWith({
    int? id,
    String? tripId,
    double? ts,
    double? lat,
    double? lon,
    double? speed,
    double? course,
    double? hAcc,
  }) => TripPointRow(
    id: id ?? this.id,
    tripId: tripId ?? this.tripId,
    ts: ts ?? this.ts,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
    speed: speed ?? this.speed,
    course: course ?? this.course,
    hAcc: hAcc ?? this.hAcc,
  );
  TripPointRow copyWithCompanion(TripPointsCompanion data) {
    return TripPointRow(
      id: data.id.present ? data.id.value : this.id,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      ts: data.ts.present ? data.ts.value : this.ts,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
      speed: data.speed.present ? data.speed.value : this.speed,
      course: data.course.present ? data.course.value : this.course,
      hAcc: data.hAcc.present ? data.hAcc.value : this.hAcc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TripPointRow(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('ts: $ts, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('speed: $speed, ')
          ..write('course: $course, ')
          ..write('hAcc: $hAcc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, tripId, ts, lat, lon, speed, course, hAcc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TripPointRow &&
          other.id == this.id &&
          other.tripId == this.tripId &&
          other.ts == this.ts &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.speed == this.speed &&
          other.course == this.course &&
          other.hAcc == this.hAcc);
}

class TripPointsCompanion extends UpdateCompanion<TripPointRow> {
  final Value<int> id;
  final Value<String> tripId;
  final Value<double> ts;
  final Value<double> lat;
  final Value<double> lon;
  final Value<double> speed;
  final Value<double> course;
  final Value<double> hAcc;
  const TripPointsCompanion({
    this.id = const Value.absent(),
    this.tripId = const Value.absent(),
    this.ts = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.speed = const Value.absent(),
    this.course = const Value.absent(),
    this.hAcc = const Value.absent(),
  });
  TripPointsCompanion.insert({
    this.id = const Value.absent(),
    required String tripId,
    required double ts,
    required double lat,
    required double lon,
    required double speed,
    required double course,
    required double hAcc,
  }) : tripId = Value(tripId),
       ts = Value(ts),
       lat = Value(lat),
       lon = Value(lon),
       speed = Value(speed),
       course = Value(course),
       hAcc = Value(hAcc);
  static Insertable<TripPointRow> custom({
    Expression<int>? id,
    Expression<String>? tripId,
    Expression<double>? ts,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<double>? speed,
    Expression<double>? course,
    Expression<double>? hAcc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tripId != null) 'trip_id': tripId,
      if (ts != null) 'ts': ts,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (speed != null) 'speed': speed,
      if (course != null) 'course': course,
      if (hAcc != null) 'h_acc': hAcc,
    });
  }

  TripPointsCompanion copyWith({
    Value<int>? id,
    Value<String>? tripId,
    Value<double>? ts,
    Value<double>? lat,
    Value<double>? lon,
    Value<double>? speed,
    Value<double>? course,
    Value<double>? hAcc,
  }) {
    return TripPointsCompanion(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      ts: ts ?? this.ts,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      speed: speed ?? this.speed,
      course: course ?? this.course,
      hAcc: hAcc ?? this.hAcc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<String>(tripId.value);
    }
    if (ts.present) {
      map['ts'] = Variable<double>(ts.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (course.present) {
      map['course'] = Variable<double>(course.value);
    }
    if (hAcc.present) {
      map['h_acc'] = Variable<double>(hAcc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripPointsCompanion(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('ts: $ts, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('speed: $speed, ')
          ..write('course: $course, ')
          ..write('hAcc: $hAcc')
          ..write(')'))
        .toString();
  }
}

class $TripEventsTable extends TripEvents
    with TableInfo<$TripEventsTable, TripEventRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<String> tripId = GeneratedColumn<String>(
    'trip_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  @override
  late final GeneratedColumn<double> ts = GeneratedColumn<double>(
    'ts',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<String> refId = GeneratedColumn<String>(
    'ref_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tripId,
    ts,
    kind,
    label,
    refId,
    lat,
    lon,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trip_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<TripEventRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('trip_id')) {
      context.handle(
        _tripIdMeta,
        tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    if (data.containsKey('ref_id')) {
      context.handle(
        _refIdMeta,
        refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('lon')) {
      context.handle(
        _lonMeta,
        lon.isAcceptableOrUnknown(data['lon']!, _lonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TripEventRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TripEventRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tripId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trip_id'],
      )!,
      ts: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ts'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      refId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_id'],
      ),
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      lon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lon'],
      ),
    );
  }

  @override
  $TripEventsTable createAlias(String alias) {
    return $TripEventsTable(attachedDatabase, alias);
  }
}

class TripEventRow extends DataClass implements Insertable<TripEventRow> {
  final int id;
  final String tripId;
  final double ts;
  final String kind;
  final String label;
  final String? refId;
  final double? lat;
  final double? lon;
  const TripEventRow({
    required this.id,
    required this.tripId,
    required this.ts,
    required this.kind,
    required this.label,
    this.refId,
    this.lat,
    this.lon,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['trip_id'] = Variable<String>(tripId);
    map['ts'] = Variable<double>(ts);
    map['kind'] = Variable<String>(kind);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || refId != null) {
      map['ref_id'] = Variable<String>(refId);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lon != null) {
      map['lon'] = Variable<double>(lon);
    }
    return map;
  }

  TripEventsCompanion toCompanion(bool nullToAbsent) {
    return TripEventsCompanion(
      id: Value(id),
      tripId: Value(tripId),
      ts: Value(ts),
      kind: Value(kind),
      label: Value(label),
      refId: refId == null && nullToAbsent
          ? const Value.absent()
          : Value(refId),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lon: lon == null && nullToAbsent ? const Value.absent() : Value(lon),
    );
  }

  factory TripEventRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TripEventRow(
      id: serializer.fromJson<int>(json['id']),
      tripId: serializer.fromJson<String>(json['tripId']),
      ts: serializer.fromJson<double>(json['ts']),
      kind: serializer.fromJson<String>(json['kind']),
      label: serializer.fromJson<String>(json['label']),
      refId: serializer.fromJson<String?>(json['refId']),
      lat: serializer.fromJson<double?>(json['lat']),
      lon: serializer.fromJson<double?>(json['lon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tripId': serializer.toJson<String>(tripId),
      'ts': serializer.toJson<double>(ts),
      'kind': serializer.toJson<String>(kind),
      'label': serializer.toJson<String>(label),
      'refId': serializer.toJson<String?>(refId),
      'lat': serializer.toJson<double?>(lat),
      'lon': serializer.toJson<double?>(lon),
    };
  }

  TripEventRow copyWith({
    int? id,
    String? tripId,
    double? ts,
    String? kind,
    String? label,
    Value<String?> refId = const Value.absent(),
    Value<double?> lat = const Value.absent(),
    Value<double?> lon = const Value.absent(),
  }) => TripEventRow(
    id: id ?? this.id,
    tripId: tripId ?? this.tripId,
    ts: ts ?? this.ts,
    kind: kind ?? this.kind,
    label: label ?? this.label,
    refId: refId.present ? refId.value : this.refId,
    lat: lat.present ? lat.value : this.lat,
    lon: lon.present ? lon.value : this.lon,
  );
  TripEventRow copyWithCompanion(TripEventsCompanion data) {
    return TripEventRow(
      id: data.id.present ? data.id.value : this.id,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      ts: data.ts.present ? data.ts.value : this.ts,
      kind: data.kind.present ? data.kind.value : this.kind,
      label: data.label.present ? data.label.value : this.label,
      refId: data.refId.present ? data.refId.value : this.refId,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TripEventRow(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('ts: $ts, ')
          ..write('kind: $kind, ')
          ..write('label: $label, ')
          ..write('refId: $refId, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tripId, ts, kind, label, refId, lat, lon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TripEventRow &&
          other.id == this.id &&
          other.tripId == this.tripId &&
          other.ts == this.ts &&
          other.kind == this.kind &&
          other.label == this.label &&
          other.refId == this.refId &&
          other.lat == this.lat &&
          other.lon == this.lon);
}

class TripEventsCompanion extends UpdateCompanion<TripEventRow> {
  final Value<int> id;
  final Value<String> tripId;
  final Value<double> ts;
  final Value<String> kind;
  final Value<String> label;
  final Value<String?> refId;
  final Value<double?> lat;
  final Value<double?> lon;
  const TripEventsCompanion({
    this.id = const Value.absent(),
    this.tripId = const Value.absent(),
    this.ts = const Value.absent(),
    this.kind = const Value.absent(),
    this.label = const Value.absent(),
    this.refId = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
  });
  TripEventsCompanion.insert({
    this.id = const Value.absent(),
    required String tripId,
    required double ts,
    required String kind,
    this.label = const Value.absent(),
    this.refId = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
  }) : tripId = Value(tripId),
       ts = Value(ts),
       kind = Value(kind);
  static Insertable<TripEventRow> custom({
    Expression<int>? id,
    Expression<String>? tripId,
    Expression<double>? ts,
    Expression<String>? kind,
    Expression<String>? label,
    Expression<String>? refId,
    Expression<double>? lat,
    Expression<double>? lon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tripId != null) 'trip_id': tripId,
      if (ts != null) 'ts': ts,
      if (kind != null) 'kind': kind,
      if (label != null) 'label': label,
      if (refId != null) 'ref_id': refId,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
    });
  }

  TripEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? tripId,
    Value<double>? ts,
    Value<String>? kind,
    Value<String>? label,
    Value<String?>? refId,
    Value<double?>? lat,
    Value<double?>? lon,
  }) {
    return TripEventsCompanion(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      ts: ts ?? this.ts,
      kind: kind ?? this.kind,
      label: label ?? this.label,
      refId: refId ?? this.refId,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<String>(tripId.value);
    }
    if (ts.present) {
      map['ts'] = Variable<double>(ts.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<String>(refId.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripEventsCompanion(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('ts: $ts, ')
          ..write('kind: $kind, ')
          ..write('label: $label, ')
          ..write('refId: $refId, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $IncidentClipsTable incidentClips = $IncidentClipsTable(this);
  late final $DrivingSessionsTable drivingSessions = $DrivingSessionsTable(
    this,
  );
  late final $EmergencyEventsTable emergencyEvents = $EmergencyEventsTable(
    this,
  );
  late final $AiModelsTable aiModels = $AiModelsTable(this);
  late final $DetectionsTable detections = $DetectionsTable(this);
  late final $TripsTable trips = $TripsTable(this);
  late final $TripPointsTable tripPoints = $TripPointsTable(this);
  late final $TripEventsTable tripEvents = $TripEventsTable(this);
  late final Index tripPointsTrip = Index(
    'trip_points_trip',
    'CREATE INDEX trip_points_trip ON trip_points (trip_id)',
  );
  late final Index tripEventsTrip = Index(
    'trip_events_trip',
    'CREATE INDEX trip_events_trip ON trip_events (trip_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    settings,
    incidentClips,
    drivingSessions,
    emergencyEvents,
    aiModels,
    detections,
    trips,
    tripPoints,
    tripEvents,
    tripPointsTrip,
    tripEventsTrip,
  ];
}

typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          SettingRow,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (
            SettingRow,
            BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>,
          ),
          SettingRow,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => SettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) => SettingsCompanion.insert(key: key, value: value, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsTable, SettingRow>(table),
                  BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      SettingRow,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (SettingRow, BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>),
      SettingRow,
      PrefetchHooks Function()
    >;
typedef $$IncidentClipsTableCreateCompanionBuilder =
    IncidentClipsCompanion Function({
      required String id,
      Value<String> title,
      required String path,
      Value<String?> thumbnailPath,
      Value<int> durationMs,
      Value<int> width,
      Value<int> height,
      Value<int> sizeBytes,
      Value<bool> hasAudio,
      Value<bool> favorite,
      required DateTime createdAt,
      Value<String> reason,
      Value<double?> lat,
      Value<double?> lon,
      Value<double?> speed,
      Value<bool> missingFile,
      Value<String> kind,
      Value<int> rowid,
    });
typedef $$IncidentClipsTableUpdateCompanionBuilder =
    IncidentClipsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> path,
      Value<String?> thumbnailPath,
      Value<int> durationMs,
      Value<int> width,
      Value<int> height,
      Value<int> sizeBytes,
      Value<bool> hasAudio,
      Value<bool> favorite,
      Value<DateTime> createdAt,
      Value<String> reason,
      Value<double?> lat,
      Value<double?> lon,
      Value<double?> speed,
      Value<bool> missingFile,
      Value<String> kind,
      Value<int> rowid,
    });

class $$IncidentClipsTableFilterComposer
    extends Composer<_$AppDatabase, $IncidentClipsTable> {
  $$IncidentClipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasAudio => $composableBuilder(
    column: $table.hasAudio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get missingFile => $composableBuilder(
    column: $table.missingFile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );
}

class $$IncidentClipsTableOrderingComposer
    extends Composer<_$AppDatabase, $IncidentClipsTable> {
  $$IncidentClipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasAudio => $composableBuilder(
    column: $table.hasAudio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get missingFile => $composableBuilder(
    column: $table.missingFile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IncidentClipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncidentClipsTable> {
  $$IncidentClipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<bool> get hasAudio =>
      $composableBuilder(column: $table.hasAudio, builder: (column) => column);

  GeneratedColumn<bool> get favorite =>
      $composableBuilder(column: $table.favorite, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<bool> get missingFile => $composableBuilder(
    column: $table.missingFile,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);
}

class $$IncidentClipsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IncidentClipsTable,
          IncidentClipRow,
          $$IncidentClipsTableFilterComposer,
          $$IncidentClipsTableOrderingComposer,
          $$IncidentClipsTableAnnotationComposer,
          $$IncidentClipsTableCreateCompanionBuilder,
          $$IncidentClipsTableUpdateCompanionBuilder,
          (
            IncidentClipRow,
            BaseReferences<_$AppDatabase, $IncidentClipsTable, IncidentClipRow>,
          ),
          IncidentClipRow,
          PrefetchHooks Function()
        > {
  $$IncidentClipsTableTableManager(_$AppDatabase db, $IncidentClipsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncidentClipsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncidentClipsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncidentClipsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<String?> thumbnailPath = const Value.absent(),
                Value<int> durationMs = const Value.absent(),
                Value<int> width = const Value.absent(),
                Value<int> height = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                Value<bool> hasAudio = const Value.absent(),
                Value<bool> favorite = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lon = const Value.absent(),
                Value<double?> speed = const Value.absent(),
                Value<bool> missingFile = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IncidentClipsCompanion(
                id: id,
                title: title,
                path: path,
                thumbnailPath: thumbnailPath,
                durationMs: durationMs,
                width: width,
                height: height,
                sizeBytes: sizeBytes,
                hasAudio: hasAudio,
                favorite: favorite,
                createdAt: createdAt,
                reason: reason,
                lat: lat,
                lon: lon,
                speed: speed,
                missingFile: missingFile,
                kind: kind,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> title = const Value.absent(),
                required String path,
                Value<String?> thumbnailPath = const Value.absent(),
                Value<int> durationMs = const Value.absent(),
                Value<int> width = const Value.absent(),
                Value<int> height = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                Value<bool> hasAudio = const Value.absent(),
                Value<bool> favorite = const Value.absent(),
                required DateTime createdAt,
                Value<String> reason = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lon = const Value.absent(),
                Value<double?> speed = const Value.absent(),
                Value<bool> missingFile = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IncidentClipsCompanion.insert(
                id: id,
                title: title,
                path: path,
                thumbnailPath: thumbnailPath,
                durationMs: durationMs,
                width: width,
                height: height,
                sizeBytes: sizeBytes,
                hasAudio: hasAudio,
                favorite: favorite,
                createdAt: createdAt,
                reason: reason,
                lat: lat,
                lon: lon,
                speed: speed,
                missingFile: missingFile,
                kind: kind,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$IncidentClipsTable, IncidentClipRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $IncidentClipsTable,
                    IncidentClipRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$IncidentClipsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IncidentClipsTable,
      IncidentClipRow,
      $$IncidentClipsTableFilterComposer,
      $$IncidentClipsTableOrderingComposer,
      $$IncidentClipsTableAnnotationComposer,
      $$IncidentClipsTableCreateCompanionBuilder,
      $$IncidentClipsTableUpdateCompanionBuilder,
      (
        IncidentClipRow,
        BaseReferences<_$AppDatabase, $IncidentClipsTable, IncidentClipRow>,
      ),
      IncidentClipRow,
      PrefetchHooks Function()
    >;
typedef $$DrivingSessionsTableCreateCompanionBuilder =
    DrivingSessionsCompanion Function({
      required String id,
      required DateTime startedAt,
      Value<DateTime?> endedAt,
      required String view,
      required String modelId,
      required String recordingProfile,
      Value<String> metricsJson,
      Value<int> rowid,
    });
typedef $$DrivingSessionsTableUpdateCompanionBuilder =
    DrivingSessionsCompanion Function({
      Value<String> id,
      Value<DateTime> startedAt,
      Value<DateTime?> endedAt,
      Value<String> view,
      Value<String> modelId,
      Value<String> recordingProfile,
      Value<String> metricsJson,
      Value<int> rowid,
    });

class $$DrivingSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $DrivingSessionsTable> {
  $$DrivingSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get view => $composableBuilder(
    column: $table.view,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelId => $composableBuilder(
    column: $table.modelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordingProfile => $composableBuilder(
    column: $table.recordingProfile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metricsJson => $composableBuilder(
    column: $table.metricsJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DrivingSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DrivingSessionsTable> {
  $$DrivingSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get view => $composableBuilder(
    column: $table.view,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelId => $composableBuilder(
    column: $table.modelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordingProfile => $composableBuilder(
    column: $table.recordingProfile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metricsJson => $composableBuilder(
    column: $table.metricsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DrivingSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DrivingSessionsTable> {
  $$DrivingSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<String> get view =>
      $composableBuilder(column: $table.view, builder: (column) => column);

  GeneratedColumn<String> get modelId =>
      $composableBuilder(column: $table.modelId, builder: (column) => column);

  GeneratedColumn<String> get recordingProfile => $composableBuilder(
    column: $table.recordingProfile,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metricsJson => $composableBuilder(
    column: $table.metricsJson,
    builder: (column) => column,
  );
}

class $$DrivingSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DrivingSessionsTable,
          DrivingSessionRow,
          $$DrivingSessionsTableFilterComposer,
          $$DrivingSessionsTableOrderingComposer,
          $$DrivingSessionsTableAnnotationComposer,
          $$DrivingSessionsTableCreateCompanionBuilder,
          $$DrivingSessionsTableUpdateCompanionBuilder,
          (
            DrivingSessionRow,
            BaseReferences<
              _$AppDatabase,
              $DrivingSessionsTable,
              DrivingSessionRow
            >,
          ),
          DrivingSessionRow,
          PrefetchHooks Function()
        > {
  $$DrivingSessionsTableTableManager(
    _$AppDatabase db,
    $DrivingSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DrivingSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DrivingSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DrivingSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<String> view = const Value.absent(),
                Value<String> modelId = const Value.absent(),
                Value<String> recordingProfile = const Value.absent(),
                Value<String> metricsJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DrivingSessionsCompanion(
                id: id,
                startedAt: startedAt,
                endedAt: endedAt,
                view: view,
                modelId: modelId,
                recordingProfile: recordingProfile,
                metricsJson: metricsJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
                required String view,
                required String modelId,
                required String recordingProfile,
                Value<String> metricsJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DrivingSessionsCompanion.insert(
                id: id,
                startedAt: startedAt,
                endedAt: endedAt,
                view: view,
                modelId: modelId,
                recordingProfile: recordingProfile,
                metricsJson: metricsJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DrivingSessionsTable, DrivingSessionRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $DrivingSessionsTable,
                    DrivingSessionRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DrivingSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DrivingSessionsTable,
      DrivingSessionRow,
      $$DrivingSessionsTableFilterComposer,
      $$DrivingSessionsTableOrderingComposer,
      $$DrivingSessionsTableAnnotationComposer,
      $$DrivingSessionsTableCreateCompanionBuilder,
      $$DrivingSessionsTableUpdateCompanionBuilder,
      (
        DrivingSessionRow,
        BaseReferences<_$AppDatabase, $DrivingSessionsTable, DrivingSessionRow>,
      ),
      DrivingSessionRow,
      PrefetchHooks Function()
    >;
typedef $$EmergencyEventsTableCreateCompanionBuilder =
    EmergencyEventsCompanion Function({
      required String id,
      required DateTime triggeredAt,
      required String evidenceJson,
      Value<bool> cancelled,
      Value<String?> cancelledBy,
      Value<String?> clipId,
      Value<double?> lat,
      Value<double?> lon,
      Value<String> actionsJson,
      Value<int> rowid,
    });
typedef $$EmergencyEventsTableUpdateCompanionBuilder =
    EmergencyEventsCompanion Function({
      Value<String> id,
      Value<DateTime> triggeredAt,
      Value<String> evidenceJson,
      Value<bool> cancelled,
      Value<String?> cancelledBy,
      Value<String?> clipId,
      Value<double?> lat,
      Value<double?> lon,
      Value<String> actionsJson,
      Value<int> rowid,
    });

class $$EmergencyEventsTableFilterComposer
    extends Composer<_$AppDatabase, $EmergencyEventsTable> {
  $$EmergencyEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get triggeredAt => $composableBuilder(
    column: $table.triggeredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get evidenceJson => $composableBuilder(
    column: $table.evidenceJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get cancelled => $composableBuilder(
    column: $table.cancelled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cancelledBy => $composableBuilder(
    column: $table.cancelledBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clipId => $composableBuilder(
    column: $table.clipId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actionsJson => $composableBuilder(
    column: $table.actionsJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EmergencyEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $EmergencyEventsTable> {
  $$EmergencyEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get triggeredAt => $composableBuilder(
    column: $table.triggeredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get evidenceJson => $composableBuilder(
    column: $table.evidenceJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get cancelled => $composableBuilder(
    column: $table.cancelled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cancelledBy => $composableBuilder(
    column: $table.cancelledBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clipId => $composableBuilder(
    column: $table.clipId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actionsJson => $composableBuilder(
    column: $table.actionsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmergencyEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmergencyEventsTable> {
  $$EmergencyEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get triggeredAt => $composableBuilder(
    column: $table.triggeredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get evidenceJson => $composableBuilder(
    column: $table.evidenceJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get cancelled =>
      $composableBuilder(column: $table.cancelled, builder: (column) => column);

  GeneratedColumn<String> get cancelledBy => $composableBuilder(
    column: $table.cancelledBy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clipId =>
      $composableBuilder(column: $table.clipId, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  GeneratedColumn<String> get actionsJson => $composableBuilder(
    column: $table.actionsJson,
    builder: (column) => column,
  );
}

class $$EmergencyEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmergencyEventsTable,
          EmergencyEventRow,
          $$EmergencyEventsTableFilterComposer,
          $$EmergencyEventsTableOrderingComposer,
          $$EmergencyEventsTableAnnotationComposer,
          $$EmergencyEventsTableCreateCompanionBuilder,
          $$EmergencyEventsTableUpdateCompanionBuilder,
          (
            EmergencyEventRow,
            BaseReferences<
              _$AppDatabase,
              $EmergencyEventsTable,
              EmergencyEventRow
            >,
          ),
          EmergencyEventRow,
          PrefetchHooks Function()
        > {
  $$EmergencyEventsTableTableManager(
    _$AppDatabase db,
    $EmergencyEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmergencyEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmergencyEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmergencyEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> triggeredAt = const Value.absent(),
                Value<String> evidenceJson = const Value.absent(),
                Value<bool> cancelled = const Value.absent(),
                Value<String?> cancelledBy = const Value.absent(),
                Value<String?> clipId = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lon = const Value.absent(),
                Value<String> actionsJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EmergencyEventsCompanion(
                id: id,
                triggeredAt: triggeredAt,
                evidenceJson: evidenceJson,
                cancelled: cancelled,
                cancelledBy: cancelledBy,
                clipId: clipId,
                lat: lat,
                lon: lon,
                actionsJson: actionsJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime triggeredAt,
                required String evidenceJson,
                Value<bool> cancelled = const Value.absent(),
                Value<String?> cancelledBy = const Value.absent(),
                Value<String?> clipId = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lon = const Value.absent(),
                Value<String> actionsJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EmergencyEventsCompanion.insert(
                id: id,
                triggeredAt: triggeredAt,
                evidenceJson: evidenceJson,
                cancelled: cancelled,
                cancelledBy: cancelledBy,
                clipId: clipId,
                lat: lat,
                lon: lon,
                actionsJson: actionsJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$EmergencyEventsTable, EmergencyEventRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $EmergencyEventsTable,
                    EmergencyEventRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EmergencyEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmergencyEventsTable,
      EmergencyEventRow,
      $$EmergencyEventsTableFilterComposer,
      $$EmergencyEventsTableOrderingComposer,
      $$EmergencyEventsTableAnnotationComposer,
      $$EmergencyEventsTableCreateCompanionBuilder,
      $$EmergencyEventsTableUpdateCompanionBuilder,
      (
        EmergencyEventRow,
        BaseReferences<_$AppDatabase, $EmergencyEventsTable, EmergencyEventRow>,
      ),
      EmergencyEventRow,
      PrefetchHooks Function()
    >;
typedef $$AiModelsTableCreateCompanionBuilder = AiModelsCompanion Function({
  required String id,
  required String name,
  Value<String> version,
  Value<String> fileName,
  Value<String> labelsJson,
  Value<String> viewsJson,
  Value<String> license,
  Value<String> perfJson,
  Value<int> rowid,
});
typedef $$AiModelsTableUpdateCompanionBuilder = AiModelsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> version,
  Value<String> fileName,
  Value<String> labelsJson,
  Value<String> viewsJson,
  Value<String> license,
  Value<String> perfJson,
  Value<int> rowid,
});

class $$AiModelsTableFilterComposer
    extends Composer<_$AppDatabase, $AiModelsTable> {
  $$AiModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get labelsJson => $composableBuilder(
    column: $table.labelsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get viewsJson => $composableBuilder(
    column: $table.viewsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get license => $composableBuilder(
    column: $table.license,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get perfJson => $composableBuilder(
    column: $table.perfJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AiModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $AiModelsTable> {
  $$AiModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get labelsJson => $composableBuilder(
    column: $table.labelsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get viewsJson => $composableBuilder(
    column: $table.viewsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get license => $composableBuilder(
    column: $table.license,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get perfJson => $composableBuilder(
    column: $table.perfJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AiModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiModelsTable> {
  $$AiModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get labelsJson => $composableBuilder(
    column: $table.labelsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get viewsJson =>
      $composableBuilder(column: $table.viewsJson, builder: (column) => column);

  GeneratedColumn<String> get license =>
      $composableBuilder(column: $table.license, builder: (column) => column);

  GeneratedColumn<String> get perfJson =>
      $composableBuilder(column: $table.perfJson, builder: (column) => column);
}

class $$AiModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AiModelsTable,
          AiModelRow,
          $$AiModelsTableFilterComposer,
          $$AiModelsTableOrderingComposer,
          $$AiModelsTableAnnotationComposer,
          $$AiModelsTableCreateCompanionBuilder,
          $$AiModelsTableUpdateCompanionBuilder,
          (
            AiModelRow,
            BaseReferences<_$AppDatabase, $AiModelsTable, AiModelRow>,
          ),
          AiModelRow,
          PrefetchHooks Function()
        > {
  $$AiModelsTableTableManager(_$AppDatabase db, $AiModelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> version = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> labelsJson = const Value.absent(),
                Value<String> viewsJson = const Value.absent(),
                Value<String> license = const Value.absent(),
                Value<String> perfJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AiModelsCompanion(
                id: id,
                name: name,
                version: version,
                fileName: fileName,
                labelsJson: labelsJson,
                viewsJson: viewsJson,
                license: license,
                perfJson: perfJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> version = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> labelsJson = const Value.absent(),
                Value<String> viewsJson = const Value.absent(),
                Value<String> license = const Value.absent(),
                Value<String> perfJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AiModelsCompanion.insert(
                id: id,
                name: name,
                version: version,
                fileName: fileName,
                labelsJson: labelsJson,
                viewsJson: viewsJson,
                license: license,
                perfJson: perfJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AiModelsTable, AiModelRow>(table),
                  BaseReferences<_$AppDatabase, $AiModelsTable, AiModelRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AiModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AiModelsTable,
      AiModelRow,
      $$AiModelsTableFilterComposer,
      $$AiModelsTableOrderingComposer,
      $$AiModelsTableAnnotationComposer,
      $$AiModelsTableCreateCompanionBuilder,
      $$AiModelsTableUpdateCompanionBuilder,
      (AiModelRow, BaseReferences<_$AppDatabase, $AiModelsTable, AiModelRow>),
      AiModelRow,
      PrefetchHooks Function()
    >;
typedef $$DetectionsTableCreateCompanionBuilder = DetectionsCompanion Function({
  Value<int> id,
  required double ts,
  required int cls,
  required double conf,
  required double x,
  required double y,
  required double w,
  required double h,
  Value<int?> trackId,
  Value<double?> rangeM,
  Value<double?> bearing,
  Value<String> modelId,
});
typedef $$DetectionsTableUpdateCompanionBuilder = DetectionsCompanion Function({
  Value<int> id,
  Value<double> ts,
  Value<int> cls,
  Value<double> conf,
  Value<double> x,
  Value<double> y,
  Value<double> w,
  Value<double> h,
  Value<int?> trackId,
  Value<double?> rangeM,
  Value<double?> bearing,
  Value<String> modelId,
});

class $$DetectionsTableFilterComposer
    extends Composer<_$AppDatabase, $DetectionsTable> {
  $$DetectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ts => $composableBuilder(
    column: $table.ts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cls => $composableBuilder(
    column: $table.cls,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get conf => $composableBuilder(
    column: $table.conf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get x => $composableBuilder(
    column: $table.x,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get y => $composableBuilder(
    column: $table.y,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get w => $composableBuilder(
    column: $table.w,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get h => $composableBuilder(
    column: $table.h,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get trackId => $composableBuilder(
    column: $table.trackId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rangeM => $composableBuilder(
    column: $table.rangeM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bearing => $composableBuilder(
    column: $table.bearing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelId => $composableBuilder(
    column: $table.modelId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DetectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DetectionsTable> {
  $$DetectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ts => $composableBuilder(
    column: $table.ts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cls => $composableBuilder(
    column: $table.cls,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get conf => $composableBuilder(
    column: $table.conf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get x => $composableBuilder(
    column: $table.x,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get y => $composableBuilder(
    column: $table.y,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get w => $composableBuilder(
    column: $table.w,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get h => $composableBuilder(
    column: $table.h,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trackId => $composableBuilder(
    column: $table.trackId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rangeM => $composableBuilder(
    column: $table.rangeM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bearing => $composableBuilder(
    column: $table.bearing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelId => $composableBuilder(
    column: $table.modelId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DetectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DetectionsTable> {
  $$DetectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<int> get cls =>
      $composableBuilder(column: $table.cls, builder: (column) => column);

  GeneratedColumn<double> get conf =>
      $composableBuilder(column: $table.conf, builder: (column) => column);

  GeneratedColumn<double> get x =>
      $composableBuilder(column: $table.x, builder: (column) => column);

  GeneratedColumn<double> get y =>
      $composableBuilder(column: $table.y, builder: (column) => column);

  GeneratedColumn<double> get w =>
      $composableBuilder(column: $table.w, builder: (column) => column);

  GeneratedColumn<double> get h =>
      $composableBuilder(column: $table.h, builder: (column) => column);

  GeneratedColumn<int> get trackId =>
      $composableBuilder(column: $table.trackId, builder: (column) => column);

  GeneratedColumn<double> get rangeM =>
      $composableBuilder(column: $table.rangeM, builder: (column) => column);

  GeneratedColumn<double> get bearing =>
      $composableBuilder(column: $table.bearing, builder: (column) => column);

  GeneratedColumn<String> get modelId =>
      $composableBuilder(column: $table.modelId, builder: (column) => column);
}

class $$DetectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DetectionsTable,
          DetectionRow,
          $$DetectionsTableFilterComposer,
          $$DetectionsTableOrderingComposer,
          $$DetectionsTableAnnotationComposer,
          $$DetectionsTableCreateCompanionBuilder,
          $$DetectionsTableUpdateCompanionBuilder,
          (
            DetectionRow,
            BaseReferences<_$AppDatabase, $DetectionsTable, DetectionRow>,
          ),
          DetectionRow,
          PrefetchHooks Function()
        > {
  $$DetectionsTableTableManager(_$AppDatabase db, $DetectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DetectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DetectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DetectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> ts = const Value.absent(),
                Value<int> cls = const Value.absent(),
                Value<double> conf = const Value.absent(),
                Value<double> x = const Value.absent(),
                Value<double> y = const Value.absent(),
                Value<double> w = const Value.absent(),
                Value<double> h = const Value.absent(),
                Value<int?> trackId = const Value.absent(),
                Value<double?> rangeM = const Value.absent(),
                Value<double?> bearing = const Value.absent(),
                Value<String> modelId = const Value.absent(),
              }) => DetectionsCompanion(
                id: id,
                ts: ts,
                cls: cls,
                conf: conf,
                x: x,
                y: y,
                w: w,
                h: h,
                trackId: trackId,
                rangeM: rangeM,
                bearing: bearing,
                modelId: modelId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double ts,
                required int cls,
                required double conf,
                required double x,
                required double y,
                required double w,
                required double h,
                Value<int?> trackId = const Value.absent(),
                Value<double?> rangeM = const Value.absent(),
                Value<double?> bearing = const Value.absent(),
                Value<String> modelId = const Value.absent(),
              }) => DetectionsCompanion.insert(
                id: id,
                ts: ts,
                cls: cls,
                conf: conf,
                x: x,
                y: y,
                w: w,
                h: h,
                trackId: trackId,
                rangeM: rangeM,
                bearing: bearing,
                modelId: modelId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DetectionsTable, DetectionRow>(table),
                  BaseReferences<_$AppDatabase, $DetectionsTable, DetectionRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DetectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DetectionsTable,
      DetectionRow,
      $$DetectionsTableFilterComposer,
      $$DetectionsTableOrderingComposer,
      $$DetectionsTableAnnotationComposer,
      $$DetectionsTableCreateCompanionBuilder,
      $$DetectionsTableUpdateCompanionBuilder,
      (
        DetectionRow,
        BaseReferences<_$AppDatabase, $DetectionsTable, DetectionRow>,
      ),
      DetectionRow,
      PrefetchHooks Function()
    >;
typedef $$TripsTableCreateCompanionBuilder = TripsCompanion Function({
  required String id,
  required DateTime startedAt,
  Value<DateTime?> endedAt,
  Value<double> distanceM,
  Value<double> movingTimeS,
  Value<double> avgSpeedMs,
  Value<double> maxSpeedMs,
  Value<double?> startLat,
  Value<double?> startLon,
  Value<double?> endLat,
  Value<double?> endLon,
  Value<String?> startPlace,
  Value<String?> endPlace,
  Value<String> detectionCountsJson,
  Value<int> alertsCount,
  Value<int> incidentCount,
  Value<int> emergencyCount,
  Value<String> title,
  Value<bool> favorite,
  Value<int> rowid,
});
typedef $$TripsTableUpdateCompanionBuilder = TripsCompanion Function({
  Value<String> id,
  Value<DateTime> startedAt,
  Value<DateTime?> endedAt,
  Value<double> distanceM,
  Value<double> movingTimeS,
  Value<double> avgSpeedMs,
  Value<double> maxSpeedMs,
  Value<double?> startLat,
  Value<double?> startLon,
  Value<double?> endLat,
  Value<double?> endLon,
  Value<String?> startPlace,
  Value<String?> endPlace,
  Value<String> detectionCountsJson,
  Value<int> alertsCount,
  Value<int> incidentCount,
  Value<int> emergencyCount,
  Value<String> title,
  Value<bool> favorite,
  Value<int> rowid,
});

class $$TripsTableFilterComposer extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distanceM => $composableBuilder(
    column: $table.distanceM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get movingTimeS => $composableBuilder(
    column: $table.movingTimeS,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get avgSpeedMs => $composableBuilder(
    column: $table.avgSpeedMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maxSpeedMs => $composableBuilder(
    column: $table.maxSpeedMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get startLat => $composableBuilder(
    column: $table.startLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get startLon => $composableBuilder(
    column: $table.startLon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get endLat => $composableBuilder(
    column: $table.endLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get endLon => $composableBuilder(
    column: $table.endLon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startPlace => $composableBuilder(
    column: $table.startPlace,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endPlace => $composableBuilder(
    column: $table.endPlace,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detectionCountsJson => $composableBuilder(
    column: $table.detectionCountsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get alertsCount => $composableBuilder(
    column: $table.alertsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get incidentCount => $composableBuilder(
    column: $table.incidentCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get emergencyCount => $composableBuilder(
    column: $table.emergencyCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TripsTableOrderingComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distanceM => $composableBuilder(
    column: $table.distanceM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get movingTimeS => $composableBuilder(
    column: $table.movingTimeS,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get avgSpeedMs => $composableBuilder(
    column: $table.avgSpeedMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maxSpeedMs => $composableBuilder(
    column: $table.maxSpeedMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get startLat => $composableBuilder(
    column: $table.startLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get startLon => $composableBuilder(
    column: $table.startLon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get endLat => $composableBuilder(
    column: $table.endLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get endLon => $composableBuilder(
    column: $table.endLon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startPlace => $composableBuilder(
    column: $table.startPlace,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endPlace => $composableBuilder(
    column: $table.endPlace,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detectionCountsJson => $composableBuilder(
    column: $table.detectionCountsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get alertsCount => $composableBuilder(
    column: $table.alertsCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get incidentCount => $composableBuilder(
    column: $table.incidentCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get emergencyCount => $composableBuilder(
    column: $table.emergencyCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TripsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<double> get distanceM =>
      $composableBuilder(column: $table.distanceM, builder: (column) => column);

  GeneratedColumn<double> get movingTimeS => $composableBuilder(
    column: $table.movingTimeS,
    builder: (column) => column,
  );

  GeneratedColumn<double> get avgSpeedMs => $composableBuilder(
    column: $table.avgSpeedMs,
    builder: (column) => column,
  );

  GeneratedColumn<double> get maxSpeedMs => $composableBuilder(
    column: $table.maxSpeedMs,
    builder: (column) => column,
  );

  GeneratedColumn<double> get startLat =>
      $composableBuilder(column: $table.startLat, builder: (column) => column);

  GeneratedColumn<double> get startLon =>
      $composableBuilder(column: $table.startLon, builder: (column) => column);

  GeneratedColumn<double> get endLat =>
      $composableBuilder(column: $table.endLat, builder: (column) => column);

  GeneratedColumn<double> get endLon =>
      $composableBuilder(column: $table.endLon, builder: (column) => column);

  GeneratedColumn<String> get startPlace => $composableBuilder(
    column: $table.startPlace,
    builder: (column) => column,
  );

  GeneratedColumn<String> get endPlace =>
      $composableBuilder(column: $table.endPlace, builder: (column) => column);

  GeneratedColumn<String> get detectionCountsJson => $composableBuilder(
    column: $table.detectionCountsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get alertsCount => $composableBuilder(
    column: $table.alertsCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get incidentCount => $composableBuilder(
    column: $table.incidentCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get emergencyCount => $composableBuilder(
    column: $table.emergencyCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get favorite =>
      $composableBuilder(column: $table.favorite, builder: (column) => column);
}

class $$TripsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TripsTable,
          TripRow,
          $$TripsTableFilterComposer,
          $$TripsTableOrderingComposer,
          $$TripsTableAnnotationComposer,
          $$TripsTableCreateCompanionBuilder,
          $$TripsTableUpdateCompanionBuilder,
          (TripRow, BaseReferences<_$AppDatabase, $TripsTable, TripRow>),
          TripRow,
          PrefetchHooks Function()
        > {
  $$TripsTableTableManager(_$AppDatabase db, $TripsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<double> distanceM = const Value.absent(),
                Value<double> movingTimeS = const Value.absent(),
                Value<double> avgSpeedMs = const Value.absent(),
                Value<double> maxSpeedMs = const Value.absent(),
                Value<double?> startLat = const Value.absent(),
                Value<double?> startLon = const Value.absent(),
                Value<double?> endLat = const Value.absent(),
                Value<double?> endLon = const Value.absent(),
                Value<String?> startPlace = const Value.absent(),
                Value<String?> endPlace = const Value.absent(),
                Value<String> detectionCountsJson = const Value.absent(),
                Value<int> alertsCount = const Value.absent(),
                Value<int> incidentCount = const Value.absent(),
                Value<int> emergencyCount = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> favorite = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TripsCompanion(
                id: id,
                startedAt: startedAt,
                endedAt: endedAt,
                distanceM: distanceM,
                movingTimeS: movingTimeS,
                avgSpeedMs: avgSpeedMs,
                maxSpeedMs: maxSpeedMs,
                startLat: startLat,
                startLon: startLon,
                endLat: endLat,
                endLon: endLon,
                startPlace: startPlace,
                endPlace: endPlace,
                detectionCountsJson: detectionCountsJson,
                alertsCount: alertsCount,
                incidentCount: incidentCount,
                emergencyCount: emergencyCount,
                title: title,
                favorite: favorite,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
                Value<double> distanceM = const Value.absent(),
                Value<double> movingTimeS = const Value.absent(),
                Value<double> avgSpeedMs = const Value.absent(),
                Value<double> maxSpeedMs = const Value.absent(),
                Value<double?> startLat = const Value.absent(),
                Value<double?> startLon = const Value.absent(),
                Value<double?> endLat = const Value.absent(),
                Value<double?> endLon = const Value.absent(),
                Value<String?> startPlace = const Value.absent(),
                Value<String?> endPlace = const Value.absent(),
                Value<String> detectionCountsJson = const Value.absent(),
                Value<int> alertsCount = const Value.absent(),
                Value<int> incidentCount = const Value.absent(),
                Value<int> emergencyCount = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> favorite = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TripsCompanion.insert(
                id: id,
                startedAt: startedAt,
                endedAt: endedAt,
                distanceM: distanceM,
                movingTimeS: movingTimeS,
                avgSpeedMs: avgSpeedMs,
                maxSpeedMs: maxSpeedMs,
                startLat: startLat,
                startLon: startLon,
                endLat: endLat,
                endLon: endLon,
                startPlace: startPlace,
                endPlace: endPlace,
                detectionCountsJson: detectionCountsJson,
                alertsCount: alertsCount,
                incidentCount: incidentCount,
                emergencyCount: emergencyCount,
                title: title,
                favorite: favorite,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TripsTable, TripRow>(table),
                  BaseReferences<_$AppDatabase, $TripsTable, TripRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TripsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TripsTable,
      TripRow,
      $$TripsTableFilterComposer,
      $$TripsTableOrderingComposer,
      $$TripsTableAnnotationComposer,
      $$TripsTableCreateCompanionBuilder,
      $$TripsTableUpdateCompanionBuilder,
      (TripRow, BaseReferences<_$AppDatabase, $TripsTable, TripRow>),
      TripRow,
      PrefetchHooks Function()
    >;
typedef $$TripPointsTableCreateCompanionBuilder = TripPointsCompanion Function({
  Value<int> id,
  required String tripId,
  required double ts,
  required double lat,
  required double lon,
  required double speed,
  required double course,
  required double hAcc,
});
typedef $$TripPointsTableUpdateCompanionBuilder = TripPointsCompanion Function({
  Value<int> id,
  Value<String> tripId,
  Value<double> ts,
  Value<double> lat,
  Value<double> lon,
  Value<double> speed,
  Value<double> course,
  Value<double> hAcc,
});

class $$TripPointsTableFilterComposer
    extends Composer<_$AppDatabase, $TripPointsTable> {
  $$TripPointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tripId => $composableBuilder(
    column: $table.tripId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ts => $composableBuilder(
    column: $table.ts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get course => $composableBuilder(
    column: $table.course,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hAcc => $composableBuilder(
    column: $table.hAcc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TripPointsTableOrderingComposer
    extends Composer<_$AppDatabase, $TripPointsTable> {
  $$TripPointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tripId => $composableBuilder(
    column: $table.tripId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ts => $composableBuilder(
    column: $table.ts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get course => $composableBuilder(
    column: $table.course,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hAcc => $composableBuilder(
    column: $table.hAcc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TripPointsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripPointsTable> {
  $$TripPointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tripId =>
      $composableBuilder(column: $table.tripId, builder: (column) => column);

  GeneratedColumn<double> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<double> get course =>
      $composableBuilder(column: $table.course, builder: (column) => column);

  GeneratedColumn<double> get hAcc =>
      $composableBuilder(column: $table.hAcc, builder: (column) => column);
}

class $$TripPointsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TripPointsTable,
          TripPointRow,
          $$TripPointsTableFilterComposer,
          $$TripPointsTableOrderingComposer,
          $$TripPointsTableAnnotationComposer,
          $$TripPointsTableCreateCompanionBuilder,
          $$TripPointsTableUpdateCompanionBuilder,
          (
            TripPointRow,
            BaseReferences<_$AppDatabase, $TripPointsTable, TripPointRow>,
          ),
          TripPointRow,
          PrefetchHooks Function()
        > {
  $$TripPointsTableTableManager(_$AppDatabase db, $TripPointsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripPointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripPointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripPointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> tripId = const Value.absent(),
                Value<double> ts = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lon = const Value.absent(),
                Value<double> speed = const Value.absent(),
                Value<double> course = const Value.absent(),
                Value<double> hAcc = const Value.absent(),
              }) => TripPointsCompanion(
                id: id,
                tripId: tripId,
                ts: ts,
                lat: lat,
                lon: lon,
                speed: speed,
                course: course,
                hAcc: hAcc,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String tripId,
                required double ts,
                required double lat,
                required double lon,
                required double speed,
                required double course,
                required double hAcc,
              }) => TripPointsCompanion.insert(
                id: id,
                tripId: tripId,
                ts: ts,
                lat: lat,
                lon: lon,
                speed: speed,
                course: course,
                hAcc: hAcc,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TripPointsTable, TripPointRow>(table),
                  BaseReferences<_$AppDatabase, $TripPointsTable, TripPointRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TripPointsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TripPointsTable,
      TripPointRow,
      $$TripPointsTableFilterComposer,
      $$TripPointsTableOrderingComposer,
      $$TripPointsTableAnnotationComposer,
      $$TripPointsTableCreateCompanionBuilder,
      $$TripPointsTableUpdateCompanionBuilder,
      (
        TripPointRow,
        BaseReferences<_$AppDatabase, $TripPointsTable, TripPointRow>,
      ),
      TripPointRow,
      PrefetchHooks Function()
    >;
typedef $$TripEventsTableCreateCompanionBuilder = TripEventsCompanion Function({
  Value<int> id,
  required String tripId,
  required double ts,
  required String kind,
  Value<String> label,
  Value<String?> refId,
  Value<double?> lat,
  Value<double?> lon,
});
typedef $$TripEventsTableUpdateCompanionBuilder = TripEventsCompanion Function({
  Value<int> id,
  Value<String> tripId,
  Value<double> ts,
  Value<String> kind,
  Value<String> label,
  Value<String?> refId,
  Value<double?> lat,
  Value<double?> lon,
});

class $$TripEventsTableFilterComposer
    extends Composer<_$AppDatabase, $TripEventsTable> {
  $$TripEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tripId => $composableBuilder(
    column: $table.tripId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ts => $composableBuilder(
    column: $table.ts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TripEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $TripEventsTable> {
  $$TripEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tripId => $composableBuilder(
    column: $table.tripId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ts => $composableBuilder(
    column: $table.ts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TripEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripEventsTable> {
  $$TripEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tripId =>
      $composableBuilder(column: $table.tripId, builder: (column) => column);

  GeneratedColumn<double> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);
}

class $$TripEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TripEventsTable,
          TripEventRow,
          $$TripEventsTableFilterComposer,
          $$TripEventsTableOrderingComposer,
          $$TripEventsTableAnnotationComposer,
          $$TripEventsTableCreateCompanionBuilder,
          $$TripEventsTableUpdateCompanionBuilder,
          (
            TripEventRow,
            BaseReferences<_$AppDatabase, $TripEventsTable, TripEventRow>,
          ),
          TripEventRow,
          PrefetchHooks Function()
        > {
  $$TripEventsTableTableManager(_$AppDatabase db, $TripEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> tripId = const Value.absent(),
                Value<double> ts = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String?> refId = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lon = const Value.absent(),
              }) => TripEventsCompanion(
                id: id,
                tripId: tripId,
                ts: ts,
                kind: kind,
                label: label,
                refId: refId,
                lat: lat,
                lon: lon,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String tripId,
                required double ts,
                required String kind,
                Value<String> label = const Value.absent(),
                Value<String?> refId = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lon = const Value.absent(),
              }) => TripEventsCompanion.insert(
                id: id,
                tripId: tripId,
                ts: ts,
                kind: kind,
                label: label,
                refId: refId,
                lat: lat,
                lon: lon,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TripEventsTable, TripEventRow>(table),
                  BaseReferences<_$AppDatabase, $TripEventsTable, TripEventRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TripEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TripEventsTable,
      TripEventRow,
      $$TripEventsTableFilterComposer,
      $$TripEventsTableOrderingComposer,
      $$TripEventsTableAnnotationComposer,
      $$TripEventsTableCreateCompanionBuilder,
      $$TripEventsTableUpdateCompanionBuilder,
      (
        TripEventRow,
        BaseReferences<_$AppDatabase, $TripEventsTable, TripEventRow>,
      ),
      TripEventRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$IncidentClipsTableTableManager get incidentClips =>
      $$IncidentClipsTableTableManager(_db, _db.incidentClips);
  $$DrivingSessionsTableTableManager get drivingSessions =>
      $$DrivingSessionsTableTableManager(_db, _db.drivingSessions);
  $$EmergencyEventsTableTableManager get emergencyEvents =>
      $$EmergencyEventsTableTableManager(_db, _db.emergencyEvents);
  $$AiModelsTableTableManager get aiModels =>
      $$AiModelsTableTableManager(_db, _db.aiModels);
  $$DetectionsTableTableManager get detections =>
      $$DetectionsTableTableManager(_db, _db.detections);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db, _db.trips);
  $$TripPointsTableTableManager get tripPoints =>
      $$TripPointsTableTableManager(_db, _db.tripPoints);
  $$TripEventsTableTableManager get tripEvents =>
      $$TripEventsTableTableManager(_db, _db.tripEvents);
}
