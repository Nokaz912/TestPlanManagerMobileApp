import 'package:test_plan_manager_app/database/daos/test_cases_dao.dart';
import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_case_dto.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/test_case.dart';
import '../../domain/repositories/test_plan_repository.dart';

class TestPlanRepositoryImpl implements TestPlanRepository {
  final TestCasesDao dao;

  TestPlanRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<TestCaseEntity>>> getCasesForPlan(String planId) async {
    try {
      final testCases = await dao.getCasesForPlan(planId);
      final entities = testCases.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure('Błąd pobierania test case\'ów: $e'));
    }
  }

}
