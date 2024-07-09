import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../modal_class/account_model.dart';

class AddAccountScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();

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
              onPressed: () async {
                var accountsBox = Hive.box<AccountModel>('accounts');
                await accountsBox.add(AccountModel(
                  nameController.text,
                  idController.text,
                ));
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
