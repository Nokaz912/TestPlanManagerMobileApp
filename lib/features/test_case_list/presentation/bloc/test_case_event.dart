// lib/features/test_step_list/presentation/bloc/test_step_event.dart
import 'package:equatable/equatable.dart';

abstract class TestStepEvent extends Equatable {
  const TestStepEvent();
  @override
  List<Object?> get props => [];
}

class GetTestStepsForCaseEvent extends TestStepEvent {
  final String testCaseId;
  const GetTestStepsForCaseEvent(this.testCaseId);

  @override
  List<Object?> get props => [testCaseId];
}
