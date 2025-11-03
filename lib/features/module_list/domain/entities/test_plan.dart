class TestPlanEntity {
  final String id;
  final String name;
  final String? description;
  final String moduleId;

  TestPlanEntity({
    required this.id,
    required this.name,
    this.description,
    required this.moduleId
  });
}