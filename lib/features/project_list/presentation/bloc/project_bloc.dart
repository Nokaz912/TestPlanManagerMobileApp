import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/project.dart';
import '../../domain/usecases/get_all_projects.dart';
import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetAllProjects getAllProjects;

  ProjectBloc(this.getAllProjects) : super(const ProjectState.initial()) {
    on<GetAllProjectsEvent>(_onGetAllProjects);
  }

  Future<void> _onGetAllProjects(
      GetAllProjectsEvent event,
      Emitter<ProjectState> emit,
      ) async {
    emit(state.copyWith(status: ProjectStatus.loading));

    final Either<Failure, List<ProjectEntity>> result = await getAllProjects(NoParams());

    result.fold(
          (failure) => emit(state.copyWith(
        status: ProjectStatus.failure,
        errorMessage: failure.message ?? 'Wystąpił nieznany błąd',
      )),
          (projects) => emit(state.copyWith(
        status: ProjectStatus.success,
        projects: projects,
      )),
    );
  }
}
