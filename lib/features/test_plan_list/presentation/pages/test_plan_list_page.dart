import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/UI/app_colors.dart';

import '../../../test_plan_list/presentation/bloc/test_plan_bloc.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_event.dart';
import '../../../test_plan_list/presentation/bloc/test_plan_state.dart';
import '../../domain/entities/test_case.dart';
import '../widgets/test_case_tile.dart';

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
      appBar: _buildAppBar(context),
      body: BlocBuilder<TestPlanBloc, TestPlanState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildLoading(),
            loading: () => _buildLoading(),
            failure: (msg) => _buildFailure(msg),
            success: (cases) => _buildSuccess(context, cases),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Test Cases",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.05),
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        onPressed: () => context.pop(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () => _openCreateCaseDialog(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.warmBeige,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.warmBeige.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.add_rounded,
                color: AppColors.darkNavy,
                size: 22,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildFailure(String msg) {
    return Center(
      child: Text(
        msg,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, List<TestCaseEntity> allCases) {
    List<TestCaseEntity> filtered = allCases
        .where((c) => c.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    if (sortMode == TestCaseSortMode.newest) {
      filtered.sort((a, b) => (b.lastModifiedUtc ?? DateTime(0))
          .compareTo(a.lastModifiedUtc ?? DateTime(0)));
    } else if (sortMode == TestCaseSortMode.oldest) {
      filtered.sort((a, b) => (a.lastModifiedUtc ?? DateTime(0))
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
      onRefresh: () async {
        context
            .read<TestPlanBloc>()
            .add(TestPlanEvent.getTestCasesForPlan(planId: widget.planId));
      },
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
                ? const Center(
                child: Text("Brak wyników", style: TextStyle(color: Colors.white70)))
                : ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                return TestCaseTile(
                  testCase: filtered[index],
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
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Szukaj",
                labelStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.white.withOpacity(0.08),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppColors.warmBeige, width: 2),
                ),
              ),
              onChanged: (v) => setState(() => searchQuery = v),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white24),
              ),
              child: DropdownButton<TestCaseSortMode>(
                value: sortMode,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                underline: const SizedBox(),
                dropdownColor: AppColors.softViolet.withOpacity(0.9),
                style: const TextStyle(color: Colors.white),
                items: const [
                  DropdownMenuItem(
                    value: TestCaseSortMode.none,
                    child: Text("Brak", style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem(
                    value: TestCaseSortMode.newest,
                    child: Text("Najnowsze", style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem(
                    value: TestCaseSortMode.oldest,
                    child: Text("Najstarsze", style: TextStyle(color: Colors.white)),
                  ),
                ],
                onChanged: (value) => setState(() => sortMode = value!),
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
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Postęp testów",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                color: Colors.greenAccent,
                backgroundColor: Colors.white.withOpacity(0.2),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 16,
              runSpacing: 6,
              children: [
                Text("Passed: $passed",
                    style: const TextStyle(color: Colors.greenAccent)),
                Text("Failed: $failed",
                    style: const TextStyle(color: Colors.redAccent)),
                Text("Blocked: $blocked",
                    style: const TextStyle(color: Colors.orangeAccent)),
                Text("NotRun: $notRun",
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              "Razem: $passed / $total ukończonych",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
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
        backgroundColor: AppColors.softViolet.withOpacity(0.95),
        title: const Text('Nowy przypadek testowy', style: TextStyle(color: Colors.white)),
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
            child: const Text('Anuluj', style: TextStyle(color: Colors.white70)),
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
                expectedResult: expectedCtrl.text.trim().isNotEmpty
                    ? expectedCtrl.text
                    : null,
                assignedToUserId: null,
                lastModifiedUtc: DateTime.now().toUtc(),
                parentCaseId: null,
              );

              context
                  .read<TestPlanBloc>()
                  .add(TestPlanEvent.createTestCase(testCase: newCase));

              Navigator.pop(ctx);
            },
            child: const Text('Zapisz'),
          )
        ],
      ),
    );
  }
}
