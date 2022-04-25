import 'package:custom_github_app/utils/constants.dart';

class Validator {
  static String? validatePassword(value) {
    if (value == null || value != Constants.fakePassword) {
      return 'Password is empty or  not correct';
    } else {
      return null;
    }
  }

  static String? validateEmptyText(value) {
    if (value == null) {
      return 'Text is empty';
    } else {
      return null;
    }
  }
}
