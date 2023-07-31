

// final StateProvider<List<Map<String, dynamic>>> itemsDataMyBag =
//     StateProvider((ref) => dataMyBag.toList());
//
// final StateProvider<double> subTotalPrice = StateProvider((ref) {
//   double total = 0;
//   dataMyBag.forEach((element) {
//     total += double.parse(element["price"].toString()) *
//         int.parse(element["total"].toString());
//   });
//   return total;
// });
//
// List<Map<String, dynamic>> dataMyBag = [];
