// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestPlanDto _$TestPlanDtoFromJson(Map<String, dynamic> json) => TestPlanDto(
  id: json['id'] as String,
  name: json['name'] as String,
  moduleId: json['moduleId'] as String,
  description: json['description'] as String?,
  ownerUserId: json['ownerUserId'] as String?,
  lastModifiedUtc:
      json['lastModifiedUtc'] == null
          ? null
          : DateTime.parse(json['lastModifiedUtc'] as String),
  overallPassed: (json['overallPassed'] as num?)?.toInt(),
  overallFailed: (json['overallFailed'] as num?)?.toInt(),
  overallBlocked: (json['overallBlocked'] as num?)?.toInt(),
);

Map<String, dynamic> _$TestPlanDtoToJson(TestPlanDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'moduleId': instance.moduleId,
      'ownerUserId': instance.ownerUserId,
      'lastModifiedUtc': instance.lastModifiedUtc?.toIso8601String(),
      'overallPassed': instance.overallPassed,
      'overallFailed': instance.overallFailed,
      'overallBlocked': instance.overallBlocked,
    };
