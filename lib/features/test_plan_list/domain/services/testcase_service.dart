import 'package:test_plan_manager_app/features/test_plan_list/domain/entities/test_case.dart';
import 'package:test_plan_manager_app/features/test_step_list/domain/entities/test_step.dart';
import 'package:test_plan_manager_app/features/test_step_list/domain/repository/test_step_repository.dart';

class TestCaseService {
  final TestStepRepository stepRepo;

  TestCaseService(this.stepRepo);

  Future<TestCaseEntity> enrich(TestCaseEntity c) async {
    final stepsEither = await stepRepo.getStepsForCaseOnce(c.id);

    if (stepsEither.isLeft()) {
      return TestCaseEntity(
        id: c.id,
        planId: c.planId,
        title: c.title,
        expectedResult: c.expectedResult,
        assignedToUserId: c.assignedToUserId,
        lastModifiedUtc: c.lastModifiedUtc,
        parentCaseId: c.parentCaseId,
        status: "NotRun",
        totalSteps: 0,
        passedSteps: 0,
      );
    }

    final steps = stepsEither.getOrElse(() => []);
    final total = steps.length;
    final passed = steps.where((s) => s.status == "Passed").length;

    final status = _calculateStatus(steps, total, passed);

    return TestCaseEntity(
      id: c.id,
      planId: c.planId,
      title: c.title,
      expectedResult: c.expectedResult,
      assignedToUserId: c.assignedToUserId,
      lastModifiedUtc: c.lastModifiedUtc,
      parentCaseId: c.parentCaseId,
      status: status,
      totalSteps: total,
      passedSteps: passed,
    );
  }

  String _calculateStatus(List<TestStepEntity> steps, int total, int passed) {
    if (total == 0) return "NotRun";
    if (passed == total) return "Passed";
    if (steps.any((s) => s.status == "Failed")) return "Failed";
    return "Pending";
  }
}
