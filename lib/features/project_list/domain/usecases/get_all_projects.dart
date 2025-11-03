import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/core/usecases/usecase.dart';
import '../entities/project.dart';
import '../repository/project_repository.dart';

class GetAllProjects extends UseCase<List<ProjectEntity>, NoParams> {
  final ProjectRepository repository;

  GetAllProjects(this.repository);

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(NoParams params) {
    return repository.getAllProjects();
  }
}
