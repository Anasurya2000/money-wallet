import 'package:get/get.dart';
import 'package:money_wallet/app/data/helper/storage_helper.dart';
import 'package:money_wallet/app/modules/login/views/add_amount_view.dart';

import '../modules/graph/bindings/graph_binding.dart';
import '../modules/graph/views/graph_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final bool isLogin = StorageHelper.isLogin;
  static final bool isAmountAdded = StorageHelper.isAmountAdded;

  static String initial = isLogin ? (isAmountAdded ? _Paths.home : _Paths.addAmount) : _Paths.login;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.root,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.graph,
      page: () => const GraphChart(),
      binding: GraphBinding(),
    ),
    GetPage(
      name: _Paths.addAmount,
      page: () => const AddAmount(),
    ),
  ];
}
