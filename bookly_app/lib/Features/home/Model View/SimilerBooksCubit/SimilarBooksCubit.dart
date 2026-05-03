import 'package:bookly_app/Features/home/Model%20View/SimilerBooksCubit/SimilarBooksState.dart';
import 'package:bookly_app/Features/home/Model/Repo/repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String categoryName}) async {
    emit(SimilarBooksLoading());

    final result = await homeRepo.fetchSimilarBooks(category: categoryName);

    result.fold(
      (failure) {
        emit(SimilarBooksFailure(failure)); // ✅ FIXED
      },
      (books) {
        emit(SimilarBooksSuccess(similarBooks: books));
      },
    );
  }
}
