import 'package:bookly_app/Features/home/Model%20View/SimilerBooksCubit/SimilarBooksState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/Features/home/Model/Repo/imp_repo.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.repo) : super(SimilarBooksInitial());

  final HomeRepo repo;

  String? _currentCategory;

  Future<void> fetchSimilarBooks(String category) async {
    if (_currentCategory == category && state is SimilarBooksSuccess) {
      return;
    }

    _currentCategory = category;

    emit(SimilarBooksLoading());

    final result = await repo.fetchSimilarBooks(category: category);

    result.fold(
      (failure) => emit(SimilarBooksFailure(failure)),
      (books) => emit(SimilarBooksSuccess(similarBooks: books)),
    );
  }
}
