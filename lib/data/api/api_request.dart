import 'package:custom_github_app/data/model/repos_model.dart';
import 'package:custom_github_app/data/model/user_model.dart';
import 'package:custom_github_app/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiRequest {
  final Dio _dio = Dio(BaseOptions(headers: {
    'Authorization': 'token ${Constants.accessToken}',
    'Accept': 'application/vnd.github.v3+json',
  }));

  Future<UserModel> getUser() async {
    UserModel response;

    final res = await _dio.get(
      "${Constants.baseUrl}/user",
    );
    response = UserModel.fromJson(res.data);
    return response;
  }

  Future<List<ReposModel>> getRepos() async {
    List<ReposModel> response = [];
    final res = await _dio.get(
      "${Constants.baseUrl}/user/${Constants.repos}",
    );
    response = res.data.map<ReposModel>((e) {
      return ReposModel.fromJson(e);
    }).toList();
    return response;
  }

  Future createRepos(
      {required String name,
      required String description,
      required bool private}) async {
    final res = await _dio.post(
      "${Constants.baseUrl}/user/repos",
      data: {
        "name": name,
        "description": description,
        "private": private,
      },
    );
  }

  Future addCollab(String userName, String projectName) async {
    final res = await _dio.put(
      "${Constants.baseUrl}/repos/${Constants.userLogin}/$projectName/collaborators/$projectName",
    );
  }
}
