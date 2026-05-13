import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _retryRequest(
      () => dio.get(endPoint, queryParameters: queryParameters),
    );
  }

  Future<Response> post({required String endPoint, dynamic data}) async {
    return await _retryRequest(() => dio.post(endPoint, data: data));
  }

  Future<Response> _retryRequest(Future<Response> Function() request) async {
    int retryCount = 0;

    while (retryCount < 3) {
      try {
        return await request();
      } on DioException catch (e) {
        retryCount++;

        if (!_shouldRetry(e)) {
          rethrow;
        }

        await Future.delayed(Duration(seconds: retryCount * 2));
      }
    }

    throw DioException(requestOptions: RequestOptions(), error: 'Retry failed');
  }

  bool _shouldRetry(DioException e) {
    return e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.response?.statusCode == 429 ||
        e.response?.statusCode == 503;
  }
}
