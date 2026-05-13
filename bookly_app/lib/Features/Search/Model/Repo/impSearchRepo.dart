import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Core/utilities/api_services.dart';
import 'package:bookly_app/Features/Search/Model/Repo/SearchRepo.dart';
import 'package:bookly_app/Features/home/Model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ImplementationSearchRepo implements SearchRepo {
  Dio dio;
  ImplementationSearchRepo(this.dio);
  @override
  Future<Either<Failure, List<BookModel>>> fetchAllBooks() async {
    try {
      final response = await ApiService(
        dio,
      ).get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=');

      final items = (response.data['items'] as List<dynamic>?) ?? [];

      final books = <BookModel>[];
      for (final item in items) {
        try {
          books.add(BookModel.fromJson(item as Map<String, dynamic>));
        } catch (e) {
          // Handle parsing error for this item, e.g. log or skip it
          print('Error parsing book item: $e');
        }
      }
      return Right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
