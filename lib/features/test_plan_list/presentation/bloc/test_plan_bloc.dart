import 'dart:async';
import 'package:bloc/bloc.dart';
import 'test_plan_event.dart';
import 'test_plan_state.dart';
import '../../domain/entities/test_case.dart';
import '../../domain/usecases/create_test_case.dart';
import '../../domain/usecases/update_test_case.dart';
import '../../domain/usecases/delete_test_case.dart';
import '../../domain/usecases/get_test_cases_for_plan.dart';

class TestPlanBloc extends Bloc<TestPlanEvent, TestPlanState> {
  final GetTestCasesForPlan getTestCasesForPlan;
  final CreateTestCase createTestCase;
  final UpdateTestCase updateTestCase;
  final DeleteTestCase deleteTestCase;

  TestPlanBloc({
    required this.getTestCasesForPlan,
    required this.createTestCase,
    required this.updateTestCase,
    required this.deleteTestCase,
  }) : super(const TestPlanState.initial()) {
    on<GetTestCasesForPlanEvent>(_loadTestCases);
    on<CreateTestCaseEvent>(_createCase);
    on<UpdateTestCaseEvent>(_updateCase);
    on<DeleteTestCaseEvent>(_deleteCase);
  }

  Future<void> _loadTestCases(
      GetTestCasesForPlanEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    emit(const TestPlanState.loading());

    await emit.forEach<List<TestCaseEntity>>(
      getTestCasesForPlan(PlanIdParams(event.planId)),
      onData: (cases) => TestPlanState.success(testCases: cases),
      onError: (error, _) => TestPlanState.failure(
        errorMessage: error.toString(),
      ),
    );
  }

  Future<void> _createCase(
      CreateTestCaseEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    await createTestCase(CreateTestCaseParams(event.testCase));
    // STREAM sam zaktualizuje listę
  }

  Future<void> _updateCase(
      UpdateTestCaseEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    await updateTestCase(UpdateTestCaseParams(event.testCase));
  }

  Future<void> _deleteCase(
      DeleteTestCaseEvent event,
      Emitter<TestPlanState> emit,
      ) async {
    await deleteTestCase(DeleteTestCaseParams(event.id));
  }
}
