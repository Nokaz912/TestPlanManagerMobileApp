import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/UI/app_colors.dart';

import '../../domain/entities/test_plan.dart';
import '../bloc/module_bloc.dart';
import '../bloc/module_event.dart';

class TestPlanTile extends StatelessWidget {
  final TestPlanEntity plan;
  final String projectId;
  final String moduleId;
  final String? projectName;

  const TestPlanTile({
    super.key,
    required this.plan,
    required this.projectId,
    required this.moduleId,
    this.projectName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
          width: 1.3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          context.push(
            '/plans/${plan.id}',
            extra: {
              'projectId': projectId,
              'moduleId': moduleId,
              if (projectName != null) 'projectName': projectName!,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.assignment_turned_in_rounded,
                color: AppColors.warmBeige,
                size: 32,
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plan.name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      plan.description?.isNotEmpty == true
                          ? plan.description!
                          : "Brak opisu",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
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
                    child: Text(
                      "✏️ Edytuj",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text(
                      "🗑 Usuń",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openEditDialog(BuildContext context) {
    final nameCtrl = TextEditingController(text: plan.name);
    final descCtrl = TextEditingController(text: plan.description ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edytuj plan testów'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Nazwa'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: 'Opis'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              final desc = descCtrl.text.trim();
              if (name.isEmpty) return;

              final updated = TestPlanEntity(
                id: plan.id,
                name: name,
                description: desc.isEmpty ? null : desc,
                moduleId: plan.moduleId,
              );

              context.read<ModuleBloc>().add(
                ModuleEvent.updateTestPlan(plan: updated),
              );

              Navigator.pop(ctx);
            },
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Usuń plan testów'),
        content: Text('Czy na pewno chcesz usunąć "${plan.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ModuleBloc>().add(
                ModuleEvent.deleteTestPlan(testPlanId: plan.id),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Usuń'),
          ),
        ],
      ),
    );
  }
}
