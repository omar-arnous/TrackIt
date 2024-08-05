import 'package:dartz/dartz.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/features/accounts/domain/entities/account.dart';
import 'package:trackit/features/accounts/domain/repositiories/account_repository.dart';

class AddAccountUsecase {
  final AccountRepository repository;

  AddAccountUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Account account) async {
    return await repository.addAccount(account);
  }
}
