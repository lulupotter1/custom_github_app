import 'package:custom_github_app/utils/theme_colors.dart';
import 'package:custom_github_app/utils/theme_text_styles.dart';
import 'package:custom_github_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class CustomTextFromField extends StatelessWidget {
  TextEditingController controller;
  String? Function(String?)? validator;
  String? hintText;
  bool isObscure;
  CustomTextFromField({
    Key? key,
    required this.controller,
    required this.validator,
    this.hintText,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      validator: validator,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeColors.primaryColor)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeColors.grayColor)),
          hintText: hintText ?? '',
          hintStyle:
              ThemeTextRegular.size14.copyWith(color: ThemeColors.grayColor),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h)),
      style: ThemeTextRegular.size18.copyWith(color: ThemeColors.primaryColor),
      controller: controller,
    );
  }
}
