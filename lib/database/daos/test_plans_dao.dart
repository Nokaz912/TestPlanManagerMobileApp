import 'package:drift/drift.dart';
import '../data.dart';

part 'test_plans_dao.g.dart';

@DriftAccessor(tables: [TestPlans, Users])
class TestPlansDao extends DatabaseAccessor<AppDatabase> with _$TestPlansDaoMixin {
  final AppDatabase db;

  TestPlansDao(this.db) : super(db);

  // Zwraca wszystkie plany
  Future<List<TestPlan>> getAll() => select(db.testPlans).get();

  // Stream do obserwacji zmian
  Stream<List<TestPlan>> watchAll() => select(db.testPlans).watch();

  // Wstawianie nowego planu
  Future<void> insertPlan(TestPlansCompanion plan) => into(db.testPlans).insert(plan);
}
