import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../database/drift_database/data.dart';

abstract class ModuleLocalDataSource {
  Future<Either<Failure, List<Module>>> getAllModules();
  Future<Either<Failure, List<Module>>> getModulesForProject(String projectId);
  Future<Either<Failure, List<Module>>> getSubmodules(String moduleId);
  Future<Either<Failure, List<TestPlan>>> getPlansForModule(String moduleId);

  Future<void> upsertModule(ModulesCompanion module);
  Future<Either<Failure, void>> createModule(ModulesCompanion module);
  Future<Either<Failure, void>> updateModule(ModulesCompanion module);
  Future<Either<Failure, void>> deleteModule(String id);

  Future<void> upsertTestPlan(TestPlansCompanion plan);
  Future<Either<Failure, void>> createTestPlan(TestPlansCompanion plan);
  Future<Either<Failure, void>> updateTestPlan(TestPlansCompanion plan);
  Future<Either<Failure, void>> deleteTestPlan(String id);
}
