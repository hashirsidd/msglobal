import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:msglobal/app/routes/app_pages.dart';
class AuthenticationController extends GetxController {
   TextEditingController passwordController = TextEditingController();
   TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  goToAuth(){
    Future.delayed(Duration(seconds: 2),(){
      Get.offNamed(Routes.AUTHENTICATION);
    });
  }
}
