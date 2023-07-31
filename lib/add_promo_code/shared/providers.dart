import 'package:riverpod/riverpod.dart';

final isValidateText = StateProvider.autoDispose<bool?>((ref) => null);
//
// final StateProvider<double> subTotalPrice  =
// StateProvider((ref) {
//     double total = 0;
//     dataMyBag.forEach((element) {
//         total += double.parse(element["price"].toString()) * int.parse(element["total"].toString());
//     });
//     return total;
// });
//
// List<Map<String, dynamic>> dataMyBag = [];
