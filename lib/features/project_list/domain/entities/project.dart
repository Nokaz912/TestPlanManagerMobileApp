class ProjectEntity {
  final String id;
  final String name;
  final String? description;
  final DateTime? createdAtUtc;

  ProjectEntity({
    required this.id,
    required this.name,
    this.description,
    this.createdAtUtc,
  });
}
