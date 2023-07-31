import 'package:flutter/material.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:material_symbols_icons/symbols.dart';

class ProfileLongButtonNoShadow extends StatelessWidget {
  const ProfileLongButtonNoShadow({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.withArrow = true,
  });
  final IconData icon;
  final String title;
  final void Function() onTap;
  final bool withArrow;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 35,
          child: Row(
            children: [
              const SizedBox(width: 8),
              SizedBox(
                width: 26,
                height: 26,
                child: Icon(
                  icon,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              if (withArrow)
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(Symbols.chevron_right, color: AppColors.gray),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
