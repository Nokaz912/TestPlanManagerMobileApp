class TestCaseEntity {
  final String id;
  final String planId;
  final String title;
  final String status;
  final String? assignedToUserId;
  final String? expectedResult;

  const TestCaseEntity({
    required this.id,
    required this.planId,
    required this.title,
    required this.status,
    this.assignedToUserId,
    this.expectedResult,
  });
}
