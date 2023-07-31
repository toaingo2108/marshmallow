import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class ReferralsPage extends ConsumerWidget {
  const ReferralsPage({super.key});
  static const routeName = '/profile/referrals';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: PopAppBar(
          title: 'Referrals',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ContainerWithShadow(
              height: 221,
              child: Stack(
                children: [
                  Container(
                    height: 71,
                    decoration: const BoxDecoration(
                      color: AppColors.textFieldBackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 16.0,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        children: [
                          HappyMarshmallow(size: 62),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'You get \$1.00\nThey get \$1.00',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Just ‘cause I like you!',
                            style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Hook a friend up with \$1 of Marshmallow and free delivery and you’ll get \$1 when they complete their first order. Now, that’s love.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            PillButton(
              title: 'Share',
              borderColor: AppColors.darkPrimaryColor,
              borderWidth: 1,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              fontColor: AppColors.darkPrimaryColor,
              leading: const Icon(
                Symbols.ios_share,
                color: AppColors.darkPrimaryColor,
              ),
              onTap: () {
                Share.share(
                  'Sign up to marshmallow using my referral code: ${ref.read(authNotifierProvider.notifier).getUserID ?? ''}',
                );
              },
            ),
            // const SizedBox(height: 12),
            // PillButton(
            //   title: 'Instagram Stories',
            //   borderColor: AppColors.darkPrimaryColor,
            //   borderWidth: 1,
            //   fontWeight: FontWeight.w600,
            //   fontSize: 12,
            //   fontColor: AppColors.darkPrimaryColor,
            //   leading: Image.asset(
            //     'assets/images/ic-instagram.png',
            //     height: 18,
            //   ),
            //   onTap: () {
            //     try{
            //     SocialShare.shareInstagramStory(appId: appId, imagePath: imagePath)}
            //     catch(e){
            //     }
            //   },
            // ),
            const SizedBox(height: 12),
            PillButton(
              title: 'QR Code',
              borderColor: AppColors.darkPrimaryColor,
              borderWidth: 1,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              fontColor: AppColors.darkPrimaryColor,
              leading: const Icon(
                Symbols.qr_code_2,
                color: AppColors.darkPrimaryColor,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Center(
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Card(
                        color: AppColors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            QrImageView(
                              data: ref
                                      .read(authNotifierProvider.notifier)
                                      .getUserID ??
                                  '',
                              size: 200.0,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Close',
                                style: TextStyle(
                                  color: AppColors.darkPrimaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
            const Text(
              'Credit will be auto-applied to your account and expires in 30 days.\nOffer valid in US only.\n\$1.00 off your next order.\n\$1.00 off their next order.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Terms Apply',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 10,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
