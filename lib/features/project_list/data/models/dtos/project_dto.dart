import 'package:json_annotation/json_annotation.dart';

part 'project_dto.g.dart';

@JsonSerializable()
class ProjectDto {
  final String id;
  final String name;
  final String? description;
  final DateTime? createdAtUtc;

  const ProjectDto({
    required this.id,
    required this.name,
    this.description,
    this.createdAtUtc,
  });

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);

  /// MS GRAPH: GET /items?expand=fields
  factory ProjectDto.fromGraphJson(Map<String, dynamic> json) {
    final fields = json['fields'] as Map<String, dynamic>;

    return ProjectDto(
      id: json['id'].toString(),
      name: fields['name'],
      description: fields['description'],
      createdAtUtc: fields['createdAtUtc'] != null
          ? DateTime.parse(fields['createdAtUtc'])
          : null,
    );
  }

  /// POST → /lists/{id}/items
  Map<String, dynamic> toGraphCreateJson() {
    return {
      "fields": {
        "name": name,
        "description": description,
        "createdAtUtc": createdAtUtc?.toIso8601String(),
      }
    };
  }

  /// PATCH → /lists/{id}/items/{itemId}/fields
  Map<String, dynamic> toGraphUpdateJson() {
    return {
      "name": name,
      "description": description,
      "createdAtUtc": createdAtUtc?.toIso8601String(),
    };
  }
}
