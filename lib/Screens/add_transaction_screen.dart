import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transaction_controller.dart';
import '../modal_class/transaction_model.dart';

class AddTransactionScreen extends StatelessWidget {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final String bookId;
  final TransactionController transactionController = Get.find();

  AddTransactionScreen({required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: typeController,
              decoration: InputDecoration(labelText: 'Type (income/expense)'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                transactionController.addTransaction(TransactionModel(
                  bookId,
                  typeController.text,
                  double.parse(amountController.text),
                  DateTime.now(),
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
