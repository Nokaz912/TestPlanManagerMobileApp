import 'package:flutter/material.dart';
import '../../../test_case_list/presentation/pages/test_cases_list_page.dart';
import '../../../test_plan_list/domain/entities/test_plan.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TestCaseListPage(testPlanId: plan.id),
          ),
        );
      },
    );
  }
}
