import 'package:equatable/equatable.dart';
import '../../domain/entities/test_case.dart';

enum TestCaseStatus { initial, loading, success, failure }

class TestCaseState extends Equatable {
  final TestCaseStatus status;
  final List<TestCaseEntity> testCases;
  final String? errorMessage;

  const TestCaseState({
    required this.status,
    required this.testCases,
    this.errorMessage,
  });

  const TestCaseState.initial()
      : status = TestCaseStatus.initial,
        testCases = const [],
        errorMessage = null;

  TestCaseState copyWith({
    TestCaseStatus? status,
    List<TestCaseEntity>? testCases,
    String? errorMessage,
  }) {
    return TestCaseState(
      status: status ?? this.status,
      testCases: testCases ?? this.testCases,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, testCases, errorMessage];
}
