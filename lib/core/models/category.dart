import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const Category._();
  const factory Category({
    String? id,
    String? name,
    String? icon,
    bool? enable,
    bool? isHome,
    String? parent,
    List<Category>? subCategories,
  }) = _Category;
}
