import 'package:auto_route/auto_route.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:marshmallow/address/presentation/widgets/widgets.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/orders/shared/providers.dart';
import 'package:marshmallow/place_order/presentation/widgets/widgets.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class PlaceOrderPage extends ConsumerWidget {
  static const routeName = '/place-other';

  const PlaceOrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOrder = ref.watch(currentOrderProvider);
    final currentAddress = ref.watch(addressProvider);
    ref.listen(ordersNotifierProvider, (_, state) {
      state.maybeMap(
        orElse: () {},
        placeOrderFailure: (_) {
          context.showFlash<bool>(
            duration: const Duration(seconds: 3),
            builder: (context, controller) => BottomToast(
              controller: controller,
              title: 'Something went wrong, Try again later',
              icon: Symbols.close,
              iconColor: AppColors.red,
            ),
          );
          ref.read(ordersNotifierProvider.notifier).resetState();
        },
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: PopAppBar(
          title: 'Go back',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (currentAddress == null)
                      Container(
                        color: AppColors.pink2,
                        height: Utils.sizeOf(300),
                      ),
                    if (currentAddress != null)
                      SizedBox(
                        height: Utils.sizeOf(300),
                        width: double.infinity,
                        child: DynamicMiniMap(
                          lat: currentAddress.coordinates.latitude,
                          long: currentAddress.coordinates.longitude,
                          zoom: 18,
                        ),
                      ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.paddingHorizontal(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Utils.sizeOf(16),
                          ),
                          Text(
                            'Delivery Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Utils.sizeOf(40),
                            ),
                          ),
                          SizedBox(
                            height: Utils.sizeOf(8),
                          ),
                          Text(
                            'Some delivery options not available at all hours ',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: Utils.sizeOf(24),
                            ),
                          ),
                          SizedBox(
                            height: Utils.sizeOf(32),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: Utils.sizeOf(124),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const ItemOptionDelivery(
                                    price: 2.99,
                                    isFaster: true,
                                    time: "00-00",
                                  ),
                                  const ItemOptionDelivery(
                                    isFaster: false,
                                    time: "00-00",
                                  ),
                                  ItemOptionDelivery(
                                    time: currentOrder?.scheduledDelivery !=
                                            null
                                        ? DateFormat('MM/d/yy, h:mm a').format(
                                            currentOrder!.scheduledDelivery!,
                                          )
                                        : 'Pick a time',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Utils.sizeOf(40),
                          ),
                          SelectAddressWidget(),
                          SizedBox(
                            height: Utils.sizeOf(32),
                          ),
                          CallPhoneNumberWidget(),
                          SizedBox(
                            height: Utils.sizeOf(32),
                          ),
                          const ApplePayButton(),
                          SizedBox(
                            height: Utils.sizeOf(32),
                          ),
                          DriverTipSection(),
                          const AdsSpace(),
                          OrderSummary(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Container(
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 3,
                      offset: const Offset(0, -5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    TouchableOpacity(
                      onTap: () async {
                        await ref
                            .read(ordersNotifierProvider.notifier)
                            .placeOrder(currentOrder!, context, ref);
                      },
                      activeOpacity: 0.4,
                      child: Container(
                        height: Utils.sizeOf(72),
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: Utils.sizeOf(16),
                          bottom: Utils.sizeOf(16),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.darkPrimaryColor,
                          borderRadius: BorderRadius.circular(Utils.sizeOf(30)),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Place Order',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
