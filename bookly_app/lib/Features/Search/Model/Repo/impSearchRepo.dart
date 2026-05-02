import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Core/utilities/api_services.dart';
import 'package:bookly_app/Features/Search/Model/Repo/SearchRepo.dart';
import 'package:bookly_app/Features/home/Model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ImplementationSearchRepo implements SearchRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchAllBooks() async {
    try {
      var result = await ApiServices(
        Dio(),
      ).get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=');

      List<BookModel> books = [];
      for (var item in result['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          // Handle parsing error for this item, e.g., log it or skip it
          print('Error parsing book item: $e');
        }
      }
      return Right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
