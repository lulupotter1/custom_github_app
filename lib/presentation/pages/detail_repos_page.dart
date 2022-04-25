import 'package:custom_github_app/bloc/github_bloc.dart';
import 'package:custom_github_app/presentation/widgets/custom_adding_collaborator_popup.dart';
import 'package:custom_github_app/presentation/widgets/custom_collab_popup.dart';
import 'package:custom_github_app/presentation/widgets/default_body.dart';
import 'package:custom_github_app/utils/theme_colors.dart';
import 'package:custom_github_app/utils/theme_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class DetailReposPage extends StatelessWidget {
  const DetailReposPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GithubBloc, GithubState>(
      listenWhen: (prev, current) {
        if (current is GithubError || current is GithubCollabAdded) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is GithubError) {
          showDialog(
              builder: (context) => CustomCollabPopup(), context: context);
        }
        if (state is GithubCollabAdded) {
          showDialog(
              builder: (context) => CustomCollabPopup(
                    wasAdded: true,
                  ),
              context: context);
        }
      },
      buildWhen: (prev, current) {
        if (current is GithubReposSelected) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is GithubReposSelected) {
          return DefaultBody(
              showLeading: true,
              body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${state.selectedRepos.name}",
                            style: ThemeTextRegular.size18,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Date: ${state.selectedRepos.created_at}",
                            style: ThemeTextRegular.size18,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Forks count: ${state.selectedRepos.forks_count}",
                            style: ThemeTextRegular.size18,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Star count: ${state.selectedRepos.stargazers_count}",
                            style: ThemeTextRegular.size18,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Owner: ${state.selectedRepos.owner.login}",
                            style: ThemeTextRegular.size18,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Permissions",
                            style: ThemeTextRegular.size18,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ThemeColors.secondaryColor),
                                borderRadius: BorderRadius.circular(4.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Admin: ${state.selectedRepos.permissions.admin}",
                                  style: ThemeTextRegular.size18,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Maintain: ${state.selectedRepos.permissions.maintain}",
                                  style: ThemeTextRegular.size18,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Push: ${state.selectedRepos.permissions.push}",
                                  style: ThemeTextRegular.size18,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Triage: ${state.selectedRepos.permissions.triage}",
                                  style: ThemeTextRegular.size18,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Pull: ${state.selectedRepos.permissions.pull}",
                                  style: ThemeTextRegular.size18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              ThemeColors.secondaryColor)),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => CustomAddingCollaboratorPopul(
                            reposName: state.selectedRepos.name,
                          ),
                        );
                      },
                      child: Text('Add collaborator',
                          style: ThemeTextRegular.size14
                              .copyWith(color: ThemeColors.primaryColor)))
                ],
              ),
              title: state.selectedRepos.name);
        }
        return Container();
      },
    );
  }
}
