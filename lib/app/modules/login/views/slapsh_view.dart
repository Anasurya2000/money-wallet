import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import '../../../constant/assets.dart';
import '../../../routes/app_pages.dart';

class SlapshScreen extends StatelessWidget {
  const SlapshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
                const Spacer(),
                Center(
                  child: Image.asset(
                    Assets.logo,
                    width: 275,
                    // height: 150,
                  ),
                ),
                const Spacer(),
                Text(
                  'Money Wallet',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 15),
                Text(
                  'One App for all your finances',
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: Get.width,
                  child: ConfirmationSlider(
                    text: 'Slide to  Start',
                    textStyle: const TextStyle(color: Colors.black),
                    foregroundColor: theme.colorScheme.primary,
                    onConfirmation: () => Get.offAllNamed(Routes.login),
                    // onTapUp: () => Get.to(const HomeView()),
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
