import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../dependency_injection/service_locator.dart' as di;
import '../../../test_plan_list/presentation/bloc/test_plan_bloc.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_event.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_state.dart';
import '../widgets/test_case_tile.dart';
import '../../domain/entities/test_case.dart';

class TestPlanListPage extends StatelessWidget {
  final String planId;
  final String moduleId;
  final String projectId;

  const TestPlanListPage({
    super.key,
    required this.planId,
    required this.moduleId,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestPlanBloc>(
      create: (context) =>
      di.sl<TestPlanBloc>()..add(GetTestCasesForPlanEvent(planId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test Cases'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Back',
            onPressed: () => Navigator.pop(context),
          ),
        ),

        floatingActionButton: Builder(
          builder: (innerContext) => FloatingActionButton.extended(
            onPressed: () => _openCreateCaseDialog(innerContext),
            icon: const Icon(Icons.add),
            label: const Text('Nowy test case'),
          ),
        ),

        body: BlocBuilder<TestPlanBloc, TestPlanState>(
          builder: (context, state) {
            if (state.status == TestPlanStatus.loading ||
                state.status == TestPlanStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == TestPlanStatus.failure) {
              return Center(
                child: Text(
                  state.errorMessage ?? 'Błąd ładowania test case\'ów',
                ),
              );
            }

            final testCases = state.testCases;
            if (testCases.isEmpty) {
              return const Center(child: Text('Brak przypadków testowych'));
            }
            
            final total = testCases.length;
            final passed = testCases.where((c) => c.status == 'Passed').length;
            final failed = testCases.where((c) => c.status == 'Failed').length;
            final blocked = testCases.where((c) => c.status == 'Blocked').length;
            final notRun = testCases
                .where((c) => c.status == 'NotRun' || c.status == 'Pending')
                .length;
            final progress = total > 0 ? passed / total : 0.0;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<TestPlanBloc>().add(GetTestCasesForPlanEvent(planId));
              },
              child: Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Postęp testów',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: progress,
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green,
                              backgroundColor: Colors.grey.shade300,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('✅ Passed: $passed',
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 13)),
                                Text('❌ Failed: $failed',
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 13)),
                                Text('⛔ Blocked: $blocked',
                                    style: const TextStyle(
                                        color: Colors.orange, fontSize: 13)),
                                Text('⚪ NotRun: $notRun',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Razem: $passed / $total ukończonych',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const Divider(height: 0),

                  // ✅ Lista test case’ów
                  Expanded(
                    child: ListView.builder(
                      itemCount: testCases.length,
                      itemBuilder: (context, index) {
                        final testCase = testCases[index];
                        return TestCaseTile(
                          testCase: testCase,
                          projectId: projectId,
                          moduleId: moduleId,
                          planId: planId,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _openCreateCaseDialog(BuildContext context) {
    final titleCtrl = TextEditingController();
    final expectedCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nowy przypadek testowy'),
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
              decoration: const InputDecoration(labelText: 'Oczekiwany wynik'),
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

              final newCase = TestCaseEntity(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                planId: planId,
                title: title,
                status: 'Pending',
                expectedResult: expectedCtrl.text.trim().isNotEmpty
                    ? expectedCtrl.text.trim()
                    : null,
                assignedToUserId: null,
                lastModifiedUtc: DateTime.now().toUtc(),
                parentCaseId: null,
              );

              context.read<TestPlanBloc>().add(CreateTestCaseEvent(newCase));
              Navigator.pop(ctx);
            },
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }
}
