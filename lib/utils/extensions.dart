import 'package:marshmallow/core/models/order.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

extension IsValidEmail on String {
  bool isValidEmail() => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(this);

  String? toPhoneNumber() {
    if (isNotEmpty) {
      if (length == 11) {
        return MaskTextInputFormatter(
          mask: '+# ###-###-####',
          initialText: this,
        ).getMaskedText();
      } else if (length == 12) {
        return MaskTextInputFormatter(
          mask: '+## ###-###-####',
          initialText: this,
        ).getMaskedText();
      } else {
        return MaskTextInputFormatter(
          mask: '+### ###-###-####',
          initialText: this,
        ).getMaskedText();
      }
    }
    return null;
  }
}

extension FormatDate on DateTime {
  String formatRewardExpiringTime() {
    final days =
        add(const Duration(days: 30)).difference(DateTime.now()).inDays;
    final hours =
        add(const Duration(days: 30)).difference(DateTime.now()).inHours -
            days * 24;
    final minutes =
        add(const Duration(days: 30)).difference(DateTime.now()).inMinutes -
            days * 24 * 60 -
            hours * 60;
    return '$days d, ${hours}h and ${minutes}m';
  }
}

extension ConvertToString on OrderStatus {
  String statusToString() {
    switch (this) {
      case OrderStatus.confirmed:
        return 'confirmed';
      case OrderStatus.packing:
        return 'packing';
      case OrderStatus.driving:
        return 'driving';
      case OrderStatus.delivered:
        return 'delivered';
      default:
        return 'confirmed';
    }
  }
}

extension ToString on PaymentMethod {
  String paymentMethodToString() {
    switch (this) {
      case PaymentMethod.applePay:
        return 'applePay';
      case PaymentMethod.googlePay:
        return 'googlePay';
      default:
        return 'applePay';
    }
  }
}
