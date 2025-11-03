import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../dependency_injection/service_locator.dart';
import '../../features/module_list/presentation/bloc/module_bloc.dart';
import '../../features/module_list/presentation/bloc/module_event.dart';
import '../../features/module_list/presentation/pages/module_list_page.dart';
import '../../features/project_list/presentation/bloc/project_bloc.dart';
import '../../features/project_list/presentation/bloc/project_event.dart';
import '../../features/project_list/presentation/pages/project_list_page.dart';
import '../../features/test_case_list/presentation/bloc/test_case_bloc.dart';
import '../../features/test_case_list/presentation/bloc/test_case_event.dart';
import '../../features/test_case_list/presentation/pages/test_cases_list_page.dart';
import '../../features/test_plan_list/presentation/bloc/test_plan_bloc.dart';
import '../../features/test_plan_list/presentation/bloc/test_plan_event.dart';
import '../../features/test_plan_list/presentation/pages/test_plan_list_page.dart';


final GoRouter router = GoRouter(
  initialLocation: '/projects',
  routes: [
    GoRoute(
      path: '/projects',
      name: 'projects',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => sl<ProjectBloc>()..add(GetAllProjectsEvent()),
          child: const ProjectListPage(),
        );
      },
    ),

    GoRoute(
      path: '/modules/:projectId',
      name: 'modules',
      builder: (context, state) {
        final projectId = state.pathParameters['projectId']!;

        return BlocProvider(
          create: (_) => sl<ModuleBloc>()
            ..add(GetModulesForProjectEvent(projectId)),
          child: ModuleListPage(projectId: projectId),
        );
      },
    ),

    GoRoute(
      path: '/modules/:projectId/sub/:moduleId',
      name: 'submodules',
      builder: (context, state) {
        final projectId = state.pathParameters['projectId']!;
        final moduleId = state.pathParameters['moduleId']!;

        return BlocProvider(
          create: (_) => sl<ModuleBloc>()
            ..add(GetSubmodulesForModuleEvent(moduleId)),
          child: ModuleListPage(
            projectId: projectId,
            moduleId: moduleId,
          ),
        );
      },
    ),

    GoRoute(
      path: '/plans/:planId',
      name: 'testcases',
      builder: (context, state) {
        final planId = state.pathParameters['planId']!;
        return TestPlanListPage(planId: planId);
      },
    ),


    // GoRoute(
    //   path: '/cases/:planId',
    //   name: 'cases',
    //   builder: (context, state) {
    //     final planId = state.pathParameters['planId']!;
    //     return BlocProvider(
    //       create: (_) =>
    //       sl<TestCaseBloc>()..add(GetTestCasesForPlanEvent(planId)),
    //       child: TestCaseListPage(testPlanId: planId),
    //     );
    //   },
    // ),
  ],
);
