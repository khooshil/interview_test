import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:interview_task/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/categories_screen_controller.dart';

class CategoriesScreenView extends GetView<CategoriesScreenController> {
  const CategoriesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 20,),
            const Text(
              'Categories', style: TextStyle(fontSize: 24, color: Colors.black38),),
            GestureDetector(onTap: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Get.toNamed(Routes.LOGIN);
            },child: Icon(Icons.logout))
          ],
        ),
        centerTitle: true,
        elevation: 2,
      ),

      backgroundColor: Colors.white,
      body: controller.isLoading == true
          ? CircularProgressIndicator()
          : Obx(() {
        return Center(
          child: Container(
            child: ListView.separated(
              itemCount: controller.allCategoriesList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.PRODUCT_LIST_SCREEN, arguments: {
                      "catName": controller.allCategoriesList[index]
                    });
                  },
                  child: Container(
                    width: Get.width,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(controller.allCategoriesList[index],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),),
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
