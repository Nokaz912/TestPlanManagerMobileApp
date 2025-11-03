import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/test_case_list/data/models/dtos/test_case_dto.dart';

import '../../../../core/error/failures.dart';
import '../../../../database/daos/test_cases_dao.dart';
import '../../domain/entities/test_case.dart';
import '../../domain/repository/test_case_repository.dart';

class TestCaseRepositoryImpl implements TestCaseRepository {
  final TestCasesDao dao;

  TestCaseRepositoryImpl(this.dao);

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
