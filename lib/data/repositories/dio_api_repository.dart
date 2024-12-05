import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/localization/localization_cubit.dart';
import 'package:kueski_mobile_code_challenge/utils/env_keys.dart';

class DioApiRepository {
  final Dio dio = Dio();

  Future getFromApi(
    String endpoint,
    int pageNumber,
  ) async {
    try {
      final language = await LocalizationCubit().getCurrentLanguage();
      final response = await dio.get(
        '${dotenv.env[EnvKeys.baseUrl]}$endpoint',
        queryParameters: {
          'include_adult': 'false',
          'include_video': 'false',
          'page': pageNumber.toString(),
          'sort_by': 'popularity.desc',
          'language': language,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${dotenv.env[EnvKeys.apiToken]}',
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      return e;
    }
  }
}
