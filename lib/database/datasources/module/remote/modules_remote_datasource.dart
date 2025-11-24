import 'package:test_plan_manager_app/features/module_list/data/models/dtos/module_dto.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/test_plan_dto.dart';

abstract class ModuleRemoteDataSource {
  Future<List<ModuleDto>> fetchModulesForProject(String projectId);

  Future<List<TestPlanDto>> fetchTestPlansForModule(String moduleId);
}
