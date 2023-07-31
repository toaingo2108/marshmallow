import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/models/product_dto.dart';
import 'package:marshmallow/core/shared/api_path.dart';

class ProductRepository {
  Future<List<Product>> getProductsFromMap(
    Map<String, dynamic> productIds,
  ) async {
    final List<Product> products = [];
    for (final String id in productIds.keys.toList()) {
      final docRef = FirebaseFirestore.instance.doc(
        APIPath.product(
          id,
        ),
      );
      final product = await docRef.get();
      if (product.exists) {
        products.add(
          ProductDTO.fromFirestore(
            product,
            null,
            productQuantity: productIds[product.id] as int,
          ).toDomain(),
        );
      } else {
        products.add(ProductDTO.unknownProduct(id).toDomain());
      }
    }
    return products;
  }

  Future<List<Product>> getProductsFromList(List<dynamic> productIds) async {
    final List<Product> products = [];
    for (final id in productIds) {
      final docRef = FirebaseFirestore.instance.doc(
        APIPath.product(
          id.toString(),
        ),
      );
      final product = await docRef.get();
      if (product.exists) {
        products.add(
          ProductDTO.fromFirestore(
            product,
            null,
            productQuantity: 0,
          ).toDomain(),
        );
      }
    }
    return products;
  }

  Future<Either<List<Product>, FirebaseFailure>> getProductByCategory({required String categoryId}) async {
      final docRef = FirebaseFirestore.instance.collection(APIPath.products())
          .where('category', isEqualTo: categoryId, isNull: false);

      try {
        final docs = await docRef.get();

        final products = docs.docs
            .map((e) => ProductDTO.fromFirestore(e, null).toDomain())
            .toList();
        return left(products);
      } catch (e) {
        return right(FirebaseFailure.firestore(e.toString()));
      }

  }

  Future<Product?> getProduct(String productId) async {
    final docRef = FirebaseFirestore.instance.doc(
      APIPath.product(
        productId,
      ),
    );
    Product? product;
    final doc = await docRef.get();
    if (doc.exists) {
      product = ProductDTO.fromFirestore(doc, null).toDomain();
    }
    return product;
  }
}
