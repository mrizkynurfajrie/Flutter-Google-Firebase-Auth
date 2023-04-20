import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koffiesoft_test/features/login/controller_login.dart';
import 'package:koffiesoft_test/shared/constants/colors.dart';
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
          'Login',
          style: TextStyle(
            fontSize: 18,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
