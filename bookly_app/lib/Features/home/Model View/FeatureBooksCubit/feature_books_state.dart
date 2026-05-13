import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Features/home/Model/book_model/item.dart';
import 'package:equatable/equatable.dart';

abstract class FeatureBooksState extends Equatable {
  const FeatureBooksState();

  @override
  List<Object?> get props => [];
}

class FeatureBooksInitial extends FeatureBooksState {
  const FeatureBooksInitial();
}

class FeatureBooksLoading extends FeatureBooksState {
  const FeatureBooksLoading();
}

class FeatureBooksFailure extends FeatureBooksState {
  final Failure failure;
  const FeatureBooksFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}

class FeatureBooksSuccess extends FeatureBooksState {
  final List<Item> books;
  const FeatureBooksSuccess(this.books);

  @override
  List<Object?> get props => [books];
}
