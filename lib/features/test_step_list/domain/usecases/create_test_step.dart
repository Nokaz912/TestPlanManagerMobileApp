import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/test_step.dart';
import '../repository/test_step_repository.dart';

class CreateTestStep implements UseCase<void, TestStepEntity> {
  final TestStepRepository repository;

  CreateTestStep(this.repository);

  @override
  Future<Either<Failure, void>> call(TestStepEntity step) {
    return repository.createTestStep(step);
  }
}
