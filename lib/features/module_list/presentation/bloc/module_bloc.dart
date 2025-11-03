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
    on<GetSubmodulesForModuleEvent>(_onGetSubModules);
    on<LoadPreviewForModuleEvent>(_onLoadPreviewForModule);
  }

  Future<void> _onGetModulesForProject(
      GetModulesForProjectEvent event,
      Emitter<ModuleState> emit,
      ) async {
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
      )),
    );
  }

  Future<void> _onGetSubModules(
      GetSubmodulesForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(state.copyWith(status: ModuleStatus.loading));

    // pobierz submoduły i test plany równolegle
    final submodulesResult =
    await getSubmodulesForModule(ParentModuleIdParams(event.moduleId));

    final testPlansResult =
    await getTestPlansForModule(ModuleIdParams(event.moduleId));

    // obsługa błędów
    if (submodulesResult.isLeft() && testPlansResult.isLeft()) {
      emit(state.copyWith(
        status: ModuleStatus.failure,
        errorMessage: 'Failed to load submodules and test plans',
      ));
      return;
    }

    // aktualizacja map w stanie
    final updatedSubmodules =
    Map<String, List<ModuleEntity>>.from(state.submodules);
    final updatedTestPlans =
    Map<String, List<TestPlanEntity>>.from(state.testPlans);

    submodulesResult.fold(
          (failure) => null,
          (modules) => updatedSubmodules[event.moduleId] = modules,
    );

    testPlansResult.fold(
          (failure) => null,
          (plans) => updatedTestPlans[event.moduleId] = plans,
    );

    emit(state.copyWith(
      status: ModuleStatus.success,
      submodules: updatedSubmodules,
      testPlans: updatedTestPlans,
    ));
  }
  Future<void> _onLoadPreviewForModule(
      LoadPreviewForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final submodulesResult =
    await getSubmodulesForModule(ParentModuleIdParams(event.moduleId));
    final testPlansResult =
    await getTestPlansForModule(ModuleIdParams(event.moduleId));

    final updatedSubmodules = Map<String, List<ModuleEntity>>.from(state.submodules);
    final updatedTestPlans = Map<String, List<TestPlanEntity>>.from(state.testPlans);

    submodulesResult.fold((_) => null, (subs) {
      updatedSubmodules[event.moduleId] = subs.take(3).toList();
    });
    testPlansResult.fold((_) => null, (plans) {
      updatedTestPlans[event.moduleId] = plans.take(3).toList();
    });

    emit(state.copyWith(
      submodules: updatedSubmodules,
      testPlans: updatedTestPlans,
    ));
  }
}
