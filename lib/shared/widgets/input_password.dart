import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koffiesoft_test/shared/constants/colors.dart';
import 'package:koffiesoft_test/shared/constants/styles.dart';
import 'package:koffiesoft_test/shared/helpers/regex.dart';

class InputPassword extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String) onChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextStyle? labelStyle;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final double? boxWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const InputPassword({
    Key? key,
    this.hintText = '',
    this.validate,
    required this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    this.labelStyle,
    required this.controller,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.boxWidth,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != ''
            ? Container(
                margin: EdgeInsets.only(
                  bottom: Insets.xs,
                  left: 4.w,
                ),
                child: Text(
                  widget.label,
                  style: widget.labelStyle ??
                      const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        height: 1.15,
                      ),
                ),
              )
            : verticalSpace(0),
        Container(
          padding: widget.padding ??
              EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
          margin: widget.margin ?? EdgeInsets.zero,
          width: widget.boxWidth,
          child: TextFormField(
            enableInteractiveSelection: true,
            cursorColor: Theme.of(context).primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChange,
            keyboardType: TextInputType.text,
            controller: widget.controller,
            obscureText: _obsecureText,
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            validator: widget.validate ??
                (value) {
                  if (!isValidPassword(password: value.toString())) {
                    return '- Kata Sandi minimal 6 karakter\n'
                        // '- Diawali huruf kapital\n' +
                        ;
                  }
                  return null;
                },
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              fillColor: AppColor.whiteColor,
              isDense: true,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              enabledBorder: BorderStyles.enableTextField,
              errorBorder: BorderStyles.errorTextField,
              border: BorderStyles.disableTextField,
              focusedBorder: BorderStyles.focusTextField,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColor.neutral.shade400,
                fontStyle: FontStyle.normal,
              ),
              prefixIcon: widget.prefixIcon,
              suffixIconConstraints:
                  BoxConstraints(minHeight: Sizes.lg, minWidth: Sizes.lg),
              suffixIcon: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onTap,
                child: _obsecureText
                    ? Icon(
                        Icons.visibility_off,
                        size: 16.w,
                        color: AppColor.primaryColor,
                      )
                    : Icon(
                        Icons.visibility,
                        size: 16.w,
                        color: AppColor.primaryColor,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onTap() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }
}
