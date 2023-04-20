import 'package:flutter/material.dart';
import 'package:koffiesoft_test/shared/constants/colors.dart';
import 'package:koffiesoft_test/shared/widgets/page_decoration_top.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      centerTitle: true,
      backgroundColor: AppColor.bgColor,
      toolbarColor: AppColor.primaryColor,
      toolbarTitleColor: AppColor.whiteColor,
      center:  const Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontSize: 18,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              fontSize: 24,
              color: AppColor.neutral.shade700,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
