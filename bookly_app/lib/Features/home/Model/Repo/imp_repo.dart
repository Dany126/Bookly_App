import 'package:bookly_app/Core/utilities/api_services.dart';
import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Features/home/Model/Repo/repo.dart';
import 'package:bookly_app/Features/home/Model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ImplementationRepo implements Repo {
  @override
  Future<Either<ServerFailure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await ApiServices(
        Dio(),
      ).get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=all');
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
  Future<Either<ServerFailure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await ApiServices(
        Dio(),
      ).get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=all');
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
  Future<Either<ServerFailure, List<BookModel>>> fetchSearchBooks(
    String search,
  ) async {
    // TODO: implement fetchSearchBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    // TODO: implement fetchSimilarBooks
    throw UnimplementedError();
  }
}
