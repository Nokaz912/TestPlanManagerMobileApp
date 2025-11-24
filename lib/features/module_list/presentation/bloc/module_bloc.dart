import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/global/navigation/domain/usecases/get_visited_modules.dart';
import '../../../../core/global/navigation/domain/usecases/save_visited_modules.dart';

import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';

import '../../domain/usecases/create_module.dart';
import '../../domain/usecases/create_test_plan.dart';
import '../../domain/usecases/delete_module.dart';
import '../../domain/usecases/delete_test_plan.dart';
import '../../domain/usecases/get_modules_for_project.dart';
import '../../domain/usecases/get_submodules_for_module.dart';
import '../../domain/usecases/get_test_plan_for_modules.dart';
import '../../domain/usecases/update_module.dart';
import '../../domain/usecases/update_test_plan.dart';

import 'module_event.dart';
import 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  final GetModulesForProject getModulesForProject;
  final GetSubmodulesForModule getSubmodulesForModule;
  final GetTestPlansForModule getTestPlansForModule;

  final SaveVisitedModules saveVisitedModules;
  final GetVisitedModules getVisitedModules;

  final CreateModule createModule;
  final UpdateModule updateModule;
  final DeleteModule deleteModule;

  final CreateTestPlan createTestPlan;
  final UpdateTestPlan updateTestPlan;
  final DeleteTestPlan deleteTestPlan;

  ModuleBloc({
    required this.getModulesForProject,
    required this.getSubmodulesForModule,
    required this.getTestPlansForModule,
    required this.saveVisitedModules,
    required this.getVisitedModules,
    required this.createModule,
    required this.updateModule,
    required this.deleteModule,
    required this.createTestPlan,
    required this.updateTestPlan,
    required this.deleteTestPlan,
  }) : super(const ModuleState.initial()) {
    on<GetModulesForProjectEvent>(_onGetModules);
    on<GetSubmodulesForModuleEvent>(_onGetSubmodules);
    on<LoadPreviewForModuleEvent>(_onPreviewForModule);
    on<NavigateBackEvent>(_onNavigateBack);
    on<SetVisitedPathEvent>(_onSetVisitedPath);

    on<CreateModuleEvent>(_onCreateModule);
    on<UpdateModuleEvent>(_onUpdateModule);
    on<DeleteModuleEvent>(_onDeleteModule);

    on<CreateTestPlanEvent>(_onCreateTestPlan);
    on<UpdateTestPlanEvent>(_onUpdateTestPlan);
    on<DeleteTestPlanEvent>(_onDeleteTestPlan);
  }

  Future<void> _onGetModules(
      GetModulesForProjectEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());

    await emit.forEach<List<ModuleEntity>>(
      getModulesForProject(ProjectIdParams(event.projectId)),
      onData: (modules) {
        final visited = getVisitedModules(event.projectId);

        return ModuleState.success(
          modules: modules,
          submodules: const {},
          testPlans: const {},
          visitedModules: visited,
          currentProjectId: event.projectId,
          projectName: event.projectName,
        );
      },
      onError: (err, _) =>
          ModuleState.failure(errorMessage: err.toString()),
    );
  }

  Future<void> _onPreviewForModule(
      LoadPreviewForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    final id = event.moduleId;

    if (current.submodules[id]?.isNotEmpty == true ||
        current.testPlans[id]?.isNotEmpty == true) return;

    final updatedSub = Map.of(current.submodules);
    final updatedPlans = Map.of(current.testPlans);

    final subs = await getSubmodulesForModule(ParentModuleIdParams(id));
    subs.fold((_) {}, (list) {
      updatedSub[id] = list.take(3).toList();
    });

    final plans = await getTestPlansForModule(ModuleIdParams(id));
    plans.fold((_) {}, (list) {
      updatedPlans[id] = list.take(3).toList();
    });

    emit(current.copyWith(
      submodules: updatedSub,
      testPlans: updatedPlans,
    ));
  }

  Future<void> _onGetSubmodules(
      GetSubmodulesForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    final moduleId = event.moduleId;
    final projectId = current.currentProjectId;
    if (projectId == null) return;

    emit(const ModuleState.loading());

    final subsResult =
    await getSubmodulesForModule(ParentModuleIdParams(moduleId));
    final plansResult =
    await getTestPlansForModule(ModuleIdParams(moduleId));

    final Map<String, List<ModuleEntity>> sub = Map.of(current.submodules);
    final Map<String, List<TestPlanEntity>> plan = Map.of(current.testPlans);

    String? error;

    subsResult.fold((f) => error = f.message, (list) => sub[moduleId] = list);
    plansResult.fold((f) => error = f.message, (list) => plan[moduleId] = list);

    if (error != null) {
      emit(ModuleState.failure(errorMessage: error!));
      return;
    }

    final visited = [...getVisitedModules(projectId), moduleId];
    saveVisitedModules(projectId, visited);

    emit(ModuleState.success(
      modules: current.modules,
      submodules: sub,
      testPlans: plan,
      visitedModules: visited,
      currentProjectId: projectId,
      projectName: current.projectName,
    ));
  }

  Future<void> _onNavigateBack(
      NavigateBackEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    final visited = getVisitedModules(event.projectId);

    if (visited.isNotEmpty) {
      visited.removeLast();
      saveVisitedModules(event.projectId, visited);

      emit(current.copyWith(visitedModules: visited));
      return;
    }

    saveVisitedModules(event.projectId, []);
    emit(current.copyWith(visitedModules: []));
  }

  Future<void> _onSetVisitedPath(
      SetVisitedPathEvent event,
      Emitter<ModuleState> emit,
      ) async {
    saveVisitedModules(event.projectId, event.visited);

    final current = state;
    if (current is ModuleSuccess) {
      emit(current.copyWith(visitedModules: event.visited));
    }
  }

  Future<void> _refresh([String? parentModule]) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    if (parentModule == null) {
      add(ModuleEvent.getModulesForProject(
        projectId: current.currentProjectId!,
        projectName: current.projectName,
      ));
    } else {
      add(ModuleEvent.getSubmodulesForModule(moduleId: parentModule));
    }
  }

  Future<void> _onCreateModule(
      CreateModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());
    final res = await createModule(CreateModuleParams(event.module));
    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) => _refresh(event.module.parentModuleId),
    );
  }

  Future<void> _onUpdateModule(
      UpdateModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());
    final res = await updateModule(UpdateModuleParams(event.module));
    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) => _refresh(event.module.parentModuleId),
    );
  }

  Future<void> _onDeleteModule(
      DeleteModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());
    final res = await deleteModule(DeleteModuleParams(event.moduleId));
    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) => _refresh(event.moduleId),
    );
  }

  Future<void> _onCreateTestPlan(
      CreateTestPlanEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());
    final res = await createTestPlan(CreateTestPlanParams(event.plan));
    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) => _refresh(event.plan.moduleId),
    );
  }

  Future<void> _onUpdateTestPlan(
      UpdateTestPlanEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());
    final res = await updateTestPlan(UpdateTestPlanParams(event.plan));
    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) => _refresh(event.plan.moduleId),
    );
  }

  Future<void> _onDeleteTestPlan(
      DeleteTestPlanEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(const ModuleState.loading());
    final res = await deleteTestPlan(DeleteTestPlanParams(event.testPlanId));
    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) => _refresh(),
    );
  }
}
