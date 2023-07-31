import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/rewards/presentation/widgets/widgets.dart';
import 'package:marshmallow/rewards/shared/providers.dart';

//? Page containing the rewards the user has redeemed.
@RoutePage()
class RedeemedRewardsPage extends ConsumerWidget {
  static const routeName = '/redeemed-rewards';
  const RedeemedRewardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final redeemedRewardsState = ref.watch(redeemedRewardsNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: PopAppBar(title: 'Go Back'),
      ),
      body: DismissibleKeyboard(
        child: Column(
          children: [
            const MWRewardRules(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: SearchTextField(
                hintText: 'Search on Redeemed Rewards',
                onChanged: (val) {
                  ref.read(redeemedRewardsSearchQueryProvider.notifier).state =
                      val.isEmpty ? null : val;
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            redeemedRewardsState.maybeMap(
              orElse: () {
                return Container();
              },
              loading: (_) => const PageLoader(),
              firebaseFailure: (_) => Text(_.failure.error.toString()),
              success: (_) {
                return Expanded(
                  child: PullToRefresh(
                    onRefresh: () async {
                      ref
                          .read(redeemedRewardsNotifierProvider.notifier)
                          .fetchRedeemedRewards(ref);
                    },
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _.redeemedRewards.length,
                      itemBuilder: (context, index) => RedeemedRewardItem(
                        product: _.redeemedRewards[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
