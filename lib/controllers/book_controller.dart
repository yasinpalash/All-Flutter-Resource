import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../modal_class/book_model.dart';

class BookController extends GetxController {
  var books = <BookModel>[].obs;

  void fetchBooks(String accountId) async {
    var booksBox = await Hive.openBox<BookModel>('books');
    books.assignAll(booksBox.values.where((book) => book.accountId == accountId).toList());
  }

  void addBook(BookModel book) async {
    var booksBox = Hive.box<BookModel>('books');
    await booksBox.add(book);
    fetchBooks(book.accountId!);
  }
}
