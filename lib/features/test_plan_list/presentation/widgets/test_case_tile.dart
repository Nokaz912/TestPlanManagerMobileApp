import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_bloc.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_event.dart';
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
    final color = _statusColor(testCase.status);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.bug_report, color: color),
        title: Text(
          testCase.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Row(
          children: [
            const Text('Status: '),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                testCase.status,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (v) {
            if (v == 'edit') _openEditDialog(context);
            if (v == 'delete') _confirmDelete(context);
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'edit', child: Text('Edytuj')),
            PopupMenuItem(value: 'delete', child: Text('Usuń')),
          ],
        ),
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

  void _openEditDialog(BuildContext context) {
    final titleCtrl = TextEditingController(text: testCase.title);
    final expectedCtrl =
    TextEditingController(text: testCase.expectedResult ?? '');
    String current = testCase.status;

    final statuses = const ['Pending', 'NotRun', 'Passed', 'Failed', 'Blocked'];

    if (!statuses.contains(current)) {
      current = 'Pending';
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edytuj Test Case'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: 'Tytuł'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: expectedCtrl,
              decoration:
              const InputDecoration(labelText: 'Oczekiwany rezultat'),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: current,
              decoration: const InputDecoration(labelText: 'Status'),
              items: statuses.map((s) {
                return DropdownMenuItem<String>(
                  value: s,
                  child: Text(
                    switch (s) {
                      'Passed' => '✅ Passed',
                      'Failed' => '❌ Failed',
                      'Blocked' => '⛔ Blocked',
                      'NotRun' => '⚪ Not Run',
                      'Pending' => '🕓 Pending',
                      _ => s,
                    },
                  ),
                );
              }).toList(),
              onChanged: (v) => current = v ?? testCase.status,
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
              final title = titleCtrl.text.trim();
              if (title.isEmpty) return;

              final updated = testCase.copyWith(
                title: title,
                expectedResult: expectedCtrl.text.trim().isEmpty
                    ? null
                    : expectedCtrl.text.trim(),
                status: current,
                lastModifiedUtc: DateTime.now().toUtc(),
              );

              context.read<TestPlanBloc>().add(UpdateTestCaseEvent(updated));
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
        title: const Text('Usuń Test Case'),
        content: Text('Czy na pewno chcesz usunąć „${testCase.title}”?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TestPlanBloc>().add(DeleteTestCaseEvent(testCase.id));
              Navigator.pop(ctx);
            },
            child: const Text('Usuń'),
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Passed':
        return Colors.green;
      case 'Failed':
        return Colors.red;
      case 'Blocked':
        return Colors.orange;
      case 'NotRun':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }
}
