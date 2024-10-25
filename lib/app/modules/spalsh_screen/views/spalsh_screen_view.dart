import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/spalsh_screen_controller.dart';

class SpalshScreenView extends GetView<SpalshScreenController> {
  const SpalshScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.isLoading == true ?Container(): const CircularProgressIndicator(),
    );
  }
}
