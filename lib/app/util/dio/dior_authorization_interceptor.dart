import 'package:dio/dio.dart';

const String token =
    'cdc9a8ca8aa17b6bed3aa3611a835105bbb4632514d7ca8cf55dbbc5966a7cae';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $token';
    // options.headers['Content-type'] = 'application/json; charset=utf-8';
    super.onRequest(options, handler);
  }
}
