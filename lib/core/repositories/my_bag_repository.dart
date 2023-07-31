import 'dart:convert';

import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/services/shared_preferences.dart';

class MyBagRepository {
  void setMyBag(List<Product> myBag) {
    final List<String> jsonBag = [];
    for (final product in myBag) {
      if (!product.isReward) jsonBag.add(json.encode(product));
    }
    SPService.instance.setStringList('myBag', jsonBag);
  }

  void clearMyBag() {
    SPService.instance.setStringList('myBag', []);
  }

  List<Product> retrieveMyBag() {
    final List<Product> products = [];
    final jsonBag = SPService.instance.getStringList('myBag');

    jsonBag?.forEach((product) {
      products
          .add(Product.fromJson(json.decode(product) as Map<String, dynamic>));
    });

    return products;
  }

  int getTotalPointsInBag(List<Product> bag) {
    int total = 0;

    for (final product in bag) {
      if (!product.isReward && product.rewardedPoints != null) {
        total += product.rewardedPoints! * product.quantity;
      }
    }
    return total;
  }

  double getSubTotal(List<Product> result) {
    double total = 0.0;

    for (final product in result) {
      if (!product.isReward) total += product.price * product.quantity;
    }
    return total;
  }
}
