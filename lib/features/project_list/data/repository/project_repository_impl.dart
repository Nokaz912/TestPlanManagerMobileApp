import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/project_list/data/models/dtos/project_dto.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/project.dart';
import '../../../../database/daos/project_dao.dart';
import '../../domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDao dao;

  ProjectRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<ProjectEntity>>> getAllProjects() async {
    try {
      final result = await dao.getAllProjects();
      final entities = result.map((p) => p.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure('Błąd pobierania test case\'ów: $e'));
    }
  }

  // @override
  // Future<Either<Failure, void>> addProject(ProjectEntity project) async {
  //   try {
  //     final companion = ProjectsCompanion(
  //       id: Value(project.id),
  //       name: Value(project.name),
  //       description: Value(project.description),
  //       createdAtUtc: Value(project.createdAtUtc),
  //     );
  //     await dao.insertProject(companion);
  //     return const Right(null);
  //   } catch (e) {
  //     return Left(DatabaseFailure(message: e.toString()));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, void>> deleteProject(String id) async {
  //   try {
  //     await dao.deleteProject(id);
  //     return const Right(null);
  //   } catch (e) {
  //     return Left(DatabaseFailure(message: e.toString()));
  //   }
  // }
}
