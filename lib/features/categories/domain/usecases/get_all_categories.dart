import 'package:dartz/dartz.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/features/categories/domain/entities/category.dart';
import 'package:trackit/features/categories/domain/repositories/category_repository.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository repository;

  GetAllCategoriesUseCase(this.repository);

  Future<Either<Failure, List<Category>>> call() async {
    return await repository.getAllCategories();
  }
}
