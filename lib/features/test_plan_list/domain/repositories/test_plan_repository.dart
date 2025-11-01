import '../../../../core/error/failures.dart';
import '../entities/test_plan.dart';
import 'package:dartz/dartz.dart';


abstract class TestPlanRepository {
  Future<Either<Failure, List<TestPlanEntity>>> getAllPlans();
}