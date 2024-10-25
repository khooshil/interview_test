import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/product_list_screen_controller.dart';

class ProductListScreenView extends GetView<ProductListScreenController> {
  const ProductListScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(controller.catNameData.value ?? '',),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: controller.isLoading == true
          ? CircularProgressIndicator()
          : Obx(() {
        return Center(
          child: Container(
            child: ListView.separated(
              itemCount: controller.productListData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.PRODUCT_DETAILS_SCREEN, arguments: {
                      "pId": controller.productListData[index].id
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            Image.network(controller.productListData[index].image ?? '',height: 100,width: 100,fit: BoxFit.contain,),
                            SizedBox(width: 20,),
                            SizedBox(
                              width: Get.width * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(controller.productListData[index].title ?? '',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 5,),
                                  Text("price ${controller.productListData[index].price ?? ''}",
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w400,color: Colors.red),maxLines: 2,),
                                  SizedBox(height: 5,),
                                  Text("${controller.productListData[index].category ?? ''}",
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w400,color: Colors.lightBlue),maxLines: 2,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 5,);
            },
            ),
          ),
        );
      }),
    );

  }
}
