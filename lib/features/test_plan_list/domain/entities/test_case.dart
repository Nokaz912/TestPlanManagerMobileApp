class TestCaseEntity {
  final String id;
  final String planId;
  final String title;
  final String status;
  final String? expectedResult;
  final String? assignedToUserId;
  final DateTime? lastModifiedUtc;
  final String? parentCaseId;
  final int totalSteps;
  final int passedSteps;

  const TestCaseEntity({
    required this.id,
    required this.planId,
    required this.title,
    required this.status,
    this.expectedResult,
    this.assignedToUserId,
    this.lastModifiedUtc,
    this.parentCaseId,
    this.totalSteps = 0,
    this.passedSteps = 0,
  });

  TestCaseEntity copyWith({
    String? id,
    String? planId,
    String? title,
    String? status,
    String? expectedResult,
    String? assignedToUserId,
    DateTime? lastModifiedUtc,
    String? parentCaseId,
    int? totalSteps,
    int? passedSteps,
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
      totalSteps: totalSteps ?? this.totalSteps,
      passedSteps: passedSteps ?? this.passedSteps,
    );
  }
}
