// ignore_for_file: use_super_parameters

import 'package:trackit/features/accounts/domain/entities/account.dart';
import 'package:trackit/features/accounts/domain/entities/account_type.dart';

class AccountModel extends Account {
  const AccountModel(
      {int? id, required String name, required AccountType accountType})
      : super(id: id, name: name, accountType: accountType);

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      name: json['name'],
      accountType: json['accountType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'accountType': accountType};
  }
}
