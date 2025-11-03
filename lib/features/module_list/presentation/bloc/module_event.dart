import 'package:equatable/equatable.dart';

abstract class ModuleEvent extends Equatable {
  const ModuleEvent();

  @override
  List<Object?> get props => [];
}

/// Pobiera moduły główne dla projektu
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

/// Ładuje podgląd modułu (max 3 elementy)
class LoadPreviewForModuleEvent extends ModuleEvent {
  final String moduleId;
  const LoadPreviewForModuleEvent(this.moduleId);
  @override
  List<Object?> get props => [moduleId];
}

class NavigateToModuleEvent extends ModuleEvent {
  final String? moduleId; // null = powrót do głównego poziomu
  const NavigateToModuleEvent(this.moduleId);

  @override
  List<Object?> get props => [moduleId];
}
class UpdateVisitedModulesEvent extends ModuleEvent {
  final List<String> visited;
  const UpdateVisitedModulesEvent(this.visited);

  @override
  List<Object?> get props => [visited];
}


