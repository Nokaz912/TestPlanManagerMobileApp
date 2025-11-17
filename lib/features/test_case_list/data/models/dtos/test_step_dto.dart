import '../../../../../database/data.dart';
import '../../../domain/entities/test_step.dart';

extension TestStepMapper on TestStep {
  TestStepEntity toEntity() {
    return TestStepEntity(
      id: id,
      testCaseId: testCaseId,
      stepNumber: stepNumber,
      description: description,
      expected: expected,
      status: status,
    );
  }
}
