import 'package:custom_github_app/presentation/pages/authorization_page.dart';
import 'package:custom_github_app/presentation/pages/detail_repos_page.dart';
import 'package:custom_github_app/presentation/pages/user_info_page.dart';
import 'package:flutter/material.dart';

abstract class Constants {
  static const baseUrl = 'https://api.github.com';
  static const userLogin = 'lulupotter1';
  static const users = 'users';
  static const repos = 'repos';
  static const title = 'Github_App';
  static const fakePassword = 'Test';
  static const initLoginBoxName = "INIT_LOGIN_BOX";
  static const apiTokenKey = 'CURR_KEY';
}

class AppRoutes {
  static const routeToAuthorizationPage = '/AuthorizationPage';
  static const routeToReposPage = '/ReposPage';
  static const routeToDetailReposPage = '/DetailReposPage';
  static const routeToUserPage = '/UserPage';

  static Map<String, WidgetBuilder> getRoutes() {
    Map<String, WidgetBuilder> base = {
      AppRoutes.routeToAuthorizationPage: (BuildContext _) =>
          AuthorizationPage(),
      AppRoutes.routeToDetailReposPage: (BuildContext _) => DetailReposPage(),
      AppRoutes.routeToUserPage: (BuildContext _) => UserPage(),
    };
    return base;
  }
}
