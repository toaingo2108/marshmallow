import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/ongoing_order/presentation/widgets/show_dialog_cannot_cancel.dart';
import 'package:marshmallow/ongoing_order/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

Future<void> showBtmSheetHelpOrderOngoing({
  required BuildContext context,required OnGoingOrderStatus status,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
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
            SizedBox(
              height: Utils.sizeOf(30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: Utils.sizeOf(60),
                  height: Utils.sizeOf(60),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textFieldBackground,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Symbols.close,
                    color: AppColors.black,
                    size: Utils.sizeOf(40),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Utils.sizeOf(30),
            ),
            bannerText(title: "FAQs", onTap: () {}),
            SizedBox(
              height: Utils.sizeOf(30),
            ),
            bannerText(title: "Cancel Order", onTap: () {
              if(status == OnGoingOrderStatus.confirmed){
                context.router.popAndPush(const OnGoingOrderCancelRoute());
              }else{
                context.router.pop(true);
              }

            },),
          ],
        ),
      );
    },
  ).then((value) {
    if(value == true){
      showDialogCannotCancel(context);
    }
  });
}

Widget bannerText({required String title, required Function() onTap}) {
  return TouchableOpacity(
    onTap: (){
      onTap();
    },
    child: Container(
      padding: EdgeInsets.only(
        left: Utils.sizeOf(30),
        right: Utils.sizeOf(10),
        top: Utils.sizeOf(5),
        bottom: Utils.sizeOf(5),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: Utils.sizeOf(30),
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            Symbols.navigate_next,
            color: AppColors.gray,
            size: Utils.sizeOf(60),
          ),
        ],
      ),
    ),
  );
}
