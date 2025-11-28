import 'package:test_plan_manager_app/features/test_step_list/data/models/dtos/test_step_dto.dart';

abstract class TestStepRemoteDataSource {
  Future<List<TestStepDto>> fetchStepsForCase(String testCaseId);

  Future<TestStepDto> createStep(TestStepDto dto);

  Future<TestStepDto> updateStep(TestStepDto dto);

  Future<void> deleteStep(String id);
}
