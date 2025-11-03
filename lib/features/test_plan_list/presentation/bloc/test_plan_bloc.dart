import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/usecases/get_all_test_plans.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_test_plan_for_modules.dart';
import '../../domain/entities/test_plan.dart';
import 'test_plan_event.dart';
import 'test_plan_state.dart';

class TestPlanBloc extends Bloc<TestPlanEvent, TestPlanState> {
  final GetAllTestPlans _getAllTestPlans;
  final GetTestPlansForModule _getTestPlansForModule;

  TestPlanBloc({
    required GetAllTestPlans getAllTestPlans,
    required GetTestPlansForModule getTestPlansForModule,
  })  : _getAllTestPlans = getAllTestPlans,
        _getTestPlansForModule = getTestPlansForModule,
        super(const TestPlanState.initial()) {
    on<GetAllTestPlansEvent>(_onGetAllTestPlans);
    on<GetTestPlansForModuleEvent>(_onGetTestPlansForModule);
  }

  Future<void> _onGetAllTestPlans(
      GetAllTestPlansEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    emit(state.copyWith(
      status: TestPlanStatus.loading,
      errorMessage: null,
    ));

    final result = await _getAllTestPlans(NoParams());

    result.fold(
          (failure) => emit(state.copyWith(
        status: TestPlanStatus.failure,
        errorMessage: failure.message ?? 'Unexpected error occurred',
      )),
          (plans) => emit(state.copyWith(
        status: TestPlanStatus.success,
        plans: plans,
      )),
    );
  }

  Future<void> _onGetTestPlansForModule(
      GetTestPlansForModuleEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    emit(state.copyWith(
      status: TestPlanStatus.loading,
      errorMessage: null,
    ));

    final result = await _getTestPlansForModule(ModuleIdParams(event.moduleId));

    result.fold(
          (failure) => emit(state.copyWith(
        status: TestPlanStatus.failure,
        errorMessage: failure.message ?? 'Unexpected error occurred',
      )),
          (plans) => emit(state.copyWith(
        status: TestPlanStatus.success,
        plans: plans,
      )),
    );
  }
}