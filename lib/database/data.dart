import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'data.g.dart';

// ------------------- TABLES -------------------

@DataClassName('User')
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get userPrincipalName => text().nullable()();
  TextColumn get loginName => text().nullable()();
  TextColumn get jobTitle => text().nullable()();
  TextColumn get department => text().nullable()();
  TextColumn get pictureUrl => text().nullable()();
  DateTimeColumn get createdAtUtc => dateTime().nullable()();
  DateTimeColumn get lastModifiedUtc => dateTime().nullable()();


  @override
  Set<Column> get primaryKey => {id};
}


@DataClassName('Project')
class Projects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAtUtc => dateTime().nullable()();


  @override
  Set<Column> get primaryKey => {id};
}


@DataClassName('Module')
class Modules extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get projectId => text().references(Projects, #id)();
  TextColumn get parentModuleId => text().nullable().references(Modules, #id)();

  @override
  Set<Column> get primaryKey => {id};
}


@DataClassName('TestPlan')
class TestPlans extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get moduleId => text().references(Modules, #id)();
  TextColumn get ownerUserId => text().nullable().references(Users, #id)();
  DateTimeColumn get lastModifiedUtc => dateTime().nullable()();
  IntColumn get overallPassed => integer().withDefault(const Constant(0))();
  IntColumn get overallFailed => integer().withDefault(const Constant(0))();
  IntColumn get overallBlocked => integer().withDefault(const Constant(0))();


  @override
  Set<Column> get primaryKey => {id};
}


@DataClassName('TestCase')
class TestCases extends Table {
  TextColumn get id => text()();
  TextColumn get planId => text().references(TestPlans, #id)();
  TextColumn get title => text()();
  TextColumn get status => text()();
  TextColumn get assignedToUserId => text().nullable().references(Users, #id)();
  TextColumn get expectedResult => text().nullable()();
  DateTimeColumn get lastModifiedUtc => dateTime().nullable()();
  TextColumn get parentCaseId => text().nullable().references(TestCases, #id)();


  @override
  Set<Column> get primaryKey => {id};
}


@DataClassName('TestStep')
class TestSteps extends Table {
  TextColumn get id => text()();
  TextColumn get testCaseId => text().references(TestCases, #id)();
  IntColumn get stepNumber => integer()();
  TextColumn get description => text()();
  TextColumn get expected => text().nullable()();


  @override
  Set<Column> get primaryKey => {id};
}


@DataClassName('Comment')
class Comments extends Table {
  TextColumn get id => text()();
  TextColumn get testCaseId => text().references(TestCases, #id)();
  TextColumn get content => text()();
  TextColumn get createdByUserId => text().nullable().references(Users, #id)();
  DateTimeColumn get createdAtUtc => dateTime().nullable()();


  @override
  Set<Column> get primaryKey => {id};
}


@DataClassName('CustomStatus')
class CustomStatuses extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get colorHex => text().nullable()();
  TextColumn get createdByUserId => text().references(Users, #id)();
  DateTimeColumn get createdAtUtc => dateTime().nullable()();


  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    Users,
    Projects,
    Modules,
    TestPlans,
    TestCases,
    TestSteps,
    Comments,
    CustomStatuses,
  ],
)

class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await seedInitialData();
        },
      );

  Future<void> seedInitialData() async {
    final existingUsers = await (select(users)
      ..limit(1)).get();
    if (existingUsers.isNotEmpty) {
      print('✅ Seed pominięty – dane już istnieją');
      return;
    }

    final now = DateTime.now().toUtc();

    await batch((b) {
      // 👤 Użytkownik
      b.insert(
        users,
        UsersCompanion.insert(
          id: 'user_1',
          displayName: const Value('Admin'),
          email: const Value('admin@example.com'),
          createdAtUtc: Value(now),
          lastModifiedUtc: Value(now),
        ),
      );

      // 📁 Projekty
      b.insertAll(projects, [
        ProjectsCompanion.insert(id: 'project_1',
            name: 'Projekt A',
            description: const Value('Opis projektu A'),
            createdAtUtc: Value(now)),
        ProjectsCompanion.insert(id: 'project_2',
            name: 'Projekt B',
            description: const Value('Opis projektu B'),
            createdAtUtc: Value(now)),
      ]);

      // 📦 Moduły
      b.insertAll(modules, [
        // Moduły główne
        ModulesCompanion.insert(id: 'module_1',
            name: 'Moduł 1',
            description: const Value('Moduł główny 1'),
            projectId: 'project_1'),
        ModulesCompanion.insert(id: 'module_2',
            name: 'Moduł 2',
            description: const Value('Moduł główny 2'),
            projectId: 'project_1'),

        ModulesCompanion.insert(id: 'module_3',
            name: 'Moduł 3',
            description: const Value('Moduł główny 3'),
            projectId: 'project_2'),
        ModulesCompanion.insert(id: 'module_4',
            name: 'Moduł 4',
            description: const Value('Moduł główny 4'),
            projectId: 'project_2'),

        // Podmoduł wewnątrz module_1
        ModulesCompanion.insert(id: 'submodule_1',
            name: 'Podmoduł A',
            description: const Value('Zagnieżdżony moduł A'),
            projectId: 'project_1',
            parentModuleId: const Value('module_1')),
      ModulesCompanion.insert(id: 'submodule_2',
          name: 'Podmoduł B',
          description: const Value('Zagnieżdżony moduł B'),
          projectId: 'project_1',
          parentModuleId: const Value('module_2')),

      ModulesCompanion.insert(id: 'submodule_3',
          name: 'Podmoduł AC',
          description: const Value('Zagnieżdżony moduł AC'),
          projectId: 'project_1',
          parentModuleId: const Value('submodule_1')),
      ]);

      b.insertAll(testPlans, [
        TestPlansCompanion.insert(
          id: 'plan_1',
          name: 'Plan testowy A',
          description: const Value('Plan w podmodule A'),
          moduleId: 'submodule_1',
          ownerUserId: const Value('user_1'),
          lastModifiedUtc: Value(now),
        ),
        TestPlansCompanion.insert(
          id: 'plan_2',
          name: 'Plan testowy B',
          description: const Value('Plan w module 2'),
          moduleId: 'module_2',
          ownerUserId: const Value('user_1'),
          lastModifiedUtc: Value(now),
        ),
        TestPlansCompanion.insert(
          id: 'plan_3',
          name: 'Plan testowy C',
          description: const Value('Plan w module 2'),
          moduleId: 'module_2',
          ownerUserId: const Value('user_1'),
          lastModifiedUtc: Value(now),
        ),
        TestPlansCompanion.insert(
          id: 'plan_4',
          name: 'Plan testowy D',
          description: const Value('Plan w module 1'),
          moduleId: 'module_1',
          ownerUserId: const Value('user_1'),
          lastModifiedUtc: Value(now),
        ),
      ]);

      // 📄 Przypadki testowe + 💬 komentarze
      final List<TestCasesCompanion> allCases = [];
      final List<CommentsCompanion> allComments = [];

      for (var planIndex = 1; planIndex <= 3; planIndex++) {
        final planId = 'plan_$planIndex';
        for (var caseIndex = 1; caseIndex <= 4; caseIndex++) {
          final caseId = 'case_${planId}_$caseIndex';
          allCases.add(TestCasesCompanion.insert(
            id: caseId,
            planId: planId,
            title: 'Test Case $caseIndex for $planId',
            status: 'NotRun',
            assignedToUserId: const Value('user_1'),
            expectedResult: Value('Expected result $caseIndex'),
            lastModifiedUtc: Value(now),
          ));

          // 2 komentarze do każdego test case
          for (var commentIndex = 1; commentIndex <= 2; commentIndex++) {
            allComments.add(CommentsCompanion.insert(
              id: 'comment_${caseId}_$commentIndex',
              testCaseId: caseId,
              content: 'Komentarz $commentIndex do $caseId',
              createdByUserId: const Value('user_1'),
              createdAtUtc: Value(now),
            ));
          }
        }
      }

      b.insertAll(testCases, allCases);
      b.insertAll(comments, allComments);
    });

    print(
        '✅ Seed zakończony — projekty, moduły, plany, testy i komentarze utworzone');
  }
}

  LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'test_plan_manager.sqlite'));
    return NativeDatabase(file);
  });
}
