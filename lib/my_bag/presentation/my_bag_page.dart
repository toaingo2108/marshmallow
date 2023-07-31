import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/data_fake.dart';
import 'package:marshmallow/core/models/order.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/banner_white_widget.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/home/shared/providers.dart';
import 'package:marshmallow/my_bag/presentation/widgets/item_bag.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';
import 'package:marshmallow/orders/shared/providers.dart';
import 'package:marshmallow/place_order/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/functions.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class MyBagPage extends ConsumerWidget {
  static const routeName = '/my-bag';

  const MyBagPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarWidget(context, ref),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: Utils.paddingHorizontal(),
                      ),
                      child: Text(
                        "My bag",
                        style: TextStyle(
                          fontSize: Utils.sizeOf(40),
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Utils.sizeOf(20),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: ref.watch(itemsDataMyBag).length,
                      itemBuilder: (context, index) {
                        return ItemBag(
                          isReward: ref.read(itemsDataMyBag)[index].isReward,
                          name: ref.read(itemsDataMyBag)[index].name,
                          urlImage:
                              ref.read(itemsDataMyBag)[index].images.isNotEmpty
                                  ? ref.read(itemsDataMyBag)[index].images.first
                                      as String?
                                  : null,
                          price:
                              ref.read(itemsDataMyBag)[index].price.toString(),
                          value: ref.read(itemsDataMyBag)[index].unit,
                          total: ref
                              .read(itemsDataMyBag)[index]
                              .quantity
                              .toString(),
                          onAdd: () {
                            handleLogicAddOrSubtract(ref, index, isAdd: true);
                            final result =
                                ref.read(itemsDataMyBag.notifier).state;
                            //update subtotal

                            if (ref.read(itemProduct) != null &&
                                ref.read(itemsDataMyBag)[index].productID ==
                                    ref.read(itemProduct)!.productID) {
                              ref.read(itemProduct.notifier).update(
                                    (state) => state!
                                        .copyWith(quantity: state.quantity + 1),
                                  );
                            }
                            ref.read(myBagRepositoryProvider).setMyBag(result);
                          },
                          onTap: () {
                            ref.read(itemProduct.notifier).update(
                                  (state) => ref
                                      .read(itemsDataMyBag)[index]
                                      .copyWith(isReward: false),
                                );
                            if (ref.read(itemsDataMyBag)[index].isReward) {
                              final dataMyBag =
                                  ref.read(itemsDataMyBag.notifier).state;
                              for (final element in dataMyBag) {
                                if (element.productID ==
                                        ref
                                            .read(itemsDataMyBag)[index]
                                            .productID &&
                                    !element.isReward) {
                                  ref
                                      .read(itemProduct.notifier)
                                      .update((state) => element);
                                }
                              }
                            }

                            context.router.push(const ProductRoute());
                          },
                          onSubtract: () {
                            handleLogicAddOrSubtract(ref, index, isAdd: false);
                            final result =
                                ref.read(itemsDataMyBag.notifier).state;
                            //update subtotal

                            if (ref.read(itemProduct) != null &&
                                ref.read(itemsDataMyBag)[index].productID ==
                                    ref.read(itemProduct)!.productID) {
                              ref.read(itemProduct.notifier).update(
                                    (state) => state!
                                        .copyWith(quantity: state.quantity - 1),
                                  );
                            }
                            ref.read(myBagRepositoryProvider).setMyBag(result);
                          },
                          onRemove: () {
                            final result =
                                ref.read(itemsDataMyBag.notifier).state;
                            result.removeAt(index);
                            ref
                                .read(itemsDataMyBag.notifier)
                                .update((state) => result.toList());
                            ref.read(myBagRepositoryProvider).setMyBag(result);
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: Utils.sizeOf(40),
                    ),
                    titleBag(
                      onTap: () {
                        context.router.push(const MakeAGiftRoute());
                      },
                      title: "Make this order a gift",
                      urlImage: "assets/images/ic_gif1.png",
                    ),
                    titleBag(
                      onTap: () {
                        context.router.push(const AddPromoCodeRoute());
                      },
                      title: "Add promo code",
                      urlImage: "assets/images/ic_tag1.png",
                    ),
                    bannerAds(),
                    bannerOrderSubtotal(
                      ref
                          .read(myBagRepositoryProvider)
                          .getSubTotal(ref.watch(itemsDataMyBag)),
                    ),
                    SizedBox(
                      height: Utils.sizeOf(32),
                    ),
                    bannerWhiteWidget(
                      title: 'Frozen',
                      ref: ref,
                      products: data3,
                    ),
                    SizedBox(
                      height: Utils.sizeOf(32),
                    ),
                    bannerWhiteWidget(
                      title: 'Alcohol',
                      ref: ref,
                      products: data3,
                    ),
                    SizedBox(
                      height: Utils.sizeOf(32),
                    ),
                    bannerWhiteWidget(
                      title: 'Frozen',
                      ref: ref,
                      products: data3,
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: TouchableOpacity(
                onTap: () {
                  ref.read(currentOrderProvider.notifier).state =
                      Order.defaultOrder(
                    ref
                        .read(itemsDataMyBag)
                        .where((element) => !element.isReward)
                        .toList(),
                    ref
                        .read(itemsDataMyBag)
                        .where((element) => element.isReward)
                        .toList(),
                    ref.read(addressProvider),
                  );
                  ref.read(customTipProvider.notifier).state = 0.0;
                  context.router.push(const AdsBeforeCheckoutRoute());
                },
                activeOpacity: 0.4,
                child: Container(
                  height: Utils.sizeOf(120),
                  margin: EdgeInsets.symmetric(
                    horizontal: Utils.paddingHorizontal(),
                  ),
                  color: AppColors.white,
                  child: Container(
                    height: Utils.sizeOf(72),
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(18)),
                    decoration: BoxDecoration(
                      color: AppColors.darkPrimaryColor,
                      borderRadius: BorderRadius.circular(Utils.sizeOf(30)),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: Utils.sizeOf(28),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appbarWidget(BuildContext context, WidgetRef ref) {
    return Container(
      height: Utils.sizeOf(100),
      margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TouchableOpacity(
            onTap: () {
              context.router.pop();
            },
            activeOpacity: 0.4,
            child: SizedBox(
              height: Utils.sizeOf(64),
              width: Utils.sizeOf(64),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray.withOpacity(0.6),
                      offset: const Offset(1.5, 1.5),
                      blurRadius: 5.0,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.darkGray,
                  size: Utils.sizeOf(40),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              openUsersAddresses(context, ref);
            },
            child: Container(
              height: Utils.sizeOf(65),
              // width: Utils.sizeOf(300),
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.08),
                borderRadius: BorderRadius.circular(Utils.sizeOf(60)),
              ),
              padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(23)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/delivery-bike2.png',
                    width: Utils.sizeOf(60),
                    height: Utils.sizeOf(60),
                    fit: BoxFit.contain,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ref.watch(addressProvider) == null
                            ? 'Select Address'
                            : 'Delivery in 15-30 mins',
                        style: TextStyle(
                          color: AppColors.darkPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: Utils.sizeOf(20),
                        ),
                      ),
                      if (ref.watch(addressProvider)?.addressLine1 != null)
                        Text(
                          ref.watch(addressProvider)!.addressLine1!,
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: Utils.sizeOf(18),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                    ],
                  ),
                  const Icon(
                    Symbols.expand_more,
                    color: AppColors.darkPrimaryColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget titleBag({
    required String title,
    required String urlImage,
    required Function() onTap,
  }) {
    return TouchableOpacity(
      onTap: () {
        onTap();
      },
      activeOpacity: 0.4,
      child: Container(
        width: double.infinity,
        height: Utils.sizeOf(64),
        margin: EdgeInsets.only(
          left: Utils.paddingHorizontal(),
          right: Utils.paddingHorizontal(),
          bottom: Utils.sizeOf(24),
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: Utils.sizeOf(64),
              padding: EdgeInsets.only(
                left: Utils.sizeOf(25),
                right: Utils.sizeOf(20),
                top: Utils.sizeOf(20),
                bottom: Utils.sizeOf(20),
              ),
              decoration: const BoxDecoration(
                color: AppColors.textFieldBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
              ),
              child: Image.asset(urlImage),
            ),
            Container(
              padding: EdgeInsets.only(left: Utils.sizeOf(30)),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: Utils.sizeOf(24),
                ),
              ),
            ),
            const Spacer(),
            const Icon(
              Symbols.navigate_next,
              color: AppColors.gray,
            )
          ],
        ),
      ),
    );
  }

  Widget bannerAds() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Utils.paddingHorizontal(),
        vertical: Utils.sizeOf(20),
      ),
      width: double.infinity,
      height: Utils.percentageWidth(35),
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      alignment: Alignment.center,
      child: const Text("Ads space"),
    );
  }

  Widget bannerOrderSubtotal(double price) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
      padding: EdgeInsets.symmetric(
        horizontal: Utils.sizeOf(24),
        vertical: Utils.sizeOf(16),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(Utils.sizeOf(24))),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Order Subtotal",
            style: TextStyle(
              fontSize: Utils.sizeOf(24),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "\$${price.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: Utils.sizeOf(24),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
