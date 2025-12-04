import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../project_list/domain/entities/project.dart';
import '../../../test_step_list/domain/entities/test_step.dart';
import '../../domain/entities/project_structure.dart';
import '../bloc/test_execution_bloc.dart';
import '../bloc/test_execution_event.dart';
import '../bloc/test_execution_state.dart';

class ExecutionPage extends StatefulWidget {
  const ExecutionPage({super.key});

  @override
  State<ExecutionPage> createState() => _ExecutionPageState();
}

class _ExecutionPageState extends State<ExecutionPage> {
  String? selectedProjectId;
  String? selectedModuleId;
  String? selectedPlanId;
  String? selectedCaseId;

  final Map<String, String> _localStepStatus = {};

  @override
  void initState() {
    super.initState();
    context.read<TestExecutionBloc>().add(
      const TestExecutionEvent.getAllProjectsForTests(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestExecutionBloc, TestExecutionState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_, __, fileGenerated) {
            if (fileGenerated != null) {
              _showFileSavedDialog(context, fileGenerated);
            }
          },
          failure: (msg) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg)),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: _appBar(),
          body: state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (msg) => Center(child: Text(msg)),
            success: (projects, structure, _) =>
                _buildBody(projects, structure),
          ),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Test Execution"),
      actions: [
        TextButton.icon(
          onPressed: _finishSession,
          icon: const Icon(Icons.save_alt, color: Colors.white),
          label: const Text(
            "Zakończ testowanie",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(
      List<ProjectEntity> projects,
      ProjectStructureEntity? structure,
      ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _projectPicker(projects),
          const SizedBox(height: 16),
          if (structure != null) ...[
            _modulePicker(structure),
            const SizedBox(height: 16),
            _planPicker(structure),
            const SizedBox(height: 16),
            _casePicker(structure),
            const SizedBox(height: 16),
            Expanded(child: _stepsView(structure)),
          ],
        ],
      ),
    );
  }

  Widget _projectPicker(List<ProjectEntity> projects) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedProjectId,
      hint: const Text("Wybierz projekt"),
      items: projects.map((p) {
        return DropdownMenuItem(value: p.id, child: Text(p.name));
      }).toList(),
      onChanged: (value) {
        if (value == null) return;

        setState(() {
          selectedProjectId = value;
          selectedModuleId = null;
          selectedPlanId = null;
          selectedCaseId = null;
          _localStepStatus.clear();
        });

        context.read<TestExecutionBloc>().add(
          TestExecutionEvent.getProjectStructure(projectId: value),
        );
      },
    );
  }

  Widget _modulePicker(ProjectStructureEntity structure) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedModuleId,
      hint: const Text("Wybierz moduł"),
      items: structure.modules.map((m) {
        return DropdownMenuItem(value: m.module.id, child: Text(m.module.name));
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedModuleId = value;
          selectedPlanId = null;
          selectedCaseId = null;
          _localStepStatus.clear();
        });
      },
    );
  }

  Widget _planPicker(ProjectStructureEntity structure) {
    if (selectedModuleId == null) return const SizedBox.shrink();

    final module =
    structure.modules.firstWhere((m) => m.module.id == selectedModuleId);

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedPlanId,
      hint: const Text("Wybierz plan testów"),
      items: module.plans.map((p) {
        return DropdownMenuItem(value: p.plan.id, child: Text(p.plan.name));
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedPlanId = value;
          selectedCaseId = null;
          _localStepStatus.clear();
        });
      },
    );
  }

  Widget _casePicker(ProjectStructureEntity structure) {
    if (selectedModuleId == null || selectedPlanId == null) {
      return const SizedBox.shrink();
    }

    final module =
    structure.modules.firstWhere((m) => m.module.id == selectedModuleId);
    final plan = module.plans.firstWhere((p) => p.plan.id == selectedPlanId);

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedCaseId,
      hint: const Text("Wybierz test case"),
      items: plan.cases.map((c) {
        return DropdownMenuItem(
          value: c.testCase.id,
          child: Text(c.testCase.title),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCaseId = value;
          _localStepStatus.clear();
        });
      },
    );
  }

  Widget _stepsView(ProjectStructureEntity structure) {
    if (selectedModuleId == null ||
        selectedPlanId == null ||
        selectedCaseId == null) {
      return const Center(child: Text("Wybierz test case"));
    }

    final module =
    structure.modules.firstWhere((m) => m.module.id == selectedModuleId);
    final plan = module.plans.firstWhere((p) => p.plan.id == selectedPlanId);
    final caseNode =
    plan.cases.firstWhere((c) => c.testCase.id == selectedCaseId);

    return ListView(
      children: caseNode.steps.map(_stepCard).toList(),
    );
  }

  Widget _stepCard(TestStepEntity s) {
    final selected = _localStepStatus[s.id];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Krok ${s.stepNumber}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(s.description),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _statusBtn(
                    "Passed",
                        () => _update(s, "Passed"),
                    isActive: selected == "Passed",
                  ),
                  _statusBtn(
                    "Failed",
                        () => _update(s, "Failed"),
                    isActive: selected == "Failed",
                  ),
                  _statusBtn(
                    "Blocked",
                        () => _update(s, "Blocked"),
                    isActive: selected == "Blocked",
                  ),
                  _statusBtn(
                    "Skipped",
                        () => _update(s, "Skipped"),
                    isActive: selected == "Skipped",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusBtn(
      String txt,
      VoidCallback cb, {
        required bool isActive,
      }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isActive ? Colors.blue.withOpacity(0.15) : null,
          side: BorderSide(
            color: isActive ? Colors.blue : Colors.grey,
          ),
        ),
        onPressed: cb,
        child: Text(
          txt,
          style: TextStyle(
            color: isActive ? Colors.blue.shade800 : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _update(TestStepEntity s, String st) {
    setState(() {
      _localStepStatus[s.id] = st;
    });

    context.read<TestExecutionBloc>().add(
      TestExecutionEvent.updateStepTempStatus(
        stepStatus: StepStatusPathEntity(
          projectId: selectedProjectId!,
          moduleId: selectedModuleId!,
          planId: selectedPlanId!,
          caseId: selectedCaseId!,
          stepId: s.id,
          newStatus: st,
          timestamp: DateTime.now(),
        ),
      ),
    );
  }

  Future<void> _finishSession() async {
    final res = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Zakończyć testowanie?"),
        content: const Text("Wyeksportować raport?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text("Nie"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text("Tak"),
          ),
        ],
      ),
    );

    if (res == true) {
      context
          .read<TestExecutionBloc>()
          .add(const TestExecutionEvent.exportToFile());
    } else {
      context.go('/projects');
    }
  }

  void _showFileSavedDialog(BuildContext context, String path) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Raport zapisany"),
        content: Text("Plik został zapisany:\n\n$path"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.go('/projects');
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}
