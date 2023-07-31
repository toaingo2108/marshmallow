// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      productID: json['productID'] as String,
      images: json['images'] as List<dynamic>,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      pointsPrice: json['pointsPrice'] as int?,
      rewardedPoints: json['rewardedPoints'] as int?,
      rewardUntil: json['rewardUntil'] == null
          ? null
          : DateTime.parse(json['rewardUntil'] as String),
      stock: json['stock'] as Map<String, dynamic>,
      category: $enumDecode(_$CategoriesEnumMap, json['category']),
      brand: $enumDecode(_$BrandsEnumMap, json['brand']),
      description: json['description'] as String,
      dietary: json['dietary'] as String?,
      ingredients: json['ingredients'] as String,
      unit: json['unit'] as String,
      quantity: json['quantity'] as int? ?? 0,
      isReward: json['isReward'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'images': instance.images,
      'name': instance.name,
      'price': instance.price,
      'salePrice': instance.salePrice,
      'pointsPrice': instance.pointsPrice,
      'rewardedPoints': instance.rewardedPoints,
      'rewardUntil': instance.rewardUntil?.toIso8601String(),
      'stock': instance.stock,
      'category': _$CategoriesEnumMap[instance.category]!,
      'brand': _$BrandsEnumMap[instance.brand]!,
      'description': instance.description,
      'dietary': instance.dietary,
      'ingredients': instance.ingredients,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'isReward': instance.isReward,
    };

const _$CategoriesEnumMap = {
  Categories.none: 'none',
  Categories.iceCream: 'iceCream',
  Categories.chips: 'chips',
  Categories.pizza: 'pizza',
  Categories.chocolate: 'chocolate',
  Categories.snacks: 'snacks',
  Categories.drinks: 'drinks',
  Categories.frozen: 'frozen',
  Categories.alcohol: 'alcohol',
};

const _$BrandsEnumMap = {
  Brands.none: 'none',
  Brands.alphaFood: 'alphaFood',
  Brands.diGiorno: 'diGiorno',
  Brands.cheetos: 'cheetos',
  Brands.kinder: 'kinder',
};
