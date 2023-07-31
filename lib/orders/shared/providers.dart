import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/models/order.dart';
import 'package:marshmallow/core/repositories/checkout_repository.dart';
import 'package:marshmallow/core/repositories/orders_repository.dart';
import 'package:marshmallow/orders/application/orders_notifier.dart';
import 'package:marshmallow/rewards/shared/providers.dart';
import 'package:riverpod/riverpod.dart';

final currentOrderProvider = StateProvider<Order?>((ref) => null);

final checkoutRepositoryProvider = Provider((ref) => CheckoutRepository());

final ordersRepository = Provider(
  (ref) => OrdersRepository(
    ref.watch(authNotifierProvider).maybeMap(
          orElse: () => 'a',
          authenticated: (_) => _.userID,
        ),
  ),
);

final ordersNotifierProvider =
    StateNotifierProvider<OrdersNotifier, OrdersState>(
  (ref) => OrdersNotifier(
    ref.watch(ordersRepository),
    ref.watch(
      checkoutRepositoryProvider,
    ),
    ref.watch(rewardsRepository),
    ref.watch(userRepositoryProvider),
  ),
);
