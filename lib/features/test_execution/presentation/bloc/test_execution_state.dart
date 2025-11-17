import 'package:equatable/equatable.dart';

import '../../../project_list/domain/entities/project.dart';
import '../../domain/entities/project_structure.dart';

class TestExecutionState extends Equatable {
  final bool loading;
  final List<ProjectEntity> projects;
  final ProjectStructureEntity? structure;
  final String? errorMessage;

  const TestExecutionState({
    this.loading = false,
    this.projects = const [],
    this.structure,
    this.errorMessage,
  });

  TestExecutionState copyWith({
    bool? loading,
    List<ProjectEntity>? projects,
    ProjectStructureEntity? structure,
    String? errorMessage,
  }) {
    return TestExecutionState(
      loading: loading ?? this.loading,
      projects: projects ?? this.projects,
      structure: structure ?? this.structure,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [loading, projects, structure, errorMessage];
}
