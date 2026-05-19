// import 'package:dio/dio.dart';

import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Content-Type'] = 'application/json';
    // addAll({
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    // });
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}
