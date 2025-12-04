import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/features/module_list/presentation/bloc/module_state.dart';
import 'package:test_plan_manager_app/features/test_plan_list/domain/usecases/get_test_cases_for_plan.dart';
import 'package:test_plan_manager_app/features/test_plan_list/presentation/bloc/test_plan_bloc.dart';
import 'package:test_plan_manager_app/features/test_plan_list/presentation/bloc/test_plan_event.dart';
import 'package:test_plan_manager_app/features/test_step_list/presentation/bloc/test_step_bloc.dart';
import 'package:test_plan_manager_app/features/test_step_list/presentation/bloc/test_step_event.dart';

import '../../dependency_injection/service_locator.dart';

// PROJECTS
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/start_page.dart';

// COMMENTS
import '../../features/comments/presentation/bloc/comment_bloc.dart';
import '../../features/comments/presentation/bloc/comment_event.dart';
import '../../features/comments/presentation/pages/comment_page.dart';

// MODULES
import '../../features/module_list/presentation/bloc/module_bloc.dart';
import '../../features/module_list/presentation/bloc/module_event.dart';
import '../../features/module_list/presentation/pages/module_list_page.dart';
import '../../features/project_list/presentation/bloc/project_bloc.dart';
import '../../features/project_list/presentation/bloc/project_event.dart';
import '../../features/project_list/presentation/pages/project_list_page.dart';

// EXECUTION
import '../../features/test_execution/presentation/bloc/test_execution_bloc.dart';
import '../../features/test_execution/presentation/bloc/test_execution_event.dart';
import '../../features/test_execution/presentation/pages/execution_page.dart';
import '../../features/test_plan_list/presentation/pages/test_plan_list_page.dart';
import '../../features/test_step_list/presentation/pages/test_steps_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/start',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/start',
          builder: (context, state) => const StartPage(),
        ),

        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
      ],
    ),

    //------------------------------------------------------------
    // PROJECT LIST
    //------------------------------------------------------------
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

    //------------------------------------------------------------
    // MODULE LIST
    //------------------------------------------------------------
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(create: (_) => sl<ModuleBloc>(), child: child);
      },
      routes: [
        GoRoute(
          path: '/modules/:projectId',
          name: 'modules',
          builder: (context, state) {
            final projectId = state.pathParameters['projectId']!;
            final bloc = context.read<ModuleBloc>();

            final projectName = bloc.state.maybeMap(
              success:
                  (s) => s.projectName ?? (state.extra as String? ?? 'Modules'),
              orElse: () => state.extra as String? ?? 'Modules',
            );

            bloc.state.mapOrNull(
              initial: (_) {
                bloc.add(
                  ModuleEvent.getModulesForProject(
                    projectId: projectId,
                    projectName: projectName,
                  ),
                );
              },
            );

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

                final projectName = state.extra as String? ?? 'Modules';

                bloc.state.mapOrNull(
                  success: (s) {
                    final hasSubmodules =
                        s.submodules[moduleId]?.isNotEmpty ?? false;
                    final hasPlans = s.testPlans[moduleId]?.isNotEmpty ?? false;

                    if (!hasSubmodules && !hasPlans) {
                      bloc.add(
                        ModuleEvent.getSubmodulesForModule(moduleId: moduleId),
                      );
                    }
                  },
                );

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

    //------------------------------------------------------------
    // TEST PLAN LIST
    //------------------------------------------------------------
    GoRoute(
      path: '/plans/:planId',
      name: 'testcases',
      builder: (context, state) {
        final planId = state.pathParameters['planId']!;
        final extra = state.extra as Map<String, String>? ?? {};

        return BlocProvider(
          create: (_) => sl<TestPlanBloc>()
            ..add(TestPlanEvent.getTestCasesForPlan(planId: planId)),
          child: TestPlanListPage(
            planId: planId,
            projectId: extra['projectId'] ?? '',
            moduleId: extra['moduleId'] ?? '',
          ),
        );
      },
    ),


    //------------------------------------------------------------
    // TEST CASE STEPS
    //------------------------------------------------------------
    GoRoute(
      path: '/cases/:caseId/steps',
      name: 'teststeps',
      builder: (context, state) {
        final caseId = state.pathParameters['caseId']!;
        final extra = state.extra as Map<String, String>? ?? {};

        return BlocProvider(
          create: (_) => sl<TestStepBloc>()
            ..add(TestStepEvent.getTestStepsForCase(testCaseId: caseId)),
          child: TestCasePage(
            testCaseId: caseId,
            projectId: extra['projectId'] ?? '',
            moduleId: extra['moduleId'] ?? '',
            planId: extra['planId'] ?? '',
          ),
        );
      },
    ),


    //------------------------------------------------------------
    // COMMENTS
    //------------------------------------------------------------
    GoRoute(
      path: '/cases/:caseId/comments',
      name: 'comments',
      builder: (context, state) {
        final caseId = state.pathParameters['caseId']!;
        return BlocProvider(
          create:
              (_) => sl<CommentBloc>()..add(GetCommentsForCaseEvent(caseId)),
          child: CommentPage(testCaseId: caseId),
        );
      },
    ),

    //------------------------------------------------------------
    // EXECUTION ROOT — nowa wersja
    //------------------------------------------------------------
    GoRoute(
      path: '/execution',
      name: 'execution',
      builder: (context, state) {
        return BlocProvider(
          create:
              (_) =>
                  sl<TestExecutionBloc>()..add(GetAllProjectsForTestsEvent()),
          child: const ExecutionPage(),
        );
      },
    ),
  ],
);
