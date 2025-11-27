import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_case_dto.dart';

abstract class TestCasesRemoteDataSource {
  Future<List<TestCaseDto>> fetchTestCasesForPlan(String planId);
  Future<TestCaseDto> createTestCase(TestCaseDto dto);
  Future<TestCaseDto> updateTestCase(TestCaseDto dto);
  Future<void> deleteTestCase(String id);
}
