import 'package:bookly_app/Features/home/Model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeatureBooksState extends Equatable {
  const FeatureBooksState();

  @override
  List<Object?> get props => [];
}

class FeatureBooksInitial extends FeatureBooksState {}

class FeatureBooksLoading extends FeatureBooksState {}

class FeatureBooksFailure extends FeatureBooksState {
  final String errorMessage;
  const FeatureBooksFailure(this.errorMessage);
}

class FeatureBooksSuccess extends FeatureBooksState {
  final List<BookModel> books;
  const FeatureBooksSuccess(this.books);
}
