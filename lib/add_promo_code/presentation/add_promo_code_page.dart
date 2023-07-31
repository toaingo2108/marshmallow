import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/add_promo_code/shared/providers.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class AddPromoCodePage extends ConsumerWidget {
  static const routeName = '/add-promo-code';

  const AddPromoCodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidateTextField = ref.watch(isValidateText);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: TouchableOpacity(
          activeOpacity: 0.4,
          child: appbarWidget(context),
        ),
        leadingWidth: Utils.sizeOf(370),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        Container(
                          margin: EdgeInsets.only(top: Utils.sizeOf(30)),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              TextFormField(
                                // controller: _textEditingController,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    ref
                                        .read(isValidateText.notifier)
                                        .update((state) => true);
                                    // return 'Please enter some text';
                                  } else {
                                    ref
                                        .read(isValidateText.notifier)
                                        .update((state) => false);
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: Utils.sizeOf(16),
                                    bottom: Utils.sizeOf(14),
                                    right: Utils.sizeOf(26),
                                  ),
                                  hintText: 'promo code',
                                  hintStyle: TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: Utils.sizeOf(30),
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  prefixIcon: const Icon(Symbols.sell),
                                  filled: true,
                                  fillColor:
                                      AppColors.darkGray.withOpacity(0.1),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Utils.sizeOf(24)),
                                    borderSide: const BorderSide(
                                      color: AppColors.textFieldBackground,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Utils.sizeOf(24)),
                                    borderSide: const BorderSide(
                                      color: AppColors.textFieldBackground,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: isValidateTextField != null,
                                child: isValidateTextField == true
                                    ? Container(
                                        width: Utils.sizeOf(40),
                                        height: Utils.sizeOf(40),
                                        margin: EdgeInsets.only(
                                          right: Utils.sizeOf(16),
                                        ),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.errorRed,
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.close,
                                          color: AppColors.white,
                                          size: Utils.sizeOf(25),
                                        ),
                                      )
                                    : Container(
                                        width: Utils.sizeOf(40),
                                        height: Utils.sizeOf(40),
                                        margin: EdgeInsets.only(
                                          right: Utils.sizeOf(16),
                                        ),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.currencyColor,
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.check,
                                          color: AppColors.white,
                                          size: Utils.sizeOf(25),
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                        if (isValidateTextField == true)
                          Container(
                            margin: EdgeInsets.only(
                              left: Utils.sizeOf(24),
                              right: Utils.paddingHorizontal(),
                              top: Utils.sizeOf(24),
                            ),
                            child: Text(
                              'Please enter a valid promo code.',
                              style: TextStyle(
                                fontSize: Utils.sizeOf(22),
                                fontWeight: FontWeight.w400,
                                color: AppColors.errorRed,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: TouchableOpacity(
                  onTap: () {},
                  activeOpacity: 0.4,
                  child: Container(
                    height: Utils.sizeOf(110),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.paddingHorizontal(),
                    ),
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
                    child: Container(
                      height: Utils.sizeOf(72),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(18)),
                      decoration: BoxDecoration(
                        color: AppColors.darkPrimaryColor
                            .withOpacity(isValidateTextField == true ? 0.4 : 1),
                        borderRadius: BorderRadius.circular(Utils.sizeOf(30)),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Apply to Order',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: Utils.sizeOf(28),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appbarWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.pop();
      },
      child: Container(
        height: Utils.sizeOf(45),
        width: Utils.percentageWidth(45),
        margin: EdgeInsets.only(
          left: Utils.paddingHorizontal(),
          bottom: Utils.sizeOf(30),
          top: Utils.sizeOf(30),
        ),
        padding: EdgeInsets.only(right: Utils.sizeOf(10)),
        decoration: const BoxDecoration(
          color: AppColors.darkPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(48)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Symbols.navigate_before,
              color: AppColors.white,
            ),
            Text(
              'Add Promo Code',
              style: TextStyle(
                fontSize: Utils.sizeOf(30),
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget titleBag({
    required String title,
    required String urlImage,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: Utils.sizeOf(64),
        margin: EdgeInsets.only(
          left: Utils.paddingHorizontal(),
          right: Utils.paddingHorizontal(),
          bottom: Utils.sizeOf(24),
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: Utils.sizeOf(64),
              padding: EdgeInsets.only(
                left: Utils.sizeOf(25),
                right: Utils.sizeOf(20),
                top: Utils.sizeOf(20),
                bottom: Utils.sizeOf(20),
              ),
              decoration: const BoxDecoration(
                color: AppColors.textFieldBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
              ),
              child: Image.asset(urlImage),
            ),
            Container(
              padding: EdgeInsets.only(left: Utils.sizeOf(30)),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: Utils.sizeOf(24),
                ),
              ),
            ),
            const Spacer(),
            const Icon(
              Symbols.navigate_next,
              color: AppColors.gray,
            )
          ],
        ),
      ),
    );
  }

  Widget bannerAds() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Utils.paddingHorizontal(),
        vertical: Utils.sizeOf(20),
      ),
      width: double.infinity,
      height: Utils.percentageWidth(35),
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      alignment: Alignment.center,
      child: const Text("Ads space"),
    );
  }

  Widget bannerOrderSubtotal(double price) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
      padding: EdgeInsets.symmetric(
        horizontal: Utils.sizeOf(24),
        vertical: Utils.sizeOf(16),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(Utils.sizeOf(24))),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Order Subtotal",
            style: TextStyle(
              fontSize: Utils.sizeOf(24),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "\$$price",
            style: TextStyle(
              fontSize: Utils.sizeOf(24),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
