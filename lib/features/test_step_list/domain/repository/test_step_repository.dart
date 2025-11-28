import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/test_step.dart';

abstract class TestStepRepository {
  Stream<Either<Failure, List<TestStepEntity>>> getStepsForCase(String caseId);

  Future<Either<Failure, TestStepEntity>> createTestStep(TestStepEntity step);

  Future<Either<Failure, TestStepEntity>> updateTestStep(TestStepEntity step);

  Future<Either<Failure, void>> deleteTestStep(String id);

  Future<Either<Failure, void>> updateTestStepOrder(List<TestStepEntity> steps);
}
