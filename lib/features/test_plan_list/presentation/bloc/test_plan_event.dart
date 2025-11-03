import 'package:equatable/equatable.dart';

abstract class TestPlanEvent extends Equatable {
  const TestPlanEvent();

  @override
  List<Object?> get props => [];
}

class GetTestCasesForPlanEvent extends TestPlanEvent {
  final String planId;

  const GetTestCasesForPlanEvent(this.planId);

  @override
  List<Object?> get props => [planId];
}

// class GetTestPlansForModuleEvent extends TestPlanEvent {
//   final String moduleId;
//
//   const GetTestPlansForModuleEvent(this.moduleId);
// }