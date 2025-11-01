// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastModifiedUtcMeta = const VerificationMeta(
    'lastModifiedUtc',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedUtc =
      GeneratedColumn<DateTime>(
        'last_modified_utc',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    displayName,
    email,
    lastModifiedUtc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('last_modified_utc')) {
      context.handle(
        _lastModifiedUtcMeta,
        lastModifiedUtc.isAcceptableOrUnknown(
          data['last_modified_utc']!,
          _lastModifiedUtcMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      lastModifiedUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_utc'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String? displayName;
  final String? email;
  final DateTime? lastModifiedUtc;
  const User({
    required this.id,
    this.displayName,
    this.email,
    this.lastModifiedUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || lastModifiedUtc != null) {
      map['last_modified_utc'] = Variable<DateTime>(lastModifiedUtc);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      displayName:
          displayName == null && nullToAbsent
              ? const Value.absent()
              : Value(displayName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      lastModifiedUtc:
          lastModifiedUtc == null && nullToAbsent
              ? const Value.absent()
              : Value(lastModifiedUtc),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      email: serializer.fromJson<String?>(json['email']),
      lastModifiedUtc: serializer.fromJson<DateTime?>(json['lastModifiedUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String?>(displayName),
      'email': serializer.toJson<String?>(email),
      'lastModifiedUtc': serializer.toJson<DateTime?>(lastModifiedUtc),
    };
  }

  User copyWith({
    String? id,
    Value<String?> displayName = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<DateTime?> lastModifiedUtc = const Value.absent(),
  }) => User(
    id: id ?? this.id,
    displayName: displayName.present ? displayName.value : this.displayName,
    email: email.present ? email.value : this.email,
    lastModifiedUtc:
        lastModifiedUtc.present ? lastModifiedUtc.value : this.lastModifiedUtc,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      email: data.email.present ? data.email.value : this.email,
      lastModifiedUtc:
          data.lastModifiedUtc.present
              ? data.lastModifiedUtc.value
              : this.lastModifiedUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('lastModifiedUtc: $lastModifiedUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, displayName, email, lastModifiedUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.email == this.email &&
          other.lastModifiedUtc == this.lastModifiedUtc);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String?> displayName;
  final Value<String?> email;
  final Value<DateTime?> lastModifiedUtc;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.lastModifiedUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.lastModifiedUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? email,
    Expression<DateTime>? lastModifiedUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (email != null) 'email': email,
      if (lastModifiedUtc != null) 'last_modified_utc': lastModifiedUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String?>? displayName,
    Value<String?>? email,
    Value<DateTime?>? lastModifiedUtc,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      lastModifiedUtc: lastModifiedUtc ?? this.lastModifiedUtc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (lastModifiedUtc.present) {
      map['last_modified_utc'] = Variable<DateTime>(lastModifiedUtc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('lastModifiedUtc: $lastModifiedUtc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TestPlansTable extends TestPlans
    with TableInfo<$TestPlansTable, TestPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestPlansTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _lastModifiedUtcMeta = const VerificationMeta(
    'lastModifiedUtc',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedUtc =
      GeneratedColumn<DateTime>(
        'last_modified_utc',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _overallPassedMeta = const VerificationMeta(
    'overallPassed',
  );
  @override
  late final GeneratedColumn<int> overallPassed = GeneratedColumn<int>(
    'overall_passed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _overallFailedMeta = const VerificationMeta(
    'overallFailed',
  );
  @override
  late final GeneratedColumn<int> overallFailed = GeneratedColumn<int>(
    'overall_failed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _overallBlockedMeta = const VerificationMeta(
    'overallBlocked',
  );
  @override
  late final GeneratedColumn<int> overallBlocked = GeneratedColumn<int>(
    'overall_blocked',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    ownerUserId,
    lastModifiedUtc,
    overallPassed,
    overallFailed,
    overallBlocked,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestPlan> instance, {
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
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('last_modified_utc')) {
      context.handle(
        _lastModifiedUtcMeta,
        lastModifiedUtc.isAcceptableOrUnknown(
          data['last_modified_utc']!,
          _lastModifiedUtcMeta,
        ),
      );
    }
    if (data.containsKey('overall_passed')) {
      context.handle(
        _overallPassedMeta,
        overallPassed.isAcceptableOrUnknown(
          data['overall_passed']!,
          _overallPassedMeta,
        ),
      );
    }
    if (data.containsKey('overall_failed')) {
      context.handle(
        _overallFailedMeta,
        overallFailed.isAcceptableOrUnknown(
          data['overall_failed']!,
          _overallFailedMeta,
        ),
      );
    }
    if (data.containsKey('overall_blocked')) {
      context.handle(
        _overallBlockedMeta,
        overallBlocked.isAcceptableOrUnknown(
          data['overall_blocked']!,
          _overallBlockedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestPlan(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      lastModifiedUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_utc'],
      ),
      overallPassed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}overall_passed'],
          )!,
      overallFailed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}overall_failed'],
          )!,
      overallBlocked:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}overall_blocked'],
          )!,
    );
  }

  @override
  $TestPlansTable createAlias(String alias) {
    return $TestPlansTable(attachedDatabase, alias);
  }
}

class TestPlan extends DataClass implements Insertable<TestPlan> {
  final String id;
  final String name;
  final String? description;
  final String? ownerUserId;
  final DateTime? lastModifiedUtc;
  final int overallPassed;
  final int overallFailed;
  final int overallBlocked;
  const TestPlan({
    required this.id,
    required this.name,
    this.description,
    this.ownerUserId,
    this.lastModifiedUtc,
    required this.overallPassed,
    required this.overallFailed,
    required this.overallBlocked,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    if (!nullToAbsent || lastModifiedUtc != null) {
      map['last_modified_utc'] = Variable<DateTime>(lastModifiedUtc);
    }
    map['overall_passed'] = Variable<int>(overallPassed);
    map['overall_failed'] = Variable<int>(overallFailed);
    map['overall_blocked'] = Variable<int>(overallBlocked);
    return map;
  }

  TestPlansCompanion toCompanion(bool nullToAbsent) {
    return TestPlansCompanion(
      id: Value(id),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      ownerUserId:
          ownerUserId == null && nullToAbsent
              ? const Value.absent()
              : Value(ownerUserId),
      lastModifiedUtc:
          lastModifiedUtc == null && nullToAbsent
              ? const Value.absent()
              : Value(lastModifiedUtc),
      overallPassed: Value(overallPassed),
      overallFailed: Value(overallFailed),
      overallBlocked: Value(overallBlocked),
    );
  }

  factory TestPlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestPlan(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      lastModifiedUtc: serializer.fromJson<DateTime?>(json['lastModifiedUtc']),
      overallPassed: serializer.fromJson<int>(json['overallPassed']),
      overallFailed: serializer.fromJson<int>(json['overallFailed']),
      overallBlocked: serializer.fromJson<int>(json['overallBlocked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'lastModifiedUtc': serializer.toJson<DateTime?>(lastModifiedUtc),
      'overallPassed': serializer.toJson<int>(overallPassed),
      'overallFailed': serializer.toJson<int>(overallFailed),
      'overallBlocked': serializer.toJson<int>(overallBlocked),
    };
  }

  TestPlan copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    Value<DateTime?> lastModifiedUtc = const Value.absent(),
    int? overallPassed,
    int? overallFailed,
    int? overallBlocked,
  }) => TestPlan(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    lastModifiedUtc:
        lastModifiedUtc.present ? lastModifiedUtc.value : this.lastModifiedUtc,
    overallPassed: overallPassed ?? this.overallPassed,
    overallFailed: overallFailed ?? this.overallFailed,
    overallBlocked: overallBlocked ?? this.overallBlocked,
  );
  TestPlan copyWithCompanion(TestPlansCompanion data) {
    return TestPlan(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      ownerUserId:
          data.ownerUserId.present ? data.ownerUserId.value : this.ownerUserId,
      lastModifiedUtc:
          data.lastModifiedUtc.present
              ? data.lastModifiedUtc.value
              : this.lastModifiedUtc,
      overallPassed:
          data.overallPassed.present
              ? data.overallPassed.value
              : this.overallPassed,
      overallFailed:
          data.overallFailed.present
              ? data.overallFailed.value
              : this.overallFailed,
      overallBlocked:
          data.overallBlocked.present
              ? data.overallBlocked.value
              : this.overallBlocked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestPlan(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('lastModifiedUtc: $lastModifiedUtc, ')
          ..write('overallPassed: $overallPassed, ')
          ..write('overallFailed: $overallFailed, ')
          ..write('overallBlocked: $overallBlocked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    ownerUserId,
    lastModifiedUtc,
    overallPassed,
    overallFailed,
    overallBlocked,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestPlan &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.ownerUserId == this.ownerUserId &&
          other.lastModifiedUtc == this.lastModifiedUtc &&
          other.overallPassed == this.overallPassed &&
          other.overallFailed == this.overallFailed &&
          other.overallBlocked == this.overallBlocked);
}

class TestPlansCompanion extends UpdateCompanion<TestPlan> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> ownerUserId;
  final Value<DateTime?> lastModifiedUtc;
  final Value<int> overallPassed;
  final Value<int> overallFailed;
  final Value<int> overallBlocked;
  final Value<int> rowid;
  const TestPlansCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.lastModifiedUtc = const Value.absent(),
    this.overallPassed = const Value.absent(),
    this.overallFailed = const Value.absent(),
    this.overallBlocked = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestPlansCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.lastModifiedUtc = const Value.absent(),
    this.overallPassed = const Value.absent(),
    this.overallFailed = const Value.absent(),
    this.overallBlocked = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<TestPlan> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? ownerUserId,
    Expression<DateTime>? lastModifiedUtc,
    Expression<int>? overallPassed,
    Expression<int>? overallFailed,
    Expression<int>? overallBlocked,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (lastModifiedUtc != null) 'last_modified_utc': lastModifiedUtc,
      if (overallPassed != null) 'overall_passed': overallPassed,
      if (overallFailed != null) 'overall_failed': overallFailed,
      if (overallBlocked != null) 'overall_blocked': overallBlocked,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestPlansCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? ownerUserId,
    Value<DateTime?>? lastModifiedUtc,
    Value<int>? overallPassed,
    Value<int>? overallFailed,
    Value<int>? overallBlocked,
    Value<int>? rowid,
  }) {
    return TestPlansCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      lastModifiedUtc: lastModifiedUtc ?? this.lastModifiedUtc,
      overallPassed: overallPassed ?? this.overallPassed,
      overallFailed: overallFailed ?? this.overallFailed,
      overallBlocked: overallBlocked ?? this.overallBlocked,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (lastModifiedUtc.present) {
      map['last_modified_utc'] = Variable<DateTime>(lastModifiedUtc.value);
    }
    if (overallPassed.present) {
      map['overall_passed'] = Variable<int>(overallPassed.value);
    }
    if (overallFailed.present) {
      map['overall_failed'] = Variable<int>(overallFailed.value);
    }
    if (overallBlocked.present) {
      map['overall_blocked'] = Variable<int>(overallBlocked.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestPlansCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('lastModifiedUtc: $lastModifiedUtc, ')
          ..write('overallPassed: $overallPassed, ')
          ..write('overallFailed: $overallFailed, ')
          ..write('overallBlocked: $overallBlocked, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TestCasesTable extends TestCases
    with TableInfo<$TestCasesTable, TestCase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestCasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
    'plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES test_plans (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assignedToUserIdMeta = const VerificationMeta(
    'assignedToUserId',
  );
  @override
  late final GeneratedColumn<String> assignedToUserId = GeneratedColumn<String>(
    'assigned_to_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _expectedResultMeta = const VerificationMeta(
    'expectedResult',
  );
  @override
  late final GeneratedColumn<String> expectedResult = GeneratedColumn<String>(
    'expected_result',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastModifiedUtcMeta = const VerificationMeta(
    'lastModifiedUtc',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedUtc =
      GeneratedColumn<DateTime>(
        'last_modified_utc',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    planId,
    title,
    status,
    assignedToUserId,
    expectedResult,
    lastModifiedUtc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_cases';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestCase> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('assigned_to_user_id')) {
      context.handle(
        _assignedToUserIdMeta,
        assignedToUserId.isAcceptableOrUnknown(
          data['assigned_to_user_id']!,
          _assignedToUserIdMeta,
        ),
      );
    }
    if (data.containsKey('expected_result')) {
      context.handle(
        _expectedResultMeta,
        expectedResult.isAcceptableOrUnknown(
          data['expected_result']!,
          _expectedResultMeta,
        ),
      );
    }
    if (data.containsKey('last_modified_utc')) {
      context.handle(
        _lastModifiedUtcMeta,
        lastModifiedUtc.isAcceptableOrUnknown(
          data['last_modified_utc']!,
          _lastModifiedUtcMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestCase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestCase(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      planId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}plan_id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      assignedToUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assigned_to_user_id'],
      ),
      expectedResult: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expected_result'],
      ),
      lastModifiedUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_utc'],
      ),
    );
  }

  @override
  $TestCasesTable createAlias(String alias) {
    return $TestCasesTable(attachedDatabase, alias);
  }
}

class TestCase extends DataClass implements Insertable<TestCase> {
  final String id;
  final String planId;
  final String title;
  final String status;
  final String? assignedToUserId;
  final String? expectedResult;
  final DateTime? lastModifiedUtc;
  const TestCase({
    required this.id,
    required this.planId,
    required this.title,
    required this.status,
    this.assignedToUserId,
    this.expectedResult,
    this.lastModifiedUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plan_id'] = Variable<String>(planId);
    map['title'] = Variable<String>(title);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || assignedToUserId != null) {
      map['assigned_to_user_id'] = Variable<String>(assignedToUserId);
    }
    if (!nullToAbsent || expectedResult != null) {
      map['expected_result'] = Variable<String>(expectedResult);
    }
    if (!nullToAbsent || lastModifiedUtc != null) {
      map['last_modified_utc'] = Variable<DateTime>(lastModifiedUtc);
    }
    return map;
  }

  TestCasesCompanion toCompanion(bool nullToAbsent) {
    return TestCasesCompanion(
      id: Value(id),
      planId: Value(planId),
      title: Value(title),
      status: Value(status),
      assignedToUserId:
          assignedToUserId == null && nullToAbsent
              ? const Value.absent()
              : Value(assignedToUserId),
      expectedResult:
          expectedResult == null && nullToAbsent
              ? const Value.absent()
              : Value(expectedResult),
      lastModifiedUtc:
          lastModifiedUtc == null && nullToAbsent
              ? const Value.absent()
              : Value(lastModifiedUtc),
    );
  }

  factory TestCase.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestCase(
      id: serializer.fromJson<String>(json['id']),
      planId: serializer.fromJson<String>(json['planId']),
      title: serializer.fromJson<String>(json['title']),
      status: serializer.fromJson<String>(json['status']),
      assignedToUserId: serializer.fromJson<String?>(json['assignedToUserId']),
      expectedResult: serializer.fromJson<String?>(json['expectedResult']),
      lastModifiedUtc: serializer.fromJson<DateTime?>(json['lastModifiedUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'planId': serializer.toJson<String>(planId),
      'title': serializer.toJson<String>(title),
      'status': serializer.toJson<String>(status),
      'assignedToUserId': serializer.toJson<String?>(assignedToUserId),
      'expectedResult': serializer.toJson<String?>(expectedResult),
      'lastModifiedUtc': serializer.toJson<DateTime?>(lastModifiedUtc),
    };
  }

  TestCase copyWith({
    String? id,
    String? planId,
    String? title,
    String? status,
    Value<String?> assignedToUserId = const Value.absent(),
    Value<String?> expectedResult = const Value.absent(),
    Value<DateTime?> lastModifiedUtc = const Value.absent(),
  }) => TestCase(
    id: id ?? this.id,
    planId: planId ?? this.planId,
    title: title ?? this.title,
    status: status ?? this.status,
    assignedToUserId:
        assignedToUserId.present
            ? assignedToUserId.value
            : this.assignedToUserId,
    expectedResult:
        expectedResult.present ? expectedResult.value : this.expectedResult,
    lastModifiedUtc:
        lastModifiedUtc.present ? lastModifiedUtc.value : this.lastModifiedUtc,
  );
  TestCase copyWithCompanion(TestCasesCompanion data) {
    return TestCase(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      title: data.title.present ? data.title.value : this.title,
      status: data.status.present ? data.status.value : this.status,
      assignedToUserId:
          data.assignedToUserId.present
              ? data.assignedToUserId.value
              : this.assignedToUserId,
      expectedResult:
          data.expectedResult.present
              ? data.expectedResult.value
              : this.expectedResult,
      lastModifiedUtc:
          data.lastModifiedUtc.present
              ? data.lastModifiedUtc.value
              : this.lastModifiedUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestCase(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('assignedToUserId: $assignedToUserId, ')
          ..write('expectedResult: $expectedResult, ')
          ..write('lastModifiedUtc: $lastModifiedUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    planId,
    title,
    status,
    assignedToUserId,
    expectedResult,
    lastModifiedUtc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestCase &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.title == this.title &&
          other.status == this.status &&
          other.assignedToUserId == this.assignedToUserId &&
          other.expectedResult == this.expectedResult &&
          other.lastModifiedUtc == this.lastModifiedUtc);
}

class TestCasesCompanion extends UpdateCompanion<TestCase> {
  final Value<String> id;
  final Value<String> planId;
  final Value<String> title;
  final Value<String> status;
  final Value<String?> assignedToUserId;
  final Value<String?> expectedResult;
  final Value<DateTime?> lastModifiedUtc;
  final Value<int> rowid;
  const TestCasesCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.assignedToUserId = const Value.absent(),
    this.expectedResult = const Value.absent(),
    this.lastModifiedUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestCasesCompanion.insert({
    required String id,
    required String planId,
    required String title,
    required String status,
    this.assignedToUserId = const Value.absent(),
    this.expectedResult = const Value.absent(),
    this.lastModifiedUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       planId = Value(planId),
       title = Value(title),
       status = Value(status);
  static Insertable<TestCase> custom({
    Expression<String>? id,
    Expression<String>? planId,
    Expression<String>? title,
    Expression<String>? status,
    Expression<String>? assignedToUserId,
    Expression<String>? expectedResult,
    Expression<DateTime>? lastModifiedUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (assignedToUserId != null) 'assigned_to_user_id': assignedToUserId,
      if (expectedResult != null) 'expected_result': expectedResult,
      if (lastModifiedUtc != null) 'last_modified_utc': lastModifiedUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestCasesCompanion copyWith({
    Value<String>? id,
    Value<String>? planId,
    Value<String>? title,
    Value<String>? status,
    Value<String?>? assignedToUserId,
    Value<String?>? expectedResult,
    Value<DateTime?>? lastModifiedUtc,
    Value<int>? rowid,
  }) {
    return TestCasesCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      title: title ?? this.title,
      status: status ?? this.status,
      assignedToUserId: assignedToUserId ?? this.assignedToUserId,
      expectedResult: expectedResult ?? this.expectedResult,
      lastModifiedUtc: lastModifiedUtc ?? this.lastModifiedUtc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (assignedToUserId.present) {
      map['assigned_to_user_id'] = Variable<String>(assignedToUserId.value);
    }
    if (expectedResult.present) {
      map['expected_result'] = Variable<String>(expectedResult.value);
    }
    if (lastModifiedUtc.present) {
      map['last_modified_utc'] = Variable<DateTime>(lastModifiedUtc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestCasesCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('assignedToUserId: $assignedToUserId, ')
          ..write('expectedResult: $expectedResult, ')
          ..write('lastModifiedUtc: $lastModifiedUtc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TestStepsTable extends TestSteps
    with TableInfo<$TestStepsTable, TestStep> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestStepsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _testCaseIdMeta = const VerificationMeta(
    'testCaseId',
  );
  @override
  late final GeneratedColumn<String> testCaseId = GeneratedColumn<String>(
    'test_case_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES test_cases (id)',
    ),
  );
  static const VerificationMeta _stepNumberMeta = const VerificationMeta(
    'stepNumber',
  );
  @override
  late final GeneratedColumn<int> stepNumber = GeneratedColumn<int>(
    'step_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expectedMeta = const VerificationMeta(
    'expected',
  );
  @override
  late final GeneratedColumn<String> expected = GeneratedColumn<String>(
    'expected',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    testCaseId,
    stepNumber,
    description,
    expected,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestStep> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('test_case_id')) {
      context.handle(
        _testCaseIdMeta,
        testCaseId.isAcceptableOrUnknown(
          data['test_case_id']!,
          _testCaseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_testCaseIdMeta);
    }
    if (data.containsKey('step_number')) {
      context.handle(
        _stepNumberMeta,
        stepNumber.isAcceptableOrUnknown(data['step_number']!, _stepNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_stepNumberMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('expected')) {
      context.handle(
        _expectedMeta,
        expected.isAcceptableOrUnknown(data['expected']!, _expectedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestStep map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestStep(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      testCaseId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}test_case_id'],
          )!,
      stepNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}step_number'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      expected: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expected'],
      ),
    );
  }

  @override
  $TestStepsTable createAlias(String alias) {
    return $TestStepsTable(attachedDatabase, alias);
  }
}

class TestStep extends DataClass implements Insertable<TestStep> {
  final String id;
  final String testCaseId;
  final int stepNumber;
  final String description;
  final String? expected;
  const TestStep({
    required this.id,
    required this.testCaseId,
    required this.stepNumber,
    required this.description,
    this.expected,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['test_case_id'] = Variable<String>(testCaseId);
    map['step_number'] = Variable<int>(stepNumber);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || expected != null) {
      map['expected'] = Variable<String>(expected);
    }
    return map;
  }

  TestStepsCompanion toCompanion(bool nullToAbsent) {
    return TestStepsCompanion(
      id: Value(id),
      testCaseId: Value(testCaseId),
      stepNumber: Value(stepNumber),
      description: Value(description),
      expected:
          expected == null && nullToAbsent
              ? const Value.absent()
              : Value(expected),
    );
  }

  factory TestStep.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestStep(
      id: serializer.fromJson<String>(json['id']),
      testCaseId: serializer.fromJson<String>(json['testCaseId']),
      stepNumber: serializer.fromJson<int>(json['stepNumber']),
      description: serializer.fromJson<String>(json['description']),
      expected: serializer.fromJson<String?>(json['expected']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'testCaseId': serializer.toJson<String>(testCaseId),
      'stepNumber': serializer.toJson<int>(stepNumber),
      'description': serializer.toJson<String>(description),
      'expected': serializer.toJson<String?>(expected),
    };
  }

  TestStep copyWith({
    String? id,
    String? testCaseId,
    int? stepNumber,
    String? description,
    Value<String?> expected = const Value.absent(),
  }) => TestStep(
    id: id ?? this.id,
    testCaseId: testCaseId ?? this.testCaseId,
    stepNumber: stepNumber ?? this.stepNumber,
    description: description ?? this.description,
    expected: expected.present ? expected.value : this.expected,
  );
  TestStep copyWithCompanion(TestStepsCompanion data) {
    return TestStep(
      id: data.id.present ? data.id.value : this.id,
      testCaseId:
          data.testCaseId.present ? data.testCaseId.value : this.testCaseId,
      stepNumber:
          data.stepNumber.present ? data.stepNumber.value : this.stepNumber,
      description:
          data.description.present ? data.description.value : this.description,
      expected: data.expected.present ? data.expected.value : this.expected,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestStep(')
          ..write('id: $id, ')
          ..write('testCaseId: $testCaseId, ')
          ..write('stepNumber: $stepNumber, ')
          ..write('description: $description, ')
          ..write('expected: $expected')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, testCaseId, stepNumber, description, expected);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestStep &&
          other.id == this.id &&
          other.testCaseId == this.testCaseId &&
          other.stepNumber == this.stepNumber &&
          other.description == this.description &&
          other.expected == this.expected);
}

class TestStepsCompanion extends UpdateCompanion<TestStep> {
  final Value<String> id;
  final Value<String> testCaseId;
  final Value<int> stepNumber;
  final Value<String> description;
  final Value<String?> expected;
  final Value<int> rowid;
  const TestStepsCompanion({
    this.id = const Value.absent(),
    this.testCaseId = const Value.absent(),
    this.stepNumber = const Value.absent(),
    this.description = const Value.absent(),
    this.expected = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestStepsCompanion.insert({
    required String id,
    required String testCaseId,
    required int stepNumber,
    required String description,
    this.expected = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       testCaseId = Value(testCaseId),
       stepNumber = Value(stepNumber),
       description = Value(description);
  static Insertable<TestStep> custom({
    Expression<String>? id,
    Expression<String>? testCaseId,
    Expression<int>? stepNumber,
    Expression<String>? description,
    Expression<String>? expected,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (testCaseId != null) 'test_case_id': testCaseId,
      if (stepNumber != null) 'step_number': stepNumber,
      if (description != null) 'description': description,
      if (expected != null) 'expected': expected,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestStepsCompanion copyWith({
    Value<String>? id,
    Value<String>? testCaseId,
    Value<int>? stepNumber,
    Value<String>? description,
    Value<String?>? expected,
    Value<int>? rowid,
  }) {
    return TestStepsCompanion(
      id: id ?? this.id,
      testCaseId: testCaseId ?? this.testCaseId,
      stepNumber: stepNumber ?? this.stepNumber,
      description: description ?? this.description,
      expected: expected ?? this.expected,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (testCaseId.present) {
      map['test_case_id'] = Variable<String>(testCaseId.value);
    }
    if (stepNumber.present) {
      map['step_number'] = Variable<int>(stepNumber.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (expected.present) {
      map['expected'] = Variable<String>(expected.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestStepsCompanion(')
          ..write('id: $id, ')
          ..write('testCaseId: $testCaseId, ')
          ..write('stepNumber: $stepNumber, ')
          ..write('description: $description, ')
          ..write('expected: $expected, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CommentsTable extends Comments with TableInfo<$CommentsTable, Comment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _testCaseIdMeta = const VerificationMeta(
    'testCaseId',
  );
  @override
  late final GeneratedColumn<String> testCaseId = GeneratedColumn<String>(
    'test_case_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES test_cases (id)',
    ),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByUserIdMeta = const VerificationMeta(
    'createdByUserId',
  );
  @override
  late final GeneratedColumn<String> createdByUserId = GeneratedColumn<String>(
    'created_by_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _createdAtUtcMeta = const VerificationMeta(
    'createdAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> createdAtUtc = GeneratedColumn<DateTime>(
    'created_at_utc',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    testCaseId,
    content,
    createdByUserId,
    createdAtUtc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Comment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('test_case_id')) {
      context.handle(
        _testCaseIdMeta,
        testCaseId.isAcceptableOrUnknown(
          data['test_case_id']!,
          _testCaseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_testCaseIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_by_user_id')) {
      context.handle(
        _createdByUserIdMeta,
        createdByUserId.isAcceptableOrUnknown(
          data['created_by_user_id']!,
          _createdByUserIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at_utc')) {
      context.handle(
        _createdAtUtcMeta,
        createdAtUtc.isAcceptableOrUnknown(
          data['created_at_utc']!,
          _createdAtUtcMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Comment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Comment(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      testCaseId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}test_case_id'],
          )!,
      content:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}content'],
          )!,
      createdByUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_user_id'],
      ),
      createdAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at_utc'],
      ),
    );
  }

  @override
  $CommentsTable createAlias(String alias) {
    return $CommentsTable(attachedDatabase, alias);
  }
}

class Comment extends DataClass implements Insertable<Comment> {
  final String id;
  final String testCaseId;
  final String content;
  final String? createdByUserId;
  final DateTime? createdAtUtc;
  const Comment({
    required this.id,
    required this.testCaseId,
    required this.content,
    this.createdByUserId,
    this.createdAtUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['test_case_id'] = Variable<String>(testCaseId);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || createdByUserId != null) {
      map['created_by_user_id'] = Variable<String>(createdByUserId);
    }
    if (!nullToAbsent || createdAtUtc != null) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc);
    }
    return map;
  }

  CommentsCompanion toCompanion(bool nullToAbsent) {
    return CommentsCompanion(
      id: Value(id),
      testCaseId: Value(testCaseId),
      content: Value(content),
      createdByUserId:
          createdByUserId == null && nullToAbsent
              ? const Value.absent()
              : Value(createdByUserId),
      createdAtUtc:
          createdAtUtc == null && nullToAbsent
              ? const Value.absent()
              : Value(createdAtUtc),
    );
  }

  factory Comment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Comment(
      id: serializer.fromJson<String>(json['id']),
      testCaseId: serializer.fromJson<String>(json['testCaseId']),
      content: serializer.fromJson<String>(json['content']),
      createdByUserId: serializer.fromJson<String?>(json['createdByUserId']),
      createdAtUtc: serializer.fromJson<DateTime?>(json['createdAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'testCaseId': serializer.toJson<String>(testCaseId),
      'content': serializer.toJson<String>(content),
      'createdByUserId': serializer.toJson<String?>(createdByUserId),
      'createdAtUtc': serializer.toJson<DateTime?>(createdAtUtc),
    };
  }

  Comment copyWith({
    String? id,
    String? testCaseId,
    String? content,
    Value<String?> createdByUserId = const Value.absent(),
    Value<DateTime?> createdAtUtc = const Value.absent(),
  }) => Comment(
    id: id ?? this.id,
    testCaseId: testCaseId ?? this.testCaseId,
    content: content ?? this.content,
    createdByUserId:
        createdByUserId.present ? createdByUserId.value : this.createdByUserId,
    createdAtUtc: createdAtUtc.present ? createdAtUtc.value : this.createdAtUtc,
  );
  Comment copyWithCompanion(CommentsCompanion data) {
    return Comment(
      id: data.id.present ? data.id.value : this.id,
      testCaseId:
          data.testCaseId.present ? data.testCaseId.value : this.testCaseId,
      content: data.content.present ? data.content.value : this.content,
      createdByUserId:
          data.createdByUserId.present
              ? data.createdByUserId.value
              : this.createdByUserId,
      createdAtUtc:
          data.createdAtUtc.present
              ? data.createdAtUtc.value
              : this.createdAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Comment(')
          ..write('id: $id, ')
          ..write('testCaseId: $testCaseId, ')
          ..write('content: $content, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('createdAtUtc: $createdAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, testCaseId, content, createdByUserId, createdAtUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comment &&
          other.id == this.id &&
          other.testCaseId == this.testCaseId &&
          other.content == this.content &&
          other.createdByUserId == this.createdByUserId &&
          other.createdAtUtc == this.createdAtUtc);
}

class CommentsCompanion extends UpdateCompanion<Comment> {
  final Value<String> id;
  final Value<String> testCaseId;
  final Value<String> content;
  final Value<String?> createdByUserId;
  final Value<DateTime?> createdAtUtc;
  final Value<int> rowid;
  const CommentsCompanion({
    this.id = const Value.absent(),
    this.testCaseId = const Value.absent(),
    this.content = const Value.absent(),
    this.createdByUserId = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CommentsCompanion.insert({
    required String id,
    required String testCaseId,
    required String content,
    this.createdByUserId = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       testCaseId = Value(testCaseId),
       content = Value(content);
  static Insertable<Comment> custom({
    Expression<String>? id,
    Expression<String>? testCaseId,
    Expression<String>? content,
    Expression<String>? createdByUserId,
    Expression<DateTime>? createdAtUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (testCaseId != null) 'test_case_id': testCaseId,
      if (content != null) 'content': content,
      if (createdByUserId != null) 'created_by_user_id': createdByUserId,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CommentsCompanion copyWith({
    Value<String>? id,
    Value<String>? testCaseId,
    Value<String>? content,
    Value<String?>? createdByUserId,
    Value<DateTime?>? createdAtUtc,
    Value<int>? rowid,
  }) {
    return CommentsCompanion(
      id: id ?? this.id,
      testCaseId: testCaseId ?? this.testCaseId,
      content: content ?? this.content,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (testCaseId.present) {
      map['test_case_id'] = Variable<String>(testCaseId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdByUserId.present) {
      map['created_by_user_id'] = Variable<String>(createdByUserId.value);
    }
    if (createdAtUtc.present) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentsCompanion(')
          ..write('id: $id, ')
          ..write('testCaseId: $testCaseId, ')
          ..write('content: $content, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $TestPlansTable testPlans = $TestPlansTable(this);
  late final $TestCasesTable testCases = $TestCasesTable(this);
  late final $TestStepsTable testSteps = $TestStepsTable(this);
  late final $CommentsTable comments = $CommentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    testPlans,
    testCases,
    testSteps,
    comments,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      Value<String?> displayName,
      Value<String?> email,
      Value<DateTime?> lastModifiedUtc,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String?> displayName,
      Value<String?> email,
      Value<DateTime?> lastModifiedUtc,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TestPlansTable, List<TestPlan>>
  _testPlansRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.testPlans,
    aliasName: $_aliasNameGenerator(db.users.id, db.testPlans.ownerUserId),
  );

  $$TestPlansTableProcessedTableManager get testPlansRefs {
    final manager = $$TestPlansTableTableManager(
      $_db,
      $_db.testPlans,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_testPlansRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TestCasesTable, List<TestCase>>
  _testCasesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.testCases,
    aliasName: $_aliasNameGenerator(db.users.id, db.testCases.assignedToUserId),
  );

  $$TestCasesTableProcessedTableManager get testCasesRefs {
    final manager = $$TestCasesTableTableManager($_db, $_db.testCases).filter(
      (f) => f.assignedToUserId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_testCasesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CommentsTable, List<Comment>> _commentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.comments,
    aliasName: $_aliasNameGenerator(db.users.id, db.comments.createdByUserId),
  );

  $$CommentsTableProcessedTableManager get commentsRefs {
    final manager = $$CommentsTableTableManager($_db, $_db.comments).filter(
      (f) => f.createdByUserId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_commentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
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

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastModifiedUtc => $composableBuilder(
    column: $table.lastModifiedUtc,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> testPlansRefs(
    Expression<bool> Function($$TestPlansTableFilterComposer f) f,
  ) {
    final $$TestPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testPlans,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestPlansTableFilterComposer(
            $db: $db,
            $table: $db.testPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> testCasesRefs(
    Expression<bool> Function($$TestCasesTableFilterComposer f) f,
  ) {
    final $$TestCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testCases,
      getReferencedColumn: (t) => t.assignedToUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestCasesTableFilterComposer(
            $db: $db,
            $table: $db.testCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> commentsRefs(
    Expression<bool> Function($$CommentsTableFilterComposer f) f,
  ) {
    final $$CommentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.comments,
      getReferencedColumn: (t) => t.createdByUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CommentsTableFilterComposer(
            $db: $db,
            $table: $db.comments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
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

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastModifiedUtc => $composableBuilder(
    column: $table.lastModifiedUtc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get lastModifiedUtc => $composableBuilder(
    column: $table.lastModifiedUtc,
    builder: (column) => column,
  );

  Expression<T> testPlansRefs<T extends Object>(
    Expression<T> Function($$TestPlansTableAnnotationComposer a) f,
  ) {
    final $$TestPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testPlans,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.testPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> testCasesRefs<T extends Object>(
    Expression<T> Function($$TestCasesTableAnnotationComposer a) f,
  ) {
    final $$TestCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testCases,
      getReferencedColumn: (t) => t.assignedToUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestCasesTableAnnotationComposer(
            $db: $db,
            $table: $db.testCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> commentsRefs<T extends Object>(
    Expression<T> Function($$CommentsTableAnnotationComposer a) f,
  ) {
    final $$CommentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.comments,
      getReferencedColumn: (t) => t.createdByUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CommentsTableAnnotationComposer(
            $db: $db,
            $table: $db.comments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool testPlansRefs,
            bool testCasesRefs,
            bool commentsRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<DateTime?> lastModifiedUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                displayName: displayName,
                email: email,
                lastModifiedUtc: lastModifiedUtc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> displayName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<DateTime?> lastModifiedUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                displayName: displayName,
                email: email,
                lastModifiedUtc: lastModifiedUtc,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$UsersTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            testPlansRefs = false,
            testCasesRefs = false,
            commentsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (testPlansRefs) db.testPlans,
                if (testCasesRefs) db.testCases,
                if (commentsRefs) db.comments,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (testPlansRefs)
                    await $_getPrefetchedData<User, $UsersTable, TestPlan>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._testPlansRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).testPlansRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.ownerUserId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (testCasesRefs)
                    await $_getPrefetchedData<User, $UsersTable, TestCase>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._testCasesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).testCasesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.assignedToUserId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (commentsRefs)
                    await $_getPrefetchedData<User, $UsersTable, Comment>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._commentsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).commentsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.createdByUserId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool testPlansRefs,
        bool testCasesRefs,
        bool commentsRefs,
      })
    >;
typedef $$TestPlansTableCreateCompanionBuilder =
    TestPlansCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<String?> ownerUserId,
      Value<DateTime?> lastModifiedUtc,
      Value<int> overallPassed,
      Value<int> overallFailed,
      Value<int> overallBlocked,
      Value<int> rowid,
    });
typedef $$TestPlansTableUpdateCompanionBuilder =
    TestPlansCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> ownerUserId,
      Value<DateTime?> lastModifiedUtc,
      Value<int> overallPassed,
      Value<int> overallFailed,
      Value<int> overallBlocked,
      Value<int> rowid,
    });

final class $$TestPlansTableReferences
    extends BaseReferences<_$AppDatabase, $TestPlansTable, TestPlan> {
  $$TestPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.testPlans.ownerUserId, db.users.id));

  $$UsersTableProcessedTableManager? get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TestCasesTable, List<TestCase>>
  _testCasesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.testCases,
    aliasName: $_aliasNameGenerator(db.testPlans.id, db.testCases.planId),
  );

  $$TestCasesTableProcessedTableManager get testCasesRefs {
    final manager = $$TestCasesTableTableManager(
      $_db,
      $_db.testCases,
    ).filter((f) => f.planId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_testCasesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TestPlansTableFilterComposer
    extends Composer<_$AppDatabase, $TestPlansTable> {
  $$TestPlansTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastModifiedUtc => $composableBuilder(
    column: $table.lastModifiedUtc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get overallPassed => $composableBuilder(
    column: $table.overallPassed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get overallFailed => $composableBuilder(
    column: $table.overallFailed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get overallBlocked => $composableBuilder(
    column: $table.overallBlocked,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> testCasesRefs(
    Expression<bool> Function($$TestCasesTableFilterComposer f) f,
  ) {
    final $$TestCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testCases,
      getReferencedColumn: (t) => t.planId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestCasesTableFilterComposer(
            $db: $db,
            $table: $db.testCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TestPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $TestPlansTable> {
  $$TestPlansTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastModifiedUtc => $composableBuilder(
    column: $table.lastModifiedUtc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get overallPassed => $composableBuilder(
    column: $table.overallPassed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get overallFailed => $composableBuilder(
    column: $table.overallFailed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get overallBlocked => $composableBuilder(
    column: $table.overallBlocked,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestPlansTable> {
  $$TestPlansTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastModifiedUtc => $composableBuilder(
    column: $table.lastModifiedUtc,
    builder: (column) => column,
  );

  GeneratedColumn<int> get overallPassed => $composableBuilder(
    column: $table.overallPassed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get overallFailed => $composableBuilder(
    column: $table.overallFailed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get overallBlocked => $composableBuilder(
    column: $table.overallBlocked,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> testCasesRefs<T extends Object>(
    Expression<T> Function($$TestCasesTableAnnotationComposer a) f,
  ) {
    final $$TestCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testCases,
      getReferencedColumn: (t) => t.planId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestCasesTableAnnotationComposer(
            $db: $db,
            $table: $db.testCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TestPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestPlansTable,
          TestPlan,
          $$TestPlansTableFilterComposer,
          $$TestPlansTableOrderingComposer,
          $$TestPlansTableAnnotationComposer,
          $$TestPlansTableCreateCompanionBuilder,
          $$TestPlansTableUpdateCompanionBuilder,
          (TestPlan, $$TestPlansTableReferences),
          TestPlan,
          PrefetchHooks Function({bool ownerUserId, bool testCasesRefs})
        > {
  $$TestPlansTableTableManager(_$AppDatabase db, $TestPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TestPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TestPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TestPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<DateTime?> lastModifiedUtc = const Value.absent(),
                Value<int> overallPassed = const Value.absent(),
                Value<int> overallFailed = const Value.absent(),
                Value<int> overallBlocked = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestPlansCompanion(
                id: id,
                name: name,
                description: description,
                ownerUserId: ownerUserId,
                lastModifiedUtc: lastModifiedUtc,
                overallPassed: overallPassed,
                overallFailed: overallFailed,
                overallBlocked: overallBlocked,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<DateTime?> lastModifiedUtc = const Value.absent(),
                Value<int> overallPassed = const Value.absent(),
                Value<int> overallFailed = const Value.absent(),
                Value<int> overallBlocked = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestPlansCompanion.insert(
                id: id,
                name: name,
                description: description,
                ownerUserId: ownerUserId,
                lastModifiedUtc: lastModifiedUtc,
                overallPassed: overallPassed,
                overallFailed: overallFailed,
                overallBlocked: overallBlocked,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TestPlansTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            ownerUserId = false,
            testCasesRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (testCasesRefs) db.testCases],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (ownerUserId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.ownerUserId,
                            referencedTable: $$TestPlansTableReferences
                                ._ownerUserIdTable(db),
                            referencedColumn:
                                $$TestPlansTableReferences
                                    ._ownerUserIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (testCasesRefs)
                    await $_getPrefetchedData<
                      TestPlan,
                      $TestPlansTable,
                      TestCase
                    >(
                      currentTable: table,
                      referencedTable: $$TestPlansTableReferences
                          ._testCasesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TestPlansTableReferences(
                                db,
                                table,
                                p0,
                              ).testCasesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.planId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TestPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestPlansTable,
      TestPlan,
      $$TestPlansTableFilterComposer,
      $$TestPlansTableOrderingComposer,
      $$TestPlansTableAnnotationComposer,
      $$TestPlansTableCreateCompanionBuilder,
      $$TestPlansTableUpdateCompanionBuilder,
      (TestPlan, $$TestPlansTableReferences),
      TestPlan,
      PrefetchHooks Function({bool ownerUserId, bool testCasesRefs})
    >;
typedef $$TestCasesTableCreateCompanionBuilder =
    TestCasesCompanion Function({
      required String id,
      required String planId,
      required String title,
      required String status,
      Value<String?> assignedToUserId,
      Value<String?> expectedResult,
      Value<DateTime?> lastModifiedUtc,
      Value<int> rowid,
    });
typedef $$TestCasesTableUpdateCompanionBuilder =
    TestCasesCompanion Function({
      Value<String> id,
      Value<String> planId,
      Value<String> title,
      Value<String> status,
      Value<String?> assignedToUserId,
      Value<String?> expectedResult,
      Value<DateTime?> lastModifiedUtc,
      Value<int> rowid,
    });

final class $$TestCasesTableReferences
    extends BaseReferences<_$AppDatabase, $TestCasesTable, TestCase> {
  $$TestCasesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TestPlansTable _planIdTable(_$AppDatabase db) => db.testPlans
      .createAlias($_aliasNameGenerator(db.testCases.planId, db.testPlans.id));

  $$TestPlansTableProcessedTableManager get planId {
    final $_column = $_itemColumn<String>('plan_id')!;

    final manager = $$TestPlansTableTableManager(
      $_db,
      $_db.testPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_planIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _assignedToUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(db.testCases.assignedToUserId, db.users.id),
      );

  $$UsersTableProcessedTableManager? get assignedToUserId {
    final $_column = $_itemColumn<String>('assigned_to_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_assignedToUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TestStepsTable, List<TestStep>>
  _testStepsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.testSteps,
    aliasName: $_aliasNameGenerator(db.testCases.id, db.testSteps.testCaseId),
  );

  $$TestStepsTableProcessedTableManager get testStepsRefs {
    final manager = $$TestStepsTableTableManager(
      $_db,
      $_db.testSteps,
    ).filter((f) => f.testCaseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_testStepsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CommentsTable, List<Comment>> _commentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.comments,
    aliasName: $_aliasNameGenerator(db.testCases.id, db.comments.testCaseId),
  );

  $$CommentsTableProcessedTableManager get commentsRefs {
    final manager = $$CommentsTableTableManager(
      $_db,
      $_db.comments,
    ).filter((f) => f.testCaseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_commentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TestCasesTableFilterComposer
    extends Composer<_$AppDatabase, $TestCasesTable> {
  $$TestCasesTableFilterComposer({
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

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expectedResult => $composableBuilder(
    column: $table.expectedResult,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastModifiedUtc => $composableBuilder(
    column: $table.lastModifiedUtc,
    builder: (column) => ColumnFilters(column),
  );

  $$TestPlansTableFilterComposer get planId {
    final $$TestPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planId,
      referencedTable: $db.testPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestPlansTableFilterComposer(
            $db: $db,
            $table: $db.testPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get assignedToUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assignedToUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> testStepsRefs(
    Expression<bool> Function($$TestStepsTableFilterComposer f) f,
  ) {
    final $$TestStepsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testSteps,
      getReferencedColumn: (t) => t.testCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestStepsTableFilterComposer(
            $db: $db,
            $table: $db.testSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> commentsRefs(
    Expression<bool> Function($$CommentsTableFilterComposer f) f,
  ) {
    final $$CommentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.comments,
      getReferencedColumn: (t) => t.testCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CommentsTableFilterComposer(
            $db: $db,
            $table: $db.comments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TestCasesTableOrderingComposer
    extends Composer<_$AppDatabase, $TestCasesTable> {
  $$TestCasesTableOrderingComposer({
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

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expectedResult => $composableBuilder(
    column: $table.expectedResult,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastModifiedUtc => $composableBuilder(
    column: $table.lastModifiedUtc,
    builder: (column) => ColumnOrderings(column),
  );

  $$TestPlansTableOrderingComposer get planId {
    final $$TestPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planId,
      referencedTable: $db.testPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestPlansTableOrderingComposer(
            $db: $db,
            $table: $db.testPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get assignedToUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assignedToUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestCasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestCasesTable> {
  $$TestCasesTableAnnotationComposer({
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

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get expectedResult => $composableBuilder(
    column: $table.expectedResult,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastModifiedUtc => $composableBuilder(
    column: $table.lastModifiedUtc,
    builder: (column) => column,
  );

  $$TestPlansTableAnnotationComposer get planId {
    final $$TestPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planId,
      referencedTable: $db.testPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.testPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get assignedToUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assignedToUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> testStepsRefs<T extends Object>(
    Expression<T> Function($$TestStepsTableAnnotationComposer a) f,
  ) {
    final $$TestStepsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testSteps,
      getReferencedColumn: (t) => t.testCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestStepsTableAnnotationComposer(
            $db: $db,
            $table: $db.testSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> commentsRefs<T extends Object>(
    Expression<T> Function($$CommentsTableAnnotationComposer a) f,
  ) {
    final $$CommentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.comments,
      getReferencedColumn: (t) => t.testCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CommentsTableAnnotationComposer(
            $db: $db,
            $table: $db.comments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TestCasesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestCasesTable,
          TestCase,
          $$TestCasesTableFilterComposer,
          $$TestCasesTableOrderingComposer,
          $$TestCasesTableAnnotationComposer,
          $$TestCasesTableCreateCompanionBuilder,
          $$TestCasesTableUpdateCompanionBuilder,
          (TestCase, $$TestCasesTableReferences),
          TestCase,
          PrefetchHooks Function({
            bool planId,
            bool assignedToUserId,
            bool testStepsRefs,
            bool commentsRefs,
          })
        > {
  $$TestCasesTableTableManager(_$AppDatabase db, $TestCasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TestCasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TestCasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TestCasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> planId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> assignedToUserId = const Value.absent(),
                Value<String?> expectedResult = const Value.absent(),
                Value<DateTime?> lastModifiedUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestCasesCompanion(
                id: id,
                planId: planId,
                title: title,
                status: status,
                assignedToUserId: assignedToUserId,
                expectedResult: expectedResult,
                lastModifiedUtc: lastModifiedUtc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String planId,
                required String title,
                required String status,
                Value<String?> assignedToUserId = const Value.absent(),
                Value<String?> expectedResult = const Value.absent(),
                Value<DateTime?> lastModifiedUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestCasesCompanion.insert(
                id: id,
                planId: planId,
                title: title,
                status: status,
                assignedToUserId: assignedToUserId,
                expectedResult: expectedResult,
                lastModifiedUtc: lastModifiedUtc,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TestCasesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            planId = false,
            assignedToUserId = false,
            testStepsRefs = false,
            commentsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (testStepsRefs) db.testSteps,
                if (commentsRefs) db.comments,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (planId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.planId,
                            referencedTable: $$TestCasesTableReferences
                                ._planIdTable(db),
                            referencedColumn:
                                $$TestCasesTableReferences._planIdTable(db).id,
                          )
                          as T;
                }
                if (assignedToUserId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.assignedToUserId,
                            referencedTable: $$TestCasesTableReferences
                                ._assignedToUserIdTable(db),
                            referencedColumn:
                                $$TestCasesTableReferences
                                    ._assignedToUserIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (testStepsRefs)
                    await $_getPrefetchedData<
                      TestCase,
                      $TestCasesTable,
                      TestStep
                    >(
                      currentTable: table,
                      referencedTable: $$TestCasesTableReferences
                          ._testStepsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TestCasesTableReferences(
                                db,
                                table,
                                p0,
                              ).testStepsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.testCaseId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (commentsRefs)
                    await $_getPrefetchedData<
                      TestCase,
                      $TestCasesTable,
                      Comment
                    >(
                      currentTable: table,
                      referencedTable: $$TestCasesTableReferences
                          ._commentsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TestCasesTableReferences(
                                db,
                                table,
                                p0,
                              ).commentsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.testCaseId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TestCasesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestCasesTable,
      TestCase,
      $$TestCasesTableFilterComposer,
      $$TestCasesTableOrderingComposer,
      $$TestCasesTableAnnotationComposer,
      $$TestCasesTableCreateCompanionBuilder,
      $$TestCasesTableUpdateCompanionBuilder,
      (TestCase, $$TestCasesTableReferences),
      TestCase,
      PrefetchHooks Function({
        bool planId,
        bool assignedToUserId,
        bool testStepsRefs,
        bool commentsRefs,
      })
    >;
typedef $$TestStepsTableCreateCompanionBuilder =
    TestStepsCompanion Function({
      required String id,
      required String testCaseId,
      required int stepNumber,
      required String description,
      Value<String?> expected,
      Value<int> rowid,
    });
typedef $$TestStepsTableUpdateCompanionBuilder =
    TestStepsCompanion Function({
      Value<String> id,
      Value<String> testCaseId,
      Value<int> stepNumber,
      Value<String> description,
      Value<String?> expected,
      Value<int> rowid,
    });

final class $$TestStepsTableReferences
    extends BaseReferences<_$AppDatabase, $TestStepsTable, TestStep> {
  $$TestStepsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TestCasesTable _testCaseIdTable(_$AppDatabase db) =>
      db.testCases.createAlias(
        $_aliasNameGenerator(db.testSteps.testCaseId, db.testCases.id),
      );

  $$TestCasesTableProcessedTableManager get testCaseId {
    final $_column = $_itemColumn<String>('test_case_id')!;

    final manager = $$TestCasesTableTableManager(
      $_db,
      $_db.testCases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_testCaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TestStepsTableFilterComposer
    extends Composer<_$AppDatabase, $TestStepsTable> {
  $$TestStepsTableFilterComposer({
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

  ColumnFilters<int> get stepNumber => $composableBuilder(
    column: $table.stepNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expected => $composableBuilder(
    column: $table.expected,
    builder: (column) => ColumnFilters(column),
  );

  $$TestCasesTableFilterComposer get testCaseId {
    final $$TestCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testCaseId,
      referencedTable: $db.testCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestCasesTableFilterComposer(
            $db: $db,
            $table: $db.testCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestStepsTableOrderingComposer
    extends Composer<_$AppDatabase, $TestStepsTable> {
  $$TestStepsTableOrderingComposer({
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

  ColumnOrderings<int> get stepNumber => $composableBuilder(
    column: $table.stepNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expected => $composableBuilder(
    column: $table.expected,
    builder: (column) => ColumnOrderings(column),
  );

  $$TestCasesTableOrderingComposer get testCaseId {
    final $$TestCasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testCaseId,
      referencedTable: $db.testCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestCasesTableOrderingComposer(
            $db: $db,
            $table: $db.testCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestStepsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestStepsTable> {
  $$TestStepsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get stepNumber => $composableBuilder(
    column: $table.stepNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expected =>
      $composableBuilder(column: $table.expected, builder: (column) => column);

  $$TestCasesTableAnnotationComposer get testCaseId {
    final $$TestCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testCaseId,
      referencedTable: $db.testCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestCasesTableAnnotationComposer(
            $db: $db,
            $table: $db.testCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestStepsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestStepsTable,
          TestStep,
          $$TestStepsTableFilterComposer,
          $$TestStepsTableOrderingComposer,
          $$TestStepsTableAnnotationComposer,
          $$TestStepsTableCreateCompanionBuilder,
          $$TestStepsTableUpdateCompanionBuilder,
          (TestStep, $$TestStepsTableReferences),
          TestStep,
          PrefetchHooks Function({bool testCaseId})
        > {
  $$TestStepsTableTableManager(_$AppDatabase db, $TestStepsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TestStepsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TestStepsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TestStepsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> testCaseId = const Value.absent(),
                Value<int> stepNumber = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> expected = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestStepsCompanion(
                id: id,
                testCaseId: testCaseId,
                stepNumber: stepNumber,
                description: description,
                expected: expected,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String testCaseId,
                required int stepNumber,
                required String description,
                Value<String?> expected = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestStepsCompanion.insert(
                id: id,
                testCaseId: testCaseId,
                stepNumber: stepNumber,
                description: description,
                expected: expected,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TestStepsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({testCaseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (testCaseId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.testCaseId,
                            referencedTable: $$TestStepsTableReferences
                                ._testCaseIdTable(db),
                            referencedColumn:
                                $$TestStepsTableReferences
                                    ._testCaseIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TestStepsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestStepsTable,
      TestStep,
      $$TestStepsTableFilterComposer,
      $$TestStepsTableOrderingComposer,
      $$TestStepsTableAnnotationComposer,
      $$TestStepsTableCreateCompanionBuilder,
      $$TestStepsTableUpdateCompanionBuilder,
      (TestStep, $$TestStepsTableReferences),
      TestStep,
      PrefetchHooks Function({bool testCaseId})
    >;
typedef $$CommentsTableCreateCompanionBuilder =
    CommentsCompanion Function({
      required String id,
      required String testCaseId,
      required String content,
      Value<String?> createdByUserId,
      Value<DateTime?> createdAtUtc,
      Value<int> rowid,
    });
typedef $$CommentsTableUpdateCompanionBuilder =
    CommentsCompanion Function({
      Value<String> id,
      Value<String> testCaseId,
      Value<String> content,
      Value<String?> createdByUserId,
      Value<DateTime?> createdAtUtc,
      Value<int> rowid,
    });

final class $$CommentsTableReferences
    extends BaseReferences<_$AppDatabase, $CommentsTable, Comment> {
  $$CommentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TestCasesTable _testCaseIdTable(_$AppDatabase db) =>
      db.testCases.createAlias(
        $_aliasNameGenerator(db.comments.testCaseId, db.testCases.id),
      );

  $$TestCasesTableProcessedTableManager get testCaseId {
    final $_column = $_itemColumn<String>('test_case_id')!;

    final manager = $$TestCasesTableTableManager(
      $_db,
      $_db.testCases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_testCaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _createdByUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(db.comments.createdByUserId, db.users.id),
      );

  $$UsersTableProcessedTableManager? get createdByUserId {
    final $_column = $_itemColumn<String>('created_by_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdByUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CommentsTableFilterComposer
    extends Composer<_$AppDatabase, $CommentsTable> {
  $$CommentsTableFilterComposer({
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

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnFilters(column),
  );

  $$TestCasesTableFilterComposer get testCaseId {
    final $$TestCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testCaseId,
      referencedTable: $db.testCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestCasesTableFilterComposer(
            $db: $db,
            $table: $db.testCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get createdByUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.createdByUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CommentsTableOrderingComposer
    extends Composer<_$AppDatabase, $CommentsTable> {
  $$CommentsTableOrderingComposer({
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

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnOrderings(column),
  );

  $$TestCasesTableOrderingComposer get testCaseId {
    final $$TestCasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testCaseId,
      referencedTable: $db.testCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestCasesTableOrderingComposer(
            $db: $db,
            $table: $db.testCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get createdByUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.createdByUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CommentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommentsTable> {
  $$CommentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => column,
  );

  $$TestCasesTableAnnotationComposer get testCaseId {
    final $$TestCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testCaseId,
      referencedTable: $db.testCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestCasesTableAnnotationComposer(
            $db: $db,
            $table: $db.testCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get createdByUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.createdByUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CommentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommentsTable,
          Comment,
          $$CommentsTableFilterComposer,
          $$CommentsTableOrderingComposer,
          $$CommentsTableAnnotationComposer,
          $$CommentsTableCreateCompanionBuilder,
          $$CommentsTableUpdateCompanionBuilder,
          (Comment, $$CommentsTableReferences),
          Comment,
          PrefetchHooks Function({bool testCaseId, bool createdByUserId})
        > {
  $$CommentsTableTableManager(_$AppDatabase db, $CommentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CommentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CommentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CommentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> testCaseId = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String?> createdByUserId = const Value.absent(),
                Value<DateTime?> createdAtUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CommentsCompanion(
                id: id,
                testCaseId: testCaseId,
                content: content,
                createdByUserId: createdByUserId,
                createdAtUtc: createdAtUtc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String testCaseId,
                required String content,
                Value<String?> createdByUserId = const Value.absent(),
                Value<DateTime?> createdAtUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CommentsCompanion.insert(
                id: id,
                testCaseId: testCaseId,
                content: content,
                createdByUserId: createdByUserId,
                createdAtUtc: createdAtUtc,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CommentsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            testCaseId = false,
            createdByUserId = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (testCaseId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.testCaseId,
                            referencedTable: $$CommentsTableReferences
                                ._testCaseIdTable(db),
                            referencedColumn:
                                $$CommentsTableReferences
                                    ._testCaseIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (createdByUserId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.createdByUserId,
                            referencedTable: $$CommentsTableReferences
                                ._createdByUserIdTable(db),
                            referencedColumn:
                                $$CommentsTableReferences
                                    ._createdByUserIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CommentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommentsTable,
      Comment,
      $$CommentsTableFilterComposer,
      $$CommentsTableOrderingComposer,
      $$CommentsTableAnnotationComposer,
      $$CommentsTableCreateCompanionBuilder,
      $$CommentsTableUpdateCompanionBuilder,
      (Comment, $$CommentsTableReferences),
      Comment,
      PrefetchHooks Function({bool testCaseId, bool createdByUserId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$TestPlansTableTableManager get testPlans =>
      $$TestPlansTableTableManager(_db, _db.testPlans);
  $$TestCasesTableTableManager get testCases =>
      $$TestCasesTableTableManager(_db, _db.testCases);
  $$TestStepsTableTableManager get testSteps =>
      $$TestStepsTableTableManager(_db, _db.testSteps);
  $$CommentsTableTableManager get comments =>
      $$CommentsTableTableManager(_db, _db.comments);
}
