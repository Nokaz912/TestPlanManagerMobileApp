import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

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
      onError: (err, _) => ModuleState.failure(errorMessage: err.toString()),
    );
  }

  Future<void> _onPreviewForModule(
      LoadPreviewForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    final id = event.moduleId;

    await emit.forEach<List<TestPlanEntity>>(
      getTestPlansForModule(ModuleIdParams(id)),
      onData: (plans) {
        final updated = Map.of(current.testPlans);
        updated[id] = plans.take(3).toList();
        return current.copyWith(testPlans: updated);
      },
      onError: (e, _) =>
          ModuleState.failure(errorMessage: e.toString()),
    );
  }


  Future<void> _onGetSubmodules(
      GetSubmodulesForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    final current = state;
    if (current is! ModuleSuccess) return;

    final moduleId = event.moduleId;

    final subs = await getSubmodulesForModule(ParentModuleIdParams(moduleId));
    String? error;
    final updatedSubs = Map.of(current.submodules);

    subs.fold(
          (f) => error = f.message,
          (list) => updatedSubs[moduleId] = list,
    );

    if (error != null) {
      emit(ModuleState.failure(errorMessage: error!));
      return;
    }

    await emit.forEach<List<TestPlanEntity>>(
      getTestPlansForModule(ModuleIdParams(moduleId)),
      onData: (plans) => current.copyWith(
        submodules: updatedSubs,
        testPlans: {...current.testPlans, moduleId: plans},
      ),
      onError: (err, _) => ModuleState.failure(errorMessage: err.toString()),
    );
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
      add(
        ModuleEvent.getModulesForProject(
          projectId: current.currentProjectId!,
          projectName: current.projectName,
        ),
      );
    } else {
      add(ModuleEvent.getSubmodulesForModule(moduleId: parentModule));
    }
  }

  Future<void> _onCreateModule(
    CreateModuleEvent event,
    Emitter<ModuleState> emit,
  ) async {
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
    final res = await deleteModule(DeleteModuleParams(event.moduleId));

    res.fold(
          (f) => emit(ModuleState.failure(errorMessage: f.message ?? 'error')),
          (_) => _refresh(),
    );
  }

  Future<void> _onCreateTestPlan(
    CreateTestPlanEvent event,
    Emitter<ModuleState> emit,
  ) async {
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
