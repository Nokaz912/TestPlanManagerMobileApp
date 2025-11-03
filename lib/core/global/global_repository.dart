import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_plan_dto.dart';

import '../../database/daos/test_plans_dao.dart';
import '../../features/test_plan_list/domain/entities/test_plan.dart';
import '../error/failures.dart';

class GlobalRepository {
  final TestPlansDao dao;

  GlobalRepository({required this.dao});

  Future<Either<Failure, List<TestPlanEntity>>> getPlansForModule(String moduleId) async {
    try {
      final plans = await dao.getPlansByModuleId(moduleId);

      final entities = plans.map((plan) => plan.toEntity()).toList();

      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure('Failed to load test plans: $e'));
    }
  }
}
