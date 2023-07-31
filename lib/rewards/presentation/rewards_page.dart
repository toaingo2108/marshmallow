import 'package:auto_route/auto_route.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/rewards/presentation/widgets/widgets.dart';
import 'package:marshmallow/rewards/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:material_symbols_icons/symbols.dart';

//? Page containing the products that are redeemable as rewards.
@RoutePage()
class RewardsPage extends ConsumerWidget {
  final bool comesFromProfile;
  static const routeName = '/rewards';
  const RewardsPage({this.comesFromProfile = false});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(redeemedRewardsNotifierProvider, (_, state) {
      state.maybeMap(
        orElse: () {},
        redeemedFailure: (_) async {
          context.showFlash<bool>(
            duration: const Duration(seconds: 3),
            builder: (context, controller) => BottomToast(
              controller: controller,
              title: 'Something went wrong, Try again later',
              icon: Symbols.close,
              iconColor: AppColors.red,
            ),
          );
          ref.read(redeemedRewardsNotifierProvider.notifier).resetState();
        },
        redeemed: (_) async {
          context.showFlash<bool>(
            duration: const Duration(seconds: 3),
            builder: (context, controller) => BottomToast(
              controller: controller,
              title: 'Reward redeemed. Click here to learn more.',
              icon: Symbols.check_circle,
              iconColor: AppColors.green,
            ),
          );
          ref.read(redeemedRewardsNotifierProvider.notifier).resetState();
        },
      );
    });
    final rewardsState = ref.watch(rewardsNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 54),
        child: RewardsAppBar(comesFromProfile: comesFromProfile),
      ),
      body: SafeArea(
        top: !comesFromProfile,
        child: Column(
          children: [
            const MWPointsBar(),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: rewardsState.maybeMap(
                orElse: () {
                  return Container();
                },
                loading: (_) => const PageLoader(),
                firebaseFailure: (_) => Text(_.failure.error.toString()),
                success: (_) {
                  return PullToRefresh(
                    onRefresh: () async {
                      ref.read(rewardsNotifierProvider.notifier).fetchRewards();
                    },
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      itemCount: _.availableRewards.length,
                      itemBuilder: (context, index) => RewardProductItem(
                        product: _.availableRewards[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
