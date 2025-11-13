import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../dependency_injection/service_locator.dart' as di;
import '../../../comments/presentation/pages/comment_page.dart';
import '../bloc/test_case_bloc.dart';
import '../bloc/test_case_event.dart';
import '../bloc/test_case_state.dart';
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
    return BlocProvider(
      create: (_) =>
      di.sl<TestStepBloc>()..add(GetTestStepsForCaseEvent(widget.testCaseId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kroki testowe'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Wstecz',
            onPressed: () => context.pop(),
          ),
          actions: [
            IconButton(
              tooltip: 'Komentarze do test case’a',
              icon: const Icon(Icons.comment),
              onPressed: () {
                context.push('/cases/${widget.testCaseId}/comments');
              },
            ),
          ],
        ),
        floatingActionButton: Builder(
          builder: (inner) => FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: const Text('Nowy krok'),
            onPressed: () => _openAddStepDialog(inner, widget.testCaseId),
          ),
        ),
        body: BlocConsumer<TestStepBloc, TestStepState>(
          listener: (context, state) {
            if (state.status == TestStepStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ??
                      'Błąd operacji na krokach testowych'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == TestStepStatus.loading ||
                state.status == TestStepStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }

            final steps = List<TestStepEntity>.from(state.steps)
              ..sort((a, b) => a.stepNumber.compareTo(b.stepNumber));

            if (steps.isEmpty) {
              return const Center(child: Text('Brak kroków testowych'));
            }

            return ReorderableListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              itemCount: steps.length,
              onReorder: (oldIndex, newIndex) {
                if (newIndex > oldIndex) newIndex -= 1;
                final updated = List<TestStepEntity>.from(steps);
                final moved = updated.removeAt(oldIndex);
                updated.insert(newIndex, moved);

                for (int i = 0; i < updated.length; i++) {
                  updated[i] = updated[i].copyWith(stepNumber: i + 1);
                }

                HapticFeedback.selectionClick();
                context
                    .read<TestStepBloc>()
                    .add(ReorderTestStepsEvent(updated));

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Zmieniono kolejność kroków'),
                    duration: Duration(milliseconds: 900),
                  ),
                );
              },
              itemBuilder: (context, index) {
                final step = steps[index];
                final color = switch (step.status) {
                  'Passed' => Colors.green,
                  'Failed' => Colors.red,
                  'Blocked' => Colors.orange,
                  'NotRun' => Colors.grey,
                  _ => Colors.blueGrey,
                };

                return Card(
                  key: ValueKey(step.id),
                  elevation: 2,
                  margin:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    leading: CircleAvatar(
                      backgroundColor: color.withOpacity(0.1),
                      child: Text(step.stepNumber.toString(),
                          style: TextStyle(color: color)),
                    ),
                    title: Text(step.description,
                        style:
                        const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: step.expected != null && step.expected!.isNotEmpty
                        ? Text('Oczekiwany wynik: ${step.expected}')
                        : null,
                    trailing: PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (v) {
                        if (v == 'status')
                          _openStatusDialog(context, step);
                        if (v == 'edit') _openEditStepDialog(context, step);
                        if (v == 'delete')
                          _confirmDeleteStep(context, step, steps);
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                            value: 'status', child: Text('Zmień status')),
                        PopupMenuItem(
                            value: 'edit', child: Text('Edytuj')),
                        PopupMenuItem(
                            value: 'delete', child: Text('Usuń')),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _openAddStepDialog(BuildContext context, String testCaseId) {
    final descCtrl = TextEditingController();
    final expectedCtrl = TextEditingController();

    final currentSteps = context.read<TestStepBloc>().state.steps;
    final nextNumber = (currentSteps.isEmpty)
        ? 1
        : (currentSteps.map((e) => e.stepNumber).reduce((a, b) => a > b ? a : b) +
        1);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nowy krok testowy'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: 'Opis kroku')),
            const SizedBox(height: 8),
            TextField(
                controller: expectedCtrl,
                decoration:
                const InputDecoration(labelText: 'Oczekiwany rezultat')),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              final desc = descCtrl.text.trim();
              if (desc.isEmpty) return;

              final step = TestStepEntity(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                testCaseId: testCaseId,
                stepNumber: nextNumber,
                description: desc,
                expected: expectedCtrl.text.trim().isNotEmpty
                    ? expectedCtrl.text.trim()
                    : null,
                status: 'NotRun',
              );

              context.read<TestStepBloc>().add(CreateTestStepEvent(step));
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
            TextField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: 'Opis kroku')),
            const SizedBox(height: 8),
            TextField(
                controller: expectedCtrl,
                decoration:
                const InputDecoration(labelText: 'Oczekiwany rezultat')),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              final updated = step.copyWith(
                description: descCtrl.text.trim(),
                expected: expectedCtrl.text.trim().isNotEmpty
                    ? expectedCtrl.text.trim()
                    : null,
              );
              context.read<TestStepBloc>().add(UpdateTestStepEvent(updated));
              Navigator.pop(ctx);
            },
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteStep(
      BuildContext context, TestStepEntity step, List<TestStepEntity> steps) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Usuń krok'),
        content: Text('Czy na pewno chcesz usunąć krok nr ${step.stepNumber}?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              final updated = List<TestStepEntity>.from(steps)..remove(step);
              for (int i = 0; i < updated.length; i++) {
                updated[i] = updated[i].copyWith(stepNumber: i + 1);
              }

              context
                  .read<TestStepBloc>()
                  .add(DeleteTestStepEvent(step.id, step.testCaseId));
              context
                  .read<TestStepBloc>()
                  .add(ReorderTestStepsEvent(updated));
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

    final statuses = const [
      'NotRun',
      'Passed',
      'Failed',
      'Blocked',
    ];

    // jeśli status jest nieznany, ustaw domyślnie NotRun
    if (!statuses.contains(current)) {
      current = 'NotRun';
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Zmień status'),
        content: DropdownButtonFormField<String>(
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
                  _ => s,
                },
              ),
            );
          }).toList(),
          onChanged: (v) => current = v ?? step.status,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Anuluj'),
          ),
          ElevatedButton(
            onPressed: () {
              final updated = step.copyWith(status: current);
              context.read<TestStepBloc>().add(UpdateTestStepEvent(updated));
              Navigator.pop(ctx);
            },
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }

}
