import 'package:get/get.dart';
import 'package:money_wallet/app/data/db/db_helper.dart';
import 'package:money_wallet/app/data/model/transaction.dart';

class TransactionsController extends GetxController {
  final RxList<Transactions> _transactions = <Transactions>[].obs;
  List<Transactions> get transactions => _transactions;

  Future<void> createTransactions(Transactions transactions) async {
    final transactions = Transactions();
    await DbHelper.instance.insertTransactions(transactions);
  }

  Future<void> updateTransactions(Transactions transactions) async {
    final transactions = Transactions();
    await DbHelper.instance.updateTransactions(transactions);
  }

  getTransactions() async {
    final transactions = await DbHelper.instance.getTransactions();
    _transactions.value = transactions;
  }

  @override
  void onInit() {
    getTransactions();
    super.onInit();
  }
}
