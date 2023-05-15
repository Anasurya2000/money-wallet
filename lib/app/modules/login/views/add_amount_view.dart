import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_constant.dart';
import '../../../routes/app_pages.dart';

class CatController extends GetxController {
  final RxList<String> _categoryList = <String>[
    'Salary',
    'Saving',
    'Credit',
  ].obs;

  List<String> get categoryList => _categoryList;

  final RxList<String> _selectedCategory = <String>[].obs;
  List<String> get selectedCategory => _selectedCategory;

  void addCategory(String category) {
    _categoryList.add(category);
  }

  void selectCategory(String category) {
    _selectedCategory.add(category);
  }

  void removeCategory(String category) {
    _selectedCategory.remove(category);
  }

  void clearCategory() {
    _selectedCategory.clear();
  }
}

class AddAmount extends StatefulWidget {
  const AddAmount({super.key});

  @override
  State<AddAmount> createState() => _AddAmountState();
}

class _AddAmountState extends State<AddAmount> {
  final categoryController = TextEditingController();
  final catController = Get.put(CatController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const userName = 'Anu';
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: AppConstant.defaultPadding,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Text.rich(
                      TextSpan(
                        text: 'Hello, ',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                        children: [
                          TextSpan(
                            text: userName,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'How much money do you have? 💵',
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '₹ ',
                        hintText: 'Please enter your amount',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Choose Category', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 10),
                    Text(
                      'Suggestions',
                      style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
                    ),
                    const SizedBox(height: 10),
                    Obx(() => Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                          catController.categoryList.length,
                          (index) => ChoiceChip(
                            label: Text(catController.categoryList[index]),
                            selected: catController.selectedCategory.contains(
                              catController.categoryList[index],
                            ),
                            onSelected: (value) {
                              if (value) {
                                catController.selectCategory(
                                  catController.categoryList[index],
                                );
                              } else {
                                catController.removeCategory(
                                  catController.categoryList[index],
                                );
                              }
                            },
                          ),
                        ))),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.keyboard_arrow_right),
          onPressed: () => Get.offAllNamed(Routes.home),
          label: const Text('Next')),
    );
  }

  Future<dynamic> addCategory(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            // height: 270,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Category',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: categoryController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.wallet,
                      color: Colors.black,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        child: const Text('Add'),
                        onPressed: () {
                          // Get.to(categoryController.text);
                          // Get.toNamed(Routes.home);
                          setState(() {
                            const AddAmount();
                            // categoryController.clear();
                            Get.back();
                          });
                          // categoryController.clear();
                        }),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
