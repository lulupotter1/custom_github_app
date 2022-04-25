import 'package:custom_github_app/bloc/github_bloc.dart';
import 'package:custom_github_app/presentation/widgets/custom_text_form_field.dart';
import 'package:custom_github_app/presentation/widgets/default_body.dart';
import 'package:custom_github_app/utils/constants.dart';
import 'package:custom_github_app/utils/theme_colors.dart';
import 'package:custom_github_app/utils/theme_text_styles.dart';
import 'package:custom_github_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  // this password just fake password auth cause Github stopped getting auth throw password(i use token access)
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBody(
      title: "Authorization",
      body: Form(
        key: loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: ThemeColors.grayColor)),
              child: Text('lulupotter1',
                  style: ThemeTextRegular.size18
                      .copyWith(color: ThemeColors.primaryColor)),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFromField(
                isObscure: true,
                hintText:
                    'Password is "Test"(use token which saved in Constants)',
                controller: passwordController,
                validator: Validator.validatePassword),
            SizedBox(
              height: 16.h,
            ),
            TextButton(
                onPressed: () {
                  if (loginFormKey.currentState!.validate()) {
                    BlocProvider.of<GithubBloc>(context).add(GetUserEvent());
                    BlocProvider.of<GithubBloc>(context)
                        .add(GetUserReposEvent());

                    Navigator.pushNamed(context, AppRoutes.routeToUserPage);
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ThemeColors.secondaryColor)),
                child: Text('Log in',
                    style: ThemeTextRegular.size14
                        .copyWith(color: ThemeColors.primaryColor)))
          ],
        ),
      ),
    );
  }
}
