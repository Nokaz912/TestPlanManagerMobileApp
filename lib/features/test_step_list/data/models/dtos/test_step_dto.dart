import 'package:json_annotation/json_annotation.dart';

part 'test_step_dto.g.dart';

@JsonSerializable()
class TestStepDto {
  final String id;
  final String testCaseId;
  final int stepNumber;
  final String description;
  final String? expected;
  final String status;

  const TestStepDto({
    required this.id,
    required this.testCaseId,
    required this.stepNumber,
    required this.description,
    this.expected,
    required this.status,
  });

  factory TestStepDto.fromJson(Map<String, dynamic> json) =>
      _$TestStepDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TestStepDtoToJson(this);

  factory TestStepDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = json['fields'] ?? {};

    int? _toInt(dynamic v) {
      if (v == null) return null;
      if (v is int) return v;
      if (v is double) return v.toInt();
      if (v is String) return int.tryParse(v);
      return null;
    }

    return TestStepDto(
      id: fields['id0'] ?? json['id'],
      testCaseId: fields['testCaseId'] ?? '',
      stepNumber: _toInt(fields['stepNumber']) ?? 0,
      description: fields['description'] ?? '',
      expected: fields['expected'],
      status: fields['status'] ?? 'NotRun',
    );
  }

  Map<String, dynamic> toGraphCreateJson() {
    final title = "Step $stepNumber";
    return {
      "fields": {
        "id0": id,
        "testCaseId": testCaseId,
        "stepNumber": stepNumber,
        "description": description,
        "expected": expected,
        "status": status,
        "Title": title,
      }
    };
  }

  Map<String, dynamic> toGraphUpdateJson() {
    final map = <String, dynamic>{};

    map["description"] = description;
    map["status"] = status;
    map["stepNumber"] = stepNumber;

    if (expected != null) map["expected"] = expected;

    return map;
  }
}
