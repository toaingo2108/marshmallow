import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/auth/application/auth_notifier.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';
import 'package:marshmallow/orders/shared/providers.dart';
import 'package:marshmallow/rewards/shared/providers.dart';
import 'package:marshmallow/theme/app_theme.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthStatus();
  return unit;
});

class AppWidget extends ConsumerWidget {
  final _appRouter = AppRouter();

  AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, state) {});
    ref.listen<AuthState>(authNotifierProvider, (_, state) {
      state.maybeMap(
        authenticated: (_) {
          ref.read(userInfoProvider.notifier).state = _.userInfo;
          if (_.userInfo?.idNumber != null) {
            // Set the users address.
            final addressNotifier =
                ref.read(editingAddressNotifierProvider.notifier);
            addressNotifier.getSelectedAddress(ref);
            // Retrieve the products in bag.
            final productsInBag =
                ref.read(myBagRepositoryProvider).retrieveMyBag();
            ref.read(itemsDataMyBag.notifier).state = productsInBag;
            // Add undelivered and not expired redeemed rewards to bag
            ref
                .read(redeemedRewardsNotifierProvider.notifier)
                .getAndAddRedeemedRewardsToBag(ref);
            _appRouter.pushAndPopUntil(
              const MenuRoute(),
              predicate: (_) => false,
            );
          } else {
            _appRouter.pushAndPopUntil(
              const CompleteAccountRoute(),
              predicate: (_) => false,
            );
          }
        },
        unauthenticated: (_) {
          ref.read(ordersNotifierProvider.notifier).resetState();
          ref.read(addressProvider.notifier).state = null;
          ref.read(userInfoProvider.notifier).state = null;
          _appRouter.pushAndPopUntil(
            const SignInRoute(),
            predicate: (_) => false,
          );
        },
        initial: (_) {
          return _appRouter.pushAndPopUntil(
            const LoadingRoute(),
            predicate: (_) => false,
          );
        },
        orElse: () {},
      );
    });
    return MaterialApp.router(
      title: 'Marshmallow',
      theme: AppTheme().light,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
