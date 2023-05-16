import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:money_wallet/app/data/model/category.dart';
import 'package:money_wallet/app/data/model/transaction.dart';
import 'package:money_wallet/app/modules/home/controllers/category_controller.dart';
import 'package:money_wallet/app/modules/login/controllers/login_controller.dart';

import '../../../constant/app_constant.dart';

class AddAmount extends StatefulWidget {
  const AddAmount({super.key});

  @override
  State<AddAmount> createState() => _AddAmountState();
}

class _AddAmountState extends State<AddAmount> {
  final amountController = TextEditingController();
  final controller = Get.put(CategoryController());
  final LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    loginController.getUser();
    controller.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                    Obx(() => Text.rich(
                          TextSpan(
                            text: 'Hello, ',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                            children: [
                              TextSpan(
                                text: loginController.user.name,
                                style: theme.textTheme.headlineMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 5),
                    Text(
                      'How much money do you have? 💵',
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '₹ ',
                        hintText: 'Please enter your amount',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Choose Category', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 10),
                    Obx(() => Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: [
                            ...controller.incomeCategory().map((e) => FilterChip(
                                  label: Text(e.name.toString()),
                                  selected: controller.selectedCategory.name == e.name,
                                  onSelected: (value) => controller.selectedCategory = e,
                                )),
                            ChoiceChip(
                              avatar: const Icon(Icons.add, color: Colors.white),
                              label: const Text('Create new category'),
                              selected: false,
                              onSelected: (value) => addCategory(context),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(FeatherIcons.check, size: 16),
        onPressed: () {
          if (amountController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please enter the amount to continue'),
              ),
            );
            return;
          }
          final Transactions transaction = Transactions(
            amount: double.parse(amountController.text),
            isIncome: true,
            categoryId: controller.selectedCategory.id,
            date: DateTime.now(),
            createAt: DateTime.now(),
          );
          print(transaction.toMap());
        },
        label: const Text('Add my amount'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
    );
  }

  Future<void> addCategory(BuildContext context) async {
    showBarModalBottomSheet(
      context: context,
      builder: (_) => const _AddNewCategory(),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
    );
  }
}

class _AddNewCategory extends StatelessWidget {
  const _AddNewCategory();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.put(CategoryController());
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: AppConstant.defaultPadding,
        child: Form(
          key: controller.categoryFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Add new category', style: theme.textTheme.titleLarge),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(FeatherIcons.x),
                  ),
                ],
              ),
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(hintText: 'Enter category name'),
                validator: (value) => value!.isEmpty ? 'Please enter category name' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (controller.categoryFormKey.currentState!.validate()) {
                    final category = Category(name: controller.nameController.text, type: 'income');
                    controller.createCategory(category);
                    Get.back();
                  }
                },
                child: const Text('Add category'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
