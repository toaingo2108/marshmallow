import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';

@RoutePage()
class MWClubPage extends StatefulWidget {
  const MWClubPage({super.key});
  static const routeName = '/profile/club';

  @override
  State<MWClubPage> createState() => _MWClubPageState();
}

class _MWClubPageState extends State<MWClubPage> {
  bool yearSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1.5),
              color: AppColors.textColor.withOpacity(0.15),
              blurRadius: 4,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            PillButton(
              title: 'Start free trial',
              height: 36,
              fontWeight: FontWeight.w600,
              backgroundColor: AppColors.darkPrimaryColor,
              onTap: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                text:
                    'Restrictions apply. After free trial, you will be billed \$7.99 per month.By signing up for a Club subscription, you agree with our ',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 10.3,
                  color: AppColors.secondaryTextColor,
                ),
                children: [
                  TextSpan(
                    text: 'terms & conditions',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 10.3,
                      color: AppColors.darkPrimaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 10.3,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  TextSpan(
                    text: 'privacy agreement.',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 10.3,
                      color: AppColors.darkPrimaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: 'Visit the Account page to cancel any time.',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 10.3,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: PopAppBar(
          title: 'Club',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              SizedBox(
                height: 145,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: 77,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.lightPink,
                      ),
                    ),
                    Image.asset('assets/images/waving_marshmallow_right.png'),
                    const Positioned(
                      left: 100,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Club Marshmallow',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkPrimaryColor,
                            ),
                          ),
                          Text(
                            'brings you exclusive benefits',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 14,
                      right: 0,
                      child: Container(
                        width: 110,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: AppColors.textColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            '10 days try out',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              height: 1.7,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const ProfileContainerWithImage(
                imagePath: 'assets/images/delivery-bike1.png',
                title: 'Free delivery',
              ),
              const ProfileContainerWithImage(
                imagePath: 'assets/images/ic-gift-box.png',
                title: '2x Marshmallow points on all orders',
              ),
              const ProfileContainerWithImage(
                imagePath: 'assets/images/ic-cocktail.png',
                title: 'No alcohol or Tobacco fees',
              ),
              const ProfileContainerWithImage(
                imagePath: 'assets/images/ic-happy-face.png',
                title: 'Cancel anytime',
              ),
              const ProfileContainerWithImage(
                imagePath: 'assets/images/ic-money.png',
                title: 'Cost effective',
              ),
              const ProfileContainerWithImage(
                imagePath: 'assets/images/ic-badge.png',
                title: 'Exclusive Rewards',
              ),
              const SizedBox(height: 32),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: PlanOption(
                      isYearly: false,
                      price: 7.99,
                      yearSelected: yearSelected,
                      onChanged: (val) {
                        yearSelected = false;
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: PlanOption(
                      isYearly: true,
                      price: 79.99,
                      yearSelected: yearSelected,
                      onChanged: (val) {
                        yearSelected = true;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanOption extends StatelessWidget {
  const PlanOption({
    super.key,
    required this.isYearly,
    required this.onChanged,
    required this.price,
    required this.yearSelected,
  });

  final bool isYearly;
  final void Function(String?)? onChanged;
  final double price;
  final bool yearSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 4,
            color: AppColors.textColor.withOpacity(0.1),
          ),
        ],
        color: AppColors.textFieldBackground,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Radio(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            fillColor: MaterialStateColor.resolveWith(
              (states) => AppColors.primaryColor,
            ),
            value: isYearly ? 'year' : 'month',
            groupValue: yearSelected ? 'year' : 'month',
            onChanged: onChanged,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            isYearly ? 'Yearly' : 'Monthly',
            style: const TextStyle(fontSize: 12, color: AppColors.textColor),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '\$$price/${isYearly ? 'yr' : 'mo'}',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileContainerWithImage extends StatelessWidget {
  const ProfileContainerWithImage({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ContainerWithShadow(
        height: 32,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: AppColors.lightPurple,
                  ),
                  width: 32,
                  height: 32,
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    imagePath,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
