part of 'movies_db_bloc.dart';

abstract class MoviesDBEvent {}

class GetPopularMovies extends MoviesDBEvent {
  final int pageNumber;
  GetPopularMovies({this.pageNumber = 1});
}

class SearchMoviesByName extends MoviesDBEvent {
  final String searchQuery;
  final int pageNumber;
  SearchMoviesByName({this.searchQuery = '', this.pageNumber = 1});
}

class ResetSearchControllerEvent extends MoviesDBEvent {}
