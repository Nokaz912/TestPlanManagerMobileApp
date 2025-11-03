import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../module_list/domain/entities/module.dart';
import '../../../test_plan_list/presentation/pages/test_plan_list_page.dart';

class ModuleTile extends StatelessWidget {
  final ModuleEntity module;

  const ModuleTile({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(module.name),
      subtitle: Text(module.description ?? ''),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.go('/modules/${module.projectId}/sub/${module.id}'),
    );
  }
}
