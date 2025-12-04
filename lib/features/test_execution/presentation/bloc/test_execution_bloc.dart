import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../project_list/domain/entities/project.dart';
import '../../domain/usecases/export_to_file.dart';
import '../../domain/usecases/get_all_projects.dart';
import '../../domain/usecases/get_project_structure.dart';
import '../../domain/usecases/update_step_temp_status.dart';
import 'test_execution_event.dart';
import 'test_execution_state.dart';

class TestExecutionBloc extends Bloc<TestExecutionEvent, TestExecutionState> {
  final GetAllProjectsForTestsUseCase getAllProjectsUseCase;
  final GetProjectStructure getProjectStructure;
  final UpdateStepTempStatus updateStepTempStatus;
  final ExportToFile exportToFile;

  TestExecutionBloc({
    required this.getAllProjectsUseCase,
    required this.getProjectStructure,
    required this.updateStepTempStatus,
    required this.exportToFile,
  }) : super(const TestExecutionState.initial()) {
    on<GetAllProjectsForTestsEvent>(_onGetAllProjects);
    on<GetProjectStructureEvent>(_onGetProjectStructure);
    on<UpdateStepTempStatusEvent>(_onUpdateStepTempStatus);
    on<ExportToFileEvent>(_onExportToFile);
  }

  Future<void> _onGetAllProjects(
      GetAllProjectsForTestsEvent event,
      Emitter<TestExecutionState> emit,
      ) async {
    emit(const TestExecutionState.loading());
    final result = await getAllProjectsUseCase(NoParams());

    result.fold(
          (f) => emit(TestExecutionState.failure(
        errorMessage: f.message ?? 'Nie udało się pobrać projektów',
      )),
          (projects) => emit(TestExecutionState.success(
        projects: projects,
        structure: null,
        exportFilePath: null,
      )),
    );
  }

  Future<void> _onGetProjectStructure(
      GetProjectStructureEvent event,
      Emitter<TestExecutionState> emit,
      ) async {
    final prevProjects = state.maybeWhen(
      success: (projects, _, __) => projects,
      orElse: () => const <ProjectEntity>[],
    );

    emit(TestExecutionState.success(
      projects: prevProjects,
      structure: null,
      exportFilePath: null,
    ));

    final result = await getProjectStructure(event.projectId);

    result.fold(
          (f) => emit(TestExecutionState.failure(
        errorMessage: f.message ?? 'Nie udało się pobrać struktury projektu',
      )),
          (structure) => emit(TestExecutionState.success(
        projects: prevProjects,
        structure: structure,
        exportFilePath: null,
      )),
    );
  }

  Future<void> _onUpdateStepTempStatus(
      UpdateStepTempStatusEvent event,
      Emitter<TestExecutionState> emit,
      ) async {
    final result = await updateStepTempStatus(event.stepStatus);

    result.fold(
          (f) => emit(TestExecutionState.failure(
        errorMessage: f.message ?? 'Błąd zmiany statusu kroku testowego',
      )),
          (_) => emit(state),
    );
  }

  Future<void> _onExportToFile(
      ExportToFileEvent event,
      Emitter<TestExecutionState> emit,
      ) async {
    emit(const TestExecutionState.loading());

    final result = await exportToFile(NoParams());

    final prev = state.maybeWhen(
      success: (projects, structure, _) => (projects, structure),
      loading: () => (<ProjectEntity>[], null),
      orElse: () => (<ProjectEntity>[], null),
    );

    result.fold(
          (f) => emit(TestExecutionState.failure(
        errorMessage: f.message ?? 'Nie udało się wyeksportować danych',
      )),
          (filePath) => emit(TestExecutionState.success(
        projects: prev.$1,
        structure: prev.$2,
        exportFilePath: filePath,
      )),
    );
  }
}
