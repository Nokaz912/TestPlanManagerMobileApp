import 'package:equatable/equatable.dart';
import '../../domain/entities/test_step.dart';

enum TestStepStatus { initial, loading, success, failure }

class TestStepState extends Equatable {
  final TestStepStatus status;
  final List<TestStepEntity> steps;
  final String? errorMessage;

  const TestStepState({
    required this.status,
    required this.steps,
    this.errorMessage,
  });

  const TestStepState.initial()
      : status = TestStepStatus.initial,
        steps = const [],
        errorMessage = null;

  TestStepState copyWith({
    TestStepStatus? status,
    List<TestStepEntity>? steps,
    String? errorMessage,
  }) {
    return TestStepState(
      status: status ?? this.status,
      steps: steps ?? this.steps,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, steps, errorMessage];
}
