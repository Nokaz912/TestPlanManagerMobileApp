import 'package:drift/drift.dart';
import '../data.dart';

part 'test_cases_dao.g.dart';

@DriftAccessor(tables: [TestCases])
class TestCasesDao extends DatabaseAccessor<AppDatabase> with _$TestCasesDaoMixin {
  final AppDatabase db;

  TestCasesDao(this.db) : super(db);

  Future<List<TestCase>> getAllCases() => select(db.testCases).get();

  Stream<List<TestCase>> watchAllCases() => select(db.testCases).watch();

  Future<List<TestCase>> getCasesForPlan(String planId) {
    return (select(db.testCases)
      ..where((t) => t.planId.equals(planId)))
        .get();
  }

  Future<void> insertCase(TestCasesCompanion testCase) => into(db.testCases).insert(testCase);
}