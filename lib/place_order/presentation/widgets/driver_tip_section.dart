import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/orders/shared/providers.dart';
import 'package:marshmallow/place_order/presentation/widgets/tip_option.dart';
import 'package:marshmallow/place_order/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';

class DriverTipSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOrder = ref.read(currentOrderProvider)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Marshmallow Driver Tip',
          style: TextStyle(
            color: AppColors.black,
            fontSize: Utils.sizeOf(24),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: Utils.sizeOf(16),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.textFieldBackground,
            borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Utils.sizeOf(5),
            horizontal: Utils.sizeOf(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TipOption(
                tip: currentOrder.subtotal * .15,
              ),
              TipOption(
                tip: currentOrder.subtotal * .15 + 1,
              ),
              TipOption(
                tip: currentOrder.subtotal * .15 + 2,
              ),
              TipOption(
                tip: ref.watch(customTipProvider),
                isCustom: true,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Utils.sizeOf(16),
        ),
        Text(
          '100% of your tip goes to the driver',
          style: TextStyle(
            color: AppColors.black,
            fontSize: Utils.sizeOf(24),
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: Utils.sizeOf(32)),
      ],
    );
  }
}
