import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../global_repository.dart';
import '../../../features/test_plan_list/domain/entities/test_plan.dart';
import '../../usecases/usecase.dart';

class ModuleIdParams {
  final String moduleId;

  ModuleIdParams(this.moduleId);
}
class GlobalGetTestPlansForModule extends UseCase<List<TestPlanEntity>, ModuleIdParams> {
  final GlobalRepository repository;

  GlobalGetTestPlansForModule(this.repository);

  @override
  Future<Either<Failure, List<TestPlanEntity>>> call(ModuleIdParams params) {
    return repository.getPlansForModule(params.moduleId);
  }
}
