import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/test_plan.dart';

class TestPlanTile extends StatelessWidget {
  final TestPlanEntity plan;

  const TestPlanTile({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(plan.name),
      subtitle: Text(plan.description ?? ''),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        context.go('/plans/${plan.id}');
      },
    );
  }
}
