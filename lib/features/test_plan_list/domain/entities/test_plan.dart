class TestPlanEntity {
  final String id;
  final String name;
  final String? description;

  TestPlanEntity({
    required this.id,
    required this.name,
    this.description,
  });
}