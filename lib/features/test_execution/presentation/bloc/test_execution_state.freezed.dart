// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_execution_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestExecutionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestExecutionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestExecutionState()';
}


}

/// @nodoc
class $TestExecutionStateCopyWith<$Res>  {
$TestExecutionStateCopyWith(TestExecutionState _, $Res Function(TestExecutionState) __);
}


/// Adds pattern-matching-related methods to [TestExecutionState].
extension TestExecutionStatePatterns on TestExecutionState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TestExecutionInitial value)?  initial,TResult Function( TestExecutionLoading value)?  loading,TResult Function( TestExecutionSuccess value)?  success,TResult Function( TestExecutionFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TestExecutionInitial() when initial != null:
return initial(_that);case TestExecutionLoading() when loading != null:
return loading(_that);case TestExecutionSuccess() when success != null:
return success(_that);case TestExecutionFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TestExecutionInitial value)  initial,required TResult Function( TestExecutionLoading value)  loading,required TResult Function( TestExecutionSuccess value)  success,required TResult Function( TestExecutionFailure value)  failure,}){
final _that = this;
switch (_that) {
case TestExecutionInitial():
return initial(_that);case TestExecutionLoading():
return loading(_that);case TestExecutionSuccess():
return success(_that);case TestExecutionFailure():
return failure(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TestExecutionInitial value)?  initial,TResult? Function( TestExecutionLoading value)?  loading,TResult? Function( TestExecutionSuccess value)?  success,TResult? Function( TestExecutionFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TestExecutionInitial() when initial != null:
return initial(_that);case TestExecutionLoading() when loading != null:
return loading(_that);case TestExecutionSuccess() when success != null:
return success(_that);case TestExecutionFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProjectEntity> projects,  ProjectStructureEntity? structure,  String? exportFilePath)?  success,TResult Function( String errorMessage)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TestExecutionInitial() when initial != null:
return initial();case TestExecutionLoading() when loading != null:
return loading();case TestExecutionSuccess() when success != null:
return success(_that.projects,_that.structure,_that.exportFilePath);case TestExecutionFailure() when failure != null:
return failure(_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProjectEntity> projects,  ProjectStructureEntity? structure,  String? exportFilePath)  success,required TResult Function( String errorMessage)  failure,}) {final _that = this;
switch (_that) {
case TestExecutionInitial():
return initial();case TestExecutionLoading():
return loading();case TestExecutionSuccess():
return success(_that.projects,_that.structure,_that.exportFilePath);case TestExecutionFailure():
return failure(_that.errorMessage);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProjectEntity> projects,  ProjectStructureEntity? structure,  String? exportFilePath)?  success,TResult? Function( String errorMessage)?  failure,}) {final _that = this;
switch (_that) {
case TestExecutionInitial() when initial != null:
return initial();case TestExecutionLoading() when loading != null:
return loading();case TestExecutionSuccess() when success != null:
return success(_that.projects,_that.structure,_that.exportFilePath);case TestExecutionFailure() when failure != null:
return failure(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class TestExecutionInitial implements TestExecutionState {
  const TestExecutionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestExecutionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestExecutionState.initial()';
}


}




/// @nodoc


class TestExecutionLoading implements TestExecutionState {
  const TestExecutionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestExecutionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestExecutionState.loading()';
}


}




/// @nodoc


class TestExecutionSuccess implements TestExecutionState {
  const TestExecutionSuccess({required final  List<ProjectEntity> projects, this.structure, this.exportFilePath}): _projects = projects;
  

 final  List<ProjectEntity> _projects;
 List<ProjectEntity> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

 final  ProjectStructureEntity? structure;
 final  String? exportFilePath;

/// Create a copy of TestExecutionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestExecutionSuccessCopyWith<TestExecutionSuccess> get copyWith => _$TestExecutionSuccessCopyWithImpl<TestExecutionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestExecutionSuccess&&const DeepCollectionEquality().equals(other._projects, _projects)&&(identical(other.structure, structure) || other.structure == structure)&&(identical(other.exportFilePath, exportFilePath) || other.exportFilePath == exportFilePath));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),structure,exportFilePath);

@override
String toString() {
  return 'TestExecutionState.success(projects: $projects, structure: $structure, exportFilePath: $exportFilePath)';
}


}

/// @nodoc
abstract mixin class $TestExecutionSuccessCopyWith<$Res> implements $TestExecutionStateCopyWith<$Res> {
  factory $TestExecutionSuccessCopyWith(TestExecutionSuccess value, $Res Function(TestExecutionSuccess) _then) = _$TestExecutionSuccessCopyWithImpl;
@useResult
$Res call({
 List<ProjectEntity> projects, ProjectStructureEntity? structure, String? exportFilePath
});




}
/// @nodoc
class _$TestExecutionSuccessCopyWithImpl<$Res>
    implements $TestExecutionSuccessCopyWith<$Res> {
  _$TestExecutionSuccessCopyWithImpl(this._self, this._then);

  final TestExecutionSuccess _self;
  final $Res Function(TestExecutionSuccess) _then;

/// Create a copy of TestExecutionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projects = null,Object? structure = freezed,Object? exportFilePath = freezed,}) {
  return _then(TestExecutionSuccess(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntity>,structure: freezed == structure ? _self.structure : structure // ignore: cast_nullable_to_non_nullable
as ProjectStructureEntity?,exportFilePath: freezed == exportFilePath ? _self.exportFilePath : exportFilePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TestExecutionFailure implements TestExecutionState {
  const TestExecutionFailure({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of TestExecutionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestExecutionFailureCopyWith<TestExecutionFailure> get copyWith => _$TestExecutionFailureCopyWithImpl<TestExecutionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestExecutionFailure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'TestExecutionState.failure(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TestExecutionFailureCopyWith<$Res> implements $TestExecutionStateCopyWith<$Res> {
  factory $TestExecutionFailureCopyWith(TestExecutionFailure value, $Res Function(TestExecutionFailure) _then) = _$TestExecutionFailureCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$TestExecutionFailureCopyWithImpl<$Res>
    implements $TestExecutionFailureCopyWith<$Res> {
  _$TestExecutionFailureCopyWithImpl(this._self, this._then);

  final TestExecutionFailure _self;
  final $Res Function(TestExecutionFailure) _then;

/// Create a copy of TestExecutionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(TestExecutionFailure(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
