abstract class NavigationRepository {
  void saveVisitedModules(String projectId, List<String> visited);

  List<String> getVisitedModules(String projectId);

  void clearVisitedModules(String projectId);
}
