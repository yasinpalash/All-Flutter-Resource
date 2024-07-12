import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'account_list_screen.dart';
import 'add_account_screen.dart';
import '../controllers/account_controller.dart';

class MainScreen extends StatelessWidget {
  final AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Text('Main Screen Content'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Accounts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Account',
          ),
        ],
        currentIndex: 0, // Default selected index
        onTap: (index) {
          if (index == 0) {
            // Navigate to account list screen
            Get.to(() => AccountListScreen());
          } else if (index == 1) {
            // Navigate to add account screen
            Get.to(() => AddAccountScreen());
          }
        },
      ),
    );
  }
}
