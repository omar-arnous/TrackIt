import 'package:dartz/dartz.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/features/accounts/domain/repositiories/account_repository.dart';

class DeleteAccountUsecase {
  final AccountRepository repository;

  DeleteAccountUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.deleteAccount(id);
  }
}
