import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/module.dart';
import '../entities/test_plan.dart';

abstract class ModuleRepository {
  Stream<Either<Failure, List<ModuleEntity>>> getModulesForProject(String projectId);

  Future<Either<Failure, List<ModuleEntity>>> getSubmodules(String moduleId);
  Future<Either<Failure, List<TestPlanEntity>>> getPlansForModule(String moduleId);

  Future<Either<Failure, void>> createModule(ModuleEntity module);
  Future<Either<Failure, void>> updateModule(ModuleEntity module);
  Future<Either<Failure, void>> deleteModule(String id);

  Future<Either<Failure, void>> createTestPlan(TestPlanEntity plan);
  Future<Either<Failure, void>> updateTestPlan(TestPlanEntity plan);
  Future<Either<Failure, void>> deleteTestPlan(String id);
}
