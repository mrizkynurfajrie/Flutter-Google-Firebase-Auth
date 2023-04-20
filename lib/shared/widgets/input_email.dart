import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koffiesoft_test/shared/constants/colors.dart';
import 'package:koffiesoft_test/shared/constants/styles.dart';

class InputEmail extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool obsecureText;
  final ValueSetter<bool> isValid;
  final ValueSetter<String> email;
  final String? Function(String?)? onChange;
  final double? boxWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final EdgeInsets? contentPadding;
  final Color? inputColor;
  final TextStyle? hintStyles;
  final InputBorder? inputBorder;

  const InputEmail({
    Key? key,
    this.hintText = '',
    this.validate,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    required this.controller,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.obsecureText = false,
    required this.isValid,
    required this.email,
    this.boxWidth,
    this.padding,
    this.margin,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.contentPadding,
    this.inputColor,
    this.hintStyles,
    this.inputBorder,
  }) : super(key: key);

  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.boxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != ''
              ? SizedBox(
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                        fontSize: 12,
                        color: AppColor.neutral,
                        fontWeight: FontWeight.w400),
                  ),
                )
              : verticalSpace(0),
          Container(
            padding: EdgeInsets.only(bottom: 3.h),
            margin: widget.margin,
            child: TextFormField(
              enableInteractiveSelection: true,
              cursorColor: Theme.of(context).primaryColor,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              controller: widget.controller,
              obscureText: widget.obsecureText,
              inputFormatters: widget.inputFormatters,
              textCapitalization: widget.textCapitalization,
              onChanged: widget.onChange,
              validator: widget.validate ??
                  (value) {
                    if (!GetUtils.isEmail(value.toString())) {
                      widget.isValid(false);
                      widget.email('');
                      return 'Format email belum benar';
                    }
                    widget.email(value.toString());
                    widget.isValid(true);
                    return null;
                  },
              style: TextStyle(
                fontSize: 12,
                color: AppColor.neutral.shade800,
                fontWeight: FontWeight.w400,
              ),
              decoration: inputDecoration(
                hintText: widget.hintText,
                hintStyles: widget.hintStyles,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                enabledBorder: widget.enabledBorder,
                focusedBorder: widget.focusedBorder,
                errorBorder: widget.errorBorder,
                border: widget.inputBorder,
                contentPadding: widget.contentPadding,
                color: widget.inputColor ?? AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
