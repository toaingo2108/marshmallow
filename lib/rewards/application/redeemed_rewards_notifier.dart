import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/models/redeemed_product.dart';
import 'package:marshmallow/core/repositories/rewards_repository.dart';
import 'package:marshmallow/core/repositories/user_repository.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';

part 'redeemed_rewards_notifier.freezed.dart';

@freezed
class RedeemedRewardsState with _$RedeemedRewardsState {
  const RedeemedRewardsState._();

  const factory RedeemedRewardsState.loading() = _Loading;
  const factory RedeemedRewardsState.idle() = _Idle;
  const factory RedeemedRewardsState.success({
    required List<Future<RedeemedProduct>> redeemedRewards,
  }) = _Success;
  const factory RedeemedRewardsState.firebaseFailure(FirebaseFailure failure) =
      _FirebaseFailure;
  const factory RedeemedRewardsState.redeemed() = _Redeemed;
  const factory RedeemedRewardsState.redeemedFailure() = _RedeemedFailure;
}

class RedeemedRewardsNotifier extends StateNotifier<RedeemedRewardsState> {
  RedeemedRewardsNotifier(this._rewardsRepository, this._userRepository)
      : super(const RedeemedRewardsState.idle());

  final RewardsRepository _rewardsRepository;
  final UserRepository _userRepository;

  void resetState() => state = const RedeemedRewardsState.idle();

  Future<void> fetchRedeemedRewards(WidgetRef ref) async {
    final userID = ref.read(authNotifierProvider.notifier).getUserID;
    state = const RedeemedRewardsState.loading();
    final successOrFailure =
        await _rewardsRepository.getUserRedeemedRewards(userID!);

    state = successOrFailure.fold(
      (l) => RedeemedRewardsState.success(redeemedRewards: l),
      (r) => RedeemedRewardsState.firebaseFailure(r),
    );
  }

  Future<void> getAndAddRedeemedRewardsToBag(WidgetRef ref) async {
    final userID = ref.read(authNotifierProvider.notifier).getUserID;
    final successOrFailure =
        await _rewardsRepository.getUserRedeemedRewards(userID!);

    successOrFailure.fold(
      (l) async {
        state = RedeemedRewardsState.success(redeemedRewards: l);
        final List<Product> redeemedRewardsForBag = [];
        for (final product in l) {
          final redeemedProduct = await product;
          if (redeemedProduct.deliveryDate == null &&
              redeemedProduct.redeemedDate
                  .add(const Duration(days: 30))
                  .isAfter(DateTime.now())) {
            redeemedRewardsForBag
                .add(redeemedProduct.product.copyWith(isReward: true));
          }
        }
        ref
            .read(itemsDataMyBag.notifier)
            .update((state) => [...state, ...redeemedRewardsForBag]);
      },
      (r) => state = RedeemedRewardsState.firebaseFailure(r),
    );
  }

  Future<void> redeemReward(
    WidgetRef ref,
    Product product,
  ) async {
    final prevPoints = ref.read(userInfoProvider)!.rewardPoints;
    final newPoints =
        ref.read(userInfoProvider)!.rewardPoints - product.pointsPrice!;
    ref.read(userInfoProvider.notifier).update(
          (state) => state!.copyWith(
            rewardPoints: newPoints,
          ),
        );
    final userID = ref.read(authNotifierProvider.notifier).getUserID;

    final successOrFailure =
        await _rewardsRepository.redeemReward(userID!, product.productID);

    successOrFailure.fold(
      (l) async {
        final successOrFailure = await _userRepository.updateUserField(
          'rewardPoints',
          newPoints,
          userID,
        );
        successOrFailure.fold(
          (l) {
            ref.read(itemsDataMyBag).add(product.copyWith(isReward: true));
            state = const RedeemedRewardsState.redeemed();
          },
          (r) {
            ref.read(userInfoProvider.notifier).update(
                  (state) => state!.copyWith(
                    rewardPoints: prevPoints,
                  ),
                );
            state = const RedeemedRewardsState.redeemedFailure();
          },
        );
      },
      (r) {
        ref.read(userInfoProvider.notifier).update(
              (state) => state!.copyWith(
                rewardPoints: prevPoints,
              ),
            );
        state = const RedeemedRewardsState.redeemedFailure();
      },
    );
  }
}
