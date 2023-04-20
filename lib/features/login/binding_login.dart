import 'package:get/get.dart';
import 'package:koffiesoft_test/features/login/api_login.dart';
import 'package:koffiesoft_test/features/login/controller_login.dart';

class BindingLogin implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ControllerLogin(api: ApiLogin()));
  }
}