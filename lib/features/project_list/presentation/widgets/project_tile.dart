// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/UI/app_colors.dart';
import 'package:test_plan_manager_app/features/project_list/domain/entities/project.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_event.dart';

class ProjectTile extends StatelessWidget {
  final ProjectEntity project;

  const ProjectTile({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.softViolet.withOpacity(0.55),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.go('/modules/${project.id}', extra: project.name),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.dashboard_customize_rounded,
                color: AppColors.warmBeige,
                size: 32,
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      project.description?.isNotEmpty == true
                          ? project.description!
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
                  if (value == 'edit') _showEditDialog(context);
                  if (value == 'delete') _showDeleteDialog(context);
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
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final nameController = TextEditingController(text: project.name);
    final descController = TextEditingController(text: project.description ?? '');

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: AppColors.softViolet.withOpacity(0.9),
          title: const Text(
            'Edytuj projekt',
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Nazwa projektu',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descController,
                maxLines: 3,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Opis projektu',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Anuluj', style: TextStyle(color: Colors.white70)),
            ),
            FilledButton(
              onPressed: () {
                final updated = ProjectEntity(
                  id: project.id,
                  name: nameController.text.trim(),
                  description: descController.text.trim().isEmpty
                      ? null
                      : descController.text.trim(),
                  createdAtUtc: project.createdAtUtc,
                );

                context.read<ProjectBloc>().add(
                  ProjectEvent.update(project: updated),
                );

                Navigator.pop(ctx);
              },
              child: const Text('Zapisz'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: AppColors.softViolet.withOpacity(0.9),
          title: const Text('Usuń projekt', style: TextStyle(color: Colors.white)),
          content: Text(
            'Czy na pewno chcesz usunąć projekt "${project.name}"?',
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Anuluj', style: TextStyle(color: Colors.white70)),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                context.read<ProjectBloc>().add(
                  ProjectEvent.delete(id: project.id),
                );
                Navigator.pop(ctx);
              },
              child: const Text('Usuń'),
            ),
          ],
        );
      },
    );
  }
}
