import 'package:get/get.dart';

import '../modules/graph/bindings/graph_binding.dart';
import '../modules/graph/views/graph_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/views/slapsh_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.root;

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
    GetPage(name: _Paths.root, page: () => const SlapshScreen()),
    GetPage(
      name: _Paths.graph,
      page: () => const Graphchat(),
      binding: GraphBinding(),
    ),
  ];
}
