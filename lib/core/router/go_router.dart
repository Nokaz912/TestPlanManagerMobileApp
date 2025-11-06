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
import '../../features/test_case_list/presentation/pages/test_cases_page.dart';
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

    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (_) => sl<ModuleBloc>(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/modules/:projectId',
          name: 'modules',
          builder: (context, state) {
            final projectId = state.pathParameters['projectId']!;
            final projectName = state.extra as String? ?? 'Modules';
            final bloc = context.read<ModuleBloc>();

            if (bloc.state.modules.isEmpty) {
              bloc.add(GetModulesForProjectEvent(projectId));
            }

            return ModuleListPage(
              projectId: projectId,
              projectName: projectName,
            );
          },
          routes: [
            GoRoute(
              path: 'sub/:moduleId',
              name: 'submodules',
              builder: (context, state) {
                final projectId = state.pathParameters['projectId']!;
                final moduleId = state.pathParameters['moduleId']!;
                final bloc = context.read<ModuleBloc>();

                // ✅ Pobierz projectName z parent route (dziedziczenie)
                final projectName = state.extra as String? ?? 'Modules';

                final hasSubmodules =
                    bloc.state.submodules[moduleId]?.isNotEmpty ?? false;
                final hasPlans =
                    bloc.state.testPlans[moduleId]?.isNotEmpty ?? false;

                if (!hasSubmodules && !hasPlans) {
                  bloc.add(GetSubmodulesForModuleEvent(moduleId));
                }

                return ModuleListPage(
                  projectId: projectId,
                  projectName: projectName,
                  moduleId: moduleId,
                );
              },
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: '/plans/:planId',
      name: 'testcases',
      builder: (context, state) {
        final planId = state.pathParameters['planId']!;
        final extra = state.extra as Map<String, String>? ?? {};
        return TestPlanListPage(
          planId: planId,
          projectId: extra['projectId'] ?? '',
          moduleId: extra['moduleId'] ?? '',
        );
      },
    ),


    GoRoute(
      path: '/cases/:caseId/steps',
      name: 'teststeps',
      builder: (context, state) {
        final caseId = state.pathParameters['caseId']!;
        final extra = state.extra as Map<String, String>? ?? {};
        return TestCasePage(
          testCaseId: caseId,
          planId: extra['planId'] ?? '',
          moduleId: extra['moduleId'] ?? '',
          projectId: extra['projectId'] ?? '',
        );
      },
    ),
  ],
);
