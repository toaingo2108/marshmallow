import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/auth/presentation/widgets/widgets.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  static const String routeName = '/sign-in';
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/sign-up-background.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Text(
                  'Yummy!!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Just a few minutes away...',
                  style: TextStyle(
                    color: AppColors.textColor.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 28),
                PillButton(
                  title: 'Sign in',
                  onTap: () {
                    showRoundedBottomModal(
                      context,
                      const SignInBottomModal(isSignIn: true),
                    );
                  },
                  backgroundColor: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  height: 36,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'New here?',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showRoundedBottomModal(
                          context,
                          const SignInBottomModal(isSignIn: false),
                        );
                      },
                      child: const Text(
                        ' Sign up',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
