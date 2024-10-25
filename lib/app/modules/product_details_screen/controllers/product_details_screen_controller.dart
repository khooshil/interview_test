import 'dart:convert';

import 'package:get/get.dart';

import '../../../const/constant.dart';
import '../../product_list_screen/model/product_list_res_model.dart';
import 'package:http/http.dart' as http;
class ProductDetailsScreenController extends GetxController {
  var isLoading = false.obs;
  RxInt pIdData=0.obs;
  Rx<ProductListResModel> data=ProductListResModel().obs;
  // RxList<dynamic> dataList=List<dynamic>.empty().obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }
  getData() async {
    pIdData.value=Get.arguments["pId"];
    print("pId : ${pIdData.value}");
    await getProductDetailsList(pIdData.value) ;
  }
  Future<List<ProductListResModel>?> getProductDetailsList(int pId) async {
    try {
      final response = await http.get(
        Uri.parse("$productDetailsUrl/$pId"),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        data.value = ProductListResModel.fromJson(jsonDecode(response.body));
        print(data.value.title);
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