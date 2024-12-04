import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kueski_mobile_code_challenge/utils/env_keys.dart';

class DioApiRepository {
  final Dio dio = Dio();

  Future getFromApi(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.get(
        '${dotenv.env[EnvKeys.baseUrl]}$endpoint',
        queryParameters: queryParams,
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