import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../test_plan_list/domain/entities/test_plan.dart';
import '../../domain/entities/module.dart';
import '../../domain/usecases/get_modules_for_project.dart';
import '../../domain/usecases/get_submodules_for_module.dart';
import '../../../test_plan_list/domain/usecases/get_test_plan_for_modules.dart';
import 'module_event.dart';
import 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  final GetModulesForProject getModulesForProject;
  final GetSubmodulesForModule getSubmodulesForModule;

  ModuleBloc({
    required this.getModulesForProject,
    required this.getSubmodulesForModule,
  }) : super(const ModuleState.initial()) {
    on<GetModulesForProjectEvent>(_onGetModulesForProject);
    on<GetSubmodulesForModuleEvent>(_onGetSubModules);
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
          (modules) {
        emit(state.copyWith(
          status: ModuleStatus.success,
          modules: modules,
        ));
      },
    );
  }

  Future<void> _onGetSubModules(
      GetSubmodulesForModuleEvent event,
      Emitter<ModuleState> emit,
      ) async {
    emit(state.copyWith(status: ModuleStatus.loading));

    final result =
    await getSubmodulesForModule(ParentModuleIdParams(event.moduleId));

    result.fold(
          (failure) => emit(state.copyWith(
        status: ModuleStatus.failure,
        errorMessage: failure.message,
      )),
          (modules) {
        final updated = Map<String, List<ModuleEntity>>.from(state.submodules);
        updated[event.moduleId] = modules;

        emit(state.copyWith(
          status: ModuleStatus.success,
          submodules: updated,
        ));
      },
    );
  }
}
