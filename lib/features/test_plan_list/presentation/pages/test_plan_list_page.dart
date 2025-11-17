import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../dependency_injection/service_locator.dart' as di;
import '../../../test_plan_list/presentation/bloc/test_plan_bloc.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_event.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_state.dart';
import '../widgets/test_case_tile.dart';
import '../../domain/entities/test_case.dart';

enum TestCaseSortMode { none, newest, oldest }

class TestPlanListPage extends StatefulWidget {
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
  State<TestPlanListPage> createState() => _TestPlanListPageState();
}

class _TestPlanListPageState extends State<TestPlanListPage> {
  String searchQuery = "";
  TestCaseSortMode sortMode = TestCaseSortMode.none;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestPlanBloc>(
      create: (_) =>
      di.sl<TestPlanBloc>()..add(GetTestCasesForPlanEvent(widget.planId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test Cases'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
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
                child: Text(state.errorMessage ?? 'Błąd ładowania test case\'ów'),
              );
            }

            final allCases = state.testCases;

            List<TestCaseEntity> filtered = allCases
                .where((c) =>
                c.title.toLowerCase().contains(searchQuery.toLowerCase()))
                .toList();

            if (sortMode == TestCaseSortMode.newest) {
              filtered.sort((a, b) =>
                  (b.lastModifiedUtc ?? DateTime(0))
                      .compareTo(a.lastModifiedUtc ?? DateTime(0)));
            } else if (sortMode == TestCaseSortMode.oldest) {
              filtered.sort((a, b) =>
                  (a.lastModifiedUtc ?? DateTime(0))
                      .compareTo(b.lastModifiedUtc ?? DateTime(0)));
            }

            final total = allCases.length;
            final passed = allCases.where((c) => c.status == 'Passed').length;
            final failed = allCases.where((c) => c.status == 'Failed').length;
            final blocked = allCases.where((c) => c.status == 'Blocked').length;
            final notRun = allCases
                .where((c) => c.status == 'NotRun' || c.status == 'Pending')
                .length;
            final progress = total > 0 ? passed / total : 0.0;

            return RefreshIndicator(
              onRefresh: () async => context
                  .read<TestPlanBloc>()
                  .add(GetTestCasesForPlanEvent(widget.planId)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                    child: Row(
                      children: [
                        // 🔍 SEARCH FIELD (flex = 3)
                        Expanded(
                          flex: 3,
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: "Szukaj",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                            ),
                            onChanged: (value) {
                              setState(() => searchQuery = value);
                            },
                          ),
                        ),

                        const SizedBox(width: 12),

                        // 🔽 SORT DROPDOWN (flex = 2)
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButton<TestCaseSortMode>(
                              value: sortMode,
                              underline: const SizedBox(),
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                  value: TestCaseSortMode.none,
                                  child: Text("Brak"),
                                ),
                                DropdownMenuItem(
                                  value: TestCaseSortMode.newest,
                                  child: Text("Najnowsze"),
                                ),
                                DropdownMenuItem(
                                  value: TestCaseSortMode.oldest,
                                  child: Text("Najstarsze"),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() => sortMode = value!);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: filtered.isEmpty
                        ? const Center(child: Text("Brak wyników"))
                        : ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final testCase = filtered[index];
                        return TestCaseTile(
                          testCase: testCase,
                          projectId: widget.projectId,
                          moduleId: widget.moduleId,
                          planId: widget.planId,
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
                planId: widget.planId,
                title: title,
                status: 'Pending',
                expectedResult:
                expectedCtrl.text.trim().isNotEmpty ? expectedCtrl.text : null,
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
