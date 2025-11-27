import 'package:drift/drift.dart' as drift;

import '../../../features/test_plan_list/data/models/dtos/test_case_dto.dart';
import '../../../features/test_plan_list/domain/entities/test_case.dart';
import '../data.dart';

extension TestCaseDataMapper on TestCase {
  TestCaseEntity toEntity() {
    return TestCaseEntity(
      id: id,
      planId: planId,
      title: title,
      status: status,
      expectedResult: expectedResult,
      assignedToUserId: assignedToUserId,
      lastModifiedUtc: lastModifiedUtc,
      parentCaseId: parentCaseId,
      totalSteps: totalSteps ?? 0,
      passedSteps: passedSteps ?? 0,
    );
  }
}

extension TestCaseEntityDomainMapper on TestCaseEntity {
  TestCase toDomain() {
    return TestCase(
      id: id,
      planId: planId,
      title: title,
      status: status,
      expectedResult: expectedResult,
      assignedToUserId: assignedToUserId,
      lastModifiedUtc: lastModifiedUtc,
      parentCaseId: parentCaseId,
      totalSteps: totalSteps,
      passedSteps: passedSteps,
    );
  }
}

extension TestCaseDtoDomainMapper on TestCaseDto {
  TestCase toDomain() {
    return TestCase(
      id: id ?? "",
      planId: planId ?? "",
      title: title ?? "",
      status: status ?? "",
      expectedResult: expectedResult,
      assignedToUserId: assignedToUserId,
      lastModifiedUtc: lastModifiedUtc,
      parentCaseId: parentCaseId,
      totalSteps: totalSteps ?? 0,
      passedSteps: passedSteps ?? 0,
    );
  }
}

extension TestCaseDomainDtoMapper on TestCase {
  TestCaseDto toDto() {
    return TestCaseDto(
      id: id,
      planId: planId,
      title: title,
      status: status,
      expectedResult: expectedResult,
      assignedToUserId: assignedToUserId,
      lastModifiedUtc: lastModifiedUtc,
      parentCaseId: parentCaseId,
      totalSteps: totalSteps,
      passedSteps: passedSteps,
    );
  }
}

extension TestCaseEntityDtoMapper on TestCaseEntity {
  TestCaseDto toDto() {
    return TestCaseDto(
      id: id,
      planId: planId,
      title: title,
      status: status,
      expectedResult: expectedResult,
      assignedToUserId: assignedToUserId,
      lastModifiedUtc: lastModifiedUtc,
      parentCaseId: parentCaseId,
      totalSteps: totalSteps,
      passedSteps: passedSteps,
    );
  }
}

extension TestCaseDtoEntityMapper on TestCaseDto {
  TestCaseEntity toEntity() {
    return TestCaseEntity(
      id: id ?? "",
      planId: planId ?? "",
      title: title ?? "",
      status: status ?? "",
      expectedResult: expectedResult,
      assignedToUserId: assignedToUserId,
      lastModifiedUtc: lastModifiedUtc,
      parentCaseId: parentCaseId,
      totalSteps: totalSteps ?? 0,
      passedSteps: passedSteps ?? 0,
    );
  }
}

extension TestCaseDtoGraphMapper on TestCaseDto {
  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "Title": title,
        "PlanId": planId,
        "Status": status,
        "ExpectedResult": expectedResult,
        "AssignedToUserId": assignedToUserId,
        "ParentCaseId": parentCaseId,
        "TotalSteps": totalSteps ?? 0,
        "PassedSteps": passedSteps ?? 0,
      }
    };
  }
}

extension TestCaseDtoGraphUpdate on TestCaseDto {
  Map<String, dynamic> toGraphUpdateJson() {
    return {
      "id0": id,
      "planId": planId,
      "title0": title,
      "status": status,
      "expectedResult": expectedResult,
      "assignedToUserId": assignedToUserId,
      "lastModifiedUtc": lastModifiedUtc?.toIso8601String(),
      "parentCaseId": parentCaseId,
      "totalSteps": totalSteps,
      "passedSteps": passedSteps,
    };
  }
}


extension TestCaseEntityDbMapper on TestCaseEntity {
  TestCasesCompanion toDbModel() {
    return TestCasesCompanion(
      id: drift.Value(id),
      planId: drift.Value(planId),
      title: drift.Value(title),
      status: drift.Value(status),
      expectedResult: expectedResult != null
          ? drift.Value(expectedResult!)
          : const drift.Value.absent(),
      assignedToUserId: assignedToUserId != null
          ? drift.Value(assignedToUserId!)
          : const drift.Value.absent(),
      lastModifiedUtc: lastModifiedUtc != null
          ? drift.Value(lastModifiedUtc!)
          : const drift.Value.absent(),
      parentCaseId: parentCaseId != null
          ? drift.Value(parentCaseId!)
          : const drift.Value.absent(),
      totalSteps: drift.Value(totalSteps),
      passedSteps: drift.Value(passedSteps),
    );
  }
}

extension TestCaseDtoDbMapper on TestCaseDto {
  TestCasesCompanion toDbModel() {
    return TestCasesCompanion(
      id: drift.Value(id ?? ""),
      planId: drift.Value(planId ?? ""),
      title: drift.Value(title ?? ""),
      status: drift.Value(status ?? ""),
      expectedResult: expectedResult != null
          ? drift.Value(expectedResult!)
          : const drift.Value.absent(),
      assignedToUserId: assignedToUserId != null
          ? drift.Value(assignedToUserId!)
          : const drift.Value.absent(),
      lastModifiedUtc: lastModifiedUtc != null
          ? drift.Value(lastModifiedUtc!)
          : const drift.Value.absent(),
      parentCaseId: parentCaseId != null
          ? drift.Value(parentCaseId!)
          : const drift.Value.absent(),
      totalSteps: drift.Value(totalSteps ?? 0),
      passedSteps: drift.Value(passedSteps ?? 0),
    );
  }
}
