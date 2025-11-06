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
  static const VerificationMeta _userPrincipalNameMeta = const VerificationMeta(
    'userPrincipalName',
  );
  @override
  late final GeneratedColumn<String> userPrincipalName =
      GeneratedColumn<String>(
        'user_principal_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _loginNameMeta = const VerificationMeta(
    'loginName',
  );
  @override
  late final GeneratedColumn<String> loginName = GeneratedColumn<String>(
    'login_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobTitleMeta = const VerificationMeta(
    'jobTitle',
  );
  @override
  late final GeneratedColumn<String> jobTitle = GeneratedColumn<String>(
    'job_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'department',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pictureUrlMeta = const VerificationMeta(
    'pictureUrl',
  );
  @override
  late final GeneratedColumn<String> pictureUrl = GeneratedColumn<String>(
    'picture_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    userPrincipalName,
    loginName,
    jobTitle,
    department,
    pictureUrl,
    createdAtUtc,
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
    if (data.containsKey('user_principal_name')) {
      context.handle(
        _userPrincipalNameMeta,
        userPrincipalName.isAcceptableOrUnknown(
          data['user_principal_name']!,
          _userPrincipalNameMeta,
        ),
      );
    }
    if (data.containsKey('login_name')) {
      context.handle(
        _loginNameMeta,
        loginName.isAcceptableOrUnknown(data['login_name']!, _loginNameMeta),
      );
    }
    if (data.containsKey('job_title')) {
      context.handle(
        _jobTitleMeta,
        jobTitle.isAcceptableOrUnknown(data['job_title']!, _jobTitleMeta),
      );
    }
    if (data.containsKey('department')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['department']!, _departmentMeta),
      );
    }
    if (data.containsKey('picture_url')) {
      context.handle(
        _pictureUrlMeta,
        pictureUrl.isAcceptableOrUnknown(data['picture_url']!, _pictureUrlMeta),
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
      userPrincipalName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_principal_name'],
      ),
      loginName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login_name'],
      ),
      jobTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}job_title'],
      ),
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department'],
      ),
      pictureUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}picture_url'],
      ),
      createdAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at_utc'],
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
  final String? userPrincipalName;
  final String? loginName;
  final String? jobTitle;
  final String? department;
  final String? pictureUrl;
  final DateTime? createdAtUtc;
  final DateTime? lastModifiedUtc;
  const User({
    required this.id,
    this.displayName,
    this.email,
    this.userPrincipalName,
    this.loginName,
    this.jobTitle,
    this.department,
    this.pictureUrl,
    this.createdAtUtc,
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
    if (!nullToAbsent || userPrincipalName != null) {
      map['user_principal_name'] = Variable<String>(userPrincipalName);
    }
    if (!nullToAbsent || loginName != null) {
      map['login_name'] = Variable<String>(loginName);
    }
    if (!nullToAbsent || jobTitle != null) {
      map['job_title'] = Variable<String>(jobTitle);
    }
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    if (!nullToAbsent || pictureUrl != null) {
      map['picture_url'] = Variable<String>(pictureUrl);
    }
    if (!nullToAbsent || createdAtUtc != null) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc);
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
      userPrincipalName:
          userPrincipalName == null && nullToAbsent
              ? const Value.absent()
              : Value(userPrincipalName),
      loginName:
          loginName == null && nullToAbsent
              ? const Value.absent()
              : Value(loginName),
      jobTitle:
          jobTitle == null && nullToAbsent
              ? const Value.absent()
              : Value(jobTitle),
      department:
          department == null && nullToAbsent
              ? const Value.absent()
              : Value(department),
      pictureUrl:
          pictureUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(pictureUrl),
      createdAtUtc:
          createdAtUtc == null && nullToAbsent
              ? const Value.absent()
              : Value(createdAtUtc),
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
      userPrincipalName: serializer.fromJson<String?>(
        json['userPrincipalName'],
      ),
      loginName: serializer.fromJson<String?>(json['loginName']),
      jobTitle: serializer.fromJson<String?>(json['jobTitle']),
      department: serializer.fromJson<String?>(json['department']),
      pictureUrl: serializer.fromJson<String?>(json['pictureUrl']),
      createdAtUtc: serializer.fromJson<DateTime?>(json['createdAtUtc']),
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
      'userPrincipalName': serializer.toJson<String?>(userPrincipalName),
      'loginName': serializer.toJson<String?>(loginName),
      'jobTitle': serializer.toJson<String?>(jobTitle),
      'department': serializer.toJson<String?>(department),
      'pictureUrl': serializer.toJson<String?>(pictureUrl),
      'createdAtUtc': serializer.toJson<DateTime?>(createdAtUtc),
      'lastModifiedUtc': serializer.toJson<DateTime?>(lastModifiedUtc),
    };
  }

  User copyWith({
    String? id,
    Value<String?> displayName = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> userPrincipalName = const Value.absent(),
    Value<String?> loginName = const Value.absent(),
    Value<String?> jobTitle = const Value.absent(),
    Value<String?> department = const Value.absent(),
    Value<String?> pictureUrl = const Value.absent(),
    Value<DateTime?> createdAtUtc = const Value.absent(),
    Value<DateTime?> lastModifiedUtc = const Value.absent(),
  }) => User(
    id: id ?? this.id,
    displayName: displayName.present ? displayName.value : this.displayName,
    email: email.present ? email.value : this.email,
    userPrincipalName:
        userPrincipalName.present
            ? userPrincipalName.value
            : this.userPrincipalName,
    loginName: loginName.present ? loginName.value : this.loginName,
    jobTitle: jobTitle.present ? jobTitle.value : this.jobTitle,
    department: department.present ? department.value : this.department,
    pictureUrl: pictureUrl.present ? pictureUrl.value : this.pictureUrl,
    createdAtUtc: createdAtUtc.present ? createdAtUtc.value : this.createdAtUtc,
    lastModifiedUtc:
        lastModifiedUtc.present ? lastModifiedUtc.value : this.lastModifiedUtc,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      email: data.email.present ? data.email.value : this.email,
      userPrincipalName:
          data.userPrincipalName.present
              ? data.userPrincipalName.value
              : this.userPrincipalName,
      loginName: data.loginName.present ? data.loginName.value : this.loginName,
      jobTitle: data.jobTitle.present ? data.jobTitle.value : this.jobTitle,
      department:
          data.department.present ? data.department.value : this.department,
      pictureUrl:
          data.pictureUrl.present ? data.pictureUrl.value : this.pictureUrl,
      createdAtUtc:
          data.createdAtUtc.present
              ? data.createdAtUtc.value
              : this.createdAtUtc,
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
          ..write('userPrincipalName: $userPrincipalName, ')
          ..write('loginName: $loginName, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('department: $department, ')
          ..write('pictureUrl: $pictureUrl, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('lastModifiedUtc: $lastModifiedUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    displayName,
    email,
    userPrincipalName,
    loginName,
    jobTitle,
    department,
    pictureUrl,
    createdAtUtc,
    lastModifiedUtc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.email == this.email &&
          other.userPrincipalName == this.userPrincipalName &&
          other.loginName == this.loginName &&
          other.jobTitle == this.jobTitle &&
          other.department == this.department &&
          other.pictureUrl == this.pictureUrl &&
          other.createdAtUtc == this.createdAtUtc &&
          other.lastModifiedUtc == this.lastModifiedUtc);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String?> displayName;
  final Value<String?> email;
  final Value<String?> userPrincipalName;
  final Value<String?> loginName;
  final Value<String?> jobTitle;
  final Value<String?> department;
  final Value<String?> pictureUrl;
  final Value<DateTime?> createdAtUtc;
  final Value<DateTime?> lastModifiedUtc;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.userPrincipalName = const Value.absent(),
    this.loginName = const Value.absent(),
    this.jobTitle = const Value.absent(),
    this.department = const Value.absent(),
    this.pictureUrl = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.lastModifiedUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.userPrincipalName = const Value.absent(),
    this.loginName = const Value.absent(),
    this.jobTitle = const Value.absent(),
    this.department = const Value.absent(),
    this.pictureUrl = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.lastModifiedUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? email,
    Expression<String>? userPrincipalName,
    Expression<String>? loginName,
    Expression<String>? jobTitle,
    Expression<String>? department,
    Expression<String>? pictureUrl,
    Expression<DateTime>? createdAtUtc,
    Expression<DateTime>? lastModifiedUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (email != null) 'email': email,
      if (userPrincipalName != null) 'user_principal_name': userPrincipalName,
      if (loginName != null) 'login_name': loginName,
      if (jobTitle != null) 'job_title': jobTitle,
      if (department != null) 'department': department,
      if (pictureUrl != null) 'picture_url': pictureUrl,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
      if (lastModifiedUtc != null) 'last_modified_utc': lastModifiedUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String?>? displayName,
    Value<String?>? email,
    Value<String?>? userPrincipalName,
    Value<String?>? loginName,
    Value<String?>? jobTitle,
    Value<String?>? department,
    Value<String?>? pictureUrl,
    Value<DateTime?>? createdAtUtc,
    Value<DateTime?>? lastModifiedUtc,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      userPrincipalName: userPrincipalName ?? this.userPrincipalName,
      loginName: loginName ?? this.loginName,
      jobTitle: jobTitle ?? this.jobTitle,
      department: department ?? this.department,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
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
    if (userPrincipalName.present) {
      map['user_principal_name'] = Variable<String>(userPrincipalName.value);
    }
    if (loginName.present) {
      map['login_name'] = Variable<String>(loginName.value);
    }
    if (jobTitle.present) {
      map['job_title'] = Variable<String>(jobTitle.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (pictureUrl.present) {
      map['picture_url'] = Variable<String>(pictureUrl.value);
    }
    if (createdAtUtc.present) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc.value);
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
          ..write('userPrincipalName: $userPrincipalName, ')
          ..write('loginName: $loginName, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('department: $department, ')
          ..write('pictureUrl: $pictureUrl, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('lastModifiedUtc: $lastModifiedUtc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
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
  List<GeneratedColumn> get $columns => [id, name, description, createdAtUtc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Project> instance, {
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
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
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
      createdAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at_utc'],
      ),
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

class Project extends DataClass implements Insertable<Project> {
  final String id;
  final String name;
  final String? description;
  final DateTime? createdAtUtc;
  const Project({
    required this.id,
    required this.name,
    this.description,
    this.createdAtUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || createdAtUtc != null) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc);
    }
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      createdAtUtc:
          createdAtUtc == null && nullToAbsent
              ? const Value.absent()
              : Value(createdAtUtc),
    );
  }

  factory Project.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAtUtc: serializer.fromJson<DateTime?>(json['createdAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAtUtc': serializer.toJson<DateTime?>(createdAtUtc),
    };
  }

  Project copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<DateTime?> createdAtUtc = const Value.absent(),
  }) => Project(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    createdAtUtc: createdAtUtc.present ? createdAtUtc.value : this.createdAtUtc,
  );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAtUtc:
          data.createdAtUtc.present
              ? data.createdAtUtc.value
              : this.createdAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAtUtc: $createdAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAtUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAtUtc == this.createdAtUtc);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime?> createdAtUtc;
  final Value<int> rowid;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Project> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAtUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<DateTime?>? createdAtUtc,
    Value<int>? rowid,
  }) {
    return ProjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
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
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ModulesTable extends Modules with TableInfo<$ModulesTable, Module> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModulesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id)',
    ),
  );
  static const VerificationMeta _parentModuleIdMeta = const VerificationMeta(
    'parentModuleId',
  );
  @override
  late final GeneratedColumn<String> parentModuleId = GeneratedColumn<String>(
    'parent_module_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES modules (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    projectId,
    parentModuleId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'modules';
  @override
  VerificationContext validateIntegrity(
    Insertable<Module> instance, {
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
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('parent_module_id')) {
      context.handle(
        _parentModuleIdMeta,
        parentModuleId.isAcceptableOrUnknown(
          data['parent_module_id']!,
          _parentModuleIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Module map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Module(
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
      projectId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_id'],
          )!,
      parentModuleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_module_id'],
      ),
    );
  }

  @override
  $ModulesTable createAlias(String alias) {
    return $ModulesTable(attachedDatabase, alias);
  }
}

class Module extends DataClass implements Insertable<Module> {
  final String id;
  final String name;
  final String? description;
  final String projectId;
  final String? parentModuleId;
  const Module({
    required this.id,
    required this.name,
    this.description,
    required this.projectId,
    this.parentModuleId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['project_id'] = Variable<String>(projectId);
    if (!nullToAbsent || parentModuleId != null) {
      map['parent_module_id'] = Variable<String>(parentModuleId);
    }
    return map;
  }

  ModulesCompanion toCompanion(bool nullToAbsent) {
    return ModulesCompanion(
      id: Value(id),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      projectId: Value(projectId),
      parentModuleId:
          parentModuleId == null && nullToAbsent
              ? const Value.absent()
              : Value(parentModuleId),
    );
  }

  factory Module.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Module(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      projectId: serializer.fromJson<String>(json['projectId']),
      parentModuleId: serializer.fromJson<String?>(json['parentModuleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'projectId': serializer.toJson<String>(projectId),
      'parentModuleId': serializer.toJson<String?>(parentModuleId),
    };
  }

  Module copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    String? projectId,
    Value<String?> parentModuleId = const Value.absent(),
  }) => Module(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    projectId: projectId ?? this.projectId,
    parentModuleId:
        parentModuleId.present ? parentModuleId.value : this.parentModuleId,
  );
  Module copyWithCompanion(ModulesCompanion data) {
    return Module(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      parentModuleId:
          data.parentModuleId.present
              ? data.parentModuleId.value
              : this.parentModuleId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Module(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('projectId: $projectId, ')
          ..write('parentModuleId: $parentModuleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, projectId, parentModuleId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Module &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.projectId == this.projectId &&
          other.parentModuleId == this.parentModuleId);
}

class ModulesCompanion extends UpdateCompanion<Module> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> projectId;
  final Value<String?> parentModuleId;
  final Value<int> rowid;
  const ModulesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.projectId = const Value.absent(),
    this.parentModuleId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ModulesCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required String projectId,
    this.parentModuleId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       projectId = Value(projectId);
  static Insertable<Module> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? projectId,
    Expression<String>? parentModuleId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (projectId != null) 'project_id': projectId,
      if (parentModuleId != null) 'parent_module_id': parentModuleId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ModulesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? projectId,
    Value<String?>? parentModuleId,
    Value<int>? rowid,
  }) {
    return ModulesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      projectId: projectId ?? this.projectId,
      parentModuleId: parentModuleId ?? this.parentModuleId,
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
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (parentModuleId.present) {
      map['parent_module_id'] = Variable<String>(parentModuleId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModulesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('projectId: $projectId, ')
          ..write('parentModuleId: $parentModuleId, ')
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
  static const VerificationMeta _moduleIdMeta = const VerificationMeta(
    'moduleId',
  );
  @override
  late final GeneratedColumn<String> moduleId = GeneratedColumn<String>(
    'module_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES modules (id)',
    ),
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
    moduleId,
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
    if (data.containsKey('module_id')) {
      context.handle(
        _moduleIdMeta,
        moduleId.isAcceptableOrUnknown(data['module_id']!, _moduleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_moduleIdMeta);
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
      moduleId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}module_id'],
          )!,
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
  final String moduleId;
  final String? ownerUserId;
  final DateTime? lastModifiedUtc;
  final int overallPassed;
  final int overallFailed;
  final int overallBlocked;
  const TestPlan({
    required this.id,
    required this.name,
    this.description,
    required this.moduleId,
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
    map['module_id'] = Variable<String>(moduleId);
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
      moduleId: Value(moduleId),
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
      moduleId: serializer.fromJson<String>(json['moduleId']),
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
      'moduleId': serializer.toJson<String>(moduleId),
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
    String? moduleId,
    Value<String?> ownerUserId = const Value.absent(),
    Value<DateTime?> lastModifiedUtc = const Value.absent(),
    int? overallPassed,
    int? overallFailed,
    int? overallBlocked,
  }) => TestPlan(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    moduleId: moduleId ?? this.moduleId,
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
      moduleId: data.moduleId.present ? data.moduleId.value : this.moduleId,
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
          ..write('moduleId: $moduleId, ')
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
    moduleId,
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
          other.moduleId == this.moduleId &&
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
  final Value<String> moduleId;
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
    this.moduleId = const Value.absent(),
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
    required String moduleId,
    this.ownerUserId = const Value.absent(),
    this.lastModifiedUtc = const Value.absent(),
    this.overallPassed = const Value.absent(),
    this.overallFailed = const Value.absent(),
    this.overallBlocked = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       moduleId = Value(moduleId);
  static Insertable<TestPlan> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? moduleId,
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
      if (moduleId != null) 'module_id': moduleId,
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
    Value<String>? moduleId,
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
      moduleId: moduleId ?? this.moduleId,
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
    if (moduleId.present) {
      map['module_id'] = Variable<String>(moduleId.value);
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
          ..write('moduleId: $moduleId, ')
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
  static const VerificationMeta _parentCaseIdMeta = const VerificationMeta(
    'parentCaseId',
  );
  @override
  late final GeneratedColumn<String> parentCaseId = GeneratedColumn<String>(
    'parent_case_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES test_cases (id)',
    ),
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
    parentCaseId,
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
    if (data.containsKey('parent_case_id')) {
      context.handle(
        _parentCaseIdMeta,
        parentCaseId.isAcceptableOrUnknown(
          data['parent_case_id']!,
          _parentCaseIdMeta,
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
      parentCaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_case_id'],
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
  final String? parentCaseId;
  const TestCase({
    required this.id,
    required this.planId,
    required this.title,
    required this.status,
    this.assignedToUserId,
    this.expectedResult,
    this.lastModifiedUtc,
    this.parentCaseId,
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
    if (!nullToAbsent || parentCaseId != null) {
      map['parent_case_id'] = Variable<String>(parentCaseId);
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
      parentCaseId:
          parentCaseId == null && nullToAbsent
              ? const Value.absent()
              : Value(parentCaseId),
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
      parentCaseId: serializer.fromJson<String?>(json['parentCaseId']),
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
      'parentCaseId': serializer.toJson<String?>(parentCaseId),
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
    Value<String?> parentCaseId = const Value.absent(),
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
    parentCaseId: parentCaseId.present ? parentCaseId.value : this.parentCaseId,
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
      parentCaseId:
          data.parentCaseId.present
              ? data.parentCaseId.value
              : this.parentCaseId,
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
          ..write('lastModifiedUtc: $lastModifiedUtc, ')
          ..write('parentCaseId: $parentCaseId')
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
    parentCaseId,
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
          other.lastModifiedUtc == this.lastModifiedUtc &&
          other.parentCaseId == this.parentCaseId);
}

class TestCasesCompanion extends UpdateCompanion<TestCase> {
  final Value<String> id;
  final Value<String> planId;
  final Value<String> title;
  final Value<String> status;
  final Value<String?> assignedToUserId;
  final Value<String?> expectedResult;
  final Value<DateTime?> lastModifiedUtc;
  final Value<String?> parentCaseId;
  final Value<int> rowid;
  const TestCasesCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.assignedToUserId = const Value.absent(),
    this.expectedResult = const Value.absent(),
    this.lastModifiedUtc = const Value.absent(),
    this.parentCaseId = const Value.absent(),
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
    this.parentCaseId = const Value.absent(),
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
    Expression<String>? parentCaseId,
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
      if (parentCaseId != null) 'parent_case_id': parentCaseId,
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
    Value<String?>? parentCaseId,
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
      parentCaseId: parentCaseId ?? this.parentCaseId,
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
    if (parentCaseId.present) {
      map['parent_case_id'] = Variable<String>(parentCaseId.value);
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
          ..write('parentCaseId: $parentCaseId, ')
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('NotRun'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    testCaseId,
    stepNumber,
    description,
    expected,
    status,
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
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
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
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
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
  final String status;
  const TestStep({
    required this.id,
    required this.testCaseId,
    required this.stepNumber,
    required this.description,
    this.expected,
    required this.status,
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
    map['status'] = Variable<String>(status);
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
      status: Value(status),
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
      status: serializer.fromJson<String>(json['status']),
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
      'status': serializer.toJson<String>(status),
    };
  }

  TestStep copyWith({
    String? id,
    String? testCaseId,
    int? stepNumber,
    String? description,
    Value<String?> expected = const Value.absent(),
    String? status,
  }) => TestStep(
    id: id ?? this.id,
    testCaseId: testCaseId ?? this.testCaseId,
    stepNumber: stepNumber ?? this.stepNumber,
    description: description ?? this.description,
    expected: expected.present ? expected.value : this.expected,
    status: status ?? this.status,
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
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestStep(')
          ..write('id: $id, ')
          ..write('testCaseId: $testCaseId, ')
          ..write('stepNumber: $stepNumber, ')
          ..write('description: $description, ')
          ..write('expected: $expected, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, testCaseId, stepNumber, description, expected, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestStep &&
          other.id == this.id &&
          other.testCaseId == this.testCaseId &&
          other.stepNumber == this.stepNumber &&
          other.description == this.description &&
          other.expected == this.expected &&
          other.status == this.status);
}

class TestStepsCompanion extends UpdateCompanion<TestStep> {
  final Value<String> id;
  final Value<String> testCaseId;
  final Value<int> stepNumber;
  final Value<String> description;
  final Value<String?> expected;
  final Value<String> status;
  final Value<int> rowid;
  const TestStepsCompanion({
    this.id = const Value.absent(),
    this.testCaseId = const Value.absent(),
    this.stepNumber = const Value.absent(),
    this.description = const Value.absent(),
    this.expected = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestStepsCompanion.insert({
    required String id,
    required String testCaseId,
    required int stepNumber,
    required String description,
    this.expected = const Value.absent(),
    this.status = const Value.absent(),
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
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (testCaseId != null) 'test_case_id': testCaseId,
      if (stepNumber != null) 'step_number': stepNumber,
      if (description != null) 'description': description,
      if (expected != null) 'expected': expected,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestStepsCompanion copyWith({
    Value<String>? id,
    Value<String>? testCaseId,
    Value<int>? stepNumber,
    Value<String>? description,
    Value<String?>? expected,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return TestStepsCompanion(
      id: id ?? this.id,
      testCaseId: testCaseId ?? this.testCaseId,
      stepNumber: stepNumber ?? this.stepNumber,
      description: description ?? this.description,
      expected: expected ?? this.expected,
      status: status ?? this.status,
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
    if (status.present) {
      map['status'] = Variable<String>(status.value);
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
          ..write('status: $status, ')
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

class $CustomStatusesTable extends CustomStatuses
    with TableInfo<$CustomStatusesTable, CustomStatus> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomStatusesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByUserIdMeta = const VerificationMeta(
    'createdByUserId',
  );
  @override
  late final GeneratedColumn<String> createdByUserId = GeneratedColumn<String>(
    'created_by_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    name,
    colorHex,
    createdByUserId,
    createdAtUtc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_statuses';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomStatus> instance, {
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
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    if (data.containsKey('created_by_user_id')) {
      context.handle(
        _createdByUserIdMeta,
        createdByUserId.isAcceptableOrUnknown(
          data['created_by_user_id']!,
          _createdByUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdByUserIdMeta);
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
  CustomStatus map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomStatus(
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
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      ),
      createdByUserId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}created_by_user_id'],
          )!,
      createdAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at_utc'],
      ),
    );
  }

  @override
  $CustomStatusesTable createAlias(String alias) {
    return $CustomStatusesTable(attachedDatabase, alias);
  }
}

class CustomStatus extends DataClass implements Insertable<CustomStatus> {
  final String id;
  final String name;
  final String? colorHex;
  final String createdByUserId;
  final DateTime? createdAtUtc;
  const CustomStatus({
    required this.id,
    required this.name,
    this.colorHex,
    required this.createdByUserId,
    this.createdAtUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    map['created_by_user_id'] = Variable<String>(createdByUserId);
    if (!nullToAbsent || createdAtUtc != null) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc);
    }
    return map;
  }

  CustomStatusesCompanion toCompanion(bool nullToAbsent) {
    return CustomStatusesCompanion(
      id: Value(id),
      name: Value(name),
      colorHex:
          colorHex == null && nullToAbsent
              ? const Value.absent()
              : Value(colorHex),
      createdByUserId: Value(createdByUserId),
      createdAtUtc:
          createdAtUtc == null && nullToAbsent
              ? const Value.absent()
              : Value(createdAtUtc),
    );
  }

  factory CustomStatus.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomStatus(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      createdByUserId: serializer.fromJson<String>(json['createdByUserId']),
      createdAtUtc: serializer.fromJson<DateTime?>(json['createdAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorHex': serializer.toJson<String?>(colorHex),
      'createdByUserId': serializer.toJson<String>(createdByUserId),
      'createdAtUtc': serializer.toJson<DateTime?>(createdAtUtc),
    };
  }

  CustomStatus copyWith({
    String? id,
    String? name,
    Value<String?> colorHex = const Value.absent(),
    String? createdByUserId,
    Value<DateTime?> createdAtUtc = const Value.absent(),
  }) => CustomStatus(
    id: id ?? this.id,
    name: name ?? this.name,
    colorHex: colorHex.present ? colorHex.value : this.colorHex,
    createdByUserId: createdByUserId ?? this.createdByUserId,
    createdAtUtc: createdAtUtc.present ? createdAtUtc.value : this.createdAtUtc,
  );
  CustomStatus copyWithCompanion(CustomStatusesCompanion data) {
    return CustomStatus(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
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
    return (StringBuffer('CustomStatus(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('createdAtUtc: $createdAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, colorHex, createdByUserId, createdAtUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomStatus &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorHex == this.colorHex &&
          other.createdByUserId == this.createdByUserId &&
          other.createdAtUtc == this.createdAtUtc);
}

class CustomStatusesCompanion extends UpdateCompanion<CustomStatus> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> colorHex;
  final Value<String> createdByUserId;
  final Value<DateTime?> createdAtUtc;
  final Value<int> rowid;
  const CustomStatusesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.createdByUserId = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomStatusesCompanion.insert({
    required String id,
    required String name,
    this.colorHex = const Value.absent(),
    required String createdByUserId,
    this.createdAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdByUserId = Value(createdByUserId);
  static Insertable<CustomStatus> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? colorHex,
    Expression<String>? createdByUserId,
    Expression<DateTime>? createdAtUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorHex != null) 'color_hex': colorHex,
      if (createdByUserId != null) 'created_by_user_id': createdByUserId,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomStatusesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? colorHex,
    Value<String>? createdByUserId,
    Value<DateTime?>? createdAtUtc,
    Value<int>? rowid,
  }) {
    return CustomStatusesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
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
    return (StringBuffer('CustomStatusesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
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
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $ModulesTable modules = $ModulesTable(this);
  late final $TestPlansTable testPlans = $TestPlansTable(this);
  late final $TestCasesTable testCases = $TestCasesTable(this);
  late final $TestStepsTable testSteps = $TestStepsTable(this);
  late final $CommentsTable comments = $CommentsTable(this);
  late final $CustomStatusesTable customStatuses = $CustomStatusesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    projects,
    modules,
    testPlans,
    testCases,
    testSteps,
    comments,
    customStatuses,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      Value<String?> displayName,
      Value<String?> email,
      Value<String?> userPrincipalName,
      Value<String?> loginName,
      Value<String?> jobTitle,
      Value<String?> department,
      Value<String?> pictureUrl,
      Value<DateTime?> createdAtUtc,
      Value<DateTime?> lastModifiedUtc,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String?> displayName,
      Value<String?> email,
      Value<String?> userPrincipalName,
      Value<String?> loginName,
      Value<String?> jobTitle,
      Value<String?> department,
      Value<String?> pictureUrl,
      Value<DateTime?> createdAtUtc,
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

  static MultiTypedResultKey<$CustomStatusesTable, List<CustomStatus>>
  _customStatusesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.customStatuses,
    aliasName: $_aliasNameGenerator(
      db.users.id,
      db.customStatuses.createdByUserId,
    ),
  );

  $$CustomStatusesTableProcessedTableManager get customStatusesRefs {
    final manager = $$CustomStatusesTableTableManager(
      $_db,
      $_db.customStatuses,
    ).filter(
      (f) => f.createdByUserId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_customStatusesRefsTable($_db));
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

  ColumnFilters<String> get userPrincipalName => $composableBuilder(
    column: $table.userPrincipalName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get loginName => $composableBuilder(
    column: $table.loginName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobTitle => $composableBuilder(
    column: $table.jobTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pictureUrl => $composableBuilder(
    column: $table.pictureUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
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

  Expression<bool> customStatusesRefs(
    Expression<bool> Function($$CustomStatusesTableFilterComposer f) f,
  ) {
    final $$CustomStatusesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customStatuses,
      getReferencedColumn: (t) => t.createdByUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomStatusesTableFilterComposer(
            $db: $db,
            $table: $db.customStatuses,
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

  ColumnOrderings<String> get userPrincipalName => $composableBuilder(
    column: $table.userPrincipalName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get loginName => $composableBuilder(
    column: $table.loginName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobTitle => $composableBuilder(
    column: $table.jobTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pictureUrl => $composableBuilder(
    column: $table.pictureUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
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

  GeneratedColumn<String> get userPrincipalName => $composableBuilder(
    column: $table.userPrincipalName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get loginName =>
      $composableBuilder(column: $table.loginName, builder: (column) => column);

  GeneratedColumn<String> get jobTitle =>
      $composableBuilder(column: $table.jobTitle, builder: (column) => column);

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pictureUrl => $composableBuilder(
    column: $table.pictureUrl,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => column,
  );

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

  Expression<T> customStatusesRefs<T extends Object>(
    Expression<T> Function($$CustomStatusesTableAnnotationComposer a) f,
  ) {
    final $$CustomStatusesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customStatuses,
      getReferencedColumn: (t) => t.createdByUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomStatusesTableAnnotationComposer(
            $db: $db,
            $table: $db.customStatuses,
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
            bool customStatusesRefs,
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
                Value<String?> userPrincipalName = const Value.absent(),
                Value<String?> loginName = const Value.absent(),
                Value<String?> jobTitle = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> pictureUrl = const Value.absent(),
                Value<DateTime?> createdAtUtc = const Value.absent(),
                Value<DateTime?> lastModifiedUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                displayName: displayName,
                email: email,
                userPrincipalName: userPrincipalName,
                loginName: loginName,
                jobTitle: jobTitle,
                department: department,
                pictureUrl: pictureUrl,
                createdAtUtc: createdAtUtc,
                lastModifiedUtc: lastModifiedUtc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> displayName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> userPrincipalName = const Value.absent(),
                Value<String?> loginName = const Value.absent(),
                Value<String?> jobTitle = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> pictureUrl = const Value.absent(),
                Value<DateTime?> createdAtUtc = const Value.absent(),
                Value<DateTime?> lastModifiedUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                displayName: displayName,
                email: email,
                userPrincipalName: userPrincipalName,
                loginName: loginName,
                jobTitle: jobTitle,
                department: department,
                pictureUrl: pictureUrl,
                createdAtUtc: createdAtUtc,
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
            customStatusesRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (testPlansRefs) db.testPlans,
                if (testCasesRefs) db.testCases,
                if (commentsRefs) db.comments,
                if (customStatusesRefs) db.customStatuses,
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
                  if (customStatusesRefs)
                    await $_getPrefetchedData<User, $UsersTable, CustomStatus>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._customStatusesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).customStatusesRefs,
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
        bool customStatusesRefs,
      })
    >;
typedef $$ProjectsTableCreateCompanionBuilder =
    ProjectsCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<DateTime?> createdAtUtc,
      Value<int> rowid,
    });
typedef $$ProjectsTableUpdateCompanionBuilder =
    ProjectsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<DateTime?> createdAtUtc,
      Value<int> rowid,
    });

final class $$ProjectsTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectsTable, Project> {
  $$ProjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ModulesTable, List<Module>> _modulesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.modules,
    aliasName: $_aliasNameGenerator(db.projects.id, db.modules.projectId),
  );

  $$ModulesTableProcessedTableManager get modulesRefs {
    final manager = $$ModulesTableTableManager(
      $_db,
      $_db.modules,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_modulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> modulesRefs(
    Expression<bool> Function($$ModulesTableFilterComposer f) f,
  ) {
    final $$ModulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.modules,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulesTableFilterComposer(
            $db: $db,
            $table: $db.modules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => column,
  );

  Expression<T> modulesRefs<T extends Object>(
    Expression<T> Function($$ModulesTableAnnotationComposer a) f,
  ) {
    final $$ModulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.modules,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulesTableAnnotationComposer(
            $db: $db,
            $table: $db.modules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectsTable,
          Project,
          $$ProjectsTableFilterComposer,
          $$ProjectsTableOrderingComposer,
          $$ProjectsTableAnnotationComposer,
          $$ProjectsTableCreateCompanionBuilder,
          $$ProjectsTableUpdateCompanionBuilder,
          (Project, $$ProjectsTableReferences),
          Project,
          PrefetchHooks Function({bool modulesRefs})
        > {
  $$ProjectsTableTableManager(_$AppDatabase db, $ProjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime?> createdAtUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion(
                id: id,
                name: name,
                description: description,
                createdAtUtc: createdAtUtc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<DateTime?> createdAtUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion.insert(
                id: id,
                name: name,
                description: description,
                createdAtUtc: createdAtUtc,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ProjectsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({modulesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (modulesRefs) db.modules],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (modulesRefs)
                    await $_getPrefetchedData<Project, $ProjectsTable, Module>(
                      currentTable: table,
                      referencedTable: $$ProjectsTableReferences
                          ._modulesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).modulesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.projectId == item.id,
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

typedef $$ProjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectsTable,
      Project,
      $$ProjectsTableFilterComposer,
      $$ProjectsTableOrderingComposer,
      $$ProjectsTableAnnotationComposer,
      $$ProjectsTableCreateCompanionBuilder,
      $$ProjectsTableUpdateCompanionBuilder,
      (Project, $$ProjectsTableReferences),
      Project,
      PrefetchHooks Function({bool modulesRefs})
    >;
typedef $$ModulesTableCreateCompanionBuilder =
    ModulesCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      required String projectId,
      Value<String?> parentModuleId,
      Value<int> rowid,
    });
typedef $$ModulesTableUpdateCompanionBuilder =
    ModulesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String> projectId,
      Value<String?> parentModuleId,
      Value<int> rowid,
    });

final class $$ModulesTableReferences
    extends BaseReferences<_$AppDatabase, $ModulesTable, Module> {
  $$ModulesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) => db.projects
      .createAlias($_aliasNameGenerator(db.modules.projectId, db.projects.id));

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ModulesTable _parentModuleIdTable(_$AppDatabase db) =>
      db.modules.createAlias(
        $_aliasNameGenerator(db.modules.parentModuleId, db.modules.id),
      );

  $$ModulesTableProcessedTableManager? get parentModuleId {
    final $_column = $_itemColumn<String>('parent_module_id');
    if ($_column == null) return null;
    final manager = $$ModulesTableTableManager(
      $_db,
      $_db.modules,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentModuleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TestPlansTable, List<TestPlan>>
  _testPlansRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.testPlans,
    aliasName: $_aliasNameGenerator(db.modules.id, db.testPlans.moduleId),
  );

  $$TestPlansTableProcessedTableManager get testPlansRefs {
    final manager = $$TestPlansTableTableManager(
      $_db,
      $_db.testPlans,
    ).filter((f) => f.moduleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_testPlansRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ModulesTableFilterComposer
    extends Composer<_$AppDatabase, $ModulesTable> {
  $$ModulesTableFilterComposer({
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

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ModulesTableFilterComposer get parentModuleId {
    final $$ModulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentModuleId,
      referencedTable: $db.modules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulesTableFilterComposer(
            $db: $db,
            $table: $db.modules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> testPlansRefs(
    Expression<bool> Function($$TestPlansTableFilterComposer f) f,
  ) {
    final $$TestPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testPlans,
      getReferencedColumn: (t) => t.moduleId,
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
}

class $$ModulesTableOrderingComposer
    extends Composer<_$AppDatabase, $ModulesTable> {
  $$ModulesTableOrderingComposer({
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

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ModulesTableOrderingComposer get parentModuleId {
    final $$ModulesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentModuleId,
      referencedTable: $db.modules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulesTableOrderingComposer(
            $db: $db,
            $table: $db.modules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ModulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModulesTable> {
  $$ModulesTableAnnotationComposer({
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

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ModulesTableAnnotationComposer get parentModuleId {
    final $$ModulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentModuleId,
      referencedTable: $db.modules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulesTableAnnotationComposer(
            $db: $db,
            $table: $db.modules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> testPlansRefs<T extends Object>(
    Expression<T> Function($$TestPlansTableAnnotationComposer a) f,
  ) {
    final $$TestPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testPlans,
      getReferencedColumn: (t) => t.moduleId,
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
}

class $$ModulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ModulesTable,
          Module,
          $$ModulesTableFilterComposer,
          $$ModulesTableOrderingComposer,
          $$ModulesTableAnnotationComposer,
          $$ModulesTableCreateCompanionBuilder,
          $$ModulesTableUpdateCompanionBuilder,
          (Module, $$ModulesTableReferences),
          Module,
          PrefetchHooks Function({
            bool projectId,
            bool parentModuleId,
            bool testPlansRefs,
          })
        > {
  $$ModulesTableTableManager(_$AppDatabase db, $ModulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ModulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ModulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ModulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String?> parentModuleId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ModulesCompanion(
                id: id,
                name: name,
                description: description,
                projectId: projectId,
                parentModuleId: parentModuleId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                required String projectId,
                Value<String?> parentModuleId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ModulesCompanion.insert(
                id: id,
                name: name,
                description: description,
                projectId: projectId,
                parentModuleId: parentModuleId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ModulesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            projectId = false,
            parentModuleId = false,
            testPlansRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (testPlansRefs) db.testPlans],
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
                if (projectId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.projectId,
                            referencedTable: $$ModulesTableReferences
                                ._projectIdTable(db),
                            referencedColumn:
                                $$ModulesTableReferences._projectIdTable(db).id,
                          )
                          as T;
                }
                if (parentModuleId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.parentModuleId,
                            referencedTable: $$ModulesTableReferences
                                ._parentModuleIdTable(db),
                            referencedColumn:
                                $$ModulesTableReferences
                                    ._parentModuleIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (testPlansRefs)
                    await $_getPrefetchedData<Module, $ModulesTable, TestPlan>(
                      currentTable: table,
                      referencedTable: $$ModulesTableReferences
                          ._testPlansRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ModulesTableReferences(
                                db,
                                table,
                                p0,
                              ).testPlansRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.moduleId == item.id,
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

typedef $$ModulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ModulesTable,
      Module,
      $$ModulesTableFilterComposer,
      $$ModulesTableOrderingComposer,
      $$ModulesTableAnnotationComposer,
      $$ModulesTableCreateCompanionBuilder,
      $$ModulesTableUpdateCompanionBuilder,
      (Module, $$ModulesTableReferences),
      Module,
      PrefetchHooks Function({
        bool projectId,
        bool parentModuleId,
        bool testPlansRefs,
      })
    >;
typedef $$TestPlansTableCreateCompanionBuilder =
    TestPlansCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      required String moduleId,
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
      Value<String> moduleId,
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

  static $ModulesTable _moduleIdTable(_$AppDatabase db) => db.modules
      .createAlias($_aliasNameGenerator(db.testPlans.moduleId, db.modules.id));

  $$ModulesTableProcessedTableManager get moduleId {
    final $_column = $_itemColumn<String>('module_id')!;

    final manager = $$ModulesTableTableManager(
      $_db,
      $_db.modules,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_moduleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

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

  $$ModulesTableFilterComposer get moduleId {
    final $$ModulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moduleId,
      referencedTable: $db.modules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulesTableFilterComposer(
            $db: $db,
            $table: $db.modules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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

  $$ModulesTableOrderingComposer get moduleId {
    final $$ModulesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moduleId,
      referencedTable: $db.modules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulesTableOrderingComposer(
            $db: $db,
            $table: $db.modules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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

  $$ModulesTableAnnotationComposer get moduleId {
    final $$ModulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moduleId,
      referencedTable: $db.modules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulesTableAnnotationComposer(
            $db: $db,
            $table: $db.modules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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
          PrefetchHooks Function({
            bool moduleId,
            bool ownerUserId,
            bool testCasesRefs,
          })
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
                Value<String> moduleId = const Value.absent(),
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
                moduleId: moduleId,
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
                required String moduleId,
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
                moduleId: moduleId,
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
            moduleId = false,
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
                if (moduleId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.moduleId,
                            referencedTable: $$TestPlansTableReferences
                                ._moduleIdTable(db),
                            referencedColumn:
                                $$TestPlansTableReferences
                                    ._moduleIdTable(db)
                                    .id,
                          )
                          as T;
                }
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
      PrefetchHooks Function({
        bool moduleId,
        bool ownerUserId,
        bool testCasesRefs,
      })
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
      Value<String?> parentCaseId,
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
      Value<String?> parentCaseId,
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

  static $TestCasesTable _parentCaseIdTable(_$AppDatabase db) =>
      db.testCases.createAlias(
        $_aliasNameGenerator(db.testCases.parentCaseId, db.testCases.id),
      );

  $$TestCasesTableProcessedTableManager? get parentCaseId {
    final $_column = $_itemColumn<String>('parent_case_id');
    if ($_column == null) return null;
    final manager = $$TestCasesTableTableManager(
      $_db,
      $_db.testCases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentCaseIdTable($_db));
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

  $$TestCasesTableFilterComposer get parentCaseId {
    final $$TestCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentCaseId,
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

  $$TestCasesTableOrderingComposer get parentCaseId {
    final $$TestCasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentCaseId,
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

  $$TestCasesTableAnnotationComposer get parentCaseId {
    final $$TestCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentCaseId,
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
            bool parentCaseId,
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
                Value<String?> parentCaseId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestCasesCompanion(
                id: id,
                planId: planId,
                title: title,
                status: status,
                assignedToUserId: assignedToUserId,
                expectedResult: expectedResult,
                lastModifiedUtc: lastModifiedUtc,
                parentCaseId: parentCaseId,
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
                Value<String?> parentCaseId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestCasesCompanion.insert(
                id: id,
                planId: planId,
                title: title,
                status: status,
                assignedToUserId: assignedToUserId,
                expectedResult: expectedResult,
                lastModifiedUtc: lastModifiedUtc,
                parentCaseId: parentCaseId,
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
            parentCaseId = false,
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
                if (parentCaseId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.parentCaseId,
                            referencedTable: $$TestCasesTableReferences
                                ._parentCaseIdTable(db),
                            referencedColumn:
                                $$TestCasesTableReferences
                                    ._parentCaseIdTable(db)
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
        bool parentCaseId,
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
      Value<String> status,
      Value<int> rowid,
    });
typedef $$TestStepsTableUpdateCompanionBuilder =
    TestStepsCompanion Function({
      Value<String> id,
      Value<String> testCaseId,
      Value<int> stepNumber,
      Value<String> description,
      Value<String?> expected,
      Value<String> status,
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

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
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

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
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

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

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
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestStepsCompanion(
                id: id,
                testCaseId: testCaseId,
                stepNumber: stepNumber,
                description: description,
                expected: expected,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String testCaseId,
                required int stepNumber,
                required String description,
                Value<String?> expected = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestStepsCompanion.insert(
                id: id,
                testCaseId: testCaseId,
                stepNumber: stepNumber,
                description: description,
                expected: expected,
                status: status,
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
typedef $$CustomStatusesTableCreateCompanionBuilder =
    CustomStatusesCompanion Function({
      required String id,
      required String name,
      Value<String?> colorHex,
      required String createdByUserId,
      Value<DateTime?> createdAtUtc,
      Value<int> rowid,
    });
typedef $$CustomStatusesTableUpdateCompanionBuilder =
    CustomStatusesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> colorHex,
      Value<String> createdByUserId,
      Value<DateTime?> createdAtUtc,
      Value<int> rowid,
    });

final class $$CustomStatusesTableReferences
    extends BaseReferences<_$AppDatabase, $CustomStatusesTable, CustomStatus> {
  $$CustomStatusesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _createdByUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(db.customStatuses.createdByUserId, db.users.id),
      );

  $$UsersTableProcessedTableManager get createdByUserId {
    final $_column = $_itemColumn<String>('created_by_user_id')!;

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

class $$CustomStatusesTableFilterComposer
    extends Composer<_$AppDatabase, $CustomStatusesTable> {
  $$CustomStatusesTableFilterComposer({
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

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnFilters(column),
  );

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

class $$CustomStatusesTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomStatusesTable> {
  $$CustomStatusesTableOrderingComposer({
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

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnOrderings(column),
  );

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

class $$CustomStatusesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomStatusesTable> {
  $$CustomStatusesTableAnnotationComposer({
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

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => column,
  );

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

class $$CustomStatusesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomStatusesTable,
          CustomStatus,
          $$CustomStatusesTableFilterComposer,
          $$CustomStatusesTableOrderingComposer,
          $$CustomStatusesTableAnnotationComposer,
          $$CustomStatusesTableCreateCompanionBuilder,
          $$CustomStatusesTableUpdateCompanionBuilder,
          (CustomStatus, $$CustomStatusesTableReferences),
          CustomStatus,
          PrefetchHooks Function({bool createdByUserId})
        > {
  $$CustomStatusesTableTableManager(
    _$AppDatabase db,
    $CustomStatusesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CustomStatusesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$CustomStatusesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CustomStatusesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> colorHex = const Value.absent(),
                Value<String> createdByUserId = const Value.absent(),
                Value<DateTime?> createdAtUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomStatusesCompanion(
                id: id,
                name: name,
                colorHex: colorHex,
                createdByUserId: createdByUserId,
                createdAtUtc: createdAtUtc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> colorHex = const Value.absent(),
                required String createdByUserId,
                Value<DateTime?> createdAtUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomStatusesCompanion.insert(
                id: id,
                name: name,
                colorHex: colorHex,
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
                          $$CustomStatusesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({createdByUserId = false}) {
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
                if (createdByUserId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.createdByUserId,
                            referencedTable: $$CustomStatusesTableReferences
                                ._createdByUserIdTable(db),
                            referencedColumn:
                                $$CustomStatusesTableReferences
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

typedef $$CustomStatusesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomStatusesTable,
      CustomStatus,
      $$CustomStatusesTableFilterComposer,
      $$CustomStatusesTableOrderingComposer,
      $$CustomStatusesTableAnnotationComposer,
      $$CustomStatusesTableCreateCompanionBuilder,
      $$CustomStatusesTableUpdateCompanionBuilder,
      (CustomStatus, $$CustomStatusesTableReferences),
      CustomStatus,
      PrefetchHooks Function({bool createdByUserId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$ModulesTableTableManager get modules =>
      $$ModulesTableTableManager(_db, _db.modules);
  $$TestPlansTableTableManager get testPlans =>
      $$TestPlansTableTableManager(_db, _db.testPlans);
  $$TestCasesTableTableManager get testCases =>
      $$TestCasesTableTableManager(_db, _db.testCases);
  $$TestStepsTableTableManager get testSteps =>
      $$TestStepsTableTableManager(_db, _db.testSteps);
  $$CommentsTableTableManager get comments =>
      $$CommentsTableTableManager(_db, _db.comments);
  $$CustomStatusesTableTableManager get customStatuses =>
      $$CustomStatusesTableTableManager(_db, _db.customStatuses);
}
