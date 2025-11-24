import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;

import '../../../../../core/error/failures.dart';
import '../../../../../database/daos/test_cases_dao.dart';
import '../../../../../database/drift_database/data.dart';
import 'testcase_local_datasource.dart';

class TestCaseLocalDataSourceImpl implements TestCaseLocalDataSource {
  final TestCasesDao dao;

  TestCaseLocalDataSourceImpl(this.dao);

  @override
  Future<Either<Failure, List<TestCase>>> getCasesForPlan(String planId) async {
    try {
      final result = await dao.getCasesForPlan(planId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure("Błąd pobierania test case'ów: $e"));
    }
  }

  @override
  Future<void> upsertTestCase(TestCasesCompanion testCase) async {
    await dao.upsertTestCase(testCase);
  }

  @override
  Future<Either<Failure, void>> createTestCase(TestCasesCompanion testCase) async {
    try {
      await dao.insertTestCase(testCase);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Błąd tworzenia test case: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestCase(TestCasesCompanion testCase) async {
    try {
      await dao.updateTestCase(testCase);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Błąd aktualizacji test case: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestCase(String id) async {
    try {
      await dao.deleteTestCase(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Błąd usuwania test case: $e"));
    }
  }
  @override
  Future<Either<Failure, void>> updateStepsAndStatus(
      String id,
      int total,
      int passed,
      String status,
      ) async {
    try {
      await dao.updateStepsAndStatus(id, total, passed, status);
      return const Right(null);
    } catch (e) {
      return Left(
        DatabaseFailure("Błąd updateStepsAndStatus: $e"),
      );
    }
  }
}
