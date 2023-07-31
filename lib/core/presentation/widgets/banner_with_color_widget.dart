import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/home/presentation/widgets/item_product.dart';
import 'package:marshmallow/home/shared/providers.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

Widget bannerWithColorWidget({
  required int numItem,
  required Color colorTable,
  required Color colorTxtTitle1,
  required Color colorBannerNumItem,
  required String title1,
  required String title2,
  required List<Product> products,
  required WidgetRef ref,
}) {
  return Container(
    width: double.infinity,
    color: colorTable,
    padding: EdgeInsets.symmetric(
      horizontal: Utils.sizeOf(40),
      vertical: Utils.sizeOf(20),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: TextStyle(
                    color: colorTxtTitle1,
                    fontSize: Utils.sizeOf(30),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  title2,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: Utils.sizeOf(20),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                right: Utils.sizeOf(2),
                left: Utils.sizeOf(10),
                top: Utils.sizeOf(6),
                bottom: Utils.sizeOf(6),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Utils.sizeOf(34)),
                color: colorBannerNumItem,
              ),
              child: Row(
                children: [
                  Text(
                    '$numItem+ items',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: Utils.sizeOf(16),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Symbols.navigate_next,
                    color: AppColors.white,
                    size: Utils.sizeOf(20),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          height: Utils.sizeOf(300),
          margin: EdgeInsets.symmetric(vertical: Utils.sizeOf(20)),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ItemProduct(
                image: products[index].images.first as String?,
                name: products[index].name,
                price: products[index].price.toString(),
                value: products[index].unit,
                isSale: products[index].salePrice != null,
                salePrice: products[index].salePrice.toString(),
                onTapAdd: () {
                  final dataMyBag = ref.read(itemsDataMyBag.notifier).state;
                  if (dataMyBag
                      .where(
                        (item) => item.productID == products[index].productID,
                      )
                      .isEmpty) {
                    dataMyBag.add(products[index].copyWith(quantity: 1));
                    ref
                        .read(itemsDataMyBag.notifier)
                        .update((state) => dataMyBag.toList());
                  }
                },
                onTapProduct: () {
                  final dataMyBag = ref.read(itemsDataMyBag.notifier).state;
                  if (dataMyBag.isNotEmpty) {
                    for (final element in dataMyBag) {
                      if (element.productID == products[index].productID) {
                        ref
                            .read(itemProduct.notifier)
                            .update((state) => element);
                        break;
                      } else {
                        ref
                            .read(itemProduct.notifier)
                            .update((state) => products[index]);
                      }
                    }
                  } else {
                    ref
                        .read(itemProduct.notifier)
                        .update((state) => products[index]);
                  }
                  context.router.push(const ProductRoute());
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}
