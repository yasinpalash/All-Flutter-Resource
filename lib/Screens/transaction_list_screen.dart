import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modal_class/transaction_model.dart';
import '../controllers/transaction_controller.dart';

class TransactionListScreen extends StatelessWidget {
  final TransactionController transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
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
    );
  }
}
