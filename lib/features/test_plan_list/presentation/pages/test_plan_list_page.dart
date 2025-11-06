import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../dependency_injection/service_locator.dart' as di;
import '../../../test_plan_list/presentation/bloc/test_plan_bloc.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_event.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_state.dart';
import '../widgets/test_case_tile.dart';

class TestPlanListPage extends StatelessWidget {
  final String planId;
  final String moduleId;
  final String projectId;

  const TestPlanListPage({
    super.key,
    required this.planId,
    required this.moduleId,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<TestPlanBloc>()..add(GetTestCasesForPlanEvent(planId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test Cases'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Back',
            onPressed: () {
              // 🔹 Naturalny powrót o jeden poziom wstecz (do modułu)
              context.pop();
            },
          ),
        ),
        body: BlocListener<TestPlanBloc, TestPlanState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: (context, state) {
            if (state.status == TestPlanStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage ?? 'Failed to load test cases',
                  ),
                ),
              );
            }
          },
          child: BlocBuilder<TestPlanBloc, TestPlanState>(
            builder: (context, state) {
              if (state.status == TestPlanStatus.loading ||
                  state.status == TestPlanStatus.initial) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == TestPlanStatus.failure) {
                return Center(
                  child: Text(state.errorMessage ?? 'Error loading test cases'),
                );
              }

              final cases = state.testCases;
              if (cases.isEmpty) {
                return const Center(child: Text('No test cases found'));
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<TestPlanBloc>().add(GetTestCasesForPlanEvent(planId));
                },
                child: ListView.builder(
                  itemCount: cases.length,
                  itemBuilder: (context, index) {
                    final testCase = cases[index];
                    return TestCaseTile(
                      testCase: testCase,
                      projectId: projectId,
                      moduleId: moduleId,
                      planId: planId,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
