import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/module_bloc.dart';
import '../bloc/module_event.dart';
import '../bloc/module_state.dart';
import '../widgets/module_tile.dart';
import '../widgets/test_plan_tile.dart';

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
        title: Text(moduleId == null ? 'Modules' : 'Submodules & Test Plans'),
      ),
      body: BlocListener<ModuleBloc, ModuleState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status == ModuleStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Failed to load data')),
            );
          }
        },
        child: BlocBuilder<ModuleBloc, ModuleState>(
          builder: (context, state) {
            final modules = moduleId == null
                ? state.modules
                : (state.submodules[moduleId] ?? []);

            final testPlans = moduleId != null
                ? (state.testPlans[moduleId] ?? [])
                : const [];

            if (state.status == ModuleStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (modules.isEmpty && testPlans.isEmpty) {
              return const Center(child: Text('No data found'));
            }

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
        ),
      ),
    );
  }
}
