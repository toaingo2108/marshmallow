import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';

Future<void> showBtmSheetRateOrder({
  required BuildContext context,
  required WidgetRef ref,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const RateOrderPage();
    },
  );
}

class RateOrderPage extends ConsumerWidget {
  const RateOrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numStarEnable = ref.watch(rateStar);
    return Container(
      height: Utils.sizeOf(690),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Utils.sizeOf(30)),
          topRight: Radius.circular(Utils.sizeOf(30)),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: Utils.sizeOf(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rate your order',
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
          Text(
            'We use this information to make sure we create a better experience for you!',
            style: TextStyle(
              fontSize: Utils.sizeOf(30),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: Utils.sizeOf(50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              rateStarWidget(
                numStar: 1,
                isEnable: numStarEnable >= 1,
                ref: ref,
              ),
              SizedBox(width: Utils.sizeOf(20)),
              rateStarWidget(
                numStar: 2,
                isEnable: numStarEnable >= 2,
                ref: ref,
              ),
              SizedBox(width: Utils.sizeOf(20)),
              rateStarWidget(
                numStar: 3,
                isEnable: numStarEnable >= 3,
                ref: ref,
              ),
              SizedBox(width: Utils.sizeOf(20)),
              rateStarWidget(
                numStar: 4,
                isEnable: numStarEnable >= 4,
                ref: ref,
              ),
              SizedBox(width: Utils.sizeOf(20)),
              rateStarWidget(
                numStar: 5,
                isEnable: numStarEnable >= 5,
                ref: ref,
              ),
            ],
          ),
          SizedBox(
            height: Utils.sizeOf(50),
          ),
          bannerText(
            title: "Submit",
            onTap: () {
              context.router.pop();
            },
            isEnableBackground: true,
            ref: ref,
          ),
          SizedBox(
            height: Utils.sizeOf(30),
          ),
          bannerText(
            title: "Not today",
            onTap: () {
              context.router.pop();
            },
            ref: ref,
          ),
        ],
      ),
    );
  }
}

String urlPathImageStar({required int index, required bool isEnable}) {
  return isEnable
      ? 'assets/images/ic_star_enable.png'
      : 'assets/images/ic_star_disable.png';
}

Widget rateStarWidget({
  required int numStar,
  required bool isEnable,
  required WidgetRef ref,
}) {
  return TouchableOpacity(
    onTap: () {
      var resul = ref.read(rateStar.notifier).state;
      resul = numStar;
      ref.read(rateStar.notifier).update((state) => state = resul);
    },
    child: SizedBox(
      width: Utils.sizeOf(60),
      height: Utils.sizeOf(60),
      child: Image.asset(
        urlPathImageStar(index: numStar, isEnable: isEnable),
        color: AppColors.darkPrimaryColor,
      ),
    ),
  );
}

Widget bannerText({
  required String title,
  required Function() onTap,
  bool isEnableBackground = false,
  required WidgetRef ref,
}) {
  final isEnable = ref.watch(rateStar);
  return TouchableOpacity(
    onTap: () {
      if (isEnable > 0) {
        onTap();
      }
    },
    child: Container(
      padding: EdgeInsets.only(
        left: Utils.sizeOf(30),
        right: Utils.sizeOf(10),
        top: Utils.sizeOf(15),
        bottom: Utils.sizeOf(15),
      ),
      decoration: BoxDecoration(
        color: isEnableBackground
            ? AppColors.darkPrimaryColor.withOpacity(isEnable > 0 ? 1 : 0.3)
            : AppColors.white,
        borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
        border: Border.all(
          color: AppColors.darkPrimaryColor.withOpacity(
            isEnableBackground
                ? isEnable > 0
                    ? 1
                    : 0.3
                : 1,
          ),
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

final rateStar = StateProvider.autoDispose<int>((ref) => 0);
