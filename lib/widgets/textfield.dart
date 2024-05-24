import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText = '',
    this.hintColor = Colors.grey,
    this.enabledBorderColor = Colors.grey,
    this.enabled = true,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
    this.fillColor = Colors.white,
    this.width = double.maxFinite,
    this.autofocus = false,
    this.error = false,
    this.obscureText = false,
    this.onEditingComplete,
    this.focusNode,
  });
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final Color enabledBorderColor;
  final Color hintColor;
  final Color fillColor;
  final bool enabled;
  final Widget? suffixIcon;
  final Function(String value)? onChanged;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final double width;
  final bool autofocus;
  final bool error;
  final bool obscureText;
  final Function()? onEditingComplete;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: width,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        enabled: enabled,
        keyboardType: keyboardType,
        onChanged: onChanged,
        textInputAction: textInputAction,
        onSubmitted: onSubmitted,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        autofocus: autofocus,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: fillColor,
          contentPadding: EdgeInsets.all(12.w),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(color: error ? Colors.red : enabledBorderColor),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
