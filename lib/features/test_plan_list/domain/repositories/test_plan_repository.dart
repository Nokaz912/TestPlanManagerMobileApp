import '../../../../core/error/failures.dart';
import '../../../module_list/domain/entities/test_plan.dart';
import 'package:dartz/dartz.dart';

import '../entities/test_case.dart';


abstract class TestPlanRepository {
  Future<Either<Failure, List<TestCaseEntity>>> getCasesForPlan(String planId);

}