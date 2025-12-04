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
    return Scaffold(
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
            return state.when(
              initial: () => _buildLoading(),
              loading: () => _buildLoading(),
              failure: (errorMessage) => _buildFailure(errorMessage),
              success: (testCases) => _buildSuccess(context, testCases),
            );
          },
        ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildFailure(String message) {
    return Center(
      child: Text(message, style: const TextStyle(fontSize: 16.0)),
    );
  }

  Widget _buildSuccess(BuildContext context, List<TestCaseEntity> allCases) {
    List<TestCaseEntity> filtered = allCases
        .where((c) => c.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    if (sortMode == TestCaseSortMode.newest) {
      filtered.sort((a, b) =>
          (b.lastModifiedUtc ?? DateTime(0)).compareTo(a.lastModifiedUtc ?? DateTime(0)));
    } else if (sortMode == TestCaseSortMode.oldest) {
      filtered.sort((a, b) =>
          (a.lastModifiedUtc ?? DateTime(0)).compareTo(b.lastModifiedUtc ?? DateTime(0)));
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
          .add(TestPlanEvent.getTestCasesForPlan(planId: widget.planId)),
      child: Column(
        children: [
          _buildSearchAndSort(),
          _buildProgressCard(
            passed: passed,
            failed: failed,
            blocked: blocked,
            notRun: notRun,
            total: total,
            progress: progress,
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
  }

  Widget _buildSearchAndSort() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Szukaj",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
              ),
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8.0),
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
    );
  }

  Widget _buildProgressCard({
    required int passed,
    required int failed,
    required int blocked,
    required int notRun,
    required int total,
    required double progress,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Postęp testów',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              LinearProgressIndicator(
                value: progress,
                minHeight: 8.0,
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.green,
                backgroundColor: Colors.grey.shade300,
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 12.0,
                runSpacing: 4.0,
                children: [
                  Text('Passed: $passed',
                      style: const TextStyle(color: Colors.green, fontSize: 13.0)),
                  Text('Failed: $failed',
                      style: const TextStyle(color: Colors.red, fontSize: 13.0)),
                  Text('Blocked: $blocked',
                      style: const TextStyle(color: Colors.orange, fontSize: 13.0)),
                  Text('NotRun: $notRun',
                      style: const TextStyle(color: Colors.grey, fontSize: 13.0)),
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                'Razem: $passed / $total ukończonych',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              )
            ],
          ),
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
            const SizedBox(height: 8.0),
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

              context.read<TestPlanBloc>().add(
                TestPlanEvent.createTestCase(testCase: newCase),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }
}
