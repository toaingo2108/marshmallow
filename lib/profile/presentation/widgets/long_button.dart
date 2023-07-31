import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/widgets/container_with_shadow.dart';
import 'package:marshmallow/theme/app_colors.dart';

import 'package:material_symbols_icons/symbols.dart';

class ProfileLongButton extends StatelessWidget {
  const ProfileLongButton({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.iconBackgroundColor = AppColors.lightGray,
  });

  final String title;
  final IconData? icon;
  final void Function()? onTap;
  final Color iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ContainerWithShadow(
        height: 42,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  if (icon != null)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: iconBackgroundColor,
                      ),
                      width: 42,
                      height: 42,
                      child: Icon(
                        icon,
                        size: 20,
                        color: AppColors.textColor,
                      ),
                    ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Symbols.chevron_right,
                    color: AppColors.gray,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
