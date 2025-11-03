import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../module_list/presentation/pages/module_list_page.dart';
import '../../domain/entities/project.dart';

class ProjectTile extends StatelessWidget {
  final ProjectEntity project;

  const ProjectTile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(project.name),
      subtitle: Text(project.description ?? ''),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.go('/modules/${project.id}', extra: project.name),
    );
  }
}
