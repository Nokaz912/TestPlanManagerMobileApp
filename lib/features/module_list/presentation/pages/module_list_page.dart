import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/UI/app_colors.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/visited_module.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.06),
          elevation: 0,
          centerTitle: true,
          title: Text(
            context.watch<ModuleBloc>().state.maybeWhen(
              success: (_, __, ___, ____, _____, projectName) =>
              projectName ?? widget.projectName,
              orElse: () => widget.projectName,
            ),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () => _onBackPressed(context),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTapDown: (details) {
                  final position = RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    MediaQuery.of(context).size.width - details.globalPosition.dx,
                    0,
                  );

                  showMenu(
                    context: context,
                    position: position,
                    color: AppColors.softViolet.withOpacity(0.92),
                    items: [
                      const PopupMenuItem(
                        value: 'add_module',
                        child: Text(
                          "➕ Dodaj moduł",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      if (widget.moduleId != null)
                        const PopupMenuItem(
                          value: 'add_plan',
                          child: Text(
                            "📄 Dodaj plan testów",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                    ],
                  ).then((value) {
                    if (value == 'add_module') _openCreateModuleDialog(context);
                    if (value == 'add_plan') _openCreatePlanDialog(context);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.warmBeige,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.warmBeige.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: AppColors.darkNavy,
                    size: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(26),
            ),
          ),
        ),
        body: BlocBuilder<ModuleBloc, ModuleState>(
          builder: (context, state) {
            return state.when(
              initial: _renderLoading,
              loading: _renderLoading,
              failure: _renderFailure,
              success: (modules, sub, plans, visited, _, __) {
                return _renderSuccess(
                  context: context,
                  modules: widget.moduleId == null
                      ? modules
                      : (sub[widget.moduleId] ?? const []),
                  testPlans: widget.moduleId != null
                      ? (plans[widget.moduleId] ?? const [])
                      : const [],
                  visited: visited,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _renderLoading() => const Center(child: CircularProgressIndicator());

  Widget _renderFailure(String msg) =>
      Center(child: Text(msg, style: const TextStyle(fontSize: 16)));

  Widget _renderSuccess({
    required BuildContext context,
    required List<ModuleEntity> modules,
    required List<TestPlanEntity> testPlans,
    required List<VisitedModule> visited,
  }) {
    final filteredModules = modules
        .where((m) => m.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    final filteredPlans = testPlans
        .where((p) => p.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    final empty = filteredModules.isEmpty && filteredPlans.isEmpty;

    return Column(
      children: [
        buildPathBar(context, visited, widget.projectId),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Szukaj modułu lub planu testów",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.65)),
              prefixIcon: Icon(Icons.search_rounded, color: Colors.white.withOpacity(0.9)),
              filled: true,
              fillColor: Colors.white.withOpacity(0.10),
              contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.25)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: AppColors.warmBeige, width: 1.7),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
            ),
            onChanged: (v) => setState(() => searchQuery = v),
          ),
        ),
        Expanded(
          child: empty
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
  }

  void _onBackPressed(BuildContext context) {
    final bloc = context.read<ModuleBloc>();
    final state = bloc.state;

    if (state is! ModuleSuccess) {
      context.go('/projects');
      return;
    }

    final visited = List<VisitedModule>.from(state.visitedModules);

    if (visited.isEmpty || visited.length == 1) {
      bloc.add(const ModuleEvent.resetVisited());
      context.go('/projects');
      return;
    }

    bloc.add(const ModuleEvent.popVisited());

    visited.removeLast();
    final parent = visited.last;

    context.go(
      '/modules/${widget.projectId}/sub/${parent.id}',
      extra: widget.projectName,
    );
  }

  void _openCreateModuleDialog(BuildContext ctx) {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: ctx,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Nowy moduł'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl),
            TextField(controller: descCtrl),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;

              ctx.read<ModuleBloc>().add(
                ModuleEvent.createModule(
                  module: ModuleEntity(
                    id: 'module_${DateTime.now().millisecondsSinceEpoch}',
                    name: name,
                    description: descCtrl.text.trim().isEmpty
                        ? null
                        : descCtrl.text,
                    projectId: widget.projectId,
                    parentModuleId: widget.moduleId,
                  ),
                ),
              );

              Navigator.pop(dialogCtx);
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }

  void _openCreatePlanDialog(BuildContext ctx) {
    final nameCtrl = TextEditingController();

    showDialog(
      context: ctx,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Nowy plan testów'),
        content: TextField(controller: nameCtrl),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;

              ctx.read<ModuleBloc>().add(
                ModuleEvent.createTestPlan(
                  plan: TestPlanEntity(
                    id: 'plan_${DateTime.now().millisecondsSinceEpoch}',
                    name: name,
                    moduleId: widget.moduleId!,
                  ),
                ),
              );

              Navigator.pop(dialogCtx);
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
