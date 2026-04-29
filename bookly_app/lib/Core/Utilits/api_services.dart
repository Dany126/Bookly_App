import 'package:bookly_app/Core/error/failure.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  ApiServices(this.dio);
  final String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    try {
      final response = await dio.get('$_baseUrl$endPoint');
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    }
  }
}
