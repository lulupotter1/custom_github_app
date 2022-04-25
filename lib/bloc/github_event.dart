part of 'github_bloc.dart';

@immutable
abstract class GithubEvent {}

class GetUserEvent extends GithubEvent {}

class GetUserReposEvent extends GithubEvent {}

class GetSelectedReposEvent extends GithubEvent {
  ReposModel selectedRepos;
  GetSelectedReposEvent({
    required this.selectedRepos,
  });
}

class CreateReposEvent extends GithubEvent {
  String name;
  String description;
  bool private;

  CreateReposEvent(
      {required this.name, required this.description, required this.private});
}

class AddCollabReposEvent extends GithubEvent {
  String userName;
  String reposName;

  AddCollabReposEvent({
    required this.reposName,
    required this.userName,
  });
}
