import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/repositories/rewards_repository.dart';

part 'rewards_notifier.freezed.dart';

@freezed
class RewardsState with _$RewardsState {
  const RewardsState._();

  const factory RewardsState.loading() = _Loading;
  const factory RewardsState.idle() = _Idle;
  const factory RewardsState.success({
    required List<Product> availableRewards,
  }) = _Success;
  const factory RewardsState.firebaseFailure(FirebaseFailure failure) =
      _FirebaseFailure;
}

class RewardsNotifier extends StateNotifier<RewardsState> {
  RewardsNotifier(this._rewardsRepository) : super(const RewardsState.idle());

  final RewardsRepository _rewardsRepository;

  Future<void> fetchRewards() async {
    state = const RewardsState.loading();
    final successOrFailure = await _rewardsRepository.getRewardProducts();

    state = successOrFailure.fold(
      (l) => RewardsState.success(availableRewards: l),
      (r) => RewardsState.firebaseFailure(r),
    );
  }
}
