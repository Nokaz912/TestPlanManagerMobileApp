import 'package:equatable/equatable.dart';
import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';

enum ModuleStatus { initial, loading, success, failure }

class ModuleState extends Equatable {
  final ModuleStatus status;
  final List<ModuleEntity> modules;
  final Map<String, List<ModuleEntity>> submodules;
  final Map<String, List<TestPlanEntity>> testPlans;
  final List<String> visitedModules;
  final String? currentProjectId;
  final String? errorMessage;

  const ModuleState({
    required this.status,
    required this.modules,
    required this.submodules,
    required this.testPlans,
    required this.visitedModules,
    this.currentProjectId,
    this.errorMessage,
  });

  const ModuleState.initial()
      : status = ModuleStatus.initial,
        modules = const [],
        submodules = const {},
        testPlans = const {},
        visitedModules = const [],
        currentProjectId = null,
        errorMessage = null;

  ModuleState copyWith({
    ModuleStatus? status,
    List<ModuleEntity>? modules,
    Map<String, List<ModuleEntity>>? submodules,
    Map<String, List<TestPlanEntity>>? testPlans,
    List<String>? visitedModules,
    String? currentProjectId,
    String? errorMessage,
  }) {
    return ModuleState(
      status: status ?? this.status,
      modules: modules ?? this.modules,
      submodules: submodules ?? this.submodules,
      testPlans: testPlans ?? this.testPlans,
      visitedModules: visitedModules ?? this.visitedModules,
      currentProjectId: currentProjectId ?? this.currentProjectId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    modules,
    submodules,
    testPlans,
    visitedModules,
    currentProjectId,
    errorMessage,
  ];
}
