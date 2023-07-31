import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/models/order.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/orders/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/functions.dart';
import 'package:marshmallow/utils/size_utils.dart';

class ItemOptionDelivery extends ConsumerWidget {
  const ItemOptionDelivery({
    this.price,
    this.isFaster,
    required this.time,
  });

  final double? price;
  final bool? isFaster;
  final String time;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOrderNotifier = ref.read(currentOrderProvider.notifier);
    final currentOrder = ref.watch(currentOrderProvider);
    return TouchableOpacity(
      onTap: () async {
        if (isFaster == null) {
          final pickedDate = await showDateTimePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().add(const Duration(minutes: 30)),
            lastDate: DateTime.now().add(const Duration(days: 10)),
          );
          currentOrderNotifier.update(
            (state) => state?.copyWith(scheduledDelivery: pickedDate),
          );
        } else {
          currentOrderNotifier.update(
            (state) => state?.copyWith(
              isFasterDelivery: isFaster!,
              scheduledDelivery: null,
              fee: price != null ? state.fee + price! : Order.defaultFee,
            ),
          );
        }
      },
      activeOpacity: 0.4,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: Utils.sizeOf(272),
            ),
            height: Utils.sizeOf(120),
            padding: const EdgeInsets.only(right: 10),
            margin: EdgeInsets.only(
              right: Utils.sizeOf(20),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Utils.sizeOf(24),
              ),
              border: Border.all(
                color: (isFaster == null
                        ? currentOrder?.scheduledDelivery != null
                        : currentOrder!.isFasterDelivery == isFaster! &&
                            currentOrder.scheduledDelivery == null)
                    ? AppColors.darkPrimaryColor
                    : Colors.transparent,
                width: Utils.sizeOf(2),
              ),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(3.0, 0.0),
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: Utils.sizeOf(66),
                  decoration: BoxDecoration(
                    color: AppColors.lightPurple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Utils.sizeOf(24)),
                      bottomLeft: Radius.circular(Utils.sizeOf(24)),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(10)),
                  child: Center(
                    child: Image.asset(
                      isFaster == null
                          ? 'assets/images/img_clock.png'
                          : 'assets/images/img_lightning.png',
                      width: Utils.sizeOf(60),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: Utils.sizeOf(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isFaster == null
                            ? 'Schedule'
                            : isFaster!
                                ? 'Faster'
                                : 'Fast',
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: Utils.sizeOf(24),
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          color: AppColors.darkPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: Utils.sizeOf(24),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (price != null)
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightPurple,
                borderRadius:
                    BorderRadius.all(Radius.circular(Utils.sizeOf(24))),
              ),
              margin: EdgeInsets.only(
                right: Utils.sizeOf(30),
                top: Utils.sizeOf(10),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Utils.sizeOf(10),
                vertical: Utils.sizeOf(1),
              ),
              child: Text(
                '\$$price',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: Utils.sizeOf(20),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
