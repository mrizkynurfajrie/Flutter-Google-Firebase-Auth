import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koffiesoft_test/features/login/api_login.dart';
import 'package:koffiesoft_test/response/authentication.dart';
import 'package:koffiesoft_test/routes/app_routes.dart';
import 'package:koffiesoft_test/shared/helpers/regex.dart';
import 'package:koffiesoft_test/shared/widgets/show_dialog.dart';

class ControllerLogin extends GetxController {
  final ApiLogin api;
  ControllerLogin({required this.api});

  var authentication = Authentication().obs;

  var loading = false.obs;
  var textUsername = TextEditingController();
  var textPassword = TextEditingController();

  var isValidForm = false.obs;
  var validUsername = false.obs;
  var validPassword = false.obs;

  var tempUsername = ''.obs;
  var tempPassword = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    textUsername.text = Get.arguments ?? '';
    formValidationListener();
    super.onInit();
  }

  formValidationListener() {
    textUsername.addListener(() {
      validUsername.value = isValidNotEmpty(data: textUsername.text);
      validateForm();
    });
    textPassword.addListener(() {
      validPassword.value = isValidNotEmpty(data: textPassword.text);
      validateForm();
    });
  }

  validateForm() {
    isValidForm.value = validUsername.value && validPassword.value;
  }

  authenticationLogin() async {
    dismisKeyboard();
    loading.value = true;
    try {
      var r = await api.authentication(
        username: textUsername.text,
        password: textPassword.text,
      );
      log('result : $r');
      if (r["status"]["kode"] == "success") {
        log("success");
        var result = r["data"];
        authentication.value = Authentication.fromJson(result);
        showPopUp(
          dismissible: false,
          title: 'Success',
          description: "You're Success to Login",
          imageUri: CupertinoIcons.check_mark_circled_solid,
        );
        await Future.delayed(const Duration(seconds: 3));
        Get.back();
        Get.toNamed(
          Routes.homePage,
          arguments:
              authentication.value.firstname! + authentication.value.lastname!,
        );
      }
    } catch (e) {
      loading.value = false;
      print(e.toString());
    }
  }
}

dismisKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
