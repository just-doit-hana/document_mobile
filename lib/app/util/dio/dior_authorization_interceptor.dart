import 'package:dio/dio.dart';

import '../../helper/shared_preference.dart';

// String token = SharedPreferenceHelper.instance.getString('dmsToken');

String? token = SharedPreferenceHelper.instance.getString("token");

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = '$token';
    options.headers['Content-type'] = 'application/json; charset=utf-8';
    super.onRequest(options, handler);
  }
}
