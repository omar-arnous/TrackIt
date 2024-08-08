import 'package:dartz/dartz.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/features/categories/domain/repositories/category_repository.dart';
import 'package:trackit/models/category_model.dart';

class AddCategoryUseCase {
  final CategoryRepository repository;

  AddCategoryUseCase(this.repository);

  Future<Either<Failure, Unit>> call(CategoryModel category) async {
    return await repository.addCategory(category);
  }
}
