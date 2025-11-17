import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/core/usecases/usecase.dart';

import '../../../project_list/domain/entities/project.dart';
import '../repositories/test_execution_repository.dart';

class GetAllProjectsForTestsUseCase extends UseCase<List<ProjectEntity>, NoParams> {
  final TestExecutionRepository repository;

  GetAllProjectsForTestsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(NoParams params) {
    return repository.getAllProjectsForTests();
  }
}
