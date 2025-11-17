import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/test_execution_bloc.dart';
import '../bloc/test_execution_event.dart';
import '../bloc/test_execution_state.dart';
import '../../domain/entities/project_structure.dart';
import '../../../test_case_list/domain/entities/test_step.dart';

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

  @override
  void initState() {
    super.initState();
    context.read<TestExecutionBloc>().add(const GetAllProjectsForTestsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestExecutionBloc, TestExecutionState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );

          // SUKCES eksportu — przekierowanie
          if (state.errorMessage != null &&
              state.errorMessage!.startsWith("Plik zapisano")) {

            Future.delayed(const Duration(milliseconds: 400), () {
              context.go('/projects');
            });
          }

        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Test Execution"),
            actions: [
              TextButton.icon(
                onPressed: () {
                  context
                      .read<TestExecutionBloc>()
                      .add(const ExportToFileEvent());
                },
                icon: const Icon(Icons.save_alt, color: Colors.white),
                label: const Text(
                  "Zakończ testowanie",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          body: state.loading
              ? const Center(child: CircularProgressIndicator())
              : _buildBody(state),
        );
      },
    );
  }

  // ----------------------------------------------------
  // BODY
  // ----------------------------------------------------
  Widget _buildBody(TestExecutionState state) {
    final projects = state.projects;
    final structure = state.structure;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DropdownButton<String>(
            value: selectedProjectId,
            isExpanded: true,
            hint: const Text("Wybierz projekt"),
            items: projects
                .map(
                  (p) => DropdownMenuItem(
                value: p.id,
                child: Text(p.name),
              ),
            )
                .toList(),
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                selectedProjectId = value;
                selectedModuleId = null;
                selectedPlanId = null;
                selectedCaseId = null;
              });
              context
                  .read<TestExecutionBloc>()
                  .add(GetProjectStructureEvent(value));
            },
          ),

          const SizedBox(height: 16),

          if (structure != null) ...[
            _buildModulePicker(structure),
            const SizedBox(height: 16),
            _buildPlanPicker(structure),
            const SizedBox(height: 16),
            _buildCasePicker(structure),
            const SizedBox(height: 16),
            Expanded(child: _buildStepsView(structure)),
          ],
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // MODULE
  // ----------------------------------------------------
  Widget _buildModulePicker(ProjectStructureEntity structure) {
    final flatModules = _flattenModules(structure.modules);

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedModuleId,
      hint: const Text("Wybierz moduł"),
      items: flatModules
          .map(
            (m) => DropdownMenuItem(
          value: m.id,
          child: Text(m.label),
        ),
      )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedModuleId = value;
          selectedPlanId = null;
          selectedCaseId = null;
        });
      },
    );
  }

  // ----------------------------------------------------
  // PLAN
  // ----------------------------------------------------
  Widget _buildPlanPicker(ProjectStructureEntity structure) {
    if (selectedModuleId == null) {
      return const SizedBox.shrink();
    }

    final module = _findModule(structure, selectedModuleId!);
    if (module == null) return const SizedBox.shrink();

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedPlanId,
      hint: const Text("Wybierz plan testów"),
      items: module.plans
          .map(
            (p) => DropdownMenuItem(
          value: p.plan.id,
          child: Text(p.plan.name),
        ),
      )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedPlanId = value;
          selectedCaseId = null;
        });
      },
    );
  }

  // ----------------------------------------------------
  // TEST CASE
  // ----------------------------------------------------
  Widget _buildCasePicker(ProjectStructureEntity structure) {
    if (selectedModuleId == null || selectedPlanId == null) {
      return const SizedBox.shrink();
    }

    final module = _findModule(structure, selectedModuleId!);
    if (module == null) return const SizedBox.shrink();

    final plan = module.plans.firstWhere((p) => p.plan.id == selectedPlanId);

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedCaseId,
      hint: const Text("Wybierz test case"),
      items: plan.cases
          .map(
            (c) => DropdownMenuItem(
          value: c.testCase.id,
          child: Text(c.testCase.title),
        ),
      )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedCaseId = value;
        });
      },
    );
  }

  // ----------------------------------------------------
  // STEPS
  // ----------------------------------------------------
  Widget _buildStepsView(ProjectStructureEntity structure) {
    if (selectedModuleId == null ||
        selectedPlanId == null ||
        selectedCaseId == null) {
      return const Center(child: Text("Wybierz test case"));
    }

    final module = _findModule(structure, selectedModuleId!)!;
    final plan = module.plans.firstWhere((p) => p.plan.id == selectedPlanId);
    final caseNode =
    plan.cases.firstWhere((c) => c.testCase.id == selectedCaseId);

    return ListView.builder(
      itemCount: caseNode.steps.length,
      itemBuilder: (context, index) {
        final step = caseNode.steps[index];

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Krok ${step.stepNumber}",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(step.description),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _statusButton("Passed", () {
                        _updateStatus(step, "passed");
                      }),
                      _statusButton("Failed", () {
                        _updateStatus(step, "failed");
                      }),
                      _statusButton("Blocked", () {
                        _updateStatus(step, "blocked");
                      }),
                      _statusButton("Skipped", () {
                        _updateStatus(step, "skipped");
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // ----------------------------------------------------
  // HELPERS
  // ----------------------------------------------------

  Widget _statusButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  void _updateStatus(TestStepEntity step, String status) {
    context.read<TestExecutionBloc>().add(
      UpdateStepTempStatusEvent(
        StepStatusPathEntity(
          projectId: selectedProjectId!,
          moduleId: selectedModuleId!,
          planId: selectedPlanId!,
          caseId: selectedCaseId!,
          stepId: step.id,
          newStatus: status,
          timestamp: DateTime.now(),
        ),
      ),
    );
  }

  ModuleStructureEntity? _findModule(
      ProjectStructureEntity structure, String id) {
    return structure.modules.firstWhere((m) => m.module.id == id);
  }

  List<_ModuleItem> _flattenModules(List<ModuleStructureEntity> roots) {
    return roots
        .map((m) => _ModuleItem(id: m.module.id, label: m.module.name))
        .toList();
  }
}

class _ModuleItem {
  final String id;
  final String label;

  const _ModuleItem({required this.id, required this.label});
}
