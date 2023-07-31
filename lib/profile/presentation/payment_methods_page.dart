import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/widgets/pop_app_bar.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/app_colors.dart';

@RoutePage()
class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  static const routeName = '/profile/payment-methods';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: PopAppBar(
          title: 'Payment Methods',
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 70,
            color: AppColors.textFieldBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const HappyMarshmallow(
                    size: 45,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        text:
                            'Apple pay is the only payment method for now\nLet me know if you need',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 10,
                          color: AppColors.secondaryTextColor,
                        ),
                        children: [
                          TextSpan(
                            text: ' help ',
                            style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkPrimaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: 'with your phone settings!',
                            style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 10,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ApplePayButton(),
          ),
        ],
      ),
    );
  }
}
