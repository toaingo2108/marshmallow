import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/data_fake.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/presentation/widgets/banner_white_widget.dart';
import 'package:marshmallow/core/presentation/widgets/banner_with_color_widget.dart';
import 'package:marshmallow/home/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';

class HomeBody extends ConsumerWidget {
  HomeBody({super.key});

  final _listWidget = <Widget>[];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    homeState.maybeMap(
        orElse: () {  },
        loading: (_) =>{},
        idle: (_) => {},
        firebaseFailure: (message) =>  {
          print(message)
        } ,
        loadProductByCategory: (state) {
          if (state.data.values.isNotEmpty) {
            const indexAdd = 3;
            state.data.forEach((key, value) {
              _listWidget.insert(indexAdd,SizedBox(height: Utils.sizeOf(32),));
              _listWidget.insert(indexAdd, bannerWhiteWidget(title: key, ref: ref, products: value));
            });
          }
        },);

    if(_listWidget.isEmpty) {
      _addWidgetToListProductCategory(context, ref);
    }

    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: _listWidget,
      ),
    );
  }

  void _addWidgetToListProductCategory(BuildContext context, WidgetRef ref) {
    _listWidget.add(carouselAdsSpace(),);
    _listWidget.add(categoryWidget());
    _listWidget.add(bannerWhiteWidget(
    title: 'Recommend for you',
    ref: ref,
    products: data2,
    ),);
    _listWidget.add(SizedBox(
    height: Utils.sizeOf(32),
    ),);
    _listWidget.add( bannerWithColorWidget(
      numItem: 7,
      colorTable: AppColors.green1,
      colorTxtTitle1: AppColors.currencyColor,
      colorBannerNumItem: AppColors.currencyColor,
      title1: 'ON SALE',
      title2: '25% off -text of promotion-',
      products: data2,
      ref: ref,
    ),);
    _listWidget.add( SizedBox(
      height: Utils.sizeOf(32),
    ),);
    _listWidget.add(bannerWhiteWidget(
      title: 'New on marshmallow',
      ref: ref,
      products: data2,
    ),);
    _listWidget.add( SizedBox(
      height: Utils.sizeOf(32),
    ),);
    _listWidget.add(bannerWithColorWidget(
      numItem: 8,
      colorTable: AppColors.pink1,
      colorTxtTitle1: AppColors.darkPrimaryColor,
      colorBannerNumItem: AppColors.darkPrimaryColor,
      title1: 'Candy News',
      title2: 'Get ready to flip for new flavors ',
      products: data3,
      ref: ref,
    ),);
    _listWidget.add(SizedBox(
      height: Utils.sizeOf(32),
    ),);
    _listWidget.add(bannerWithColorWidget(
      numItem: 8,
      colorTable: AppColors.yellow1,
      colorTxtTitle1: AppColors.violet1,
      colorBannerNumItem: AppColors.violet1,
      title1: 'Candy News',
      title2: 'Get ready to flip for new flavors ',
      products: data3,
      ref: ref,
    ),);

  }

  Widget carouselAdsSpace() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(20)),
      width: double.infinity,
      height: Utils.sizeOf(308),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: Utils.percentageWidth(70),
            margin: EdgeInsets.only(right: Utils.sizeOf(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
              color: AppColors.lightPink,
            ),
            child: const Center(
              child: Text('Ads space'),
            ),
          );
        },
      ),
    );
  }

  Widget categoryWidget() {
    return Container(
      padding: EdgeInsets.only(left: Utils.sizeOf(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Utils.sizeOf(12),
          ),
          Text(
            'Explore -Category-',
            style: TextStyle(
              fontSize: Utils.sizeOf(30),
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w500,
            ),
          ),
          // SizedBox(height: 12,),
          Container(
            margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(20)),
            width: double.infinity,
            height: Utils.percentageWidth(30),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: Utils.percentageWidth(20),
                      height: Utils.percentageWidth(20),
                      margin: EdgeInsets.only(right: Utils.sizeOf(20)),
                      decoration: const BoxDecoration(
                        color: AppColors.lightPink,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: Utils.sizeOf(20),
                    ),
                    Text(
                      'SubCategory$index',
                      style: TextStyle(
                        fontSize: Utils.sizeOf(20),
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
