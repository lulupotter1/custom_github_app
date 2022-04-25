import 'package:bloc/bloc.dart';
import 'package:custom_github_app/data/api/api_request.dart';
import 'package:custom_github_app/data/model/repos_model.dart';
import 'package:custom_github_app/data/model/user_model.dart';
import 'package:meta/meta.dart';

part 'github_event.dart';
part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  GithubBloc() : super(GithubInitial());

  @override
  Stream<GithubState> mapEventToState(GithubEvent event) async* {
    if (event is GetUserEvent) {
      yield GithubUserInfoLoading();
      try {
        var result = await ApiRequest().getUser();
        yield GithubUserLoaded(loadedInfo: result);
      } catch (e) {
        yield GithubUserError(errorMessage: e.toString());
      }
    }
    if (event is GetSelectedReposEvent) {
      yield GithubReposSelected(selectedRepos: event.selectedRepos);
    }
    if (event is GetUserReposEvent) {
      yield GithubUserReposInfoLoading();
      try {
        var result = await ApiRequest().getRepos();
        yield GithubUserReposLoaded(loadedInfo: result);
      } catch (e) {
        yield GithubUserReposError(errorMessage: e.toString());
      }
    }
    if (event is CreateReposEvent) {
      yield GithubReposCreating();
      try {
        await ApiRequest().createRepos(
          description: event.description,
          name: event.name,
          private: event.private,
        );
        yield GithubReposCreated();
      } catch (e) {
        yield GithubError(errorMessage: e.toString());
      }
    }
    if (event is AddCollabReposEvent) {
      yield GithubReposCreating();
      try {
        await ApiRequest().addCollab(
          event.userName,
          event.reposName,
        );
        yield GithubCollabAdded();
      } catch (e) {
        yield GithubError(errorMessage: e.toString());
      }
    }
  }
}
