import 'package:flutter/material.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';

class AdsSpace extends StatelessWidget {
  const AdsSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(20)),
      height: Utils.sizeOf(300),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
      ),
      alignment: Alignment.center,
      child: const Text('Ads space'),
    );
  }
}
