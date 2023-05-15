import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_wallet/app/routes/app_pages.dart';

import '../../../constant/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Money Wallet',
                  style: theme.textTheme.headlineSmall,
                ),
                const Spacer(),
                const SizedBox(height: 60),
                Center(
                  child: Image.asset(
                    Assets.logo,
                    width: 230,
                  ),
                ),
                const SizedBox(height: 15),
                const Spacer(),
                Text(
                  'Welcome',
                  style: theme.textTheme.headlineSmall,
                ),
                Text(
                  'Manage your money with ease and simplicity with Money Wallet.',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 30),
                Center(
                  child: ActionSlider.standard(
                    action: (controller) async {
                      controller.loading();
                      await Future.delayed(const Duration(seconds: 2));
                      controller.success();
                      await Future.delayed(const Duration(seconds: 1));
                      Get.offAllNamed(Routes.login);
                    },
                    backgroundColor: Colors.white,
                    child: const Text(
                      'Slide to continue',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
