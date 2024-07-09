import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../modal_class/book_model.dart';
import 'add_book_screen.dart';
import 'book_detail_screen.dart';
import '../modal_class/account_model.dart';

class BookListScreen extends StatelessWidget {
  final AccountModel account;

  BookListScreen({required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${account.name}\'s Books'),
      ),
      body: FutureBuilder(
        future: Hive.openBox<BookModel>('books'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var booksBox = Hive.box<BookModel>('books');
            var accountBooks = booksBox.values.where((book) => book.accountId == account.id).toList();
            return ListView.builder(
              itemCount: accountBooks.length,
              itemBuilder: (context, index) {
                BookModel book = accountBooks[index];
                return ListTile(
                  title: Text(book.name ?? 'No Name'),
                  subtitle: Text(book.category ?? 'No Category'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailScreen(book),
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
            MaterialPageRoute(
              builder: (context) => AddBookScreen(accountId: account.id!),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
