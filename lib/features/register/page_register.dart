import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koffiesoft_test/features/register/controller_register.dart';
import 'package:koffiesoft_test/shared/constants/colors.dart';
import 'package:koffiesoft_test/shared/widgets/page_decoration_top.dart';

class PageRegister extends GetView<ControllerRegister> {
  const PageRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      centerTitle: true,
      toolbarColor: AppColor.primaryColor,
      toolbarTitleColor: AppColor.whiteColor,
      backgroundColor: AppColor.bgColor,
      center:  const Center(
        child: Text(
          'Register',
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
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
