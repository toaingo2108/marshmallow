import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marshmallow/core/models/product.dart';
part 'redeemed_product.freezed.dart';

@freezed
class RedeemedProduct with _$RedeemedProduct {
  const RedeemedProduct._();
  const factory RedeemedProduct({
    required String id,
    required Product product,
    required DateTime redeemedDate,
    required DateTime? deliveryDate,
  }) = _RedeemedProduct;
}
