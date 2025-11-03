import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/dtos/module_dto.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/daos/module_dao.dart';
import '../../domain/entities/module.dart';
import '../../domain/repository/module_repository.dart';

class ModuleRepositoryImpl implements ModuleRepository {
  final ModuleDao dao;

  ModuleRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<ModuleEntity>>> getAllModules() async {
    try {
      final result = await dao.getAllModules();
      final entities = result.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure('Błąd pobierania modułów: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ModuleEntity>>> getModulesForProject(String projectId) async {
    try {
      final result = await dao.getModulesForProject(projectId);
      final entities = result.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure('Błąd pobierania modułów: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ModuleEntity>>> getSubmodules(String moduleId) async {
    try {
      final result = await dao.getSubmodules(moduleId);
      final entities = result.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure('Błąd pobierania modułów: $e'));
    }
  }

  // @override
  // Future<Either<Failure, void>> addModule(ModuleEntity module) async {
  //   try {
  //     await dao.insertModule(
  //       ModulesCompanion.insert(
  //         id: module.id,
  //         name: module.name,
  //         description: Value(module.description),
  //         projectId: module.projectId,
  //         parentModuleId: Value(module.parentModuleId),
  //       ),
  //     );
  //     return const Right(null);
  //   } catch (e) {
  //     return Left(DatabaseFailure(message: e.toString()));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, void>> deleteModule(String id) async {
  //   try {
  //     await dao.deleteModule(id);
  //     return const Right(null);
  //   } catch (e) {
  //     return Left(DatabaseFailure(message: e.toString()));
  //   }
  // }
}
