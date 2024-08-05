import 'package:equatable/equatable.dart';
import 'package:trackit/features/accounts/domain/entities/account_type.dart';

class Account extends Equatable {
  final int? id;
  final String name;
  final AccountType accountType;

  const Account({this.id, required this.name, required this.accountType});

  @override
  List<Object?> get props => [id, name, accountType];
}
