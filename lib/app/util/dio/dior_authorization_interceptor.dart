import 'package:dio/dio.dart';
import 'package:document_appmobile/app/helper/shared_preference.dart';

// String token = SharedPreferenceHelper.instance.getString('dmsToken');

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ';
    // options.headers['Content-type'] = 'application/json; charset=utf-8';
    super.onRequest(options, handler);
  }
}
