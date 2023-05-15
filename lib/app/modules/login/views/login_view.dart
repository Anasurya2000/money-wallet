import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_constant.dart';
import '../controllers/login_controller.dart';
import 'add_amount_view.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final theme = Theme.of(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
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
                        'Hi Welcome to Money Management',
                        style: theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Here you can track your Expenses easliy',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 55),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          labelText: 'Name',
                          hintText: 'Enter your name',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                      const SizedBox(height: 55),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          // gradient: LinearGradient(
                          //   colors: [
                          //     theme.colorScheme.primary,
                          //     theme.colorScheme.secondary,
                          //   ],
                          //   begin: Alignment.topCenter,
                          //   end: Alignment.bottomCenter,
                          // ),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: theme.colorScheme.primary,
                            width: 0.5,
                          ),
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              side: BorderSide.none,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => Get.to(() => const AddAmount()),
                            label: const Text(
                              'Next',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 55),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
