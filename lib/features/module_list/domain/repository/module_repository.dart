import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/module.dart';
import '../entities/test_plan.dart';

abstract class ModuleRepository {
  Future<Either<Failure, List<ModuleEntity>>> getAllModules();
  Future<Either<Failure, List<ModuleEntity>>> getModulesForProject(String projectId);
  Future<Either<Failure, List<ModuleEntity>>> getSubmodules(String parentModuleId);
  Future<Either<Failure, List<TestPlanEntity>>> getPlansForModule(String moduleId);
  // Future<Either<Failure, void>> addModule(ModuleEntity module);
  // Future<Either<Failure, void>> deleteModule(String id);
}
