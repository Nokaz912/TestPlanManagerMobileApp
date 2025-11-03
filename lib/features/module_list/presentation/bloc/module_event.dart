import 'package:equatable/equatable.dart';

abstract class ModuleEvent extends Equatable {
  const ModuleEvent();

  @override
  List<Object?> get props => [];
}

/// Pobiera moduły główne dla danego projektu.
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
class LoadPreviewForModuleEvent extends ModuleEvent {
  final String moduleId;

  const LoadPreviewForModuleEvent(this.moduleId);

  @override
  List<Object?> get props => [moduleId];
}

