// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductDTO {
  String get productID => throw _privateConstructorUsedError;
  List<dynamic> get images => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get salePrice => throw _privateConstructorUsedError;
  int? get rewardedPoints => throw _privateConstructorUsedError;
  Timestamp? get rewardUntil => throw _privateConstructorUsedError;
  int? get pointsPrice =>
      throw _privateConstructorUsedError; //? The key is the warehouseID and the value is the number of stock in that warehouse.
  Map<String, dynamic> get stock => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get ingredients => throw _privateConstructorUsedError;
  String? get dietary => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDTOCopyWith<ProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDTOCopyWith<$Res> {
  factory $ProductDTOCopyWith(
          ProductDTO value, $Res Function(ProductDTO) then) =
      _$ProductDTOCopyWithImpl<$Res, ProductDTO>;
  @useResult
  $Res call(
      {String productID,
      List<dynamic> images,
      String name,
      double price,
      double? salePrice,
      int? rewardedPoints,
      Timestamp? rewardUntil,
      int? pointsPrice,
      Map<String, dynamic> stock,
      String category,
      String brand,
      String description,
      String ingredients,
      String? dietary,
      String unit,
      int? quantity});
}

/// @nodoc
class _$ProductDTOCopyWithImpl<$Res, $Val extends ProductDTO>
    implements $ProductDTOCopyWith<$Res> {
  _$ProductDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? images = null,
    Object? name = null,
    Object? price = null,
    Object? salePrice = freezed,
    Object? rewardedPoints = freezed,
    Object? rewardUntil = freezed,
    Object? pointsPrice = freezed,
    Object? stock = null,
    Object? category = null,
    Object? brand = null,
    Object? description = null,
    Object? ingredients = null,
    Object? dietary = freezed,
    Object? unit = null,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      rewardedPoints: freezed == rewardedPoints
          ? _value.rewardedPoints
          : rewardedPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardUntil: freezed == rewardUntil
          ? _value.rewardUntil
          : rewardUntil // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      pointsPrice: freezed == pointsPrice
          ? _value.pointsPrice
          : pointsPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      dietary: freezed == dietary
          ? _value.dietary
          : dietary // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductDTOCopyWith<$Res>
    implements $ProductDTOCopyWith<$Res> {
  factory _$$_ProductDTOCopyWith(
          _$_ProductDTO value, $Res Function(_$_ProductDTO) then) =
      __$$_ProductDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productID,
      List<dynamic> images,
      String name,
      double price,
      double? salePrice,
      int? rewardedPoints,
      Timestamp? rewardUntil,
      int? pointsPrice,
      Map<String, dynamic> stock,
      String category,
      String brand,
      String description,
      String ingredients,
      String? dietary,
      String unit,
      int? quantity});
}

/// @nodoc
class __$$_ProductDTOCopyWithImpl<$Res>
    extends _$ProductDTOCopyWithImpl<$Res, _$_ProductDTO>
    implements _$$_ProductDTOCopyWith<$Res> {
  __$$_ProductDTOCopyWithImpl(
      _$_ProductDTO _value, $Res Function(_$_ProductDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? images = null,
    Object? name = null,
    Object? price = null,
    Object? salePrice = freezed,
    Object? rewardedPoints = freezed,
    Object? rewardUntil = freezed,
    Object? pointsPrice = freezed,
    Object? stock = null,
    Object? category = null,
    Object? brand = null,
    Object? description = null,
    Object? ingredients = null,
    Object? dietary = freezed,
    Object? unit = null,
    Object? quantity = freezed,
  }) {
    return _then(_$_ProductDTO(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      rewardedPoints: freezed == rewardedPoints
          ? _value.rewardedPoints
          : rewardedPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardUntil: freezed == rewardUntil
          ? _value.rewardUntil
          : rewardUntil // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      pointsPrice: freezed == pointsPrice
          ? _value.pointsPrice
          : pointsPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      stock: null == stock
          ? _value._stock
          : stock // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      dietary: freezed == dietary
          ? _value.dietary
          : dietary // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ProductDTO extends _ProductDTO {
  const _$_ProductDTO(
      {required this.productID,
      required final List<dynamic> images,
      required this.name,
      required this.price,
      this.salePrice,
      this.rewardedPoints,
      this.rewardUntil,
      this.pointsPrice,
      required final Map<String, dynamic> stock,
      required this.category,
      required this.brand,
      required this.description,
      required this.ingredients,
      this.dietary,
      required this.unit,
      this.quantity})
      : _images = images,
        _stock = stock,
        super._();

  @override
  final String productID;
  final List<dynamic> _images;
  @override
  List<dynamic> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String name;
  @override
  final double price;
  @override
  final double? salePrice;
  @override
  final int? rewardedPoints;
  @override
  final Timestamp? rewardUntil;
  @override
  final int? pointsPrice;
//? The key is the warehouseID and the value is the number of stock in that warehouse.
  final Map<String, dynamic> _stock;
//? The key is the warehouseID and the value is the number of stock in that warehouse.
  @override
  Map<String, dynamic> get stock {
    if (_stock is EqualUnmodifiableMapView) return _stock;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stock);
  }

  @override
  final String category;
  @override
  final String brand;
  @override
  final String description;
  @override
  final String ingredients;
  @override
  final String? dietary;
  @override
  final String unit;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'ProductDTO(productID: $productID, images: $images, name: $name, price: $price, salePrice: $salePrice, rewardedPoints: $rewardedPoints, rewardUntil: $rewardUntil, pointsPrice: $pointsPrice, stock: $stock, category: $category, brand: $brand, description: $description, ingredients: $ingredients, dietary: $dietary, unit: $unit, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDTO &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.rewardedPoints, rewardedPoints) ||
                other.rewardedPoints == rewardedPoints) &&
            (identical(other.rewardUntil, rewardUntil) ||
                other.rewardUntil == rewardUntil) &&
            (identical(other.pointsPrice, pointsPrice) ||
                other.pointsPrice == pointsPrice) &&
            const DeepCollectionEquality().equals(other._stock, _stock) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients) &&
            (identical(other.dietary, dietary) || other.dietary == dietary) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productID,
      const DeepCollectionEquality().hash(_images),
      name,
      price,
      salePrice,
      rewardedPoints,
      rewardUntil,
      pointsPrice,
      const DeepCollectionEquality().hash(_stock),
      category,
      brand,
      description,
      ingredients,
      dietary,
      unit,
      quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDTOCopyWith<_$_ProductDTO> get copyWith =>
      __$$_ProductDTOCopyWithImpl<_$_ProductDTO>(this, _$identity);
}

abstract class _ProductDTO extends ProductDTO {
  const factory _ProductDTO(
      {required final String productID,
      required final List<dynamic> images,
      required final String name,
      required final double price,
      final double? salePrice,
      final int? rewardedPoints,
      final Timestamp? rewardUntil,
      final int? pointsPrice,
      required final Map<String, dynamic> stock,
      required final String category,
      required final String brand,
      required final String description,
      required final String ingredients,
      final String? dietary,
      required final String unit,
      final int? quantity}) = _$_ProductDTO;
  const _ProductDTO._() : super._();

  @override
  String get productID;
  @override
  List<dynamic> get images;
  @override
  String get name;
  @override
  double get price;
  @override
  double? get salePrice;
  @override
  int? get rewardedPoints;
  @override
  Timestamp? get rewardUntil;
  @override
  int? get pointsPrice;
  @override //? The key is the warehouseID and the value is the number of stock in that warehouse.
  Map<String, dynamic> get stock;
  @override
  String get category;
  @override
  String get brand;
  @override
  String get description;
  @override
  String get ingredients;
  @override
  String? get dietary;
  @override
  String get unit;
  @override
  int? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDTOCopyWith<_$_ProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
