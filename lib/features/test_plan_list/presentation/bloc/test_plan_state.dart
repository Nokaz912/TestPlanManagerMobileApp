import 'package:equatable/equatable.dart';

import '../../domain/entities/test_plan.dart';


enum TestPlanStatus { initial, loading, success, failure }

class TestPlanState extends Equatable {
  final TestPlanStatus status;
  final List<TestPlanEntity>? plans;
  final String? errorMessage;

  const TestPlanState({
    required this.status,
    required this.plans,
    this.errorMessage,
  });

  const TestPlanState.initial()
      : status = TestPlanStatus.initial,
        plans = const [],
        errorMessage = null;

  TestPlanState copyWith({
    TestPlanStatus? status,
    List<TestPlanEntity>? plans,
    String? errorMessage,
  }) {
    return TestPlanState(
      status: status ?? this.status,
      plans: plans ?? this.plans,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, plans, errorMessage];
}
