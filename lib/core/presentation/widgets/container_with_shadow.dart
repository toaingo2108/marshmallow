import 'package:flutter/material.dart';
import 'package:marshmallow/theme/theme.dart';

class ContainerWithShadow extends StatelessWidget {
  const ContainerWithShadow({
    super.key,
    required this.height,
    required this.child,
    this.backgroundColor,
  });

  final Widget child;
  final double height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 4,
            color: AppColors.textColor.withOpacity(0.1),
          ),
        ],
      ),
      child: child,
    );
  }
}
