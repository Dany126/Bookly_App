import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Features/home/Model/book_model/item.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<Item> similarBooks;

  SimilarBooksSuccess({required this.similarBooks});
}

class SimilarBooksFailure extends SimilarBooksState {
  final Failure failure;

  SimilarBooksFailure(this.failure);
}
