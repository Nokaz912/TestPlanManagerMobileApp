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
        localResult
            .getOrElse(() => [])
            .map((m) => m.toEntity())
            .toList(),
      );
    }

    try {
      final remoteDtos = await remote.fetchModulesForProject(projectId);

      for (final dto in remoteDtos) {
        await local.upsertModule(dto.toDbModel());
      }

      final refreshed = await local.getModulesForProject(projectId);
      yield refreshed.map(
            (modules) => modules.map((m) => m.toEntity()).toList(),
      );
    } catch (e) {
      yield Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ModuleEntity>>> getSubmodules(String moduleId) async {
    final result = await local.getSubmodules(moduleId);
    return result.map((rows) => rows.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<TestPlanEntity>>> getPlansForModule(String moduleId) async {
    final result = await local.getPlansForModule(moduleId);
    return result.map((rows) => rows.map((p) => p.toEntity()).toList());
  }

  @override
  Future<Either<Failure, void>> createModule(ModuleEntity module) {
    return local.createModule(module.toDbModel());
  }

  @override
  Future<Either<Failure, void>> updateModule(ModuleEntity module) {
    return local.updateModule(module.toDbModel());
  }

  @override
  Future<Either<Failure, void>> deleteModule(String id) {
    return local.deleteModule(id);
  }

  @override
  Future<Either<Failure, void>> createTestPlan(TestPlanEntity plan) {
    return local.createTestPlan(plan.toDbModel());
  }

  @override
  Future<Either<Failure, void>> updateTestPlan(TestPlanEntity plan) {
    return local.updateTestPlan(plan.toDbModel());
  }

  @override
  Future<Either<Failure, void>> deleteTestPlan(String id) {
    return local.deleteTestPlan(id);
  }
}
