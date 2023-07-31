import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/home/shared/providers.dart';
import 'package:marshmallow/my_bag/presentation/widgets/item_bag.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class OnGoingOrderDetailPage extends ConsumerWidget {
  static const routeName = '/ongoing-order-detail';

  const OnGoingOrderDetailPage({super.key});

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
                    SizedBox(
                      height: Utils.sizeOf(20),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: ref.watch(itemsDataMyBag).length,
                      itemBuilder: (context, index) {
                        return ItemBag(
                          isReward: ref.watch(itemsDataMyBag)[index].isReward,
                          name: ref.watch(itemsDataMyBag)[index].name,
                          urlImage: '',
                          price:
                              ref.watch(itemsDataMyBag)[index].price.toString(),
                          value: ref.watch(itemsDataMyBag)[index].unit,
                          total: ref
                              .watch(itemsDataMyBag)[index]
                              .quantity
                              .toString(),
                          onAdd: () {
                            handleLogicAddOrSubtract(ref, index, isAdd: true);
                          },
                          onSubtract: () {
                            handleLogicAddOrSubtract(ref, index, isAdd: false);
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
                          onRemove: () {
                            final result =
                                ref.read(itemsDataMyBag.notifier).state;
                            result.removeAt(index);
                            ref
                                .read(itemsDataMyBag.notifier)
                                .update((state) => result.toList());
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: Utils.sizeOf(40),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.paddingHorizontal(),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: Utils.sizeOf(32)),
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
                                '\$9.36',
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
                                '\$9.36',
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
                                '\$9.36',
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
                                '\$9.36',
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
                                'Order Total',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: Utils.sizeOf(30),
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '\$9.36',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Payment Method',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: Utils.sizeOf(30),
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: Utils.sizeOf(85),
                                height: Utils.sizeOf(38),
                                child: Image.asset(
                                  'assets/images/img_apple_pay.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Utils.sizeOf(32)),
                        ],
                      ),
                    )
                  ],
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
            child: Container(
              padding: EdgeInsets.only(
                right: Utils.sizeOf(10),
              ),
              decoration: const BoxDecoration(
                color: AppColors.darkPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(48)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Symbols.navigate_before,
                    color: AppColors.white,
                  ),
                  Text(
                    'Order Details',
                    style: TextStyle(
                      fontSize: Utils.sizeOf(30),
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
