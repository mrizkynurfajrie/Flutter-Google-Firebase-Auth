import 'package:get/get.dart';
import 'package:koffiesoft_test/features/register/api_register.dart';
import 'package:koffiesoft_test/features/register/controller_register.dart';

class BindingRegister implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ControllerRegister(api: ApiRegister()));
  }
}