import 'package:drift/drift.dart' as drift;

import '../../../features/test_step_list/data/models/dtos/test_step_dto.dart';
import '../../../features/test_step_list/domain/entities/test_step.dart';
import '../data.dart';

extension TestStepDataMapper on TestStep {
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

extension TestStepDtoEntityMapper on TestStepDto {
  TestStepEntity toEntity() {
    return TestStepEntity(
      id: id ?? '',
      testCaseId: testCaseId,
      stepNumber: stepNumber,
      description: description,
      expected: expected,
      status: status,
    );
  }
}

extension TestStepEntityDbMapper on TestStepEntity {
  TestStepsCompanion toDbModel() {
    return TestStepsCompanion(
      id: drift.Value(id),
      testCaseId: drift.Value(testCaseId),
      stepNumber: drift.Value(stepNumber),
      description: drift.Value(description),
      expected: expected != null
          ? drift.Value(expected!)
          : const drift.Value.absent(),
      status: drift.Value(status),
    );
  }
}

extension TestStepDtoDbMapper on TestStepDto {
  TestStepsCompanion toDbModel() {
    return TestStepsCompanion(
      id: drift.Value(id ?? ''),
      testCaseId: drift.Value(testCaseId),
      stepNumber: drift.Value(stepNumber),
      description: drift.Value(description),
      expected: expected != null
          ? drift.Value(expected!)
          : const drift.Value.absent(),
      status: drift.Value(status),
    );
  }
}

extension TestStepEntityDtoMapper on TestStepEntity {
  TestStepDto toDto() {
    return TestStepDto(
      id: id,
      testCaseId: testCaseId,
      stepNumber: stepNumber,
      description: description,
      expected: expected,
      status: status,
    );
  }
}
