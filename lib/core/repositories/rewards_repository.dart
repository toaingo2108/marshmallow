import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/models/order.dart' as order_model;
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/models/product_dto.dart';
import 'package:marshmallow/core/models/redeemed_product.dart';
import 'package:marshmallow/core/models/redeemed_product_dto.dart';
import 'package:marshmallow/core/shared/api_path.dart';

class RewardsRepository {
  /// The product will show as reward eligible if its [pointsPrice] field is not null
  Future<Either<List<Product>, FirebaseFailure>> getRewardProducts() async {
    final docRef = FirebaseFirestore.instance
        .collection(
          APIPath.products(),
        )
        .where('pointsPrice', isNull: false);

    try {
      final docs = await docRef.get();

      final products = docs.docs
          .map((e) => ProductDTO.fromFirestore(e, null).toDomain())
          .toList();
      products.removeWhere(
        (e) => e.rewardUntil != null && DateTime.now().isAfter(e.rewardUntil!),
      );
      return left(products);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }

  Future<Either<List<Future<RedeemedProduct>>, FirebaseFailure>>
      getUserRedeemedRewards(
    String userID,
  ) async {
    final docRef = FirebaseFirestore.instance
        .collection(
          APIPath.rewards(userID),
        )
        .orderBy('redeemedDate', descending: true);

    try {
      final docs = await docRef.get();

      final products = docs.docs.map((e) {
        return RedeemedProductDTO.fromFirestore(e, null).toDomain();
      }).toList();

      return left(products);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }

  Future<Either<Unit, FirebaseFailure>> redeemReward(
    String userID,
    String productID,
  ) async {
    final id = documentIDFromCurrentDate();
    final docRef = FirebaseFirestore.instance.doc(
      APIPath.reward(
        userID,
        id,
      ),
    );

    try {
      await docRef.set(
        RedeemedProductDTO(
          id: id,
          productID: productID,
          redeemedDate: Timestamp.now(),
        ).toFirestore(),
      );
      return left(unit);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }

//? Sets the provided unexpired order's rewards to delivered.
  Future<Either<Unit, FirebaseFailure>> setDeliveryDate(
    order_model.Order order,
    String userID,
  ) async {
    try {
      for (final product in order.rewards) {
        final docRef = FirebaseFirestore.instance
            .collection(
              APIPath.rewards(
                userID,
              ),
            )
            .where('productID', isEqualTo: product.productID)
            .where('deliveryDate', isNull: true)
            .where(
              'redeemedDate',
              isGreaterThanOrEqualTo: DateTime.now().subtract(
                const Duration(days: 30),
              ),
            );
        final rewards = await docRef.get();
        for (final reward in rewards.docs) {
          FirebaseFirestore.instance
              .doc(APIPath.reward(userID, reward.id))
              .update({'deliveryDate': order.date});
        }
      }
      return left(unit);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }
}
