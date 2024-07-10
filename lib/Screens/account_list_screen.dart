import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../modal_class/account_model.dart';
import 'book_list_screen.dart';
import 'add_account_screen.dart';

class AccountListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Accounts'),
      ),
      body: FutureBuilder(
        future: Hive.openBox<AccountModel>('accounts'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var accountsBox = Hive.box<AccountModel>('accounts');
            return ListView.builder(
              itemCount: accountsBox.length,
              itemBuilder: (context, index) {
                AccountModel account = accountsBox.getAt(index)!;
                return ListTile(
                  title: Text(account.name),
                  subtitle: Text(account.id),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookListScreen(account: account),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAccountScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
