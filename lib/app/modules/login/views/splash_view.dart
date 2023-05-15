import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import '../../../constant/assets.dart';
import '../../../routes/app_pages.dart';

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
                    width: 250,
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
                SizedBox(
                  width: Get.width,
                  child: ConfirmationSlider(
                    text: 'Slide to continue',
                    textStyle: const TextStyle(color: Colors.black),
                    foregroundColor: Colors.black,
                    onConfirmation: () => Get.offAllNamed(Routes.login),
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
