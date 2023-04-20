import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:koffiesoft_test/shared/constants/colors.dart';
import 'package:koffiesoft_test/shared/constants/styles.dart';
import 'package:koffiesoft_test/shared/widgets/button_primary_outline.dart';

showPopUp({
  String? title,
  Color? titleColor,
  String? description,
  String? labelButton,
  IconData? imageUri,
  double? imageSize,
  bool? dismissible,
  Widget? widget,
  Function()? onPress,
  Color? outlineButtonColor,
  Color? labelButtonColor,
}) {
  Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: Corners.medBorder, color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(Insets.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.31,
                    color: titleColor ?? AppColor.neutral,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xxl),
                imageUri != null
                    ? Icon(
                        imageUri,
                        size: imageSize ?? IconSizes.xxl,
                        color: AppColor.primaryColor,
                      )
                    : Container(),
                verticalSpace(Insets.xl),
                widget ?? Container(),
                Text(
                  description ?? "",
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.5,
                    letterSpacing: .2,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.xl),
                SizedBox(
                  child: labelButton != null
                      ? ButtonPrimaryOutline(
                          height: 45.h,
                          borderRadius: Corners.lg,
                          onPressed: onPress ?? () => Get.back(),
                          label: labelButton,
                          color: AppColor.whiteColor,
                          outlineColor:
                              outlineButtonColor ?? AppColor.primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: labelButtonColor ?? AppColor.primaryColor,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: dismissible ?? true);
}
