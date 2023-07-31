import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/orders/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';

class OrderSummary extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOrder = ref.watch(currentOrderProvider)!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(24),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '\$${currentOrder.subtotal.toStringAsFixed(2)}',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(24),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: Utils.sizeOf(32)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Fee',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(24),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '\$${currentOrder.fee.toStringAsFixed(2)}',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(24),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: Utils.sizeOf(32)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(24),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '\$${currentOrder.tax.toStringAsFixed(2)}',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(24),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: Utils.sizeOf(32)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tip',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(24),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '\$${currentOrder.tip.toStringAsFixed(2)}',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(24),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: Utils.sizeOf(32)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(30),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '\$${currentOrder.getOrderTotal().toStringAsFixed(2)}',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(30),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: Utils.sizeOf(32)),
      ],
    );
  }
}
