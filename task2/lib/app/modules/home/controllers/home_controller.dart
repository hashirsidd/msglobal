import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxBool switchValue = false.obs;
  RxString repeatOftenVal = ''.obs;
  RxString repeatTimesVal = ''.obs;
  List<String> repeatOften = ['Every day', 'Every week', 'Every month'];
  List<String> repeatTimes = ['1', '2', '3'];

  final count = 0.obs;

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

  void increment() => count.value++;
}
