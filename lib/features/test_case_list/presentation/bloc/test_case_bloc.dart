import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_plan_manager_app/features/test_case_list/presentation/bloc/test_case_event.dart';
import 'package:test_plan_manager_app/features/test_case_list/presentation/bloc/test_case_state.dart';

import '../../../../core/error/failures.dart';
import '../../../test_plan_list/domain/entities/test_case.dart';
import '../../../test_plan_list/domain/usecases/get_test_cases_for_plan.dart';

class TestCaseBloc extends Bloc<TestCaseEvent, TestCaseState> {
  final GetTestCasesForPlan getTestCasesForPlan;

  TestCaseBloc(this.getTestCasesForPlan) : super(const TestCaseState.initial()) {

  }


}
