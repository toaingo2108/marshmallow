import 'package:get/get.dart';

// ignore: avoid_classes_with_only_static_members
class Utils {
  static double sizeOf(double size) {
    return size * Get.width / 750;
  }

  static double percentageWidth(double percent) {
    return percent * Get.width / 100;
  }

  static double percentageHeight(double percent) {
    return percent * Get.height / 100;
  }

  static double paddingHorizontal() {
    return sizeOf(40);
  }
}
