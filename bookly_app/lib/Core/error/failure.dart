import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  final int? statusCode;

  Failure(this.message, {this.statusCode});
}

class ServerFailure extends Failure {
  ServerFailure(super.message, {super.statusCode});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');

      case DioExceptionType.cancel:
        return ServerFailure('Request cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );

      case DioExceptionType.unknown:
        return ServerFailure(
          dioException.message ?? 'Unexpected error occurred',
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    final message = _extractMessage(response);

    switch (statusCode) {
      case 400:
        return ServerFailure(message ?? 'Bad request', statusCode: statusCode);

      case 401:
        return ServerFailure(message ?? 'Unauthorized', statusCode: statusCode);

      case 403:
        return ServerFailure(message ?? 'Forbidden', statusCode: statusCode);

      case 404:
        return ServerFailure(message ?? 'Not found', statusCode: statusCode);

      case 408:
        return ServerFailure('Request timeout', statusCode: statusCode);

      case 409:
        return ServerFailure(
          message ?? 'Conflict error',
          statusCode: statusCode,
        );

      case 422:
        return ServerFailure(
          message ?? 'Validation error',
          statusCode: statusCode,
        );

      case 429:
        return ServerFailure('Too many requests', statusCode: statusCode);

      case 500:
        return ServerFailure('Internal server error', statusCode: statusCode);

      case 502:
        return ServerFailure('Bad gateway', statusCode: statusCode);

      case 503:
        return ServerFailure('Service unavailable', statusCode: statusCode);

      case 504:
        return ServerFailure('Gateway timeout', statusCode: statusCode);

      default:
        return ServerFailure(
          message ?? 'Unexpected server error',
          statusCode: statusCode,
        );
    }
  }

  static String? _extractMessage(dynamic response) {
    try {
      if (response is Map) {
        final map = Map<String, dynamic>.from(response);

        return map['message'] ??
            map['error'] ??
            map['detail'] ??
            map['error']?['message'];
      }
    } catch (_) {}

    return null;
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}
