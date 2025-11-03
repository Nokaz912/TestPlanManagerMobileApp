import 'package:dartz/dartz.dart';
import 'package:test_plan_manager_app/features/test_plan_list/data/models/dtos/test_case_dto.dart';

import '../../../../core/error/failures.dart';
import '../../../../database/daos/test_cases_dao.dart';
import '../../../test_plan_list/domain/entities/test_case.dart';
import '../../domain/repository/test_case_repository.dart';

class TestCaseRepositoryImpl implements TestCaseRepository {
  final TestCasesDao dao;

  TestCaseRepositoryImpl(this.dao);


}
