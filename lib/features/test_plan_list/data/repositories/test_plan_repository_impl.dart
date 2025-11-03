import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_plan_dto.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../database/daos/test_plans_dao.dart';
import '../../domain/entities/test_plan.dart';
import '../../domain/repositories/test_plan_repository.dart';

class TestPlanRepositoryImpl implements TestPlanRepository {
  final TestPlansDao dao;

  TestPlanRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<TestPlanEntity>>> getAllPlans() async {
    try {
      final plans = await dao.getAll();
      final entities = plans.map((p) => p.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TestPlanEntity>>> getPlansForModule(String moduleId) async {
    try {
      final plans = await dao.getPlansByModuleId(moduleId);
      final entities = plans.map((p) => p.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

}
