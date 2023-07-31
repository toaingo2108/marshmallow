import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/shared/providers.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:marshmallow/utils/functions.dart';

import 'package:material_symbols_icons/symbols.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 55),
        child: ProfileAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Column(
            children: [
              const TryMarshmallowClubContainer(),
              const SizedBox(
                height: 16,
              ),
              const ProfileTopMenu(),
              const SizedBox(height: 16),
              ProfileLongButton(
                title: 'Referrals',
                icon: Symbols.group_add_rounded,
                onTap: () {
                  context.router.push(const ReferralsRoute());
                },
              ),
              ProfileLongButton(
                title: 'Addresses',
                icon: Symbols.pin_drop,
                onTap: () {
                  openUsersAddresses(context, ref);
                },
              ),
              ProfileLongButton(
                title: 'My Orders',
                icon: Symbols.receipt_long,
                onTap: () {
                  //TODO: Change to go to order page.
                  ref.read(bottomNavBarNotifier.notifier).setIndex(3);
                  // context.router.push(OrdersRoute(comesFromProfile: true));
                },
              ),
              ProfileLongButton(
                title: 'Settings',
                icon: Symbols.settings,
                onTap: () {
                  context.router.push(const SettingsRoute());
                },
              ),
              ProfileLongButton(
                title: 'Help',
                icon: Symbols.help,
                onTap: () {
                  context.router.push(const HelpRoute());
                },
              ),
              ProfileLongButton(
                title: 'Log out',
                icon: Symbols.logout,
                onTap: () {
                  ref.read(myBagRepositoryProvider).clearMyBag();
                  ref.read(authNotifierProvider.notifier).signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
