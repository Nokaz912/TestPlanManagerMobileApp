import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import 'package:test_plan_manager_app/database/datasources/projects/local/projects_local_datasource.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../database/daos/project_dao.dart';
import '../../../../../database/drift_database/data.dart';

class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
  final ProjectDao dao;

  ProjectLocalDataSourceImpl(this.dao);

  @override
  Future<Either<Failure, List<Project>>> getAllProjects() async {
    try {
      final data = await dao.getAllProjects();
      return Right(data);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<void> upsertProject(ProjectsCompanion project) async {
    await dao.upsertProject(project);
  }

  @override
  Future<Either<Failure, void>> createProject(ProjectsCompanion project) async {
    try {
      await dao.insertProject(project);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProject(ProjectsCompanion project) async {
    try {
      await dao.updateProject(project);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject(String id) async {
    try {
      await dao.deleteProject(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
