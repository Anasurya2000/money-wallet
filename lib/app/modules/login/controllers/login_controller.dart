import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_wallet/app/data/db/db_helper.dart';
import 'package:money_wallet/app/data/helper/storage_helper.dart';
import 'package:money_wallet/app/data/model/user.dart';
import 'package:money_wallet/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final nameController = TextEditingController();

  final Rx<User> _user = User().obs;
  User get user => _user.value;

  Future<void> createUser() async {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your name');
      return;
    }
    final user = User(name: nameController.text);
    await DbHelper.instance.insertUser(user).then((_) {
      StorageHelper.isLogin = true;
      Get.toNamed(Routes.addAmount);
    });
  }

  Future<void> updateUser(User user) async {
    await DbHelper.instance.updateUser(user);
  }

  getUser() async {
    final user = await DbHelper.instance.getUser();
    _user.value = user;
  }
}
