import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlng/latlng.dart';
import 'package:marshmallow/address/domain/address.dart';
import 'package:marshmallow/core/models/driver.dart';
import 'package:marshmallow/core/models/order.dart' as order;
import 'package:marshmallow/core/repositories/product_repository.dart';

part 'order_dto.freezed.dart';

@freezed
class OrderDTO with _$OrderDTO {
  const OrderDTO._();
  const factory OrderDTO({
    required Map<String, dynamic> products,
    required String orderID,
    required String status,
    required Timestamp date,
    required double subtotal,
    required double fee,
    required double tip,
    required String paymentMethod,
    required String addressID,
    required String? driverID,
    required double tax,
    required Timestamp? scheduledDelivery,
    required bool isFasterDelivery,
    required List<dynamic> rewards,
  }) = _OrderDTO;

  factory OrderDTO.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return OrderDTO(
      products: data?['products'] as Map<String, dynamic>,
      orderID: data?['orderID'] as String,
      status: data?['status'] as String,
      date: data?['date'] as Timestamp,
      subtotal: data?['subtotal'] as double,
      fee: data?['fee'] as double,
      tip: data?['tip'] as double,
      paymentMethod: data?['paymentMethod'] as String,
      addressID: data?['addressID'] as String,
      driverID: data?['driverID'] as String?,
      tax: data?['tax'] as double,
      rewards: data?['rewards'] as List<dynamic>,
      scheduledDelivery: data?['scheduledDelivery'] as Timestamp?,
      isFasterDelivery: data?['isFasterDelivery'] as bool,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "products": products,
      "orderID": orderID,
      "status": status,
      "date": date,
      "subtotal": subtotal,
      "fee": fee,
      "tip": tip,
      "tax": tax,
      "paymentMethod": paymentMethod,
      "addressID": addressID,
      "driverID": driverID,
      "scheduledDelivery": scheduledDelivery,
      "isFasterDelivery": isFasterDelivery,
      "rewards": rewards,
    };
  }

  Future<order.Order> toDomain() async {
    final finalStatus = toOrderStatus(status);
    final finalPaymentMethod = toPaymentMethod(paymentMethod);
    final finalProducts =
        await ProductRepository().getProductsFromMap(products);
    final finalRewards = await ProductRepository().getProductsFromList(rewards);

    return order.Order(
      products: finalProducts,
      orderID: orderID,
      status: finalStatus,
      date: date.toDate(),
      tax: tax,
      subtotal: subtotal,
      fee: fee,
      rewards: finalRewards,
      tip: tip,
      paymentMethod: finalPaymentMethod,
      address: const Address(coordinates: LatLng(1, 1)),
      driver: const Driver(),
      scheduledDelivery: scheduledDelivery?.toDate(),
      isFasterDelivery: isFasterDelivery,
    );
  }

  order.OrderStatus toOrderStatus(String status) {
    late order.OrderStatus finalStatus;
    switch (status) {
      case 'confirmed':
        finalStatus = order.OrderStatus.confirmed;
        break;
      case 'packing':
        finalStatus = order.OrderStatus.packing;
        break;
      case 'driving':
        finalStatus = order.OrderStatus.driving;
        break;
      case 'delivered':
        finalStatus = order.OrderStatus.delivered;
        break;
      default:
        finalStatus = order.OrderStatus.confirmed;
    }
    return finalStatus;
  }

  order.PaymentMethod toPaymentMethod(String method) {
    late order.PaymentMethod paymentMethod;
    switch (method) {
      case 'applePay':
        paymentMethod = order.PaymentMethod.applePay;
        break;
      case 'googlePay':
        paymentMethod = order.PaymentMethod.googlePay;
        break;

      default:
        paymentMethod = order.PaymentMethod.applePay;
    }
    return paymentMethod;
  }
}
