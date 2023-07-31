// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$APIFailure {
  String? get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) google,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? google,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? google,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Google value) google,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Google value)? google,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Google value)? google,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $APIFailureCopyWith<APIFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIFailureCopyWith<$Res> {
  factory $APIFailureCopyWith(
          APIFailure value, $Res Function(APIFailure) then) =
      _$APIFailureCopyWithImpl<$Res, APIFailure>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class _$APIFailureCopyWithImpl<$Res, $Val extends APIFailure>
    implements $APIFailureCopyWith<$Res> {
  _$APIFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleCopyWith<$Res> implements $APIFailureCopyWith<$Res> {
  factory _$$_GoogleCopyWith(_$_Google value, $Res Function(_$_Google) then) =
      __$$_GoogleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$_GoogleCopyWithImpl<$Res>
    extends _$APIFailureCopyWithImpl<$Res, _$_Google>
    implements _$$_GoogleCopyWith<$Res> {
  __$$_GoogleCopyWithImpl(_$_Google _value, $Res Function(_$_Google) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_Google(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Google extends _Google {
  const _$_Google(this.error) : super._();

  @override
  final String? error;

  @override
  String toString() {
    return 'APIFailure.google(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Google &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleCopyWith<_$_Google> get copyWith =>
      __$$_GoogleCopyWithImpl<_$_Google>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) google,
  }) {
    return google(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? google,
  }) {
    return google?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? google,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Google value) google,
  }) {
    return google(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Google value)? google,
  }) {
    return google?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Google value)? google,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google(this);
    }
    return orElse();
  }
}

abstract class _Google extends APIFailure {
  const factory _Google(final String? error) = _$_Google;
  const _Google._() : super._();

  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleCopyWith<_$_Google> get copyWith =>
      throw _privateConstructorUsedError;
}
