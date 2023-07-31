import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/container_with_shadow.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:material_symbols_icons/symbols.dart';

class ProfileTopMenu extends StatelessWidget {
  const ProfileTopMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWithShadow(
      height: 76,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProfileMenuButton(
            title: 'Profile',
            icon: Symbols.person,
            onTap: () {
              context.router.push(const UserProfileRoute());
            },
          ),
          ProfileMenuButton(
            title: 'Payments',
            icon: Symbols.credit_card,
            onTap: () {
              context.router.push(const PaymentMethodsRoute());
            },
          ),
          ProfileMenuButton(
            title: 'Rewards',
            icon: Symbols.local_activity,
            onTap: () {
              context.router.push(RewardsRoute(comesFromProfile: true));
            },
          ),
          ProfileMenuButton(
            title: 'Club',
            isClub: true,
            onTap: () {
              context.router.push(const MWClubRoute());
            },
          ),
        ],
      ),
    );
  }
}
