import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/repositories/my_bag_repository.dart';

final StateProvider<List<Product>> itemsDataMyBag = StateProvider((ref) => []);

final myBagRepositoryProvider = Provider(
  (ref) => MyBagRepository(),
);

void handleLogicAddOrSubtract(WidgetRef ref, int index, {required bool isAdd}) {
  int num1 = ref.watch(itemsDataMyBag)[index].quantity;
  isAdd ? num1++ : num1--;

  final result = ref.read(itemsDataMyBag.notifier).state;
  result[index] = result[index].copyWith(quantity: num1);
  ref.read(itemsDataMyBag.notifier).update((state) => result.toList());
}
