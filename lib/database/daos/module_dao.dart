import 'package:drift/drift.dart';
import '../drift_database/data.dart';

part 'module_dao.g.dart';

@DriftAccessor(tables: [Modules])
class ModuleDao extends DatabaseAccessor<AppDatabase> with _$ModuleDaoMixin {
  final AppDatabase db;

  ModuleDao(this.db) : super(db);

  Future<List<Module>> getAllModules() => select(db.modules).get();

  Stream<List<Module>> watchAllModules() => select(db.modules).watch();

  Future<List<Module>> getModulesForProject(String projectId) {
    return (select(db.modules)
      ..where((tbl) => tbl.projectId.equals(projectId))
      ..where((tbl) => tbl.parentModuleId.isNull()))
        .get();
  }

  Future<List<Module>> getSubmodules(String parentModuleId) {
    return (select(db.modules)
      ..where((tbl) => tbl.parentModuleId.equals(parentModuleId)))
        .get();
  }

  Future<void> insertModule(ModulesCompanion module) =>
      into(db.modules).insert(module);

  Future<void> updateModule(ModulesCompanion module) =>
      into(db.modules).insertOnConflictUpdate(module);

  Future<void> upsertModule(ModulesCompanion module) =>
      into(db.modules).insertOnConflictUpdate(module);

  Future<void> deleteModule(String id) =>
      (delete(db.modules)..where((tbl) => tbl.id.equals(id))).go();
}
