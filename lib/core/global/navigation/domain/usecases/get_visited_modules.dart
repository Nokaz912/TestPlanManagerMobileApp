

import '../repository/navigation_repository.dart';

class GetVisitedModules {
  final NavigationRepository repository;

  GetVisitedModules(this.repository);

  List<String> call(String projectId) {
    return repository.getVisitedModules(projectId);
  }
}
