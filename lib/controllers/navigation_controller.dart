import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screens/account_list_screen.dart';
import '../Screens/book_list_screen.dart';
import '../Screens/transaction_list_screen.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  List<Widget> pages = [
    AccountListScreen(),
    BookListScreen(),
    TransactionListScreen(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
