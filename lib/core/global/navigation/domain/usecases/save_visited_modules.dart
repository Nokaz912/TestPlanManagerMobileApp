
import '../repository/navigation_repository.dart';

class SaveVisitedModules {
  final NavigationRepository repository;

  SaveVisitedModules(this.repository);

  void call(String projectId, List<String> visited) {
    repository.saveVisitedModules(projectId, visited);
  }
}
