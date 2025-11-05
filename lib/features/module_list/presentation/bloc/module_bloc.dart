import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';
import '../../domain/usecases/get_modules_for_project.dart';
import '../../domain/usecases/get_submodules_for_module.dart';
import '../../domain/usecases/get_test_plan_for_modules.dart';
import 'module_event.dart';
import 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  final GetModulesForProject getModulesForProject;
  final GetSubmodulesForModule getSubmodulesForModule;
  final GetTestPlansForModule getTestPlansForModule;

  ModuleBloc({
    required this.getModulesForProject,
    required this.getSubmodulesForModule,
    required this.getTestPlansForModule,
  }) : super(const ModuleState.initial()) {
    on<GetModulesForProjectEvent>(_onGetModulesForProject);
    on<GetSubmodulesForModuleEvent>(_onGetSubmodulesForModule);
    on<LoadPreviewForModuleEvent>(_onLoadPreviewForModule);
    on<NavigateToModuleEvent>(_onNavigateToModule);
    on<UpdateVisitedModulesEvent>((event, emit) {
      emit(state.copyWith(visitedModules: event.visited));
    });
  }

  Future<void> _onGetModulesForProject(
      GetModulesForProjectEvent event,
      Emitter<ModuleState> emit,
      ) async {
    if (state.currentProjectId != event.projectId) {
      emit(const ModuleState.initial());
    }

    emit(state.copyWith(status: ModuleStatus.loading));

    final result = await getModulesForProject(ProjectIdParams(event.projectId));

    result.fold(
          (failure) => emit(state.copyWith(
        status: ModuleStatus.failure,
        errorMessage: failure.message,
      )),
          (modules) => emit(state.copyWith(
        status: ModuleStatus.success,
        modules: modules,
        currentProjectId: event.projectId, // <-- dodaj to do stanu
      )),
    );
  }


  Future<void> _onLoadPreviewForModule(
      LoadPreviewForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final moduleId = event.moduleId;

    final alreadyLoaded = (state.submodules[moduleId]?.isNotEmpty ?? false) ||
        (state.testPlans[moduleId]?.isNotEmpty ?? false);
    if (alreadyLoaded) return;

    // 🔹 Pobierz tylko dzieci 1 poziomu (nie rekurencyjnie)
    final submodulesResult =
    await getSubmodulesForModule(ParentModuleIdParams(moduleId));
    final testPlansResult =
    await getTestPlansForModule(ModuleIdParams(moduleId));

    // 🔹 Kopie aktualnych map
    final updatedSubmodules =
    Map<String, List<ModuleEntity>>.from(state.submodules);
    final updatedTestPlans =
    Map<String, List<TestPlanEntity>>.from(state.testPlans);

    // 🔹 Zapisz maksymalnie 3 podglądy (żeby kafelek był lekki)
    submodulesResult.fold((_) => null,
            (subs) => updatedSubmodules[moduleId] = subs.take(3).toList());
    testPlansResult.fold((_) => null,
            (plans) => updatedTestPlans[moduleId] = plans.take(3).toList());

    emit(state.copyWith(
      submodules: updatedSubmodules,
      testPlans: updatedTestPlans,
    ));
  }

  Future<void> _onGetSubmodulesForModule(
      GetSubmodulesForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final moduleId = event.moduleId;

    // 🔹 1. Jeśli już mamy cache — użyj
    final alreadyCached = state.submodules.containsKey(moduleId);
    if (alreadyCached) {
      // Dodaj moduł do ścieżki odwiedzonych
      final updatedVisited = [...state.visitedModules];
      if (!updatedVisited.contains(moduleId)) updatedVisited.add(moduleId);

      emit(state.copyWith(
        status: ModuleStatus.success,
        visitedModules: updatedVisited,
      ));
      return;
    }

    emit(state.copyWith(status: ModuleStatus.loading));

    final submodulesResult =
    await getSubmodulesForModule(ParentModuleIdParams(moduleId));
    final testPlansResult =
    await getTestPlansForModule(ModuleIdParams(moduleId));

    final updatedSubmodules = Map<String, List<ModuleEntity>>.from(state.submodules);
    final updatedTestPlans = Map<String, List<TestPlanEntity>>.from(state.testPlans);

    submodulesResult.fold(
          (failure) => emit(state.copyWith(
        status: ModuleStatus.failure,
        errorMessage: failure.message,
      )),
          (modules) => updatedSubmodules[moduleId] = modules,
    );

    testPlansResult.fold(
          (failure) => emit(state.copyWith(
        status: ModuleStatus.failure,
        errorMessage: failure.message,
      )),
          (plans) => updatedTestPlans[moduleId] = plans,
    );

    final updatedVisited = [...state.visitedModules];
    if (!updatedVisited.contains(moduleId)) updatedVisited.add(moduleId);

    emit(state.copyWith(
      status: ModuleStatus.success,
      submodules: updatedSubmodules,
      testPlans: updatedTestPlans,
      visitedModules: updatedVisited,
    ));
  }
  Future<void> _onNavigateToModule(
      NavigateToModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final moduleId = event.moduleId;

    if (moduleId == null) {
      emit(state.copyWith(visitedModules: []));
      return;
    }

    final index = state.visitedModules.indexOf(moduleId);
    if (index == -1) return;

    final trimmedVisited = state.visitedModules.sublist(0, index + 1);

    emit(state.copyWith(visitedModules: trimmedVisited));
  }


}
