import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Features/home/Model/book_model/item.dart';
import 'package:equatable/equatable.dart';

abstract class FeatureBooksState extends Equatable {
  const FeatureBooksState();

  @override
  List<Object?> get props => [];
}

class FeatureBooksInitial extends FeatureBooksState {}

class FeatureBooksLoading extends FeatureBooksState {}

class FeatureBooksFailure extends FeatureBooksState {
  final Failure failure;
  const FeatureBooksFailure(this.failure);
}

class FeatureBooksSuccess extends FeatureBooksState {
  final List<Item> books;
  const FeatureBooksSuccess(this.books);
}
