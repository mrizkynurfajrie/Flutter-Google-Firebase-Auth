import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koffiesoft_test/features/login/controller_login.dart';
import 'package:koffiesoft_test/routes/app_routes.dart';
import 'package:koffiesoft_test/shared/constants/colors.dart';
import 'package:koffiesoft_test/shared/constants/styles.dart';
import 'package:koffiesoft_test/shared/widgets/button_primary.dart';
import 'package:koffiesoft_test/shared/widgets/input_email.dart';
import 'package:koffiesoft_test/shared/widgets/input_password.dart';
import 'package:koffiesoft_test/shared/widgets/loading_indicator.dart';
import 'package:koffiesoft_test/shared/widgets/page_decoration_top.dart';

class PageLogin extends GetView<ControllerLogin> {
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      centerTitle: true,
      enableBack: false,
      toolbarColor: AppColor.primaryColor,
      toolbarTitleColor: AppColor.whiteColor,
      backgroundColor: AppColor.bgColor,
      center: const Center(
        child: Text(
          'KoffieSoft',
          style: TextStyle(
            fontSize: 18,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: SafeArea(
        child: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColor.neutral.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(6.h),
                Text(
                  'Welcome back! Login with your credentials',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.neutral.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpace(48.h),
                InputEmail(
                  controller: controller.textUsername,
                  isValid: (value) {},
                  email: (value) {},
                  label: 'Username',
                  hintText: 'Masukkan Username',
                  margin: EdgeInsets.only(top: 4.h),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  suffixIcon: Icon(
                    Icons.mail,
                    size: IconSizes.sm,
                    color: AppColor.primaryColor,
                  ),
                ),
                verticalSpace(16.h),
                InputPassword(
                  onChange: (value) {},
                  controller: controller.textPassword,
                  label: 'Password',
                  hintText: 'Masukkan Password',
                ),
                verticalSpace(36.h),
                controller.loading.isFalse
                    ? ButtonPrimary(
                        onPressed: () => controller.authenticationLogin(),
                        label: 'Login',
                        enable: controller.isValidForm.value,
                      )
                    : loadingIndicator(context),
                verticalSpace(12.h),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.neutral.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.neutral.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(
                                Routes.registerPage,
                              ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
