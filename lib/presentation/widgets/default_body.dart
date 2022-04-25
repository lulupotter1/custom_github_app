import 'dart:async';

import 'package:custom_github_app/bloc/github_bloc.dart';
import 'package:custom_github_app/utils/theme_colors.dart';
import 'package:custom_github_app/utils/theme_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class DefaultBody extends StatelessWidget {
  Widget body;
  String title;
  bool showLeading;
  Color? backgroundColor;
  DefaultBody({
    Key? key,
    required this.body,
    required this.title,
    this.showLeading = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: showLeading,
        backgroundColor: ThemeColors.primaryColor,
        titleTextStyle: ThemeTextRegular.size14,
        title: Text(
          title,
          style: ThemeTextRegular.size15.copyWith(color: ThemeColors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
        child: body,
      ),
    );
  }
}
