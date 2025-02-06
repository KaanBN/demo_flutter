import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:galleria/core/errors/failures.dart';

class ApiClient {
  final Dio _dio;
  ApiClient()
    : _dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/v2",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "Content-Type": "application/json"
      },
  )) {
    _initializeInterceptors();
  }

  void _initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          _handleDioError(e);
          return handler.next(e);
        },
      )
    );
  }

  /// GET
  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParams);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// POST
  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// PUT
  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// DELETE
  Future<Response> delete(String endpoint) async {
    try {
      return await _dio.delete(endpoint);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Failure _handleDioError(DioException e) {
    if (kDebugMode) {
      print("_handleDioError: $e");
    }
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return NetworkFailure("None or slow connection");

      case DioExceptionType.badResponse:
        return ServerFailure("Server Error: ${e.response?.statusCode}");

      case DioExceptionType.cancel:
        return UnknownFailure("Request cancelled");

      case DioExceptionType.unknown:
      default:
        return UnknownFailure("Unknown Error");
    }
  }
}