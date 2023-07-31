import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/browse_categories/presentation/browse_categories_page.dart';
import 'package:marshmallow/core/shared/providers.dart';
import 'package:marshmallow/home/presentation/home_page.dart';
import 'package:marshmallow/orders/presentation/orders_page.dart';
import 'package:marshmallow/orders/shared/providers.dart';
import 'package:marshmallow/profile/presentation/profile.dart';
import 'package:marshmallow/rewards/presentation/rewards_page.dart';
import 'package:marshmallow/rewards/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});
  static const routeName = '/menu';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarNotifier);
    final navNotifier = ref.read(bottomNavBarNotifier.notifier);

    final List<Widget> pages = [
      const RewardsPage(),
      const BrowseCategoriesPage(),
      const HomePage(),
      const OrdersPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1.5),
              blurRadius: 4,
              color: AppColors.textColor.withOpacity(.15),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Symbols.local_activity),
              label: 'Rewards',
            ),
            BottomNavigationBarItem(
              icon: Icon(Symbols.search_rounded),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Symbols.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Symbols.receipt_long_rounded),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Symbols.person,
              ),
              label: 'Profile',
            ),
          ],
          unselectedItemColor: AppColors.darkGray,
          selectedItemColor: AppColors.darkPrimaryColor,
          backgroundColor: Colors.white,
          onTap: (index) {
            navNotifier.setIndex(index);
            if (index == 3) {
              ref.read(ordersNotifierProvider).maybeMap(
                    orElse: () {
                      ref.read(ordersNotifierProvider.notifier).fetchOrders();
                    },
                    success: (_) {},
                  );
            }
            if (index == 0) {
              ref.read(rewardsNotifierProvider).maybeMap(
                    orElse: () {
                      ref.read(rewardsNotifierProvider.notifier).fetchRewards();
                    },
                    success: (_) {},
                  );
            }
          },
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
