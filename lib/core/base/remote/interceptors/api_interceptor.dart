import 'dart:async';
import 'dart:io';
import 'package:base_flutter_project/core/base/local/app_preferences.dart';
import 'package:base_flutter_project/main/app_config.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {
  Completer<String>? _refreshTokenCompleter;

  bool isForceLogout = false;

  final String _refreshTokenPath = 'auth/refresh-token'; // API endpoint for refreshing the token

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      handler.next(err);
      return;
    }

    if (err.error is SocketException) {
      handler.next(err);
      return;
    }

    if (err.response?.statusCode == HttpStatus.unauthorized) {
      isForceLogout = true;
      try {
        final newToken = await _handleRefreshToken(err.requestOptions);
        final response = await _retryRequest(newToken, err.requestOptions);
        handler.resolve(response);
      } catch (error) {
        if (isForceLogout) {
          isForceLogout = false;
          // In this case, you can handle the logout logic, such as navigating to the login screen or clearing user data.
        }
        handler.next(err);
      }
      return;
    }

    handler.next(err);
  }

  Future<String> _handleRefreshToken(RequestOptions options) async {
    if (_refreshTokenCompleter != null) {
      return _refreshTokenCompleter!.future;
    }

    _refreshTokenCompleter = Completer();

    try {
      final newToken = await _refreshToken();
      _refreshTokenCompleter?.complete(newToken);
      _refreshTokenCompleter = null;
      return newToken;
    } catch (e) {
      _refreshTokenCompleter?.completeError(e);
      _refreshTokenCompleter = null;
      rethrow;
    }
  }

  Future<String> _refreshToken() async {
    final refreshToken = AppPreferences.instance.refreshToken;
    if (refreshToken.isEmpty) {
      throw Exception('Không thể lấy refresh token!');
    }

    final Dio dio = Dio(BaseOptions(baseUrl: AppConfig.baseUrl))
      ..interceptors.addAll([CurlLoggerDioInterceptor(printOnSuccess: true)]);
    try {
      final response = await dio.post(_refreshTokenPath, data: {'refreshToken': refreshToken});
      final newToken = response.data['data']['accessToken'] as String;
      // You can also update the refresh token if your API returns a new one
      await AppPreferences.instance.saveAccessToken(newToken);
      return newToken;
    } on Exception catch (e) {
      throw Exception('Không thể lấy accessToken! $e');
    }
  }

  Future<Response<dynamic>> _retryRequest(String accessToken, RequestOptions requestOptions) async {
    final Dio dioClient = Dio(BaseOptions(baseUrl: AppConfig.baseUrl))
      ..interceptors.addAll([CurlLoggerDioInterceptor(printOnSuccess: true)]);
    requestOptions.headers['Authorization'] = 'Bearer $accessToken';

    return dioClient.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(method: requestOptions.method, headers: requestOptions.headers),
    );
  }
}
