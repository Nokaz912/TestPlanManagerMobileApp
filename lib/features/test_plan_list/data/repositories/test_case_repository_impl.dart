import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/datasources/testcase/local/testcase_local_datasource.dart';
import '../../../../database/datasources/testcase/remote/testcase_remote_datasource.dart';
import '../../../../database/drift_database/mappers/testcase_mapper.dart';
import '../../domain/entities/test_case.dart';
import '../../domain/repositories/test_case_repository.dart';

class TestCaseRepositoryImpl implements TestCaseRepository {
  final TestCaseLocalDataSource local;
  final TestCasesRemoteDataSource remote;

  TestCaseRepositoryImpl({
    required this.local,
    required this.remote,
  });

  @override
  Future<Either<Failure, List<TestCaseEntity>>> getCasesForPlan(String planId) async {
    final rowsResult = await local.getCasesForPlan(planId);

    return rowsResult.fold(
          (failure) => Left(failure),
          (rows) => Right(rows.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<Failure, void>> createTestCase(TestCaseEntity testCase) async {
    try {
      await local.upsertTestCase(testCase.toDbModel());
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Błąd createTestCase: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestCase(TestCaseEntity testCase) async {
    try {
      await local.upsertTestCase(testCase.toDbModel());
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Błąd updateTestCase: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestCase(String id) async {
    try {
      await local.deleteTestCase(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Błąd deleteTestCase: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateStepsAndStatus(
      String id,
      int totalSteps,
      int passedSteps,
      String status,
      ) async {
    try {
      await local.updateStepsAndStatus(id, totalSteps, passedSteps, status);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Błąd updateStepsAndStatus: $e"));
    }
  }
}
