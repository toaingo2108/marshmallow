import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/presentation/widgets/widgets.dart';
import 'package:marshmallow/auth/presentation/widgets/widgets.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/models/user_info.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/extensions.dart';

@RoutePage()
class CompleteAccountPage extends ConsumerWidget {
  static const String routeName = '/complete-account';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userInfoProvider);

    return DismissibleKeyboard(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: const Text(
            'COMPLETE YOUR ACCOUNT',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColors.darkPrimaryColor,
            ),
          ),
          leadingWidth: 48,
          leading: GestureDetector(
            onTap: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.textFieldBackground,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1.5, 1.5),
                    blurRadius: 4,
                    color: AppColors.textColor.withOpacity(0.15),
                  ),
                ],
              ),
              child: const Icon(
                Icons.chevron_left_rounded,
                color: AppColors.darkGray,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                subtitle: 'Full Name*',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                initialText: userProvider?.fullName ?? '',
                onChanged: (val) {
                  ref.read(userInfoProvider.notifier).update(
                        (state) => state == null
                            ? UserInfo(
                                fullName: val.trim().isEmpty ? null : val,
                              )
                            : state.copyWith(
                                fullName: val.trim().isEmpty ? null : val,
                              ),
                      );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                subtitle: 'ID Number*',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                onChanged: (val) {
                  ref.read(userInfoProvider.notifier).update(
                        (state) => state == null
                            ? UserInfo(
                                idNumber: val.trim().isEmpty ? null : val,
                              )
                            : state.copyWith(
                                idNumber: val.trim().isEmpty ? null : val,
                              ),
                      );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              if (userProvider?.emailConfirmDate != null)
                CustomTextField(
                  subtitle: 'E-mail Address',
                  editable: false,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  initialText: userProvider?.email,
                  textAlign: TextAlign.center,
                  successCondition: userProvider?.email != null,
                ),
              if (userProvider?.emailConfirmDate != null)
                ConfirmedOnLabel(date: userProvider!.emailConfirmDate!),
              if (userProvider?.emailConfirmDate != null)
                const SizedBox(
                  height: 40,
                ),
              if (userProvider?.phoneConfirmDate != null)
                CustomTextField(
                  editable: false,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  subtitle: 'Phone number',
                  textAlign: TextAlign.center,
                  initialText: userProvider?.phoneNumber?.toPhoneNumber(),
                  successCondition: userProvider?.phoneNumber != null,
                ),
              if (userProvider?.phoneConfirmDate != null)
                ConfirmedOnLabel(date: userProvider!.phoneConfirmDate!),
              if (userProvider?.phoneConfirmDate != null)
                const SizedBox(
                  height: 40,
                ),
              if (userProvider?.phoneConfirmDate == null)
                const AddCredentialContainer(
                  isPhone: true,
                ),
              if (userProvider?.phoneConfirmDate == null)
                const SizedBox(
                  height: 24,
                ),
              if (userProvider?.emailConfirmDate == null)
                const AddCredentialContainer(
                  isPhone: false,
                ),
              const Spacer(),
              PillButton(
                backgroundColor: userProvider != null &&
                        userProvider.fullName != null &&
                        userProvider.idNumber != null
                    ? AppColors.textColor
                    : AppColors.white,
                fontColor: userProvider != null &&
                        userProvider.fullName != null &&
                        userProvider.idNumber != null
                    ? AppColors.white
                    : AppColors.textColor,
                borderColor: AppColors.textFieldBorder.withOpacity(0.5),
                fontWeight: FontWeight.w700,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1.5, 1.5),
                    blurRadius: 4,
                    color: AppColors.textColor.withOpacity(0.2),
                  )
                ],
                borderWidth: 1,
                title: 'Continue',
                onTap: () {
                  if (userProvider != null &&
                      userProvider.fullName != null &&
                      userProvider.idNumber != null) {
                    ref.read(authNotifierProvider.notifier).createUser(
                          userProvider.copyWith(
                            notifications: true,
                            smsNotifications: true,
                            emailNotifications: true,
                          ),
                        );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
