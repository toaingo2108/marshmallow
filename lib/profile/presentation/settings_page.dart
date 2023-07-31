import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});
  static const routeName = '/profile/settings';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userInfoProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: PopAppBar(
          title: 'Settings',
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ContainerWithShadow(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 9, top: 5),
                    height: 26,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.textFieldBackground,
                    ),
                    child: const Text(
                      'Notification settings',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9, right: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 14),
                        RowWithSwitch(
                          title: 'Notifications',
                          value: userProvider?.notifications ?? true,
                          onChanged: (val) {
                            ref.read(userInfoProvider.notifier).update(
                                  (state) =>
                                      state?.copyWith(notifications: val),
                                );
                            ref
                                .read(authNotifierProvider.notifier)
                                .updateField('notifications', val);
                          },
                        ),
                        const SizedBox(height: 10),
                        RowWithSwitch(
                          title: 'E-mail',
                          value: userProvider?.emailNotifications ?? true,
                          onChanged: (val) {
                            ref.read(userInfoProvider.notifier).update(
                                  (state) =>
                                      state?.copyWith(emailNotifications: val),
                                );
                            ref
                                .read(authNotifierProvider.notifier)
                                .updateField('emailNotifications', val);
                          },
                        ),
                        const SizedBox(height: 10),
                        RowWithSwitch(
                          title: 'SMS',
                          value: userProvider?.smsNotifications ?? true,
                          onChanged: (val) {
                            ref.read(userInfoProvider.notifier).update(
                                  (state) =>
                                      state?.copyWith(smsNotifications: val),
                                );
                            ref
                                .read(authNotifierProvider.notifier)
                                .updateField('smsNotifications', val);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 54,
            width: double.infinity,
            color: AppColors.textFieldBackground,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  HappyMarshmallow(size: 39),
                  SizedBox(width: 12),
                  Text(
                    'Only news and promotions can be disabled.\nOrder notifications are key to your experience.',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileLongButton(
                  title: 'Clear search history',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                ProfileLongButton(
                  title: 'Terms of use',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                ProfileLongButton(
                  title: 'Privacy Policy',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                const Text(
                  'Version 0.1.0',
                  style: TextStyle(
                    fontSize: 8,
                    color: AppColors.secondaryTextColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RowWithSwitch extends StatelessWidget {
  const RowWithSwitch({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  final String title;
  final bool value;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: AppColors.textColor, fontSize: 12),
        ),
        const Spacer(),
        SizedBox(
          width: 28,
          height: 15,
          child: Transform.scale(
            scale: 0.6,
            child: CupertinoSwitch(
              value: value,
              activeColor: AppColors.darkPrimaryColor,
              trackColor: AppColors.inactiveSwitchGray,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
