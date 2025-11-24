import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/test_step.dart';
import '../repository/test_step_repository.dart';

/// Używany do aktualizacji kolejności (numeracji) kroków testowych.
/// Wykorzystywany po przeciągnięciu lub usunięciu kroku.
class UpdateTestStepOrder {
  final TestStepRepository repository;

  UpdateTestStepOrder(this.repository);

  Future<Either<Failure, void>> call(List<TestStepEntity> steps) {
    return repository.updateTestStepOrder(steps);
  }
}
