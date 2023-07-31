import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/app_colors.dart';

//? Bar that shows the user's total points.
class MWPointsBar extends ConsumerWidget {
  const MWPointsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userInfoProvider);
    return Container(
      height: 92,
      color: AppColors.textFieldBackground,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 7),
                height: 27,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.textColor.withOpacity(0.10),
                      offset: const Offset(2, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.lightPrimaryColor,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 67,
                    ),
                    const Text(
                      'Marshmallow points',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColors.darkPrimaryColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      (user?.rewardPoints ?? 0).toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColors.darkPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 72),
                child: Text(
                  'You can redeem your rewards here!',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ],
          ),
          const HappyMarshmallow(size: 60),
        ],
      ),
    );
  }
}
