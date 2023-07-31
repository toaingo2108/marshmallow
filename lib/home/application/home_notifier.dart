import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/models/category.dart';
import 'package:marshmallow/core/models/product.dart';
import 'package:marshmallow/core/repositories/category_repository.dart';
import 'package:marshmallow/core/repositories/product_repository.dart';
import 'package:marshmallow/home/application/home_state.dart';

final _listCategories = [
  Categories.pizza,
  Categories.drinks,
  Categories.snacks,
  Categories.chips
];

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this._categoryRepository, this._productRepository) : super(const HomeState.idle()) {
    fetchCategories();
    getProductFollowCategory(_listCategories);
  }

  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  Future<void> fetchCategories() async {
    state = const HomeState.loading();
    final successOrFailure = await _categoryRepository.getHomePageCategories();

    state = successOrFailure.fold(
      (l) => HomeState.success(categories: l),
      (r) => HomeState.firebaseFailure(r),
    );
  }


  Future<void> getProductByCategory(Categories categoriesId) async {
    state = const HomeState.loading();
    final productsOrFailure = await _productRepository.getProductByCategory(categoryId: categoriesId.name);
    state = productsOrFailure.fold(
          (l) => HomeState.loadProductByCategory(data: {categoriesId.name: l}),
          (r) => HomeState.firebaseFailure(r),
    );
  }

  Future<void> getProductFollowCategory(List<Categories> categoriesIds) async {
    state = const HomeState.loading();
    final result = <String, List<Product>>{};
    for (final categoriesId in categoriesIds) {
      final productsOrFailure =
      await _productRepository.getProductByCategory(categoryId: categoriesId.name);
      productsOrFailure.fold(
            (l) => result[categoriesId.name] = l,
            (r) => state = HomeState.firebaseFailure(r),
      );
    }
    state = HomeState.loadProductByCategory(data: result);
  }
}
