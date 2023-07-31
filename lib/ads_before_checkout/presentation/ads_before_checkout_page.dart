import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/core/presentation/widgets/pop_app_bar.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';

@RoutePage()
class AdsBeforeCheckoutPage extends ConsumerWidget {
  static const routeName = '/ads-before-checkout';

  const AdsBeforeCheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: PopAppBar(
          title: 'Club',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Utils.paddingHorizontal(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bannerCandyAdsWidget(),
                      SizedBox(
                        height: Utils.sizeOf(32),
                      ),
                      itemOptionAdsCheckout(
                        title: "Free delivery",
                        onTap: () {},
                        url_image: "assets/images/delivery-bike2.png",
                      ),
                      itemOptionAdsCheckout(
                        title: "2x Marshmallow points on all orders",
                        onTap: () {},
                        url_image: "assets/images/ic_giffx2.png",
                      ),
                      itemOptionAdsCheckout(
                        title: "No alcohol or Tobacco fees",
                        onTap: () {},
                        url_image: "assets/images/ic_cocktail1.png",
                      ),
                      itemOptionAdsCheckout(
                        title: "Cancel anytime",
                        onTap: () {},
                        url_image: "assets/images/ic_happiness1.png",
                      ),
                      itemOptionAdsCheckout(
                        title: "Cost effective",
                        onTap: () {},
                        url_image: "assets/images/ic_money1.png",
                      ),
                      itemOptionAdsCheckout(
                        title: "Exclusive Rewards",
                        onTap: () {},
                        url_image: "assets/images/ic_badge1.png",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 3,
                      offset: const Offset(0, -5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    TouchableOpacity(
                      onTap: () {},
                      activeOpacity: 0.4,
                      child: Container(
                        height: Utils.sizeOf(72),
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: Utils.sizeOf(16),
                          bottom: Utils.sizeOf(16),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.darkPrimaryColor,
                          borderRadius: BorderRadius.circular(Utils.sizeOf(30)),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Start free trial',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: Utils.sizeOf(28),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TouchableOpacity(
                      onTap: () {
                        context.router.push(const PlaceOrderRoute());
                      },
                      activeOpacity: 0.4,
                      child: Container(
                        height: Utils.sizeOf(72),
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: Utils.sizeOf(38)),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(Utils.sizeOf(30)),
                          border: Border.all(
                            color: AppColors.darkPrimaryColor,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Continue to Checkout',
                            style: TextStyle(
                              color: AppColors.darkPrimaryColor,
                              fontSize: Utils.sizeOf(28),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: Utils.sizeOf(20),
                          fontWeight: FontWeight.w400,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text:
                                'Restrictions apply. After free trial, you will be billed \$7.99 per month. By signing up for a Club subscription, you agree with our ',
                          ),
                          TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              color: AppColors.darkPrimaryColor,
                            ),
                            text: 'terms & conditions',
                          ),
                          TextSpan(
                            text: ' and ',
                          ),
                          TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              color: AppColors.darkPrimaryColor,
                            ),
                            text: 'privacy agreement',
                          ),
                          TextSpan(
                            text:
                                '. Visit the Account page to cancel any time.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bannerCandyAdsWidget() {
    return Stack(
      children: [
        Container(
          height: Utils.sizeOf(140),
          decoration: BoxDecoration(
            color: AppColors.pink3,
            borderRadius: BorderRadius.all(Radius.circular(Utils.sizeOf(20))),
          ),
        ),
        SizedBox(
          width: Utils.sizeOf(200),
          height: Utils.sizeOf(300),
          child: Image.asset('assets/images/img_candy_large.png'),
        ),
        Positioned(
          right: 0,
          top: Utils.sizeOf(30),
          child: Container(
            padding: EdgeInsets.only(
              top: Utils.sizeOf(5),
              bottom: Utils.sizeOf(5),
              left: Utils.sizeOf(20),
              right: Utils.sizeOf(30),
            ),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Utils.sizeOf(30)),
                bottomLeft: Radius.circular(Utils.sizeOf(30)),
              ),
            ),
            child: Text(
              '10 days try out',
              style: TextStyle(
                color: AppColors.white,
                fontSize: Utils.sizeOf(24),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          right: Utils.sizeOf(100),
          bottom: Utils.sizeOf(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Club Marshmallow',
                style: TextStyle(
                  color: AppColors.darkPrimaryColor,
                  fontSize: Utils.sizeOf(28),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'brings you exclusive benefits',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: Utils.sizeOf(24),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget itemOptionAdsCheckout({
    required String title,
    required Function() onTap,
    required String url_image,
  }) {
    return TouchableOpacity(
      onTap: onTap,
      activeOpacity: 0.4,
      child: Container(
        margin: EdgeInsets.only(bottom: Utils.sizeOf(24)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1.5, 1.5),
              blurRadius: 4,
              color: AppColors.black.withOpacity(0.15),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              // width: Utils.sizeOf(50),
              height: Utils.sizeOf(62),
              decoration: BoxDecoration(
                color: AppColors.lightPurple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Utils.sizeOf(40)),
                  bottomLeft: Radius.circular(Utils.sizeOf(40)),
                ),
              ),
              padding: EdgeInsets.only(
                left: Utils.sizeOf(20),
                right: Utils.sizeOf(10),
                top: Utils.sizeOf(5),
                bottom: Utils.sizeOf(5),
              ),
              alignment: Alignment.center,
              child: SizedBox(
                height: Utils.sizeOf(40),
                width: Utils.sizeOf(40),
                child: Image.asset(
                  url_image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: Utils.sizeOf(20),
            ),
            Text(
              title,
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(24),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
