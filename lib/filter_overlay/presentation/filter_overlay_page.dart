import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/data_fake.dart';
import 'package:marshmallow/core/presentation/widgets/switch.dart';
import 'package:marshmallow/filter_overlay/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class FilterOverlayPage extends ConsumerWidget {
  static const routeName = '/filter_overlay_page';

  const FilterOverlayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: Utils.sizeOf(230),
        leading: InkWell(
          onTap: () {
            context.router.pop();
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkPrimaryColor,
              borderRadius: BorderRadius.circular(Utils.sizeOf(30)),
            ),
            margin: EdgeInsets.symmetric(
              vertical: Utils.sizeOf(27),
              horizontal: Utils.sizeOf(40),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Symbols.navigate_before,
                  color: AppColors.white,
                  size: Utils.sizeOf(45),
                ),
                SizedBox(width: Utils.sizeOf(2)),
                Text(
                  'Filter',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: Utils.sizeOf(30),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: Utils.sizeOf(10)),
              ],
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              context.router.pop();
            },
            child: Container(
              margin: EdgeInsets.only(right: Utils.sizeOf(40)),
              // padding: EdgeInsets.all(Utils.sizeOf(10)),
              width: Utils.sizeOf(90),
              height: Utils.sizeOf(55),
              decoration: BoxDecoration(
                color: AppColors.textFieldBackground,
                border: Border.all(color: AppColors.gray3),
                borderRadius: BorderRadius.circular(Utils.sizeOf(30)),
              ),
              alignment: Alignment.center,
              child: Text(
                'CLEAR',
                style: TextStyle(
                  color: AppColors.gray3,
                  fontSize: Utils.sizeOf(20),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
        shadowColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            panelFilter1(ref),
            enableStockItem(ref),
            enableOnlyItemSale(ref),
            panelFilter2(ref),
            panelFilter3(ref),
          ],
        ),
      ),
    );
  }

  Widget panelFilter1(WidgetRef ref) {
    return AnimatedContainer(
      width: double.infinity,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 150),
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: Utils.sizeOf(40),
        right: Utils.sizeOf(40),
        top: Utils.sizeOf(40),
        bottom: Utils.sizeOf(30),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2), // Adjust the offset for top shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 4), // Adjust the offset for bottom shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(4, 0), // Adjust the offset for right shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(2, 0), // Adjust the offset for left shadow
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              ref.read(isExpanded1.notifier).update((state) => state = !state);
            },
            child: Container(
              height: Utils.sizeOf(80),
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: Utils.sizeOf(40),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Utils.sizeOf(30),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    ref.watch(isExpanded1) == true
                        ? Symbols.expand_less
                        : Symbols.expand_more,
                    color: AppColors.gray3,
                    size: Utils.sizeOf(60),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: ref.watch(isExpanded1) == true,
            child: AnimatedContainer(
              // height: 100,
              width: double.infinity,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 150),
              padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(40)),
              margin: EdgeInsets.only(
                right: Utils.sizeOf(10),
                left: Utils.sizeOf(10),
                bottom: Utils.sizeOf(20),
                top: Utils.sizeOf(10),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      ref.read(choosePrice.notifier).update((state) => 1);
                    },
                    child: Container(
                      width: Utils.sizeOf(100),
                      height: Utils.sizeOf(64),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ref.watch(choosePrice) == 1
                            ? AppColors.darkPrimaryColor
                            : AppColors.gray4,
                      ),
                      child: Text(
                        '\$',
                        style: TextStyle(
                          color: ref.watch(choosePrice) == 1
                              ? AppColors.white
                              : AppColors.gray3,
                          fontSize: Utils.sizeOf(24),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(choosePrice.notifier).update((state) => 2);
                    },
                    child: Container(
                      width: Utils.sizeOf(100),
                      height: Utils.sizeOf(64),
                      margin: EdgeInsets.only(left: Utils.sizeOf(20)),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ref.watch(choosePrice) == 2
                            ? AppColors.darkPrimaryColor
                            : AppColors.gray4,
                      ),
                      child: Text(
                        '\$\$',
                        style: TextStyle(
                          color: ref.watch(choosePrice) == 2
                              ? AppColors.white
                              : AppColors.gray3,
                          fontSize: Utils.sizeOf(24),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(choosePrice.notifier).update((state) => 3);
                    },
                    child: Container(
                      width: Utils.sizeOf(100),
                      height: Utils.sizeOf(64),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: Utils.sizeOf(20)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ref.watch(choosePrice) == 3
                            ? AppColors.darkPrimaryColor
                            : AppColors.gray4,
                      ),
                      child: Text(
                        '\$\$\$',
                        style: TextStyle(
                          color: ref.watch(choosePrice) == 3
                              ? AppColors.white
                              : AppColors.gray3,
                          fontSize: Utils.sizeOf(24),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(choosePrice.notifier).update((state) => 4);
                    },
                    child: Container(
                      width: Utils.sizeOf(100),
                      height: Utils.sizeOf(64),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: Utils.sizeOf(20)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ref.watch(choosePrice) == 4
                            ? AppColors.darkPrimaryColor
                            : AppColors.gray4,
                      ),
                      child: Text(
                        '\$\$\$\$',
                        style: TextStyle(
                          color: ref.watch(choosePrice) == 4
                              ? AppColors.white
                              : AppColors.gray3,
                          fontSize: Utils.sizeOf(24),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget enableStockItem(WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: Utils.sizeOf(40),
        right: Utils.sizeOf(40),
        bottom: Utils.sizeOf(30),
      ),
      padding: EdgeInsets.only(
        left: Utils.sizeOf(40),
        top: Utils.sizeOf(10),
        bottom: Utils.sizeOf(10),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2), // Adjust the offset for top shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 4), // Adjust the offset for bottom shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(4, 0), // Adjust the offset for right shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(2, 0), // Adjust the offset for left shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hide out of stock items",
            style: TextStyle(
              color: Colors.black,
              fontSize: Utils.sizeOf(24),
              fontWeight: FontWeight.w500,
            ),
          ),
          Transform.scale(
            scale: 0.6,
            child: FlutterSwitch(
              // width: 50.0,
              // height: 20.0,
              // valueFontSize: 20.0,
              // toggleSize: 18.0,
              activeColor: AppColors.darkPrimaryColor,
              value: ref.watch(isStockItem),
              onToggle: (val) {
                ref.read(isStockItem.notifier).update((state) => val);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget enableOnlyItemSale(WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: Utils.sizeOf(40),
        right: Utils.sizeOf(40),
        // bottom: Utils.sizeOf(40)
      ),
      padding: EdgeInsets.only(
        left: Utils.sizeOf(40),
        top: Utils.sizeOf(10),
        bottom: Utils.sizeOf(10),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2), // Adjust the offset for top shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 4), // Adjust the offset for bottom shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(4, 0), // Adjust the offset for right shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(2, 0), // Adjust the offset for left shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Only show items on sale",
            style: TextStyle(
              color: Colors.black,
              fontSize: Utils.sizeOf(24),
              fontWeight: FontWeight.w500,
            ),
          ),
          Transform.scale(
            scale: 0.6,
            child: FlutterSwitch(
              // width: 50.0,
              // height: 20.0,
              // valueFontSize: 20.0,
              // toggleSize: 18.0,
              activeColor: AppColors.darkPrimaryColor,
              value: ref.watch(isOnlyItemSale),
              onToggle: (val) {
                ref.read(isOnlyItemSale.notifier).update((state) => val);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget panelFilter2(WidgetRef ref) {
    return AnimatedContainer(
      width: double.infinity,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 150),
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: Utils.sizeOf(40),
        right: Utils.sizeOf(40),
        top: Utils.sizeOf(30),
        bottom: Utils.sizeOf(30),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2), // Adjust the offset for top shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 4), // Adjust the offset for bottom shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(4, 0), // Adjust the offset for right shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(2, 0), // Adjust the offset for left shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              ref.read(isExpanded2.notifier).update((state) => state = !state);
            },
            child: Container(
              height: Utils.sizeOf(80),
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: Utils.sizeOf(40),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Utils.sizeOf(30),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    ref.watch(isExpanded2) == true
                        ? Symbols.expand_less
                        : Symbols.expand_more,
                    color: AppColors.gray3,
                    size: Utils.sizeOf(60),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: ref.watch(isExpanded2) == true,
            child: AnimatedContainer(
              // height: 100,
              width: double.infinity,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 150),
              // padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(40)),
              margin: EdgeInsets.only(
                right: Utils.sizeOf(10),
                left: Utils.sizeOf(10),
                bottom: Utils.sizeOf(20),
                top: Utils.sizeOf(10),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: data10
                    .expand(
                      (e) => [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: Utils.sizeOf(20),
                          ),
                          child: Text(e["title"].toString()),
                        ),
                        Wrap(
                          children: (e["data"] as List<Map<String, String>>)
                              .map(
                                (item) => Container(
                                  margin: EdgeInsets.only(
                                    right: Utils.sizeOf(20),
                                    bottom: Utils.sizeOf(15),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.sizeOf(20),
                                    vertical: Utils.sizeOf(10),
                                  ),
                                  // alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.gray4,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(item["title"] ?? ''),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget panelFilter3(WidgetRef ref) {
    return AnimatedContainer(
      width: double.infinity,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 150),
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: Utils.sizeOf(40),
        right: Utils.sizeOf(40),
        bottom: Utils.sizeOf(40),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2), // Adjust the offset for top shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 4), // Adjust the offset for bottom shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(4, 0), // Adjust the offset for right shadow
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(2, 0), // Adjust the offset for left shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              ref.read(isExpanded3.notifier).update((state) => state = !state);
            },
            child: Container(
              height: Utils.sizeOf(80),
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: Utils.sizeOf(40),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brands',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Utils.sizeOf(30),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    ref.watch(isExpanded3) == true
                        ? Symbols.expand_less
                        : Symbols.expand_more,
                    color: AppColors.gray3,
                    size: Utils.sizeOf(60),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: ref.watch(isExpanded3) == true,
            child: AnimatedContainer(
              width: double.infinity,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 150),
              margin: EdgeInsets.only(
                right: Utils.sizeOf(10),
                left: Utils.sizeOf(10),
                bottom: Utils.sizeOf(20),
                top: Utils.sizeOf(10),
              ),
              padding: EdgeInsets.only(
                left: Utils.sizeOf(30),
                right: Utils.sizeOf(40),
              ),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Wrap(
                children: data10
                    .expand(
                      (e) => [
                        Container(
                          margin: EdgeInsets.only(
                            right: Utils.sizeOf(10),
                            bottom: Utils.sizeOf(15),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: Utils.sizeOf(20),
                            vertical: Utils.sizeOf(10),
                          ),
                          // alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.gray4,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(e["title"].toString()),
                        ),
                      ],
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
