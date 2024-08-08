import 'package:dartz/dartz.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/features/categories/data/datasources/category_service.dart';
import 'package:trackit/features/categories/domain/entities/category.dart';
import 'package:trackit/features/categories/domain/repositories/category_repository.dart';
import 'package:trackit/models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryService categoryService;

  CategoryRepositoryImpl({required this.categoryService});

  @override
  Future<Either<Failure, Unit>> addCategory(CategoryModel category) async {
    final cachedCategories = await categoryService.getAllCategories();

    cachedCategories.add(category);
    await categoryService.addCategory(cachedCategories);

    return right(unit);
  }

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    final categories = await categoryService.getAllCategories();

    return right(categories);
  }
}
