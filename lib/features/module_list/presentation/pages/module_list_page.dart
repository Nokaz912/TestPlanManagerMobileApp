import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/module_bloc.dart';
import '../bloc/module_state.dart';
import '../bloc/module_event.dart';
import '../widgets/build_path_bar.dart';
import '../widgets/module_tile.dart';
import '../widgets/test_plan_tile.dart';
import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';

class ModuleListPage extends StatefulWidget {
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
  State<ModuleListPage> createState() => _ModuleListPageState();
}

class _ModuleListPageState extends State<ModuleListPage> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            final bloc = context.read<ModuleBloc>();
            final current = List<String>.from(bloc.state.visitedModules);

            if (current.isEmpty) {
              bloc.add(SetVisitedPathEvent(widget.projectId, const []));
              context.go('/projects');
              return;
            }

            if (current.length == 1) {
              bloc.add(SetVisitedPathEvent(widget.projectId, const []));
              context.go('/projects');
              return;
            }

            current.removeLast();
            bloc.add(SetVisitedPathEvent(widget.projectId, current));

            final parentId = current.last;
            context.go('/modules/${widget.projectId}/sub/$parentId',
                extra: widget.projectName);
          },
        ),
      ),
      body: BlocBuilder<ModuleBloc, ModuleState>(
        builder: (context, state) {
          final modules = widget.moduleId == null
              ? state.modules
              : (state.submodules[widget.moduleId] ?? []);

          final testPlans = widget.moduleId != null
              ? (state.testPlans[widget.moduleId] ?? [])
              : const <TestPlanEntity>[];

          if (state.status == ModuleStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final filteredModules = modules
              .where((m) => m.name.toLowerCase().contains(searchQuery.toLowerCase()))
              .toList();

          final filteredPlans = testPlans
              .where((p) => p.name.toLowerCase().contains(searchQuery.toLowerCase()))
              .toList();

          final combinedEmpty =
              filteredModules.isEmpty && filteredPlans.isEmpty;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPathBar(context, state, widget.projectId),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Szukaj modułu lub planu testów',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() => searchQuery = value);
                  },
                ),
              ),

              const Divider(height: 1),

              Expanded(
                child: combinedEmpty
                    ? const Center(child: Text('Brak wyników'))
                    : ListView(
                  children: [
                    ...filteredModules.map((m) => ModuleTile(module: m)),
                    ...filteredPlans.map(
                          (p) => TestPlanTile(
                        plan: p,
                        projectId: widget.projectId,
                        moduleId: widget.moduleId ?? '',
                        projectName: widget.projectName,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: PopupMenuButton<String>(
        offset: const Offset(0, -56),
        icon: const Icon(Icons.add),
        onSelected: (value) {
          if (value == 'add_module') {
            _openCreateModuleDialog(context,
                projectId: widget.projectId, parentModuleId: widget.moduleId);
          } else if (value == 'add_plan' && widget.moduleId != null) {
            _openCreateTestPlanDialog(context, moduleId: widget.moduleId!);
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(value: 'add_module', child: Text('Dodaj moduł')),
          if (widget.moduleId != null)
            const PopupMenuItem(value: 'add_plan', child: Text('Dodaj plan testów')),
        ],
      ),
    );
  }

  void _openCreateModuleDialog(BuildContext context,
      {required String projectId, String? parentModuleId}) {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nowy moduł'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Nazwa'),
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: 'Opis'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              final desc = descCtrl.text.trim();
              if (name.isEmpty) return;

              final module = ModuleEntity(
                id: 'module_${DateTime.now().millisecondsSinceEpoch}',
                name: name,
                description: desc.isEmpty ? null : desc,
                projectId: projectId,
                parentModuleId: parentModuleId,
              );
              context.read<ModuleBloc>().add(CreateModuleEvent(module));
              Navigator.pop(ctx);
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }

  void _openCreateTestPlanDialog(BuildContext context, {required String moduleId}) {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nowy plan testów'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Nazwa'),
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: 'Opis'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              final desc = descCtrl.text.trim();
              if (name.isEmpty) return;

              final plan = TestPlanEntity(
                id: 'plan_${DateTime.now().millisecondsSinceEpoch}',
                name: name,
                description: desc.isEmpty ? null : desc,
                moduleId: moduleId,
              );
              context.read<ModuleBloc>().add(CreateTestPlanEvent(plan));
              Navigator.pop(ctx);
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
