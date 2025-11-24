import 'package:dio/dio.dart';
import '../../../../features/project_list/data/models/dtos/project_dto.dart';
import 'projects_remote_datasource.dart';

class ProjectsRemoteDataSourceImpl implements ProjectsRemoteDataSource {
  final Dio httpClient;

  final Future<String> Function() tokenProvider;

  ProjectsRemoteDataSourceImpl({
    required this.httpClient,
    required this.tokenProvider,
  });

  static const _siteId =
      "wiechmichal01gmail.sharepoint.com,"
      "53d02a82-2aa5-49bf-abd9-0edf67d7e2e7,"
      "cac5f5b6-314f-43f2-a373-48ffb18f5d0a";

  static const _projectsListId = "e85cd967-7468-4d44-85db-501d3a57af15";

  String get _itemsUrl =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_projectsListId/items?expand=fields";

  @override
  Future<List<ProjectDto>> fetchProjects() async {
    final token = await tokenProvider();

    final res = await httpClient.get(
      _itemsUrl,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "ConsistencyLevel": "eventual",
        },
      ),
    );

    final List data = res.data["value"];
    return data.map((e) => ProjectDto.fromGraphJson(e)).toList();
  }
}
