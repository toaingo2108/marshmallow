import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/app_colors.dart';

class AlertSettingsPage extends StatelessWidget {
  const AlertSettingsPage({super.key});
  static const routeName = 'profile/alert-settings';
  @override
  Widget build(BuildContext context) {
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
                          value: true,
                          onChanged: (val) {},
                        ),
                        const SizedBox(height: 10),
                        RowWithSwitch(
                          title: 'E-mail',
                          value: true,
                          onChanged: (val) {},
                        ),
                        const SizedBox(height: 10),
                        RowWithSwitch(
                          title: 'SMS',
                          value: true,
                          onChanged: (val) {},
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
