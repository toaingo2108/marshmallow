// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(Map<String, List<Product>> data)
        loadProductByCategory,
    required TResult Function(List<Category> categories) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult? Function(List<Category> categories)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult Function(List<Category> categories)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Idle value) idle,
    required TResult Function(_LoadProductByCategory value)
        loadProductByCategory,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

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
    extends _$HomeStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'HomeState.loading()';
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
    required TResult Function(Map<String, List<Product>> data)
        loadProductByCategory,
    required TResult Function(List<Category> categories) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult? Function(List<Category> categories)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult Function(List<Category> categories)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
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
    required TResult Function(_LoadProductByCategory value)
        loadProductByCategory,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends HomeState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_IdleCopyWith<$Res> {
  factory _$$_IdleCopyWith(_$_Idle value, $Res Function(_$_Idle) then) =
      __$$_IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IdleCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res, _$_Idle>
    implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Idle extends _Idle {
  const _$_Idle() : super._();

  @override
  String toString() {
    return 'HomeState.idle()';
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
    required TResult Function(Map<String, List<Product>> data)
        loadProductByCategory,
    required TResult Function(List<Category> categories) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult? Function(List<Category> categories)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult Function(List<Category> categories)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
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
    required TResult Function(_LoadProductByCategory value)
        loadProductByCategory,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle extends HomeState {
  const factory _Idle() = _$_Idle;
  const _Idle._() : super._();
}

/// @nodoc
abstract class _$$_LoadProductByCategoryCopyWith<$Res> {
  factory _$$_LoadProductByCategoryCopyWith(_$_LoadProductByCategory value,
          $Res Function(_$_LoadProductByCategory) then) =
      __$$_LoadProductByCategoryCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, List<Product>> data});
}

/// @nodoc
class __$$_LoadProductByCategoryCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_LoadProductByCategory>
    implements _$$_LoadProductByCategoryCopyWith<$Res> {
  __$$_LoadProductByCategoryCopyWithImpl(_$_LoadProductByCategory _value,
      $Res Function(_$_LoadProductByCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_LoadProductByCategory(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Product>>,
    ));
  }
}

/// @nodoc

class _$_LoadProductByCategory extends _LoadProductByCategory {
  const _$_LoadProductByCategory(
      {required final Map<String, List<Product>> data})
      : _data = data,
        super._();

  final Map<String, List<Product>> _data;
  @override
  Map<String, List<Product>> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'HomeState.loadProductByCategory(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadProductByCategory &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadProductByCategoryCopyWith<_$_LoadProductByCategory> get copyWith =>
      __$$_LoadProductByCategoryCopyWithImpl<_$_LoadProductByCategory>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(Map<String, List<Product>> data)
        loadProductByCategory,
    required TResult Function(List<Category> categories) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
  }) {
    return loadProductByCategory(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult? Function(List<Category> categories)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
  }) {
    return loadProductByCategory?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult Function(List<Category> categories)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    required TResult orElse(),
  }) {
    if (loadProductByCategory != null) {
      return loadProductByCategory(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Idle value) idle,
    required TResult Function(_LoadProductByCategory value)
        loadProductByCategory,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
  }) {
    return loadProductByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
  }) {
    return loadProductByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    required TResult orElse(),
  }) {
    if (loadProductByCategory != null) {
      return loadProductByCategory(this);
    }
    return orElse();
  }
}

abstract class _LoadProductByCategory extends HomeState {
  const factory _LoadProductByCategory(
          {required final Map<String, List<Product>> data}) =
      _$_LoadProductByCategory;
  const _LoadProductByCategory._() : super._();

  Map<String, List<Product>> get data;
  @JsonKey(ignore: true)
  _$$_LoadProductByCategoryCopyWith<_$_LoadProductByCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Category> categories});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$_Success(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$_Success extends _Success {
  const _$_Success({required final List<Category> categories})
      : _categories = categories,
        super._();

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'HomeState.success(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

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
    required TResult Function(Map<String, List<Product>> data)
        loadProductByCategory,
    required TResult Function(List<Category> categories) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
  }) {
    return success(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult? Function(List<Category> categories)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
  }) {
    return success?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult Function(List<Category> categories)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Idle value) idle,
    required TResult Function(_LoadProductByCategory value)
        loadProductByCategory,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends HomeState {
  const factory _Success({required final List<Category> categories}) =
      _$_Success;
  const _Success._() : super._();

  List<Category> get categories;
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
    extends _$HomeStateCopyWithImpl<$Res, _$_FirebaseFailure>
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
    return 'HomeState.firebaseFailure(failure: $failure)';
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
    required TResult Function(Map<String, List<Product>> data)
        loadProductByCategory,
    required TResult Function(List<Category> categories) success,
    required TResult Function(FirebaseFailure failure) firebaseFailure,
  }) {
    return firebaseFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult? Function(List<Category> categories)? success,
    TResult? Function(FirebaseFailure failure)? firebaseFailure,
  }) {
    return firebaseFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(Map<String, List<Product>> data)? loadProductByCategory,
    TResult Function(List<Category> categories)? success,
    TResult Function(FirebaseFailure failure)? firebaseFailure,
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
    required TResult Function(_LoadProductByCategory value)
        loadProductByCategory,
    required TResult Function(_Success value) success,
    required TResult Function(_FirebaseFailure value) firebaseFailure,
  }) {
    return firebaseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult? Function(_Success value)? success,
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
  }) {
    return firebaseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Idle value)? idle,
    TResult Function(_LoadProductByCategory value)? loadProductByCategory,
    TResult Function(_Success value)? success,
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    required TResult orElse(),
  }) {
    if (firebaseFailure != null) {
      return firebaseFailure(this);
    }
    return orElse();
  }
}

abstract class _FirebaseFailure extends HomeState {
  const factory _FirebaseFailure(final FirebaseFailure failure) =
      _$_FirebaseFailure;
  const _FirebaseFailure._() : super._();

  FirebaseFailure get failure;
  @JsonKey(ignore: true)
  _$$_FirebaseFailureCopyWith<_$_FirebaseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
