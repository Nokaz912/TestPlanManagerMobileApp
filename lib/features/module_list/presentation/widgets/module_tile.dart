import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
      final state = bloc.state;
      final id = widget.module.id;
      final hasPreview =
          (state.submodules[id]?.isNotEmpty ?? false) || (state.testPlans[id]?.isNotEmpty ?? false);
      if (!hasPreview) {
        bloc.add(LoadPreviewForModuleEvent(id));
      }
    }
  }

  void _goToModule() {
    final m = widget.module;
    context.go('/modules/${m.projectId}/sub/${m.id}');
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ModuleBloc>().state;
    final m = widget.module;

    final submodules = state.submodules[m.id] ?? [];
    final testPlans = state.testPlans[m.id] ?? [];
    final preview = [
      ...submodules.map((s) => PreviewItem(name: s.name)),
      ...testPlans.map((p) => PreviewItem(name: p.name)),
    ].take(3).toList();

    const double indent = 22; // ~połowa szerokości słowa „Moduł” w tytule

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                onTap: _togglePreview,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    if ((m.description ?? '').isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        m.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 180),
                      crossFadeState:
                      _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      firstChild: const SizedBox.shrink(),
                      secondChild: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // wcięcie preview ma być małe i startować pod opisem
                            Padding(
                              padding: const EdgeInsets.only(left: indent),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...preview.map(
                                        (item) => GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: _goToModule, // klik w element preview -> wejście do modułu
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Text(
                                          '• ${item.name}',
                                          style: const TextStyle(fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (submodules.length + testPlans.length > 3)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(0, 24),
                                          tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: _goToModule,
                                        child: const Text('See more'),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // PRAWA CZĘŚĆ: strzałka (tap = wejście do modułu)
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: _goToModule,
              splashRadius: 22,
            ),
          ],
        ),
      ),
    );
  }
}
