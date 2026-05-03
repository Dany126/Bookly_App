import 'package:bookly_app/Core/error/failure.dart';

import 'package:bookly_app/Features/home/Model/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, List<Item>>> fetchNewestBooks({
    required String categoryName,
  });
  Future<Either<ServerFailure, List<Item>>> fetchFeaturedBooks({
    String categoryName = "all",
  });
  Future<Either<ServerFailure, List<Item>>> fetchSimilarBooks({
    required String category,
  });
}
