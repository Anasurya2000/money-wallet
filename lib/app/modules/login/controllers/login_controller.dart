import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_wallet/app/data/db/db_helper.dart';
import 'package:money_wallet/app/data/model/user.dart';

import '../views/add_amount_view.dart';

class LoginController extends GetxController {
  final nameController = TextEditingController();

  final Rx<User> _user = User().obs;
  User get user => _user.value;

  Future<void> createUser() async {
    final user = User(
      name: nameController.text,
      createAt: DateTime.now(),
      updateAt: DateTime.now(),
    );
    await DbHelper.instance.insertUser(user).then((_) => Get.to(() => const AddAmount()));
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
    //getUser();
    super.onInit();
  }
}
