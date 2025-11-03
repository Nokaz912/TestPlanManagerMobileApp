import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/core/usecases/usecase.dart';
import '../entities/test_plan.dart';
import '../repositories/test_plan_repository.dart';

class ModuleIdParams {
  final String moduleId;

  ModuleIdParams(this.moduleId);
}

class GetTestPlansForModule extends UseCase<List<TestPlanEntity>, ModuleIdParams> {
  final TestPlanRepository repository;

  GetTestPlansForModule(this.repository);

  @override
  Future<Either<Failure, List<TestPlanEntity>>> call(ModuleIdParams params) {
    return repository.getPlansForModule(params.moduleId);
  }
}
