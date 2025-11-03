import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/module.dart';
import '../repository/module_repository.dart';


class GetSubmodulesForModule extends UseCase<List<ModuleEntity>, ParentModuleIdParams> {
  final ModuleRepository repository;

  GetSubmodulesForModule(this.repository);

  @override
  Future<Either<Failure, List<ModuleEntity>>> call(ParentModuleIdParams params) {
    return repository.getSubmodules(params.parentModuleId);
  }
}

class ParentModuleIdParams {
  final String parentModuleId;

  ParentModuleIdParams(this.parentModuleId);
}
