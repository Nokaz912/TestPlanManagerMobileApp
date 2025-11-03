import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/core/usecases/usecase.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/repositories/test_plan_repository.dart';

import '../entities/test_case.dart';
import '../../../test_case_list/domain/repository/test_case_repository.dart';

class GetTestCasesForPlan extends UseCase<List<TestCaseEntity>, PlanIdParams> {
  final TestPlanRepository repository;

  GetTestCasesForPlan(this.repository);

  @override
  Future<Either<Failure, List<TestCaseEntity>>> call(PlanIdParams params) {
    return repository.getCasesForPlan(params.planId);
  }
}

class PlanIdParams {
  final String planId;

  PlanIdParams(this.planId);
}
