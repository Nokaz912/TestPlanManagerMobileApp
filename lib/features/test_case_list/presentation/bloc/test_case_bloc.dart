import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_plan_manager_app/features/test_case_list/presentation/bloc/test_case_event.dart';
import 'package:test_plan_manager_app/features/test_case_list/presentation/bloc/test_case_state.dart';

import '../../domain/usecases/get_teststeps_for_case.dart';

class TestStepBloc extends Bloc<TestStepEvent, TestStepState> {
  final GetTestStepsForCase getTestStepsForCase;

  TestStepBloc({required this.getTestStepsForCase})
      : super(const TestStepState.initial()) {
    on<GetTestStepsForCaseEvent>(_onGetTestStepsForCase);
  }

  Future<void> _onGetTestStepsForCase(
      GetTestStepsForCaseEvent event,
      Emitter<TestStepState> emit,
      ) async {
    emit(state.copyWith(status: TestStepStatus.loading));

    final result = await getTestStepsForCase(event.testCaseId);

    result.fold(
          (failure) => emit(state.copyWith(
        status: TestStepStatus.failure,
        errorMessage: failure.message,
      )),
          (steps) => emit(state.copyWith(
        status: TestStepStatus.success,
        steps: steps,
      )),
    );
  }
}
