import '../../../../features/project_list/data/models/dtos/project_dto.dart';

abstract class ProjectsRemoteDataSource {
  Future<List<ProjectDto>> fetchProjects();
}
