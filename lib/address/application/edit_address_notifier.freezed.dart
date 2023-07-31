// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_address_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditAddressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Address> addresses) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function(PermissionFailure failure) permissionFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Address> addresses)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function(PermissionFailure failure)? permissionFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Address> addresses)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function(PermissionFailure failure)? permissionFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_PermissionFailure value) permissionFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_PermissionFailure value)? permissionFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_PermissionFailure value)? permissionFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditAddressStateCopyWith<$Res> {
  factory $EditAddressStateCopyWith(
          EditAddressState value, $Res Function(EditAddressState) then) =
      _$EditAddressStateCopyWithImpl<$Res, EditAddressState>;
}

/// @nodoc
class _$EditAddressStateCopyWithImpl<$Res, $Val extends EditAddressState>
    implements $EditAddressStateCopyWith<$Res> {
  _$EditAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$EditAddressStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'EditAddressState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Address> addresses) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function(PermissionFailure failure) permissionFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Address> addresses)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function(PermissionFailure failure)? permissionFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Address> addresses)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function(PermissionFailure failure)? permissionFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_PermissionFailure value) permissionFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_PermissionFailure value)? permissionFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_PermissionFailure value)? permissionFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends EditAddressState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_IdleCopyWith<$Res> {
  factory _$$_IdleCopyWith(_$_Idle value, $Res Function(_$_Idle) then) =
      __$$_IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IdleCopyWithImpl<$Res>
    extends _$EditAddressStateCopyWithImpl<$Res, _$_Idle>
    implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Idle extends _Idle {
  const _$_Idle() : super._();

  @override
  String toString() {
    return 'EditAddressState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Address> addresses) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function(PermissionFailure failure) permissionFailure,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Address> addresses)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function(PermissionFailure failure)? permissionFailure,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Address> addresses)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function(PermissionFailure failure)? permissionFailure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_PermissionFailure value) permissionFailure,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_PermissionFailure value)? permissionFailure,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_PermissionFailure value)? permissionFailure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle extends EditAddressState {
  const factory _Idle() = _$_Idle;
  const _Idle._() : super._();
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Address> addresses});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$EditAddressStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = null,
  }) {
    return _then(_$_Success(
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
    ));
  }
}

/// @nodoc

class _$_Success extends _Success {
  const _$_Success({required final List<Address> addresses})
      : _addresses = addresses,
        super._();

  final List<Address> _addresses;
  @override
  List<Address> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  String toString() {
    return 'EditAddressState.success(addresses: $addresses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_addresses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Address> addresses) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function(PermissionFailure failure) permissionFailure,
  }) {
    return success(addresses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Address> addresses)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function(PermissionFailure failure)? permissionFailure,
  }) {
    return success?.call(addresses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Address> addresses)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function(PermissionFailure failure)? permissionFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(addresses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_PermissionFailure value) permissionFailure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_PermissionFailure value)? permissionFailure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_PermissionFailure value)? permissionFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends EditAddressState {
  const factory _Success({required final List<Address> addresses}) = _$_Success;
  const _Success._() : super._();

  List<Address> get addresses;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FirebaseFailureCopyWith<$Res> {
  factory _$$_FirebaseFailureCopyWith(
          _$_FirebaseFailure value, $Res Function(_$_FirebaseFailure) then) =
      __$$_FirebaseFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({FirebaseFailure failure});

  $FirebaseFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_FirebaseFailureCopyWithImpl<$Res>
    extends _$EditAddressStateCopyWithImpl<$Res, _$_FirebaseFailure>
    implements _$$_FirebaseFailureCopyWith<$Res> {
  __$$_FirebaseFailureCopyWithImpl(
      _$_FirebaseFailure _value, $Res Function(_$_FirebaseFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_FirebaseFailure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as FirebaseFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FirebaseFailureCopyWith<$Res> get failure {
    return $FirebaseFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_FirebaseFailure extends _FirebaseFailure {
  const _$_FirebaseFailure(this.failure) : super._();

  @override
  final FirebaseFailure failure;

  @override
  String toString() {
    return 'EditAddressState.firebaseFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirebaseFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FirebaseFailureCopyWith<_$_FirebaseFailure> get copyWith =>
      __$$_FirebaseFailureCopyWithImpl<_$_FirebaseFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Address> addresses) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function(PermissionFailure failure) permissionFailure,
  }) {
    return firebaseFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Address> addresses)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function(PermissionFailure failure)? permissionFailure,
  }) {
    return firebaseFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Address> addresses)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function(PermissionFailure failure)? permissionFailure,
    required TResult orElse(),
  }) {
    if (firebaseFailure != null) {
      return firebaseFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_PermissionFailure value) permissionFailure,
  }) {
    return firebaseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_PermissionFailure value)? permissionFailure,
  }) {
    return firebaseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_PermissionFailure value)? permissionFailure,
    required TResult orElse(),
  }) {
    if (firebaseFailure != null) {
      return firebaseFailure(this);
    }
    return orElse();
  }
}

abstract class _FirebaseFailure extends EditAddressState {
  const factory _FirebaseFailure(final FirebaseFailure failure) =
      _$_FirebaseFailure;
  const _FirebaseFailure._() : super._();

  FirebaseFailure get failure;
  @JsonKey(ignore: true)
  _$$_FirebaseFailureCopyWith<_$_FirebaseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PermissionFailureCopyWith<$Res> {
  factory _$$_PermissionFailureCopyWith(_$_PermissionFailure value,
          $Res Function(_$_PermissionFailure) then) =
      __$$_PermissionFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PermissionFailure failure});

  $PermissionFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_PermissionFailureCopyWithImpl<$Res>
    extends _$EditAddressStateCopyWithImpl<$Res, _$_PermissionFailure>
    implements _$$_PermissionFailureCopyWith<$Res> {
  __$$_PermissionFailureCopyWithImpl(
      _$_PermissionFailure _value, $Res Function(_$_PermissionFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_PermissionFailure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as PermissionFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionFailureCopyWith<$Res> get failure {
    return $PermissionFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_PermissionFailure extends _PermissionFailure {
  const _$_PermissionFailure(this.failure) : super._();

  @override
  final PermissionFailure failure;

  @override
  String toString() {
    return 'EditAddressState.permissionFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PermissionFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PermissionFailureCopyWith<_$_PermissionFailure> get copyWith =>
      __$$_PermissionFailureCopyWithImpl<_$_PermissionFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Address> addresses) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function(PermissionFailure failure) permissionFailure,
  }) {
    return permissionFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Address> addresses)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function(PermissionFailure failure)? permissionFailure,
  }) {
    return permissionFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Address> addresses)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function(PermissionFailure failure)? permissionFailure,
    required TResult orElse(),
  }) {
    if (permissionFailure != null) {
      return permissionFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_PermissionFailure value) permissionFailure,
  }) {
    return permissionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_PermissionFailure value)? permissionFailure,
  }) {
    return permissionFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_PermissionFailure value)? permissionFailure,
    required TResult orElse(),
  }) {
    if (permissionFailure != null) {
      return permissionFailure(this);
    }
    return orElse();
  }
}

abstract class _PermissionFailure extends EditAddressState {
  const factory _PermissionFailure(final PermissionFailure failure) =
      _$_PermissionFailure;
  const _PermissionFailure._() : super._();

  PermissionFailure get failure;
  @JsonKey(ignore: true)
  _$$_PermissionFailureCopyWith<_$_PermissionFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
