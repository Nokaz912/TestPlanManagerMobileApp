import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/test_case.dart';
import '../repositories/test_case_repository.dart';

class UpdateTestCase implements UseCase<void, UpdateTestCaseParams> {
  final TestCaseRepository repository;
  UpdateTestCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateTestCaseParams p) =>
      repository.updateTestCase(p.testCase);
}

class UpdateTestCaseParams {
  final TestCaseEntity testCase;
  UpdateTestCaseParams(this.testCase);
}
