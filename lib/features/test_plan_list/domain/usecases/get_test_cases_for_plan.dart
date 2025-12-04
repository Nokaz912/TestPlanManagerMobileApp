import 'package:test_plan_manager_app/core/usecases/streamusecase.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/entities/test_case.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/repositories/test_case_repository.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/services/testcase_service.dart';

class GetTestCasesForPlan extends StreamUseCase<List<TestCaseEntity>, PlanIdParams> {
  final TestCaseRepository testCaseRepo;
  final TestCaseService domainService;

  GetTestCasesForPlan(this.testCaseRepo, this.domainService);

  @override
  Stream<List<TestCaseEntity>> call(PlanIdParams params) {
    return testCaseRepo.getCasesForPlan(params.planId).asyncMap((either) async {
      final cases = either.getOrElse(() => []);
      return Future.wait(cases.map(domainService.enrich));
    });
  }
}

class PlanIdParams {
  final String planId;
  PlanIdParams(this.planId);
}
