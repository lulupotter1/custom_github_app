part of 'github_bloc.dart';

@immutable
abstract class GithubState {}

class GithubInitial extends GithubState {}

class GithubUserLoaded extends GithubState {
  final UserModel loadedInfo;
  GithubUserLoaded({
    required this.loadedInfo,
  });
}

class GithubReposSelected extends GithubState {
  ReposModel selectedRepos;
  GithubReposSelected({required this.selectedRepos});
}

class GithubUserReposLoaded extends GithubState {
  final List<ReposModel> loadedInfo;
  GithubUserReposLoaded({
    required this.loadedInfo,
  });
}

class GithubReposCreated extends GithubState {}

class GithubCollabAdded extends GithubState {}

class GithubUserError extends GithubState {
  final String errorMessage;
  GithubUserError({
    required this.errorMessage,
  });
}

class GithubUserReposError extends GithubState {
  final String errorMessage;
  GithubUserReposError({
    required this.errorMessage,
  });
}

class GithubError extends GithubState {
  final String errorMessage;
  GithubError({
    required this.errorMessage,
  });
}

class GithubUserInfoLoading extends GithubState {}

class GithubUserReposInfoLoading extends GithubState {}

class GithubReposCreating extends GithubState {}
