import 'package:drift/drift.dart' as drift;

import '../../../features/project_list/data/models/dtos/project_dto.dart';
import '../../../features/project_list/domain/entities/project.dart';
import '../data.dart';

extension ProjectDataMapper on Project {
  ProjectEntity toEntity() {
    return ProjectEntity(
      id: id,
      name: name,
      description: description,
      createdAtUtc: createdAtUtc,
    );
  }
}

extension ProjectEntityDbMapper on ProjectEntity {
  ProjectsCompanion toDbModel() {
    return ProjectsCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      description: description != null
          ? drift.Value(description!)
          : const drift.Value.absent(),
      createdAtUtc: createdAtUtc != null
          ? drift.Value(createdAtUtc!)
          : const drift.Value.absent(),
    );
  }
}

extension ProjectDtoDbMapper on ProjectDto {
  ProjectsCompanion toDbModel() {
    return ProjectsCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      description: description != null
          ? drift.Value(description!)
          : const drift.Value.absent(),
      createdAtUtc: createdAtUtc != null
          ? drift.Value(createdAtUtc!)
          : const drift.Value.absent(),
    );
  }
}
