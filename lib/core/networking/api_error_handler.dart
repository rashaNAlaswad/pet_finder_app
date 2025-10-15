import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message:
                "Connection to the server failed due to internet connection",
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: "Receive timeout in connection with the server",
          );
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: "Send timeout in connection with the server",
          );
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Unknown error occurred");
    }
  }

  static ApiErrorModel _handleError(dynamic data) {
    if (data is Map<String, dynamic>) {
      final statusCode = data[ApiConstants.statusCode] as int?;
      final message =
          data[ApiConstants.message]?.toString() ?? "Operation failed";
      final errors = (data[ApiConstants.errors] is Map<String, dynamic>)
          ? Map<String, List<String>>.from(
              (data[ApiConstants.errors] as Map).map(
                (key, value) => MapEntry(
                  key.toString(),
                  (value as List).map((e) => e.toString()).toList(),
                ),
              ),
            )
          : const <String, List<String>>{};

      return ApiErrorModel(
        statusCode: statusCode,
        message: message,
        errors: errors,
      );
    } else {
      return ApiErrorModel(message: "Unexpected error format");
    }
  }
}
