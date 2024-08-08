import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trackit/features/accounts/data/repositories/account_repository_impl.dart';
import 'package:trackit/features/accounts/domain/repositiories/account_repository.dart';
import 'package:trackit/features/accounts/domain/usecases/add_account.dart';
import 'package:trackit/features/accounts/domain/usecases/delete_account.dart';
import 'package:trackit/features/accounts/domain/usecases/get_all_accounts.dart';
import 'package:trackit/features/accounts/domain/usecases/update_account.dart';
import 'package:trackit/features/accounts/data/datasource/account_service.dart';
import 'package:trackit/services/database_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ! Features - Accounts

  //  usecases
  sl.registerLazySingleton(() => GetAllAccountsUsecase(sl()));
  sl.registerLazySingleton(() => AddAccountUsecase(sl()));
  sl.registerLazySingleton(() => UpdateAccountUsecase(sl()));
  sl.registerLazySingleton(() => DeleteAccountUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<AccountRepository>(
      () => AccountRepositoryImpl(accountService: sl()));

  // Datasources
  sl.registerLazySingleton<AccountService>(
      () => AccountLocalDataSourceImpl(dbService: sl()));

  // ! External
  final database = DatabaseHelper.instance;
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => database);
  sl.registerLazySingleton(() => sharedPreferences);
}
