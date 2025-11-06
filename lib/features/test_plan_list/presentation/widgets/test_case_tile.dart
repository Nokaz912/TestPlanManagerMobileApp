import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/test_case.dart';

class TestCaseTile extends StatelessWidget {
  final TestCaseEntity testCase;
  final String projectId;
  final String moduleId;
  final String planId;

  const TestCaseTile({
    super.key,
    required this.testCase,
    required this.projectId,
    required this.moduleId,
    required this.planId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: ListTile(
        leading: const Icon(Icons.bug_report),
        title: Text(testCase.title),
        subtitle: Text('Status: ${testCase.status}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          context.push('/cases/${testCase.id}/steps', extra: {
            'planId': planId,
            'moduleId': moduleId,
            'projectId': projectId,
          });
        },
      ),
    );
  }
}
