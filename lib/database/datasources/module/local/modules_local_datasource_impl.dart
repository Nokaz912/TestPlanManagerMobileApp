import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../database/daos/module_dao.dart';
import '../../../../../database/daos/test_plans_dao.dart';
import '../../../../../database/drift_database/data.dart';
import 'modules_local_datasource.dart';

class ModuleLocalDataSourceImpl implements ModuleLocalDataSource {
  final ModuleDao moduleDao;
  final TestPlansDao testPlansDao;

  ModuleLocalDataSourceImpl(this.moduleDao, this.testPlansDao);

  @override
  Future<Either<Failure, List<Module>>> getAllModules() async {
    try {
      final result = await moduleDao.getAllModules();
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Module>>> getModulesForProject(String projectId) async {
    try {
      final result = await moduleDao.getModulesForProject(projectId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Module>>> getSubmodules(String moduleId) async {
    try {
      final result = await moduleDao.getSubmodules(moduleId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TestPlan>>> getPlansForModule(String moduleId) async {
    try {
      final result = await testPlansDao.getPlansByModuleId(moduleId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<void> upsertModule(ModulesCompanion module) async {
    await moduleDao.upsertModule(module);
  }

  @override
  Future<Either<Failure, void>> createModule(ModulesCompanion module) async {
    try {
      await moduleDao.insertModule(module);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateModule(ModulesCompanion module) async {
    try {
      await moduleDao.updateModule(module);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteModule(String id) async {
    try {
      await moduleDao.deleteModule(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<void> upsertTestPlan(TestPlansCompanion plan) async {
    await testPlansDao.upsertPlan(plan);
  }

  @override
  Future<Either<Failure, void>> createTestPlan(TestPlansCompanion plan) async {
    try {
      await testPlansDao.insertPlan(plan);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestPlan(TestPlansCompanion plan) async {
    try {
      await testPlansDao.updatePlan(plan);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestPlan(String id) async {
    try {
      await testPlansDao.deletePlan(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
