import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parentcontroller/app/routes/app_pages.dart';

import '../../../constant/appconstant.dart';

class totalexpenses extends StatefulWidget {
  const totalexpenses({super.key});

  @override
  State<totalexpenses> createState() => _totalexpensesState();
}

class _totalexpensesState extends State<totalexpenses> {
  final categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              IntrinsicHeight(
                child: Padding(
                  padding: AppConstant.defaultPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Total Expenses',
                        style: theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Here you can track your Expenses easliy',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 55),
                      const Text('Amount'),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),

                          hintText: '₹',
                          hintStyle: TextStyle(color: Colors.black),
                          // prefixText: '₹',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                      const SizedBox(height: 55),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FilterChip(
                            label: const Text('Cash'),
                            onSelected: (value) {},
                          ),
                          FilterChip(
                            label: const Text('Bank'),
                            onSelected: (value) {},
                          ),
                          FilterChip(
                            label: const Text('Salary'),
                            onSelected: (value) {},
                          ),
                          FilterChip(
                            label: const Text('Credit'),
                            onSelected: (value) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: theme.colorScheme.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(
                                children: [
                                  Text(
                                    '+',
                                    style: TextStyle(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  Text(
                                    'Add Category',
                                    style: TextStyle(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () => addCategory(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Text(
                      //   categoryController.text,
                      //   style: const TextStyle(color: Colors.white),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.keyboard_arrow_right), onPressed: () => Get.offAllNamed(Routes.home), label: const Text('Next')),
    );
  }

  Future<dynamic> addCategory(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext) {
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
                          // setState(() {
                          const Categoriestype();
                          // categoryController.clear();
                          // Get.back();
                          // categoryController.clear();
                          // });
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

class Categoriestype extends StatefulWidget {
  const Categoriestype({super.key});

  @override
  State<Categoriestype> createState() => _CategoriestypeState();
}

class _CategoriestypeState extends State<Categoriestype> {
  final categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 13),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Expenses Title ',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(categoryController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
