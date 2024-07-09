import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../modal_class/book_model.dart';
import '../modal_class/transaction_model.dart';
import 'add_transaction_screen.dart';

class BookDetailScreen extends StatelessWidget {
  final BookModel book;

  BookDetailScreen(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name ?? 'No Name'),
      ),
      body: FutureBuilder(
        future: Hive.openBox<TransactionModel>('transactions'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var transactionsBox = Hive.box<TransactionModel>('transactions');
            var bookTransactions = transactionsBox.values.where((t) => t.bookId == book.id).toList();
            return ListView.builder(
              itemCount: bookTransactions.length,
              itemBuilder: (context, index) {
                TransactionModel transaction = bookTransactions[index];
                return ListTile(
                  title: Text('${transaction.type}: \$${transaction.amount.toStringAsFixed(2)}'),
                  subtitle: Text(transaction.date.toString()),
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
              builder: (context) => AddTransactionScreen(bookId: book.id ?? ''),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
