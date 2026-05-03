import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  ApiServices(this.dio);
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';

  Future<Map<String, dynamic>> get({
    required String endPoint,
    String categoryName = "all",
  }) async {
    final response = await dio.get('$_baseUrl$endPoint$categoryName');
    return response.data;
  }
}
