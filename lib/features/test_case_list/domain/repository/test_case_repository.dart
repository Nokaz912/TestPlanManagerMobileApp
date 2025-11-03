import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/test_case_list/domain/entities/test_case.dart';

import '../../../../core/error/failures.dart';

abstract class TestCaseRepository{
  Future<Either<Failure, List<TestCaseEntity>>> getCasesForPlan(String planId);
}