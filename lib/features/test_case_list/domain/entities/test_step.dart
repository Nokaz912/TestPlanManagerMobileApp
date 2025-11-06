import 'package:equatable/equatable.dart';

class TestStepEntity extends Equatable {
  final String id;
  final String testCaseId;
  final int stepNumber;
  final String description;
  final String? expected;
  final String status; // 'NotRun' | 'Passed' | 'Failed' | 'Blocked' ...

  const TestStepEntity({
    required this.id,
    required this.testCaseId,
    required this.stepNumber,
    required this.description,
    this.expected,
    required this.status,
  });

  @override
  List<Object?> get props => [id, testCaseId, stepNumber, description, expected, status];
}
