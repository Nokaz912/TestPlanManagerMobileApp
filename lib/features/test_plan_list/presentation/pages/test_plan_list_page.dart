import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../test_plan_list/presentation/bloc/test_plan_bloc.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_event.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_state.dart';

import '../../../test_case_list/presentation/bloc/test_case_bloc.dart';
import '../../../test_case_list/presentation/bloc/test_case_event.dart';
import '../../../test_case_list/presentation/bloc/test_case_state.dart';

import '../../../test_case_list/presentation/widgets/test_case_tile.dart';

class TestPlanListPage extends StatelessWidget {
  final String moduleId;

  const TestPlanListPage({super.key, required this.moduleId});

  @override
  Widget build(BuildContext context) {
    // 1) Upewnij się, że plany dla modułu są załadowane
    context.read<TestPlanBloc>().add(GetTestPlansForModuleEvent(moduleId));

    return Scaffold(
      appBar: AppBar(title: const Text('Test Cases')),
      body: MultiBlocListener(
        listeners: [
          // 2) Gdy plany się załadują, dociągnij test case'y dla każdego planu
          BlocListener<TestPlanBloc, TestPlanState>(
            listenWhen: (prev, curr) => prev.status != curr.status,
            listener: (context, state) {
              if (state.status == TestPlanStatus.success && state.plans != null) {
                final plansForModule =
                state.plans!.where((p) => p.moduleId == moduleId);
                for (final plan in plansForModule) {
                  context
                      .read<TestCaseBloc>()
                      .add(GetTestCasesForPlanEvent(plan.id));
                }
              }
            },
          ),
        ],
        child: BlocBuilder<TestPlanBloc, TestPlanState>(
          builder: (context, planState) {
            // Ładowanie / błędy planów
            if (planState.status == TestPlanStatus.loading ||
                planState.status == TestPlanStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (planState.status == TestPlanStatus.failure) {
              return const Center(child: Text('Failed to load test plans'));
            }

            final plansForModule =
            (planState.plans ?? []).where((p) => p.moduleId == moduleId).toList();

            if (plansForModule.isEmpty) {
              return const Center(child: Text('No test plans found for this module'));
            }

            return BlocBuilder<TestCaseBloc, TestCaseState>(
              builder: (context, caseState) {
                // Ładowanie / błędy case'ów
                if (caseState.status == TestCaseStatus.loading &&
                    (caseState.testCases.isEmpty)) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (caseState.status == TestCaseStatus.failure) {
                  return const Center(child: Text('Failed to load test cases'));
                }

                // 3) Zbierz wszystkie case'y należące do planów tego modułu
                final planIds = plansForModule.map((p) => p.id).toSet();
                final cases = caseState.testCases
                    .where((c) => planIds.contains(c.planId))
                    .toList();

                if (cases.isEmpty) {
                  return const Center(child: Text('No test cases found'));
                }

                // 4) Render listy TestCaseTile
                return ListView.builder(
                  itemCount: cases.length,
                  itemBuilder: (context, index) {
                    final testCase = cases[index];
                    return TestCaseTile(testCase: testCase);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
