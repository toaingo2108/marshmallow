import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/data_fake.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class BrowseCategoriesPage extends ConsumerWidget {
  static const routeName = '/browse';
  const BrowseCategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {},
          child: Text(
            'Browse',
            style: TextStyle(
              color: AppColors.darkPrimaryColor,
              fontSize: Utils.sizeOf(30),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.textFieldBackground,
            padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(40)),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                textSearchWidget(context),
                Text(
                  'Browse Categories',
                  style: TextStyle(
                    fontSize: Utils.sizeOf(24),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: Utils.sizeOf(32),
                ),
                ...List.generate(
                  data1.length,
                  (index) => itemBrowseCategories(
                    name: data1[index]["title"] ?? '',
                    imageUrl: data1[index]["image"] ?? '',
                    context: context,
                  ),
                ).toList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemBrowseCategories({
    required String name,
    required String imageUrl,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        context.router.push(const SelectCategoryRoute());
      },
      child: Container(
        height: Utils.sizeOf(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(24)),
        margin: EdgeInsets.only(bottom: Utils.sizeOf(24)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: Utils.sizeOf(18)),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: Utils.sizeOf(30),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Image.asset(
              imageUrl,
              width: Utils.sizeOf(80),
              height: Utils.sizeOf(70),
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }

  Widget textSearchWidget(BuildContext context) {
    return Container(
      height: Utils.sizeOf(64),
      margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(32)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
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
              EdgeInsets.only(left: Utils.sizeOf(10), bottom: Utils.sizeOf(10)),
          hintText: 'Search on Marshmallow',
          hintStyle: TextStyle(
            color: AppColors.darkGray,
            fontSize: Utils.sizeOf(24),
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: const Icon(
            Symbols.search,
            color: AppColors.darkGray,
          ),
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
}
