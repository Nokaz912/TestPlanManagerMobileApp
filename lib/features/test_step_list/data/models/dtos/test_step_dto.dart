import 'package:json_annotation/json_annotation.dart';

part 'test_step_dto.g.dart';

@JsonSerializable()
class TestStepDto {
  final String? id;
  final String testCaseId;
  final int stepNumber;
  final String description;
  final String? expected;
  final String status;

  const TestStepDto({
    this.id,
    required this.testCaseId,
    required this.stepNumber,
    required this.description,
    this.expected,
    required this.status,
  });

  factory TestStepDto.fromJson(Map<String, dynamic> json) =>
      _$TestStepDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TestStepDtoToJson(this);

  /// --- GET / POST z Graph API ---
  /// JSON:
  /// {
  ///   "id": "...",
  ///   "fields": { "...": "...", ... }
  /// }
  factory TestStepDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = json['fields'] as Map<String, dynamic>?;

    int parseStep(dynamic v) {
      if (v is int) return v;
      if (v is double) return v.toInt();
      if (v is String) return int.tryParse(v) ?? 0;
      return 0;
    }

    return TestStepDto(
      id: json['id']?.toString(),
      testCaseId: fields?['testCaseId'] ?? '',
      stepNumber: parseStep(fields?['stepNumber']),
      description: fields?['description'] ?? '',
      expected: fields?['expected'],
      status: fields?['status'] ?? 'NotRun',
    );
  }

  factory TestStepDto.fromGraphFieldsJson(
      Map<String, dynamic> json,
      TestStepDto original,
      ) {
    final fields = json['fields'] as Map<String, dynamic>?;

    int parseStep(dynamic v) {
      if (v == null) return original.stepNumber;

      if (v is int) return v;
      if (v is double) return v.toInt();
      if (v is String) return int.tryParse(v) ?? original.stepNumber;

      return original.stepNumber;
    }

    return TestStepDto(
      id: json['id']?.toString() ?? original.id,
      testCaseId: fields?['testCaseId'] ?? original.testCaseId,
      stepNumber: parseStep(fields?['stepNumber']),
      description: fields?['description'] ?? original.description,
      expected: fields?['expected'] ?? original.expected,
      status: fields?['status'] ?? original.status,
    );
  }


  /// --- Create ---
  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "testCaseId": testCaseId,
        "stepNumber": stepNumber,
        "description": description,
        "expected": expected,
        "status": status,
      }
    };
  }

  /// --- Update do /fields ---
  /// UWAGA ↘️ tu NIE ma "fields"
  Map<String, dynamic> toGraphUpdateJson() {
    return {
      "testCaseId": testCaseId,
      "stepNumber": stepNumber,
      "description": description,
      "expected": expected,
      "status": status,
    };
  }
}
