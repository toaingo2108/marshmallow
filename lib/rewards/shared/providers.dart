import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/repositories/rewards_repository.dart';
import 'package:marshmallow/rewards/application/redeemed_rewards_notifier.dart';
import 'package:marshmallow/rewards/application/rewards_notifier.dart';

final rewardsRepository = Provider(
  (ref) => RewardsRepository(),
);

final rewardsNotifierProvider =
    StateNotifierProvider<RewardsNotifier, RewardsState>(
  (ref) => RewardsNotifier(
    ref.watch(rewardsRepository),
  ),
);

final redeemedRewardsNotifierProvider =
    StateNotifierProvider<RedeemedRewardsNotifier, RedeemedRewardsState>(
  (ref) => RedeemedRewardsNotifier(
    ref.watch(rewardsRepository),
    ref.watch(userRepositoryProvider),
  ),
);

final redeemedRewardsSearchQueryProvider =
    StateProvider<String?>((ref) => null);
