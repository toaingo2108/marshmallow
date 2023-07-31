import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/models/redeemed_product.dart';
import 'package:marshmallow/core/repositories/product_repository.dart';

part 'redeemed_product_dto.freezed.dart';

@freezed
class RedeemedProductDTO with _$RedeemedProductDTO {
  const RedeemedProductDTO._();
  const factory RedeemedProductDTO({
    required String id,
    required String productID,
    required Timestamp redeemedDate,
    Timestamp? deliveryDate,
  }) = _RedeemedProductDTO;

  factory RedeemedProductDTO.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return RedeemedProductDTO(
      id: data?['id'] as String,
      productID: data?['productID'] as String,
      redeemedDate: data?['redeemedDate'] as Timestamp,
      deliveryDate: data?['deliveryDate'] as Timestamp?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "productID": productID,
      "redeemedDate": redeemedDate,
      "deliveryDate": deliveryDate,
    };
  }

  Future<RedeemedProduct> toDomain() async {
    final product = await ProductRepository().getProduct(productID);

    return RedeemedProduct(
      id: id,
      redeemedDate: redeemedDate.toDate(),
      deliveryDate: deliveryDate?.toDate(),
      product: product ??
          const Product(
            productID: '',
            images: [],
            name: 'Unknown Product',
            price: 0,
            stock: {},
            category: Categories.none,
            brand: Brands.none,
            description: '',
            ingredients: '',
            unit: '',
          ),
    );
  }
}
