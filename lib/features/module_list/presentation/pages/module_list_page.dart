import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/module_bloc.dart';
import '../bloc/module_state.dart';
import '../bloc/module_event.dart';
import '../widgets/build_path_bar.dart';
import '../widgets/module_tile.dart';
import '../widgets/test_plan_tile.dart';

class ModuleListPage extends StatelessWidget {
  final String projectId;
  final String? moduleId;
  final String projectName;

  const ModuleListPage({
    super.key,
    required this.projectId,
    required this.projectName,
    this.moduleId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            final bloc = context.read<ModuleBloc>();
            final visited = List<String>.from(bloc.state.visitedModules);

            if (visited.isNotEmpty) {
              visited.removeLast();
              bloc.add(UpdateVisitedModulesEvent(visited));

              // 🔹 Cofnięcie o jeden poziom w strukturze modułów
              if (visited.isNotEmpty) {
                final parentId = visited.last;
                context.go(
                  '/modules/$projectId/sub/$parentId',
                  extra: projectName,
                );
              } else {
                // 🔹 Brak rodzica → wracamy do listy głównych modułów projektu
                context.go('/modules/$projectId', extra: projectName);
              }
            } else {
              // 🔹 Root → wracamy do listy projektów
              context.go('/projects');
            }
          },
        ),
      ),
      body: BlocBuilder<ModuleBloc, ModuleState>(
        builder: (context, state) {
          final modules = moduleId == null
              ? state.modules
              : (state.submodules[moduleId] ?? []);
          final testPlans =
          moduleId != null ? (state.testPlans[moduleId] ?? []) : const [];

          if (state.status == ModuleStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Pasek ścieżki zawsze widoczny (nawet przy braku danych)
              buildPathBar(context, state, projectId),

              const Divider(height: 1),

              Expanded(
                child: (modules.isEmpty && testPlans.isEmpty)
                    ? const Center(child: Text('No data found'))
                    : ListView(
                  children: [
                    // 🔹 Moduły
                    ...modules.map(
                          (m) => ModuleTile(module: m),
                    ),
                    // 🔹 Test plany (teraz przekazujemy projectId + moduleId)
                    ...testPlans.map(
                          (p) => TestPlanTile(
                        plan: p,
                        projectId: projectId,
                        moduleId: moduleId ?? '',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
