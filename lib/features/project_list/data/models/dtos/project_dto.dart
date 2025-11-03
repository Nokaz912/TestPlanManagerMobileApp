import '../../../../../database/data.dart';
import '../../../domain/entities/project.dart';

extension ProjectMapper on Project {
  ProjectEntity toEntity() {
    return ProjectEntity(
      id: id,
      name: name,
      description: description,
      createdAtUtc: createdAtUtc,
    );
  }
}