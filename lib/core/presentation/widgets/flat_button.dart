//? Customizable flat button
import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    this.borderColor,
    this.fontColor,
    this.backgroundColor,
    required this.title,
    this.icon,
    required this.onTap,
    this.fontSize,
    this.fontWeight,
    this.boxShadow,
    this.borderWidth,
    this.leading,
    this.height = 44,
  });
  final String title;
  final double height;
  final IconData? icon;
  final void Function() onTap;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final List<BoxShadow>? boxShadow;
  final double? borderWidth;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth ?? 0.5)
            : null,
        borderRadius: BorderRadius.circular(34),
        boxShadow: boxShadow,
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: SizedBox.expand(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leading != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: leading,
                      ),
                    if (leading != null) const Spacer(),
                    if (icon != null)
                      Icon(
                        icon,
                        color: fontColor,
                      ),
                    if (icon != null)
                      const SizedBox(
                        width: 12,
                      ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        color: fontColor ?? Colors.white,
                      ),
                    ),
                    if (leading != null) const Spacer(),
                    if (leading != null)
                      Opacity(
                        opacity: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: leading,
                        ),
                      ),
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
