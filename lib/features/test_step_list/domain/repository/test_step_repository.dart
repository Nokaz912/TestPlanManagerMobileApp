import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/test_step.dart';

abstract class TestStepRepository {
  Future<Either<Failure, List<TestStepEntity>>> getTestStepsForCase(String testCaseId);
  Future<Either<Failure, void>> createTestStep(TestStepEntity step);
  Future<Either<Failure, void>> updateTestStep(TestStepEntity step);
  Future<Either<Failure, void>> deleteTestStep(String id);
  Future<Either<Failure, void>> updateTestStepOrder(List<TestStepEntity> steps);
}
