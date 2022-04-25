import 'package:custom_github_app/bloc/github_bloc.dart';
import 'package:custom_github_app/presentation/widgets/custom_create_repos_form_popup.dart';
import 'package:custom_github_app/presentation/widgets/default_body.dart';
import 'package:custom_github_app/utils/constants.dart';
import 'package:custom_github_app/utils/theme_colors.dart';
import 'package:custom_github_app/utils/theme_text_styles.dart';
import 'package:custom_github_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultBody(
      body: Row(
        children: [
          Expanded(
            child: BlocBuilder<GithubBloc, GithubState>(
              buildWhen: (prev, current) {
                if (current is GithubUserLoaded ||
                    current is GithubUserInfoLoading ||
                    current is GithubUserError) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is GithubUserReposError) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: ThemeTextRegular.size15,
                    ),
                  );
                }
                if (state is GithubUserLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90.w,
                        height: 90.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(state.loadedInfo.avatar_url))),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        state.loadedInfo.login,
                        style: ThemeTextRegular.size18,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "followers : ${state.loadedInfo.followers}",
                        style: ThemeTextRegular.size14,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "followers : ${state.loadedInfo.following}",
                        style: ThemeTextRegular.size14,
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<GithubBloc, GithubState>(
              buildWhen: (prev, current) {
                if (current is GithubUserReposLoaded ||
                    current is GithubUserReposInfoLoading ||
                    current is GithubUserReposError) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is GithubUserReposError) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: ThemeTextRegular.size15,
                    ),
                  );
                }
                if (state is GithubUserReposLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Repositories',
                        style: ThemeTextRegular.size18,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Flexible(
                          child: ListView.separated(
                              separatorBuilder: (context, state) =>
                                  const Divider(),
                              itemCount: state.loadedInfo.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 9.w, vertical: 12.h),
                                    child: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<GithubBloc>(context)
                                            .add(GetSelectedReposEvent(
                                                selectedRepos:
                                                    state.loadedInfo[index]));

                                        Navigator.pushNamed(context,
                                            AppRoutes.routeToDetailReposPage);
                                      },
                                      child: Container(
                                        child:
                                            Text(state.loadedInfo[index].name),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.r)),
                                      ),
                                    ),
                                  ))),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ThemeColors.secondaryColor)),
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) =>
                                  CustomCreateReposFromPopup(),
                            );
                          },
                          child: Text('Create new repository',
                              style: ThemeTextRegular.size14
                                  .copyWith(color: ThemeColors.primaryColor)))
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
      title: Constants.userLogin.toUpperCase(),
    );
  }
}
