import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/utils/size_utils.dart';

void showDialogCannotCancel(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: Utils.sizeOf(315),
            margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
            padding: EdgeInsets.all(Utils.sizeOf(40)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We’re Sorry',
                  style: TextStyle(
                    fontSize: Utils.sizeOf(40),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: Utils.sizeOf(16),
                ),
                Text(
                  'Your order is in-progress and can no longer be canceled through the app. ',
                  style: TextStyle(
                    fontSize: Utils.sizeOf(28),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: Utils.sizeOf(24),
                ),
                Center(
                  child: TouchableOpacity(
                    onTap: () {
                      context.router.pop();
                    },
                    activeOpacity: 0.4,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.sizeOf(30),
                        vertical: Utils.sizeOf(10),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
                      ),
                      child: Text(
                        'Dismiss',
                        style: TextStyle(
                          fontSize: Utils.sizeOf(24),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
