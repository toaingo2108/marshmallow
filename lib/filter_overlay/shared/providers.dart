import 'package:riverpod/riverpod.dart';

final StateProvider<bool> isExpanded1 = StateProvider((ref) => false);
final StateProvider<bool> isExpanded2 = StateProvider((ref) => false);
final StateProvider<bool> isExpanded3 = StateProvider((ref) => false);
final StateProvider<int> choosePrice = StateProvider((ref) => 0);
final StateProvider<bool> isStockItem = StateProvider((ref) => false);
final StateProvider<bool> isOnlyItemSale = StateProvider((ref) => false);
