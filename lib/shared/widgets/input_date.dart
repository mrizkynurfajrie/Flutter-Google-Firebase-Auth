import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koffiesoft_test/shared/constants/colors.dart';
import 'package:koffiesoft_test/shared/constants/styles.dart';

class InputDate extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueSetter<DateTime> selectedDate;
  final ValueSetter<bool> isValid;
  final double? boxWidth;
  final double? boxHeight;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final EdgeInsets? contentPadding;
  final Color? inputColor;
  final TextStyle? hintStyles;
  final InputBorder? inputBorder;
  final FontStyle? hintFontStyle;

  const InputDate({
    Key? key,
    this.hintText = 'Pilih Tanggal',
    this.validate,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    required this.controller,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    required this.selectedDate,
    required this.isValid,
    this.boxWidth,
    this.boxHeight,
    this.padding,
    this.margin,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.contentPadding,
    this.inputColor,
    this.hintStyles,
    this.inputBorder,
    this.hintFontStyle,
  }) : super(key: key);

  @override
  _InputDateState createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  String _date = '';

  void _selectDate() async {
    var datePicked = await DatePicker.showSimpleDatePicker(context,
        initialDate: widget.initialDate ?? DateTime.now(),
        firstDate: widget.firstDate ?? DateTime(1900),
        lastDate: widget.lastDate ?? DateTime(2030),
        dateFormat: "dd-MMMM-yyyy",
        // locale: DateTimePickerLocale.id,
        looping: false,
        textColor: Theme.of(context).primaryColor,
        cancelText: 'Batal',
        titleText: 'Pilih Tanggal',
        itemTextStyle: TextStyle(
          fontSize: 14,
          color: AppColor.neutral.shade800,
        ));

    if (datePicked != null) {
      setState(() {
        _date = DateFormat('yyyy-MM-dd').format(datePicked);
        // _date = FormatDateTime.formatDateWithoutHour(value: datePicked);
      });

      widget.controller.text = _date;
      var selectDate = DateTime.parse(_date);
      widget.selectedDate(selectDate);
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != ''
            ? Container(
                margin: EdgeInsets.only(
                  bottom: 2.h,
                ),
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
          padding: widget.padding,
          width: widget.boxWidth,
          height: widget.boxHeight,
          margin: widget.margin ?? EdgeInsets.zero,
          child: TextFormField(
            onTap: _selectDate,
            readOnly: true,
            cursorColor: Theme.of(context).primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.datetime,
            controller: widget.controller,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            validator: widget.validate ??
                (value) {
                  if (value.toString().isEmpty) {
                    widget.isValid(false);
                    return 'Pilih tanggal';
                  }

                  widget.isValid(true);
                  return null;
                },
            style: const TextStyle(
              fontSize: 12,
              color: AppColor.neutral,
            ),
            decoration: inputDecoration(
              hintText: widget.hintText,
              hintStyles: widget.hintStyles,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              fontStyle: widget.hintFontStyle,
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
    );
  }
}
