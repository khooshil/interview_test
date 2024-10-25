import 'package:get/get.dart';
import '../modules/categories_screen/controllers/categories_screen_controller.dart';
import '../modules/login/controllers/login_controller.dart';
import '../modules/product_details_screen/controllers/product_details_screen_controller.dart';
import '../modules/product_list_screen/controllers/product_list_screen_controller.dart';
import '../modules/spalsh_screen/controllers/spalsh_screen_controller.dart';

class AllControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpalshScreenController>(
          () => SpalshScreenController(),
      fenix: true,
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut<CategoriesScreenController>(
          () => CategoriesScreenController(),
      fenix: true,
    );
    Get.lazyPut<ProductListScreenController>(
          () => ProductListScreenController(),
      fenix: true
    );
    Get.lazyPut<ProductDetailsScreenController>(
          () => ProductDetailsScreenController(),
        fenix: true
    );
  }
}
