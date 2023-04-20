import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koffiesoft_test/features/register/api_register.dart';
import 'package:koffiesoft_test/response/users.dart';
import 'package:koffiesoft_test/routes/app_routes.dart';
import 'package:koffiesoft_test/shared/widgets/show_dialog.dart';

class ControllerRegister extends GetxController {
  final ApiRegister api;
  ControllerRegister({required this.api});

  var users = Users().obs;

  var textEmail = TextEditingController();
  var textHp = TextEditingController();
  var textFirstname = TextEditingController();
  var textLastname = TextEditingController();
  var textTglLahir = TextEditingController();
  var textJeniskelamin = TextEditingController();
  var textPassword = TextEditingController();
  var strictPassword = false;
  var jenisKelamin = 1.obs;
  var loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onDispose() {
    textEmail.dispose();
    textHp.dispose();
    textFirstname.dispose();
    textLastname.dispose();
    textTglLahir.dispose();
    textJeniskelamin.dispose();
    textPassword.dispose();
    super.onClose();
  }

  signup() async {
    dismisKeyboard();
    loading.value = true;
    try {
      var r = await api.createUsers(
        email: textEmail.text,
        hp: textHp.text,
        firstname: textFirstname.text,
        lastname: textLastname.text,
        grup: "member",
        tglLahir: textTglLahir.text,
        jenisKelamin: jenisKelamin.value,
        password: textPassword.text,
        strictPassword: strictPassword,
      );
      log("result : $r");
      if (r["status"]["kode"] == "success") {
        var result = r["data"];
        users.value = Users.fromJson(result);
        showPopUp(
          title: 'Success',
          description: 'Your sign up success!',
          imageUri: CupertinoIcons.check_mark_circled_solid,
        );
        await Future.delayed(const Duration(seconds: 3));
        Get.back();
        Get.toNamed(
          Routes.loginPage,
          arguments: textEmail.text,
        );
      } else {
        showPopUp(
          dismissible: false,
          title: 'Failed',
          description: 'Email has registered!',
          imageUri: Icons.error,
        );
        await Future.delayed(const Duration(seconds: 2));
        Get.back();
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      print(e.toString());
    }
  }

  genderSelect(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: SizedBox(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(CupertinoIcons.person_fill,
                        color: Colors.blue),
                    title: const Text('Laki-Laki'),
                    onTap: () {
                      textJeniskelamin.text = 'Laki-Laki';
                      jenisKelamin.value = 1;
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(CupertinoIcons.person_fill,
                      color: Colors.pink),
                  title: const Text('Perempuan'),
                  onTap: () {
                    textJeniskelamin.text = 'Perempuan';
                    jenisKelamin.value = 2;
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ));
        });
  }
}

dismisKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
