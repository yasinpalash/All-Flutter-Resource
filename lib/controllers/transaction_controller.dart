import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../modal_class/transaction_model.dart';

class TransactionController extends GetxController {
  var transactions = <TransactionModel>[].obs;

  void fetchTransactions(String bookId) async {
    var transactionsBox = await Hive.openBox<TransactionModel>('transactions');
    transactions.assignAll(transactionsBox.values.where((t) => t.bookId == bookId).toList());
  }

  void addTransaction(TransactionModel transaction) async {
    var transactionsBox = Hive.box<TransactionModel>('transactions');
    await transactionsBox.add(transaction);
    fetchTransactions(transaction.bookId);
  }
}
