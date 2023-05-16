import 'package:get/get.dart';
import 'package:money_wallet/app/data/db/db_helper.dart';
import 'package:money_wallet/app/data/model/category.dart';

class CategoryController extends GetxController {
  final RxList<Category> _category = <Category>[].obs;
  List<Category> get category => _category;

  Future<void> createCategory(Category category) async {
    await DbHelper.instance.insertCategory(category);
  }

  Future<void> updateCategory(Category category) async {
    await DbHelper.instance.updateCategory(category);
  }

  getCategory() async {
    final category = await DbHelper.instance.getCategory();
    _category.value = category;
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
    final List<Category> category = await getCategory();
    if (category.isEmpty) {
      for (final category in suggestions) {
        await createCategory(category);
      }
    }
  }

  @override
  void onInit() {
    getCategory();
    addDummyCategory();
    super.onInit();
  }
}
