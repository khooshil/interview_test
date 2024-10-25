import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/constant.dart';
import '../model/product_list_res_model.dart';
class ProductListScreenController extends GetxController {
  var isLoading = false.obs;
  RxString catNameData="".obs;
  RxList<ProductListResModel> productListData=List<ProductListResModel>.empty(growable: false).obs;
  // RxList<dynamic> dataList=List<dynamic>.empty().obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }
  getData() async {
    catNameData.value=Get.arguments["catName"];
    print("cNm : ${catNameData.value}");
   await getProductList(catNameData.value) ;
  }
  Future<List<ProductListResModel>?> getProductList(String catName) async {
    try {
      print("$productUrl/$catName");
      final response = await http.get(
        Uri.parse("$productUrl/$catName"),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        List<dynamic> map = jsonDecode(response.body);
        for(int i=0;i<map.length;i++){
          productListData.add(ProductListResModel.fromJson(map[i]));
        }

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
