import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';

Future<void> showBtmSheetContactDriver({
  required BuildContext context,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: Utils.sizeOf(600),
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
                    'Contact Driver',
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
              'Call or message your driver for delivery updates.',
              style: TextStyle(
                fontSize: Utils.sizeOf(30),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: Utils.sizeOf(30),
            ),
            bannerText(title: "Call", onTap: () {}, isEnableBackground: true),
            SizedBox(
              height: Utils.sizeOf(30),
            ),
            bannerText(title: "Message", onTap: () {}),
          ],
        ),
      );
    },
  );
}

Widget bannerText(
    {required String title,
    required Function() onTap,
    bool isEnableBackground = false,}) {
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
