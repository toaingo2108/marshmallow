// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddPromoCodeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddPromoCodePage(),
      );
    },
    MenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MenuPage(),
      );
    },
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingPage(),
      );
    },
    OnGoingOrderDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnGoingOrderDetailPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    CompleteAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompleteAccountPage(),
      );
    },
    VerifyPhoneOrEmailRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyPhoneOrEmailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyPhoneOrEmailPage(isPhone: args.isPhone),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationPage(),
      );
    },
    PlaceOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceOrderPage(),
      );
    },
    RedeemedRewardsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RedeemedRewardsPage(),
      );
    },
    RewardsRoute.name: (routeData) {
      final args = routeData.argsAs<RewardsRouteArgs>(
          orElse: () => const RewardsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RewardsPage(comesFromProfile: args.comesFromProfile),
      );
    },
    OnGoingOrderRoute.name: (routeData) {
      final args = routeData.argsAs<OnGoingOrderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OnGoingOrderPage(status: args.status),
      );
    },
    AdsBeforeCheckoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdsBeforeCheckoutPage(),
      );
    },
    ProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductPage(),
      );
    },
    MakeAGiftRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MakeAGiftPage(),
      );
    },
    MyBagRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyBagPage(),
      );
    },
    PaymentMethodsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaymentMethodsPage(),
      );
    },
    HelpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelpPage(),
      );
    },
    MWClubRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MWClubPage(),
      );
    },
    ReferralsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReferralsPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserProfilePage(),
      );
    },
    OnGoingOrderCancelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnGoingOrderCancelPage(),
      );
    },
    FilterOverlayRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FilterOverlayPage(),
      );
    },
    BrowseCategoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BrowseCategoriesPage(),
      );
    },
    OrdersRoute.name: (routeData) {
      final args = routeData.argsAs<OrdersRouteArgs>(
          orElse: () => const OrdersRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrdersPage(comesFromProfile: args.comesFromProfile),
      );
    },
    SelectCategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectCategoryPage(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoriesPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchPage(),
      );
    },
  };
}

/// generated route for
/// [AddPromoCodePage]
class AddPromoCodeRoute extends PageRouteInfo<void> {
  const AddPromoCodeRoute({List<PageRouteInfo>? children})
      : super(
          AddPromoCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPromoCodeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MenuPage]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoadingPage]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnGoingOrderDetailPage]
class OnGoingOrderDetailRoute extends PageRouteInfo<void> {
  const OnGoingOrderDetailRoute({List<PageRouteInfo>? children})
      : super(
          OnGoingOrderDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnGoingOrderDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompleteAccountPage]
class CompleteAccountRoute extends PageRouteInfo<void> {
  const CompleteAccountRoute({List<PageRouteInfo>? children})
      : super(
          CompleteAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompleteAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyPhoneOrEmailPage]
class VerifyPhoneOrEmailRoute
    extends PageRouteInfo<VerifyPhoneOrEmailRouteArgs> {
  VerifyPhoneOrEmailRoute({
    required bool isPhone,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyPhoneOrEmailRoute.name,
          args: VerifyPhoneOrEmailRouteArgs(isPhone: isPhone),
          initialChildren: children,
        );

  static const String name = 'VerifyPhoneOrEmailRoute';

  static const PageInfo<VerifyPhoneOrEmailRouteArgs> page =
      PageInfo<VerifyPhoneOrEmailRouteArgs>(name);
}

class VerifyPhoneOrEmailRouteArgs {
  const VerifyPhoneOrEmailRouteArgs({required this.isPhone});

  final bool isPhone;

  @override
  String toString() {
    return 'VerifyPhoneOrEmailRouteArgs{isPhone: $isPhone}';
  }
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaceOrderPage]
class PlaceOrderRoute extends PageRouteInfo<void> {
  const PlaceOrderRoute({List<PageRouteInfo>? children})
      : super(
          PlaceOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RedeemedRewardsPage]
class RedeemedRewardsRoute extends PageRouteInfo<void> {
  const RedeemedRewardsRoute({List<PageRouteInfo>? children})
      : super(
          RedeemedRewardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RedeemedRewardsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RewardsPage]
class RewardsRoute extends PageRouteInfo<RewardsRouteArgs> {
  RewardsRoute({
    bool comesFromProfile = false,
    List<PageRouteInfo>? children,
  }) : super(
          RewardsRoute.name,
          args: RewardsRouteArgs(comesFromProfile: comesFromProfile),
          initialChildren: children,
        );

  static const String name = 'RewardsRoute';

  static const PageInfo<RewardsRouteArgs> page =
      PageInfo<RewardsRouteArgs>(name);
}

class RewardsRouteArgs {
  const RewardsRouteArgs({this.comesFromProfile = false});

  final bool comesFromProfile;

  @override
  String toString() {
    return 'RewardsRouteArgs{comesFromProfile: $comesFromProfile}';
  }
}

/// generated route for
/// [OnGoingOrderPage]
class OnGoingOrderRoute extends PageRouteInfo<OnGoingOrderRouteArgs> {
  OnGoingOrderRoute({
    required OnGoingOrderStatus status,
    List<PageRouteInfo>? children,
  }) : super(
          OnGoingOrderRoute.name,
          args: OnGoingOrderRouteArgs(status: status),
          initialChildren: children,
        );

  static const String name = 'OnGoingOrderRoute';

  static const PageInfo<OnGoingOrderRouteArgs> page =
      PageInfo<OnGoingOrderRouteArgs>(name);
}

class OnGoingOrderRouteArgs {
  const OnGoingOrderRouteArgs({required this.status});

  final OnGoingOrderStatus status;

  @override
  String toString() {
    return 'OnGoingOrderRouteArgs{status: $status}';
  }
}

/// generated route for
/// [AdsBeforeCheckoutPage]
class AdsBeforeCheckoutRoute extends PageRouteInfo<void> {
  const AdsBeforeCheckoutRoute({List<PageRouteInfo>? children})
      : super(
          AdsBeforeCheckoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdsBeforeCheckoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductPage]
class ProductRoute extends PageRouteInfo<void> {
  const ProductRoute({List<PageRouteInfo>? children})
      : super(
          ProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MakeAGiftPage]
class MakeAGiftRoute extends PageRouteInfo<void> {
  const MakeAGiftRoute({List<PageRouteInfo>? children})
      : super(
          MakeAGiftRoute.name,
          initialChildren: children,
        );

  static const String name = 'MakeAGiftRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyBagPage]
class MyBagRoute extends PageRouteInfo<void> {
  const MyBagRoute({List<PageRouteInfo>? children})
      : super(
          MyBagRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyBagRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentMethodsPage]
class PaymentMethodsRoute extends PageRouteInfo<void> {
  const PaymentMethodsRoute({List<PageRouteInfo>? children})
      : super(
          PaymentMethodsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentMethodsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelpPage]
class HelpRoute extends PageRouteInfo<void> {
  const HelpRoute({List<PageRouteInfo>? children})
      : super(
          HelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MWClubPage]
class MWClubRoute extends PageRouteInfo<void> {
  const MWClubRoute({List<PageRouteInfo>? children})
      : super(
          MWClubRoute.name,
          initialChildren: children,
        );

  static const String name = 'MWClubRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReferralsPage]
class ReferralsRoute extends PageRouteInfo<void> {
  const ReferralsRoute({List<PageRouteInfo>? children})
      : super(
          ReferralsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReferralsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute({List<PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnGoingOrderCancelPage]
class OnGoingOrderCancelRoute extends PageRouteInfo<void> {
  const OnGoingOrderCancelRoute({List<PageRouteInfo>? children})
      : super(
          OnGoingOrderCancelRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnGoingOrderCancelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FilterOverlayPage]
class FilterOverlayRoute extends PageRouteInfo<void> {
  const FilterOverlayRoute({List<PageRouteInfo>? children})
      : super(
          FilterOverlayRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterOverlayRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BrowseCategoriesPage]
class BrowseCategoriesRoute extends PageRouteInfo<void> {
  const BrowseCategoriesRoute({List<PageRouteInfo>? children})
      : super(
          BrowseCategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'BrowseCategoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrdersPage]
class OrdersRoute extends PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({
    bool comesFromProfile = false,
    List<PageRouteInfo>? children,
  }) : super(
          OrdersRoute.name,
          args: OrdersRouteArgs(comesFromProfile: comesFromProfile),
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const PageInfo<OrdersRouteArgs> page = PageInfo<OrdersRouteArgs>(name);
}

class OrdersRouteArgs {
  const OrdersRouteArgs({this.comesFromProfile = false});

  final bool comesFromProfile;

  @override
  String toString() {
    return 'OrdersRouteArgs{comesFromProfile: $comesFromProfile}';
  }
}

/// generated route for
/// [SelectCategoryPage]
class SelectCategoryRoute extends PageRouteInfo<void> {
  const SelectCategoryRoute({List<PageRouteInfo>? children})
      : super(
          SelectCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectCategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoriesPage]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute({List<PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
