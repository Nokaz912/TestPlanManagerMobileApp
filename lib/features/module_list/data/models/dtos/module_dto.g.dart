// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleDto _$ModuleDtoFromJson(Map<String, dynamic> json) => ModuleDto(
  id: json['id'] as String,
  name: json['name'] as String,
  projectId: json['projectId'] as String,
  description: json['description'] as String?,
  parentModuleId: json['parentModuleId'] as String?,
  createdAtUtc:
      json['createdAtUtc'] == null
          ? null
          : DateTime.parse(json['createdAtUtc'] as String),
);

Map<String, dynamic> _$ModuleDtoToJson(ModuleDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'projectId': instance.projectId,
  'parentModuleId': instance.parentModuleId,
  'createdAtUtc': instance.createdAtUtc?.toIso8601String(),
};
