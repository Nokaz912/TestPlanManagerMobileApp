import 'package:drift/drift.dart' as drift;
import '../../../features/module_list/data/models/dtos/module_dto.dart';
import '../../../features/module_list/domain/entities/module.dart';
import '../data.dart';

extension ModuleDataMapper on Module {
  ModuleEntity toEntity() {
    return ModuleEntity(
      id: id,
      name: name,
      description: description,
      projectId: projectId,
      parentModuleId: parentModuleId,
    );
  }
}

//TODO refactor to null safety
extension ModuleEntityDbMapper on ModuleEntity {
  ModulesCompanion toDbModel() {
    return ModulesCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      description: description != null
          ? drift.Value(description!)
          : const drift.Value.absent(),
      projectId: drift.Value(projectId),
      parentModuleId: parentModuleId != null
          ? drift.Value(parentModuleId!)
          : const drift.Value.absent(),
    );
  }

  ModuleDto toDto() {
    return ModuleDto(
      id: id,
      name: name,
      description: description,
      projectId: projectId,
      parentModuleId: parentModuleId,
    );
  }
}

extension ModuleDtoDbMapper on ModuleDto {
  ModulesCompanion toDbModel() {
    return ModulesCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      description: description != null
          ? drift.Value(description!)
          : const drift.Value.absent(),
      projectId: drift.Value(projectId),
      parentModuleId: parentModuleId != null
          ? drift.Value(parentModuleId!)
          : const drift.Value.absent(),
    );
  }

  ModuleEntity toEntity() {
    return ModuleEntity(
      id: id,
      name: name,
      description: description,
      projectId: projectId,
      parentModuleId: parentModuleId,
    );
  }
}
