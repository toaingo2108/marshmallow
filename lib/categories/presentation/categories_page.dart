import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/categories/shared/providers.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class CategoriesPage extends ConsumerWidget {
  static const routeName = '/categories';

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            context.router.push(const BrowseCategoriesRoute());
          },
          child: Text(
            'Marshmallow',
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
        leading: InkWell(
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
                Icons.close,
                color: AppColors.darkGray,
                size: Utils.sizeOf(30),
              ),
            ),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.textFieldBackground,
            padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(28)),
            child: Column(
              children: [
                tableCategories(
                  title: data1["title"].toString(),
                  titleReadMore: 'Shop ${data1["title"]}',
                  data: data1["data"] as List<Map<String, String>>,
                  context: context,
                ),
                tableCategories(
                  title: data2["title"].toString(),
                  titleReadMore: 'Shop ${data2["title"]}',
                  data: data2["data"] as List<Map<String, String>>,
                  context: context,
                ),
                tableCategories(
                  title: data3["title"].toString(),
                  titleReadMore: 'Shop ${data3["title"]}',
                  data: data3["data"] as List<Map<String, String>>,
                  context: context,
                ),
                tableCategories(
                  title: data4["title"].toString(),
                  titleReadMore: 'Shop ${data4["title"]}',
                  data: data4["data"] as List<Map<String, String>>,
                  context: context,
                ),
                tableCategories(
                  title: data5["title"].toString(),
                  titleReadMore: 'Shop ${data5["title"]}',
                  data: data5["data"] as List<Map<String, String>>,
                  context: context,
                ),
                tableCategories(
                  title: data6["title"].toString(),
                  titleReadMore: 'Shop ${data6["title"]}',
                  data: data6["data"] as List<Map<String, String>>,
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tableCategories({
    required String title,
    required String titleReadMore,
    required List<Map<String, String>> data,
    required BuildContext context,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(22)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: Utils.sizeOf(18),
              vertical: Utils.sizeOf(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: Utils.sizeOf(24),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: Utils.sizeOf(7),
                    left: Utils.sizeOf(15),
                    top: Utils.sizeOf(10),
                    bottom: Utils.sizeOf(10),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Utils.sizeOf(34)),
                    color: AppColors.gray1,
                  ),
                  child: Row(
                    children: [
                      Text(
                        titleReadMore,
                        style: TextStyle(
                          color: AppColors.darkGray,
                          fontSize: Utils.sizeOf(16),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Symbols.navigate_next,
                        color: AppColors.darkGray,
                        size: Utils.sizeOf(20),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: Utils.sizeOf(18)),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: Utils.sizeOf(18)),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: Utils.sizeOf(10),
                mainAxisExtent: Utils.sizeOf(150), // Number of columns
              ),
              itemCount: data.length, // Total number of items
              itemBuilder: (context, index) {
                // Calculate column and row values
                return Column(
                  children: [
                    Container(
                      width: Utils.sizeOf(115),
                      height: Utils.sizeOf(115),
                      margin: EdgeInsets.only(bottom: Utils.sizeOf(8)),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.gray2),
                        borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
                      ),
                    ),
                    Text(
                      data[index]["title"] ?? '',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: Utils.sizeOf(18),
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
