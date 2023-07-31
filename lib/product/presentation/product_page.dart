import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/data_fake.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/home/shared/providers.dart';
import 'package:marshmallow/my_bag/shared/providers.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class ProductPage extends ConsumerStatefulWidget {
  static const routeName = '/product';

  const ProductPage({super.key});

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  bool isMoreDescription = false;
  bool isMoreIngredients = false;

  void handleLogicDelete(WidgetRef ref) {
    final result = ref.watch(itemsDataMyBag.notifier).state;
    int index = 0;
    for (int i = 0; i < result.length; i++) {
      if (result[i].productID == ref.watch(itemProduct)?.productID) {
        index = i;
      }
    }
    result.removeAt(index);
    ref.read(itemsDataMyBag.notifier).update((state) => result.toList());
    setState(() {});
  }

  void handleLogicAddOrRemove(WidgetRef ref, {required bool isAdd}) {
    final currentProduct = ref.read(itemProduct);
    int num = currentProduct?.quantity ?? 0;
    isAdd
        ? num++
        : num > 0
            ? num--
            : num = 0;

    ref
        .read(itemProduct.notifier)
        .update((state) => state?.copyWith(quantity: num));
    final index = ref.read(itemsDataMyBag).indexWhere(
          (element) =>
              element.productID == currentProduct?.productID &&
              !element.isReward,
        );
    final result = ref.read(itemsDataMyBag.notifier).state;
    result[index] = result[index].copyWith(quantity: num);

    ref.read(itemsDataMyBag.notifier).update((state) => result.toList());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.read(itemProduct)!;
    final controller = PageController();
    final pages = List.generate(
      product.images.length,
      (index) => Image.network(
        product.images[index] as String,
        errorBuilder: (context, error, stackTrace) =>
            Image.asset('assets/images/logo.png'),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const PageLoader();
        },
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            appbarWidget(context, ref),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColors.textFieldBackground,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 377,
                            child: PageView.builder(
                              controller: controller,
                              itemCount: pages.length,
                              itemBuilder: (_, index) {
                                return pages[index];
                              },
                            ),
                          ),
                          SizedBox(
                            height: Utils.sizeOf(60),
                          ),
                          Center(
                            child: SmoothPageIndicator(
                              controller: controller,
                              count: pages.length,
                              effect: const WormEffect(
                                dotHeight: 9,
                                dotWidth: 9,
                                activeDotColor: Colors.black,
                                type: WormType.thinUnderground,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Utils.sizeOf(30),
                          ),
                          itemTagWidget(product),
                          SizedBox(
                            height: Utils.sizeOf(12),
                          ),
                          productPriceWidget(ref),
                          SizedBox(
                            height: Utils.sizeOf(30),
                          ),
                          descriptionWidget(ref),
                          SizedBox(
                            height: Utils.sizeOf(30),
                          ),
                          ingredientsWidget(ref),
                          SizedBox(
                            height: Utils.sizeOf(32),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Utils.sizeOf(32),
                    ),
                    bannerWhiteWidget(
                      title: "Similar Products",
                      ref: ref,
                      products: data3,
                    ),
                    SizedBox(
                      height: Utils.sizeOf(32),
                    ),
                    bannerWhiteWidget(
                      title: 'Customers also viewed',
                      ref: ref,
                      products: data3,
                    ),
                    SizedBox(
                      height: Utils.sizeOf(32),
                    ),
                    bannerWhiteWidget(
                      title: 'You might also like',
                      ref: ref,
                      products: data3,
                    ),
                    SizedBox(
                      height: Utils.sizeOf(32),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Product information or packing displayed may not be current or complete. Always refer to the physical product for the most accurate information and warnings.',
                        style: TextStyle(
                          color: AppColors.grayTextColor,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Utils.sizeOf(50),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: ref.watch(itemProduct)?.quantity != null &&
                      ref.watch(itemProduct)?.quantity != 0
                  ? myBag(context, ref: ref)
                  : checkOut(context, ref: ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget appbarWidget(BuildContext context, WidgetRef ref) {
    return Container(
      height: Utils.sizeOf(100),
      margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TouchableOpacity(
            onTap: () {
              context.router.pop();
            },
            activeOpacity: 0.4,
            child: SizedBox(
              height: Utils.sizeOf(64),
              width: Utils.sizeOf(64),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white,
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
                  size: Utils.sizeOf(40),
                ),
              ),
            ),
          ),
          TouchableOpacity(
            onTap: () {
              Share.share(
                'url',
                // ref.watch(itemProduct)['url'].toString(),
                subject: 'Marshmallow',
              );
            },
            activeOpacity: 0.4,
            child: SizedBox(
              height: Utils.sizeOf(64),
              width: Utils.sizeOf(64),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray.withOpacity(0.6),
                      offset: const Offset(1.5, 1.5),
                      blurRadius: 5.0,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/ic_share.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemTagWidget(Product product) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 20),
        if (product.rewardedPoints != null)
          ProductTagContainer(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/ic_shine.png',
                    ),
                    SizedBox(
                      width: Utils.sizeOf(4),
                    )
                  ],
                ),
                Text(
                  '${product.rewardedPoints} pts',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: Utils.sizeOf(22),
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        if (product.salePrice != null)
          ProductTagContainer(
            child: Text(
              'Sale',
              style: TextStyle(
                color: AppColors.white,
                fontSize: Utils.sizeOf(22),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        if (product.dietary != null)
          ProductTagContainer(
            child: Text(
              product.dietary!,
              style: TextStyle(
                color: AppColors.white,
                fontSize: Utils.sizeOf(22),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }

  Widget productPriceWidget(WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ref.watch(itemProduct)?.name ?? '',
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 20,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: Utils.sizeOf(12),
          ),
          RichText(
            text: TextSpan(
              text: ref.watch(itemProduct)?.salePrice == null
                  ? "\$${ref.watch(itemProduct)?.price}"
                  : "\$${ref.watch(itemProduct)?.salePrice}",
              style: const TextStyle(
                color: AppColors.currencyColor,
                fontFamily: 'Lexend',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              children: [
                if (ref.watch(itemProduct)?.salePrice != null)
                  TextSpan(
                    text: " \$${ref.watch(itemProduct)?.price}",
                    style: const TextStyle(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lexend',
                      fontSize: 15,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                if (ref.watch(itemProduct)?.salePrice != null)
                  TextSpan(
                    text:
                        ' Save \$${(ref.watch(itemProduct)!.price - ref.watch(itemProduct)!.salePrice!).toStringAsFixed(2)} (${(((ref.watch(itemProduct)!.price - ref.watch(itemProduct)!.salePrice!) / ref.watch(itemProduct)!.price) * 100).toStringAsFixed(0)}%) ',
                    style: const TextStyle(
                      color: AppColors.currencyColor,
                      fontFamily: 'Lexend',
                      fontSize: 15,
                    ),
                  ),
              ],
            ),
          ),
          Text(
            ref.watch(itemProduct)?.unit ?? '',
            style: const TextStyle(
              color: AppColors.gray,
              fontSize: 15,
              fontFamily: 'Lexend',
            ),
          ),
        ],
      ),
    );
  }

  Widget descriptionWidget(WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
      padding: EdgeInsets.symmetric(
        horizontal: Utils.sizeOf(24),
        vertical: Utils.sizeOf(16),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.1),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "DESCRIPTION",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lexend',
                  color: AppColors.textColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMoreDescription = !isMoreDescription;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: Utils.sizeOf(4),
                    horizontal: Utils.sizeOf(12),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "More",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontFamily: 'Lexend',
                        ),
                      ),
                      Icon(
                        isMoreDescription
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Utils.sizeOf(12),
          ),
          Text(
            ref.watch(itemProduct)?.description ?? '',
            maxLines: isMoreDescription ? 100 : 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.grayTextColor,
              fontSize: 12,
              fontFamily: 'Lexend',
            ),
          ),
        ],
      ),
    );
  }

  Widget ingredientsWidget(WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
      padding: EdgeInsets.symmetric(
        horizontal: Utils.sizeOf(24),
        vertical: Utils.sizeOf(16),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.1),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "NUTRITIONAL INFO",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lexend',
                  color: AppColors.textColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMoreIngredients = !isMoreIngredients;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: Utils.sizeOf(4),
                    horizontal: Utils.sizeOf(12),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(Utils.sizeOf(25)),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "More",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontFamily: 'Lexend',
                        ),
                      ),
                      Icon(
                        isMoreIngredients
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Utils.sizeOf(12),
          ),
          const Text(
            "Dietary",
            style: TextStyle(
              color: AppColors.grayTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: Utils.sizeOf(12),
          ),
          if (ref.watch(itemProduct)?.dietary != null)
            Text(
              ref.watch(itemProduct)?.dietary ?? '',
              style: const TextStyle(
                color: AppColors.grayTextColor,
                fontSize: 12,
              ),
            ),
          if (ref.watch(itemProduct)?.dietary != null)
            SizedBox(
              height: Utils.sizeOf(24),
            ),
          Text(
            "Contains ${ref.watch(itemProduct)?.ingredients ?? ''}",
            style: const TextStyle(
              color: AppColors.grayTextColor,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: Utils.sizeOf(24),
          ),
          const Text(
            "Ingredients",
            style: TextStyle(
              color: AppColors.grayTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: Utils.sizeOf(12),
          ),
          Text(
            ref.watch(itemProduct)?.description ?? '',
            maxLines: isMoreIngredients ? 100 : 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.grayTextColor,
              fontSize: 12,
              fontFamily: 'Lexend',
            ),
          ),
        ],
      ),
    );
  }

  Widget checkOut(
    BuildContext context, {
    required WidgetRef ref,
  }) {
    return TouchableOpacity(
      onTap: () {
        final dataMyBag = ref.read(itemsDataMyBag.notifier).state;
        if (dataMyBag
            .where(
              (item) =>
                  item.productID == ref.watch(itemProduct)?.productID &&
                  !item.isReward,
            )
            .isEmpty) {
          dataMyBag.add(
            ref.watch(itemProduct)!.copyWith(quantity: 1),
          );
          ref
              .read(itemProduct.notifier)
              .update((state) => state?.copyWith(quantity: 1));

          ref
              .read(itemsDataMyBag.notifier)
              .update((state) => dataMyBag.toList());
          setState(() {});
        }
      },
      activeOpacity: 0.4,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.sizeOf(40),
          vertical: Utils.sizeOf(20),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.darkPrimaryColor,
            borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Utils.sizeOf(12),
            horizontal: Utils.sizeOf(32),
          ),
          child: Center(
            child: Text(
              'Add to bag',
              style: TextStyle(
                color: AppColors.white,
                fontSize: Utils.sizeOf(28),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myBag(
    BuildContext context, {
    required WidgetRef ref,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Utils.paddingHorizontal()),
      child: Row(
        children: [
          SizedBox(
            width: Utils.sizeOf(200),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  margin: EdgeInsets.only(right: Utils.sizeOf(3)),
                  decoration: BoxDecoration(
                    color: AppColors.gray5,
                    borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
                  ),
                  child: Row(
                    children: [
                      if (ref.watch(itemProduct)?.quantity == 1)
                        TouchableOpacity(
                          onTap: () {
                            handleLogicAddOrRemove(ref, isAdd: false);
                            handleLogicDelete(ref);
                          },
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
                      if (ref.watch(itemProduct)!.quantity > 1)
                        TouchableOpacity(
                          onTap: () {
                            handleLogicAddOrRemove(ref, isAdd: false);
                          },
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
                          child:
                              Text(ref.watch(itemProduct)!.quantity.toString()),
                        ),
                      ),
                      SizedBox(
                        width: Utils.sizeOf(64),
                        height: Utils.sizeOf(44),
                      )
                    ],
                  ),
                ),
                TouchableOpacity(
                  onTap: () {
                    handleLogicAddOrRemove(ref, isAdd: true);
                  },
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
          ),
          SizedBox(
            width: Utils.sizeOf(12),
          ),
          Expanded(
            child: TouchableOpacity(
              onTap: () {
                context.router.push(const MyBagRoute());
              },
              activeOpacity: 0.4,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Utils.sizeOf(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkPrimaryColor,
                    borderRadius: BorderRadius.circular(Utils.sizeOf(24)),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: Utils.sizeOf(10),
                    horizontal: Utils.sizeOf(32),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  top: Utils.sizeOf(5),
                                  right: Utils.sizeOf(5),
                                ),
                                child: Image.asset(
                                  'assets/images/ic_mybag.png',
                                  width: Utils.sizeOf(40),
                                  height: Utils.sizeOf(40),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white,
                                ),
                                padding: EdgeInsets.all(Utils.sizeOf(5)),
                                child: Text(
                                  ref.watch(itemsDataMyBag).length.toString(),
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: Utils.sizeOf(16),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "${ref.read(myBagRepositoryProvider).getTotalPointsInBag(ref.watch(itemsDataMyBag))} Points",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Utils.sizeOf(20),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "My bag",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: Utils.sizeOf(24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTagContainer extends StatelessWidget {
  const ProductTagContainer({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.textColor,
        borderRadius: BorderRadius.circular(26),
      ),
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      child: child,
    );
  }
}
