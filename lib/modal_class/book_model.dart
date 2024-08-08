import 'package:hive/hive.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? id;

  @HiveField(2)
  String? category;

  @HiveField(3)
  String? accountId;

  BookModel(this.name, this.id, this.category, this.accountId);
}
