import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modal_class/book_model.dart';
import '../modal_class/transaction_model.dart';
import 'add_transaction_screen.dart';
import '../controllers/transaction_controller.dart';

class BookDetailScreen extends StatelessWidget {
  final BookModel book;
  final TransactionController transactionController = Get.find();

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    transactionController.fetchTransactions(book.id!);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.name!),
      ),
      body: Obx(() {
        if (transactionController.transactions.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: transactionController.transactions.length,
            itemBuilder: (context, index) {
              TransactionModel transaction = transactionController.transactions[index];
              return ListTile(
                title: Text('${transaction.type}: \$${transaction.amount.toStringAsFixed(2)}'),
                subtitle: Text(transaction.date.toString()),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTransactionScreen(bookId: book.id!));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
