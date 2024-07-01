import 'dart:io';
import 'package:all_flutter_resource/Screens/homescreen.dart';
import 'package:all_flutter_resource/modal_class/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  //Register the adapter
  Hive.registerAdapter(TodoAdapter());
  //open a box with todos data type
  await Hive.openBox<Todo>('todo');

  await Hive.openBox('friend');
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
