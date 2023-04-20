import 'package:get/get.dart';
import 'package:koffiesoft_test/features/home/binding_home.dart';
import 'package:koffiesoft_test/features/home/page_home.dart';
import 'package:koffiesoft_test/features/login/binding_login.dart';
import 'package:koffiesoft_test/features/login/page_login.dart';
import 'package:koffiesoft_test/features/register/binding_register.dart';
import 'package:koffiesoft_test/features/register/page_register.dart';
import 'package:koffiesoft_test/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.registerPage,
      page: () => const PageRegister(),
      binding: BindingRegister(),
      transition: Transition.fadeIn
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => const PageLogin(),
      binding: BindingLogin(),
      transition: Transition.fadeIn
    ),
    GetPage(
      name: Routes.homePage,
      page: () => const PageHome(),
      binding: BindingHome(),
      transition: Transition.fadeIn
    ),
  ];
}
