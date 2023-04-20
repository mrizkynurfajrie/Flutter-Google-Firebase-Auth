import 'package:get/get.dart';

class ControllerHome extends GetxController {
  var nama = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    nama.value = Get.arguments;
    super.onInit();
  }
}
