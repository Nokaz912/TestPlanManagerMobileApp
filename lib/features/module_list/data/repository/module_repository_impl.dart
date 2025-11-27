import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/database/drift_database/mappers/testplan_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/datasources/module/local/modules_local_datasource.dart';
import '../../../../database/datasources/module/remote/modules_remote_datasource.dart';
import '../../../../database/drift_database/mappers/module_mapper.dart';
import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';
import '../../domain/repository/module_repository.dart';

class ModuleRepositoryImpl implements ModuleRepository {
  final ModuleLocalDataSource local;
  final ModuleRemoteDataSource remote;

  ModuleRepositoryImpl({
    required this.local,
    required this.remote,
  });

  @override
  Stream<Either<Failure, List<ModuleEntity>>> getModulesForProject(String projectId) async* {
    final localResult = await local.getModulesForProject(projectId);

    if (localResult.isRight()) {
      yield Right(
        localResult.getOrElse(() => []).map((m) => m.toEntity()).toList(),
      );
    }

    try {
      final remoteDtos = await remote.fetchModulesForProject(projectId);

      for (final dto in remoteDtos) {
        await local.upsertModule(dto.toDbModel());
      }

      final refreshed = await local.getModulesForProject(projectId);
      yield refreshed.map((modules) => modules.map((m) => m.toEntity()).toList());
    } catch (_) {
      yield Left(DatabaseFailure("Nie udało się pobrać modułów z serwera."));
    }
  }

  @override
  Future<Either<Failure, List<ModuleEntity>>> getSubmodules(String moduleId) async {
    final result = await local.getSubmodules(moduleId);
    return result.map((rows) => rows.map((m) => m.toEntity()).toList());
  }

  @override
  Stream<Either<Failure, List<TestPlanEntity>>> getPlansForModule(String moduleId) async* {
    final localRows = await local.getPlansForModule(moduleId);

    if (localRows.isRight()) {
      yield Right(
        localRows.getOrElse(() => []).map((p) => p.toEntity()).toList(),
      );
    }

    try {
      final remoteDtos = await remote.fetchTestPlansForModule(moduleId);

      for (final dto in remoteDtos) {
        await local.upsertTestPlan(dto.toDbModel());
      }

      final refreshed = await local.getPlansForModule(moduleId);
      yield refreshed.map((list) => list.map((p) => p.toEntity()).toList());
    } catch (e) {
      yield Left(DatabaseFailure("Nie udało się pobrać planów testowych."));
    }
  }

  @override
  Future<Either<Failure, ModuleEntity>> createModule(ModuleEntity module) async {
    try {
      final dto = module.toDto();
      final createdDto = await remote.createModule(dto);
      await local.upsertModule(createdDto.toDbModel());
      return Right(createdDto.toEntity());
    } catch (_) {
      return Left(DatabaseFailure("Nie udało się utworzyć modułu."));
    }
  }

  @override
  Future<Either<Failure, ModuleEntity>> updateModule(ModuleEntity module) async {
    try {
      final dto = module.toDto();
      final updatedDto = await remote.updateModule(dto);
      await local.upsertModule(updatedDto.toDbModel());
      return Right(updatedDto.toEntity());
    } catch (e, s) {
      return Left(DatabaseFailure("Nie udało się zaktualizować modułu."));
    }
  }

  @override
  Future<Either<Failure, void>> deleteModule(String id) async {
    try {
      await remote.deleteModule(id);
      await local.deleteModule(id);
      return const Right(null);
    } catch (_) {
      return Left(DatabaseFailure("Nie udało się usunąć modułu."));
    }
  }

  @override
  Future<Either<Failure, TestPlanEntity>> createTestPlan(TestPlanEntity plan) async {
    try {
      final dto = plan.toDto();
      final createdDto = await remote.createTestPlan(dto);
      await local.upsertTestPlan(createdDto.toDbModel());
      return Right(createdDto.toEntity());
    } catch (_) {
      return Left(DatabaseFailure("Nie udało się utworzyć planu testów."));
    }
  }

  @override
  Future<Either<Failure, TestPlanEntity>> updateTestPlan(TestPlanEntity plan) async {
    try {
      final dto = plan.toDto();
      final updatedDto = await remote.updateTestPlan(dto);
      final entity = updatedDto.toEntity();

      try {
        await local.upsertTestPlan(updatedDto.toDbModel());
      } catch (e, s) {
      }
      return Right(entity);
    } catch (e, s) {
      return Left(DatabaseFailure("Nie udało się zaktualizować planu testów."));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestPlan(String id) async {
    try {
      await remote.deleteTestPlan(id);
      await local.deleteTestPlan(id);
      return const Right(null);
    } catch (_) {
      return Left(DatabaseFailure("Nie udało się usunąć planu testów."));
    }
  }
}
