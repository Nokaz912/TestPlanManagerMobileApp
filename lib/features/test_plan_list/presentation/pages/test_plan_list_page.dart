import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection/service_locator.dart';
import '../../domain/entities/test_plan.dart';
import '../bloc/test_plan_bloc.dart';
import '../bloc/test_plan_event.dart';
import '../bloc/test_plan_state.dart';

class TestPlanListPage extends StatelessWidget {
  const TestPlanListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TestPlanBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Test Plan Manager')),
        body: const TestPlanListView(),
      ),
    );
  }
}

class TestPlanListView extends StatelessWidget {
  const TestPlanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            context.read<TestPlanBloc>().add(const GetAllTestPlansEvent());
          },
          child: const Text('Pobierz plany testowe'),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<TestPlanBloc, TestPlanState>(
            builder: (context, state) {
              if (state.status == TestPlanStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == TestPlanStatus.failure) {
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Wystąpił błąd',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              if (state.status == TestPlanStatus.success) {
                final plans = state.plans ?? [];

                if (plans.isEmpty) {
                  return const Center(child: Text('Brak planów testowych.'));
                }

                return ListView.builder(
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    final TestPlanEntity plan = plans[index];
                    return ListTile(
                      leading: const Icon(Icons.assignment),
                      title: Text(plan.name),
                      subtitle: Text(plan.description ?? 'Brak opisu'),
                    );
                  },
                );
              }

              return const Center(
                child: Text('Kliknij przycisk, aby pobrać plany testowe'),
              );
            },
          ),
        ),
      ],
    );
  }
}
