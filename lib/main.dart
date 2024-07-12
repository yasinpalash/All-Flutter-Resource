import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'Screens/home_screen.dart';
import 'controllers/account_controller.dart';
import 'modal_class/account_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(AccountModelAdapter());

  await Hive.openBox<AccountModel>('accounts');

  runApp(GetMaterialApp(
    title: 'Account App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialBinding: BindingsBuilder(() {
      Get.put(AccountController());
    }),
    home: MainScreen(),
  ));
}
