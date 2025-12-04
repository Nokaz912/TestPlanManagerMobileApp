import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/UI/app_colors.dart';

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
    final Color statusColor = _statusColor(testCase.status);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.10)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () async {
          await context.push(
            '/cases/${testCase.id}/steps',
            extra: {
              'planId': planId,
              'moduleId': moduleId,
              'projectId': projectId,
            },
          );
          context
              .read<TestPlanBloc>()
              .add(TestPlanEvent.getTestCasesForPlan(planId: planId));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              // ICON
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.bug_report_rounded,
                  color: statusColor,
                  size: 26,
                ),
              ),

              const SizedBox(width: 14),

              // TEXT CONTENT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TITLE
                    Text(
                      testCase.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // STATUS + STEPS
                    Row(
                      children: [
                        _buildStatusBadge(statusColor, testCase.status),
                        const SizedBox(width: 12),
                        Text(
                          "Kroki: ${testCase.passedSteps} / ${testCase.totalSteps}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // MENU
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

  Widget _buildStatusBadge(Color color, String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.22),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }

  // ───────────────────
  // Dialogs
  // ───────────────────

  void _openEditDialog(BuildContext context) {
    final titleCtrl = TextEditingController(text: testCase.title);
    final expectedCtrl =
    TextEditingController(text: testCase.expectedResult ?? "");

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.softViolet.withOpacity(0.95),
        title: const Text('Edytuj Test Case',
            style: TextStyle(color: Colors.white)),
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
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj', style: TextStyle(color: Colors.white70)),
          ),
          FilledButton(
            onPressed: () {
              final updated = TestCaseEntity(
                id: testCase.id,
                planId: testCase.planId,
                title: titleCtrl.text.trim(),
                expectedResult: expectedCtrl.text.trim().isEmpty
                    ? null
                    : expectedCtrl.text.trim(),
                status: testCase.status,
                assignedToUserId: testCase.assignedToUserId,
                lastModifiedUtc: DateTime.now().toUtc(),
                parentCaseId: testCase.parentCaseId,
                passedSteps: testCase.passedSteps,
                totalSteps: testCase.totalSteps,
              );

              context
                  .read<TestPlanBloc>()
                  .add(TestPlanEvent.updateTestCase(testCase: updated));

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
        backgroundColor: AppColors.softViolet.withOpacity(0.95),
        title: const Text('Usuń Test Case',
            style: TextStyle(color: Colors.white)),
        content: Text(
          'Czy na pewno chcesz usunąć „${testCase.title}”?',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj', style: TextStyle(color: Colors.white70)),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              context
                  .read<TestPlanBloc>()
                  .add(TestPlanEvent.deleteTestCase(id: testCase.id));

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
        return Colors.greenAccent;
      case 'Failed':
        return Colors.redAccent;
      case 'Blocked':
        return Colors.orangeAccent;
      case 'NotRun':
      case 'Pending':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }
}
