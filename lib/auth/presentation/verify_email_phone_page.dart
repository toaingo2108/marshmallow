import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/auth/presentation/widgets/widgets.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/app_colors.dart';

@RoutePage()
class VerifyPhoneOrEmailPage extends StatelessWidget {
  const VerifyPhoneOrEmailPage({required this.isPhone});
  static const routeName = '/verify';
  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    return DismissibleKeyboard(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 54),
          child: PopAppBar(title: isPhone ? 'Phone Number' : 'E-mail'),
        ),
        body: VerifyPhoneEmailBody(isPhone: isPhone, isSignIn: false),
      ),
    );
  }
}
