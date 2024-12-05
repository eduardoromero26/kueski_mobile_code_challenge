part of 'movies_db_bloc.dart';

abstract class MoviesDBEvent {}

class GetPopularMovies extends MoviesDBEvent {
  final String searchQuery;
  final int pageNumber;
  GetPopularMovies({this.pageNumber = 1, this.searchQuery = ''});
}

class SearchMoviesByName extends MoviesDBEvent {
  final String searchQuery;
  final int pageNumber;
  SearchMoviesByName({this.searchQuery = '', this.pageNumber = 1});
}

class ResetSearchMovies extends MoviesDBEvent {}
