import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../modal_class/account_model.dart';

class AccountController extends GetxController {
  var accounts = <AccountModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAccounts();
  }

  void fetchAccounts() async {
    var accountsBox = await Hive.openBox<AccountModel>('accounts');
    accounts.assignAll(accountsBox.values.toList());
  }

  void addAccount(AccountModel account) async {
    var accountsBox = Hive.box<AccountModel>('accounts');
    await accountsBox.add(account);
    fetchAccounts();
  }
}
