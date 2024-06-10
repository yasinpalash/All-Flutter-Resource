import 'package:all_flutter_resource/controller_binder/controller_binder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/homescreen.dart';

class ResourceApp extends StatelessWidget {
  const ResourceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BinderController(),
      home:  HomeScreen(),
    );
  }
}

