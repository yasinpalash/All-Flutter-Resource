import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modal_class/account_model.dart';
import 'book_list_screen.dart';
import '../controllers/account_controller.dart';

class AccountListScreen extends StatelessWidget {
  final AccountController accountController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
      ),
      body: Obx(() {
        if (accountController.accounts.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: accountController.accounts.length,
            itemBuilder: (context, index) {
              AccountModel account = accountController.accounts[index];
              return ListTile(
                title: Text(account.name),
                subtitle: Text(account.id),
                onTap: () {
                  Get.to(() => BookListScreen(account: account));
                },
              );
            },
          );
        }
      }),
    );
  }
}
