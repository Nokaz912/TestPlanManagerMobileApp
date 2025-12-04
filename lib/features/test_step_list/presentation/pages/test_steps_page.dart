import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../dependency_injection/service_locator.dart' as di;
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
          title: const Text('Kroki testowe'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.comment),
              onPressed: () =>
                  context.push('/cases/${widget.testCaseId}/comments'),
            ),
          ],
        ),
        floatingActionButton: Builder(
          builder: (inner) => FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: const Text('Nowy krok'),
            onPressed: () => _openAddStepDialog(inner),
          ),
        ),
        body: BlocConsumer<TestStepBloc, TestStepState>(
          listener: (context, state) {
            state.maybeWhen(
              failure: (msg) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(msg)),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: (msg) => Center(child: Text(msg)),
              success: (steps) => _buildList(context, steps),
            );
          },
        ),
      );
  }

  Widget _buildList(BuildContext context, List<TestStepEntity> steps) {
    final sorted = [...steps]..sort((a, b) => a.stepNumber.compareTo(b.stepNumber));

    if (sorted.isEmpty) {
      return const Center(child: Text('Brak kroków testowych'));
    }

    return ReorderableListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      itemCount: sorted.length,
      onReorder: (oldIndex, newIndex) =>
          _handleReorder(context, oldIndex, newIndex, sorted),
      itemBuilder: (context, index) => _buildTile(context, sorted[index]),
    );
  }

  Widget _buildTile(BuildContext context, TestStepEntity step) {
    final color = switch (step.status) {
      'Passed' => Colors.green,
      'Failed' => Colors.red,
      'Blocked' => Colors.orange,
      'NotRun' => Colors.grey,
      _ => Colors.blueGrey,
    };

    return Card(
      key: ValueKey(step.id),
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Text(step.stepNumber.toString(), style: TextStyle(color: color)),
        ),
        title: Text(
          step.description,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: step.expected != null && step.expected!.isNotEmpty
            ? Text("Oczekiwany: ${step.expected}")
            : null,
        trailing: PopupMenuButton<String>(
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
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'status', child: Text('Zmień status')),
            PopupMenuItem(value: 'edit', child: Text('Edytuj')),
            PopupMenuItem(value: 'delete', child: Text('Usuń')),
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
      builder: (ctx) => AlertDialog(
        title: const Text('Nowy krok testowy'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Opis')),
            const SizedBox(height: 8.0),
            TextField(controller: expectedCtrl, decoration: const InputDecoration(labelText: 'Oczekiwany rezultat')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              final desc = descCtrl.text.trim();
              if (desc.isEmpty) return;

              final step = TestStepEntity(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                testCaseId: widget.testCaseId,
                stepNumber: nextNumber,
                description: desc,
                expected: expectedCtrl.text.trim().isNotEmpty
                    ? expectedCtrl.text.trim()
                    : null,
                status: 'NotRun',
              );

              context.read<TestStepBloc>().add(
                TestStepEvent.createTestStep(step: step),
              );

              Navigator.pop(ctx);
            },
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }

  void _openEditStepDialog(BuildContext context, TestStepEntity step) {
    final descCtrl = TextEditingController(text: step.description);
    final expectedCtrl = TextEditingController(text: step.expected ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edytuj krok testowy'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Opis')),
            const SizedBox(height: 8.0),
            TextField(controller: expectedCtrl, decoration: const InputDecoration(labelText: 'Oczekiwany rezultat')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
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
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteStep(BuildContext context, TestStepEntity step) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Usuń krok'),
        content: Text('Czy na pewno chcesz usunąć krok nr ${step.stepNumber}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              context.read<TestStepBloc>().add(
                TestStepEvent.deleteTestStep(
                  stepId: step.id,
                  testCaseId: step.testCaseId,
                ),
              );

              Navigator.pop(ctx);
            },
            child: const Text('Usuń'),
          ),
        ],
      ),
    );
  }

  void _openStatusDialog(BuildContext context, TestStepEntity step) {
    String current = step.status;

    final statuses = const ['NotRun', 'Passed', 'Failed', 'Blocked'];

    if (!statuses.contains(current)) {
      current = 'NotRun';
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Zmień status'),
        content: DropdownButtonFormField<String>(
          value: current,
          items: statuses
              .map((s) => DropdownMenuItem(value: s, child: Text(s)))
              .toList(),
          onChanged: (v) => current = v ?? step.status,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              final updated = step.copyWith(status: current);
              context.read<TestStepBloc>().add(
                TestStepEvent.updateTestStep(step: updated),
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
