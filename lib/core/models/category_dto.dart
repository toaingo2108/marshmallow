import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marshmallow/core/models/category.dart';
part 'category_dto.freezed.dart';

@freezed
class CategoryDTO with _$CategoryDTO {
  const CategoryDTO._();
  const factory CategoryDTO({
    required String id,
    required String name,
    String? icon,
    bool? enable,
    bool? isHome,
    String? parent,
    List<CategoryDTO>? subCategories,
  }) = _CategoryDTO;

  factory CategoryDTO.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    final dataSubCategories = data?['sub_categories'] as List;
    final List<CategoryDTO> subCategories = [];
    dataSubCategories.forEach((element) {
      final item = element as Map;
      if (item['isHome'] as bool? ?? false) {
        subCategories.add(
          CategoryDTO(
            id: item['id'] as String,
            name: item['name'] as String,
            icon: item['icon'] as String,
            enable: item['enable'] as bool?,
            isHome: item['isHome'] as bool?,
          ),
        );
      }
    });
    debugPrint('$subCategories');
    return CategoryDTO(
        id: data?['id'] as String,
        name: data?['name'] as String,
        icon: data?['icon'] as String,
        enable: data?['enable'] as bool?,
        isHome: data?['isHome'] as bool?,
        subCategories: subCategories);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "icon": icon,
      "enable": enable,
      "isHome": isHome,
    };
  }

  Category toDomain() => Category(
        id: id,
        name: name,
        icon: icon ?? '',
        enable: enable ?? false,
        isHome: isHome ?? false,
        subCategories: subCategories?.map((e) => e.toDomain()).toList(),
      );
}
