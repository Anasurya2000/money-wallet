import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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
      body: SafeArea(
        child: LayoutBuilder(
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
                          'Hello,',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Welcome to Money Wallet',
                          style: theme.textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'What should we call you?',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Enter your name',
                            icon: Icon(FeatherIcons.user),
                          ),
                        ),
                        const SizedBox(height: 55),
                        const Spacer(),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: theme.colorScheme.primary,
                        //     // gradient: LinearGradient(
                        //     //   colors: [
                        //     //     theme.colorScheme.primary,
                        //     //     theme.colorScheme.secondary,
                        //     //   ],
                        //     //   begin: Alignment.topCenter,
                        //     //   end: Alignment.bottomCenter,
                        //     // ),
                        //     borderRadius: BorderRadius.circular(30),
                        //     border: Border.all(
                        //       color: theme.colorScheme.primary,
                        //       width: 0.5,
                        //     ),
                        //   ),
                        //   child: Directionality(
                        //     textDirection: TextDirection.rtl,
                        //     child: OutlinedButton.icon(
                        //       style: OutlinedButton.styleFrom(
                        //         minimumSize: const Size.fromHeight(50),
                        //         side: BorderSide.none,
                        //         foregroundColor: Colors.white,
                        //       ),
                        //       onPressed: () => Get.to(() => const AddAmount()),
                        //       label: const Text(
                        //         'Next',
                        //         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        //       ),
                        //       icon: const Icon(
                        //         Icons.arrow_back,
                        //         color: Colors.black,
                        //         size: 20,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Get.to(() => const AddAmount());
                            },
                            label: const Text('Next'),
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 20,
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
      ),
    );
  }
}
