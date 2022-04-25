import 'package:custom_github_app/bloc/github_bloc.dart';
import 'package:custom_github_app/presentation/widgets/custom_text_form_field.dart';
import 'package:custom_github_app/utils/theme_colors.dart';
import 'package:custom_github_app/utils/theme_text_styles.dart';
import 'package:custom_github_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class CustomAddingCollaboratorPopul extends StatefulWidget {
  String reposName;
  CustomAddingCollaboratorPopul({
    Key? key,
    required this.reposName,
  }) : super(key: key);

  @override
  State<CustomAddingCollaboratorPopul> createState() =>
      _CustomAddingCollaboratorPopulState();
}

class _CustomAddingCollaboratorPopulState
    extends State<CustomAddingCollaboratorPopul> {
  GlobalKey<FormState> repFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
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
                  controller: usernameController,
                  validator: Validator.validateEmptyText),
              SizedBox(
                height: 8.h,
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          ThemeColors.secondaryColor)),
                  onPressed: () {
                    if (repFormKey.currentState!.validate()) {
                      BlocProvider.of<GithubBloc>(context).add(
                          AddCollabReposEvent(
                              reposName: widget.reposName,
                              userName: usernameController.text));

                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add collaborator',
                      style: ThemeTextRegular.size14
                          .copyWith(color: ThemeColors.primaryColor)))
            ],
          ),
        ),
      ),
    ]);
  }
}
