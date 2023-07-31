import 'package:flutter/material.dart';
import 'package:marshmallow/theme/app_colors.dart';

class HappyMarshmallow extends StatelessWidget {
  const HappyMarshmallow({
    super.key,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1.5, 1.5),
            blurRadius: 4,
            color: AppColors.textColor.withOpacity(0.15),
          )
        ],
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/smiling-marshmallow.png',
          ),
        ),
      ),
    );
  }
}
