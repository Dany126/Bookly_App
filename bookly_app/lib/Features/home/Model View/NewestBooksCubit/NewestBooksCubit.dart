import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/Features/home/Model/Repo/imp_repo.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.repo) : super(NewestBooksInitial());

  final HomeRepo repo;

  Future<void> fetchNewestBooks(String category) async {
    emit(NewestBooksLoading());

    final result = await repo.fetchNewestBooks(categoryName: category);

    result.fold(
      (failure) => emit(NewestBooksFailure(failure.message)),
      (books) => emit(NewestBooksSuccess(books)),
    );
  }
}
