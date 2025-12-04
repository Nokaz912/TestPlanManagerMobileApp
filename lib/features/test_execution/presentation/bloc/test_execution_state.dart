import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../project_list/domain/entities/project.dart';
import '../../domain/entities/project_structure.dart';

part 'test_execution_state.freezed.dart';

@freezed
sealed class TestExecutionState with _$TestExecutionState {
  const factory TestExecutionState.initial() = TestExecutionInitial;

  const factory TestExecutionState.loading() = TestExecutionLoading;

  const factory TestExecutionState.success({
    required List<ProjectEntity> projects,
    ProjectStructureEntity? structure,
    String? exportFilePath,
  }) = TestExecutionSuccess;

  const factory TestExecutionState.failure({
    required String errorMessage,
  }) = TestExecutionFailure;
}
