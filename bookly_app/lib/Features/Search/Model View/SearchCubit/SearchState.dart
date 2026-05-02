import 'package:bookly_app/Features/home/Model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  List<Object?> get props => throw UnimplementedError();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure(this.errorMessage);
}

// ignore: must_be_immutable
class SearchSuccess extends SearchState {
  List<BookModel> books;
  SearchSuccess(this.books);
}
