import 'package:equatable/equatable.dart';
import '../../../project_list/domain/entities/project.dart';
import '../../domain/entities/project_structure.dart';

abstract class TestExecutionEvent extends Equatable {
  const TestExecutionEvent();

  @override
  List<Object?> get props => [];
}
class GetAllProjectsForTestsEvent extends TestExecutionEvent {
  const GetAllProjectsForTestsEvent();
}

class GetProjectStructureEvent extends TestExecutionEvent {
  final String projectId;

  const GetProjectStructureEvent(this.projectId);

  @override
  List<Object?> get props => [projectId];
}

class UpdateStepTempStatusEvent extends TestExecutionEvent {
  final StepStatusPathEntity stepStatus;

  const UpdateStepTempStatusEvent(this.stepStatus);

  @override
  List<Object?> get props => [stepStatus];
}

class ExportToFileEvent extends TestExecutionEvent {
  const ExportToFileEvent();
}
