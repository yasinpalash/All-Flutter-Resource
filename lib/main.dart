import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('friend');
  runApp( const ResourceApp());
}