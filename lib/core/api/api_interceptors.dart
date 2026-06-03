import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:stylish_app/core/api/end_points.dart';
import 'package:stylish_app/core/services/secure_storage_service.dart';

class ApiInterceptors extends Interceptor {
  final Dio dio;

  ApiInterceptors({required this.dio});

  bool isRefreshing = false;
  Completer<String>? completer;

  // ================= REQUEST =================
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log('🌍 REQUEST START -> ${options.path}');

    options.headers['Content-Type'] = 'application/json';

    final accessToken = await TokenStorage.getAccessToken();

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      log('🔑 Token Attached');
    } else {
      log('⚠️ No Token Found');
    }

    return handler.next(options);
  }

  // ================= RESPONSE =================
  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    log('🎉 RESPONSE ${response.statusCode}');
    log('📦 DATA: ${response.data}');
    return handler.next(response);
  }

  // ================= ERROR =================
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    log('❌ ERROR ${err.response?.statusCode}');
    log('🚨 ${err.message}');

    // ❌ IMPORTANT: prevent infinite refresh loop
    if (err.requestOptions.path == EndPoints.refreshToken) {
      log('🚫 Refresh token failed -> logout');

      await TokenStorage.clearTokens();
      return handler.next(err);
    }

    // ================= TOKEN EXPIRED =================
    if (err.response?.statusCode == 401) {
      log('⛔ 401 Unauthorized');

      try {
        // if refresh already running
        if (isRefreshing) {
          log('🔄 Waiting for refresh...');
          final newToken = await completer!.future;

          err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

          final retryResponse = await dio.fetch(err.requestOptions);
          return handler.resolve(retryResponse);
        }

        // start refresh
        isRefreshing = true;
        completer = Completer<String>();

        final refreshToken = await TokenStorage.getRefreshToken();

        log('🔑 Refresh Token: $refreshToken');

        final response = await dio.post(
          EndPoints.refreshToken,
          data: {'refreshToken': refreshToken},
        );
        // access_token
        final newAccessToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];

        log('🆕 New Access Token');
        log('🆕 New Refresh Token');

        await TokenStorage.saveTokens(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
        );

        completer!.complete(newAccessToken);

        err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        final retryResponse = await dio.fetch(err.requestOptions);

        return handler.resolve(retryResponse);
      } catch (e) {
        log('💥 Refresh failed: $e');

        completer?.completeError(e);
        await TokenStorage.clearTokens();

        return handler.next(err);
      } finally {
        isRefreshing = false;
      }
    }

    return handler.next(err);
  }
}

// // import 'package:dio/dio.dart';

// import 'package:dio/dio.dart';

// class ApiInterceptors extends Interceptor {
//   @override
//   Future onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     options.headers['Content-Type'] = 'application/json';
//     return super.onRequest(options, handler);
//   }

//   @override
//   Future onResponse(
//     Response response,
//     ResponseInterceptorHandler handler,
//   ) async {
//     return super.onResponse(response, handler);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     return super.onError(err, handler);
//   }
// }
