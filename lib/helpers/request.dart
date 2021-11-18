import 'package:dio/dio.dart';
import 'package:global_configs/global_configs.dart';

class Request {
  Request()
      : _dio = Dio(BaseOptions(
          baseUrl: GlobalConfigs().get('server.url'),
        ));

  final Dio _dio;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) =>
      _dio.get(path, queryParameters: queryParameters);

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) =>
      _dio.delete(path, queryParameters: queryParameters);
}
