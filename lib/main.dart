import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'Screens/account_list_screen.dart';
import 'modal_class/book_model.dart';
import 'modal_class/transaction_model.dart';
import 'modal_class/account_model.dart';
import 'controllers/account_controller.dart';
import 'controllers/book_controller.dart';
import 'controllers/transaction_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(TransactionModelAdapter());
  Hive.registerAdapter(AccountModelAdapter());

  await Hive.openBox<BookModel>('books');
  await Hive.openBox<TransactionModel>('transactions');
  await Hive.openBox<AccountModel>('accounts');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Account Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(AccountController());
        Get.put(BookController());
        Get.put(TransactionController());
      }),
      home: AccountListScreen(),
    );
  }
}
