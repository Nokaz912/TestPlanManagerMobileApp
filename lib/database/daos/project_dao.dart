import 'package:drift/drift.dart';
import '../drift_database/data.dart';

part 'project_dao.g.dart';

@DriftAccessor(tables: [Projects])
class ProjectDao extends DatabaseAccessor<AppDatabase> with _$ProjectDaoMixin {
  final AppDatabase db;

  ProjectDao(this.db) : super(db);

  Future<List<Project>> getAllProjects() => select(db.projects).get();

  Future<Project?> getProjectById(String id) async {
    return await (select(db.projects)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<void> insertProject(ProjectsCompanion project) async {
    await into(db.projects).insert(project);
  }

  Future<void> updateProject(ProjectsCompanion project) async {
    await update(db.projects).replace(project);
  }


  Future<void> upsertProject(ProjectsCompanion project) async {
    await into(db.projects).insertOnConflictUpdate(project);
  }

  Future<void> deleteProject(String id) async {
    await (delete(db.projects)..where((tbl) => tbl.id.equals(id))).go();
  }
}
