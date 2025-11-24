import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/core/usecases/usecase.dart';
import 'package:test_plan_manager_app/features/module_list/domain/repository/module_repository.dart';
import '../entities/test_plan.dart';
import '../../../test_plan_list/domain/repositories/test_case_repository.dart';

class ModuleIdParams {
  final String moduleId;

  ModuleIdParams(this.moduleId);
}

class GetTestPlansForModule extends UseCase<List<TestPlanEntity>, ModuleIdParams> {
  final ModuleRepository repository;

  GetTestPlansForModule(this.repository);

  @override
  Future<Either<Failure, List<TestPlanEntity>>> call(ModuleIdParams params) {
    return repository.getPlansForModule(params.moduleId);
  }
}
