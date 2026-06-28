import 'package:base_flutter_project/core/data/local/app_preferences.dart';
import 'package:base_flutter_project/core/data/remote/remote.src.dart';
import 'package:base_flutter_project/main/app_config.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final _instance = ApiClient._();
  late final Dio _dio;

  factory ApiClient() => _instance;

  ApiClient._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    )..interceptors.addAll([ApiInterceptor(), CurlLoggerDioInterceptor(printOnSuccess: true)]);
  }

  Future<BaseResponse<T>> sendRequest<T>({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    bool hasToken = true,
    Options? options,
  }) async {
    final requestOptions = options ?? Options();
    if (hasToken) {
      // Add token to headers if needed
      requestOptions.headers ??= {};
      final token = AppPreferences.instance.accessToken;
      requestOptions.headers!['Authorization'] = 'Bearer $token';
    }

    try {
      Response response;
      switch (method) {
        case HttpMethod.GET:
          response = await _dio.get(
            url,
            queryParameters: data,
            options: requestOptions,
          );
        case HttpMethod.POST:
          response = await _dio.post(
            url,
            data: data,
            options: requestOptions,
          );
        case HttpMethod.PUT:
          response = await _dio.put(
            url,
            data: data,
            options: requestOptions,
          );
        case HttpMethod.DELETE:
          response = await _dio.delete(
            url,
            data: data,
            options: requestOptions,
          );
        case HttpMethod.PATCH:
          response = await _dio.patch(
            url,
            data: data,
            options: requestOptions,
          );
      }

      if (response.data != null && response.data is Map<String, dynamic>) {
        return BaseResponse<T>.fromJson(
          response.data as Map<String, dynamic>,
          (json) => json as T,
        );
      } else {
        throw Exception('Invalid response format');
      }
    } on DioException catch (e) {
        throw ApiException(exception: e);
    } catch (e) {
      rethrow;
    }
  }
}
