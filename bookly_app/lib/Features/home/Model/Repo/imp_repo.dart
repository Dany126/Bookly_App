import 'package:bookly_app/Core/utilities/api_services.dart';
import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Features/home/Model/Repo/repo.dart';
import 'package:bookly_app/Features/home/Model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ImplementationRepo implements HomeRepo {
  Dio dio;
  ImplementationRepo(this.dio);
  @override
  Future<Either<ServerFailure, List<BookModel>>> fetchNewestBooks({
    required String categoryName,
  }) async {
    try {
      final data = await ApiServices(dio).get(
        endPoint: 'volumes?filter=free-ebooks&orderBy=newest&q=$categoryName',
      );

      List<BookModel> books = [];

      final items = data['items'];

      if (items != null) {
        for (var item in items) {
          try {
            books.add(BookModel.fromJson(item));
          } catch (e) {
            print('Error parsing book item: $e');
          }
        }
      }

      return Right(books);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<BookModel>>> fetchFeaturedBooks({
    required String categoryName,
  }) async {
    try {
      var data = await ApiServices(dio).get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=',
        categoryName: categoryName,
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
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

  @override
  Future<Either<ServerFailure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await ApiServices(dio).get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=',
        categoryName: category,
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
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
