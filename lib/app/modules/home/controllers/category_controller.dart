import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_wallet/app/data/db/db_helper.dart';
import 'package:money_wallet/app/data/model/category.dart';

class CategoryController extends GetxController {

  final categoryFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  final RxList<Category> _category = <Category>[].obs;
  List<Category> get category => _category;

  Future<void> createCategory(Category category) async {
    await DbHelper.instance.insertCategory(category);
    getCategory();
  }

  Future<void> updateCategory(Category category) async {
    await DbHelper.instance.updateCategory(category);
  }

  getCategory() async {
    final category = await DbHelper.instance.getCategory();
    if (category != null) {
      _category.value = category;
    }
  }

  final List<Category> suggestions = <Category>[
    Category(name: 'Salary', type: 'income'),
    Category(name: 'Saving', type: 'income'),
    Category(name: 'Credit', type: 'income'),
    Category(name: 'Food', type: 'expense'),
    Category(name: 'Transport', type: 'expense'),
    Category(name: 'Shopping', type: 'expense'),
    Category(name: 'Entertainment', type: 'expense'),
    Category(name: 'Health', type: 'expense'),
    Category(name: 'Education', type: 'expense'),
    Category(name: 'Gift', type: 'expense'),
    Category(name: 'Other', type: 'expense'),
  ];

  addDummyCategory() async {
    getCategory();
    for (final Category item in suggestions) {
      final bool isExist = category.any((element) => element.name == item.name);
      if (!isExist) {
        await createCategory(item);
      }
    }
    getCategory();
  }

  List<Category> getCategoryByType(String type) {
    final List<Category> category = _category.where((element) => element.type == type).toList();
    return category;
  }

  List<Category> incomeCategory() {
    return getCategoryByType('income');
  }

  List<Category> expenseCategory() {
    return getCategoryByType('expense');
  }

  final Rx<Category> _selectedCategory = Category(name: 'Salary', type: 'income').obs;
  Category get selectedCategory => _selectedCategory.value;
  set selectedCategory(Category value) => _selectedCategory.value = value;

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }
}
