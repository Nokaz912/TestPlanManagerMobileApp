
import '../../../module_list/domain/entities/module.dart';
import '../../../module_list/domain/entities/test_plan.dart';
import '../../../project_list/domain/entities/project.dart';
import '../../../test_case_list/domain/entities/test_step.dart';
import '../../../test_plan_list/domain/entities/test_case.dart';

class ProjectStructureEntity {
  final ProjectEntity project;
  final List<ModuleStructureEntity> modules;

  ProjectStructureEntity({
    required this.project,
    required this.modules,
  });
}

class ModuleStructureEntity {
  final ModuleEntity module;
  final List<PlanStructureEntity> plans;

  ModuleStructureEntity({
    required this.module,
    required this.plans,
  });
}

class PlanStructureEntity {
  final TestPlanEntity plan;
  final List<CaseStructureEntity> cases;

  PlanStructureEntity({
    required this.plan,
    required this.cases,
  });
}

class CaseStructureEntity {
  final TestCaseEntity testCase;
  final List<TestStepEntity> steps;

  CaseStructureEntity({
    required this.testCase,
    required this.steps,
  });
}

class StepStatusPathEntity {
  final String projectId;
  final String moduleId;
  final String planId;
  final String caseId;
  final String stepId;
  final String newStatus;
  final DateTime timestamp;

  StepStatusPathEntity({
    required this.projectId,
    required this.moduleId,
    required this.planId,
    required this.caseId,
    required this.stepId,
    required this.newStatus,
    required this.timestamp,
  });
}
