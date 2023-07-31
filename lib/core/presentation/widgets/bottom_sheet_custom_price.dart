import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/orders/shared/providers.dart';
import 'package:marshmallow/place_order/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/theme/app_theme.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

Future<void> showBottomSheetCustomPrice({
  required BuildContext context,
  required WidgetRef ref,
  required double maxPrice,
  required double currentPrice,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return CustomTipPrice(
        maxPrice: maxPrice,
        currentPrice: currentPrice,
      );
    },
  );
}

class CustomTipPrice extends ConsumerStatefulWidget {
  final double maxPrice;
  final double currentPrice;

  const CustomTipPrice({required this.maxPrice, this.currentPrice = 0.0});

  @override
  ConsumerState<CustomTipPrice> createState() => _CustomTipPriceState();
}

class _CustomTipPriceState extends ConsumerState<CustomTipPrice> {
  late double localVal;
  @override
  void initState() {
    super.initState();
    localVal = widget.currentPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.sizeOf(600),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(30)),
                alignment: Alignment.center,
                child: Text(
                  "Custom Tip",
                  style: TextStyle(
                    fontSize: Utils.sizeOf(30),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TouchableOpacity(
                onTap: () {
                  AutoRouter.of(context).pop(0.0);
                },
                activeOpacity: 0.4,
                child: Container(
                  width: Utils.sizeOf(50),
                  height: Utils.sizeOf(50),
                  margin: EdgeInsets.only(right: Utils.sizeOf(30)),
                  decoration: const BoxDecoration(
                    color: AppColors.textFieldBackground,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Symbols.expand_more,
                    size: Utils.sizeOf(50),
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Utils.sizeOf(30),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$0.0",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      "\$${widget.maxPrice}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          child: SliderTheme(
                            data: AppTheme().customSlider,
                            child: Slider(
                              onChanged: (val) {
                                localVal = val;
                                setState(() {});
                              },
                              value: localVal,
                              max: 10,
                              label: ' \$${localVal.toStringAsFixed(2)} ',
                            ),
                          ),
                        )
                      ],
                    ),
                    Text('\$${localVal.toStringAsFixed(2)}'),
                    SizedBox(
                      height: Utils.sizeOf(50),
                    ),
                  ],
                ),
                SizedBox(
                  height: Utils.sizeOf(10),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Utils.sizeOf(60),
          ),
          TouchableOpacity(
            onTap: () {
              ref.read(customTipProvider.notifier).state = localVal;
              ref
                  .read(currentOrderProvider.notifier)
                  .update((state) => state?.copyWith(tip: localVal));
              context.router.pop();
            },
            activeOpacity: 0.4,
            child: Container(
              height: Utils.sizeOf(72),
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: Utils.paddingHorizontal(),
                vertical: Utils.sizeOf(16),
              ),
              decoration: BoxDecoration(
                color: AppColors.darkPrimaryColor,
                borderRadius: BorderRadius.circular(Utils.sizeOf(30)),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: Utils.sizeOf(28),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
