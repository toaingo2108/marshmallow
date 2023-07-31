// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firestore_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FirebaseFailure {
  String? get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) firestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? firestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? firestore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Api value) firestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Api value)? firestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Api value)? firestore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirebaseFailureCopyWith<FirebaseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseFailureCopyWith<$Res> {
  factory $FirebaseFailureCopyWith(
          FirebaseFailure value, $Res Function(FirebaseFailure) then) =
      _$FirebaseFailureCopyWithImpl<$Res, FirebaseFailure>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class _$FirebaseFailureCopyWithImpl<$Res, $Val extends FirebaseFailure>
    implements $FirebaseFailureCopyWith<$Res> {
  _$FirebaseFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$_ApiCopyWith<$Res> implements $FirebaseFailureCopyWith<$Res> {
  factory _$$_ApiCopyWith(_$_Api value, $Res Function(_$_Api) then) =
      __$$_ApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$_ApiCopyWithImpl<$Res>
    extends _$FirebaseFailureCopyWithImpl<$Res, _$_Api>
    implements _$$_ApiCopyWith<$Res> {
  __$$_ApiCopyWithImpl(_$_Api _value, $Res Function(_$_Api) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_Api(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Api extends _Api {
  const _$_Api(this.error) : super._();

  @override
  final String? error;

  @override
  String toString() {
    return 'FirebaseFailure.firestore(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Api &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiCopyWith<_$_Api> get copyWith =>
      __$$_ApiCopyWithImpl<_$_Api>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) firestore,
  }) {
    return firestore(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? firestore,
  }) {
    return firestore?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? firestore,
    required TResult orElse(),
  }) {
    if (firestore != null) {
      return firestore(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Api value) firestore,
  }) {
    return firestore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Api value)? firestore,
  }) {
    return firestore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Api value)? firestore,
    required TResult orElse(),
  }) {
    if (firestore != null) {
      return firestore(this);
    }
    return orElse();
  }
}

abstract class _Api extends FirebaseFailure {
  const factory _Api(final String? error) = _$_Api;
  const _Api._() : super._();

  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_ApiCopyWith<_$_Api> get copyWith => throw _privateConstructorUsedError;
}
