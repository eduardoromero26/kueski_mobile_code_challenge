import 'package:dio/dio.dart';
import 'package:kueski_mobile_code_challenge/data/repositories/dio_api_repository.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';
import 'package:kueski_mobile_code_challenge/utils/endpoints.dart';

class MoviesRepository {
  Future<MovieResponse> getMovies(String endpoint, int pageNumber,
      Map<String, dynamic>? queryParams) async {
    final response =
        await DioApiRepository().getFromApi(endpoint, queryParams: queryParams);
    if (response is Response) {
      final Map<String, dynamic> data = response.data;
      return MovieResponse.fromJson(data);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<MovieResponse> getPopularMovies(int pageNumber) async {
    final response = await getMovies(Endpoints.popularMovies, pageNumber, {
      'include_adult': 'false',
      'include_video': 'false',
      'language': 'en-US',
      'page': pageNumber.toString(),
      'sort_by': 'popularity.desc',
    });
    return response;
  }

  Future<MovieResponse> searchMoviesByName(
      int pageNumber, String searchQuery) async {
    final response =
        getMovies('${Endpoints.searchMovies}$searchQuery', pageNumber, {
      'include_adult': 'false',
      'include_video': 'false',
      'language': 'en-US',
      'page': pageNumber.toString(),
    });
    return response;
  }
}
