import 'package:get/get.dart';
import 'package:money_wallet/app/data/db/db_helper.dart';
import 'package:money_wallet/app/data/model/category.dart';

class CategoryController extends GetxController {
  final RxList<Category> _category = <Category>[].obs;
  List<Category> get category => _category;

  Future<void> createCategory(Category category) async {
    final category = Category();
    await DbHelper.instance.insertCategory(category);
  }

  Future<void> updateCategory(Category category) async {
    final category = Category();
    await DbHelper.instance.updateCategory(category);
  }

  getCategory() async {
    final category = await DbHelper.instance.getCategory();
    _category.value = category;
  }

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }
}
