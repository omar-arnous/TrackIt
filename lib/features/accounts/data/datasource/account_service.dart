import 'package:trackit/error/exceptions.dart';
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
    final data = {
      "name": account.name,
      "accountType": account.accountType.toString()
    };

    await db.insert(ACCOUNTSTABLENAME, data);

    return Future.value(unit);
  }

  @override
  Future<Unit> deleteAccount(int accountId) async {
    final db = await dbService.database;
    final res = await db
        .delete(ACCOUNTSTABLENAME, where: 'id = ?', whereArgs: [accountId]);

    if (res == 1) {
      return Future.value(unit);
    } else {
      throw UnhandledOperationException();
    }
  }

  @override
  Future<List<AccountModel>> getAllAccounts() async {
    final db = await dbService.database;
    final data = await db.query(ACCOUNTSTABLENAME);

    if (data.isNotEmpty) {
      final List<AccountModel> accounts = data
          .map<AccountModel>((account) => AccountModel.fromJson(account))
          .toList();
      return accounts;
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> updateAccount(AccountModel account) async {
    final db = await dbService.database;
    final data = {
      "name": account.name,
      "accountType": account.accountType.toString()
    };

    final res = await db.update(ACCOUNTSTABLENAME, data,
        where: 'id = ?', whereArgs: [account.id]);

    if (res == 1) {
      return Future.value(unit);
    } else {
      throw UnhandledOperationException();
    }
  }
}
