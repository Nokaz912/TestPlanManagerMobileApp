import 'package:bloc/bloc.dart';
import '../../domain/usecases/get_test_cases_for_plan.dart';
import 'test_plan_event.dart';
import 'test_plan_state.dart';

class TestPlanBloc extends Bloc<TestPlanEvent, TestPlanState> {
  final GetTestCasesForPlan getTestCasesForPlan;

  TestPlanBloc({
    required this.getTestCasesForPlan,
  }) : super(const TestPlanState.initial()) {
    on<GetTestCasesForPlanEvent>(_onGetTestCasesForPlan);
  }

  Future<void> _onGetTestCasesForPlan(
      GetTestCasesForPlanEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    emit(state.copyWith(status: TestPlanStatus.loading));

    final result = await getTestCasesForPlan(PlanIdParams(event.planId));

    result.fold(
          (failure) => emit(state.copyWith(
        status: TestPlanStatus.failure,
        errorMessage: failure.message ?? 'Nie udało się pobrać przypadków testowych',
      )),
          (cases) => emit(state.copyWith(
        status: TestPlanStatus.success,
        testCases: cases,
      )),
    );
  }
}
