import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:test_plan_manager_app/core/config/graph_client.dart';
import 'package:test_plan_manager_app/core/config/graph_config.dart';
import 'package:test_plan_manager_app/database/datasources/auth/auth.dart';
import 'package:test_plan_manager_app/database/datasources/comments/local/comment_local_datasource.dart';
import 'package:test_plan_manager_app/database/datasources/comments/local/comment_local_datasource_impl.dart';
import 'package:test_plan_manager_app/database/datasources/comments/remote/comment_remote_datasource.dart';
import 'package:test_plan_manager_app/database/datasources/comments/remote/comment_remote_datasource_impl.dart';
import 'package:test_plan_manager_app/database/datasources/teststep/local/teststep_local_datasource_impl.dart';
import 'package:test_plan_manager_app/database/datasources/teststep/remote/teststep_remote_datasource.dart';
import 'package:test_plan_manager_app/database/datasources/teststep/remote/teststep_remote_datasource_impl.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/services/testcase_service.dart';

// 🌍 GLOBAL
import '../core/global/file_service/file_service.dart';
import '../core/global/navigation/data/repository/navigation_repository_impl.dart';
import '../core/global/navigation/domain/repository/navigation_repository.dart';
import '../core/global/navigation/domain/usecases/get_visited_modules.dart';
import '../core/global/navigation/domain/usecases/save_visited_modules.dart';

// 🧩 DATABASE
import '../core/global/pkce_service/pkce_service.dart';
import '../core/usecases/impl/recalculate_testcase_progress.dart';
import '../database/datasources/auth/auth_impl.dart';
import '../database/datasources/module/local/modules_local_datasource.dart';
import '../database/datasources/module/local/modules_local_datasource_impl.dart';
import '../database/datasources/module/remote/modules_remote_datasource.dart';
import '../database/datasources/module/remote/modules_remote_datasource_impl.dart';
import '../database/datasources/projects/local/projects_local_datasource.dart';
import '../database/datasources/projects/local/projects_local_datasource_impl.dart';
import '../database/datasources/projects/remote/projects_remote_datasource_impl.dart';
import '../database/datasources/projects/remote/projects_remote_datasource.dart';
import '../database/datasources/testcase/local/testcase_local_datasource.dart';
import '../database/datasources/testcase/local/testcase_local_datasource_impl.dart';
import '../database/datasources/testcase/remote/testcase_remote_datasource.dart';
import '../database/datasources/testcase/remote/testcase_remote_datasource_impl.dart';
import '../database/datasources/teststep/local/teststep_local_datasource.dart';
import '../database/drift_database/data.dart';
import '../database/daos/comments_dao.dart';
import '../database/daos/module_dao.dart';
import '../database/daos/project_dao.dart';
import '../database/daos/test_cases_dao.dart';
import '../database/daos/test_plans_dao.dart';
import '../database/daos/test_steps_dao.dart';

// PROJECTS
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/project_list/data/repository/project_repository_impl.dart';
import '../features/project_list/domain/repository/project_repository.dart';
import '../features/project_list/domain/usecases/create_new_project.dart';
import '../features/project_list/domain/usecases/delete_project.dart';
import '../features/project_list/domain/usecases/get_all_projects.dart';
import '../features/project_list/domain/usecases/update_project.dart';
import '../features/project_list/presentation/bloc/project_bloc.dart';

// MODULES
import '../features/module_list/data/repository/module_repository_impl.dart';
import '../features/module_list/domain/repository/module_repository.dart';
import '../features/module_list/domain/usecases/get_modules_for_project.dart';
import '../features/module_list/domain/usecases/get_submodules_for_module.dart';
import '../features/module_list/domain/usecases/get_test_plan_for_modules.dart';
import '../features/module_list/domain/usecases/create_module.dart';
import '../features/module_list/domain/usecases/update_module.dart';
import '../features/module_list/domain/usecases/delete_module.dart';
import '../features/module_list/domain/usecases/create_test_plan.dart';
import '../features/module_list/domain/usecases/update_test_plan.dart';
import '../features/module_list/domain/usecases/delete_test_plan.dart';
import '../features/module_list/presentation/bloc/module_bloc.dart';

// TEST PLANS
import '../features/test_execution/data/repositories/test_execution_repository_impl.dart';
import '../features/test_execution/domain/repositories/test_execution_repository.dart';
import '../features/test_execution/domain/usecases/export_to_file.dart';
import '../features/test_execution/domain/usecases/get_all_projects.dart';
import '../features/test_execution/domain/usecases/get_project_structure.dart';
import '../features/test_execution/domain/usecases/update_step_temp_status.dart';
import '../features/test_execution/presentation/bloc/test_execution_bloc.dart';
import '../features/test_plan_list/data/repositories/test_case_repository_impl.dart';
import '../features/test_plan_list/domain/repositories/test_case_repository.dart';
import '../features/test_plan_list/domain/usecases/get_test_cases_for_plan.dart';
import '../features/test_plan_list/domain/usecases/create_test_case.dart';
import '../features/test_plan_list/domain/usecases/update_test_case.dart';
import '../features/test_plan_list/domain/usecases/delete_test_case.dart';
import '../features/test_plan_list/presentation/bloc/test_plan_bloc.dart';

// TEST CASES / STEPS
import '../features/test_step_list/data/repository/test_step_repository_impl.dart';
import '../features/test_step_list/domain/repository/test_step_repository.dart';
import '../features/test_step_list/domain/usecases/get_teststeps_for_case.dart';
import '../features/test_step_list/domain/usecases/create_test_step.dart';
import '../features/test_step_list/domain/usecases/update_test_step.dart';
import '../features/test_step_list/domain/usecases/delete_test_step.dart';
import '../features/test_step_list/domain/usecases/update_test_step_order.dart';
import '../features/test_step_list/presentation/bloc/test_step_bloc.dart';

// COMMENTS
import '../features/comments/data/repository/comment_repository_impl.dart';
import '../features/comments/domain/repository/comment_repository.dart';
import '../features/comments/domain/usecases/add_comment.dart';
import '../features/comments/domain/usecases/delete_comment.dart';
import '../features/comments/domain/usecases/get_comments_for_case.dart';
import '../features/comments/presentation/bloc/comment_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  ///===========================
  /// DATABASE
  ///===========================
  final db = AppDatabase();
  sl.registerSingleton<AppDatabase>(db);

  sl.registerLazySingleton(() => ProjectDao(db));
  sl.registerLazySingleton(() => ModuleDao(db));
  sl.registerLazySingleton(() => TestPlansDao(db));
  sl.registerLazySingleton(() => TestCasesDao(db));
  sl.registerLazySingleton(() => TestStepsDao(db));
  sl.registerLazySingleton(() => CommentsDao(db));

  ///===========================
  /// PROJECTS
  ///===========================
  sl.registerLazySingleton<ProjectLocalDataSource>(
          () => ProjectLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<ProjectsRemoteDataSource>(
        () => ProjectsRemoteDataSourceImpl(
      graphClient: sl<GraphClient>(),
    ),
  );


  sl.registerLazySingleton<ProjectRepository>(
          () => ProjectRepositoryImpl(local: sl(), remote: sl()));

  sl.registerLazySingleton(() => GetAllProjects(sl()));
  sl.registerLazySingleton(() => CreateProject(sl()));
  sl.registerLazySingleton(() => UpdateProject(sl()));
  sl.registerLazySingleton(() => DeleteProject(sl()));

  sl.registerFactory(() => ProjectBloc(sl(), sl(), sl(), sl()));

  sl.registerLazySingleton<GraphClient>(
        () => GraphClient(
      dio: sl(),
      tokenProvider: () async => sl<AuthRepository>().getValidAccessToken(),
      siteId: GraphConfig.siteId,
      baseUrl: GraphConfig.baseUrl,
    ),
  );


  ///===========================
  /// MODULES
  ///===========================
  sl.registerLazySingleton<ModuleLocalDataSource>(
          () => ModuleLocalDataSourceImpl(sl(), sl()));
  sl.registerLazySingleton<ModuleRemoteDataSource>(
        () => ModuleRemoteDataSourceImpl(
      graphClient: sl<GraphClient>(),
    ),
  );


  sl.registerLazySingleton<ModuleRepository>(
          () => ModuleRepositoryImpl(local: sl(), remote: sl()));

  sl.registerLazySingleton(() => GetModulesForProject(sl()));
  sl.registerLazySingleton(() => GetSubmodulesForModule(sl()));
  sl.registerLazySingleton(() => GetTestPlansForModule(sl()));
  sl.registerLazySingleton(() => CreateModule(sl()));
  sl.registerLazySingleton(() => UpdateModule(sl()));
  sl.registerLazySingleton(() => DeleteModule(sl()));
  sl.registerLazySingleton(() => CreateTestPlan(sl()));
  sl.registerLazySingleton(() => UpdateTestPlan(sl()));
  sl.registerLazySingleton(() => DeleteTestPlan(sl()));

  sl.registerFactory(() => ModuleBloc(
    getModulesForProject: sl(),
    getSubmodulesForModule: sl(),
    getTestPlansForModule: sl(),
    saveVisitedModules: sl(),
    getVisitedModules: sl(),
    createModule: sl(),
    updateModule: sl(),
    deleteModule: sl(),
    createTestPlan: sl(),
    updateTestPlan: sl(),
    deleteTestPlan: sl(),
  ));

  ///===========================
  /// TEST CASE
  ///===========================
  sl.registerLazySingleton<TestCaseLocalDataSource>(
          () => TestCaseLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<TestCasesRemoteDataSource>(
        () => TestCasesRemoteDataSourceImpl(
      graphClient: sl<GraphClient>(),
    ),
  );
  sl.registerLazySingleton<TestCaseService>(
        () => TestCaseService(sl<TestStepRepository>()),
  );

  sl.registerLazySingleton<TestCaseRepository>(
          () => TestCaseRepositoryImpl(local: sl(), remote: sl()));

  sl.registerLazySingleton(() => GetTestCasesForPlan(sl(), sl()));
  sl.registerLazySingleton(() => CreateTestCase(sl()));
  sl.registerLazySingleton(() => UpdateTestCase(sl()));
  sl.registerLazySingleton(() => DeleteTestCase(sl()));

  sl.registerFactory(() => TestPlanBloc(
    getTestCasesForPlan: sl(),
    createTestCase: sl(),
    updateTestCase: sl(),
    deleteTestCase: sl(),
  ));

  ///===========================
  /// TEST STEP
  ///===========================
  sl.registerLazySingleton<TestStepLocalDataSource>(
          () => TestStepLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<TestStepRemoteDataSource>(
        () => TestStepRemoteDataSourceImpl(
      graphClient: sl<GraphClient>(),
    ),
  );



  sl.registerLazySingleton<TestStepRepository>(
        () => TestStepRepositoryImpl(
      local: sl<TestStepLocalDataSource>(),
      remote: sl<TestStepRemoteDataSource>(),
    ),
  );


  sl.registerLazySingleton(() => GetTestStepsForCase(sl()));
  sl.registerLazySingleton(() => CreateTestStep(sl()));
  sl.registerLazySingleton(() => UpdateTestStep(sl()));
  sl.registerLazySingleton(() => DeleteTestStep(sl()));
  sl.registerLazySingleton(() => UpdateTestStepOrder(sl()));

  sl.registerLazySingleton(
        () => RecalculateTestCaseProgress(
      stepRepo: sl<TestStepRepository>(),
      caseRepo: sl<TestCaseRepository>(),
    ),
  );

  sl.registerFactory(() => TestStepBloc(
    getTestStepsForCase: sl(),
    createTestStep: sl(),
    updateTestStep: sl(),
    deleteTestStep: sl(),
    updateTestStepOrder: sl(),
    recalcProgress: sl(),
  ));

  ///===========================
  /// COMMENTS
  ///===========================
  sl.registerLazySingleton<CommentRepository>(
        () => CommentRepositoryImpl(
      local: sl(),
      remote: sl(),
    ),
  );
  sl.registerLazySingleton<CommentsLocalDataSource>(
        () => CommentsLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<CommentsRemoteDataSource>(
        () => CommentsRemoteDataSourceImpl(
      graphClient: sl<GraphClient>(),
    ),
  );



  sl.registerLazySingleton(() => GetCommentsForCase(sl()));
  sl.registerLazySingleton(() => AddComment(sl()));
  sl.registerLazySingleton(() => DeleteComment(sl()));

  sl.registerFactory(() => CommentBloc(
    getCommentsForCase: sl(),
    addComment: sl(),
    deleteComment: sl(),
  ));

  ///===========================
  /// TEST EXECUTION
  ///===========================
  sl.registerLazySingleton<TestExecutionRepository>(
          () => TestExecutionRepositoryImpl(
        projectDao: sl(),
        moduleDao: sl(),
        testPlansDao: sl(),
        testCasesDao: sl(),
        testStepsDao: sl(),
        fileService: sl(),
      ));

  sl.registerLazySingleton(() => GetAllProjectsForTestsUseCase(sl()));
  sl.registerLazySingleton(() => GetProjectStructure(sl()));
  sl.registerLazySingleton(() => UpdateStepTempStatus(sl()));
  sl.registerLazySingleton(() => ExportToFile(sl()));

  sl.registerFactory(() => TestExecutionBloc(
    getAllProjectsUseCase: sl(),
    getProjectStructure: sl(),
    updateStepTempStatus: sl(),
    exportToFile: sl(),
  ));

  ///===========================
  /// NAVIGATION
  ///===========================
  sl.registerLazySingleton<NavigationRepository>(() => NavigationRepositoryImpl());
  sl.registerLazySingleton(() => SaveVisitedModules(sl()));
  sl.registerLazySingleton(() => GetVisitedModules(sl()));

  ///===========================
  /// UTILS
  ///===========================
  sl.registerLazySingleton<FileService>(() => FileService());
  sl.registerLazySingleton<Directory>(() => Directory.current);

  ///===========================
  /// AUTH
  ///===========================
  sl.registerLazySingleton<PkceService>(() => PkceService());
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  sl.registerLazySingleton<Dio>(() => Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  ));

  sl.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(
        remote: sl(),
        pkceService: sl(),
        secureStorage: sl(),
      ));

  sl.registerLazySingleton(() => LoginUseCase(sl()));

  sl.registerFactory(() => AuthBloc(
    authRepository: sl(),
    loginUseCase: sl(),
  ));
}