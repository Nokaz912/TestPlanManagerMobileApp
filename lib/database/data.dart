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
      // 👤 Użytkownicy
      b.insertAll(users, [
        UsersCompanion.insert(
          id: 'user_1',
          displayName: const Value('Admin'),
          email: const Value('admin@example.com'),
          createdAtUtc: Value(now),
          lastModifiedUtc: Value(now),
        ),
        UsersCompanion.insert(
          id: 'user_2',
          displayName: const Value('Tester'),
          email: const Value('qa@example.com'),
          createdAtUtc: Value(now),
          lastModifiedUtc: Value(now),
        ),
        UsersCompanion.insert(
          id: 'user_3',
          displayName: const Value('Developer'),
          email: const Value('dev@example.com'),
          createdAtUtc: Value(now),
          lastModifiedUtc: Value(now),
        ),
      ]);

      // 📁 Projekty
      b.insertAll(projects, [
        ProjectsCompanion.insert(
          id: 'project_1',
          name: 'Aplikacja Mobilna Flutter',
          description: const Value('Rozwój aplikacji mobilnej dla e-commerce'),
          createdAtUtc: Value(now),
        ),
        ProjectsCompanion.insert(
          id: 'project_2',
          name: 'System Backend API',
          description: const Value(
              'Serwis REST API do zarządzania zamówieniami'),
          createdAtUtc: Value(now),
        ),
        ProjectsCompanion.insert(
          id: 'project_3',
          name: 'Portal Administracyjny Web',
          description: const Value('Panel webowy dla administratorów systemu'),
          createdAtUtc: Value(now),
        ),
      ]);

      // 📦 Moduły
      b.insertAll(modules, [
        // --- Projekt 1: Aplikacja Mobilna ---
        ModulesCompanion.insert(
          id: 'mobile_ui',
          name: 'Interfejs użytkownika',
          description: const Value('Ekrany Flutter i widgety'),
          projectId: 'project_1',
        ),
        ModulesCompanion.insert(
          id: 'mobile_auth',
          name: 'Autoryzacja i logowanie',
          description: const Value('Rejestracja, logowanie, reset hasła'),
          projectId: 'project_1',
        ),
        ModulesCompanion.insert(
          id: 'mobile_payment',
          name: 'Płatności',
          description: const Value('Integracja z bramkami płatności'),
          projectId: 'project_1',
        ),
        ModulesCompanion.insert(
          id: 'mobile_core',
          name: 'Core / Shared',
          description: const Value('Wspólne komponenty i konfiguracje'),
          projectId: 'project_1',
        ),

        // --- Głębokie zagnieżdżenie (6 poziomów) ---
        ModulesCompanion.insert(
          id: 'nested_lvl1',
          name: 'Moduł poziom 1',
          description: const Value('Pierwszy poziom zagnieżdżenia'),
          projectId: 'project_1',
        ),
        ModulesCompanion.insert(
          id: 'nested_lvl2',
          name: 'Moduł poziom 2',
          description: const Value('Drugi poziom zagnieżdżenia'),
          projectId: 'project_1',
          parentModuleId: const Value('nested_lvl1'),
        ),
        ModulesCompanion.insert(
          id: 'nested_lvl3',
          name: 'Moduł poziom 3',
          description: const Value('Trzeci poziom zagnieżdżenia'),
          projectId: 'project_1',
          parentModuleId: const Value('nested_lvl2'),
        ),
        ModulesCompanion.insert(
          id: 'nested_lvl4',
          name: 'Moduł poziom 4',
          description: const Value('Czwarty poziom zagnieżdżenia'),
          projectId: 'project_1',
          parentModuleId: const Value('nested_lvl3'),
        ),
        ModulesCompanion.insert(
          id: 'nested_lvl5',
          name: 'Moduł poziom 5',
          description: const Value('Piąty poziom zagnieżdżenia'),
          projectId: 'project_1',
          parentModuleId: const Value('nested_lvl4'),
        ),
        ModulesCompanion.insert(
          id: 'nested_lvl6',
          name: 'Moduł poziom 6 (najgłębszy)',
          description: const Value('Szósty poziom zagnieżdżenia'),
          projectId: 'project_1',
          parentModuleId: const Value('nested_lvl5'),
        ),

        // --- Projekt 2: Backend API ---
        ModulesCompanion.insert(
          id: 'api_auth',
          name: 'Autoryzacja JWT',
          description: const Value('Obsługa tokenów i refresh'),
          projectId: 'project_2',
        ),
        ModulesCompanion.insert(
          id: 'api_orders',
          name: 'Moduł zamówień',
          description: const Value('Tworzenie i obsługa zamówień'),
          projectId: 'project_2',
        ),
        ModulesCompanion.insert(
          id: 'api_payments',
          name: 'Integracje płatności',
          description: const Value('Webhooki i API PayU / Stripe'),
          projectId: 'project_2',
        ),
        ModulesCompanion.insert(
          id: 'api_reporting',
          name: 'Raporty i statystyki',
          description: const Value('Agregacja danych sprzedażowych'),
          projectId: 'project_2',
        ),
        ModulesCompanion.insert(
          id: 'api_notifications',
          name: 'Powiadomienia e-mail/SMS',
          description: const Value('Moduł powiadomień transakcyjnych'),
          projectId: 'project_2',
        ),
        ModulesCompanion.insert(
          id: 'api_payments_stripe',
          name: 'Stripe Integration',
          description: const Value('Obsługa płatności Stripe'),
          projectId: 'project_2',
          parentModuleId: const Value('api_payments'),
        ),

        // --- Projekt 3: Portal Web ---
        ModulesCompanion.insert(
          id: 'admin_dashboard',
          name: 'Dashboard',
          description: const Value('Widżety i kafelki podsumowań'),
          projectId: 'project_3',
        ),
        ModulesCompanion.insert(
          id: 'admin_users',
          name: 'Zarządzanie użytkownikami',
          description: const Value('CRUD użytkowników i role'),
          projectId: 'project_3',
        ),
        ModulesCompanion.insert(
          id: 'admin_settings',
          name: 'Ustawienia systemowe',
          description: const Value('Konfiguracja środowiska i logów'),
          projectId: 'project_3',
        ),
        ModulesCompanion.insert(
          id: 'admin_logs',
          name: 'Podgląd logów',
          description: const Value('Rejestrowanie działań i błędów'),
          projectId: 'project_3',
          parentModuleId: const Value('admin_settings'),
        ),
      ]);

      // 🧪 Test plany porozrzucane po różnych poziomach
      b.insertAll(testPlans, [
        // --- Projekt 1 ---
        TestPlansCompanion.insert(
          id: 'plan_mobile_auth',
          name: 'Testy autoryzacji',
          description: const Value('Testy logowania i rejestracji użytkownika'),
          moduleId: 'mobile_auth',
          ownerUserId: const Value('user_2'),
          lastModifiedUtc: Value(now),
        ),
        TestPlansCompanion.insert(
          id: 'plan_nested_lvl6',
          name: 'Testy najgłębszego poziomu',
          description: const Value('Testy dla poziomu 6'),
          moduleId: 'nested_lvl6',
          ownerUserId: const Value('user_1'),
          lastModifiedUtc: Value(now),
        ),
        TestPlansCompanion.insert(
          id: 'plan_mobile_ui',
          name: 'Testy UI',
          description: const Value('Widget testy ekranów Flutter'),
          moduleId: 'mobile_ui',
          ownerUserId: const Value('user_3'),
          lastModifiedUtc: Value(now),
        ),

        // --- Projekt 2 ---
        TestPlansCompanion.insert(
          id: 'plan_api_orders',
          name: 'Testy API zamówień',
          description: const Value('Walidacja endpointów zamówień'),
          moduleId: 'api_orders',
          ownerUserId: const Value('user_2'),
          lastModifiedUtc: Value(now),
        ),
        TestPlansCompanion.insert(
          id: 'plan_api_payments_stripe',
          name: 'Testy integracji Stripe',
          description: const Value('Testy webhooków i edge-case’ów płatności'),
          moduleId: 'api_payments_stripe',
          ownerUserId: const Value('user_3'),
          lastModifiedUtc: Value(now),
        ),

        // --- Projekt 3 ---
        TestPlansCompanion.insert(
          id: 'plan_admin_logs',
          name: 'Testy logów',
          description: const Value('Testy widoku logów i filtrowania'),
          moduleId: 'admin_logs',
          ownerUserId: const Value('user_1'),
          lastModifiedUtc: Value(now),
        ),
        TestPlansCompanion.insert(
          id: 'plan_admin_dashboard',
          name: 'Testy dashboardu',
          description: const Value('Sprawdzenie kafelków i widżetów'),
          moduleId: 'admin_dashboard',
          ownerUserId: const Value('user_2'),
          lastModifiedUtc: Value(now),
        ),
      ]);

      // 📄 Przypadki testowe + 💬 komentarze
      final List<TestCasesCompanion> allCases = [];
      final List<CommentsCompanion> allComments = [];

      final allPlans = [
        'plan_mobile_auth',
        'plan_nested_lvl6',
        'plan_mobile_ui',
        'plan_api_orders',
        'plan_api_payments_stripe',
        'plan_admin_dashboard',
        'plan_admin_logs',
      ];

      for (final planId in allPlans) {
        for (var caseIndex = 1; caseIndex <= 5; caseIndex++) {
          final caseId = 'case_${planId}_$caseIndex';
          allCases.add(TestCasesCompanion.insert(
            id: caseId,
            planId: planId,
            title: 'TC $caseIndex - ${planId.replaceAll("_", " ")
                .toUpperCase()}',
            status: caseIndex.isEven ? 'Passed' : 'NotRun',
            assignedToUserId: const Value('user_1'),
            expectedResult: Value('Oczekiwany wynik testu $caseIndex'),
            lastModifiedUtc: Value(now),
          ));

          for (var commentIndex = 1;
          commentIndex <= (caseIndex % 3) + 1;
          commentIndex++) {
            allComments.add(CommentsCompanion.insert(
              id: 'comment_${caseId}_$commentIndex',
              testCaseId: caseId,
              content: 'Komentarz $commentIndex do $caseId',
              createdByUserId: const Value('user_2'),
              createdAtUtc: Value(now),
            ));
          }
        }
      }

      b.insertAll(testCases, allCases);
      b.insertAll(comments, allComments);
    });

    print(
        '✅ Seed zakończony — 3 projekty, głęboko zagnieżdżone moduły, plany i testy utworzone');
  }
}
  LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'test_plan_manager.sqlite'));
    return NativeDatabase(file);
  });
}
