import 'package:auto_route/auto_route.dart';
import 'package:marshmallow/add_promo_code/presentation/add_promo_code_page.dart';
import 'package:marshmallow/ads_before_checkout/presentation/ads_before_checkout_page.dart';
import 'package:marshmallow/auth/presentation/complete_account_page.dart';
import 'package:marshmallow/auth/presentation/sign_in_page.dart';
import 'package:marshmallow/auth/presentation/verify_email_phone_page.dart';
import 'package:marshmallow/browse_categories/presentation/browse_categories_page.dart';
import 'package:marshmallow/categories/presentation/categories_page.dart';
import 'package:marshmallow/core/presentation/loading_page.dart';
import 'package:marshmallow/core/presentation/menu_page.dart';
import 'package:marshmallow/filter_overlay/presentation/filter_overlay_page.dart';
import 'package:marshmallow/make_a_gift/presentation/make_a_gift_page.dart';
import 'package:marshmallow/my_bag/presentation/my_bag_page.dart';
import 'package:marshmallow/notification/presentation/notification_page.dart';
import 'package:marshmallow/ongoing_order/presentation/ongoing_order_page.dart';
import 'package:marshmallow/ongoing_order/shared/providers.dart';
import 'package:marshmallow/ongoing_order_cancel/presentation/ongoing_order_cancel_page.dart';
import 'package:marshmallow/ongoing_order_detail/presentation/ongoing_order_detail_page.dart';
import 'package:marshmallow/orders/presentation/orders_page.dart';
import 'package:marshmallow/place_order/presentation/place_order_page.dart';
import 'package:marshmallow/product/presentation/product_page.dart';
import 'package:marshmallow/profile/presentation/help_page.dart';
import 'package:marshmallow/profile/presentation/profile.dart';
import 'package:marshmallow/profile/presentation/referrals_page.dart';
import 'package:marshmallow/profile/presentation/settings_page.dart';
import 'package:marshmallow/rewards/presentation/redeemed_rewards_page.dart';
import 'package:marshmallow/rewards/presentation/rewards_page.dart';
import 'package:marshmallow/search_button/presentation/search_page.dart';
import 'package:marshmallow/select_category/presentation/select_category_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        MaterialRoute(
          page: LoadingRoute.page,
          path: LoadingPage.routeName,
          initial: true,
        ),
        MaterialRoute(
          page: SignInRoute.page,
          path: SignInPage.routeName,
        ),
        MaterialRoute(
          page: MenuRoute.page,
          path: MenuPage.routeName,
        ),
        MaterialRoute(
          page: NotificationRoute.page,
          path: NotificationPage.routeName,
        ),
        MaterialRoute(
          page: CategoriesRoute.page,
          path: CategoriesPage.routeName,
        ),
        MaterialRoute(
          page: BrowseCategoriesRoute.page,
          path: BrowseCategoriesPage.routeName,
        ),
        MaterialRoute(
          page: SearchRoute.page,
          path: SearchPage.routeName,
        ),
        MaterialRoute(
          page: SelectCategoryRoute.page,
          path: SelectCategoryPage.routeName,
        ),
        MaterialRoute(
          page: FilterOverlayRoute.page,
          path: FilterOverlayPage.routeName,
        ),
        MaterialRoute(
          page: CompleteAccountRoute.page,
          path: CompleteAccountPage.routeName,
        ),
        MaterialRoute(
          page: VerifyPhoneOrEmailRoute.page,
          path: VerifyPhoneOrEmailPage.routeName,
        ),
        MaterialRoute(
          page: MyBagRoute.page,
          path: MyBagPage.routeName,
        ),
        MaterialRoute(
          page: ProductRoute.page,
          path: ProductPage.routeName,
        ),
        MaterialRoute(
          page: AddPromoCodeRoute.page,
          path: AddPromoCodePage.routeName,
        ),
        MaterialRoute(
          page: MakeAGiftRoute.page,
          path: MakeAGiftPage.routeName,
        ),
        MaterialRoute(
          page: AdsBeforeCheckoutRoute.page,
          path: AdsBeforeCheckoutPage.routeName,
        ),
        MaterialRoute(
          page: PlaceOrderRoute.page,
          path: PlaceOrderPage.routeName,
        ),
        MaterialRoute(
          page: OrdersRoute.page,
          path: OrdersPage.routeName,
        ),
        MaterialRoute(
          page: UserProfileRoute.page,
          path: UserProfilePage.routeName,
        ),
        MaterialRoute(
          page: PaymentMethodsRoute.page,
          path: PaymentMethodsPage.routeName,
        ),
        MaterialRoute(
          page: MWClubRoute.page,
          path: MWClubPage.routeName,
        ),
        MaterialRoute(
          page: ReferralsRoute.page,
          path: ReferralsPage.routeName,
        ),
        MaterialRoute(
          page: HelpRoute.page,
          path: HelpPage.routeName,
        ),
        MaterialRoute(
          page: SettingsRoute.page,
          path: SettingsPage.routeName,
        ),
        MaterialRoute(
          page: RewardsRoute.page,
          path: RewardsPage.routeName,
        ),
        MaterialRoute(
          page: OnGoingOrderDetailRoute.page,
          path: OnGoingOrderDetailPage.routeName,
        ),
        MaterialRoute(
          page: OnGoingOrderRoute.page,
          path: OnGoingOrderPage.routeName,
        ),
        MaterialRoute(
          page: RedeemedRewardsRoute.page,
          path: ReferralsPage.routeName,
        ),
        MaterialRoute(
          page: OnGoingOrderCancelRoute.page,
          path: OnGoingOrderCancelPage.routeName,
        ),
      ];
}
