import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/data_fake.dart';
import 'package:marshmallow/core/models/category.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/core/presentation/widgets/page_loader.dart';
import 'package:marshmallow/home/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/functions.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

class AddressHeader extends ConsumerWidget {
  const AddressHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: AppColors.lightPink.withOpacity(.8),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + Utils.sizeOf(20),
        right: Utils.sizeOf(40),
        left: Utils.sizeOf(40),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  timeDeliveryBikeWidget(),
                  const Spacer(),
                  notificationIconWidget(context),
                ],
              ),
              Center(
                child: addressWidget(ref, context),
              ),
            ],
          ),
          textSearchWidget(context),
          typeOfFoodWidget(context, ref),
        ],
      ),
    );
  }

  Widget timeDeliveryBikeWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.08),
        borderRadius: BorderRadius.circular(Utils.sizeOf(18)),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          Image.asset(
            'assets/images/delivery-bike1.png',
            width: Utils.sizeOf(34),
            height: Utils.sizeOf(34),
          ),
          Text(
            '15-30 MINS',
            style: TextStyle(
              color: AppColors.black,
              fontSize: Utils.sizeOf(18),
            ),
          )
        ],
      ),
    );
  }

  Widget addressWidget(WidgetRef ref, BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          openUsersAddresses(context, ref);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              ref.watch(addressProvider)?.addressLine1 == ''
                  ? ref.watch(addressProvider)?.addressLine2 ?? ''
                  : ref.watch(addressProvider)?.addressLine1 ??
                      'Select Address',
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.primaryColor,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  Widget notificationIconWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(const NotificationRoute());
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const Icon(
            Symbols.notifications,
            color: Colors.black,
          ),
          Container(
            width: Utils.sizeOf(20),
            height: Utils.sizeOf(20),
            decoration: BoxDecoration(
              color: AppColors.darkPrimaryColor,
              borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
              border: Border.all(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget textSearchWidget(BuildContext context) {
    return Container(
      height: Utils.sizeOf(84),
      margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(32)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        // controller: _searchController,
        // onChanged: _onSearchTextChanged,
        onTap: () {
          FocusScope.of(context).unfocus();
          context.router.push(const SearchRoute());
        },
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: Utils.sizeOf(16), bottom: Utils.sizeOf(14)),
          hintText: 'Search on Marshmallow',
          hintStyle: TextStyle(
            color: AppColors.darkGray,
            fontSize: Utils.sizeOf(30),
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget typeOfFoodWidget(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);
    return SizedBox(
      height: Utils.sizeOf(184),
      width: double.infinity,
      child: homeState.maybeMap(
        orElse: () {
          return Container();
        },
        loading: (_) => const PageLoader(),
        firebaseFailure: (_) => Text(_.failure.error.toString()),
        success: (_) {
          final firstList = _.categories.sublist(0, _.categories.length ~/ 2 + 1);
          final secondList =
              _.categories.sublist(_.categories.length ~/ 2 + 1, _.categories.length);
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            // physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: Utils.sizeOf(80),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: firstList.length,
                    itemBuilder: (context, index) {
                      return itemFoodWidget(firstList[index], context);
                    },
                  ),
                ),
                SizedBox(
                  height: Utils.sizeOf(80),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: secondList.length,
                    itemBuilder: (context, index) {
                      return itemFoodWidget(secondList[index], context);
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget itemFoodWidget(Category item, BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        context.router.push(const SelectCategoryRoute());
      },
      child: Container(
        height: Utils.sizeOf(64),
        margin:
            EdgeInsets.only(bottom: Utils.sizeOf(16), right: Utils.sizeOf(20)),
        padding: EdgeInsets.only(right: Utils.sizeOf(12)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Utils.sizeOf(40)),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkPrimaryColor.withOpacity(0.25),
              blurRadius: 2,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: Utils.sizeOf(10)),
              child: Image.network(
                item.icon!,
                width: Utils.sizeOf(45),
                height: Utils.sizeOf(45),
              ),
            ),
            Text(item.name!),
          ],
        ),
      ),
    );
  }
}
