import 'package:equatable/equatable.dart';
import '../../../test_plan_list/domain/entities/test_plan.dart';
import '../../domain/entities/module.dart';

/// Status ładowania danych modułów
enum ModuleStatus { initial, loading, success, failure }

class ModuleState extends Equatable {
  final ModuleStatus status;

  final List<ModuleEntity> modules;

  final Map<String, List<ModuleEntity>> submodules;

  final Map<String, List<TestPlanEntity>> testPlans;

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
