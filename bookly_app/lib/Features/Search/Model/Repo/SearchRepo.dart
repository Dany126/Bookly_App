import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Features/home/Model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchAllBooks();
}
