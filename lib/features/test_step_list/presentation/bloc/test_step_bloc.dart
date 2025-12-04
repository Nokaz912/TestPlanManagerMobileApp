import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_plan_manager_app/core/usecases/impl/recalculate_testcase_progress.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/test_step.dart';
import '../../domain/usecases/get_teststeps_for_case.dart';
import '../../domain/usecases/create_test_step.dart';
import '../../domain/usecases/update_test_step.dart';
import '../../domain/usecases/delete_test_step.dart';
import '../../domain/usecases/update_test_step_order.dart';
import 'test_step_event.dart';
import 'test_step_state.dart';

class TestStepBloc extends Bloc<TestStepEvent, TestStepState> {
  final GetTestStepsForCase getTestStepsForCase;
  final CreateTestStep createTestStep;
  final UpdateTestStep updateTestStep;
  final DeleteTestStep deleteTestStep;
  final UpdateTestStepOrder updateTestStepOrder;
  final RecalculateTestCaseProgress recalcProgress;

  TestStepBloc({
    required this.getTestStepsForCase,
    required this.createTestStep,
    required this.updateTestStep,
    required this.deleteTestStep,
    required this.updateTestStepOrder,
    required this.recalcProgress,
  }) : super(const TestStepState.initial()) {
    on<GetTestStepsForCaseEvent>(_onGet);
    on<CreateTestStepEvent>(_onCreate);
    on<UpdateTestStepEvent>(_onUpdate);
    on<DeleteTestStepEvent>(_onDelete);
    on<ReorderTestStepsEvent>(_onReorder);
  }

  Future<void> _onGet(
      GetTestStepsForCaseEvent event,
      Emitter<TestStepState> emit,
      ) async {
    emit(const TestStepState.loading());

    await emit.forEach<Either<Failure, List<TestStepEntity>>>(
      getTestStepsForCase(event.testCaseId),
      onData: (either) => either.fold(
            (f) => TestStepState.failure(
          errorMessage: f.message ?? "Błąd pobierania kroków",
        ),
            (steps) => TestStepState.success(steps: steps),
      ),
      onError: (err, _) => TestStepState.failure(
        errorMessage: err.toString(),
      ),
    );
  }

  Future<void> _onCreate(
      CreateTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    emit(const TestStepState.loading());

    final res = await createTestStep(event.step);

    res.fold(
          (f) => emit(TestStepState.failure(
        errorMessage: f.message ?? 'Nie udało się dodać kroku',
      )),
          (_) async {
        await recalcProgress(event.step.testCaseId);
        add(GetTestStepsForCaseEvent(testCaseId: event.step.testCaseId));
      },
    );
  }

  Future<void> _onUpdate(
      UpdateTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    emit(const TestStepState.loading());

    final res = await updateTestStep(event.step);

    res.fold(
          (f) => emit(TestStepState.failure(
        errorMessage: f.message ?? 'Nie udało się zaktualizować kroku',
      )),
          (_) async {
        await recalcProgress(event.step.testCaseId);
        add(GetTestStepsForCaseEvent(testCaseId: event.step.testCaseId));
      },
    );
  }

  Future<void> _onDelete(
      DeleteTestStepEvent event,
      Emitter<TestStepState> emit,
      ) async {
    emit(const TestStepState.loading());

    final res = await deleteTestStep(event.stepId);

    res.fold(
          (f) => emit(TestStepState.failure(
        errorMessage: f.message ?? 'Nie udało się usunąć kroku',
      )),
          (_) async {
        await recalcProgress(event.testCaseId);
        add(GetTestStepsForCaseEvent(testCaseId: event.testCaseId));
      },
    );
  }

  Future<void> _onReorder(
      ReorderTestStepsEvent event,
      Emitter<TestStepState> emit,
      ) async {
    emit(const TestStepState.loading());

    final res = await updateTestStepOrder(event.reorderedSteps);

    res.fold(
          (f) => emit(TestStepState.failure(
        errorMessage: f.message ?? 'Nie udało się zmienić kolejności',
      )),
          (_) async {
        await recalcProgress(event.testCaseId);
        add(GetTestStepsForCaseEvent(testCaseId: event.testCaseId));
      },
    );
  }
}

