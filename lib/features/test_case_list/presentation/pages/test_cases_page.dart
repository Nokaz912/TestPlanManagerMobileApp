import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../dependency_injection/service_locator.dart' as di;
import '../bloc/test_case_bloc.dart';
import '../bloc/test_case_event.dart';
import '../bloc/test_case_state.dart';

class TestCasePage extends StatelessWidget {
  final String testCaseId;
  final String planId;
  final String moduleId;
  final String projectId;

  const TestCasePage({
    super.key,
    required this.testCaseId,
    required this.planId,
    required this.moduleId,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<TestStepBloc>()
        ..add(GetTestStepsForCaseEvent(testCaseId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test Case Steps'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Back',
            onPressed: () => context.pop(),
          ),
        ),
        body: BlocBuilder<TestStepBloc, TestStepState>(
          builder: (context, state) {
            if (state.status == TestStepStatus.loading ||
                state.status == TestStepStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == TestStepStatus.failure) {
              return Center(
                child: Text(
                  state.errorMessage ?? 'Nie udało się pobrać kroków testowych',
                ),
              );
            }

            final steps = state.steps;

            if (steps.isEmpty) {
              return const Center(child: Text('Brak kroków testowych'));
            }

            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: steps.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final step = steps[index];
                final color = switch (step.status) {
                  'Passed' => Colors.green,
                  'Failed' => Colors.red,
                  'Blocked' => Colors.orange,
                  'NotRun' => Colors.grey,
                  _ => Colors.blueGrey,
                };

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: color.withOpacity(0.15),
                    child: Text(
                      step.stepNumber.toString(),
                      style: TextStyle(color: color),
                    ),
                  ),
                  title: Text(
                    step.description,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: step.expected != null && step.expected!.isNotEmpty
                      ? Text('Oczekiwany wynik: ${step.expected}')
                      : null,
                  trailing: Text(
                    step.status,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
