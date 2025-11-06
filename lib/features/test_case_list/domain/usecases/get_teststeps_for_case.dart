import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/test_step.dart';
import '../repository/test_case_repository.dart';

class GetTestStepsForCase {
  final TestStepRepository repository;
  GetTestStepsForCase(this.repository);

  Future<Either<Failure, List<TestStepEntity>>> call(String testCaseId) {
    return repository.getTestStepsForCase(testCaseId);
  }
}
