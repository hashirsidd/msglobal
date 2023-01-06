import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class Splash extends GetView<AuthenticationController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.goToAuth();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/splash.jpg'),
      ),
    );
  }
}
