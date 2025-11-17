import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/test_execution_repository.dart';

class ExportToFile extends UseCase<String, NoParams> {
  final TestExecutionRepository repository;

  ExportToFile(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return repository.exportTempStatusToFile();
  }
}
