import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:koffiesoft_test/features/register/api_register.dart';

class ControllerRegister extends GetxController {
  final ApiRegister api;
  ControllerRegister({required this.api});

  var textEmail = TextEditingController();
  var textHp = TextEditingController();
  var textFirstname = TextEditingController();
  var textLastname = TextEditingController();
  var textTglLahir = TextEditingController();
  var textPassword = TextEditingController();
  var strictPassword = false;
  var jenisKelamin = 1;
}