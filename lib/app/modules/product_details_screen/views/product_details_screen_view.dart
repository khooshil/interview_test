import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_details_screen_controller.dart';

class ProductDetailsScreenView extends GetView<ProductDetailsScreenController> {
  const ProductDetailsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Obx(() {
          return Text(controller.data.value.title ?? '',style: TextStyle(fontSize: 16),maxLines: 1,overflow: TextOverflow.ellipsis,);
        }),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Obx(() {
            return Column(
              children: [
                SizedBox(height: 20,),
               ( controller.data.value.image ?? '').isEmpty  ? CircularProgressIndicator():Image.network( controller.data.value.image ?? '',height: 200,width: Get.width,fit: BoxFit.contain,),
                SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                 child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,children: [
                   Text(
                     controller.data.value.title ?? '',
                     style: TextStyle(fontSize: 20,color: Colors.black38),
                   ),
                   SizedBox(height: 10,),
                   Text(
                     "${ controller.data.value.category ?? ''}",
                     style: TextStyle(fontSize: 16,color: Colors.lightBlue),
                   ),
                   SizedBox(height: 10,),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [

                       Text(
                       "PRICE : ${ controller.data.value.price ?? ''}",
                         style: TextStyle(fontSize: 16,color: Colors.red),
                       ),
                       Text(
                         "Rating : ${ controller.data.value.rating?.rate ?? ''}",
                         style: TextStyle(fontSize: 16,color: Colors.red),
                       ),

                     ],
                   ),
                   SizedBox(height: 20,),
                   Text(
                     controller.data.value.description ?? '',
                     style: TextStyle(fontSize: 14),
                   ),
                 ],),
               )
              ],
            );
          }),
        ),
      ),
    );
  }
}
