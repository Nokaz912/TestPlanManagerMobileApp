import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/test_step_repository.dart';

class DeleteTestStep implements UseCase<void, String> {
  final TestStepRepository repository;

  DeleteTestStep(this.repository);

  @override
  Future<Either<Failure, void>> call(String id) {
    return repository.deleteTestStep(id);
  }
}
