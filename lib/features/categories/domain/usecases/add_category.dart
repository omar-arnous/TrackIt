import 'package:dartz/dartz.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/features/categories/domain/entities/category.dart';
import 'package:trackit/features/categories/domain/repositories/category_repository.dart';

class AddCategoryUseCase {
  final CategoryRepository repository;

  AddCategoryUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(Category category) async {
    return await repository.addCategory(category);
  }
}
