import 'package:dio/dio.dart';

class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection error occurred');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate error occurred');

      case DioExceptionType.unknown:
      default:
        return ServerFailure(dioException.message ?? 'Unknown error occurred');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    final message = _extractMessage(response);

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(message ?? 'Bad request');

      case 404:
        return ServerFailure('Resource not found');

      case 500:
        return ServerFailure('Internal server error');

      default:
        return ServerFailure('Something went wrong');
    }
  }

  static String? _extractMessage(dynamic response) {
    try {
      if (response is Map<String, dynamic>) {
        return response['error']?['message'] ?? response['message'];
      }
    } catch (_) {
      return null;
    }
    return null;
  }
}
