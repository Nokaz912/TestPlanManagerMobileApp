import 'package:dartz/dartz.dart';

import 'package:test_plan_manager_app/core/error/failures.dart';
import 'package:test_plan_manager_app/core/usecases/usecase.dart';

import '../entities/test_plan.dart';
import '../repositories/test_plan_repository.dart';

class GetAllTestPlans extends UseCase<List<TestPlanEntity>> {
  final TestPlanRepository repository;

  GetAllTestPlans(this.repository);

  @override
  Future<Either<Failure, List<TestPlanEntity>>> call() {
    return repository.getAllPlans();
  }
}
