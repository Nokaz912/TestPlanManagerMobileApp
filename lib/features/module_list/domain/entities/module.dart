class ModuleEntity {
  final String id;
  final String name;
  final String? description;
  final String projectId;
  final String? parentModuleId;

  ModuleEntity({
    required this.id,
    required this.name,
    required this.projectId,
    this.description,
    this.parentModuleId,
  });
}
