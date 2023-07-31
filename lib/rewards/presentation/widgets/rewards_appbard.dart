import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/rewards/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';

//? AppBar for the Rewards Page.
class RewardsAppBar extends ConsumerWidget {
  const RewardsAppBar({
    super.key,
    required this.comesFromProfile,
  });

  final bool comesFromProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Opacity(
            opacity: comesFromProfile ? 1 : 0,
            child: IgnorePointer(
              ignoring: !comesFromProfile,
              child: const PopAppBar(
                title: 'Rewards',
              ),
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 70,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 14.0, right: 20),
            child: PillButton(
              height: 25,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1.5, 1.5),
                  blurRadius: 4,
                  color: AppColors.textColor.withOpacity(.15),
                )
              ],
              backgroundColor: AppColors.textFieldBackground,
              title: 'More',
              fontWeight: FontWeight.w600,
              fontSize: 10,
              fontColor: AppColors.darkGray,
              onTap: () {
                context.router.push(const RedeemedRewardsRoute());
                ref.read(redeemedRewardsSearchQueryProvider.notifier).state =
                    null;
                ref.read(redeemedRewardsNotifierProvider).maybeMap(
                      orElse: () {
                        ref
                            .read(redeemedRewardsNotifierProvider.notifier)
                            .fetchRedeemedRewards(ref);
                      },
                      success: (_) {},
                    );
              },
            ),
          ),
        ),
      ],
    );
  }
}
