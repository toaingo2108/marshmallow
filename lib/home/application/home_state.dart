import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/models/category.dart';
import 'package:marshmallow/core/models/product.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState.loading() = _Loading;
  const factory HomeState.idle() = _Idle;
  const factory HomeState.loadProductByCategory({required Map<String, List<Product>> data}) = _LoadProductByCategory;
  const factory HomeState.success({
    required List<Category> categories,
  }) = _Success;
  const factory HomeState.firebaseFailure(FirebaseFailure failure) =
  _FirebaseFailure;
}
