import 'package:dartz/dartz.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/features/categories/domain/entities/category.dart';
import 'package:trackit/models/category_model.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, Unit>> addCategory(CategoryModel category);
}
