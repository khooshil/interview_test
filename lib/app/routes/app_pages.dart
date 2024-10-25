import 'package:get/get.dart';

import '../modules/categories_screen/views/categories_screen_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/product_details_screen/views/product_details_screen_view.dart';
import '../modules/product_list_screen/views/product_list_screen_view.dart';
import '../modules/spalsh_screen/views/spalsh_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPALSH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: _Paths.SPALSH_SCREEN,
      page: () => const SpalshScreenView(),
    ),
    GetPage(
      name: _Paths.CATEGORIES_SCREEN,
      page: () => const CategoriesScreenView(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST_SCREEN,
      page: () => const ProductListScreenView(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS_SCREEN,
      page: () => const ProductDetailsScreenView(),
    ),
  ];
}
