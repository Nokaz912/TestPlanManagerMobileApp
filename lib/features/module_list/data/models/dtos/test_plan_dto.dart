import '../../../../../database/data.dart';
import '../../../domain/entities/test_plan.dart';

extension TestPlanMapper on TestPlan {
  TestPlanEntity toEntity() => TestPlanEntity(
    id: id,
    name: name,
    description: description,
    moduleId: moduleId
  );
}
