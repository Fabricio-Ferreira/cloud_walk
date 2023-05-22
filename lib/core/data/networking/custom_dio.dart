import 'package:cloud_walk_test/core/constants/constants.dart';
import 'package:dio/dio.dart';

class CustomDio {
  late Dio _dio;

  CustomDio() {
    _dio = Dio();
    _dio.options.baseUrl = ConstantsCore.baseUrl;
    _dio.options.connectTimeout = const Duration(milliseconds: 100000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 100000);
    _dio.options.headers.addAll({'Content-Type': 'application/json'});
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onResponse: (response, handler) => handler.next(response),
      onError: (e, handler) => handler.next(e),
    ));
  }

  Dio get instance => _dio;

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    return response;
  }

  Future<Response> post(String path, {Map<String, dynamic>? queryParameters, dynamic data}) async {
    final response = await _dio.post(path, queryParameters: queryParameters, data: data);
    return response;
  }

  Future<Response> put(String path, {Map<String, dynamic>? queryParameters, dynamic data}) async {
    final response = await _dio.put(path, queryParameters: queryParameters, data: data);
    return response;
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameters, dynamic data}) async {
    final response = await _dio.delete(path, queryParameters: queryParameters, data: data);
    return response;
  }

  Future<Response> patch(String path, {Map<String, dynamic>? queryParameters, dynamic data}) async {
    final response = await _dio.patch(path, queryParameters: queryParameters, data: data);
    return response;
  }
}
