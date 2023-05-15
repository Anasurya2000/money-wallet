import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_constant.dart';
import '../../../routes/app_pages.dart';

class AddAmount extends StatefulWidget {
  const AddAmount({super.key});

  @override
  State<AddAmount> createState() => _AddAmountState();
}

class _AddAmountState extends State<AddAmount> {
  final categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const userName = 'Anu';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppConstant.defaultPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Padding(
                    padding: AppConstant.defaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        const SizedBox(height: 55),
                        Wrap(
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
                        Text(
                          categoryController.text,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
