import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/constant.dart';
import '../../../routes/app_pages.dart';
import '../model/login_req_model.dart';
import '../model/login_res_model.dart';
class LoginController extends GetxController {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController psdTextEditingController = TextEditingController();

  var isLoading = false.obs;
  var token = "".obs;

  Future<void> login(String username, String password) async {
    isLoading.value=true;

    var requestBody=LoginReqModel(
      username: username,
      password: password
    );

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        var res = LoginResModel.fromJson(json.decode(response.body));
        token.value = res.token ?? '';
        print("Token: ${token.value}");
        print(response.body);
        Get.snackbar("","Login successfully",snackPosition: SnackPosition.BOTTOM,);
        // Get.toNamed();
      } else {
        if(username.isEmpty && password.isEmpty){
          Get.snackbar("","please enter valid username and password",snackPosition: SnackPosition.BOTTOM,);
        }else{
          Get.snackbar("",response.body,snackPosition: SnackPosition.BOTTOM,);
        }
        print("Error: ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      isLoading(false); // Reset loading state
    }
  }
}