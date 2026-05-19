import 'package:stylish_app/core/api/api_consumer.dart';
import 'package:dio/dio.dart';
import 'package:stylish_app/core/api/api_interceptors.dart';
import 'package:stylish_app/core/api/end_points.dart';
import 'package:stylish_app/core/errors/exceptions.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  @override
  Future<dynamic> delete({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      throw ServerException.handleDioError(e);
    }
  }

  @override
  Future<dynamic> get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      throw ServerException.handleDioError(e);
    }
  }

  @override
  Future<dynamic> patch({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      throw ServerException.handleDioError(e);
    }
  }

  @override
  Future<dynamic> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      throw ServerException.handleDioError(e);
    }
  }
}
