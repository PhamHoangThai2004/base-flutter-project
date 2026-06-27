import 'dart:io';
import 'package:dio/dio.dart';

class ApiException {
  final int errorCode;
  final String errorMessage;
  final Object exception;

  ApiException._({
    this.errorCode = 0,
    this.errorMessage = '',
    required this.exception,
  });

  factory ApiException({required DioException exception}) {
    switch (exception.type) {
      case DioExceptionType.badResponse:
        return _handleErrorWithResponse(exception);
      case DioExceptionType.cancel:
        return ApiException._(
          exception: exception,
          errorMessage: 'Request was cancelled',
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return ApiException._(
          exception: exception,
          errorMessage: _timeOutMessages[exception.type]!,
        );
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        if (exception.error is SocketException || exception.error is HttpException) {
          return ApiException._(
            exception: exception,
            errorMessage: 'error_internet_connection',
          );
        }
        return ApiException._(
          exception: exception,
          errorMessage: exception.error.toString(),
        );
    }
  }

  factory ApiException.error(Object error, [StackTrace? stackTrace]) {
    if (error is DioException) {
      return ApiException(exception: error);
    }
    return ApiException._(exception: error, errorMessage: error.toString());
  }

  @override
  String toString() {
    return 'ApiException(errorCode: $errorCode, errorMessage: $errorMessage, exception: $exception)';
  }
}

ApiException _handleErrorWithResponse(DioException exception) {
  try {
    final errorBody = exception.response?.data;

    if (errorBody is Map<String, dynamic>) {
      return ApiException._(
        exception: exception,
        errorMessage: errorBody['message'] ?? 'unexpected_error',
        errorCode: errorBody['statusCode'] ?? exception.response?.statusCode ?? 0,
      );
    }

    return ApiException._(
      exception: exception,
      errorMessage: exception.response?.statusMessage ?? 'unexpected_error',
      errorCode: exception.response?.statusCode ?? 0,
    );
  } catch (e) {
    return ApiException._(
      exception: exception,
      errorMessage: e.toString(),
    );
  }
}

final _timeOutMessages = {
  DioExceptionType.connectionTimeout: 'Connection timeout',
  DioExceptionType.receiveTimeout: 'Receive timeout',
  DioExceptionType.sendTimeout: 'Send timeout',
};
