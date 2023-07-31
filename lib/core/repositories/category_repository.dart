import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/models/category.dart';
import 'package:marshmallow/core/models/category_dto.dart';
import 'package:marshmallow/core/shared/api_path.dart';

class CategoryRepository {
  Future<Either<List<Category>, FirebaseFailure>> getCategories() async {
    final docRef = FirebaseFirestore.instance.collection(
      APIPath.categories(),
    );
    try {
      final docs = await docRef.get();
      final categories = docs.docs
          .map((e) => CategoryDTO.fromFirestore(e, null).toDomain())
          .toList();
      return left(categories);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }

  Future<Either<List<Category>, FirebaseFailure>>
      getHomePageCategories() async {
    final docRef = FirebaseFirestore.instance.collection(
      APIPath.categories(),
    );
    final List<Category> categories = [];
    try {
      final docs = await docRef.get();
      final parentCategories = docs.docs
          .map((e) => CategoryDTO.fromFirestore(e, null).toDomain())
          .toList();

      for (final element in parentCategories) {
        if (element.isHome ?? false) {
          categories.add(element);
        }
        for (final Category subElement in element.subCategories ?? []) {
          if (subElement.isHome ?? false) {
            categories.add(subElement);
          }
        }
      }

      return left(categories);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }
}
