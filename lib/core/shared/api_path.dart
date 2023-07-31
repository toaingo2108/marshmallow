String documentIDFromCurrentDate() => DateTime.now().toIso8601String();

// ignore: avoid_classes_with_only_static_members
class APIPath {
  static String userAddressesCollection(String userID) =>
      'users/$userID/addresses';
  static String userAddress(String userID, String id) =>
      '$userID/addresses/$id';
  static String categories() => 'categories/';
  static String product(String productID) => 'products/$productID';
  static String products() => 'products/';
  static String rewards(String userID) => 'users/$userID/rewards';
  static String reward(String userID, String id) => 'users/$userID/rewards/$id';
  static String userInfo(String userID) => 'users/$userID/';
  static String userOrdersCollection(String userID) => 'users/$userID/orders';
  static String order(String userID, String orderID) =>
      'users/$userID/orders/$orderID';
}
