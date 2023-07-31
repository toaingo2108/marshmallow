import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';

//TODO: add all
enum Categories { none, iceCream, chips, pizza, chocolate, snacks, drinks, frozen, alcohol}

//TODO: add all
enum Brands { none, alphaFood, diGiorno, cheetos, kinder }

@freezed
class Product with _$Product {
  const Product._();
  const factory Product({
    required String productID,
    required List images,
    required String name,
    required double price,
    double? salePrice,
    int? pointsPrice,
    int? rewardedPoints,
    DateTime? rewardUntil,
    required Map<String, dynamic> stock,
    required Categories category,
    required Brands brand,
    required String description,
    String? dietary,
    required String ingredients,
    required String unit,
    @Default(0) int quantity,
    @Default(false) bool isReward,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

}
