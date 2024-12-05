part of 'movie_details_bloc.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  factory MovieDetailsState.initial() = _Initial;
  factory MovieDetailsState.loadingStarted() = _LoadingStarted;
  factory MovieDetailsState.loadedSuccess(MovieDetails movies) = _LoadedSuccess;
  factory MovieDetailsState.loadedFailed(String message) = _LoadedFailed;
}
