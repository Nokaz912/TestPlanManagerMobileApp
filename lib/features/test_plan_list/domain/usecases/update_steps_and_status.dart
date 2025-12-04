import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/test_case.dart';
import '../repositories/test_case_repository.dart';
import '../services/testcase_service.dart';

class UpdateStepsAndStatusUseCase {
  final TestCaseRepository repo;
  final TestCaseService service;

  UpdateStepsAndStatusUseCase(this.repo, this.service);

  Future<Either<Failure, void>> call(TestCaseEntity caseEntity) async {
    final enriched = await service.enrich(caseEntity);

    return repo.updateStepsAndStatus(
      enriched.id,
      enriched.totalSteps ?? 0,
      enriched.passedSteps ?? 0,
      enriched.status,
    );
  }
}
