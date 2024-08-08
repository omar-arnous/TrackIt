import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trackit/models/category_model.dart';

abstract class CategoryService {
  Future<List<CategoryModel>> getAllCategories();
  Future<Unit> addCategory(List<CategoryModel> categories);
}

const CATEGORIES = 'categories';

class CategoryServiceDataSourceImpl implements CategoryService {
  final SharedPreferences sharedPreferences;

  CategoryServiceDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> addCategory(List<CategoryModel> categories) {
    List data = categories
        .map<Map<String, dynamic>>((category) => category.toJson())
        .toList();

    sharedPreferences.setString(CATEGORIES, json.encode(data));
    return Future.value(unit);
  }

  @override
  Future<List<CategoryModel>> getAllCategories() {
    final cachedData = sharedPreferences.getString(CATEGORIES);
    if (cachedData != null) {
      List data = json.decode(cachedData);
      List<CategoryModel> categories = data
          .map<CategoryModel>((item) => CategoryModel.fromJson(item))
          .toList();

      return Future.value(categories);
    } else {
      return Future.value([]);
    }
  }
}
