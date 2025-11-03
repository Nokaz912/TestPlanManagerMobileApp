import 'package:equatable/equatable.dart';
import '../../domain/entities/project.dart';

enum ProjectStatus { initial, loading, success, failure }

class ProjectState extends Equatable {
  final ProjectStatus status;
  final List<ProjectEntity> projects;
  final String? errorMessage;

  const ProjectState({
    required this.status,
    required this.projects,
    this.errorMessage,
  });

  const ProjectState.initial()
      : status = ProjectStatus.initial,
        projects = const [],
        errorMessage = null;

  ProjectState copyWith({
    ProjectStatus? status,
    List<ProjectEntity>? projects,
    String? errorMessage,
  }) {
    return ProjectState(
      status: status ?? this.status,
      projects: projects ?? this.projects,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, projects, errorMessage];
}
