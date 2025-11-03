import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/project.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getAllProjects();
 // Future<Either<Failure, void>> addProject(ProjectEntity project);
//  Future<Either<Failure, void>> deleteProject(String id);
}
