import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/streamusecase.dart';
import '../entities/module.dart';
import '../repository/module_repository.dart';

class GetModulesForProject
    extends StreamUseCase<List<ModuleEntity>, ProjectIdParams> {
  final ModuleRepository repository;

  GetModulesForProject(this.repository);

  @override
  Stream<List<ModuleEntity>> call(ProjectIdParams params) {
    return repository.getModulesForProject(params.projectId).asyncMap(
          (either) => either.fold(
            (failure) => throw Exception(failure.message ?? 'Unknown error'),
            (data) => data,
      ),
    );
  }
}

class ProjectIdParams {
  final String projectId;

  ProjectIdParams(this.projectId);
}
