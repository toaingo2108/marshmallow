import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/orders/shared/providers.dart';
import 'package:marshmallow/place_order/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';

class TipOption extends ConsumerWidget {
  const TipOption({
    required this.tip,
    this.isCustom = false,
  });

  final double tip;
  final bool isCustom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOrder = ref.watch(currentOrderProvider);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(currentOrderProvider.notifier).update(
                (state) => state?.copyWith(
                  tip: isCustom ? ref.read(customTipProvider) : tip,
                ),
              );
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Utils.sizeOf(20),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
            color: currentOrder?.tip == tip
                ? AppColors.primaryColor
                : AppColors.textFieldBackground,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$${tip.toStringAsFixed(2)}',
                style: TextStyle(
                  color: currentOrder?.tip == tip
                      ? AppColors.white
                      : AppColors.black,
                  fontSize: Utils.sizeOf(24),
                  fontFamily: 'Poppins',
                  fontWeight: currentOrder?.tip == tip
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
              if (isCustom && currentOrder?.tip == tip)
                TouchableOpacity(
                  onTap: () {
                    showBottomSheetCustomPrice(
                      context: context,
                      ref: ref,
                      maxPrice: 10,
                      currentPrice: ref.read(customTipProvider),
                    );
                  },
                  activeOpacity: 0.4,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: Utils.sizeOf(10),
                    ),
                    width: Utils.sizeOf(32),
                    height: Utils.sizeOf(32),
                    child: Image.asset('assets/images/ic_edit1.png'),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
