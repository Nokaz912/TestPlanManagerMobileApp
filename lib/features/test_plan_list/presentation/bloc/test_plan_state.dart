import 'package:equatable/equatable.dart';
import '../../domain/entities/test_case.dart';

enum TestPlanStatus { initial, loading, success, failure }

class TestPlanState extends Equatable {
  final TestPlanStatus status;
  final List<TestCaseEntity> testCases;
  final String? errorMessage;

  const TestPlanState({
    required this.status,
    required this.testCases,
    this.errorMessage,
  });

  const TestPlanState.initial()
      : status = TestPlanStatus.initial,
        testCases = const [],
        errorMessage = null;

  TestPlanState copyWith({
    TestPlanStatus? status,
    List<TestCaseEntity>? testCases,
    String? errorMessage,
  }) {
    return TestPlanState(
      status: status ?? this.status,
      testCases: testCases ?? this.testCases,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, testCases, errorMessage];
}
