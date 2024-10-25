import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login Screen", style: TextStyle(fontSize: 24),),
              const SizedBox(height: 40),
               TextField(
                controller: controller.emailTextEditingController,
                decoration: const InputDecoration(labelText: 'Username'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
               TextField(
                controller: controller.psdTextEditingController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
               const SizedBox(height: 40),

            controller.isLoading.value
                  ? const CircularProgressIndicator() // Show loading indicator
                  : ElevatedButton(
                onPressed: () {
                  String username = controller.emailTextEditingController.text;
                  String password = controller.psdTextEditingController.text;
                  controller.login(username, password);
                },
                child: Text("Login"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}