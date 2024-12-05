import 'package:dio/dio.dart';
import 'package:kueski_mobile_code_challenge/data/repositories/dio_api_repository.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';
import 'package:kueski_mobile_code_challenge/utils/endpoints.dart';

class MoviesRepository {
  Future<MovieResponse> getMovies(String endpoint, int pageNumber,) async {
    final response =
        await DioApiRepository().getFromApi(endpoint, pageNumber);
    if (response is Response) {
      final Map<String, dynamic> data = response.data;
      if (data['results'] == []) {
        return MovieResponse(
          page: 0,
          results: [],
          totalPages: 0,
          totalResults: 0,
        );
      }
      return MovieResponse.fromJson(data);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<MovieResponse> getPopularMovies(int pageNumber) async {
    final response = await getMovies(Endpoints.popularMovies, pageNumber);
    return response;
  }

  Future<MovieResponse> searchMoviesByName(
      int pageNumber, String searchQuery) async {
    final response =
        getMovies('${Endpoints.searchMovies}$searchQuery', pageNumber );
    return response;
  }
}
