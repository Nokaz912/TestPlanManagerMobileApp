// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_case_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestCaseDto _$TestCaseDtoFromJson(Map<String, dynamic> json) => TestCaseDto(
  id: json['id'] as String,
  planId: json['planId'] as String,
  title: json['title'] as String,
  status: json['status'] as String?,
  assignedToUserId: json['assignedToUserId'] as String?,
  expectedResult: json['expectedResult'] as String?,
  lastModifiedUtc:
      json['lastModifiedUtc'] == null
          ? null
          : DateTime.parse(json['lastModifiedUtc'] as String),
  parentCaseId: json['parentCaseId'] as String?,
  totalSteps: (json['totalSteps'] as num?)?.toInt(),
  passedSteps: (json['passedSteps'] as num?)?.toInt(),
);

Map<String, dynamic> _$TestCaseDtoToJson(TestCaseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'title': instance.title,
      'status': instance.status,
      'assignedToUserId': instance.assignedToUserId,
      'expectedResult': instance.expectedResult,
      'lastModifiedUtc': instance.lastModifiedUtc?.toIso8601String(),
      'parentCaseId': instance.parentCaseId,
      'totalSteps': instance.totalSteps,
      'passedSteps': instance.passedSteps,
    };
