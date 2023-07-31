import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/models/order.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/repositories/checkout_repository.dart';
import 'package:marshmallow/core/repositories/orders_repository.dart';
import 'package:marshmallow/core/repositories/rewards_repository.dart';
import 'package:marshmallow/core/repositories/user_repository.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';
import 'package:marshmallow/ongoing_order/shared/providers.dart';

part 'orders_notifier.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const OrdersState._();

  const factory OrdersState.loading() = _Loading;
  const factory OrdersState.idle() = _Idle;
  const factory OrdersState.success({
    required Stream<Map<String, Future<Order>>> orders,
  }) = _Success;
  const factory OrdersState.firebaseFailure(FirebaseFailure failure) =
      _FirebaseFailure;
  const factory OrdersState.placeOrderFailure(FirebaseFailure failure) =
      _PlaceOrderFailure;
}

class OrdersNotifier extends StateNotifier<OrdersState> {
  OrdersNotifier(
    this._ordersRepository,
    this._checkoutRepository,
    this._rewardsRepository,
    this._userRepository,
  ) : super(const OrdersState.idle());

  // ignore: unused_field
  final OrdersRepository _ordersRepository;
  final CheckoutRepository _checkoutRepository;
  final RewardsRepository _rewardsRepository;
  final UserRepository _userRepository;

  void resetState() {
    state = const OrdersState.idle();
  }

  Future<void> fetchOrders() async {
    state = const OrdersState.loading();
    final ordersOrFailure = await _ordersRepository.getOrders();

    state = ordersOrFailure.fold(
      (l) => OrdersState.success(orders: l),
      (r) => OrdersState.firebaseFailure(r),
    );
  }

  Future<void> placeOrder(
    Order order,
    BuildContext context,
    WidgetRef ref,
  ) async {
    //Initiate payment
    final successfulPurchase = await _checkoutRepository.pay(order);
    if (successfulPurchase) {
      //Create order on firebase
      final failureOrSuccess = await _ordersRepository.createOrder(order);
      failureOrSuccess.fold(
        (l) async {
          final userID = ref.read(authNotifierProvider.notifier).getUserID;
          //Set redeemed rewards as delivered. Done now because otherwise the items will be added to their bag again.
          final rewardsUpdated =
              await _rewardsRepository.setDeliveryDate(order, userID!);
          rewardsUpdated.fold(
            (l) async {
              //Empty bag
              ref.read(itemsDataMyBag.notifier).state = [];
              ref.read(myBagRepositoryProvider).clearMyBag();
              //Update user reward points for the purchase.
              final userPointsUpdated = await _userRepository.updateUserField(
                'rewardPoints',
                (ref.read(userInfoProvider)?.rewardPoints ?? 0) +
                    order.getOrderPoints(),
                userID,
              );

              userPointsUpdated.fold(
                (l) {
                  ref.read(userInfoProvider.notifier).update(
                        (state) => state?.copyWith(
                          rewardPoints:
                              state.rewardPoints + order.getOrderPoints(),
                        ),
                      );
                  context.router.pushAndPopUntil(
                    OnGoingOrderRoute(status: OnGoingOrderStatus.confirmed),
                    predicate: (route) => route.isFirst,
                  );
                },
                (r) => state = OrdersState.placeOrderFailure(r),
              );
            },
            (r) => state = OrdersState.placeOrderFailure(r),
          );
        },
        (r) => state = OrdersState.placeOrderFailure(r),
      );
    } else {
      state = const OrdersState.placeOrderFailure(
        FirebaseFailure.firestore('Payment declined'),
      );
    }
  }
}
