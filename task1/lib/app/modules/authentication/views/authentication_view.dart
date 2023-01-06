import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash.jpg',
                height: 150,
              ),
              AuthTextField(isPasswordField: false, hintText: 'Email', controller: controller.emailController),
              SizedBox(height: 20),
              AuthTextField(isPasswordField: true, hintText: 'Password', controller: controller.passwordController),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.offAllNamed(Routes.HOME),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthTextField extends StatelessWidget {
  AuthTextField({required this.controller, required this.isPasswordField, required this.hintText});

  TextEditingController controller;
  bool isPasswordField;
  String hintText;
  RxBool obscure = false.obs;

  @override
  Widget build(BuildContext context) {
    obscure.value = isPasswordField;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.withOpacity(0.1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Obx(() => TextField(
                controller: controller,
                obscureText: obscure.value,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  helperStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                ))),
          ),
          isPasswordField
              ? GestureDetector(
                  onTap: () {
                    obscure.value = !obscure.value;
                  },
                  child: Image.asset(
                    'assets/images/eye.png',
                    height: 15,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
