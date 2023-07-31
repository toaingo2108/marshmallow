import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/data_fake.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/banner_white_widget.dart';
import 'package:marshmallow/core/presentation/widgets/banner_with_color_widget.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/select_category/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class SelectCategoryPage extends ConsumerWidget {
  static const routeName = '/select_category_page';
  const SelectCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: TouchableOpacity(
            onTap: () {
              context.router.push(const CategoriesRoute());
            },
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  width: Utils.percentageWidth(50),
                  padding: EdgeInsets.symmetric(vertical: Utils.sizeOf(15)),
                  decoration: BoxDecoration(
                    color: AppColors.darkPrimaryColor,
                    borderRadius: BorderRadius.circular(Utils.sizeOf(52)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Food & Drinks',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: Utils.sizeOf(24),
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: Utils.sizeOf(20)),
                  child: Icon(
                    Symbols.unfold_more,
                    color: AppColors.white,
                    size: Utils.sizeOf(40),
                  ),
                )
              ],
            ),
          ),
          leading: TouchableOpacity(
            onTap: () {
              context.router.pop();
            },
            child: Container(
              margin: EdgeInsets.only(left: Utils.sizeOf(50)),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray.withOpacity(0.6),
                      offset: const Offset(1.5, 1.5),
                      blurRadius: 5.0,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Symbols.navigate_before,
                  color: AppColors.darkGray,
                  size: Utils.sizeOf(50),
                ),
              ),
            ),
          ),
          actions: [
            TouchableOpacity(
              onTap: () {
                context.router.push(const SearchRoute());
              },
              child: Container(
                margin: EdgeInsets.only(right: Utils.sizeOf(40)),
                width: Utils.sizeOf(55),
                height: Utils.sizeOf(55),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBackground,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gray.withOpacity(0.6),
                        offset: const Offset(1.5, 1.5),
                        blurRadius: 5.0,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Symbols.search,
                    color: AppColors.darkGray,
                    size: Utils.sizeOf(40),
                  ),
                ),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: AppColors.darkPrimaryColor,
            labelColor: AppColors.darkPrimaryColor,
            labelStyle: TextStyle(
              fontSize: Utils.sizeOf(24),
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w500,
            ),
            isScrollable: true,
            tabs: tabs,
          ),
          shadowColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              itemTabChildWidget(),
              adsContainer(),
              answerFilter(context),
              SizedBox(
                height: Utils.sizeOf(40),
              ),
              bannerWhiteWidget(title: 'Ice Cream', products: data2, ref: ref),
              SizedBox(
                height: Utils.sizeOf(32),
              ),
              bannerWithColorWidget(
                numItem: 7,
                colorTable: AppColors.yellow1,
                colorTxtTitle1: AppColors.violet1,
                colorBannerNumItem: AppColors.violet1,
                title1: 'MAKE IT A SUNDAE',
                title2: 'Add snacks to your ice cream',
                products: data2,
                ref: ref,
              ),
              SizedBox(
                height: Utils.sizeOf(32),
              ),
              bannerWhiteWidget(
                title: 'New on marshmallow',
                ref: ref,
                products: data2,
              ),
              SizedBox(
                height: Utils.sizeOf(32),
              ),
              bannerWhiteWidget(title: 'Snacks', ref: ref, products: data3),
              SizedBox(
                height: Utils.sizeOf(32),
              ),
              bannerWhiteWidget(title: 'Drinks', ref: ref, products: data3),
              SizedBox(
                height: Utils.sizeOf(32),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemTabChildWidget() {
    return Container(
      width: Utils.percentageWidth(100),
      height: Utils.sizeOf(100),
      color: AppColors.pink2,
      padding: EdgeInsets.only(
        top: Utils.sizeOf(18),
        bottom: Utils.sizeOf(18),
        left: Utils.paddingHorizontal(),
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: Utils.sizeOf(10),
            ),
            padding: EdgeInsets.symmetric(
              vertical: Utils.sizeOf(10),
              horizontal: Utils.sizeOf(20),
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(Utils.sizeOf(52)),
            ),
            child: Text(
              data1[index]["title"] ?? '',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Utils.sizeOf(22),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
        itemCount: data1.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget adsContainer() {
    return Container(
      height: Utils.percentageWidth(40),
      margin: EdgeInsets.symmetric(
        horizontal: Utils.paddingHorizontal(),
        vertical: Utils.sizeOf(24),
      ),
      width: Utils.percentageWidth(90),
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
        borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
      ),
      alignment: Alignment.center,
      child: const Text('Ads space'),
    );
  }

  Widget answerFilter(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
        borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
      ),
      child: Row(
        children: [
          SizedBox(
            height: Utils.sizeOf(70),
            child: Image.asset(
              'assets/images/ic_candy_filter_smile.png',
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: Utils.sizeOf(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '298 results',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Utils.sizeOf(22),
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  Text(
                    'Would you like to add a filter?',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: Utils.sizeOf(24),
                      color: AppColors.secondaryTextColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.router.push(const FilterOverlayRoute());
            },
            child: SizedBox(
              height: Utils.sizeOf(70),
              child: Image.asset(
                'assets/images/ic_filter_setting.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
