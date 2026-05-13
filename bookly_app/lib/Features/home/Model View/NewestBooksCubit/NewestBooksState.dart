import 'package:bookly_app/Features/home/Model/book_model/item.dart';
import 'package:equatable/equatable.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object?> get props => [];
}

class NewestBooksInitial extends NewestBooksState {
  const NewestBooksInitial();
}

class NewestBooksLoading extends NewestBooksState {
  const NewestBooksLoading();
}

class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

  const NewestBooksFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class NewestBooksSuccess extends NewestBooksState {
  final List<Item> books;

  const NewestBooksSuccess(this.books);

  @override
  List<Object?> get props => [books];
}
