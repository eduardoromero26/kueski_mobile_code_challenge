part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetMovieDetailsById extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsById(this.movieId);

  @override
  List<Object?> get props => [movieId];
}