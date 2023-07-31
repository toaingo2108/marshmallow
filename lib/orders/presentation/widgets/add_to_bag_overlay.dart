import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/models/order.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:material_symbols_icons/symbols.dart';

class AddToBagOverlay extends ConsumerWidget {
  const AddToBagOverlay(
    this.order, {
    super.key,
  });
  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 28,
              ),
              const Text(
                'Add these items to your bag?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.textColor,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textFieldBackground,
                  ),
                  child: const Icon(
                    Symbols.close,
                    color: AppColors.textColor,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: PillButton(
                    title: 'Nevermind',
                    onTap: () => Navigator.pop(context),
                    backgroundColor: Colors.white,
                    borderColor: AppColors.darkPrimaryColor,
                    fontColor: AppColors.darkPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: PillButton(
                    title: 'YES',
                    onTap: () {
                      Navigator.pop(context);
                      final myBag = ref.read(itemsDataMyBag);
                      for (final product in order.products) {
                        final index = myBag.indexWhere(
                          (element) =>
                              element.productID == product.productID &&
                              !element.isReward,
                        );
                        if (index != -1) {
                          myBag[index] = myBag[index].copyWith(
                            quantity: myBag[index].quantity + product.quantity,
                          );
                        } else {
                          myBag.add(product);
                        }
                      }
                      ref.read(itemsDataMyBag.notifier).state = myBag;
                      ref.read(myBagRepositoryProvider).setMyBag(myBag);

                      context.router.push(const MyBagRoute());
                    },
                    backgroundColor: AppColors.darkPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
