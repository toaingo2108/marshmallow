import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/widgets/bottom_sheet_custom_price.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/place_order/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';

Future<void> showBtmSheetAdditionalTip({
  required BuildContext context,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return AdditionalTipPage();
    },
  );
}

class AdditionalTipPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliveryTipOption = ref.watch(optionDeliveryTipState);
    final isEnable4 = deliveryTipOption[3]["isEnable"] as bool;
    return Container(
      height: Utils.sizeOf(isEnable4 ? 820 : 620),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Utils.sizeOf(30)),
          topRight: Radius.circular(Utils.sizeOf(30)),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Utils.sizeOf(40),
              horizontal: Utils.paddingHorizontal(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add additional tip?',
                  style: TextStyle(
                    fontSize: Utils.sizeOf(50),
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
          ),
          SizedBox(
            height: Utils.sizeOf(30),
          ),
          driverTipWidget(ref, context),
          SizedBox(
            height: Utils.sizeOf(30),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
            child: Column(
              children: [
                bannerText(
                  title: "Submit",
                  onTap: () {
                    context.router.pop();
                  },
                  isEnableBackground: true,
                ),
                SizedBox(
                  height: Utils.sizeOf(30),
                ),
                bannerText(
                  title: "Not today",
                  onTap: () {
                    context.router.pop();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget driverTipWidget(WidgetRef ref, BuildContext context) {
  final deliveryTipOption = ref.watch(optionDeliveryTipState);
  final txtPrice1 = deliveryTipOption[0]["price"];
  final txtPrice2 = deliveryTipOption[1]["price"];
  final txtPrice3 = deliveryTipOption[2]["price"];
  final txtPrice4 = deliveryTipOption[3]["price"];

  final isEnable1 = deliveryTipOption[0]["isEnable"] as bool;
  final isEnable2 = deliveryTipOption[1]["isEnable"] as bool;
  final isEnable3 = deliveryTipOption[2]["isEnable"] as bool;
  final isEnable4 = deliveryTipOption[3]["isEnable"] as bool;

  final priceDeliveryTip = ref.watch(customTipProvider);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          color: AppColors.textFieldBackground,
          borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
        ),
        margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
        padding: EdgeInsets.symmetric(
          vertical: Utils.sizeOf(5),
          horizontal: Utils.sizeOf(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  handleChooseOptionTip(0, ref);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Utils.sizeOf(40),
                    vertical: Utils.sizeOf(20),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
                    color: isEnable1
                        ? AppColors.primaryColor
                        : AppColors.textFieldBackground,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '\$$txtPrice1',
                    style: TextStyle(
                      color: isEnable1 ? AppColors.white : AppColors.black,
                      fontSize: Utils.sizeOf(24),
                      fontFamily: 'Poppins',
                      fontWeight: isEnable1 ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  handleChooseOptionTip(1, ref);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Utils.sizeOf(40),
                    vertical: Utils.sizeOf(20),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
                    color: isEnable2
                        ? AppColors.primaryColor
                        : AppColors.textFieldBackground,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '\$$txtPrice2',
                    style: TextStyle(
                      color: isEnable2 ? AppColors.white : AppColors.black,
                      fontSize: Utils.sizeOf(24),
                      fontFamily: 'Poppins',
                      fontWeight: isEnable2 ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  handleChooseOptionTip(2, ref);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Utils.sizeOf(40),
                    vertical: Utils.sizeOf(20),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
                    color: isEnable3
                        ? AppColors.primaryColor
                        : AppColors.textFieldBackground,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '\$$txtPrice3',
                    style: TextStyle(
                      color: isEnable3 ? AppColors.white : AppColors.black,
                      fontSize: Utils.sizeOf(24),
                      fontFamily: 'Poppins',
                      fontWeight: isEnable3 ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  handleChooseOptionTip(3, ref);
                },
                child: Container(
                  // width: Utils.sizeOf(120),
                  height: Utils.sizeOf(75),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
                    color: isEnable4
                        ? AppColors.primaryColor
                        : AppColors.textFieldBackground,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: isEnable4
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.center,
                    children: [
                      Text(
                        isEnable4
                            ? '\$$priceDeliveryTip'
                            : ('${priceDeliveryTip > 0 ? '\$' : ''}${priceDeliveryTip > 0 ? priceDeliveryTip : txtPrice4}'),
                        style: TextStyle(
                          color: isEnable4 ? AppColors.white : AppColors.black,
                          fontSize: Utils.sizeOf(24),
                          fontFamily: 'Poppins',
                          fontWeight:
                              isEnable4 ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                      if (isEnable4)
                        TouchableOpacity(
                          onTap: () {
                            showBottomSheetCustomPrice(
                              context: context,
                              ref: ref,
                              maxPrice: 10,
                              currentPrice: priceDeliveryTip,
                            );
                          },
                          activeOpacity: 0.4,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: Utils.sizeOf(10),
                              right: Utils.sizeOf(25),
                            ),
                            width: Utils.sizeOf(32),
                            height: Utils.sizeOf(32),
                            child: Image.asset('assets/images/ic_edit1.png'),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
        child: Text(
          '100% of your tip goes to the driver',
          style: TextStyle(
            color: AppColors.black,
            fontSize: Utils.sizeOf(24),
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      // Visibility(
      //   visible: isEnable4,
      //   child: const AdditionalCustomTipPrice(
      //     maxPrice: 10,
      //   ),
      // ),
    ],
  );
}

Widget bannerText({
  required String title,
  required Function() onTap,
  bool isEnableBackground = false,
}) {
  return TouchableOpacity(
    onTap: () {
      onTap();
    },
    child: Container(
      padding: EdgeInsets.only(
        left: Utils.sizeOf(30),
        right: Utils.sizeOf(10),
        top: Utils.sizeOf(15),
        bottom: Utils.sizeOf(15),
      ),
      decoration: BoxDecoration(
        color:
            isEnableBackground ? AppColors.darkPrimaryColor : AppColors.white,
        borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
        border: Border.all(
          color: AppColors.darkPrimaryColor,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: Utils.sizeOf(30),
          fontWeight: FontWeight.w600,
          color:
              isEnableBackground ? AppColors.white : AppColors.darkPrimaryColor,
        ),
      ),
    ),
  );
}

// class AdditionalCustomTipPrice extends ConsumerWidget {
//   final double maxPrice;

//   final double currentPrice;

//   const AdditionalCustomTipPrice({
//     required this.maxPrice,
//     this.currentPrice = 0.0,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final double price =
//         maxPrice * (ref.watch(xDragOffSet) / Utils.percentageWidth(80));
//     final String valuePrice =
//         '${ref.watch(xDragOffSet) <= Utils.sizeOf(10) ? 0.0 : ref.watch(xDragOffSet) >= Utils.percentageWidth(80) ? maxPrice : price.toStringAsFixed(2)}';
//     return Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: Utils.paddingHorizontal(),
//         vertical: Utils.sizeOf(20),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text("\$0.0"),
//               Text("\$$maxPrice"),
//             ],
//           ),
//           SizedBox(
//             height: Utils.sizeOf(10),
//           ),
//           Stack(
//             children: [
//               Column(
//                 children: [
//                   Stack(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: AppColors.inactiveSwitchGray,
//                           borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
//                         ),
//                         child: SizedBox(
//                           width: Utils.sizeOf(60),
//                           height: Utils.sizeOf(50),
//                         ),
//                       ),
//                       Positioned(
//                         top: 2,
//                         left: ref.watch(xDragOffSet),
//                         child: Draggable(
//                           axis: Axis.horizontal,
//                           feedback: Container(
//                             width: Utils.sizeOf(60),
//                             height: Utils.sizeOf(40),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.circular(Utils.sizeOf(20)),
//                             ),
//                           ),
//                           childWhenDragging: SizedBox(
//                             width: Utils.sizeOf(60),
//                             height: Utils.sizeOf(40),
//                           ),
//                           onDragUpdate: (details) {
//                             var result = ref.read(xDragOffSet.notifier).state;
//                             result = -Utils.sizeOf(80) +
//                                 details.localPosition.dx.clamp(
//                                   Utils.sizeOf(84),
//                                   Utils.percentageWidth(91.4),
//                                 );
//                             ref
//                                 .read(xDragOffSet.notifier)
//                                 .update((state) => result);
//                           },
//                           child: Container(
//                             width: Utils.sizeOf(60),
//                             height: Utils.sizeOf(40),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(
//                                 Utils.sizeOf(20),
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: Utils.sizeOf(50),
//                   ),
//                 ],
//               ),
//               Positioned(
//                 top: Utils.sizeOf(50),
//                 left: Utils.sizeOf(-5) + ref.watch(xDragOffSet),
//                 child: Text("\$$valuePrice"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
