import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/ongoing_order/presentation/widgets/btmsheet_add_additional_tip.dart';
import 'package:marshmallow/ongoing_order/presentation/widgets/btmsheet_contact_driver.dart';
import 'package:marshmallow/ongoing_order/presentation/widgets/btmsheet_rate_order.dart';
import 'package:marshmallow/ongoing_order/presentation/widgets/btmsheet_tracking_map.dart';
import 'package:marshmallow/ongoing_order/shared/providers.dart';
import 'package:marshmallow/ongoing_order_detail/presentation/widgets/btmsheet_help_order_ongoing.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/extensions.dart';
import 'package:marshmallow/utils/functions.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class OnGoingOrderPage extends ConsumerWidget {
  static const routeName = '/ongoing-order';
  final OnGoingOrderStatus status;

  const OnGoingOrderPage({required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarWidget(context, ref, status),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (status != OnGoingOrderStatus.driving)
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Utils.sizeOf(12),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: Utils.sizeOf(300),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Utils.sizeOf(40)),
                          ),
                          child: Image.asset(
                            urlPathImageStatusOrderOnGoing(status: status),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if (status == OnGoingOrderStatus.driving)
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Utils.sizeOf(12),
                        ),
                        child: TouchableOpacity(
                          onTap: () {
                            showBtmSheetTrackingMap(ref: ref, context: context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: Utils.sizeOf(300),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Utils.sizeOf(40)),
                              color:
                                  AppColors.darkPrimaryColor.withOpacity(0.1),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: Utils.sizeOf(40),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: Utils.sizeOf(40),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              stepOrderOnGoing(
                                title: 'Confirmed',
                                isEnable: true,
                              ),
                              SizedBox(
                                width: Utils.sizeOf(14),
                              ),
                              stepOrderOnGoing(
                                title: 'Pack',
                                isEnable: isEnableStatusOrderOnGoing(
                                      status: status,
                                    ) >=
                                    2,
                              ),
                              SizedBox(
                                width: Utils.sizeOf(14),
                              ),
                              stepOrderOnGoing(
                                title: 'Drive',
                                isEnable: isEnableStatusOrderOnGoing(
                                      status: status,
                                    ) >=
                                    3,
                              ),
                              SizedBox(
                                width: Utils.sizeOf(14),
                              ),
                              stepOrderOnGoing(
                                title: 'Deliver',
                                isEnable: isEnableStatusOrderOnGoing(
                                      status: status,
                                    ) ==
                                    4,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Utils.sizeOf(32),
                          ),
                          Text(
                            titleOrderOnGoing(status: status),
                            style: TextStyle(
                              fontSize: Utils.sizeOf(50),
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            'Arriving: 0:00 PM - 0:00 PM EDT',
                            style: TextStyle(
                              fontSize: Utils.sizeOf(24),
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: Utils.sizeOf(24),
                          ),
                          Text(
                            '#0000000000',
                            style: TextStyle(
                              fontSize: Utils.sizeOf(24),
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGray,
                            ),
                          ),
                          SizedBox(
                            height: Utils.sizeOf(32),
                          ),
                          Visibility(
                            visible: status == OnGoingOrderStatus.delivered,
                            child: TouchableOpacity(
                              onTap: () {
                                showBtmSheetAdditionalTip(context: context);
                              },
                              activeOpacity: 0.4,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: Utils.sizeOf(15),
                                ),
                                margin:
                                    EdgeInsets.only(bottom: Utils.sizeOf(20)),
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius:
                                      BorderRadius.circular(Utils.sizeOf(36)),
                                  border: Border.all(
                                    color: AppColors.black,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Add additional tip',
                                  style: TextStyle(
                                    fontSize: Utils.sizeOf(28),
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: status == OnGoingOrderStatus.driving ||
                                status == OnGoingOrderStatus.delivered,
                            child: TouchableOpacity(
                              onTap: () {
                                showBtmSheetContactDriver(context: context);
                              },
                              activeOpacity: 0.4,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: Utils.sizeOf(15),
                                ),
                                margin:
                                    EdgeInsets.only(bottom: Utils.sizeOf(40)),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.circular(Utils.sizeOf(36)),
                                  border: Border.all(
                                    color: AppColors.black,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Contact Driver',
                                  style: TextStyle(
                                    fontSize: Utils.sizeOf(28),
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          bannerOrderDetail(context, ref),
                          Visibility(
                            visible: status == OnGoingOrderStatus.delivered,
                            child: TouchableOpacity(
                              onTap: () {
                                showBtmSheetRateOrder(
                                  context: context,
                                  ref: ref,
                                );
                              },
                              activeOpacity: 0.4,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: Utils.sizeOf(15),
                                ),
                                margin: EdgeInsets.only(top: Utils.sizeOf(40)),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.circular(Utils.sizeOf(36)),
                                  border: Border.all(
                                    color: AppColors.black,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Reorder Items',
                                  style: TextStyle(
                                    fontSize: Utils.sizeOf(28),
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: Utils.sizeOf(24),
                            ),
                            height: Utils.sizeOf(380),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:
                                  AppColors.darkPrimaryColor.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.circular(Utils.sizeOf(30)),
                            ),
                            child: const Center(
                              child: Text('Ads space'),
                            ),
                          ),
                          yourInformation(context, ref),
                          Container(
                            margin: EdgeInsets.only(top: Utils.sizeOf(24)),
                            height: Utils.sizeOf(290),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:
                                  AppColors.darkPrimaryColor.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.circular(Utils.sizeOf(30)),
                            ),
                            child: const Center(
                              child: Text('Ads space'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: Utils.sizeOf(24),
                            ),
                            height: Utils.sizeOf(290),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:
                                  AppColors.darkPrimaryColor.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.circular(Utils.sizeOf(30)),
                            ),
                            child: const Center(
                              child: Text('Ads space'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appbarWidget(
    BuildContext context,
    WidgetRef ref,
    OnGoingOrderStatus status,
  ) {
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
          TouchableOpacity(
            onTap: () {
              showBtmSheetHelpOrderOngoing(context: context, status: status);
            },
            child: Container(
              height: Utils.sizeOf(65),
              // width: Utils.sizeOf(300),
              decoration: BoxDecoration(
                color: AppColors.textFieldBackground,
                borderRadius: BorderRadius.circular(Utils.sizeOf(60)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.15),
                    offset: const Offset(1.5, 1.5),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(23)),
              child: Center(
                child: Text(
                  'HELP',
                  style: TextStyle(
                    color: AppColors.darkGray,
                    fontSize: Utils.sizeOf(20),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  int isEnableStatusOrderOnGoing({required OnGoingOrderStatus status}) {
    switch (status) {
      case OnGoingOrderStatus.confirmed:
        return 1;
      case OnGoingOrderStatus.packing:
        return 2;
      case OnGoingOrderStatus.driving:
        return 3;
      case OnGoingOrderStatus.delivered:
        return 4;
    }
  }

  String urlPathImageStatusOrderOnGoing({required OnGoingOrderStatus status}) {
    switch (status) {
      case OnGoingOrderStatus.confirmed:
        return 'assets/images/img_order_ongoing_banner_1.png';
      case OnGoingOrderStatus.packing:
        return 'assets/images/img_order_ongoing_banner_2.png';
      case OnGoingOrderStatus.driving:
        return 'assets/images/img_order_ongoing_banner_3.png';
      case OnGoingOrderStatus.delivered:
        return 'assets/images/img_order_ongoing_banner_4.png';
    }
  }

  String titleOrderOnGoing({required OnGoingOrderStatus status}) {
    switch (status) {
      case OnGoingOrderStatus.confirmed:
        return 'We got your order';
      case OnGoingOrderStatus.packing:
        return 'Packing your order';
      case OnGoingOrderStatus.driving:
        return 'Driving to your address';
      case OnGoingOrderStatus.delivered:
        return 'Delivered!';
    }
  }

  Widget stepOrderOnGoing({required String title, required bool isEnable}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: Utils.sizeOf(16),
            decoration: BoxDecoration(
              color: isEnable ? AppColors.darkPrimaryColor : AppColors.violet2,
              borderRadius: BorderRadius.circular(Utils.sizeOf(37)),
            ),
          ),
          SizedBox(
            height: Utils.sizeOf(4),
          ),
          Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontSize: Utils.sizeOf(20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget bannerOrderDetail(BuildContext context, WidgetRef ref) {
    return TouchableOpacity(
      onTap: () {
        context.router.push(const OnGoingOrderDetailRoute());
      },
      activeOpacity: 0.4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              offset: const Offset(2, 2),
              blurRadius: 4.0,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: Utils.sizeOf(70),
              decoration: BoxDecoration(
                color: AppColors.textFieldBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Utils.sizeOf(40)),
                  topRight: Radius.circular(Utils.sizeOf(40)),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order details',
                    style: TextStyle(
                      fontSize: Utils.sizeOf(30),
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(Utils.sizeOf(48)),
                    ),
                    padding: EdgeInsets.only(
                      top: Utils.sizeOf(5),
                      bottom: Utils.sizeOf(5),
                      left: Utils.sizeOf(20),
                      right: Utils.sizeOf(5),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "View",
                          style: TextStyle(
                            fontSize: Utils.sizeOf(24),
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                        Icon(
                          Symbols.navigate_next,
                          size: Utils.sizeOf(40),
                          color: AppColors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(40)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Utils.sizeOf(40)),
                  bottomRight: Radius.circular(Utils.sizeOf(40)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Utils.sizeOf(4),
                  ),
                  Text(
                    '3 items in order',
                    style: TextStyle(
                      fontSize: Utils.sizeOf(24),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: Utils.sizeOf(16),
                  ),
                  Row(
                    children: [
                      Container(
                        height: Utils.sizeOf(100),
                        width: Utils.sizeOf(100),
                        margin: EdgeInsets.only(right: Utils.sizeOf(8)),
                        decoration: BoxDecoration(
                          color: AppColors.pink1,
                          borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
                        ),
                      ),
                      Container(
                        height: Utils.sizeOf(100),
                        width: Utils.sizeOf(100),
                        margin: EdgeInsets.only(right: Utils.sizeOf(8)),
                        decoration: BoxDecoration(
                          color: AppColors.pink1,
                          borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
                        ),
                      ),
                      Container(
                        height: Utils.sizeOf(100),
                        width: Utils.sizeOf(100),
                        margin: EdgeInsets.only(right: Utils.sizeOf(8)),
                        decoration: BoxDecoration(
                          color: AppColors.pink1,
                          borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Utils.sizeOf(16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget yourInformation(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Information',
          style: TextStyle(
            fontSize: Utils.sizeOf(40),
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        SizedBox(
          height: Utils.sizeOf(24),
        ),
        locationAddressWidget(ref, context),
        SizedBox(
          height: Utils.sizeOf(24),
        ),
        callPhoneNumberWidget(ref, context),
      ],
    );
  }

  Widget locationAddressWidget(WidgetRef ref, BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        openUsersAddresses(context, ref);
      },
      activeOpacity: 0.4,
      child: Container(
        height: Utils.sizeOf(80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1.5, 1.5),
              blurRadius: 4,
              color: AppColors.black.withOpacity(0.15),
            )
          ],
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(Utils.sizeOf(20)),
              child: Icon(
                Symbols.pin_drop,
                color: AppColors.black,
                size: Utils.sizeOf(40),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ref.watch(addressProvider) == null
                        ? 'Please Select an address'
                        : ref.watch(addressProvider)?.isHome == null
                            ? 'Other'
                            : ref.watch(addressProvider)!.isHome!
                                ? 'Home'
                                : 'Work',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: Utils.sizeOf(24),
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (ref.watch(addressProvider)?.addressLine1 != null)
                    Text(
                      ref.watch(addressProvider)!.addressLine1!,
                      style: TextStyle(
                        color: AppColors.darkGray,
                        fontSize: Utils.sizeOf(20),
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(Utils.sizeOf(10)),
              child: const Icon(
                Symbols.navigate_next,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget callPhoneNumberWidget(WidgetRef ref, BuildContext context) {
    return TouchableOpacity(
      activeOpacity: 0.4,
      onTap: () {
        context.router.push(const UserProfileRoute());
      },
      child: Container(
        height: Utils.sizeOf(80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1.5, 1.5),
              blurRadius: 4,
              color: AppColors.black.withOpacity(0.15),
            )
          ],
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: Utils.sizeOf(30),
                right: Utils.sizeOf(20),
                top: Utils.sizeOf(20),
                bottom: Utils.sizeOf(20),
              ),
              child: SizedBox(
                width: Utils.sizeOf(30),
                height: Utils.sizeOf(30),
                child: ref.read(userInfoProvider)?.phoneNumber != null
                    ? Image.asset(
                        'assets/images/ic_phone.png',
                        fit: BoxFit.fill,
                      )
                    : const Icon(
                        Icons.email,
                        size: 18,
                        color: AppColors.textColor,
                      ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ref.watch(userInfoProvider) == null
                        ? 'Add a phone or email address'
                        : (ref.watch(userInfoProvider)?.phoneNumber != null
                            ? (ref.watch(userInfoProvider)!.phoneNumber ?? '')
                                .toPhoneNumber()!
                            : ref.watch(userInfoProvider)!.email ??
                                'email fail'),
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: Utils.sizeOf(24),
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(Utils.sizeOf(10)),
              child: const Icon(
                Symbols.navigate_next,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
