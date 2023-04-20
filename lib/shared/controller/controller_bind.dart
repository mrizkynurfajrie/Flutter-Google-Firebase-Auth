import 'package:get/get.dart';
import 'package:koffiesoft_test/features/home/controller_home.dart';
import 'package:koffiesoft_test/features/login/api_login.dart';
import 'package:koffiesoft_test/features/login/controller_login.dart';
import 'package:koffiesoft_test/features/register/api_register.dart';
import 'package:koffiesoft_test/features/register/controller_register.dart';

class ControllerBind implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ControllerRegister(api: ApiRegister()));
    Get.put(ControllerLogin(api: ApiLogin()));
    // Get.put(ControllerHome());
  }
}