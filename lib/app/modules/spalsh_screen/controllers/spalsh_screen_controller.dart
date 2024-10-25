import 'package:get/get.dart';
import 'package:interview_task/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshScreenController extends GetxController {
  RxBool isLoading=true.obs;
  RxBool isLogin=false.obs;

  @override
  void onInit() {
    print("object");
    getIsLoginData();
    super.onInit();
  }
  getIsLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLoginData= prefs.getBool("isLogin");
    isLogin.value=isLoginData ?? false;
    print("is login ${isLoginData}");
    Future.delayed(Duration(milliseconds: 2), () {
      if(isLogin.value==true){
        Get.offAndToNamed(Routes.CATEGORIES_SCREEN);
      }else{
        Get.offAndToNamed(Routes.LOGIN);
      }
    });

  }
}