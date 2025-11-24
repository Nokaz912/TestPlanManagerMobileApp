import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/database/drift_database/mappers/project_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/datasources/projects/local/projects_local_datasource.dart';
import '../../../../database/datasources/projects/remote/projects_remote_datasource.dart';
import '../../../../database/drift_database/data.dart';
import '../../domain/entities/project.dart';
import '../../domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectLocalDataSource local;
  final ProjectsRemoteDataSource remote;

  ProjectRepositoryImpl({
    required this.local,
    required this.remote,
  });

  @override
  Stream<Either<Failure, List<ProjectEntity>>> getAllProjects() async* {
    final localResult = await local.getAllProjects();

    if (localResult.isRight()) {
      yield Right(
        localResult
            .getOrElse(() => [])
            .map((p) => p.toEntity())
            .toList(),
      );
    }

    try {
      final remoteDtos = await remote.fetchProjects();

      for (final dto in remoteDtos) {
        await local.upsertProject(dto.toDbModel());
      }

      final refreshed = await local.getAllProjects();
      yield refreshed.map(
            (projects) => projects.map((p) => p.toEntity()).toList(),
      );
    } catch (e) {
      yield Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createProject(ProjectEntity project) {
    return local.createProject(project.toDbModel());
  }

  @override
  Future<Either<Failure, void>> updateProject(ProjectEntity project) {
    return local.updateProject(project.toDbModel());
  }

  @override
  Future<Either<Failure, void>> deleteProject(String id) {
    return local.deleteProject(id);
  }
}
