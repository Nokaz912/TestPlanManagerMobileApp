import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
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
  }) : super(const TestExecutionState()) {
    on<GetAllProjectsForTestsEvent>(_onGetAllProjects);
    on<GetProjectStructureEvent>(_onGetProjectStructure);
    on<UpdateStepTempStatusEvent>(_onUpdateStepTempStatus);
    on<ExportToFileEvent>(_onExportToFileStatus);
  }

  // -----------------------------------------------------
  // 1️⃣ Pobranie listy projektów
  // -----------------------------------------------------
  Future<void> _onGetAllProjects(
      GetAllProjectsForTestsEvent event, Emitter<TestExecutionState> emit) async {

    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await getAllProjectsUseCase(NoParams());

    result.fold(
          (failure) => emit(
        state.copyWith(
          loading: false,
          errorMessage: failure.message ?? "Unknown error",
        ),
      ),
          (projects) => emit(
        state.copyWith(
          loading: false,
          projects: projects,
          errorMessage: null,
        ),
      ),
    );
  }

  // -----------------------------------------------------
  // 2️⃣ Pobranie struktury projektu
  // -----------------------------------------------------
  Future<void> _onGetProjectStructure(
      GetProjectStructureEvent event, Emitter<TestExecutionState> emit) async {

    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await getProjectStructure(event.projectId);

    result.fold(
          (failure) => emit(
        state.copyWith(
          loading: false,
          errorMessage: failure.message ?? "Unknown error",
        ),
      ),
          (structure) => emit(
        state.copyWith(
          loading: false,
          structure: structure,
          errorMessage: null,
        ),
      ),
    );
  }

  // -----------------------------------------------------
  // 3️⃣ Lokalna aktualizacja tymczasowego statusu kroków
  // -----------------------------------------------------
  Future<void> _onUpdateStepTempStatus(
      UpdateStepTempStatusEvent event, Emitter<TestExecutionState> emit) async {

    final result = await updateStepTempStatus(event.stepStatus);

    result.fold(
          (failure) => emit(
        state.copyWith(
          errorMessage: failure.message ?? "Unknown error",
        ),
      ),
          (_) => emit(
        state.copyWith(errorMessage: null), // stan się nie zmienia
      ),
    );
  }

  Future<void> _onExportToFileStatus(
      ExportToFileEvent event,
      Emitter<TestExecutionState> emit,
      ) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await exportToFile(NoParams());

    result.fold(
          (failure) => emit(
        state.copyWith(
          loading: false,
          errorMessage: failure.message ?? "Nie udało się wyeksportować",
        ),
      ),
          (filePath) => emit(
        state.copyWith(
          loading: false,
          errorMessage: "Plik zapisano: $filePath", // UI wyświetli snackbar
        ),
      ),
    );
  }
}
