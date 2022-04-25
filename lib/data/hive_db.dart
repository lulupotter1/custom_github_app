import 'package:custom_github_app/utils/constants.dart';
import 'package:hive/hive.dart';

class HiveDb {
  Box get getLoginBox => Hive.box(Constants.initLoginBoxName);
  String? get getCurrToken => getLoginBox.get(Constants.apiTokenKey);

  editApiToken(String newApiToken) {
    getLoginBox.put(Constants.apiTokenKey, newApiToken);
  }

  deleteKey(String key) {
    getLoginBox.delete(key);
  }
}
