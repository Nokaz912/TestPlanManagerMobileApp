import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/test_plan.dart';

class TestPlanTile extends StatelessWidget {
  final TestPlanEntity plan;
  final String projectId;
  final String moduleId;
  final String? projectName; // opcjonalnie, jeśli chcesz utrzymać tytuł

  const TestPlanTile({
    super.key,
    required this.plan,
    required this.projectId,
    required this.moduleId,
    this.projectName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(plan.name),
      subtitle: Text(plan.description ?? ''),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // 👇 UŻYJ push zamiast go — zachowa poprzedni ekran na stosie
        context.push(
          '/plans/${plan.id}',
          extra: {
            'projectId': projectId,
            'moduleId': moduleId,
            if (projectName != null) 'projectName': projectName!,
          },
        );
      },
    );
  }
}
