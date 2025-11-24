import 'package:json_annotation/json_annotation.dart';

part 'module_dto.g.dart';

@JsonSerializable()
class ModuleDto {
  final String id;
  final String name;
  final String? description;
  final String projectId;
  final String? parentModuleId;
  final DateTime? createdAtUtc;

  const ModuleDto({
    required this.id,
    required this.name,
    required this.projectId,
    this.description,
    this.parentModuleId,
    this.createdAtUtc,
  });

  factory ModuleDto.fromJson(Map<String, dynamic> json) =>
      _$ModuleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleDtoToJson(this);

  /// MS GRAPH: GET /items?expand=fields
  factory ModuleDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = json['fields'] as Map<String, dynamic>;

    return ModuleDto(
      id: json['id'].toString(),
      name: fields['name'],
      description: fields['description'],
      projectId: fields['projectId'],
      parentModuleId: fields['parentModuleId'],
      createdAtUtc: fields['createdAtUtc'] != null
          ? DateTime.parse(fields['createdAtUtc'])
          : null,
    );
  }

  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "name": name,
        "description": description,
        "projectId": projectId,
        "parentModuleId": parentModuleId,
        "createdAtUtc": createdAtUtc?.toIso8601String(),
      }
    };
  }

  Map<String, dynamic> toGraphUpdateJson() {
    return {
      "name": name,
      "description": description,
      "projectId": projectId,
      "parentModuleId": parentModuleId,
      "createdAtUtc": createdAtUtc?.toIso8601String(),
    };
  }
}
