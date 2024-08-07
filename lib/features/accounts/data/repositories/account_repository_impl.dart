import 'package:dartz/dartz.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/features/accounts/domain/entities/account.dart';
import 'package:trackit/features/accounts/domain/repositiories/account_repository.dart';
import 'package:trackit/models/account_model.dart';
import 'package:trackit/services/account_service.dart';

typedef DeleteOrUpdateOrAddAccount = Future<Unit> Function();

class AccountRepositoryImpl implements AccountRepository {
  final AccountService accountService;

  AccountRepositoryImpl({required this.accountService});

  @override
  Future<Either<Failure, Unit>> addAccount(Account account) async {
    final AccountModel accountData =
        AccountModel(name: account.name, accountType: account.accountType);

    return await _getMessage(() {
      return accountService.addAccount(accountData);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount(int id) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AccountModel>>> getAllAccounts() async {
    final accounts = await accountService.getAllAccounts();
    return right(accounts);
  }

  @override
  Future<Either<Failure, Unit>> updateAccount(Account account) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }

  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddAccount deleteOrUpdateOrAddPost) async {
    try {
      await deleteOrUpdateOrAddPost();
      return const Right(unit);
    } catch (error) {
      return Left(OfflineFailure());
    }
  }
}
