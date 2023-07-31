import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/home/presentation/widgets/address_header.dart';
import 'package:marshmallow/home/presentation/widgets/home_body.dart';
import 'package:marshmallow/home/shared/providers.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';
import 'package:marshmallow/ongoing_order/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const AddressHeader(),
          SizedBox(
            height: Utils.sizeOf(16),
          ),
          HomeBody(),
          if (ref.watch(itemsDataMyBag).isNotEmpty)
            myBag(context, ref: ref)
          else
            myOrderInProgress(context, ref: ref),
        ],
      ),
    );
  }

  Widget myBag(
    BuildContext context, {
    required WidgetRef ref,
  }) {
    return TouchableOpacity(
      onTap: () {
        context.router.push(const MyBagRoute());
      },
      activeOpacity: 0.4,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.sizeOf(40),
          vertical: Utils.sizeOf(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.darkPrimaryColor,
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Utils.sizeOf(10),
            horizontal: Utils.sizeOf(32),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: Utils.sizeOf(5),
                          right: Utils.sizeOf(5),
                        ),
                        child: Image.asset(
                          'assets/images/ic_mybag.png',
                          width: Utils.sizeOf(40),
                          height: Utils.sizeOf(40),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        padding: EdgeInsets.all(Utils.sizeOf(5)),
                        child: Text(
                          ref.watch(itemsDataMyBag).length.toString(),
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: Utils.sizeOf(16),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "${ref.read(myBagRepositoryProvider).getTotalPointsInBag(ref.watch(itemsDataMyBag))} Points",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: Utils.sizeOf(20),
                    ),
                  ),
                ],
              ),
              Text(
                "My Bag",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: Utils.sizeOf(24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myOrderInProgress(
    BuildContext context, {
    required WidgetRef ref,
  }) {
    return TouchableOpacity(
      onTap: () {
        const OnGoingOrderStatus status = OnGoingOrderStatus.delivered;
        context.router.push(OnGoingOrderRoute(status: status));
      },
      activeOpacity: 0.4,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.sizeOf(40),
          vertical: Utils.sizeOf(20),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
            border: Border.all(
              color: AppColors.textFieldBackground,
              width: Utils.sizeOf(2),
            ),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: Utils.sizeOf(24),
                ),
                child: Image.asset(
                  'assets/images/img_order_smile_1.png',
                  width: Utils.sizeOf(64),
                  height: Utils.sizeOf(64),
                ),
              ),
              Text(
                "Order in Progress",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: Utils.sizeOf(24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
