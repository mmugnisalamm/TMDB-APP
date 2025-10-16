import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  DioClient() {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return await dio.get(path, queryParameters: queryParams);
  }
}
