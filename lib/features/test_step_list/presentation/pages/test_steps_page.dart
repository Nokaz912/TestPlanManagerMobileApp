import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/UI/app_colors.dart';
import '../bloc/test_step_bloc.dart';
import '../bloc/test_step_event.dart';
import '../bloc/test_step_state.dart';
import '../../domain/entities/test_step.dart';

class TestCasePage extends StatefulWidget {
  final String testCaseId;
  final String planId;
  final String moduleId;
  final String projectId;

  const TestCasePage({
    super.key,
    required this.testCaseId,
    required this.planId,
    required this.moduleId,
    required this.projectId,
  });

  @override
  State<TestCasePage> createState() => _TestCasePageState();
}

class _TestCasePageState extends State<TestCasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.05),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Kroki testowe",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.comment, color: Colors.white),
            onPressed: () => context.push('/cases/${widget.testCaseId}/comments'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => _openAddStepDialog(context),
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
      ),

      body: BlocConsumer<TestStepBloc, TestStepState>(
        listener: (context, state) {
          state.maybeWhen(
            failure: (msg) => ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(msg))),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (msg) => Center(
              child: Text(
                msg,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            success: (steps) => _buildList(context, steps),
          );
        },
      ),
    );
  }

  Widget _buildList(BuildContext context, List<TestStepEntity> steps) {
    final sorted = [...steps]..sort((a, b) => a.stepNumber.compareTo(b.stepNumber));

    if (sorted.isEmpty) {
      return const Center(
        child: Text(
          "Brak kroków testowych",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ReorderableListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: sorted.length,
        onReorder: (oldIndex, newIndex) =>
            _handleReorder(context, oldIndex, newIndex, sorted),
        itemBuilder: (context, index) {
          return _buildStepTile(context, sorted[index]);
        },
      ),
    );
  }

  Widget _buildStepTile(BuildContext context, TestStepEntity step) {
    final Color color = _statusColor(step.status);

    return Container(
      key: ValueKey(step.id),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              step.stepNumber.toString(),
              style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        title: Text(
          step.description,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        subtitle: step.expected != null
            ? Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            "Oczekiwany: ${step.expected}",
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.22),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: color.withOpacity(0.5)),
              ),
              child: Text(
                step.status,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: color),
              ),
            ),
            const SizedBox(width: 6),
            PopupMenuButton<String>(
              color: AppColors.softViolet.withOpacity(0.9),
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onSelected: (v) {
                switch (v) {
                  case 'status':
                    _openStatusDialog(context, step);
                    break;
                  case 'edit':
                    _openEditStepDialog(context, step);
                    break;
                  case 'delete':
                    _confirmDeleteStep(context, step);
                    break;
                }
              },
              itemBuilder: (_) => const [
                PopupMenuItem(
                  value: 'status',
                  child: Text("Zmień status", style: TextStyle(color: Colors.white)),
                ),
                PopupMenuItem(
                  value: 'edit',
                  child: Text("Edytuj", style: TextStyle(color: Colors.white)),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text("Usuń", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleReorder(
      BuildContext context,
      int oldIndex,
      int newIndex,
      List<TestStepEntity> steps,
      ) {
    if (newIndex > oldIndex) newIndex -= 1;

    final reordered = List<TestStepEntity>.from(steps);
    final moved = reordered.removeAt(oldIndex);
    reordered.insert(newIndex, moved);

    for (int i = 0; i < reordered.length; i++) {
      reordered[i] = reordered[i].copyWith(stepNumber: i + 1);
    }

    HapticFeedback.selectionClick();

    context.read<TestStepBloc>().add(
      TestStepEvent.reorderTestSteps(
        reorderedSteps: reordered,
        testCaseId: widget.testCaseId,
      ),
    );
  }

  void _openAddStepDialog(BuildContext context) {
    final descCtrl = TextEditingController();
    final expectedCtrl = TextEditingController();

    final currentSteps = context.read<TestStepBloc>().state.maybeWhen(
      success: (steps) => steps,
      orElse: () => <TestStepEntity>[],
    );

    final nextNumber = currentSteps.isEmpty
        ? 1
        : currentSteps.map((e) => e.stepNumber).reduce((a, b) => a > b ? a : b) + 1;

    showDialog(
      context: context,
      builder: (ctx) => _styledDialog(
        title: "Nowy krok testowy",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Opis')),
            const SizedBox(height: 8),
            TextField(controller: expectedCtrl, decoration: const InputDecoration(labelText: 'Oczekiwany rezultat')),
          ],
        ),
        onConfirm: () {
          final desc = descCtrl.text.trim();
          if (desc.isEmpty) return;

          final step = TestStepEntity(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            testCaseId: widget.testCaseId,
            stepNumber: nextNumber,
            description: desc,
            expected:
            expectedCtrl.text.trim().isNotEmpty ? expectedCtrl.text.trim() : null,
            status: 'NotRun',
          );

          context.read<TestStepBloc>().add(TestStepEvent.createTestStep(step: step));
          Navigator.pop(ctx);
        },
      ),
    );
  }

  void _openEditStepDialog(BuildContext context, TestStepEntity step) {
    final descCtrl = TextEditingController(text: step.description);
    final expectedCtrl = TextEditingController(text: step.expected ?? '');

    showDialog(
      context: context,
      builder: (ctx) => _styledDialog(
        title: "Edytuj krok testowy",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Opis')),
            const SizedBox(height: 8),
            TextField(controller: expectedCtrl, decoration: const InputDecoration(labelText: 'Oczekiwany rezultat')),
          ],
        ),
        onConfirm: () {
          final updated = step.copyWith(
            description: descCtrl.text.trim(),
            expected: expectedCtrl.text.trim().isNotEmpty
                ? expectedCtrl.text.trim()
                : null,
          );

          context.read<TestStepBloc>().add(
            TestStepEvent.updateTestStep(step: updated),
          );

          Navigator.pop(ctx);
        },
      ),
    );
  }

  void _confirmDeleteStep(BuildContext context, TestStepEntity step) {
    showDialog(
      context: context,
      builder: (ctx) => _styledDialog(
        title: "Usuń krok",
        content: Text('Czy na pewno chcesz usunąć krok nr ${step.stepNumber}?'),
        onConfirm: () {
          context.read<TestStepBloc>().add(
            TestStepEvent.deleteTestStep(
              stepId: step.id,
              testCaseId: step.testCaseId,
            ),
          );
          Navigator.pop(ctx);
        },
      ),
    );
  }

  void _openStatusDialog(BuildContext context, TestStepEntity step) {
    String current = step.status;
    final statuses = const ['NotRun', 'Passed', 'Failed', 'Blocked'];

    showDialog(
      context: context,
      builder: (ctx) => _styledDialog(
        title: "Zmień status",
        content: DropdownButtonFormField<String>(
          value: current,
          items:
          statuses.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
          onChanged: (v) => current = v ?? step.status,
        ),
        onConfirm: () {
          final updated = step.copyWith(status: current);
          context.read<TestStepBloc>().add(
            TestStepEvent.updateTestStep(step: updated),
          );
          Navigator.pop(ctx);
        },
      ),
    );
  }

  Widget _styledDialog({
    required String title,
    required Widget content,
    required VoidCallback onConfirm,
  }) {
    return AlertDialog(
      backgroundColor: AppColors.softViolet.withOpacity(0.9),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      content: content,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Anuluj', style: TextStyle(color: Colors.white70)),
        ),
        FilledButton(
          onPressed: onConfirm,
          style: FilledButton.styleFrom(backgroundColor: AppColors.warmBeige),
          child: const Text('Zapisz', style: TextStyle(color: Colors.black)),
        ),
      ],
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
      case 'Pending':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }
}
