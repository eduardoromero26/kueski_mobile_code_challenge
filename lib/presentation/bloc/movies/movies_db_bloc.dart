import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kueski_mobile_code_challenge/data/repositories/movies_repository.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';

part 'movies_db_bloc.freezed.dart';
part 'movies_db_event.dart';
part 'movies_db_state.dart';

class MoviesDbBloc extends Bloc<MoviesDBEvent, MoviesDBState> {
  final TextEditingController searchFieldController =
      TextEditingController(text: '');
  final MoviesRepository moviesRepository = MoviesRepository();

  MoviesDbBloc() : super(MoviesDBState.initial()) {

    on<GetPopularMovies>((event, emit) async {
      emit(MoviesDBState.loadingStarted());
      try {
        final movies =
            await moviesRepository.getPopularMovies(event.pageNumber);
        emit(MoviesDBState.loadedSuccess(movies));
      } catch (e) {
        emit(MoviesDBState.loadedFailed(e.toString()));
      }
    });
    on<SearchMoviesByName>((event, emit) async {
      emit(MoviesDBState.loadingStarted());
      try {
        final movies = await moviesRepository.searchMoviesByName(event.pageNumber, event.searchQuery);
        emit(MoviesDBState.loadedSuccess(movies));
      } catch (e) {
        emit(MoviesDBState.loadedFailed(e.toString()));
      }
      try {} catch (e) {
        emit(MoviesDBState.loadedFailed(e.toString()));
      }
    });
    on<ResetSearchControllerEvent>((event, emit) {
      searchFieldController.text = '';
    });
  }
}
