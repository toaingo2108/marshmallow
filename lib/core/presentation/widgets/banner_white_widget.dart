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

Widget bannerWhiteWidget({
  required String title,
  required List<Product> products,
  required WidgetRef ref,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(left: Utils.sizeOf(40)),
    decoration: BoxDecoration(
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: AppColors.inactiveSwitchGray.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 5), // Offset for bottom shadow
        ),
        BoxShadow(
          color: AppColors.inactiveSwitchGray.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, -5), // Offset for top shadow
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              "${title[0].toUpperCase()}${title.substring(1)}",
              style: TextStyle(fontSize: Utils.sizeOf(30)),
            ),
            SizedBox(
              width: Utils.sizeOf(10),
            ),
            Padding(
              padding: EdgeInsets.only(top: Utils.sizeOf(5)),
              child: Image.asset(
                'assets/images/ic_arrow_right.png',
                width: Utils.sizeOf(20),
                height: Utils.sizeOf(20),
              ),
            )
          ],
        ),
        Container(
          height: Utils.sizeOf(300),
          margin: EdgeInsets.symmetric(
            vertical: Utils.sizeOf(16),
          ),
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
                  ref.read(myBagRepositoryProvider).setMyBag(dataMyBag);
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
