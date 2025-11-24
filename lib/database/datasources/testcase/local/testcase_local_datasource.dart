import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../database/drift_database/data.dart';

abstract class TestCaseLocalDataSource {
  Future<Either<Failure, List<TestCase>>> getCasesForPlan(String planId);

  Future<void> upsertTestCase(TestCasesCompanion testCase);

  Future<Either<Failure, void>> createTestCase(TestCasesCompanion testCase);

  Future<Either<Failure, void>> updateTestCase(TestCasesCompanion testCase);

  Future<Either<Failure, void>> deleteTestCase(String id);

  Future<Either<Failure, void>> updateStepsAndStatus(
      String id,
      int total,
      int passed,
      String status,
      );
}
