// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeemed_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RedeemedProduct {
  String get id => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  DateTime get redeemedDate => throw _privateConstructorUsedError;
  DateTime? get deliveryDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RedeemedProductCopyWith<RedeemedProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedeemedProductCopyWith<$Res> {
  factory $RedeemedProductCopyWith(
          RedeemedProduct value, $Res Function(RedeemedProduct) then) =
      _$RedeemedProductCopyWithImpl<$Res, RedeemedProduct>;
  @useResult
  $Res call(
      {String id,
      Product product,
      DateTime redeemedDate,
      DateTime? deliveryDate});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$RedeemedProductCopyWithImpl<$Res, $Val extends RedeemedProduct>
    implements $RedeemedProductCopyWith<$Res> {
  _$RedeemedProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? redeemedDate = null,
    Object? deliveryDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      redeemedDate: null == redeemedDate
          ? _value.redeemedDate
          : redeemedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RedeemedProductCopyWith<$Res>
    implements $RedeemedProductCopyWith<$Res> {
  factory _$$_RedeemedProductCopyWith(
          _$_RedeemedProduct value, $Res Function(_$_RedeemedProduct) then) =
      __$$_RedeemedProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Product product,
      DateTime redeemedDate,
      DateTime? deliveryDate});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_RedeemedProductCopyWithImpl<$Res>
    extends _$RedeemedProductCopyWithImpl<$Res, _$_RedeemedProduct>
    implements _$$_RedeemedProductCopyWith<$Res> {
  __$$_RedeemedProductCopyWithImpl(
      _$_RedeemedProduct _value, $Res Function(_$_RedeemedProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? redeemedDate = null,
    Object? deliveryDate = freezed,
  }) {
    return _then(_$_RedeemedProduct(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      redeemedDate: null == redeemedDate
          ? _value.redeemedDate
          : redeemedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_RedeemedProduct extends _RedeemedProduct {
  const _$_RedeemedProduct(
      {required this.id,
      required this.product,
      required this.redeemedDate,
      required this.deliveryDate})
      : super._();

  @override
  final String id;
  @override
  final Product product;
  @override
  final DateTime redeemedDate;
  @override
  final DateTime? deliveryDate;

  @override
  String toString() {
    return 'RedeemedProduct(id: $id, product: $product, redeemedDate: $redeemedDate, deliveryDate: $deliveryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedeemedProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.redeemedDate, redeemedDate) ||
                other.redeemedDate == redeemedDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, product, redeemedDate, deliveryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedeemedProductCopyWith<_$_RedeemedProduct> get copyWith =>
      __$$_RedeemedProductCopyWithImpl<_$_RedeemedProduct>(this, _$identity);
}

abstract class _RedeemedProduct extends RedeemedProduct {
  const factory _RedeemedProduct(
      {required final String id,
      required final Product product,
      required final DateTime redeemedDate,
      required final DateTime? deliveryDate}) = _$_RedeemedProduct;
  const _RedeemedProduct._() : super._();

  @override
  String get id;
  @override
  Product get product;
  @override
  DateTime get redeemedDate;
  @override
  DateTime? get deliveryDate;
  @override
  @JsonKey(ignore: true)
  _$$_RedeemedProductCopyWith<_$_RedeemedProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
