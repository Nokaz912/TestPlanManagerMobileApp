// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_step_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestStepDto _$TestStepDtoFromJson(Map<String, dynamic> json) => TestStepDto(
  id: json['id'] as String?,
  testCaseId: json['testCaseId'] as String,
  stepNumber: (json['stepNumber'] as num).toInt(),
  description: json['description'] as String,
  expected: json['expected'] as String?,
  status: json['status'] as String,
);

Map<String, dynamic> _$TestStepDtoToJson(TestStepDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'testCaseId': instance.testCaseId,
      'stepNumber': instance.stepNumber,
      'description': instance.description,
      'expected': instance.expected,
      'status': instance.status,
    };
