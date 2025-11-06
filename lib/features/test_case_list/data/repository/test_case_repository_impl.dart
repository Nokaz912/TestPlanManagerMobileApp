import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/daos/test_steps_dao.dart';
import '../../domain/entities/test_step.dart';
import '../../domain/repository/test_case_repository.dart';


class TestStepRepositoryImpl implements TestStepRepository {
  final TestStepsDao dao;

  TestStepRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<TestStepEntity>>> getTestStepsForCase(String testCaseId) async {
    try {
      final rows = await dao.getStepsForCase(testCaseId);
      final steps = rows
          .map((s) => TestStepEntity(
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
}
