import 'package:marshmallow/core/data_fake.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/repositories/category_repository.dart';
import 'package:marshmallow/home/application/home_notifier.dart';
import 'package:marshmallow/core/repositories/product_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../application/home_state.dart';

final categoryRepository = Provider(
        (ref) => CategoryRepository(),
);

final productRepository = Provider((ref) => ProductRepository());

final homeNotifierProvider =
StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(ref.watch(categoryRepository), ref.watch(productRepository)),
);

final StateProvider<List<Map<String, String>>> itemsData1 =
    StateProvider((ref) => data1);

final StateProvider<List<Product>> itemsData2 = StateProvider((ref) => data2);

final StateProvider<List<Product>> itemsData3 = StateProvider((ref) => data3);

final StateProvider<Product?> itemProduct = StateProvider((ref) => null);