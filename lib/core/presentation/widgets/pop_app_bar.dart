import 'package:flutter/material.dart';
import 'package:marshmallow/theme/app_colors.dart';

class PopAppBar extends StatelessWidget {
  const PopAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white,
      leadingWidth: 0,
      leading: const SizedBox(),
      title: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Container(
              height: 25,
              padding: const EdgeInsets.only(left: 10, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: AppColors.darkPrimaryColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
