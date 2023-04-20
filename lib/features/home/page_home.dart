import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:koffiesoft_test/features/home/controller_home.dart';
import 'package:koffiesoft_test/shared/constants/colors.dart';
import 'package:koffiesoft_test/shared/constants/styles.dart';
import 'package:koffiesoft_test/shared/widgets/page_decoration_top.dart';

class PageHome extends GetView<ControllerHome> {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      centerTitle: true,
      backgroundColor: AppColor.bgColor,
      toolbarColor: AppColor.primaryColor,
      toolbarTitleColor: AppColor.whiteColor,
      enableBack: false,
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
      child: SafeArea(
        child: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColor.neutral.shade700,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                verticalSpace(12.h),
                Text(
                  controller.nama.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    color: AppColor.neutral.shade900,
                    fontWeight: FontWeight.bold,
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
