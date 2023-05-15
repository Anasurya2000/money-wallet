import 'package:get/get.dart';
import 'package:money_wallet/app/data/db/db_helper.dart';
import 'package:money_wallet/app/data/model/user.dart';

class LoginController extends GetxController {
  final Rx<User> _user = User().obs;
  User get user => _user.value;

  Future<void> createUser(String name) async {
    final user = User(name: name);
    await DbHelper.instance.insertUser(user);
  }

  Future<void> updateUser(User user) async {
    final user = User();
    await DbHelper.instance.updateUser(user);
  }

  getUser() async {
    final user = await DbHelper.instance.getUser();
    _user.value = user;
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
