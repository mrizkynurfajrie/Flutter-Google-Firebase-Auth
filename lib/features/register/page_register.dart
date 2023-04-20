import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koffiesoft_test/features/register/controller_register.dart';
import 'package:koffiesoft_test/shared/constants/colors.dart';
import 'package:koffiesoft_test/shared/constants/styles.dart';
import 'package:koffiesoft_test/shared/widgets/button_primary.dart';
import 'package:koffiesoft_test/shared/widgets/input_date.dart';
import 'package:koffiesoft_test/shared/widgets/input_email.dart';
import 'package:koffiesoft_test/shared/widgets/input_gender.dart';
import 'package:koffiesoft_test/shared/widgets/input_password.dart';
import 'package:koffiesoft_test/shared/widgets/input_primary.dart';
import 'package:koffiesoft_test/shared/widgets/page_decoration_top.dart';

class PageRegister extends GetView<ControllerRegister> {
  const PageRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      centerTitle: true,
      resizeAvoidBottom: true,
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
      enableBack: false,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(14.h),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 28,
                      color: AppColor.neutral.shade800,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(6.h),
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.neutral.shade800,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  verticalSpace(24.h),
                  InputEmail(
                    controller: controller.textEmail,
                    isValid: (value) {},
                    email: (value) {},
                    label: 'E-mail',
                    hintText: 'Masukkan E-Mail',
                    margin: EdgeInsets.only(top: 4.h),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                  ),
                  verticalSpace(6.h),
                  InputPrimary(
                    controller: controller.textHp,
                    label: 'Nomor HP',
                    hintText: 'Masukkan Nomor HP',
                    margin: EdgeInsets.only(top: 4.h),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    onTap: () {},
                  ),
                  verticalSpace(6.h),
                  InputPrimary(
                    controller: controller.textFirstname,
                    label: 'Nama Depan',
                    hintText: 'Masukkan Nama Depan',
                    margin: EdgeInsets.only(top: 4.h),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    onTap: () {},
                  ),
                  verticalSpace(6.h),
                  InputPrimary(
                    controller: controller.textLastname,
                    label: 'Nama Belakang',
                    hintText: 'Masukkan Nama Belakang',
                    margin: EdgeInsets.only(top: 4.h),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    onTap: () {},
                  ),
                  verticalSpace(6.h),
                  InputDate(
                    controller: controller.textTglLahir,
                    label: 'Tanggal Lahir',
                    selectedDate: (value) {},
                    isValid: (value) {},
                    boxWidth: Get.width,
                    margin: EdgeInsets.only(top: 4.h),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                  ),
                  verticalSpace(6.h),
                  InputGender(
                    controller: controller.textJeniskelamin,
                    label: 'Jenis Kelamin',
                    hintText: 'Pilih Jenis Kelamin',
                    margin: EdgeInsets.only(top: 4.h),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    onTap: () => controller.genderSelect(context),
                  ),
                  verticalSpace(6.h),
                  InputPassword(
                    onChange: (value) {},
                    controller: controller.textPassword,
                    label: 'Password',
                    hintText: 'Masukkan Password',
                  ),
                  verticalSpace(48.h),
                  controller.loading.isFalse
                      ? ButtonPrimary(
                          onPressed: () => controller.signup(),
                          label: 'Sign Up',
                        )
                      : const CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
