import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marshmallow/core/models/order.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/orders/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/app_colors.dart';

class OrderEntry extends StatelessWidget {
  const OrderEntry({
    super.key,
    required this.order,
  });

  final Future<Order> order;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Order>(
      future: order,
      builder: (context, orderDetails) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 5,
                color: AppColors.textColor.withOpacity(.15),
              )
            ],
            color: AppColors.textFieldBackground,
          ),
          padding: const EdgeInsets.all(15),
          child: !orderDetails.hasData
              ? const Center(
                  child: PageLoader(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 68,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: orderDetails.data!.products.length +
                            orderDetails.data!.rewards.length,
                        itemBuilder: (context, index) {
                          final allProducts = [
                            ...orderDetails.data!.products,
                            ...orderDetails.data!.rewards
                          ];
                          return OrderProductImage(
                            imageURL: allProducts[index].images.isNotEmpty
                                ? allProducts[index].images.first.toString()
                                : null,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${orderDetails.data!.products.map((e) => e.name).join(', ')}${orderDetails.data!.rewards.isNotEmpty ? ', ' : ''}${orderDetails.data!.rewards.map((e) => 'Redeemed Reward (${e.name})').join(', ')}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (orderDetails.data!.status != OrderStatus.delivered)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.green,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 7,
                        ),
                        child: const Text(
                          'Active',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    if (orderDetails.data!.status == OrderStatus.delivered)
                      const Text(
                        'Finished',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.darkGray,
                        ),
                      ),
                    if (orderDetails.data!.status == OrderStatus.delivered)
                      Text(
                        DateFormat('MMM, d, yyyy, h:mm a')
                            .format(orderDetails.data!.date),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: AppColors.darkGray,
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (orderDetails.data!.status != OrderStatus.delivered)
                      PillButton(
                        title: 'Track',
                        onTap: () {},
                        backgroundColor: AppColors.darkPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    if (orderDetails.data!.status == OrderStatus.delivered)
                      Row(
                        children: [
                          Expanded(
                            child: PillButton(
                              title: 'Details',
                              onTap: () {},
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
                              title: 'Reorder',
                              onTap: () {
                                showRoundedBottomModal(
                                  context,
                                  AddToBagOverlay(orderDetails.data!),
                                );
                              },
                              backgroundColor: AppColors.darkPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                  ],
                ),
        );
      },
    );
  }
}

class OrderProductImage extends StatelessWidget {
  const OrderProductImage({
    super.key,
    required this.imageURL,
  });
  final String? imageURL;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73,
      height: 68,
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: CachedNetworkImage(
        imageUrl: imageURL ?? '',
        fit: BoxFit.contain,
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
