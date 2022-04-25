import 'package:custom_github_app/bloc/github_bloc.dart';
import 'package:custom_github_app/presentation/widgets/custom_text_form_field.dart';
import 'package:custom_github_app/utils/theme_colors.dart';
import 'package:custom_github_app/utils/theme_text_styles.dart';
import 'package:custom_github_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class CustomCreateReposFromPopup extends StatefulWidget {
  CustomCreateReposFromPopup({Key? key}) : super(key: key);

  @override
  State<CustomCreateReposFromPopup> createState() =>
      _CustomCreateReposFromPopupState();
}

class _CustomCreateReposFromPopupState
    extends State<CustomCreateReposFromPopup> {
  GlobalKey<FormState> repFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String isPrivate = 'false';
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(children: [
      Form(
        key: repFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Repository name', style: ThemeTextRegular.size14),
              CustomTextFromField(
                  controller: nameController,
                  validator: Validator.validateEmptyText),
              SizedBox(
                height: 8.h,
              ),
              const Text('Repository description',
                  style: ThemeTextRegular.size14),
              CustomTextFromField(
                  controller: descriptionController,
                  validator: Validator.validateEmptyText),
              SizedBox(
                height: 8.h,
              ),
              const Text('Repository private', style: ThemeTextRegular.size14),
              DropdownButton<String>(
                  value: isPrivate,
                  items: [
                    DropdownMenuItem(
                      value: 'true',
                      child: Text('true'),
                    ),
                    DropdownMenuItem(
                      value: 'false',
                      child: Text('false'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      isPrivate = value!;
                    });
                  }),
              SizedBox(
                height: 8.h,
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          ThemeColors.secondaryColor)),
                  onPressed: () {
                    if (repFormKey.currentState!.validate()) {
                      BlocProvider.of<GithubBloc>(context).add(CreateReposEvent(
                        description: descriptionController.text,
                        name: nameController.text,
                        private: isPrivate == 'false' ? false : true,
                      ));

                      BlocProvider.of<GithubBloc>(context)
                          .add(GetUserReposEvent());

                      Navigator.pop(context);
                    }
                  },
                  child: Text('Create Repository',
                      style: ThemeTextRegular.size14
                          .copyWith(color: ThemeColors.primaryColor)))
            ],
          ),
        ),
      ),
    ]);
  }
}
