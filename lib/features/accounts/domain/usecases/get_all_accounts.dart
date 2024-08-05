import 'package:dartz/dartz.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/features/accounts/domain/entities/account.dart';
import 'package:trackit/features/accounts/domain/repositiories/account_repository.dart';

class GetAllAccountsUsecase {
  final AccountRepository repository;

  GetAllAccountsUsecase(this.repository);

  Future<Either<Failure, List<Account>>> call() async {
    return await repository.getAllAccounts();
  }
}
