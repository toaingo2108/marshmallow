import 'package:flutter/material.dart';
import 'package:marshmallow/theme/app_colors.dart';

class ProfileMenuButton extends StatelessWidget {
  const ProfileMenuButton({
    super.key,
    required this.title,
    this.icon,
    required this.onTap,
    this.isClub = false,
  });
  final String title;
  final IconData? icon;
  final void Function() onTap;
  final bool isClub;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isClub)
            Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.lightBlue, AppColors.lightPrimaryColor],
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.textColor,
                size: 20,
              ),
            ),
          if (isClub)
            Image.asset(
              'assets/images/circle-star.png',
              width: 34,
              height: 34,
            ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 9.5,
            ),
          ),
        ],
      ),
    );
  }
}
