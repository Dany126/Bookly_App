import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Features/home/Model/book_model/item.dart';
import 'package:equatable/equatable.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object?> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {
  const SimilarBooksInitial();
}

class SimilarBooksLoading extends SimilarBooksState {
  const SimilarBooksLoading();
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<Item> similarBooks;

  const SimilarBooksSuccess({required this.similarBooks});

  @override
  List<Object?> get props => [similarBooks];
}

class SimilarBooksFailure extends SimilarBooksState {
  final Failure failure;

  const SimilarBooksFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
