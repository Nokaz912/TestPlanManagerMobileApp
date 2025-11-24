import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_case_dto.dart';

abstract class TestCasesRemoteDataSource {
  Future<List<TestCaseDto>> fetchTestCasesForPlan(String planId);
}
