//? The top bar on the Address Overlay
import 'package:flutter/material.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:material_symbols_icons/symbols.dart';

class EditAddressTopBar extends StatelessWidget {
  const EditAddressTopBar({
    super.key,
    required this.topBarHeight,
    required this.onArrowTap,
    required this.onMyLocationTap,
  });

  final double topBarHeight;
  final void Function() onArrowTap;
  final void Function() onMyLocationTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: topBarHeight,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1.5),
            blurRadius: 3,
            color: AppColors.textColor.withOpacity(0.1),
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onArrowTap,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Center(
                    child: Icon(
                      topBarHeight >= 166
                          ? Icons.expand_more
                          : Icons.chevron_left,
                      size: 32,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'DELIVERY ADDRESS',
                style: TextStyle(color: AppColors.textColor, fontSize: 12),
              ),
              const SizedBox(
                width: 24,
                height: 24,
              ),
              const Spacer(),
            ],
          ),
          if (topBarHeight >= 166)
            Column(
              children: [
                const SizedBox(
                  height: 68,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: onMyLocationTap,
                          child: const Text(
                            'Use my location',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        // Text(
                        //   '47 W 13th St, New York, NY',
                        //   style: TextStyle(
                        //     fontSize: 10,
                        //     fontWeight: FontWeight.w300,
                        //     color: AppColors.darkGray,
                        //   ),
                        // )
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: onMyLocationTap,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          border: Border.all(
                            color: AppColors.darkGray.withOpacity(0.1),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Symbols.person_pin_circle_rounded,
                          size: 18,
                          color: AppColors.textColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }
}
