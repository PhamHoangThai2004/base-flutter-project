class BaseResponse<T> {
  final bool success;
  final String message;
  final T data;

  BaseResponse({required this.success, required this.message, required this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return BaseResponse<T>(
      success: json['success'],
      message: json['message'],
      data: fromJsonT(json['data']),
    );
  }
}
