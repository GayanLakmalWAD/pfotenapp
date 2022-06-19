import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:pfoten/utils/dimensions.dart';
import 'package:pfoten/utils/textStyles.dart';
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Text(
              widget.textFieldName!,
            style: robotoRegularTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: Dimensions.fontSizeDefault,
            ),
          ),
        ),
        TextField(
          controller: widget.controller,
          style: robotoRegularTextStyle.copyWith(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: Dimensions.fontSizeExtraSmall,
          ),
          textCapitalization: TextCapitalization.sentences,
          keyboardType: widget.textFieldName == "Weight" ? TextInputType.number : TextInputType.text,
          inputFormatters: (widget.textFieldName == "Weight") ? [FilteringTextInputFormatter.digitsOnly] : [],
          decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: secondaryColor),
              ),
              labelStyle:  robotoRegularTextStyle.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.fontSizeDefault,
              ),
              hintText: widget.hint,
              hintStyle: robotoRegularTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: Dimensions.fontSizeExtraSmall,
                  color:  Colors.black.withOpacity(widget.isHint ? 0.5 : 1),
              ),
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
