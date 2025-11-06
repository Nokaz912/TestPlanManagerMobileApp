
import '../../domain/repository/navigation_repository.dart';

class NavigationRepositoryImpl implements NavigationRepository {
  final Map<String, List<String>> _visitedCache = {};

  @override
  void saveVisitedModules(String projectId, List<String> visited) {
    _visitedCache[projectId] = List.from(visited);
  }

  @override
  List<String> getVisitedModules(String projectId) {
    return List<String>.from(_visitedCache[projectId] ?? []);
  }

  @override
  void clearVisitedModules(String projectId) {
    _visitedCache.remove(projectId);
  }
}
