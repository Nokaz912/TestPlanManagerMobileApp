import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../project_list/domain/entities/project.dart';
import '../../domain/entities/project_structure.dart';

abstract class TestExecutionRepository {
  Future<Either<Failure, List<ProjectEntity>>> getAllProjectsForTests();

  Future<Either<Failure, ProjectStructureEntity>> getProjectStructure(String projectId);

  Future<Either<Failure, void>> updateStepTempStatus(StepStatusPathEntity path);

  Future<Either<Failure, String>> exportTempStatusToFile();

}
