import 'package:get_it/get_it.dart';
import 'package:test_plan_manager_app/database/daos/test_cases_dao.dart';
import 'package:test_plan_manager_app/features/test_case_list/data/repository/test_case_repository_impl.dart';
import 'package:test_plan_manager_app/features/test_case_list/domain/repository/test_case_repository.dart';
import 'package:test_plan_manager_app/features/test_case_list/domain/usecases/get_test_cases_for_plan.dart';
import 'package:test_plan_manager_app/features/test_case_list/presentation/bloc/test_case_bloc.dart';

import '../core/global/global_repository.dart';
import '../core/global/global_use_cases.dart';
import '../core/global/usecases/global_get_test_plans_for_module.dart';
import '../database/daos/module_dao.dart';
import '../database/daos/project_dao.dart';
import '../database/daos/test_plans_dao.dart';
import '../database/data.dart';
import '../features/module_list/data/repository/module_repository_impl.dart';
import '../features/module_list/domain/repository/module_repository.dart';
import '../features/module_list/domain/usecases/get_modules_for_project.dart';
import '../features/module_list/domain/usecases/get_submodules_for_module.dart';
import '../features/module_list/presentation/bloc/module_bloc.dart';
import '../features/project_list/data/repository/project_repository_impl.dart';
import '../features/project_list/domain/repository/project_repository.dart';
import '../features/project_list/domain/usecases/get_all_projects.dart';
import '../features/project_list/presentation/bloc/project_bloc.dart';
import '../features/test_plan_list/data/repositories/test_plan_repository_impl.dart';
import '../features/test_plan_list/domain/repositories/test_plan_repository.dart';
import '../features/test_plan_list/domain/usecases/get_all_test_plans.dart';
import '../features/test_plan_list/domain/usecases/get_test_plan_for_modules.dart';
import '../features/test_plan_list/presentation/bloc/test_plan_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Infra / DB
  final db = AppDatabase();
  sl.registerSingleton<AppDatabase>(db);
  sl.registerLazySingleton(() => ProjectDao(db));
  sl.registerLazySingleton(() => ModuleDao(db));
  sl.registerLazySingleton(() => TestPlansDao(db));
  sl.registerLazySingleton(() => TestCasesDao(db));

  // --- PROJECTS ---
  sl.registerLazySingleton<ProjectRepository>(() => ProjectRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetAllProjects(sl()));

  // --- MODULES ---
  sl.registerLazySingleton<ModuleRepository>(() => ModuleRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetModulesForProject(sl()));
  sl.registerLazySingleton(() => GetSubmodulesForModule(sl()));

  // --- TEST PLANS ---
  sl.registerLazySingleton<TestPlanRepository>(() => TestPlanRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetAllTestPlans(sl()));
  sl.registerLazySingleton(() => GetTestPlansForModule(sl()));

  // --- TEST CASES ---
  sl.registerLazySingleton<TestCaseRepository>(() => TestCaseRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetTestCasesForPlan(sl()));

  //---- GLOBAL ----
  sl.registerLazySingleton(() => GlobalRepository(dao: sl<TestPlansDao>()));
  sl.registerLazySingleton(() => GlobalGetTestPlansForModule( sl<GlobalRepository>()));

  sl.registerLazySingleton(() => GlobalUseCases(
    getTestPlansForModule: sl<GlobalGetTestPlansForModule>(),
  ));

  // Presentation
  sl.registerFactory(() => TestPlanBloc(
    getAllTestPlans: sl(),
    getTestPlansForModule: sl(),
  ));
  sl.registerFactory(() => TestCaseBloc(sl()));
  sl.registerFactory(() => ProjectBloc(sl()));
  sl.registerFactory(() => ModuleBloc(
    getModulesForProject: sl(),
    getSubmodulesForModule: sl(),
  ));

}
