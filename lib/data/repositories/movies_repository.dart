import 'package:kueski_mobile_code_challenge/data/repositories/dio_api_repository.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';

class MoviesRepository {
  Future<MovieResponse> getPopularMovies(int pageNumber) async {
    final response = await DioApiRepository().getFromApi(
      '/discover/movie',
      queryParams: {
        'include_adult': 'false',
        'include_video': 'false',
        'language': 'en-US',
        'page': pageNumber.toString(),
        'sort_by': 'popularity.desc',
      },
    );
    return MovieResponse.fromJson(response);
  }
}
