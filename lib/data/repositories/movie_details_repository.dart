import 'package:dio/dio.dart';
import 'package:kueski_mobile_code_challenge/data/repositories/dio_api_repository.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_detail_model.dart';
import 'package:kueski_mobile_code_challenge/utils/endpoints.dart';

class MovieDetailsRepository {
  Future<MovieDetails> getMovieDetails(int movieId) async {
    final response = await DioApiRepository().getFromApi(
      '${Endpoints.movieDetails}/$movieId',
    );
    if (response is Response) {
      final Map<String, dynamic> data = response.data;
      return MovieDetails.fromJson(data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}