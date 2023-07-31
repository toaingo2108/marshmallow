// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeemed_rewards_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RedeemedRewardsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Future<RedeemedProduct>> redeemedRewards)
        success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function() redeemed,
    required TResult Function() redeemedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function()? redeemed,
    TResult? Function()? redeemedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function()? redeemed,
    TResult Function()? redeemedFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_Redeemed value) redeemed,
    required TResult Function(_RedeemedFailure value) redeemedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_Redeemed value)? redeemed,
    TResult? Function(_RedeemedFailure value)? redeemedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_Redeemed value)? redeemed,
    TResult Function(_RedeemedFailure value)? redeemedFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedeemedRewardsStateCopyWith<$Res> {
  factory $RedeemedRewardsStateCopyWith(RedeemedRewardsState value,
          $Res Function(RedeemedRewardsState) then) =
      _$RedeemedRewardsStateCopyWithImpl<$Res, RedeemedRewardsState>;
}

/// @nodoc
class _$RedeemedRewardsStateCopyWithImpl<$Res,
        $Val extends RedeemedRewardsState>
    implements $RedeemedRewardsStateCopyWith<$Res> {
  _$RedeemedRewardsStateCopyWithImpl(this._value, this._then);

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
    extends _$RedeemedRewardsStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'RedeemedRewardsState.loading()';
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
    required TResult Function(List<Future<RedeemedProduct>> redeemedRewards)
        success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function() redeemed,
    required TResult Function() redeemedFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function()? redeemed,
    TResult? Function()? redeemedFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function()? redeemed,
    TResult Function()? redeemedFailure,
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
    required TResult Function(_Redeemed value) redeemed,
    required TResult Function(_RedeemedFailure value) redeemedFailure,
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
    TResult? Function(_Redeemed value)? redeemed,
    TResult? Function(_RedeemedFailure value)? redeemedFailure,
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
    TResult Function(_Redeemed value)? redeemed,
    TResult Function(_RedeemedFailure value)? redeemedFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends RedeemedRewardsState {
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
    extends _$RedeemedRewardsStateCopyWithImpl<$Res, _$_Idle>
    implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Idle extends _Idle {
  const _$_Idle() : super._();

  @override
  String toString() {
    return 'RedeemedRewardsState.idle()';
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
    required TResult Function(List<Future<RedeemedProduct>> redeemedRewards)
        success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function() redeemed,
    required TResult Function() redeemedFailure,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function()? redeemed,
    TResult? Function()? redeemedFailure,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function()? redeemed,
    TResult Function()? redeemedFailure,
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
    required TResult Function(_Redeemed value) redeemed,
    required TResult Function(_RedeemedFailure value) redeemedFailure,
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
    TResult? Function(_Redeemed value)? redeemed,
    TResult? Function(_RedeemedFailure value)? redeemedFailure,
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
    TResult Function(_Redeemed value)? redeemed,
    TResult Function(_RedeemedFailure value)? redeemedFailure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle extends RedeemedRewardsState {
  const factory _Idle() = _$_Idle;
  const _Idle._() : super._();
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Future<RedeemedProduct>> redeemedRewards});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$RedeemedRewardsStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redeemedRewards = null,
  }) {
    return _then(_$_Success(
      redeemedRewards: null == redeemedRewards
          ? _value._redeemedRewards
          : redeemedRewards // ignore: cast_nullable_to_non_nullable
              as List<Future<RedeemedProduct>>,
    ));
  }
}

/// @nodoc

class _$_Success extends _Success {
  const _$_Success(
      {required final List<Future<RedeemedProduct>> redeemedRewards})
      : _redeemedRewards = redeemedRewards,
        super._();

  final List<Future<RedeemedProduct>> _redeemedRewards;
  @override
  List<Future<RedeemedProduct>> get redeemedRewards {
    if (_redeemedRewards is EqualUnmodifiableListView) return _redeemedRewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_redeemedRewards);
  }

  @override
  String toString() {
    return 'RedeemedRewardsState.success(redeemedRewards: $redeemedRewards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality()
                .equals(other._redeemedRewards, _redeemedRewards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_redeemedRewards));

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
    required TResult Function(List<Future<RedeemedProduct>> redeemedRewards)
        success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function() redeemed,
    required TResult Function() redeemedFailure,
  }) {
    return success(redeemedRewards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function()? redeemed,
    TResult? Function()? redeemedFailure,
  }) {
    return success?.call(redeemedRewards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function()? redeemed,
    TResult Function()? redeemedFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(redeemedRewards);
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
    required TResult Function(_Redeemed value) redeemed,
    required TResult Function(_RedeemedFailure value) redeemedFailure,
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
    TResult? Function(_Redeemed value)? redeemed,
    TResult? Function(_RedeemedFailure value)? redeemedFailure,
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
    TResult Function(_Redeemed value)? redeemed,
    TResult Function(_RedeemedFailure value)? redeemedFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends RedeemedRewardsState {
  const factory _Success(
          {required final List<Future<RedeemedProduct>> redeemedRewards}) =
      _$_Success;
  const _Success._() : super._();

  List<Future<RedeemedProduct>> get redeemedRewards;
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
    extends _$RedeemedRewardsStateCopyWithImpl<$Res, _$_FirebaseFailure>
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
    return 'RedeemedRewardsState.firebaseFailure(failure: $failure)';
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
    required TResult Function(List<Future<RedeemedProduct>> redeemedRewards)
        success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function() redeemed,
    required TResult Function() redeemedFailure,
  }) {
    return firebaseFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function()? redeemed,
    TResult? Function()? redeemedFailure,
  }) {
    return firebaseFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function()? redeemed,
    TResult Function()? redeemedFailure,
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
    required TResult Function(_Redeemed value) redeemed,
    required TResult Function(_RedeemedFailure value) redeemedFailure,
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
    TResult? Function(_Redeemed value)? redeemed,
    TResult? Function(_RedeemedFailure value)? redeemedFailure,
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
    TResult Function(_Redeemed value)? redeemed,
    TResult Function(_RedeemedFailure value)? redeemedFailure,
    required TResult orElse(),
  }) {
    if (firebaseFailure != null) {
      return firebaseFailure(this);
    }
    return orElse();
  }
}

abstract class _FirebaseFailure extends RedeemedRewardsState {
  const factory _FirebaseFailure(final FirebaseFailure failure) =
      _$_FirebaseFailure;
  const _FirebaseFailure._() : super._();

  FirebaseFailure get failure;
  @JsonKey(ignore: true)
  _$$_FirebaseFailureCopyWith<_$_FirebaseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RedeemedCopyWith<$Res> {
  factory _$$_RedeemedCopyWith(
          _$_Redeemed value, $Res Function(_$_Redeemed) then) =
      __$$_RedeemedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RedeemedCopyWithImpl<$Res>
    extends _$RedeemedRewardsStateCopyWithImpl<$Res, _$_Redeemed>
    implements _$$_RedeemedCopyWith<$Res> {
  __$$_RedeemedCopyWithImpl(
      _$_Redeemed _value, $Res Function(_$_Redeemed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Redeemed extends _Redeemed {
  const _$_Redeemed() : super._();

  @override
  String toString() {
    return 'RedeemedRewardsState.redeemed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Redeemed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Future<RedeemedProduct>> redeemedRewards)
        success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function() redeemed,
    required TResult Function() redeemedFailure,
  }) {
    return redeemed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function()? redeemed,
    TResult? Function()? redeemedFailure,
  }) {
    return redeemed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function()? redeemed,
    TResult Function()? redeemedFailure,
    required TResult orElse(),
  }) {
    if (redeemed != null) {
      return redeemed();
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
    required TResult Function(_Redeemed value) redeemed,
    required TResult Function(_RedeemedFailure value) redeemedFailure,
  }) {
    return redeemed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_Redeemed value)? redeemed,
    TResult? Function(_RedeemedFailure value)? redeemedFailure,
  }) {
    return redeemed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_Redeemed value)? redeemed,
    TResult Function(_RedeemedFailure value)? redeemedFailure,
    required TResult orElse(),
  }) {
    if (redeemed != null) {
      return redeemed(this);
    }
    return orElse();
  }
}

abstract class _Redeemed extends RedeemedRewardsState {
  const factory _Redeemed() = _$_Redeemed;
  const _Redeemed._() : super._();
}

/// @nodoc
abstract class _$$_RedeemedFailureCopyWith<$Res> {
  factory _$$_RedeemedFailureCopyWith(
          _$_RedeemedFailure value, $Res Function(_$_RedeemedFailure) then) =
      __$$_RedeemedFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RedeemedFailureCopyWithImpl<$Res>
    extends _$RedeemedRewardsStateCopyWithImpl<$Res, _$_RedeemedFailure>
    implements _$$_RedeemedFailureCopyWith<$Res> {
  __$$_RedeemedFailureCopyWithImpl(
      _$_RedeemedFailure _value, $Res Function(_$_RedeemedFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RedeemedFailure extends _RedeemedFailure {
  const _$_RedeemedFailure() : super._();

  @override
  String toString() {
    return 'RedeemedRewardsState.redeemedFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RedeemedFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(List<Future<RedeemedProduct>> redeemedRewards)
        success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
    required TResult Function() redeemed,
    required TResult Function() redeemedFailure,
  }) {
    return redeemedFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
    TResult? Function()? redeemed,
    TResult? Function()? redeemedFailure,
  }) {
    return redeemedFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(List<Future<RedeemedProduct>> redeemedRewards)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    TResult Function()? redeemed,
    TResult Function()? redeemedFailure,
    required TResult orElse(),
  }) {
    if (redeemedFailure != null) {
      return redeemedFailure();
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
    required TResult Function(_Redeemed value) redeemed,
    required TResult Function(_RedeemedFailure value) redeemedFailure,
  }) {
    return redeemedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_Redeemed value)? redeemed,
    TResult? Function(_RedeemedFailure value)? redeemedFailure,
  }) {
    return redeemedFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_Redeemed value)? redeemed,
    TResult Function(_RedeemedFailure value)? redeemedFailure,
    required TResult orElse(),
  }) {
    if (redeemedFailure != null) {
      return redeemedFailure(this);
    }
    return orElse();
  }
}

abstract class _RedeemedFailure extends RedeemedRewardsState {
  const factory _RedeemedFailure() = _$_RedeemedFailure;
  const _RedeemedFailure._() : super._();
}
