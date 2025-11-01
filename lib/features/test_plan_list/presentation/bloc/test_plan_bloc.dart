import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/usecases/get_all_test_plans.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/test_plan.dart';
import 'test_plan_event.dart';
import 'test_plan_state.dart';

class TestPlanBloc extends Bloc<TestPlanEvent, TestPlanState> {
  final GetAllTestPlans _getAllTestPlans;

  TestPlanBloc(this._getAllTestPlans) : super(const TestPlanState.initial()) {
    on<GetAllTestPlansEvent>(_onGetAllTestPlans);
  }

  Future<void> _onGetAllTestPlans(
      GetAllTestPlansEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    emit(state.copyWith(status: TestPlanStatus.loading, errorMessage: null));

    final Either<Failure, List<TestPlanEntity>> result = await _getAllTestPlans();

    result.fold(
          (failure) {
        emit(state.copyWith(
          status: TestPlanStatus.failure,
          errorMessage: failure.message ?? 'Unexpected error occurred',
        ));
      },
          (plans) {
        emit(state.copyWith(
          status: TestPlanStatus.success,
          plans: plans,
        ));
      },
    );
  }
}