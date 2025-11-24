import 'package:drift/drift.dart';
import '../drift_database/data.dart';

part 'test_cases_dao.g.dart';

@DriftAccessor(tables: [TestCases])
class TestCasesDao extends DatabaseAccessor<AppDatabase> with _$TestCasesDaoMixin {
  final AppDatabase db;

  TestCasesDao(this.db) : super(db);

  Future<List<TestCase>> getCasesForPlan(String planId) {
    return (select(db.testCases)
      ..where((tbl) => tbl.planId.equals(planId)))
        .get();
  }

  Future<void> insertTestCase(TestCasesCompanion data) =>
      into(db.testCases).insert(data);

  Future<void> updateTestCase(TestCasesCompanion data) =>
      into(db.testCases).insertOnConflictUpdate(data);

  Future<void> upsertTestCase(TestCasesCompanion data) =>
      into(db.testCases).insertOnConflictUpdate(data);

  Future<void> deleteTestCase(String id) =>
      (delete(db.testCases)..where((tbl) => tbl.id.equals(id))).go();

  Future<TestCase?> getCaseById(String id) =>
      (select(db.testCases)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<void> updateStepsAndStatus(
      String id,
      int total,
      int passed,
      String status,
      ) async {
    await (update(db.testCases)..where((t) => t.id.equals(id))).write(
      TestCasesCompanion(
        totalSteps: Value(total),
        passedSteps: Value(passed),
        status: Value(status),
        lastModifiedUtc: Value(DateTime.now().toUtc()),
      ),
    );
  }
}
