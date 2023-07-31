import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/presentation/widgets/widgets.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/app_colors.dart';

//? Bottom modal for sign in and sign up
class SignInBottomModal extends ConsumerWidget {
  const SignInBottomModal({super.key, required this.isSignIn});
  final bool isSignIn;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.read(authNotifierProvider.notifier);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -4),
            blurRadius: 4,
            color: AppColors.textColor.withOpacity(0.15),
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      height: Platform.isIOS || Platform.isMacOS ? 300 : 240,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              'How do you wish to continue?',
              style: TextStyle(
                color: AppColors.textColor.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            if (Platform.isIOS || Platform.isMacOS)
              Column(
                children: [
                  const SizedBox(height: 24),
                  SocialSignUp(
                    backgroundColor: AppColors.textColor,
                    title: 'Sign in with Apple',
                    logo: const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        Icons.apple,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () async {
                      await authProvider.signInWithApple();
                    },
                  ),
                ],
              ),
            const SizedBox(height: 24),
            SocialSignUp(
              title: isSignIn ? 'Sign in with Google' : 'Sign up with Google',
              logo: Container(
                margin: const EdgeInsets.only(left: 5),
                padding: const EdgeInsets.all(7),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  'assets/images/google-logo.png',
                ),
              ),
              onTap: () async {
                await authProvider.signInWithGoogle();
              },
              backgroundColor: AppColors.blue,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: PillButton(
                    title: 'Phone Number',
                    onTap: () {
                      showRoundedBottomModal(
                        context,
                        const VerifyPhoneOrEmailModal(
                          isPhone: true,
                        ),
                      );
                    },
                    fontSize: 12,
                    backgroundColor: Colors.white,
                    fontWeight: FontWeight.w300,
                    borderColor: AppColors.textFieldBorder.withOpacity(0.5),
                    borderWidth: 1,
                    fontColor: AppColors.textColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1.5, 1.5),
                        blurRadius: 4,
                        color: AppColors.textColor.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: PillButton(
                    title: 'E-mail',
                    onTap: () {
                      showRoundedBottomModal(
                        context,
                        const VerifyPhoneOrEmailModal(
                          isPhone: false,
                        ),
                      );
                    },
                    fontSize: 12,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textFieldBorder.withOpacity(0.5),
                    fontWeight: FontWeight.w300,
                    borderWidth: 1,
                    fontColor: AppColors.textColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1.5, 1.5),
                        blurRadius: 4,
                        color: AppColors.textColor.withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                context.router.pushAndPopUntil(
                  const MenuRoute(),
                  predicate: (_) => false,
                );
              },
              child: const Text(
                'Continue as guest',
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
