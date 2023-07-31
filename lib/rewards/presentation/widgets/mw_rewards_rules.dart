import 'package:flutter/material.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';

//? Bar with the redeemed rewards rules.
class MWRewardRules extends StatelessWidget {
  const MWRewardRules({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      color: AppColors.textFieldBackground,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          const HappyMarshmallow(size: 59),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Rules:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                RichText(
                  text: const TextSpan(
                    text:
                        'Redeemed rewards will be delivered with your next order. ',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 10,
                      color: AppColors.textColor,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'If not claimed, your reward expires after 30 days.',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                      )
                    ],
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
