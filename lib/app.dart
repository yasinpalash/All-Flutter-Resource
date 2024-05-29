import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/homescreen.dart';

class ResourceApp extends StatelessWidget {
  const ResourceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
