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
extension TestCaseEntityCopyWith on TestCaseEntity {
  TestCaseEntity copyWith({
    String? id,
    String? planId,
    String? title,
    String? status,
    String? expectedResult,
    String? assignedToUserId,
    DateTime? lastModifiedUtc,
    String? parentCaseId,
  }) {
    return TestCaseEntity(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      title: title ?? this.title,
      status: status ?? this.status,
      expectedResult: expectedResult ?? this.expectedResult,
      assignedToUserId: assignedToUserId ?? this.assignedToUserId,
      lastModifiedUtc: lastModifiedUtc ?? this.lastModifiedUtc,
      parentCaseId: parentCaseId ?? this.parentCaseId,
    );
  }
}

