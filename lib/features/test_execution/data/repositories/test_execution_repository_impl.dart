import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/module_dto.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/test_plan_dto.dart';
import 'package:test_plan_manager_app/features/project_list/data/models/dtos/project_dto.dart';
import 'package:test_plan_manager_app/features/test_case_list/data/models/dtos/test_step_dto.dart';
import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_case_dto.dart';

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
      final projectDtos = await projectDao.getAllProjects();
      final entities = projectDtos.map((e) => e.toEntity()).toList();

      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure("Błąd pobierania projektów: $e"));
    }
  }

  @override
  Future<Either<Failure, ProjectStructureEntity>> getProjectStructure(
      String projectId) async {
    try {
      final projectDto = (await projectDao.getAllProjects()).firstWhere((p) =>
      p.id == projectId);
      final projectEntity = projectDto.toEntity();

      final moduleDtos = await moduleDao.getModulesForProject(projectId);
      final moduleEntities = <ModuleStructureEntity>[];

      for (final module in moduleDtos) {
        final moduleEntity = module.toEntity();

        final planDtos = await testPlansDao.getPlansByModuleId(module.id);
        final planEntities = <PlanStructureEntity>[];

        for (final plan in planDtos) {
          final planEntity = plan.toEntity();

          final caseDtos = await testCasesDao.getCasesForPlan(plan.id);
          final caseEntities = <CaseStructureEntity>[];

          for (final c in caseDtos) {
            final caseEntity = c.toEntity();

            final stepDtos = await testStepsDao.getStepsForCase(c.id);
            final stepEntities = stepDtos.map((s) => s.toEntity()).toList();

            caseEntities.add(
              CaseStructureEntity(
                testCase: caseEntity,
                steps: stepEntities,
              ),
            );
          }

          planEntities.add(
            PlanStructureEntity(
              plan: planEntity,
              cases: caseEntities,
            ),
          );
        }

        moduleEntities.add(
          ModuleStructureEntity(
            module: moduleEntity,
            plans: planEntities,
          ),
        );
      }

      return Right(
        ProjectStructureEntity(
          project: projectEntity,
          modules: moduleEntities,
        ),
      );
    } catch (e) {
      return Left(DatabaseFailure("Błąd budowania struktury projektu: $e"));
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
      await fileService.saveExecutionStatusToTxt(_tempStatusBuffer);

      return Right(filePath);

    } catch (e) {
      return Left(
        DatabaseFailure("Błąd podczas eksportowania statusów: $e"),
      );
    }
  }
}
