import 'package:equatable/equatable.dart';

abstract class TestPlanEvent extends Equatable {
  const TestPlanEvent();

  @override
  List<Object?> get props => [];
}

class GetAllTestPlansEvent extends TestPlanEvent {
  const GetAllTestPlansEvent();

  @override
  List<Object?> get props => [];
}