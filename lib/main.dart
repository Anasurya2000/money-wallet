import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_wallet/app/data/db/db_helper.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GetMaterialApp(
        title: "Money Wallet",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        theme: AppTheme.themeData,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
