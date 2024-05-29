import 'package:get/get.dart';

import '../controller/tabbar_Controller.dart';

class BinderController extends Bindings{
  @override
  void dependencies() {
   Get.put(TabBarController());
  }

}