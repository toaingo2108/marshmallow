// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get productID => throw _privateConstructorUsedError;
  List<dynamic> get images => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get salePrice => throw _privateConstructorUsedError;
  int? get pointsPrice => throw _privateConstructorUsedError;
  int? get rewardedPoints => throw _privateConstructorUsedError;
  DateTime? get rewardUntil => throw _privateConstructorUsedError;
  Map<String, dynamic> get stock => throw _privateConstructorUsedError;
  Categories get category => throw _privateConstructorUsedError;
  Brands get brand => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get dietary => throw _privateConstructorUsedError;
  String get ingredients => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  bool get isReward => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String productID,
      List<dynamic> images,
      String name,
      double price,
      double? salePrice,
      int? pointsPrice,
      int? rewardedPoints,
      DateTime? rewardUntil,
      Map<String, dynamic> stock,
      Categories category,
      Brands brand,
      String description,
      String? dietary,
      String ingredients,
      String unit,
      int quantity,
      bool isReward});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

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
    Object? pointsPrice = freezed,
    Object? rewardedPoints = freezed,
    Object? rewardUntil = freezed,
    Object? stock = null,
    Object? category = null,
    Object? brand = null,
    Object? description = null,
    Object? dietary = freezed,
    Object? ingredients = null,
    Object? unit = null,
    Object? quantity = null,
    Object? isReward = null,
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
      pointsPrice: freezed == pointsPrice
          ? _value.pointsPrice
          : pointsPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardedPoints: freezed == rewardedPoints
          ? _value.rewardedPoints
          : rewardedPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardUntil: freezed == rewardUntil
          ? _value.rewardUntil
          : rewardUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Categories,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brands,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dietary: freezed == dietary
          ? _value.dietary
          : dietary // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isReward: null == isReward
          ? _value.isReward
          : isReward // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productID,
      List<dynamic> images,
      String name,
      double price,
      double? salePrice,
      int? pointsPrice,
      int? rewardedPoints,
      DateTime? rewardUntil,
      Map<String, dynamic> stock,
      Categories category,
      Brands brand,
      String description,
      String? dietary,
      String ingredients,
      String unit,
      int quantity,
      bool isReward});
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$_Product>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? images = null,
    Object? name = null,
    Object? price = null,
    Object? salePrice = freezed,
    Object? pointsPrice = freezed,
    Object? rewardedPoints = freezed,
    Object? rewardUntil = freezed,
    Object? stock = null,
    Object? category = null,
    Object? brand = null,
    Object? description = null,
    Object? dietary = freezed,
    Object? ingredients = null,
    Object? unit = null,
    Object? quantity = null,
    Object? isReward = null,
  }) {
    return _then(_$_Product(
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
      pointsPrice: freezed == pointsPrice
          ? _value.pointsPrice
          : pointsPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardedPoints: freezed == rewardedPoints
          ? _value.rewardedPoints
          : rewardedPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardUntil: freezed == rewardUntil
          ? _value.rewardUntil
          : rewardUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stock: null == stock
          ? _value._stock
          : stock // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Categories,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brands,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dietary: freezed == dietary
          ? _value.dietary
          : dietary // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isReward: null == isReward
          ? _value.isReward
          : isReward // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product extends _Product {
  const _$_Product(
      {required this.productID,
      required final List<dynamic> images,
      required this.name,
      required this.price,
      this.salePrice,
      this.pointsPrice,
      this.rewardedPoints,
      this.rewardUntil,
      required final Map<String, dynamic> stock,
      required this.category,
      required this.brand,
      required this.description,
      this.dietary,
      required this.ingredients,
      required this.unit,
      this.quantity = 0,
      this.isReward = false})
      : _images = images,
        _stock = stock,
        super._();

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

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
  final int? pointsPrice;
  @override
  final int? rewardedPoints;
  @override
  final DateTime? rewardUntil;
  final Map<String, dynamic> _stock;
  @override
  Map<String, dynamic> get stock {
    if (_stock is EqualUnmodifiableMapView) return _stock;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stock);
  }

  @override
  final Categories category;
  @override
  final Brands brand;
  @override
  final String description;
  @override
  final String? dietary;
  @override
  final String ingredients;
  @override
  final String unit;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final bool isReward;

  @override
  String toString() {
    return 'Product(productID: $productID, images: $images, name: $name, price: $price, salePrice: $salePrice, pointsPrice: $pointsPrice, rewardedPoints: $rewardedPoints, rewardUntil: $rewardUntil, stock: $stock, category: $category, brand: $brand, description: $description, dietary: $dietary, ingredients: $ingredients, unit: $unit, quantity: $quantity, isReward: $isReward)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.pointsPrice, pointsPrice) ||
                other.pointsPrice == pointsPrice) &&
            (identical(other.rewardedPoints, rewardedPoints) ||
                other.rewardedPoints == rewardedPoints) &&
            (identical(other.rewardUntil, rewardUntil) ||
                other.rewardUntil == rewardUntil) &&
            const DeepCollectionEquality().equals(other._stock, _stock) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dietary, dietary) || other.dietary == dietary) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isReward, isReward) ||
                other.isReward == isReward));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productID,
      const DeepCollectionEquality().hash(_images),
      name,
      price,
      salePrice,
      pointsPrice,
      rewardedPoints,
      rewardUntil,
      const DeepCollectionEquality().hash(_stock),
      category,
      brand,
      description,
      dietary,
      ingredients,
      unit,
      quantity,
      isReward);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(
      this,
    );
  }
}

abstract class _Product extends Product {
  const factory _Product(
      {required final String productID,
      required final List<dynamic> images,
      required final String name,
      required final double price,
      final double? salePrice,
      final int? pointsPrice,
      final int? rewardedPoints,
      final DateTime? rewardUntil,
      required final Map<String, dynamic> stock,
      required final Categories category,
      required final Brands brand,
      required final String description,
      final String? dietary,
      required final String ingredients,
      required final String unit,
      final int quantity,
      final bool isReward}) = _$_Product;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

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
  int? get pointsPrice;
  @override
  int? get rewardedPoints;
  @override
  DateTime? get rewardUntil;
  @override
  Map<String, dynamic> get stock;
  @override
  Categories get category;
  @override
  Brands get brand;
  @override
  String get description;
  @override
  String? get dietary;
  @override
  String get ingredients;
  @override
  String get unit;
  @override
  int get quantity;
  @override
  bool get isReward;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
