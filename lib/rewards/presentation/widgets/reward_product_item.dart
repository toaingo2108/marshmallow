import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/home/shared/providers.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';
import 'package:marshmallow/rewards/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A reward product item. [isRedeemed] is true if its on the redeemed rewards page.
class RewardProductItem extends ConsumerWidget {
  const RewardProductItem({
    super.key,
    this.isRedeemed = false,
    this.isExpired = false,
    required this.product,
  });

  final bool isRedeemed;
  final bool isExpired;
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPoints = ref.watch(userInfoProvider)?.rewardPoints ?? 0;
    return GestureDetector(
      onTap: () {
        final dataMyBag = ref.read(itemsDataMyBag.notifier).state;

        for (final element in dataMyBag) {
          if (element.productID == product.productID && !element.isReward) {
            ref.read(itemProduct.notifier).update((state) => element);
            break;
          } else {
            ref.read(itemProduct.notifier).update((state) => product);
          }
        }
        if (dataMyBag.isEmpty) {
          ref.read(itemProduct.notifier).update((state) => product);
        }

        context.router.push(const ProductRoute());
      },
      child: Container(
        width: isRedeemed ? 125 : null,
        margin: isRedeemed
            ? EdgeInsets.zero
            : const EdgeInsets.only(bottom: 12, left: 20, right: 15),
        decoration: BoxDecoration(
          color: isExpired
              ? AppColors.red.withOpacity(0.15)
              : isRedeemed
                  ? AppColors.green.withOpacity(0.15)
                  : AppColors.pink4,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: isRedeemed ? 80 : 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isRedeemed
                          ? Colors.white
                          : AppColors.textFieldBackground,
                    ),
                    child: product.images.isNotEmpty
                        ? Image.network(
                            product.images.first.toString(),
                            fit: BoxFit.contain,
                          )
                        : const SizedBox(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 9,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    product.unit,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 7.5,
                      color: AppColors.darkGray,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (!isRedeemed)
                    Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: PillButton(
                            title:
                                '${NumberFormat.compact().format(product.pointsPrice)} Points',
                            fontSize: 10,
                            fontWeight: userPoints >= product.pointsPrice!
                                ? FontWeight.w700
                                : FontWeight.w400,
                            fontColor: userPoints >= product.pointsPrice!
                                ? Colors.white
                                : AppColors.textColor,
                            backgroundColor: userPoints >= product.pointsPrice!
                                ? AppColors.darkPrimaryColor
                                : Colors.white,
                            leading: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Icon(
                                userPoints >= product.pointsPrice!
                                    ? Icons.lock_open
                                    : Symbols.lock,
                                color: userPoints >= product.pointsPrice!
                                    ? Colors.white
                                    : AppColors.textColor,
                                size: 14,
                              ),
                            ),
                            height: 25,
                            onTap: () {
                              if (userPoints >= product.pointsPrice!) {
                                ref
                                    .read(
                                      redeemedRewardsNotifierProvider.notifier,
                                    )
                                    .redeemReward(ref, product);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  if (!isRedeemed)
                    const SizedBox(
                      width: 22,
                    ),
                ],
              ),
            ),
            if (!isRedeemed &&
                product.rewardUntil != null &&
                product.rewardUntil!.difference(DateTime.now()).inDays <= 3)
              const Positioned(
                top: 2,
                right: 2,
                child: Icon(
                  Symbols.schedule,
                  fill: 1,
                  color: AppColors.darkPrimaryColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}
