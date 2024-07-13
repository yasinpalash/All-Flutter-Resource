import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modal_class/book_model.dart';
import 'add_book_screen.dart';
import 'book_detail_screen.dart';
import '../modal_class/account_model.dart';
import '../controllers/book_controller.dart';

class BookListScreen extends StatelessWidget {
  final AccountModel account;
  final BookController bookController = Get.find();

  BookListScreen({required this.account});

  @override
  Widget build(BuildContext context) {
    bookController.fetchBooks(account.id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${account.name}\'s Books'),
      ),
      body: Obx(() {
        if (bookController.books.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: bookController.books.length,
            itemBuilder: (context, index) {
              BookModel book = bookController.books[index];
              return ListTile(
                title: Text(book.name!),
                subtitle: Text(book.category!),
                onTap: () {
                  Get.to(() => BookDetailScreen(book: book));
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddBookScreen(accountId: account.id));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
