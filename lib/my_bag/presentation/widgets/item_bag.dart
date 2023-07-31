import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/core/presentation/widgets/page_loader.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

class ItemBag extends StatelessWidget {
  final String? name;
  final String? price;
  final String? value;
  final String? urlImage;
  final String? total;
  final Function()? onAdd;
  final Function()? onSubtract;
  final Function()? onRemove;
  final Function()? onTap;
  final bool isReward;
  const ItemBag({
    super.key,
    this.name,
    required this.isReward,
    required this.onTap,
    this.price,
    this.onSubtract,
    this.value,
    this.total,
    this.urlImage,
    this.onAdd,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: Utils.paddingHorizontal(),
              vertical: Utils.sizeOf(16),
            ),
            child: Row(
              children: [
                Container(
                  width: Utils.sizeOf(100),
                  // height: Utils.sizeOf(100),

                  decoration: BoxDecoration(
                    color: AppColors.textFieldBackground,
                    borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(
                      urlImage!,
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset('assets/images/logo.png'),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const PageLoader();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: Utils.sizeOf(80),
                    constraints: BoxConstraints(
                      maxWidth: Utils.percentageWidth(50),
                      // maxHeight: Utils.sizeOf(100)
                    ),
                    margin: EdgeInsets.symmetric(horizontal: Utils.sizeOf(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: isReward
                                ? 'Redeemed Reward ($name) '
                                : '$name ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Utils.sizeOf(20),
                              color: AppColors.black,
                            ),
                            children: [
                              TextSpan(
                                text: value,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: Utils.sizeOf(18),
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          isReward ? '\$0.00' : "\$${price ?? "0"}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: Utils.sizeOf(20),
                            color: AppColors.darkGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Utils.sizeOf(200),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      if (!isReward)
                        Container(
                          margin: EdgeInsets.only(right: Utils.sizeOf(3)),
                          decoration: BoxDecoration(
                            color: AppColors.gray5,
                            borderRadius:
                                BorderRadius.circular(Utils.sizeOf(24)),
                          ),
                          child: Row(
                            children: [
                              if (int.parse(total!) == 1)
                                TouchableOpacity(
                                  onTap: onRemove,
                                  activeOpacity: 0.4,
                                  child: Container(
                                    margin: EdgeInsets.all(Utils.sizeOf(4)),
                                    padding: EdgeInsets.all(Utils.sizeOf(5)),
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Symbols.delete,
                                      size: Utils.sizeOf(35),
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              if (int.parse(total!) > 1)
                                TouchableOpacity(
                                  onTap: onSubtract,
                                  activeOpacity: 0.4,
                                  child: Container(
                                    margin: EdgeInsets.all(Utils.sizeOf(4)),
                                    padding: EdgeInsets.all(Utils.sizeOf(5)),
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Symbols.remove,
                                      size: Utils.sizeOf(35),
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(total ?? "0"),
                                ),
                              ),
                              SizedBox(
                                width: Utils.sizeOf(64),
                                height: Utils.sizeOf(44),
                              )
                            ],
                          ),
                        ),
                      if (!isReward)
                        TouchableOpacity(
                          onTap: onAdd,
                          activeOpacity: 0.4,
                          child: Container(
                            width: Utils.sizeOf(57),
                            height: Utils.sizeOf(57),
                            margin: EdgeInsets.all(Utils.sizeOf(4)),
                            child: Image.asset(
                              'assets/images/ic_plus1.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: AppColors.gray5,
          )
        ],
      ),
    );
  }
}
