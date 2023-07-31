import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemProduct extends StatelessWidget {
  final String? name;
  final String? image;
  final String? price;
  final String? value;
  final bool isSale;
  final String? salePrice;
  final Function()? onTapAdd;
  final Function()? onTapProduct;
  const ItemProduct({
    super.key,
    this.name,
    this.image,
    this.price,
    this.value,
    this.salePrice,
    this.isSale = false,
    this.onTapAdd,
    this.onTapProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Utils.sizeOf(20)),
      padding: EdgeInsets.all(Utils.sizeOf(6)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
      ),
      child: GestureDetector(
        onTap: onTapProduct,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: Utils.sizeOf(210),
                  height: Utils.sizeOf(210),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(Utils.sizeOf(20)),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image ?? '',
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Container(),
                  ),
                ),
                if (isSale == true)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: Utils.sizeOf(62),
                      height: Utils.sizeOf(28),
                      margin: EdgeInsets.only(
                        left: Utils.sizeOf(8),
                        top: Utils.sizeOf(8),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.currencyColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(Utils.sizeOf(34))),
                      ),
                      child: Center(
                        child: Text(
                          'SALE',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: Utils.sizeOf(16),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: TouchableOpacity(
                    onTap: onTapAdd,
                    activeOpacity: 0.4,
                    child: Container(
                      width: Utils.sizeOf(44),
                      height: Utils.sizeOf(44),
                      margin: EdgeInsets.all(Utils.sizeOf(4)),
                      child: Image.asset(
                        'assets/images/ic_plus1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Utils.sizeOf(210),
              child: Text(
                name ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Utils.sizeOf(20),
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            RichText(
              text: TextSpan(
                text: isSale ? '\$$price  ' : '\$$price',
                style: TextStyle(
                  color: isSale ? AppColors.currencyColor : Colors.black,
                  fontSize: Utils.sizeOf(18),
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  if (isSale == true)
                    TextSpan(
                      text: '(\$$salePrice)',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: Utils.sizeOf(18),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                ],
              ),
            ),
            Text(
              value ?? '22.2oz',
              style: TextStyle(
                color: AppColors.darkGray,
                fontSize: Utils.sizeOf(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
