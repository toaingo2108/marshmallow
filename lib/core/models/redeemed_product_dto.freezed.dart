// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeemed_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RedeemedProductDTO {
  String get id => throw _privateConstructorUsedError;
  String get productID => throw _privateConstructorUsedError;
  Timestamp get redeemedDate => throw _privateConstructorUsedError;
  Timestamp? get deliveryDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RedeemedProductDTOCopyWith<RedeemedProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedeemedProductDTOCopyWith<$Res> {
  factory $RedeemedProductDTOCopyWith(
          RedeemedProductDTO value, $Res Function(RedeemedProductDTO) then) =
      _$RedeemedProductDTOCopyWithImpl<$Res, RedeemedProductDTO>;
  @useResult
  $Res call(
      {String id,
      String productID,
      Timestamp redeemedDate,
      Timestamp? deliveryDate});
}

/// @nodoc
class _$RedeemedProductDTOCopyWithImpl<$Res, $Val extends RedeemedProductDTO>
    implements $RedeemedProductDTOCopyWith<$Res> {
  _$RedeemedProductDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productID = null,
    Object? redeemedDate = null,
    Object? deliveryDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      redeemedDate: null == redeemedDate
          ? _value.redeemedDate
          : redeemedDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RedeemedProductDTOCopyWith<$Res>
    implements $RedeemedProductDTOCopyWith<$Res> {
  factory _$$_RedeemedProductDTOCopyWith(_$_RedeemedProductDTO value,
          $Res Function(_$_RedeemedProductDTO) then) =
      __$$_RedeemedProductDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productID,
      Timestamp redeemedDate,
      Timestamp? deliveryDate});
}

/// @nodoc
class __$$_RedeemedProductDTOCopyWithImpl<$Res>
    extends _$RedeemedProductDTOCopyWithImpl<$Res, _$_RedeemedProductDTO>
    implements _$$_RedeemedProductDTOCopyWith<$Res> {
  __$$_RedeemedProductDTOCopyWithImpl(
      _$_RedeemedProductDTO _value, $Res Function(_$_RedeemedProductDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productID = null,
    Object? redeemedDate = null,
    Object? deliveryDate = freezed,
  }) {
    return _then(_$_RedeemedProductDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      redeemedDate: null == redeemedDate
          ? _value.redeemedDate
          : redeemedDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc

class _$_RedeemedProductDTO extends _RedeemedProductDTO {
  const _$_RedeemedProductDTO(
      {required this.id,
      required this.productID,
      required this.redeemedDate,
      this.deliveryDate})
      : super._();

  @override
  final String id;
  @override
  final String productID;
  @override
  final Timestamp redeemedDate;
  @override
  final Timestamp? deliveryDate;

  @override
  String toString() {
    return 'RedeemedProductDTO(id: $id, productID: $productID, redeemedDate: $redeemedDate, deliveryDate: $deliveryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedeemedProductDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.redeemedDate, redeemedDate) ||
                other.redeemedDate == redeemedDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, productID, redeemedDate, deliveryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedeemedProductDTOCopyWith<_$_RedeemedProductDTO> get copyWith =>
      __$$_RedeemedProductDTOCopyWithImpl<_$_RedeemedProductDTO>(
          this, _$identity);
}

abstract class _RedeemedProductDTO extends RedeemedProductDTO {
  const factory _RedeemedProductDTO(
      {required final String id,
      required final String productID,
      required final Timestamp redeemedDate,
      final Timestamp? deliveryDate}) = _$_RedeemedProductDTO;
  const _RedeemedProductDTO._() : super._();

  @override
  String get id;
  @override
  String get productID;
  @override
  Timestamp get redeemedDate;
  @override
  Timestamp? get deliveryDate;
  @override
  @JsonKey(ignore: true)
  _$$_RedeemedProductDTOCopyWith<_$_RedeemedProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
