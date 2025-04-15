import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dio_interceptor.dart';

Dio setupDio(String token) {
  final dio = Dio();
  dio.interceptors.add(DioInterceptor(token));
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ));
  return dio;
}