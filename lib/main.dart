import 'package:flutter/material.dart';
import 'package:trackit/features/accounts/domain/entities/account_type.dart';
import 'package:trackit/features/accounts/domain/usecases/add_account.dart';
import 'package:trackit/models/account_model.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrackIt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Center(
        child: ElevatedButton(
          child: const Text('test'),
          onPressed: () {
            di.sl<AddAccountUsecase>().repository.getAllAccounts();
          },
        ),
      ),
    );
  }
}
