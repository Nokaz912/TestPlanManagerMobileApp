import 'package:drift/drift.dart';
import 'package:test_plan_manager_app/database/data.dart';

part 'users_dao.g.dart';
@DriftAccessor(tables:[Users])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  final AppDatabase db;
  UsersDao(this.db) : super(db);
  Future<List<User>> getAllUsers() => select(db.users).get();

}