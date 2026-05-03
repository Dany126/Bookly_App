import 'package:bookly_app/Features/home/Model/book_model/item.dart';
import 'package:equatable/equatable.dart';

abstract class NewestBooksState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;
  NewestBooksFailure(this.errorMessage);
}

// ignore: must_be_immutable
class NewestBooksSuccess extends NewestBooksState {
  List<Item> books;
  NewestBooksSuccess(this.books);
}
