import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/extensions.dart';

@RoutePage()
class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});
  static const routeName = '/profile/user';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: PopAppBar(
          title: 'User Profile',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Info',
              style: TextStyle(
                color: AppColors.darkPrimaryColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Full name',
              style:
                  TextStyle(fontSize: 8, color: AppColors.secondaryTextColor),
            ),
            const SizedBox(height: 6),
            ContainerWithShadow(
              height: 28,
              backgroundColor: AppColors.textFieldBackground,
              child: Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    userInfo?.fullName ?? '',
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'ID Number',
              style:
                  TextStyle(fontSize: 8, color: AppColors.secondaryTextColor),
            ),
            const SizedBox(height: 6),
            ContainerWithShadow(
              height: 28,
              backgroundColor: AppColors.textFieldBackground,
              child: Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    userInfo?.idNumber ?? '',
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Credentials',
              style: TextStyle(
                color: AppColors.darkPrimaryColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
            if (userInfo?.emailConfirmDate != null)
              CredentialOption(
                confirmationDate: userInfo!.emailConfirmDate!,
                emailOrPhone: userInfo.email!,
                isPhone: false,
              ),
            const SizedBox(height: 16),
            if (userInfo?.phoneConfirmDate != null)
              CredentialOption(
                confirmationDate: userInfo!.phoneConfirmDate!,
                emailOrPhone: userInfo.phoneNumber!.toPhoneNumber()!,
                isPhone: true,
              ),
            if (userInfo?.phoneConfirmDate == null)
              const AddCredentialContainer(
                isPhone: true,
              ),
            if (userInfo?.emailConfirmDate == null)
              const SizedBox(
                height: 20,
              ),
            if (userInfo?.emailConfirmDate == null)
              const AddCredentialContainer(
                isPhone: false,
              ),
          ],
        ),
      ),
    );
  }
}
