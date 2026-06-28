import 'package:base_flutter_project/core/data/remote/remote.src.dart';
import 'package:dio/dio.dart';

class BaseDataSource {
  final ApiClient apiClient;

  BaseDataSource(this.apiClient);

  Future<BaseResponse<T>> callApi<T>({
     required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    bool hasToken = true,
    Options? options,
  }) async {
    try {
      final response = await apiClient.sendRequest<T>(
        method: method,
        url: url,
        data: data,
        hasToken: hasToken,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
  
}