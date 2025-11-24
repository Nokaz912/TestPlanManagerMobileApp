import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../database/drift_database/data.dart';

abstract class ProjectLocalDataSource {
  Future<Either<Failure, List<Project>>> getAllProjects();

  Future<void> upsertProject(ProjectsCompanion project);

  Future<Either<Failure, void>> createProject(ProjectsCompanion project);

  Future<Either<Failure, void>> updateProject(ProjectsCompanion project);

  Future<Either<Failure, void>> deleteProject(String id);
}
