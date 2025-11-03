// module_event.dart
import 'package:equatable/equatable.dart';

abstract class ModuleEvent extends Equatable {
  const ModuleEvent();

  @override
  List<Object?> get props => [];
}

class GetModulesForProjectEvent extends ModuleEvent {
  final String projectId;

  const GetModulesForProjectEvent(this.projectId);

  @override
  List<Object?> get props => [projectId];
}

class GetSubmodulesForModuleEvent extends ModuleEvent {
  final String moduleId;

  const GetSubmodulesForModuleEvent(this.moduleId);

  @override
  List<Object?> get props => [moduleId];
}

