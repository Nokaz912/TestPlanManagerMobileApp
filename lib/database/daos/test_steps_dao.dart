import 'package:drift/drift.dart';
import '../drift_database/data.dart';

part 'test_steps_dao.g.dart';

@DriftAccessor(tables: [TestSteps])
class TestStepsDao extends DatabaseAccessor<AppDatabase>
    with _$TestStepsDaoMixin {
  final AppDatabase db;

  TestStepsDao(this.db) : super(db);

  Future<List<TestStep>> getStepsForCase(String testCaseId) {
    return (select(db.testSteps)
      ..where((t) => t.testCaseId.equals(testCaseId))
      ..orderBy([(t) => OrderingTerm.asc(t.stepNumber)]))
        .get();
  }

  Future<void> insertStep(TestStepsCompanion step) =>
      into(db.testSteps).insert(step);

  Future<void> upsertStep(TestStepsCompanion step) =>
      into(db.testSteps).insertOnConflictUpdate(step);

  Future<void> updateStep(TestStepsCompanion step) =>
      update(db.testSteps).replace(step);

  Future<void> updateStepStatus(String stepId, String newStatus) {
    return (update(db.testSteps)..where((t) => t.id.equals(stepId))).write(
      TestStepsCompanion(status: Value(newStatus)),
    );
  }

  Future<void> updateStepOrder(String stepId, int newStepNumber) {
    return (update(db.testSteps)..where((t) => t.id.equals(stepId))).write(
      TestStepsCompanion(stepNumber: Value(newStepNumber)),
    );
  }

  Future<void> deleteStep(String id) {
    return (delete(db.testSteps)..where((t) => t.id.equals(id))).go();
  }

  Future<void> deleteStepsForCase(String testCaseId) {
    return (delete(db.testSteps)..where((t) => t.testCaseId.equals(testCaseId)))
        .go();
  }
}
