import 'package:hive/hive.dart';

part 'account_model.g.dart';

@HiveType(typeId: 2)
class AccountModel extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String id;

  AccountModel(this.name, this.id);
}
