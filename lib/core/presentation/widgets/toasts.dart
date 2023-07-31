import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/theme/theme.dart';

class BottomToast extends StatelessWidget {
  const BottomToast({
    super.key,
    required this.controller,
    required this.title,
    this.iconColor = AppColors.white,
    this.icon,
  });
  final FlashController controller;
  final String title;
  final IconData? icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return FlashBar(
      controller: controller,
      behavior: FlashBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 80),
      clipBehavior: Clip.antiAlias,
      backgroundColor: AppColors.textColor,
      shouldIconPulse: false,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      icon: icon != null
          ? Icon(
              icon,
              color: iconColor,
            )
          : null,
      title: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
      content: const SizedBox(),
    );
  }
}
