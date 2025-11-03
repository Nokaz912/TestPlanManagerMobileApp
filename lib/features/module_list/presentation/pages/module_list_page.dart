import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../module_list/presentation/bloc/module_bloc.dart';
import '../../../module_list/presentation/bloc/module_state.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_bloc.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_event.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_state.dart';
import '../../../test_plan_list/presentation/widgets/test_plan_tile.dart';
import '../bloc/module_event.dart';
import '../widgets/module_tile.dart';

class ModuleListPage extends StatelessWidget {
  final String projectId;
  final String? moduleId;

  const ModuleListPage({
    super.key,
    required this.projectId,
    this.moduleId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          moduleId == null ? 'Modules' : 'Submodules & Test Plans',
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ModuleBloc, ModuleState>(
            listenWhen: (prev, curr) => prev.status != curr.status,
            listener: (context, state) {
              if (state.status == ModuleStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to load modules')),
                );
              }
            },
          ),
          BlocListener<TestPlanBloc, TestPlanState>(
            listenWhen: (prev, curr) => prev.status != curr.status,
            listener: (context, state) {
              if (state.status == TestPlanStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to load test plans')),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<ModuleBloc, ModuleState>(
          builder: (context, moduleState) {
            // 🔹 wybieramy moduły zależnie od poziomu
            final modules = moduleId == null
                ? moduleState.modules
                : (moduleState.submodules[moduleId] ?? []);

            return BlocBuilder<TestPlanBloc, TestPlanState>(
              builder: (context, planState) {
                final testPlans = (planState.plans ?? [])
                    .where((p) => p.moduleId == moduleId)
                    .toList();

                // 🔹 obsługa stanów ładowania
                if (moduleState.status == ModuleStatus.loading ||
                    planState.status == TestPlanStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // 🔹 brak danych
                if (modules.isEmpty && testPlans.isEmpty) {
                  return const Center(child: Text('No data found'));
                }

                // 🔹 lista modułów i test planów
                return RefreshIndicator(
                  onRefresh: () async {
                    if (moduleId == null) {
                      context
                          .read<ModuleBloc>()
                          .add(GetModulesForProjectEvent(projectId));
                    } else {
                      context
                          .read<ModuleBloc>()
                          .add(GetSubmodulesForModuleEvent(moduleId!));
                      context
                          .read<TestPlanBloc>()
                          .add(GetTestPlansForModuleEvent(moduleId!));
                    }
                  },
                  child: ListView(
                    children: [
                      ...modules.map((m) => ModuleTile(module: m)),
                      ...testPlans.map((p) => TestPlanTile(plan: p)),
                    ],
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
