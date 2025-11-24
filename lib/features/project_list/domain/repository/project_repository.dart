import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/project.dart';

abstract class ProjectRepository {
  Stream<Either<Failure, List<ProjectEntity>>> getAllProjects();
  Future<Either<Failure, void>> createProject(ProjectEntity project);
  Future<Either<Failure, void>> updateProject(ProjectEntity project);
  Future<Either<Failure, void>> deleteProject(String id);
}
