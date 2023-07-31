import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:marshmallow/core/models/redeemed_product.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/rewards/presentation/widgets/widgets.dart';
import 'package:marshmallow/rewards/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/extensions.dart';

//? Widget of a redeemed reward.
class RedeemedRewardItem extends ConsumerWidget {
  const RedeemedRewardItem({
    super.key,
    required this.product,
  });
  final Future<RedeemedProduct> product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(redeemedRewardsSearchQueryProvider);
    return FutureBuilder<RedeemedProduct>(
      future: product,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const PageLoader();
        final redeemedProduct = snapshot.data!;
        return Visibility(
          visible: searchQuery == null ||
              redeemedProduct.product.name
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()),
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 12,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.textFieldBackground,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primaryColor,
              ),
            ),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RewardProductItem(
                      isRedeemed: true,
                      product: redeemedProduct.product,
                      isExpired: redeemedProduct.redeemedDate
                              .add(const Duration(days: 30))
                              .isBefore(
                                DateTime.now(),
                              ) &&
                          redeemedProduct.deliveryDate == null,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          redeemedProduct.deliveryDate != null
                              ? 'Delivered'
                              : redeemedProduct.redeemedDate
                                      .add(const Duration(days: 30))
                                      .isBefore(DateTime.now())
                                  ? 'Expired'
                                  : 'Expires in',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: redeemedProduct.redeemedDate
                                    .add(const Duration(days: 30))
                                    .isBefore(DateTime.now())
                                ? AppColors.errorRed
                                : AppColors.green,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          redeemedProduct.deliveryDate != null
                              ? DateFormat('MMM dd, h:mma')
                                  .format(redeemedProduct.deliveryDate!)
                              : redeemedProduct.redeemedDate
                                      .add(const Duration(days: 30))
                                      .isBefore(DateTime.now())
                                  ? DateFormat('MMM dd, h:mma').format(
                                      redeemedProduct.redeemedDate.add(
                                        const Duration(days: 30),
                                      ),
                                    )
                                  : redeemedProduct.redeemedDate
                                      .formatRewardExpiringTime(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.textColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    width: 75,
                    child: PillButton(
                      title: 'Redeemed',
                      fontSize: 10,
                      fontColor: Colors.white,
                      backgroundColor: AppColors.textColor,
                      onTap: () {},
                      height: 24,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
