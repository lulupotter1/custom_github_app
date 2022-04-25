import 'package:custom_github_app/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemeTextRegular {
  static const fontWeight = FontWeight.w400;
  static const fontFamily = "UbuntuRegular";
  static const fontColor = ThemeColors.black;

  static const size14 = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
    fontFamilyFallback: <String>['NotoSans'],
  );

  static const size15 = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 15.0,
    fontFamilyFallback: <String>['NotoSans'],
  );
  static const size18 = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 18.0,
    fontFamilyFallback: <String>['NotoSans'],
  );
}
