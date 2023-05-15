import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import '../../../constant/app_constant.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    child: Form(
                      key: _formKey,
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
                            controller: controller.nameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              hintText: 'Enter your name',
                              icon: Icon(FeatherIcons.user),
                            ),
                          ),
                          const SizedBox(height: 55),
                          const Spacer(),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                await controller.createUser();
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
              ),
            );
          },
        ),
      ),
    );
  }
}
