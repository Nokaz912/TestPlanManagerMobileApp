import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/module_dto.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/test_plan_dto.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/daos/module_dao.dart';
import '../../../../database/daos/test_plans_dao.dart';
import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';
import '../../domain/repository/module_repository.dart';

class ModuleRepositoryImpl implements ModuleRepository {
  final ModuleDao moduleDao;
  final TestPlansDao testPlansDao;

  ModuleRepositoryImpl(this.moduleDao, this.testPlansDao);

  @override
  Future<Either<Failure, List<ModuleEntity>>> getAllModules() async {
    try {
      final result = await moduleDao.getAllModules();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure('Failed to load all modules: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ModuleEntity>>> getModulesForProject(String projectId) async {
    try {
      final result = await moduleDao.getModulesForProject(projectId);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure('Failed to load project modules: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ModuleEntity>>> getSubmodules(String moduleId) async {
    try {
      final result = await moduleDao.getSubmodules(moduleId);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure('Failed to load submodules: $e'));
    }
  }

  @override
  Future<Either<Failure, List<TestPlanEntity>>> getPlansForModule(String moduleId) async {
    try {
      final result = await testPlansDao.getPlansByModuleId(moduleId);
      return Right(result.map((p) => p.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure('Failed to load test plans: $e'));
    }
  }
}
