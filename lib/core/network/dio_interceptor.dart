import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  final String token;

  DioInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-api-key'] = token;
    super.onRequest(options, handler);
  }
}