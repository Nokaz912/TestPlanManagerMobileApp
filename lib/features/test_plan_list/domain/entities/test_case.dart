import 'package:equatable/equatable.dart';

class TestCaseEntity extends Equatable {
  final String id;
  final String planId;
  final String title;
  final String status;
  final String? assignedToUserId;
  final String? expectedResult;
  final DateTime? lastModifiedUtc;
  final String? parentCaseId;

  const TestCaseEntity({
    required this.id,
    required this.planId,
    required this.title,
    required this.status,
    this.assignedToUserId,
    this.expectedResult,
    this.lastModifiedUtc,
    this.parentCaseId,
  });

  @override
  List<Object?> get props =>
      [id, planId, title, status, assignedToUserId, expectedResult, lastModifiedUtc, parentCaseId];
}
