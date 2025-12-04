import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/module_dto.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/test_plan_dto.dart';
import 'package:test_plan_manager_app/features/module_list/domain/entities/module.dart';
import 'package:test_plan_manager_app/features/module_list/domain/entities/test_plan.dart';
import 'package:test_plan_manager_app/features/project_list/data/models/dtos/project_dto.dart';

import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_case_dto.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/entities/test_case.dart';
import 'package:test_plan_manager_app/features/test_step_list/data/models/dtos/test_step_dto.dart';
import 'package:test_plan_manager_app/features/test_step_list/domain/entities/test_step.dart';

import '../../../../core/error/failures.dart';

import '../../../../core/global/file_service/file_service.dart';
import '../../../project_list/domain/entities/project.dart';
import '../../domain/entities/project_structure.dart';
import '../../domain/repositories/test_execution_repository.dart';

import '../../../../database/daos/project_dao.dart';
import '../../../../database/daos/module_dao.dart';
import '../../../../database/daos/test_plans_dao.dart';
import '../../../../database/daos/test_cases_dao.dart';
import '../../../../database/daos/test_steps_dao.dart';

class TestExecutionRepositoryImpl implements TestExecutionRepository {
  final ProjectDao projectDao;
  final ModuleDao moduleDao;
  final TestPlansDao testPlansDao;
  final TestCasesDao testCasesDao;
  final TestStepsDao testStepsDao;
  final FileService fileService;
  final List<StepStatusPathEntity> _tempStatusBuffer = [];

  TestExecutionRepositoryImpl({
    required this.projectDao,
    required this.moduleDao,
    required this.testPlansDao,
    required this.testCasesDao,
    required this.testStepsDao,
    required this.fileService,
  });

  // ----------------------------------------------------------
  // GET ALL PROJECTS
  // ----------------------------------------------------------
  @override
  Future<Either<Failure, List<ProjectEntity>>> getAllProjectsForTests() async {
    try {
      final projects = await projectDao.getAllProjects();

      final entities = projects.map(
            (p) => ProjectEntity(
          id: p.id,
          name: p.name,
          description: p.description,
          createdAtUtc: p.createdAtUtc,
        ),
      ).toList();

      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure("Błąd pobierania projektów: $e"));
    }
  }

  @override
  Future<Either<Failure, ProjectStructureEntity>> getProjectStructure(
      String projectId,
      ) async {
    try {
      final projectRow = await projectDao.getProjectById(projectId);
      if (projectRow == null) {
        return Left(DatabaseFailure("Projekt nie istnieje"));
      }

      final project = ProjectEntity(
        id: projectRow.id,
        name: projectRow.name,
        description: projectRow.description,
        createdAtUtc: projectRow.createdAtUtc,
      );

      final moduleRows = await moduleDao.getModulesForProject(projectId);
      final moduleStructures = <ModuleStructureEntity>[];

      for (final module in moduleRows) {
        final moduleEntity = ModuleEntity(
          id: module.id,
          name: module.name,
          description: module.description,
          projectId: module.projectId,
          parentModuleId: module.parentModuleId,
        );

        final planRows = await testPlansDao.getPlansByModuleId(module.id);
        final planStructures = <PlanStructureEntity>[];

        for (final plan in planRows) {
          final planEntity = TestPlanEntity(
            id: plan.id,
            name: plan.name,
            moduleId: plan.moduleId,
          );

          final caseRows = await testCasesDao.getCasesForPlan(plan.id);
          final caseStructures = <CaseStructureEntity>[];

          for (final testCase in caseRows) {
            final testCaseEntity = TestCaseEntity(
              id: testCase.id,
              planId: testCase.planId,
              title: testCase.title,
              status: testCase.status,
              expectedResult: testCase.expectedResult,
              assignedToUserId: testCase.assignedToUserId,
              lastModifiedUtc: testCase.lastModifiedUtc,
              parentCaseId: testCase.parentCaseId,
              totalSteps: testCase.totalSteps,
              passedSteps: testCase.passedSteps,
            );

            final stepRows = await testStepsDao.getStepsForCase(testCase.id);
            final steps = stepRows
                .map(
                  (s) => TestStepEntity(
                id: s.id,
                testCaseId: s.testCaseId,
                stepNumber: s.stepNumber,
                description: s.description,
                expected: s.expected,
                status: s.status,
              ),
            )
                .toList();


            caseStructures.add(
              CaseStructureEntity(
                testCase: testCaseEntity,
                steps: steps,
              ),
            );
          }

          planStructures.add(
            PlanStructureEntity(
              plan: planEntity,
              cases: caseStructures,
            ),
          );
        }

        moduleStructures.add(
          ModuleStructureEntity(
            module: moduleEntity,
            plans: planStructures,
          ),
        );
      }

      return Right(
        ProjectStructureEntity(
          project: project,
          modules: moduleStructures,
        ),
      );
    } catch (e) {
      return Left(
        DatabaseFailure("Błąd budowania struktury projektu: $e"),
      );
    }
  }


  @override
  Future<Either<Failure, void>> updateStepTempStatus(
      StepStatusPathEntity path) async {
    try {
      final index = _tempStatusBuffer.indexWhere((item) =>
      item.projectId == path.projectId &&
          item.moduleId == path.moduleId &&
          item.planId == path.planId &&
          item.caseId == path.caseId &&
          item.stepId == path.stepId);

      if (index >= 0) {
        _tempStatusBuffer[index] = path;
      } else {
        _tempStatusBuffer.add(path);
      }

      return const Right(null);

    } catch (e) {
      return Left(
        DatabaseFailure("Błąd podczas zapisu temp statusu: $e"),
      );
    }
  }

  @override
  Future<Either<Failure, String>> exportTempStatusToFile() async {
    try {
      if (_tempStatusBuffer.isEmpty) {
        return Left(
          DatabaseFailure("Brak danych do zapisania — bufor jest pusty."),
        );
      }

      final filePath =
      await fileService.saveExecutionStatusToJson(_tempStatusBuffer);

      return Right(filePath);

    } catch (e) {
      return Left(
        DatabaseFailure("Błąd podczas eksportowania statusów: $e"),
      );
    }
  }
}
