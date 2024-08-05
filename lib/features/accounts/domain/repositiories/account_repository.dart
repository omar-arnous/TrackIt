import 'package:dartz/dartz.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/features/accounts/domain/entities/account.dart';

abstract class AccountRepository {
  Future<Either<Failure, List<Account>>> getAllAccounts();
  Future<Either<Failure, Unit>> addAccount(Account account);
  Future<Either<Failure, Unit>> updateAccount(Account account);
  Future<Either<Failure, Unit>> deleteAccount(int id);
}
