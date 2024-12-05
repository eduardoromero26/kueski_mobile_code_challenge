part of 'movies_db_bloc.dart';

@freezed
class MoviesDBState with _$MoviesDBState {
  factory MoviesDBState.initial() = _Initial;
  factory MoviesDBState.loadingStarted() = _LoadingStarted;
  factory MoviesDBState.loadedSuccess(MovieResponse movies) = _LoadedSuccess;
  factory MoviesDBState.loadedFailed(String message) = _LoadedFailed;
}
