import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/test_step.dart';
import '../repository/test_step_repository.dart';

class UpdateTestStep implements UseCase<void, TestStepEntity> {
  final TestStepRepository repository;

  UpdateTestStep(this.repository);

  @override
  Future<Either<Failure, void>> call(TestStepEntity step) {
    return repository.updateTestStep(step);
  }
}
