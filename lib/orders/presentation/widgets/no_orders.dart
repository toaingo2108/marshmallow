import 'package:flutter/material.dart';
import 'package:marshmallow/theme/app_colors.dart';

class NoOrders extends StatelessWidget {
  const NoOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 215,
          color: AppColors.textFieldBackground,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 160.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/detective-marshmallow.png',
                  height: 105,
                ),
                const SizedBox(
                  height: 33,
                ),
                const Text(
                  'No previous orders',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  'Start shopping to discover your favorite\nproducts! Once you place an order, your past\npurchases will show up here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: AppColors.textColor),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
