import 'package:drift/drift.dart';
import '../drift_database/data.dart';

part 'test_plans_dao.g.dart';

@DriftAccessor(tables: [TestPlans, Users])
class TestPlansDao extends DatabaseAccessor<AppDatabase> with _$TestPlansDaoMixin {
  final AppDatabase db;

  TestPlansDao(this.db) : super(db);

  Future<List<TestPlan>> getAll() => select(db.testPlans).get();

  Stream<List<TestPlan>> watchAll() => select(db.testPlans).watch();

  Future<void> insertPlan(TestPlansCompanion plan) =>
      into(db.testPlans).insert(plan);

  Future<void> updatePlan(TestPlansCompanion plan) =>
      into(db.testPlans).insertOnConflictUpdate(plan);

  Future<void> upsertPlan(TestPlansCompanion plan) =>
      into(db.testPlans).insertOnConflictUpdate(plan);

  Future<void> deletePlan(String id) =>
      (delete(db.testPlans)..where((tbl) => tbl.id.equals(id))).go();

  Future<List<TestPlan>> getPlansByModuleId(String moduleId) {
    return (select(db.testPlans)
      ..where((tbl) => tbl.moduleId.equals(moduleId)))
        .get();
  }
}
