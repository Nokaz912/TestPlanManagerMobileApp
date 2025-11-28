import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/datasources/teststep/local/teststep_local_datasource.dart';
import '../../../../database/datasources/teststep/remote/teststep_remote_datasource.dart';
import '../../../../database/drift_database/mappers/teststep_mapper.dart';
import '../../domain/entities/test_step.dart';
import '../../domain/repository/test_step_repository.dart';

class TestStepRepositoryImpl implements TestStepRepository {
  final TestStepLocalDataSource local;
  final TestStepRemoteDataSource remote;

  TestStepRepositoryImpl({
    required this.local,
    required this.remote,
  });

  @override
  Stream<Either<Failure, List<TestStepEntity>>> getStepsForCase(String caseId) async* {
    final localResult = await local.getTestStepsForCase(caseId);

    if (localResult.isRight()) {
      yield Right(
        localResult.getOrElse(() => [])
            .map((row) => row.toEntity())
            .toList(),
      );
    }

    try {
      final remoteDtos = await remote.fetchStepsForCase(caseId);
      for (final dto in remoteDtos) {
        await local.upsertTestStep(dto.toDbModel());
      }
      final refreshed = await local.getTestStepsForCase(caseId);
      yield refreshed.map((rows) => rows.map((e) => e.toEntity()).toList());
    } catch (_) {
      yield Left(DatabaseFailure("Nie udało się pobrać kroków test case'a z serwera."));
    }
  }

  @override
  Future<Either<Failure, TestStepEntity>> createTestStep(TestStepEntity step) async {
    try {
      final dto = step.toDto();
      final created = await remote.createStep(dto);
      await local.upsertTestStep(created.toDbModel());
      return Right(created.toEntity());
    } catch (_) {
      return Left(DatabaseFailure("Nie udało się utworzyć kroku."));
    }
  }

  @override
  Future<Either<Failure, TestStepEntity>> updateTestStep(TestStepEntity step) async {
    try {
      final dto = step.toDto();
      final updated = await remote.updateStep(dto);
      await local.upsertTestStep(updated.toDbModel());
      return Right(updated.toEntity());
    } catch (_) {
      return Left(DatabaseFailure("Nie udało się zaktualizować kroku."));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestStep(String id) async {
    try {
      await remote.deleteStep(id);
      await local.deleteTestStep(id);
      return const Right(null);
    } catch (_) {
      return Left(DatabaseFailure("Nie udało się usunąć kroku."));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestStepOrder(List<TestStepEntity> steps) async {
    try {
      for (final s in steps) {
        final dto = s.toDto();
        await remote.updateStep(dto);
      }

      await local.updateTestStepOrder(
        steps.map((e) => e.toDbModel()).toList(),
      );

      return const Right(null);
    } catch (_) {
      return Left(DatabaseFailure("Nie udało się zmienić kolejności kroków."));
    }
  }
}
