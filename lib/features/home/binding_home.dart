import 'package:get/get.dart';
import 'package:koffiesoft_test/features/home/controller_home.dart';

class BindingHome implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ControllerHome());
  }
}