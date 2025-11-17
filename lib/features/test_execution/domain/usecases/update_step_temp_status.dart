import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/core/usecases/usecase.dart';
import 'package:test_plan_manager_app/features/test_execution/domain/repositories/test_execution_repository.dart';

import '../entities/project_structure.dart';

class UpdateStepTempStatus extends UseCase<void, StepStatusPathEntity> {
  final TestExecutionRepository repository;

  UpdateStepTempStatus(this.repository);

  @override
  Future<Either<Failure, void>> call(StepStatusPathEntity params) {
    return repository.updateStepTempStatus(params);
  }
}
