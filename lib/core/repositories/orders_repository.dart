import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/models/order.dart' as order_model;
import 'package:marshmallow/core/models/order_dto.dart';
import 'package:marshmallow/core/shared/api_path.dart';

class OrdersRepository {
  OrdersRepository(this.userID);
  final String userID;
  final db = FirebaseFirestore.instance;
  Future<
      Either<Stream<Map<String, Future<order_model.Order>>>,
          FirebaseFailure>> getOrders() async {
    final docRef = db
        .collection(
          APIPath.userOrdersCollection(
            userID,
          ),
        )
        .orderBy('date', descending: true);
    try {
      final Map<String, Future<order_model.Order>> orders = {};
      final snapshots = docRef.snapshots();
      final stream = snapshots.map((event) {
        for (final docChange in event.docChanges) {
          final orderDTO = OrderDTO.fromFirestore(docChange.doc, null);
          final order = orderDTO.toDomain();
          orders[docChange.doc.id] = order;
        }
        return orders;
      });

      return left(stream);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }

//? Creates an order in firebase.
  Future<Either<Unit, FirebaseFailure>> createOrder(
    order_model.Order order,
  ) async {
    final id = documentIDFromCurrentDate();
    final myOrder = order.copyWith(orderID: id, date: DateTime.now());
    final docRef = db
        .doc(
          APIPath.order(userID, id),
        )
        .withConverter(
          fromFirestore: OrderDTO.fromFirestore,
          toFirestore: (OrderDTO order, options) => order.toFirestore(),
        );

    try {
      await docRef.set(myOrder.toDTO());
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
    return left(unit);
  }
}
