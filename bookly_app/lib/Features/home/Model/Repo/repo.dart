import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Features/home/Model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class Repo {
  Future<Either<ServerFailure, List<BookModel>>> fetchNewestBooks({
    required String categoryName,
  });
  Future<Either<ServerFailure, List<BookModel>>> fetchFeaturedBooks({
    required String categoryName,
  });
  Future<Either<ServerFailure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
}
