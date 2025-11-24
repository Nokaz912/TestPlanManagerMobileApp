import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/error/failures.dart';
import '../../../../database/daos/test_steps_dao.dart';
import '../../../../database/drift_database/data.dart';
import '../../domain/entities/test_step.dart';
import '../../domain/repository/test_step_repository.dart';

class TestStepRepositoryImpl implements TestStepRepository {
  final TestStepsDao dao;

  TestStepRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<TestStepEntity>>> getTestStepsForCase(
      String testCaseId) async {
    try {
      final rows = await dao.getStepsForCase(testCaseId);
      final steps = rows
          .map((s) =>
          TestStepEntity(
            id: s.id,
            testCaseId: s.testCaseId,
            stepNumber: s.stepNumber,
            description: s.description,
            expected: s.expected,
            status: s.status,
          ))
          .toList();
      return Right(steps);
    } catch (e) {
      return Left(DatabaseFailure('Nie udało się pobrać kroków testu: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> createTestStep(TestStepEntity step) async {
    try {
      await dao.insertStep(
        TestStepsCompanion(
          id: drift.Value(step.id),
          testCaseId: drift.Value(step.testCaseId),
          stepNumber: drift.Value(step.stepNumber),
          description: drift.Value(step.description),
          expected: step.expected != null
              ? drift.Value(step.expected!)
              : const drift.Value(null),
          status: drift.Value(step.status),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Nie udało się dodać kroku: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestStep(TestStepEntity step) async {
    try {
      await dao.updateStep(
        TestStepsCompanion(
          id: drift.Value(step.id),
          testCaseId: drift.Value(step.testCaseId),
          stepNumber: drift.Value(step.stepNumber),
          description: drift.Value(step.description),
          expected: step.expected != null
              ? drift.Value(step.expected!)
              : const drift.Value(null),
          status: drift.Value(step.status),
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Nie udało się zaktualizować kroku: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestStep(String id) async {
    try {
      await dao.deleteStep(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Nie udało się usunąć kroku: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestStepOrder(
      List<TestStepEntity> steps) async {
    try {
      for (final s in steps) {
        await dao.updateStepOrder(s.id, s.stepNumber);
      }
      return const Right(null);
    } catch (e) {
      return Left(
          DatabaseFailure('Nie udało się zaktualizować kolejności kroków: $e'));
    }
  }
}
