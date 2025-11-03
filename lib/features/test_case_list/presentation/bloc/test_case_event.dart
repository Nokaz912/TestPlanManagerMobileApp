import 'package:equatable/equatable.dart';

abstract class TestCaseEvent extends Equatable {
  const TestCaseEvent();

  @override
  List<Object?> get props => [];
}

class GetTestCasesForPlanEvent extends TestCaseEvent {
  final String planId;

  const GetTestCasesForPlanEvent(this.planId);

  @override
  List<Object?> get props => [planId];
}
