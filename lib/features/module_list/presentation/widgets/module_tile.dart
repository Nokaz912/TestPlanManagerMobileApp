import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/UI/app_colors.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/visited_module.dart';

import '../bloc/module_bloc.dart';
import '../bloc/module_event.dart';
import '../bloc/module_state.dart';
import '../../../module_list/domain/entities/module.dart';
import 'preview_item.dart';

class ModuleTile extends StatefulWidget {
  final ModuleEntity module;

  const ModuleTile({super.key, required this.module});

  @override
  State<ModuleTile> createState() => _ModuleTileState();
}

class _ModuleTileState extends State<ModuleTile> {
  bool _isExpanded = false;

  void _togglePreview() {
    setState(() => _isExpanded = !_isExpanded);

    if (_isExpanded) {
      final bloc = context.read<ModuleBloc>();
      final id = widget.module.id;

      final hasPreview = bloc.state.maybeWhen(
        success: (_, submodules, testPlans, __, ___, ____) {
          final subs = submodules[id];
          final plans = testPlans[id];
          return (subs != null && subs.isNotEmpty) ||
              (plans != null && plans.isNotEmpty);
        },
        orElse: () => false,
      );

      if (!hasPreview) {
        bloc.add(ModuleEvent.loadPreviewForModule(moduleId: id));
      }
    }
  }

  void _openModule(BuildContext context) {
    final bloc = context.read<ModuleBloc>();
    final m = widget.module;

    bloc.add(
      ModuleEvent.pushVisited(
        module: VisitedModule(m.id, m.name),
      ),
    );

    context.go('/modules/${m.projectId}/sub/${m.id}');
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ModuleBloc>().state;
    final m = widget.module;

    final subs = state.maybeWhen(
      success: (_, submodules, __, ___, ____, ______) =>
      submodules[m.id] ?? const [],
      orElse: () => const [],
    );

    final plans = state.maybeWhen(
      success: (_, __, testPlans, ___, ____, ______) =>
      testPlans[m.id] ?? const [],
      orElse: () => const [],
    );

    final previewItems = [
      ...subs.map((s) => PreviewItem(name: s.name)),
      ...plans.map((p) => PreviewItem(name: p.name)),
    ].take(3).toList();

    return Card(
      color: AppColors.softViolet.withOpacity(0.25),
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: _togglePreview,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.folder_special_rounded,
                    color: AppColors.warmBeige,
                    size: 34,
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Text(
                      m.name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  PopupMenuButton<String>(
                    color: AppColors.softViolet.withOpacity(0.9),
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onSelected: (value) {
                      if (value == 'edit') _openEditDialog(context);
                      if (value == 'delete') _confirmDelete(context);
                    },
                    itemBuilder: (_) => const [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text("✏️ Edytuj", style: TextStyle(color: Colors.white)),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text("🗑 Usuń", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),

                  IconButton(
                    icon: const Icon(Icons.chevron_right, color: Colors.white),
                    onPressed: () => _openModule(context),
                    splashRadius: 20,
                  )
                ],
              ),

              if (m.description != null && m.description!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 4),
                  child: Text(
                    m.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ),

              AnimatedCrossFade(
                duration: const Duration(milliseconds: 260),
                crossFadeState:
                _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                firstChild: const SizedBox.shrink(),
                secondChild: Container(
                  margin: const EdgeInsets.only(left: 8, top: 8, bottom: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...previewItems.map(
                            (item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 7,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      if (subs.length + plans.length > 3)
                        TextButton(
                          onPressed: () => _openModule(context),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            foregroundColor: Colors.white.withOpacity(0.9),
                          ),
                          child: const Text(
                            'Zobacz więcej →',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openEditDialog(BuildContext context) {
    final nameCtrl = TextEditingController(text: widget.module.name);
    final descCtrl = TextEditingController(text: widget.module.description ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.softViolet.withOpacity(0.95),
        title: const Text("Edytuj moduł", style: TextStyle(color: Colors.white)),
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
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Anuluj", style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () {
              final updated = ModuleEntity(
                id: widget.module.id,
                name: nameCtrl.text.trim(),
                description: descCtrl.text.trim().isEmpty
                    ? null
                    : descCtrl.text.trim(),
                projectId: widget.module.projectId,
                parentModuleId: widget.module.parentModuleId,
              );

              context
                  .read<ModuleBloc>()
                  .add(ModuleEvent.updateModule(module: updated));
              Navigator.pop(ctx);
            },
            child: const Text("Zapisz"),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.softViolet.withOpacity(0.95),
        title: const Text("Usuń moduł", style: TextStyle(color: Colors.white)),
        content: Text(
          'Czy na pewno chcesz usunąć „${widget.module.name}”?',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Anuluj", style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<ModuleBloc>()
                  .add(ModuleEvent.deleteModule(moduleId: widget.module.id));
              Navigator.pop(ctx);
            },
            child: const Text("Usuń"),
          ),
        ],
      ),
    );
  }
}
