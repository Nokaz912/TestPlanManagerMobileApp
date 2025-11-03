import 'package:equatable/equatable.dart';
import '../../domain/entities/module.dart';
import '../../domain/entities/test_plan.dart';

/// Ogólny status ładowania modułów i test planów.
enum ModuleStatus { initial, loading, success, failure }

class ModuleState extends Equatable {
  final ModuleStatus status;
  final List<ModuleEntity> modules; // moduły główne projektu
  final Map<String, List<ModuleEntity>> submodules; // submoduły po moduleId
  final Map<String, List<TestPlanEntity>> testPlans; // test plany po moduleId
  final String? errorMessage;

  const ModuleState({
    required this.status,
    required this.modules,
    required this.submodules,
    required this.testPlans,
    this.errorMessage,
  });

  const ModuleState.initial()
      : status = ModuleStatus.initial,
        modules = const [],
        submodules = const {},
        testPlans = const {},
        errorMessage = null;

  ModuleState copyWith({
    ModuleStatus? status,
    List<ModuleEntity>? modules,
    Map<String, List<ModuleEntity>>? submodules,
    Map<String, List<TestPlanEntity>>? testPlans,
    String? errorMessage,
  }) {
    return ModuleState(
      status: status ?? this.status,
      modules: modules ?? this.modules,
      submodules: submodules ?? this.submodules,
      testPlans: testPlans ?? this.testPlans,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    modules,
    submodules,
    testPlans,
    errorMessage,
  ];
}
