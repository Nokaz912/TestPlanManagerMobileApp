import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../../../features/test_plan_list/domain/entities/test_plan.dart';
import '../../../../../features/test_plan_list/domain/repositories/test_plan_repository.dart';
import '../../../../../features/test_plan_list/domain/usecases/get_all_test_plans.dart';
import '../../../../../core/error/failures.dart';

class MockTestPlanRepository extends Mock implements TestPlanRepository {}

void main() {
  late GetAllTestPlans usecase;
  late MockTestPlanRepository mockTestPlanRepository;

  setUp(() {
    mockTestPlanRepository = MockTestPlanRepository();
    usecase = GetAllTestPlans(mockTestPlanRepository);
  });

  final tTestPlans = [
    TestPlanEntity(id: '1', name: 'Plan 1', description: 'Opis 1'),
    TestPlanEntity(id: '2', name: 'Plan 2', description: 'Opis 2'),
  ];

  test('should return list of test plans from repository', () async {
    // arrange
    when(mockTestPlanRepository.getAllPlans()).thenAnswer(
          (_) async => Right(tTestPlans),
    );

    // act
    final result = await usecase();

    // assert
    expect(result, Right(tTestPlans));
    verify(mockTestPlanRepository.getAllPlans());
    verifyNoMoreInteractions(mockTestPlanRepository);
  });
}
