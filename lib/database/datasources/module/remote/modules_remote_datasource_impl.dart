import 'package:dio/dio.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/module_dto.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/test_plan_dto.dart';

import 'modules_remote_datasource.dart';

class ModuleRemoteDataSourceImpl implements ModuleRemoteDataSource {
  final Dio httpClient;
  final Future<String> Function() tokenProvider;

  ModuleRemoteDataSourceImpl({
    required this.httpClient,
    required this.tokenProvider,
  });

  static const _siteId =
      "wiechmichal01gmail.sharepoint.com,"
      "53d02a82-2aa5-49bf-abd9-0edf67d7e2e7,"
      "cac5f5b6-314f-43f2-a373-48ffb18f5d0a";

  static const _modulesListId = "1eea8620-9100-4294-aba3-bc9392ff8286";
  static const _testPlansListId = "7cde5b25-71f8-4fd3-92b3-1cd7d2bb967a";

  String get _modulesItemsUrl =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_modulesListId/items?expand=fields";

  String get _testPlansItemsUrl =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testPlansListId/items?expand=fields";

  @override
  Future<List<ModuleDto>> fetchModulesForProject(String projectId) async {
    final token = await tokenProvider();

    final res = await httpClient.get(
      _modulesItemsUrl,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'ConsistencyLevel': 'eventual',
        },
      ),
    );

    final List items = res.data['value'];
    final dtos = items.map((e) => ModuleDto.fromGraphJson(e)).toList();

    // filtrowanie lokalne
    return dtos.where((m) => m.projectId == projectId).toList();
  }

  @override
  Future<List<TestPlanDto>> fetchTestPlansForModule(String moduleId) async {
    final token = await tokenProvider();

    final res = await httpClient.get(
      _testPlansItemsUrl,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'ConsistencyLevel': 'eventual',
        },
      ),
    );

    final List items = res.data['value'];
    final dtos = items.map((e) => TestPlanDto.fromGraphJson(e)).toList();

    // filtrowanie lokalne
    return dtos.where((p) => p.moduleId == moduleId).toList();
  }
}
