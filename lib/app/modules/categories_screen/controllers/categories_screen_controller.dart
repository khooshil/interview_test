import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:interview_task/app/const/constant.dart';
class CategoriesScreenController extends GetxController {
  var isLoading = false.obs;
  RxList<String> allCategoriesList= List<String>.empty().obs;
  @override
  void onInit() {
    getALLCategories();
    super.onInit();
  }
  Future<void> getALLCategories() async {
    try {
      final response = await http.get(
        Uri.parse(allCategoriesUrl),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        var data=List<String>.from(jsonDecode(response.body));
        allCategoriesList.addAll(data);
      } else {
          Get.snackbar("",response.body,snackPosition: SnackPosition.BOTTOM,);
        print("Error: ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      isLoading(false); // Reset loading state
    }
  }
}