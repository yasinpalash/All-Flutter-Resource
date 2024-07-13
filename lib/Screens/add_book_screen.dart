import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modal_class/book_model.dart';
import '../controllers/book_controller.dart';

class AddBookScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final String accountId;
  final BookController bookController = Get.find();

  AddBookScreen({required this.accountId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
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
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                bookController.addBook(BookModel(
                  nameController.text,
                  idController.text,
                  categoryController.text,
                  accountId,
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
