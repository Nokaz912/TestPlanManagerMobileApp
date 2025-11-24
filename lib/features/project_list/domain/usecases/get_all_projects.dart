import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/streamusecase.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/project.dart';
import '../repository/project_repository.dart';

class GetAllProjects extends StreamUseCase<Either<Failure, List<ProjectEntity>>, NoParams> {
  final ProjectRepository repository;

  GetAllProjects(this.repository);

  @override
  Stream<Either<Failure, List<ProjectEntity>>> call(NoParams params) {
    return repository.getAllProjects();
  }
}
