import 'package:custom_github_app/bloc/github_bloc.dart';
import 'package:custom_github_app/presentation/widgets/custom_text_form_field.dart';
import 'package:custom_github_app/utils/theme_colors.dart';
import 'package:custom_github_app/utils/theme_text_styles.dart';
import 'package:custom_github_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class CustomCollabPopup extends StatelessWidget {
  bool wasAdded;
  CustomCollabPopup({
    this.wasAdded = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 10.h,
        ),
        child: Text(wasAdded ? 'Collab was added' : 'Username was not found',
            style: ThemeTextRegular.size14),
      ),
    ]);
  }
}
