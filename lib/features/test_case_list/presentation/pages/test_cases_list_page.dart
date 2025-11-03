import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../test_case_list/presentation/bloc/test_case_bloc.dart';
import '../../../test_case_list/presentation/bloc/test_case_event.dart';
import '../../../test_case_list/presentation/bloc/test_case_state.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_event.dart';

class TestCaseListPage extends StatelessWidget {
  final String testPlanId;

  const TestCaseListPage({super.key, required this.testPlanId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Cases')),
      body: BlocBuilder<TestCaseBloc, TestCaseState>(
        builder: (context, state) {
          if (state.status == TestCaseStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final cases = state.testCases
              .where((c) => c.planId == testPlanId)
              .toList();


          if (cases.isEmpty) {

            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: cases.length,
            itemBuilder: (context, index) {
              final testCase = cases[index];
              return ListTile(
                title: Text(testCase.title),
              );
            },
          );
        },
      ),
    );
  }
}
