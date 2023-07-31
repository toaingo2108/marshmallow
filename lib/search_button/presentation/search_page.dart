import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/search_button/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class SearchPage extends ConsumerWidget {
  static const routeName = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: textSearchWidget(ref),
        automaticallyImplyLeading: false,
        actions: [
          TouchableOpacity(
            onTap: () {
              context.router.pop();
            },
            child: Container(
              height: Utils.sizeOf(64),
              width: Utils.sizeOf(124),
              margin: EdgeInsets.only(right: Utils.sizeOf(40)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gray.withOpacity(0.6),
                    offset: const Offset(1.5, 1.5),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.darkGray,
                  fontSize: Utils.sizeOf(22),
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
        shadowColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(10)),
              child: Text(
                'Popular Searches'.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Utils.sizeOf(22),
                  color: AppColors.darkPrimaryColor,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: data1.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: Utils.sizeOf(58),
                    margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Utils.sizeOf(15),
                        ),
                        Icon(
                          Symbols.search,
                          color: AppColors.darkGray,
                          size: Utils.sizeOf(34),
                        ),
                        SizedBox(
                          width: Utils.sizeOf(20),
                        ),
                        Text(
                          data1[index],
                          style: TextStyle(
                            color: AppColors.darkGray,
                            fontSize: Utils.sizeOf(28),
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textSearchWidget(WidgetRef ref) {
    final focus = ref.watch(focusTextSearch);
    final color = focus
        ? AppColors.darkPrimaryColor
        : AppColors.darkGray; // Change color based on focus
    return Container(
      height: Utils.sizeOf(64),
      margin: EdgeInsets.only(
        top: Utils.sizeOf(32),
        bottom: Utils.sizeOf(32),
        left: Utils.sizeOf(10),
      ),
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
        cursorHeight: Utils.sizeOf(35),
        onTap: () {
          ref.read(focusTextSearch.notifier).update(
                (state) => true,
              );
        },
        onFieldSubmitted: (value) {
          ref.read(focusTextSearch.notifier).update(
                (state) => false,
              );
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: Utils.sizeOf(10),
            bottom: Utils.sizeOf(10),
            top: Utils.sizeOf(10),
          ),
          hintText: 'Search on Marshmallow',
          hintStyle: TextStyle(
            color: AppColors.darkGray,
            fontSize: Utils.sizeOf(24),
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: Icon(Symbols.search, color: color),
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
              color: AppColors.darkPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
