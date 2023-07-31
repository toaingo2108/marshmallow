import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marshmallow/core/models/product.dart';
part 'product_dto.freezed.dart';

@freezed
class ProductDTO with _$ProductDTO {
  const ProductDTO._();
  const factory ProductDTO({
    required String productID,
    required List images,
    required String name,
    required double price,
    double? salePrice,
    int? rewardedPoints,
    Timestamp? rewardUntil,
    int? pointsPrice,
    //? The key is the warehouseID and the value is the number of stock in that warehouse.
    required Map<String, dynamic> stock,
    required String category,
    required String brand,
    required String description,
    required String ingredients,
    String? dietary,
    required String unit,
    int? quantity,
  }) = _ProductDTO;

  factory ProductDTO.unknownProduct(String id) => ProductDTO(
        productID: id,
        images: [],
        name: 'Unknown product',
        price: 0,
        stock: {},
        category: 'none',
        brand: 'none',
        description: 'unknown',
        ingredients: 'unknown',
        unit: 'unit',
      );

  factory ProductDTO.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    SnapshotOptions? options, {
    int? productQuantity,
  }) {
    final data = snapshot.data();
    return ProductDTO(
      productID: data?['productID'] as String,
      images: data?['images'] as List,
      name: data?['name'] as String,
      price: data?['price'] as double,
      salePrice: data?['salePrice'] as double?,
      rewardedPoints: data?['rewardedPoints'] as int?,
      pointsPrice: data?['pointsPrice'] as int?,
      stock: data?['stock'] as Map<String, dynamic>,
      category: data?['category'] as String,
      brand: data?['brand'] as String,
      description: data?['description'] as String,
      ingredients: data?['ingredients'] as String,
      dietary: data?['dietary'] as String?,
      unit: data?['unit'] as String,
      rewardUntil: data?['rewardUntil'] as Timestamp?,
      quantity: productQuantity ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "productID": productID,
      "images": images,
      "name": name,
      "price": price,
      "salePrice": salePrice,
      "rewardedPoints": rewardedPoints,
      "pointsPrice": pointsPrice,
      "stock": stock,
      "category": category,
      "brand": brand,
      "description": description,
      "ingredients": ingredients,
      "dietary": dietary,
      "unit": unit,
      "rewardUntil": rewardUntil,
    };
  }

  Product toDomain() => Product(
        productID: productID,
        images: images,
        name: name,
        salePrice: salePrice,
        price: price,
        stock: stock,
        rewardUntil: rewardUntil?.toDate(),
        category: mapOfCategories.containsKey(category)
            ? mapOfCategories[category]!
            : Categories.none,
        brand:
            mapOfBrands.containsKey(brand) ? mapOfBrands[brand]! : Brands.none,
        description: description,
        ingredients: ingredients,
        pointsPrice: pointsPrice,
        rewardedPoints: rewardedPoints,
        dietary: dietary,
        unit: unit,
        quantity: quantity ?? 0,
      );

  static const Map<String, Categories> mapOfCategories = {
    'iceCream': Categories.iceCream,
    'chips': Categories.chips,
    'pizza': Categories.pizza,
    'chocolate': Categories.chocolate
  };

  static const Map<String, Brands> mapOfBrands = {
    'alphaFood': Brands.alphaFood,
    'diGiorno': Brands.diGiorno,
    'cheetos': Brands.cheetos,
    'kinder': Brands.kinder
  };
}
