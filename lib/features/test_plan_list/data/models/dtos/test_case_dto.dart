import 'package:json_annotation/json_annotation.dart';

part 'test_case_dto.g.dart';

@JsonSerializable()
class TestCaseDto {
  final String id;
  final String planId;
  final String title;
  final String? status;
  final String? assignedToUserId;
  final String? expectedResult;
  final DateTime? lastModifiedUtc;
  final String? parentCaseId;
  final int? totalSteps;
  final int? passedSteps;

  const TestCaseDto({
    required this.id,
    required this.planId,
    required this.title,
    this.status,
    this.assignedToUserId,
    this.expectedResult,
    this.lastModifiedUtc,
    this.parentCaseId,
    this.totalSteps,
    this.passedSteps,
  });

  factory TestCaseDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = json['fields'] ?? {};

    int? _toInt(val) {
      if (val == null) return null;
      if (val is int) return val;
      if (val is double) return val.toInt();
      if (val is String) return int.tryParse(val);
      return null;
    }

    return TestCaseDto(
      id: fields['id0'] ?? json['id'],
      planId: fields['planId'] ?? '',
      title: fields['title0'] ?? '',
      status: fields['status'],
      assignedToUserId: fields['assignedToUserId'],
      expectedResult: fields['expectedResult'],
      parentCaseId: fields['parentCaseId'],
      lastModifiedUtc: fields['lastModifiedUtc'] != null
          ? DateTime.parse(fields['lastModifiedUtc'])
          : null,
      totalSteps: _toInt(fields['totalSteps']) ?? 0,
      passedSteps: _toInt(fields['passedSteps']) ?? 0,
    );
  }


  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "id0": id,
        "planId": planId,
        "title0": title,
        "status": status,
        "assignedToUserId": assignedToUserId,
        "expectedResult": expectedResult,
        "parentCaseId": parentCaseId,
        "lastModifiedUtc": lastModifiedUtc?.toIso8601String(),
        "totalSteps": totalSteps ?? 0,
        "passedSteps": passedSteps ?? 0,
      }
    };
  }


  Map<String, dynamic> toGraphUpdateJson() {
    final map = <String, dynamic>{};

    map["title0"] = title;
    if (status != null) map["status"] = status;
    if (assignedToUserId != null) map["assignedToUserId"] = assignedToUserId;
    if (expectedResult != null) map["expectedResult"] = expectedResult;
    if (parentCaseId != null) map["parentCaseId"] = parentCaseId;
    if (lastModifiedUtc != null)
      map["lastModifiedUtc"] = lastModifiedUtc!.toIso8601String();
    if (totalSteps != null) map["totalSteps"] = totalSteps;
    if (passedSteps != null) map["passedSteps"] = passedSteps;

    return map;
  }
}

