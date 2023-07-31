import 'dart:io';

import 'package:marshmallow/core/models/order.dart';
import 'package:marshmallow/core/repositories/payment_configurations.dart';
import 'package:pay/pay.dart';

class CheckoutRepository {
  //? Returns True if the payment was successful;
  Future<bool> pay(Order order) async {
    final paymentItems = [
      ...order.products
          .map(
            (e) => PaymentItem(
              label: '${e.name} x${e.quantity}',
              amount: e.salePrice != null
                  ? (e.salePrice! * e.quantity).toStringAsFixed(2)
                  : (e.price * e.quantity).toStringAsFixed(2),
              status: PaymentItemStatus.final_price,
            ),
          )
          .toList(),
      ...order.rewards.map(
        (e) => PaymentItem(
          label: 'Redeemed Reward (${e.name}) x1',
          amount: '0.00',
          status: PaymentItemStatus.final_price,
        ),
      ),
      PaymentItem(
        label: 'Delivery fee',
        amount: order.fee.toStringAsFixed(2),
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Tax',
        amount: order.tax.toStringAsFixed(2),
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Driver tip',
        amount: order.tip.toStringAsFixed(2),
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Total',
        amount: order.getOrderTotal().toStringAsFixed(2),
        status: PaymentItemStatus.final_price,
      ),
    ];

    final payClient = Pay({
      PayProvider.google_pay: PaymentConfiguration.fromJsonString(
        defaultGooglePay,
      ),
      PayProvider.apple_pay: PaymentConfiguration.fromJsonString(
        defaultApplePay,
      ),
    });
    final canPay = await payClient.userCanPay(
      Platform.isIOS || Platform.isMacOS
          ? PayProvider.apple_pay
          : PayProvider.google_pay,
    );
    if (canPay) {
      final result = await payClient.showPaymentSelector(
        Platform.isIOS || Platform.isMacOS
            ? PayProvider.apple_pay
            : PayProvider.google_pay,
        paymentItems,
      );

      return (Platform.isIOS || Platform.isMacOS)
          ? result.containsKey('token') && result['token'] != null
          : result.containsKey('paymentMethodData') &&
              (result['paymentMethodData'] as Map)
                  .containsKey('tokenizationData') &&
              // ignore: avoid_dynamic_calls
              (result['paymentMethodData']['tokenizationData'] as Map)
                  .containsKey('token') &&
              // ignore: avoid_dynamic_calls
              result['paymentMethodData']['tokenizationData']['token'] != null;
    }
    return false;
  }
}
