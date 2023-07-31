import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marshmallow/address/domain/address.dart';
import 'package:marshmallow/core/models/driver.dart';
import 'package:marshmallow/core/models/order_dto.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/shared/api_path.dart';
import 'package:marshmallow/utils/extensions.dart';
part 'order.freezed.dart';

enum OrderStatus {
  confirmed,
  packing,
  driving,
  delivered,
}

enum PaymentMethod {
  applePay,
  googlePay,
}

@freezed
class Order with _$Order {
  static const defaultFee = 3.95;
  const Order._();
  const factory Order({
    required List<Product> products,
    required List<Product> rewards,
    required String orderID,
    required OrderStatus status,
    required DateTime date,
    required double subtotal,
    required double fee,
    required double tip,
    required double tax,
    required PaymentMethod paymentMethod,
    required Address? address,
    required Driver driver,
    DateTime? scheduledDelivery,
    required bool isFasterDelivery,
  }) = _Order;

  factory Order.defaultOrder(
    List<Product> products,
    List<Product> rewards,
    Address? address,
  ) {
    double subTotal = 0;
    for (final product in products) {
      if (!product.isReward) {
        subTotal += product.price * product.quantity;
      }
    }

    final defaultTip = subTotal * .15 + 1;
    return Order(
      products: products,
      orderID: documentIDFromCurrentDate(),
      status: OrderStatus.confirmed,
      date: DateTime.now(),
      subtotal: subTotal,
      fee: defaultFee,
      rewards: rewards,
      tip: defaultTip,
      paymentMethod: Platform.isIOS || Platform.isMacOS
          ? PaymentMethod.applePay
          : PaymentMethod.googlePay,
      address: address,
      tax: 0.0,
      driver: const Driver(),
      isFasterDelivery: false,
    );
  }

  OrderDTO toDTO() {
    final Map<String, dynamic> productIds = {};

    for (final product in products) {
      productIds[product.productID] = product.quantity;
    }

    return OrderDTO(
      products: productIds,
      orderID: orderID,
      status: status.statusToString(),
      date: Timestamp.fromDate(date),
      subtotal: subtotal,
      fee: fee,
      tip: tip,
      rewards: rewards.map((e) => e.productID).toList(),
      paymentMethod: paymentMethod.paymentMethodToString(),
      addressID: address!.id!,
      driverID: driver.driverID,
      tax: tax,
      scheduledDelivery: scheduledDelivery != null
          ? Timestamp.fromDate(scheduledDelivery!)
          : null,
      isFasterDelivery: isFasterDelivery,
    );
  }

  double getOrderTotal() => subtotal + fee + tip + tax;

  int getOrderPoints() {
    int total = 0;
    for (final product in products) {
      if (product.rewardedPoints != null) {
        total += product.rewardedPoints! * product.quantity;
      }
    }
    return total;
  }
}
