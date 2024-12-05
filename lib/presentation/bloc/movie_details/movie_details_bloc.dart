import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kueski_mobile_code_challenge/data/repositories/movie_details_repository.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_detail_model.dart';

part 'movie_details_state.dart';
part 'movie_details_event.dart';
part 'movie_details_bloc.freezed.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsRepository movieDetailsRepository =
      MovieDetailsRepository();

  MovieDetailsBloc() : super(MovieDetailsState.initial()) {
    on<GetMovieDetailsById>((event, emit) async {
      emit(MovieDetailsState.loadingStarted());
      try {
        final movieDetails =
            await movieDetailsRepository.getMovieDetails(event.movieId);
        emit(MovieDetailsState.loadedSuccess(movieDetails));
      } catch (e) {
        emit(MovieDetailsState.loadedFailed(e.toString()));
      }
    });
    on<ResetMovieDetails>((event, emit) {
      emit(MovieDetailsState.initial());
    });
  }
}
