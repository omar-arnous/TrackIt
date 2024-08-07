import 'package:trackit/error/exceptions.dart';
import 'package:trackit/error/failures.dart';
import 'package:trackit/models/account_model.dart';
import 'package:dartz/dartz.dart';
import 'package:trackit/services/database_helper.dart';
import 'package:trackit/utils/constants/db_constants.dart';

abstract class AccountService {
  Future<List<AccountModel>> getAllAccounts();
  Future<Unit> deleteAccount(int accountId);
  Future<Unit> addAccount(AccountModel account);
  Future<Unit> updateAccount(AccountModel account);
}

class AccountLocalDataSourceImpl implements AccountService {
  final DatabaseHelper dbService;

  AccountLocalDataSourceImpl({required this.dbService});

  @override
  Future<Unit> addAccount(AccountModel account) async {
    final db = await dbService.database;

    db.insert(ACCOUNTSTABLENAME,
        {"name": account.name, "accountType": account.accountType.toString()});

    print(account);

    return Future.value(unit);
  }

  @override
  Future<Unit> deleteAccount(int accountId) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<List<AccountModel>> getAllAccounts() async {
    final db = await dbService.database;
    final data = await db.query(ACCOUNTSTABLENAME);

    if (data.isNotEmpty) {
      final List<AccountModel> accounts = data
          .map<AccountModel>((account) => AccountModel.fromJson(account))
          .toList();
      print(accounts);
      return accounts;
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> updateAccount(AccountModel account) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }
}
