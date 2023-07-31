import 'package:flutter/material.dart';
import 'package:marshmallow/theme/app_colors.dart';

//? Customizable Sign in/up with socials button
class SocialSignUp extends StatelessWidget {
  const SocialSignUp({
    required this.backgroundColor,
    required this.title,
    this.onTap,
    this.logo,
    super.key,
  });

  final Color backgroundColor;
  final String title;
  final void Function()? onTap;
  final Widget? logo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 4,
            color: AppColors.textColor.withOpacity(0.2),
          ),
        ],
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: SizedBox.expand(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (logo != null) logo!,
                    const Spacer(),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 28)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
