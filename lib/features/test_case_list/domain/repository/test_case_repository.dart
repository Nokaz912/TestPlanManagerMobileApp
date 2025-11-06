import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/test_step.dart';

abstract class TestStepRepository {
  Future<Either<Failure, List<TestStepEntity>>> getTestStepsForCase(String testCaseId);
}
