import 'package:drift/drift.dart';
import '../data.dart';

part 'project_dao.g.dart';

@DriftAccessor(tables: [Projects])
class ProjectDao extends DatabaseAccessor<AppDatabase> with _$ProjectDaoMixin {
  final AppDatabase db;

  ProjectDao(this.db) : super(db);

  Future<List<Project>> getAllProjects() => select(db.projects).get();

  Future<void> insertProject(ProjectsCompanion project) =>
      into(db.projects).insert(project);

  Future<void> deleteProject(String id) =>
      (delete(db.projects)..where((tbl) => tbl.id.equals(id))).go();

  Stream<List<Project>> watchAllProjects() => select(db.projects).watch();
}
