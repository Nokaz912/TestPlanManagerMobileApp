import 'package:drift/drift.dart' as drift;

import '../../../../../database/drift_database/data.dart';
import '../../../features/module_list/data/models/dtos/test_plan_dto.dart';
import '../../../features/module_list/domain/entities/test_plan.dart';


extension TestPlanMapper on TestPlan {
  TestPlanEntity toEntity() => TestPlanEntity(
    id: id,
    name: name,
    description: description,
    moduleId: moduleId,
  );
}

extension TestPlanEntityDbMapper on TestPlanEntity {
  TestPlansCompanion toDbModel() {
    return TestPlansCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      description: description != null
          ? drift.Value(description!)
          : const drift.Value.absent(),
      moduleId: drift.Value(moduleId),
      lastModifiedUtc: const drift.Value.absent(),
    );
  }
}

extension TestPlanDtoDbMapper on TestPlanDto {
  TestPlansCompanion toDbModel() {
    return TestPlansCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      description: description != null
          ? drift.Value(description!)
          : const drift.Value.absent(),
      moduleId: drift.Value(moduleId),
      lastModifiedUtc: lastModifiedUtc != null
          ? drift.Value(lastModifiedUtc!)
          : const drift.Value.absent(),
      overallPassed: const drift.Value.absent(),
      overallFailed: const drift.Value.absent(),
      overallBlocked: const drift.Value.absent(),
    );
  }
}
