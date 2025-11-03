import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_plan_manager_app/features/test_case_list/presentation/bloc/test_case_event.dart';
import 'package:test_plan_manager_app/features/test_case_list/presentation/bloc/test_case_state.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/test_case.dart';
import '../../domain/usecases/get_test_cases_for_plan.dart';

class TestCaseBloc extends Bloc<TestCaseEvent, TestCaseState> {
  final GetTestCasesForPlan getTestCasesForPlan;

  TestCaseBloc(this.getTestCasesForPlan) : super(const TestCaseState.initial()) {
    on<GetTestCasesForPlanEvent>(_onGetTestCasesForPlan);
  }

  Future<void> _onGetTestCasesForPlan(
      GetTestCasesForPlanEvent event,
      Emitter<TestCaseState> emit,
      ) async {
    emit(state.copyWith(status: TestCaseStatus.loading));

    final result = await getTestCasesForPlan(PlanIdParams(event.planId));

    result.fold(
          (failure) => emit(state.copyWith(
        status: TestCaseStatus.failure,
        errorMessage: failure.message ?? 'Nieznany błąd',
      )),
          (cases) => emit(state.copyWith(
        status: TestCaseStatus.success,
        testCases: cases,
      )),
    );
  }
}
