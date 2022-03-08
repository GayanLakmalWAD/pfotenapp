import 'package:flutter/material.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {

  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final String? textFieldName;
  final bool? obscureText;
  final TextEditingController controller;
  final String? typedText;
  final Function? onSubmit;
  final bool isHint;
  final Function? onChangedText;

  const CustomTextField({
    this.hint,
    this.prefix,
    this.suffix,
    this.textFieldName,
    this.obscureText,
    required this.controller,
    this.typedText,
    this.onSubmit,
    required this.isHint,
    this.onChangedText
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Text(
              widget.textFieldName!,
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
        TextField(
          controller: widget.controller,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontSize: 12.sp,
          ),
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: secondaryColor),
              ),
              labelStyle:  TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
                fontSize: 12.sp,
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(
                  color:  Colors.black.withOpacity(widget.isHint ? 0.5 : 1),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 12.sp),
              prefixIcon: widget.prefix,
              suffixIcon: widget.suffix
          ),
          onChanged: widget.onChangedText!(widget.controller.text),
          obscureText: widget.obscureText!,
          onSubmitted: widget.onSubmit!(),
        ),
      ],
    );
  }
}
