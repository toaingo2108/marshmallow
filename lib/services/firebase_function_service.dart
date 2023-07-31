import 'package:cloud_functions/cloud_functions.dart';

abstract class FirebaseFunctionService {
  HttpsCallable httpsCallable(String name, {HttpsCallableOptions? options});
}

class FirebaseFunctionServiceImpl extends FirebaseFunctionService {
  final firebaseFunctions = FirebaseFunctions.instance;

  @override
  HttpsCallable httpsCallable(String name, {HttpsCallableOptions? options}) {
    // firebaseFunctions.useFunctionsEmulator('127.0.0.1', 5001);
    return firebaseFunctions.httpsCallable(name, options: options);
  }
}

class FirebaseFunctionsName {
  static const String getCategories = 'getCategories';
  static const String getExploreCategories = 'getExploreCategories';
  static const String getProducts = 'getProducts';
  static const String getRecommendedProducts = 'getRecommendedProducts';
  static const String getNewProducts = 'getNewProducts';
  static const String getOnSaleProducts = 'getOnSaleProducts';
}
