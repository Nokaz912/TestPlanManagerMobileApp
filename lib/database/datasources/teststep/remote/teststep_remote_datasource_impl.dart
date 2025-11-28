import 'package:dio/dio.dart';
import 'package:test_plan_manager_app/features/test_step_list/data/models/dtos/test_step_dto.dart';
import 'teststep_remote_datasource.dart';

class TestStepRemoteDataSourceImpl implements TestStepRemoteDataSource {
  final Dio httpClient;
  final Future<String> Function() tokenProvider;

  TestStepRemoteDataSourceImpl({
    required this.httpClient,
    required this.tokenProvider,
  });

  static const _siteId =
      "wiechmichal01gmail.sharepoint.com,"
      "53d02a82-2aa5-49bf-abd9-0edf67d7e2e7,"
      "cac5f5b6-314f-43f2-a373-48ffb18f5d0a";

  static const _testStepsListId = "7c8bed07-f4a9-4133-bf78-f0fcfe1dd72a";

  String get _itemsUrl =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testStepsListId/items?expand=fields";

  String _updateUrl(String id) =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testStepsListId/items/$id/fields";

  String _deleteUrl(String id) =>
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testStepsListId/items/$id";

  @override
  Future<List<TestStepDto>> fetchStepsForCase(String testCaseId) async {
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
    final dtos = data.map((e) => TestStepDto.fromGraphJson(e)).toList();
    return dtos.where((s) => s.testCaseId == testCaseId).toList();
  }

  @override
  Future<TestStepDto> createStep(TestStepDto dto) async {
    final token = await tokenProvider();

    final res = await httpClient.post(
      _itemsUrl,
      data: dto.toGraphCreateJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      ),
    );

    return TestStepDto.fromGraphJson(res.data);
  }

  @override
  Future<TestStepDto> updateStep(TestStepDto dto) async {
    final token = await tokenProvider();
    final id = dto.id;

    await httpClient.patch(
      _updateUrl(id),
      data: dto.toGraphUpdateJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "If-Match": "*",
        },
      ),
    );

    final refreshed = await httpClient.get(
      "https://graph.microsoft.com/v1.0/sites/$_siteId/lists/$_testStepsListId/items/$id?expand=fields",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    return TestStepDto.fromGraphJson(refreshed.data);
  }


  @override
  Future<void> deleteStep(String id) async {
    final token = await tokenProvider();

    await httpClient.delete(
      _deleteUrl(id),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "If-Match": "*",
        },
      ),
    );
  }
}
