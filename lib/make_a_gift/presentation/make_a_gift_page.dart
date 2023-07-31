import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/make_a_gift/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class MakeAGiftPage extends ConsumerWidget {
  static const routeName = '/make-a-gift';

  const MakeAGiftPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnable = ref.watch(isEnableSave);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: TouchableOpacity(
          activeOpacity: 0.4,
          child: appbarWidget(context),
        ),
        leadingWidth: Utils.sizeOf(180),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColors.textFieldBackground,
                        padding: EdgeInsets.symmetric(
                          vertical: Utils.sizeOf(20),
                          horizontal: Utils.sizeOf(40),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: Utils.sizeOf(70),
                              child: Image.asset(
                                'assets/images/ic_candy_filter_smile.png',
                              ),
                            ),
                            Text(
                              'Make their day!',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: Utils.sizeOf(30),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.paddingHorizontal(),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...uiTextUnImportant(),
                            fullNameWidget(),
                            SizedBox(
                              height: Utils.sizeOf(40),
                            ),
                            phoneNumberWidget(),
                            SizedBox(
                              height: Utils.sizeOf(40),
                            ),
                            emailWidget(),
                            SizedBox(
                              height: Utils.sizeOf(56),
                            ),
                            locationAddressWidget(),
                            SizedBox(
                              height: Utils.sizeOf(48),
                            ),
                            ...giftMessageWidget(ref),
                            SizedBox(
                              height: Utils.sizeOf(48),
                            ),
                            nameProfileWidget(ref),
                            SizedBox(
                              height: Utils.sizeOf(24),
                            ),
                            Center(
                              child: TouchableOpacity(
                                activeOpacity: 0.4,
                                child: Text(
                                  'Nevermind, go back to my order.',
                                  style: TextStyle(
                                    fontSize: Utils.sizeOf(20),
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    color: AppColors.darkGray,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Utils.sizeOf(30),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                            .withOpacity(isEnable == true ? 0.4 : 1),
                        borderRadius: BorderRadius.circular(Utils.sizeOf(30)),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Save',
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
              'Gift',
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

  List<Widget> uiTextUnImportant() {
    return [
      SizedBox(
        height: Utils.sizeOf(16),
      ),
      Text(
        "We use this information to send you updates about your order.",
        style: TextStyle(
          fontSize: Utils.sizeOf(20),
          fontWeight: FontWeight.w300,
          color: AppColors.secondaryTextColor,
        ),
      ),
      SizedBox(
        height: Utils.sizeOf(16),
      ),
      Text(
        "* Required",
        style: TextStyle(
          fontSize: Utils.sizeOf(20),
          fontWeight: FontWeight.w300,
          color: AppColors.secondaryTextColor,
        ),
      ),
      SizedBox(
        height: Utils.sizeOf(40),
      )
    ];
  }

  Widget fullNameWidget() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1.5, 1.5),
            blurRadius: 4,
            color: AppColors.black.withOpacity(0.15),
          )
        ],
      ),
      child: TextFormField(
        // controller: _textEditingController,
        onChanged: (value) {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: Utils.sizeOf(28),
            bottom: Utils.sizeOf(14),
            right: Utils.sizeOf(26),
          ),
          hintText: 'Full name*',
          hintStyle: TextStyle(
            color: AppColors.darkGray,
            fontSize: Utils.sizeOf(30),
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: AppColors.textFieldBackground,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
            borderSide: const BorderSide(
              color: AppColors.textFieldBackground,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
            borderSide: const BorderSide(
              color: AppColors.textFieldBackground,
            ),
          ),
        ),
      ),
    );
  }

  Widget phoneNumberWidget() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1.5, 1.5),
            blurRadius: 4,
            color: AppColors.black.withOpacity(0.15),
          )
        ],
      ),
      child: TextFormField(
        // controller: _textEditingController,
        onChanged: (value) {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: Utils.sizeOf(28),
            bottom: Utils.sizeOf(14),
            right: Utils.sizeOf(26),
          ),
          hintText: 'Mobile Number*',
          hintStyle: TextStyle(
            color: AppColors.darkGray,
            fontSize: Utils.sizeOf(30),
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Container(
            width: Utils.sizeOf(80),
            margin: EdgeInsets.only(left: Utils.sizeOf(32)),
            child: const Row(
              children: [Text('+1'), Icon(Symbols.expand_more)],
            ),
          ),
          filled: true,
          fillColor: AppColors.textFieldBackground,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
            borderSide: const BorderSide(
              color: AppColors.textFieldBackground,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
            borderSide: const BorderSide(
              color: AppColors.textFieldBackground,
            ),
          ),
        ),
      ),
    );
  }

  Widget emailWidget() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1.5, 1.5),
            blurRadius: 4,
            color: AppColors.black.withOpacity(0.15),
          )
        ],
      ),
      child: TextFormField(
        // controller: _textEditingController,
        onChanged: (value) {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: Utils.sizeOf(28),
            bottom: Utils.sizeOf(14),
            right: Utils.sizeOf(26),
          ),
          hintText: 'Email',
          hintStyle: TextStyle(
            color: AppColors.darkGray,
            fontSize: Utils.sizeOf(30),
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: AppColors.textFieldBackground,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
            borderSide: const BorderSide(
              color: AppColors.textFieldBackground,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
            borderSide: const BorderSide(
              color: AppColors.textFieldBackground,
            ),
          ),
        ),
      ),
    );
  }

  Widget locationAddressWidget() {
    return Container(
      height: Utils.sizeOf(80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1.5, 1.5),
            blurRadius: 4,
            color: AppColors.black.withOpacity(0.15),
          )
        ],
        color: AppColors.white,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(Utils.sizeOf(20)),
            child: const Icon(
              Symbols.pin_drop,
              color: AppColors.black,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Where is this gift going?',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: Utils.sizeOf(24),
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '1234 marshmallow St, Mw, Marshmallowxxxxxxxx...',
                  style: TextStyle(
                    color: AppColors.darkGray,
                    fontSize: Utils.sizeOf(20),
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(Utils.sizeOf(10)),
            child: const Icon(
              Symbols.navigate_next,
              color: AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> giftMessageWidget(WidgetRef ref) {
    return [
      Text(
        "What about a special Message?",
        style: TextStyle(
          fontSize: Utils.sizeOf(24),
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      SizedBox(
        height: Utils.sizeOf(16),
      ),
      DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1.5, 1.5),
              blurRadius: 4,
              color: AppColors.black.withOpacity(0.15),
            )
          ],
        ),
        child: TextFormField(
          // controller: _textEditingController,
          onChanged: (value) {
            ref.read(numLengthText.notifier).update((state) => value.length);
          },
          maxLines: 6,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: Utils.sizeOf(28),
              bottom: Utils.sizeOf(14),
              right: Utils.sizeOf(26),
            ),
            hintText: 'Gift Message',
            hintStyle: TextStyle(
              color: AppColors.darkGray,
              fontSize: Utils.sizeOf(30),
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: AppColors.textFieldBackground,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
              borderSide: const BorderSide(
                color: AppColors.textFieldBackground,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
              borderSide: const BorderSide(
                color: AppColors.textFieldBackground,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: Utils.sizeOf(8),
      ),
      Text(
        '${ref.watch(numLengthText)}/120 characters',
        style: TextStyle(
          color: AppColors.secondaryTextColor,
          fontSize: Utils.sizeOf(20),
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w300,
        ),
      ),
    ];
  }

  Widget nameProfileWidget(WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Utils.sizeOf(10),
        horizontal: Utils.sizeOf(28),
      ),
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
        borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1.5, 1.5),
            blurRadius: 4,
            color: AppColors.black.withOpacity(0.15),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From',
            style: TextStyle(
              color: AppColors.darkGray,
              fontSize: Utils.sizeOf(16),
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            ref.read(userInfoProvider)?.fullName ?? '',
            style: TextStyle(
              fontSize: Utils.sizeOf(20),
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
