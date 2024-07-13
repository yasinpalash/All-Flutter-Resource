import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modal_class/account_model.dart';
import '../controllers/account_controller.dart';

class AddAccountScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final AccountController accountController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                accountController.addAccount(AccountModel(
                  nameController.text,
                  idController.text,
                ));
                Get.back();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
