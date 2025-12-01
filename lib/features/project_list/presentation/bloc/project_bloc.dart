import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/project.dart';
import '../../domain/usecases/create_new_project.dart';
import '../../domain/usecases/delete_project.dart';
import '../../domain/usecases/get_all_projects.dart';
import '../../domain/usecases/update_project.dart';
import '../../../../core/usecases/usecase.dart';

import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetAllProjects getAllProjects;
  final CreateProject createProject;
  final UpdateProject updateProject;
  final DeleteProject deleteProject;

  ProjectBloc(
      this.getAllProjects,
      this.createProject,
      this.updateProject,
      this.deleteProject,
      ) : super(const ProjectState.initial()) {
    on<GetAllProjectsEvent>(_onGetAllProjects);
    on<CreateProjectEvent>(_onCreateProject);
    on<UpdateProjectEvent>(_onUpdateProject);
    on<DeleteProjectEvent>(_onDeleteProject);
  }

  Future<void> _onGetAllProjects(
      GetAllProjectsEvent event,
      Emitter<ProjectState> emit,
      ) async {
    emit(const ProjectState.loading());

    await emit.forEach<Either<Failure, List<ProjectEntity>>>(
      getAllProjects(NoParams()),
      onData: (either) =>
          either.fold(
                (f) =>
                ProjectState.failure(
                    errorMessage: f.message ?? 'Błąd pobierania'),
                (projects) => ProjectState.success(projects: projects),
          ),
      onError: (error, stackTrace) =>
          ProjectState.failure(errorMessage: error.toString()),
    );
  }

  Future<void> _onCreateProject(
      CreateProjectEvent event,
      Emitter<ProjectState> emit,
      ) async {

    emit(const ProjectState.loading());
    final res = await createProject(CreateProjectParams(event.project));
    res.fold(
          (f) => emit(ProjectState.failure(
        errorMessage: f.message ?? f.toString(),
      )),
          (_) => add(const ProjectEvent.getAll()),
    );
  }

  Future<void> _onUpdateProject(
      UpdateProjectEvent event,
      Emitter<ProjectState> emit,
      ) async {
    emit(const ProjectState.loading());
    final res = await updateProject(UpdateProjectParams(event.project));
    res.fold(
          (f) => emit(ProjectState.failure(
        errorMessage: f.message ?? f.toString(),
      )),
          (_) => add(const ProjectEvent.getAll()),
    );
  }

  Future<void> _onDeleteProject(
      DeleteProjectEvent event,
      Emitter<ProjectState> emit,
      ) async {
    emit(const ProjectState.loading());
    final res = await deleteProject(DeleteProjectParams(event.id));
    res.fold(
          (f) => emit(ProjectState.failure(
        errorMessage: f.message ?? f.toString(),
      )),
          (_) => add(const ProjectEvent.getAll()),
    );
  }
}
