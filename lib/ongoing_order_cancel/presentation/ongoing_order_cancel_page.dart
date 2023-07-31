import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';

@RoutePage()
class OnGoingOrderCancelPage extends ConsumerWidget {
  static const routeName = '/ongoing-order-cancel';

  const OnGoingOrderCancelPage({super.key});

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
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: Utils.percentageWidth(100),
                          height: Utils.sizeOf(300),
                          color: AppColors.blue1,
                          margin: EdgeInsets.only(right: Utils.sizeOf(12),left: Utils.sizeOf(12),bottom: Utils.sizeOf(80)),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Image.asset(
                            'assets/images/notification_image3.png',
                            width: Utils.sizeOf(160),
                            height: Utils.sizeOf(160),
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Utils.sizeOf(24),),
                    Text('Order Canceled',
                        style: TextStyle(
                            fontSize: Utils.sizeOf(50),
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Utils.percentageWidth(15)),
                      child: Text('If you had a problem with your order,  you can always try again!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Utils.sizeOf(24),
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,),),
                    ),
                    SizedBox(height: Utils.sizeOf(40),),
                    TouchableOpacity(
                      onTap: (){
                        context.router.pushAndPopUntil(const MyBagRoute(), predicate: (route) =>  route.data?.name == MenuRoute.name,);
                      },
                      activeOpacity: 0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(30), vertical: Utils.sizeOf(15)),
                        child: Text(
                          'Back to My Bag', style: TextStyle(
                            fontSize: Utils.sizeOf(28),
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,),
                        ),
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
        ],
      ),
    );
  }
}
