import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/module.dart';
import '../repository/module_repository.dart';


class GetModulesForProject extends UseCase<List<ModuleEntity>, ProjectIdParams> {
  final ModuleRepository repository;

  GetModulesForProject(this.repository);

  @override
  Future<Either<Failure, List<ModuleEntity>>> call(ProjectIdParams params) {
    return repository.getModulesForProject(params.projectId);
  }
}

class ProjectIdParams {
  final String projectId;

  ProjectIdParams(this.projectId);
}
