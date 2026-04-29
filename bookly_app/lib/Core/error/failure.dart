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
        return ServerFailure(
          'Received invalid status code: ${dioException.response?.statusCode}',
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled');
      case DioExceptionType.unknown:
        return ServerFailure(
          'An unknown error occurred: ${dioException.message}',
        );

      case DioExceptionType.connectionError:
        return ServerFailure('Connection error occurred');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate error occurred');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Oops There was an Error, Please try again');
    }
  }
}
